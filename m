Return-Path: <linux-arm-msm+bounces-89325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE9BD2D29B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 08:27:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E3343303B156
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 07:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 743DC345CAF;
	Fri, 16 Jan 2026 07:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cDKpF6UI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KjBFFzkr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A1832938A
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 07:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768548463; cv=none; b=Yq3zuWAphCMQzn4WMcKyTZD3/oI/TNb7WXsYCx6dUaSQqtUA7UH3t1qnnq5qHJSLdfnBAvxUEM9GIYECM2fUZLf2u7G2IUCF+JAxOBzZF60gIgokFRUzsBh+2VoIIXEQaU2F8sAa2KmQhIQxrHL2afRkxJhvm1ixytODut2KVqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768548463; c=relaxed/simple;
	bh=zc5bZgS5N9Mbgx60oLHQOfMAt62Z01sy/8DRrMk4RjY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uILhrtPTFXbQKmI0YROJUZL5qpvO/LMu5QsuV74akHg603WSAqea0azyeejrQ5Cq+KBa5n8fX1GRKYSuVCPTmWnIS7njXeM2C96tY3jdz6+0dHlffCMUC6Wza3gQN3MGo9SQi2LtFaOL5S0a882SJZ4MRnJ736ssfJA8rRo5ugM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cDKpF6UI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KjBFFzkr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMbJLS3714120
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 07:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=T0TMXQPqtA4+cBU8YRgxLA
	V4GrYtwj53rF4X6f/w0Fw=; b=cDKpF6UIGtOIC1uxr/epUYgZosWzU98ddK9MOc
	bZKXfOAZZrMXlBfkoLjVniWCq8u17U+Dcgy3gTDzHhZfqAVIZrSo7XGnhqDAiceM
	S+IbBiE3R+Z7w27hF9evOiEp1Dyl04wmZ08GBYAtaBP8kqMC39JSSu5lA1mLPaUz
	11UHd2RWwo1GLy21aX/IuF9lcdtvIPZeSlGtxPgaZ1AAU91oI8IsO5FBERN7M+3p
	VolyRTlqOJao/e7zFBT77xIGZXugpF7ql7VUj79pz/4pkP+AaLSeVZBPNjhM5eWT
	M0TfOqyJ0+JmZH//o9G8klUu6RU6xNa92qxQNewF9bl41LYw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96p97fe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 07:27:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c277fe676eso498472585a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 23:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768548460; x=1769153260; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T0TMXQPqtA4+cBU8YRgxLAV4GrYtwj53rF4X6f/w0Fw=;
        b=KjBFFzkrtDGOingZ7AH0zvgCztES77InMg4dqNQOuPssPIZEx2KwieXg+WgMveSDU3
         SbVP9XVJx2fx/fDKXQ0G69CgV3k1+a2JL4m5wbJHiQnXQDI8mh5Sy5TEuRUefKh8U+ZD
         jdKg+VhtUB7rJBJRC7ehXsi7hzGUrq0NosCUE5YqHR8BEkq5IcljQywfqQTdEEtongsq
         DJY/75cXiQERZM5AR3FUKAc64qQuWqBjENezIl3ssR1l8QzyiQRq5sBlXylkxbXEA07c
         GS66qRSLYrtLGyyAbw09SMLeqb0rANgzZlgapjpFmHLoHZBtkcwW8yQ0VG+4nld8q8RP
         JP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768548460; x=1769153260;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0TMXQPqtA4+cBU8YRgxLAV4GrYtwj53rF4X6f/w0Fw=;
        b=dBEah/gk8mz/Qq8bEGqqfz/NUGMZWDki/Jd5Sij2PFJmudwFbmrq4Dj7V9bonflO7y
         sV+g20lHJbRWd+JSz5TIXeGvnv8lyFEgV78RPAul3pk930JgRUsekOze7exG6ncttNZ+
         MizAhdpLYGp0ysG2nvkGG1T8g3GdbXM7POMmuccgGWAPLpKvrtksTofvUhmcM54QCHFd
         qnoxmVcg5BOb+9TEZ1KSFppeAFAI/2Om9N3ZPFQ5IdXkLaAO0IWVbYi16pg2c+dFjuNv
         j+SiAzoMMKxjc8hEX/gO0uXzG5AC/EPabwgr192JiFQRyUSW7MlFvNjxDhyEaHUHm/i+
         uTMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVe/gJICQ+1nVEcynJSreXhWKvGwFsFtBfPsdJRWqzwNxf/4YXNxEkMiToJxatLL2sKmps9+E83+tHPchPg@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4h2V5eVj8vpAX2vQggG45gXqO+BjTAOC8KQKzH05AZgRKkLJW
	I8QZPgt159J4kJDRPz00yIVHfVDf6nhQEdOVn0vQsD7DaUWE+6n9cnD9AuL4k3YejYwkBv4uCDt
	1zESQgljmP7rO0HMPSr34IHYs1OL83piPG7b85kYdagg45UjCmcX6h4X+RSqyEmb5x+s1V3Aef9
	vC
X-Gm-Gg: AY/fxX5dhbr1ItZ+BukfzjWy5lFTQbWhFHdQ6s+80goraWNP9HRx3p9XZljD5TlFqYk
	EeDicdtbv3k58egc3aXEz7pM/1BVk6mZd45rg08FzOr8hLEi1wuapCYnD1kbLv8PXpdJwYft02c
	ceVbB8lk7CGbavnFrAk0saZPxXioM2rQFXYL7lqRXqVwm+7+qwT7iVC2CmMP3dJUJ0uPvXzMpK5
	mQlSNYuF7C+psf1Q7IPSt/I3AmWj5SVl4l8fluieTLJ+et+zyQbM23a3RKxN3oKvDdV0rTgALkp
	YjLooqbJ78S+BF/MeMbJqeJZkof568UNGViFsnuAO8QHcowpypm+kJtoc2RKeXHpbUTHeeFH7Ch
	07ZZWNXBe7cx6tuDfxWpiBxoRDzXYcu1zZcsbZvscRBu2ptlqbYLFP9DyK4Bk5bIDRdxRwEAcWD
	XVZX1Je1HnK/gxT5EuHAjR/rI=
X-Received: by 2002:a05:620a:711a:b0:89f:9693:2522 with SMTP id af79cd13be357-8c6a677aacbmr301082685a.73.1768548460152;
        Thu, 15 Jan 2026 23:27:40 -0800 (PST)
X-Received: by 2002:a05:620a:711a:b0:89f:9693:2522 with SMTP id af79cd13be357-8c6a677aacbmr301080485a.73.1768548459734;
        Thu, 15 Jan 2026 23:27:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3976dbsm516941e87.66.2026.01.15.23.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 23:27:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/9] media: iris: migrate to using global UBWC config
Date: Fri, 16 Jan 2026 09:27:34 +0200
Message-Id: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGboaWkC/23Myw6CMBCF4VchXVvSW0pw5XsYF70hkwjVjlQN4
 d0trFiwmeSfnHwzwZAgIDlXM0khA0IcS8hTRVxvxnug4EsTwYRmnDMKCZBO9uMo051WzlrJTSB
 l/0yhg+9mXW+le8B3TL+Nznz9HimZU0a9b5hqlXe+sZeIWL8m83BxGOpyyIplsQfkHhAFUFJpo
 0PHGtMeAMuy/AFoQ79S6gAAAA==
X-Change-ID: 20260110-iris-ubwc-06f64cbb31ae
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2466;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zc5bZgS5N9Mbgx60oLHQOfMAt62Z01sy/8DRrMk4RjY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2bmi0zBzKOcdbfe/DY8ZtA7d9ri0gV6cT+3VMqzRiypa
 FSfqc/TyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJOLex/xVUOMzPrjLtVbeC
 9/bYBg8F16e/7gXs3XJM4YfyKunoXJH0+jyhLSKvpY6Z/DrTqiITXHjY1Wj95xP7k/4Kybxdbq9
 hUL1AWGiSXM36uS/eMEpWSZeb/t2cfo5X7PWacxLqazi5Zt8WjlKOmW6gIfeT6cpGY8MMbuvIXJ
 uFkw7e2Z10Zn+tpLHQU9M3nGVGgd0P9vukzbl1QOFz6ePMmgnX5pywPdK4gXVxLsf0M88CWQxis
 3NbKrY+XeJgb/j0mQHfYp0/W9bdiEtUbrn0yyY76Hz0+66HHsv4MgS5vdyfdy4P1b+XmGFzo3nO
 g1NXze5YntozS6HLryCTRfOAgU3ccg5xBwHT9YskZRyaAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1NyBTYWx0ZWRfXyj9WXKHrmaG2
 sq2InIpsWJjkTWFyhppmv1HCaB7IuWV2Ri+a5ezC+p+sznqRrUwfIr4O6/Gi39oSUwby4RSdEnh
 KMnDSV3k6wT5V3+45Y0FG4QOpu5raBYCPih2UusAaA3GUIDEcJ3owoCrkVnUinmy1Q8+IK7uEEU
 8NXD1o4nSzvOi1zbvb5ngEjeixDq/tQ3jzks5TgyMc1/dIVMzF3s8AX0HiIHRbI3yj5DLy6w4Wp
 fZLTjr2HqGjMZwkGv5IIZXZ8VlRCQtAsKFWaT4x2NT+QWUuMN6PoYDL30dJoKe08L8sEKspWJVa
 NKnRDIIAeT///JdXzVBeshLx1QSE9psegylIB5BRvUSPiGmsmdlxZcdX16wZ/4nLS9Wab4pf2x9
 o/zoxb/EeBhIBC7q9mfoSS8gJB8qauppNEkg/Uh5d+DnVyQ8SOo6mHmQIaQ2lcJI8MxzwCPz3Td
 CshOAWzFh3CevkkTrdQ==
X-Authority-Analysis: v=2.4 cv=M7ZA6iws c=1 sm=1 tr=0 ts=6969e86d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sotOLrqpNFqtnHaJl_IA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: N5c2nOw__vAozwoUHzjzsVLjYlzFDbwg
X-Proofpoint-ORIG-GUID: N5c2nOw__vAozwoUHzjzsVLjYlzFDbwg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160057

Having UBWC configuration in the driver is error prone. For example, the
driver specifies fixed values for HBB, while the actual value might
depend on the DDR type. Stop defining UBWC data in the iris driver and
use the global UBWC configuration registry.

Merge strategy: either merge SoC bits directly through the media tree
(with Bjorn's ack) or merge to the media tree through the immutable tag.
The drm patches will follow depending on the way the SoC patches are
merged.

Note: the patches are compile-tested only because of the lack of the
Gen2 hardware at hand.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Dropped applied and unrelated patches (they will be posted separately)
- Include printk.h, decoupling the series from fix picked up by Bjorn
- Introduced additional helpers to retrieve the data.
- Link to v2: https://lore.kernel.org/r/20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com

Changes in v2:
- Extended the commit message and added a comment for the min_acc length
  helper (Konrad)
- Link to v1: https://lore.kernel.org/r/20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com

---
Dmitry Baryshkov (9):
      soc: qcom: ubwc: add helper to get min_acc length
      soc: qcom: ubwc: add helpers to get programmable values
      media: iris: retrieve UBWC platform configuration
      media: iris: don't specify min_acc_length in the source code
      media: iris: don't specify highest_bank_bit in the source code
      media: iris: don't specify ubwc_swizzle in the source code
      media: iris: don't specify bank_spreading in the source code
      media: iris: don't specify max_channels in the source code
      media: iris: drop remnants of UBWC configuration

 drivers/media/platform/qcom/iris/Kconfig           |  1 +
 drivers/media/platform/qcom/iris/iris_core.h       |  4 ++++
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      | 18 ++++++++++------
 .../platform/qcom/iris/iris_platform_common.h      | 11 ----------
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 14 ------------
 drivers/media/platform/qcom/iris/iris_probe.c      |  5 +++++
 include/linux/soc/qcom/ubwc.h                      | 25 ++++++++++++++++++++++
 7 files changed, 46 insertions(+), 32 deletions(-)
---
base-commit: b775e489bec70895b7ef6b66927886bbac79598f
change-id: 20260110-iris-ubwc-06f64cbb31ae

Best regards,
-- 
With best wishes
Dmitry


