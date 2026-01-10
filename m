Return-Path: <linux-arm-msm+bounces-88363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71884D0DB71
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 20:38:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DCF1F3023507
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 19:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA61D27FB21;
	Sat, 10 Jan 2026 19:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q7k0IuTt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WY42a1Ne"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EBF12B93
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 19:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768073882; cv=none; b=hAUnfH9neJi2XryV3bOe0KAeVZ43rphqZH/R0J76c44ZKIb0t2QMxIDtwYtVfxc5wHYdLhdH8hbfW8r7jIB3vvH45v6kJjQIgxGnrQQhZWtMSOidiegH0tpb95SYTzBsmWFXT8rmCUBZfDqx3kg7O/oVtMVnTmbRMVSyHnqMcJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768073882; c=relaxed/simple;
	bh=WL3d3CbQkqsT5zxsu4BufhsTO/iq7v3zRTnxS5ulCyQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FNNdrridq7BTo8tBFe25CElrxLk8V6Z1Vh0R1RvkkHL4KOKFtBuWQEdLA8hdKNcQbumqXL5Jq8KtLbn5ljvFGSnsVzkFC/PDPZTBvjZXbI+m3DTlcpShnNR8H374pSX8um+QBKR+5r7yNH6h4IqOlooKaat4EKQnS7t/R1tE7gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q7k0IuTt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WY42a1Ne; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60A4dbVK543852
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 19:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Yuz5Lly3tjYhnq/oakT1C1
	zb0K36bzeIIake9asJ7G4=; b=Q7k0IuTt0bgs+1wxYDvIkBRI3uhXRA8Pnf+mMl
	kfjoas8A5lFet0DZ5Gdyq1fP+KTvc+znxbnqheYWYwLTbY166jzO8ByQg7SZW+CG
	z9njqtC87FI9/b57paRf78O9bSIsT0pBICirj2ImuF5szM2NWnw5m5js8Jh7zPSG
	piu8sNp92/XgtCOu26zMDwflIoyW/ZjckQzPU9t2g96M33pMzvJojbjc7ci3ystx
	7zQuenkCCUzDnNzW5kLEA9vL5mskEPasPNHkQ9EBrXPzuJslq9UgiMwNk8PrQStJ
	/cDQG0sdidsvbx8tNel8brs1TnEW+V0ScrkIAcECCKjixihQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfxfs3gd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 19:37:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2f0be2cf0so1287244485a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 11:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768073878; x=1768678678; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yuz5Lly3tjYhnq/oakT1C1zb0K36bzeIIake9asJ7G4=;
        b=WY42a1NeCLu+lYUfx0DZ4l+d6yMbiD7/HrRdngQCdC1eM+1aOdVf1e/KjAAFNet7dX
         8gd9KkaXeftyt75D+ryI4kzXqiNt4J3hO80FrkPGDQ7T2E3T/UtWM1Sn5lA2g2Z/4ln7
         QEoergX3EsXIcLbtRG3I3NingMD1wrYd2TmLohzkpJIowCmR5gF2P7XBlIL2AS4K4CJV
         babilF3x/GZlGQTrQnLkPA6ecpJE8v7/MkE3Gh2UZ8qW3JWCPyyyn5VhpIr9EEDvVi4+
         igRn42UXOSZMF2Sc++2C64nt30bV2un8eSAT6ZvczuM6UX8/s2b32a5NOp1w52RTRUgN
         U8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768073878; x=1768678678;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yuz5Lly3tjYhnq/oakT1C1zb0K36bzeIIake9asJ7G4=;
        b=a2etXJoD/JbXlhFZwUqReZYdHVYxuECKTdCbhvIJ+NnHHek6fw3k9BQ6nwHQwZpevP
         QC2gV7ZIOlQECFHs2jtFgHjqzyrmybWb4ToH90GJ8dezlcjAhmg2JzPjGFoiKu0Mw4xz
         TNuH3q8w8/9El4ZOtjHDhclpkyAxoXJrJtDMAOgEVKvb2rCIaLT/Wkjk/xG05ECGD6V3
         TID71v/8XBRHyfjCMT13vTtuGIb4fFPV6I/Oe9ZntTnGSrLsiSC1yFq8uO/gF7Cg3maW
         41BzfErjvXBm+fTmg0XPVYMLciPHg1AGeiN17Q5OBKtejv3Ow08eyCTEFziBZrXhX9B3
         kJDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmsXEGP76b49a/oMHhKgLwTBO1VATU9n3pgDp0+aMA7e8Aq6z32J4t6brfvb+MlfI/54njYn68sp4m1krI@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0AZkQFTKoyg6xpAPSPKqrDYUbEWbJyuwB4iuFk4wDooST3uiB
	pdxET4evqhT8Y2sqWAdNPLws7BL5F6vLERs7hPw70Lzdtl/6uuFLprltViwBCz6uNbneXXeUpEv
	+vzJkEIJQssg3yuQj5idoBqcHZl1lhrL8Cq3zpk3uFKafTGzP+LluyhMrIAIo4K/8LYui
X-Gm-Gg: AY/fxX4uMNfuPwN2LeaddYJwNtAbfytn8aL8nCPupj89J0d5K9cK4I6pDgiTSzyJ0DS
	pqTls695hyck29sMqFd0D0L66S2iFvDtO/iDm1U57WGbYMQrDxWxL/Z0egZrOY8MDQNiZhcm4j7
	Gq9YJXxHDu4uVM9gSDtf/j242Y8ZKAgzEOWURKfZwyEIxQRLMZ1qpaWX0YCeM1nv3zN/gBF/ZSC
	cVMiYeaSL6fE5L9VmaiZ+i3jcK4p6QR8/WwdTHIMMP4E3WQpQU9XhcxDc+Qa2hXDLb2ErRs+xap
	aaEjpnyb9HJ/3/NqfMPyafo4wcg0KuHol3qWh5w2IGGy1q3MlJfCyDUG1cF4rcEUYq0vVSC0xQH
	BCosXLzz9100hW4UsvhQnYLB7FWUwLDK5LbPzxuJwMYRftjqwZXw6WAHKrLkDrvVUA4URG5c2rp
	nPtRuKvB4szizU83QP6unZPVA=
X-Received: by 2002:a05:620a:2a14:b0:8b2:74e5:b11 with SMTP id af79cd13be357-8c389421d1emr1753486085a.82.1768073878432;
        Sat, 10 Jan 2026 11:37:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH//Jvdv/1iDO7XXudCXmktmxjLEGbaUM5VpCobiCP3qcmln8zrFrWKnWb1Z3o0q5G1d6WtXg==
X-Received: by 2002:a05:620a:2a14:b0:8b2:74e5:b11 with SMTP id af79cd13be357-8c389421d1emr1753482085a.82.1768073877982;
        Sat, 10 Jan 2026 11:37:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 11:37:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 00/11] media: iris: migrate to using global UBWC config
Date: Sat, 10 Jan 2026 21:37:52 +0200
Message-Id: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJCqYmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0MD3cyizGLd0qTyZF0DszQzk+SkJGPDxFQloPqCotS0zAqwWdGxtbU
 ADnX8sFsAAAA=
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
        linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2204;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WL3d3CbQkqsT5zxsu4BufhsTO/iq7v3zRTnxS5ulCyQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqSYXXJp+CINOgQyxIC8KNSqNqPLA1uV+wmA
 TBShj2YlOKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqkgAKCRCLPIo+Aiko
 1X6xCACQkrwtfDBCLgeJWHdhLUmz7ViXaWlVL0txKsubcrgrqF3essnxA5RKl4ftlpb07gWfkgD
 mxXSxRsuQlaa1gJ/QtpVHdwP4fFZmEZ68pQs/+3TrbYz3ifw9Jze5a3U4yqx3d3xxQgreC4++Gn
 X55d2kJq/5G3Ojqsm+cTR5V8JuWIcECgDWdy78/IkG5vTtUyePREAmTO3H3Hxpv7b0TMzpay6xW
 +NWN/n2lm2avE+UOZNsbuODMTNVWIRHyeMbKiHdQnpm5QzEyHnU/9HfHmNyPubK8hu2wt0FGxue
 bfOCrPiMS2X1QR38X0/pJYtbbi6Lu4Dtmecy3g06bBuaRaNb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: kaValyQmpPwr4XYTxT543n9KdoK85YiX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX7naBMs3Zd67b
 9jp/K87uv7B0ts/gtpIWLT4Qsg4S+jX51NQtQoWxT2n01pv70OK2gUfVUYiEGqzP9+gQopz8upZ
 UxsJlYQLFjEDX7HKmyopXd8vIMipofuxfufjRp2Xvzh6n0NGiPtTkGEoHlMRCyr4QTslSArScAc
 NjiUnbmOB25yy2PEx2fBYki651jw5I4tFagZ0mtRLSsaiCH7WRP2iBwrH7L04HY9dt9KXlnVPz9
 Ynsm9XpMa/wu9DOJME1KjZY8hjYteFmtJizTkMZVS3CIURNnhrIg1ICzCo9kt6K366djIkQBaDv
 o6tte/haLWvSohdW2d/xYLlLB92fvdvRqtDWNKxVmsp4hpfrFpsOyTc9hXjEeKcI4B9ykIsZZJ/
 Q6jrEKIp5GbAgt++spPS18mDt3EuozVYrrVbQq6ZiaIr6uh3wvz3VcYzvC3HGiDTeOZi8Lj3OTX
 mFTjtgCEr/QScGfaylw==
X-Authority-Analysis: v=2.4 cv=c7WmgB9l c=1 sm=1 tr=0 ts=6962aa97 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sotOLrqpNFqtnHaJl_IA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: kaValyQmpPwr4XYTxT543n9KdoK85YiX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100173

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
Dmitry Baryshkov (11):
      soc: qcom: ubwc: add missing include
      soc: qcom: ubwc: add helper to get min_acc length
      media: iris: retrieve UBWC platform configuration
      media: iris: don't specify min_acc_length in the source code
      media: iris: don't specify highest_bank_bit in the source code
      media: iris: don't specify ubwc_swizzle in the source code
      media: iris: don't specify bank_spreading in the source code
      media: iris: don't specify max_channels in the source code
      media: iris: drop remnants of UBWC configuration
      drm/msm/mdss: use new helper to set min_acc length
      drm/msm/a6xx: use new helper to set min_acc length

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c                   |  5 ++---
 drivers/gpu/drm/msm/msm_mdss.c                          |  6 ++----
 drivers/media/platform/qcom/iris/Kconfig                |  1 +
 drivers/media/platform/qcom/iris/iris_core.h            |  4 ++++
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 17 ++++++++++-------
 drivers/media/platform/qcom/iris/iris_platform_common.h | 11 -----------
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 14 --------------
 drivers/media/platform/qcom/iris/iris_probe.c           |  5 +++++
 include/linux/soc/qcom/ubwc.h                           |  8 ++++++++
 9 files changed, 32 insertions(+), 39 deletions(-)
---
base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
change-id: 20260110-iris-ubwc-06f64cbb31ae

Best regards,
-- 
With best wishes
Dmitry


