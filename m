Return-Path: <linux-arm-msm+bounces-106220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sORNGKvm+2kZHwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 03:11:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D19264E1D7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 03:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1A68301F4AE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 01:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E44235358;
	Thu,  7 May 2026 01:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E1kFBEXI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PMo1S68H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D389D225403
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 01:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778116252; cv=none; b=dV3ZQeg7vgzK4ArxSlXNMt6if9p5Nkf27phzQAaghwAGv2ZOUKGGXTvXKWmEtCJvIoNhhJRosyLA4O7mSDqhMyF8NLVbys5lfWEk8LXlkY4dgzOY3F9QRbwAyTz5wS99xC2r3v1Q9QfMRhOwIAuu3HCCFGWwvFmWK683ab/a5Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778116252; c=relaxed/simple;
	bh=Zu3i5XCzu22KzE0q09L9XHJ+S3aEkjW+7l8kQ0vzT/0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iHZZVr3pFU/rNaet2lBMETd/JLHae0PmfhdVTUMHOZAB1CuWJFK/tIPlOH4EXlUaECgrKqgM9F2sGCg3owz3pLx0QrK9SQEeWj8jK/ye0IU10mLTwnExsJJlvnG4BhfDqut4x6tD6zBT5VDq2uZg8IUmJrteP2l98Fgn6cN1s1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E1kFBEXI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PMo1S68H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646Ji7RU1514830
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 01:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YjyMZ7Yja23dV1AwglOfBD
	khUZEse+Hk5apDcUojFv4=; b=E1kFBEXI5DTIvT45gV22HH4vUrwFc9Jw7Mq6Xn
	b2nxv15hoGR89MfVEDuulu7XefaTi0jkUl+Q7+RN1wceKBAwMB58A9pZIqbPUnBb
	8Bu80A4JUHls9Qa+oy3wkjf6UqRdM3IZRivn2CfvYtXPm1lH4v+5nDqeFlfv/JdG
	TsPtTf5lV96EJ2u5nvAJI9SC4yZWoqkE0lVu2p/4mPwP1ScgY4VmVtg8WqhJLcNJ
	8tQLZ/0WQ+1HRbIyeIpZf2hjQMrqwDCFmueIYOVDfXrfYaPG7hBg9XytwE/fu8hn
	703sln7+OTmA+qUUn5maYvCcPBjIt8V8vLFslwVVot3cDCXQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e00v1uug7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 01:10:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8b3fe2f190bso12652836d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 18:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778116248; x=1778721048; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YjyMZ7Yja23dV1AwglOfBDkhUZEse+Hk5apDcUojFv4=;
        b=PMo1S68HWdkYSVQTfVkqH7zhA4Z4pe3zFz/W37V15dJkXLQ8mZTS1RVrz66PzZNlub
         1MnQIcJakeLzzos/7WIVEbnPxVMIMvg64raIjlceBO3fuipVm3e28u9lYEtwdhhKXDU7
         eldEYYZTKISO7aQU6eVMZPePeJLc0+a/1A99bj2WngTmaFGa95T2UWVKYsRD3ks0L+eU
         ljYD2W/me5vqHCqWdhytocPtVCG30j3LN3eaGbN12/gXgU//qxWIpWWqcmslh0s43/PA
         6hV6oTEfuMWG0Tt106gmfhgDhdCKwwbyp36PaS7Qn27QEqVyeA657X4NReUQJ8zlLSUM
         NXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778116248; x=1778721048;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjyMZ7Yja23dV1AwglOfBDkhUZEse+Hk5apDcUojFv4=;
        b=QLQp2lh2mv1SZdksgDhlD6feorfGl5C3BVHF3tY/FcM8QyRHyR0dvIb1lb0U8Bgd7A
         gNZlHsMCDbq6qFI8HPt5qvrwsEpc0Fsra7CfYks4NEmbe1GNwS92L4BGtBSJ7Ot8V3vC
         9EoMwAzjbnTciQ+tFYFTezGL7CFfsAmp6DJuwXcTou9HICyrVK5ZwxWZ3yFWBaqqhLsO
         UkLzZPh5VMiPveFojKeyQWwgudQncXlTjaNClC9xilSU9MBhNFHNwICag0vze6Ro/CXy
         W0Av8MdPhHy383INOZXdDRS1NJJTpqN9vjMoxPQj1k3cp7lo2i/WutNvjYFN2nZJrj3X
         hQYA==
X-Forwarded-Encrypted: i=1; AFNElJ/n6rWNk/i9qdNx9zgJSjgHjEeZFlZW3sUE+HuJ2p3wdYOwauLdPpvpkbMa03HnzaK1mH8bUB15ibo7oVuE@vger.kernel.org
X-Gm-Message-State: AOJu0YyDii53mK6WfwGmyuNczuy/C38iAkynOQnCSrD/Up30ggYejE4n
	9QdjJKaNqpfnIdwQvv3gyw180ctsliYirCISw5X8JH/TKxFQ/7JEp8UZAyEBCVlhDqrDllVZrNU
	3aezNW+Hms6x0/gDOOA3JGXJq+ZUUOA5gCzZZv6XHD3ADK2wMSfe8e9+SMTXKoSKOiNtB
X-Gm-Gg: AeBDiesZLGyK/XbEM5oG+p/U7IsQAzQvVC0iU1jzXv1I3PgdhyaLSM6Ukbv5Tj0z5fv
	u4JI4ZvpNiiCpeVhwWjKPZ7wybiaSOP7dqMKuStKsiyv+vyeU8/nS/37eIaq/91/V1DvwuzWs8z
	xb4GfDq9Zb7G41CzjJm/Xdzxxfvxjbg9hCJvhhrEm1zUjtWFTLDvXEsaM8n9pROKenEKO9sSe9Y
	XtzHNLKsd2D+Qiw6Al8CkJxFzpozyHncD3pvPS4h9FPyx7+6abnvXj7I48Q5/szBGymmcVKrWEt
	y6WfoGMZqo75N+XL8QOw1HrhSvdgmtfu0c63rQR4WL0u8jvun9QyVEO6tNDwBUXDFeD3I2KK4LA
	EtJXibPa8EjPOiYtUpg39gJF/gkdUE5MarIorFb7Bu822jf8fdYLpcanrM2vJt2dNz4rHfVd5W7
	AlPHOuOEylHuNCQ0UzNuTmXJjbOM99YZVuFwshB6zTFero8Q==
X-Received: by 2002:a05:622a:8c6:b0:50e:a1ab:67eb with SMTP id d75a77b69052e-51461fcea84mr84081241cf.33.1778116248188;
        Wed, 06 May 2026 18:10:48 -0700 (PDT)
X-Received: by 2002:a05:622a:8c6:b0:50e:a1ab:67eb with SMTP id d75a77b69052e-51461fcea84mr84080781cf.33.1778116247678;
        Wed, 06 May 2026 18:10:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230e00sm5221967e87.29.2026.05.06.18.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 18:10:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 0/7] media: iris: migrate to using global UBWC config
Date: Thu, 07 May 2026 04:10:39 +0300
Message-Id: <20260507-iris-ubwc-v5-0-e9a3aee53c49@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI/m+2kC/3XMTQ7CIBCG4asY1tIMMJ2qK+9hXFB+lMS2Clo1p
 neXdsVCN5O8ky/PhyUXg0tst/qw6MaQwtDnqNcrZs66PzkebG4mQRIIATzEkPijfRoO5AlN2yq
 hHcv7a3Q+vBbrcMx9Duk+xPdCj2L+/lJGwYFb2wBu0RrbtPshper20BczdF2VD5uxUZaAKgGZA
 VRImpyHRm//AKoEqARUBoikNuCgIeH/AFgAsi4BzIDwXgEharMRP4Bpmr7n3RFFbAEAAA==
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2622;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Zu3i5XCzu22KzE0q09L9XHJ+S3aEkjW+7l8kQ0vzT/0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp++aTnu2eCICOVVoAmz62ya+oolHsK0dcWPaJ2
 8gni7kUvf6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafvmkwAKCRCLPIo+Aiko
 1eX4B/4tVdJsgGK3o2w5P4j5x6+2Kg6TcQcmK1nq1jUX4fwKu4oE1vlDg+JGaFomh9GO08hWHRW
 NqkUrE7L+ILAq7ZLaG6ShZgBc7ga7KHabJ6m0di448W/MkCP02675VQdUnf/Mr+K3VOrKV9NFDy
 89LQ7MCzxWo3BR/gwomGRdyOH3Qn6hSkEksrJIg7+CR/We8Ed7l5maoarM+ZFHcAQFcp6suFM5l
 cmB2XJ+n0dLVCAvWHMlGYpH+Qn5oSdv7YMcgHmEktRfXRn6yZZXLBlfz3T0F/9u7bmMfU4/Ujzr
 PphtJM8CJjn2zvuXOFmDGuV0ms2+05hNYnLJBZY/cGQeR2Ou
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: cvIWwcJDCvM3o8Km-ta2lAk6k8GhXvR7
X-Proofpoint-GUID: cvIWwcJDCvM3o8Km-ta2lAk6k8GhXvR7
X-Authority-Analysis: v=2.4 cv=cKXQdFeN c=1 sm=1 tr=0 ts=69fbe699 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=sotOLrqpNFqtnHaJl_IA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDAwOSBTYWx0ZWRfX7OEUFkINHSx1
 MSL5qy4+D8LUsa/lq4SJmVaIcSGv/EYUUf5UvKCA2f0E5TWJyhqccUbQSMXHKps0/gGmShYrQzt
 tDsc/qkkiIZsTxkcsBDDaHymrSmmPbfgfrs2nNUhEurUVxk9b1lgDqwlXXoxKIgXqOYNkrDOi01
 oDWjO2y+GrOUel43dLF5FaVVMLdfL7IHTGtpuYhcT9yM6YVBcrPzP22ggH0QWh4rfzG681yE4qy
 X+wiUdEOZENLKKDFYbCUS637QfDRggnvVj8ZMxRJvT/LTOyfgpmPMd+TW4+CujF5TukYKHKNyOn
 m7YgtqxFATdBdl9iWv3P7dQkZYB7vYsP/lyalUDCo5HeK1Zj0Wlw3ij9JX7E5OnJyiAlPluW1v9
 TGo9LqKeKQQ6n360MQ4E+au6DcA8PVpj7+B0PwE6mgAPJDv+8gEFcl5sgZm6ThvtEiLN5yOOSx5
 DblFEVJjgd6Kn96mujA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070009
X-Rspamd-Queue-Id: D19264E1D7A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106220-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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
Changes in v5:
- Rebased on next/master, dropping applied patches
- Link to v4: https://lore.kernel.org/r/20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com

Changes in v4:
- Rebased on next/master, fixing the conflicts.
- Link to v3: https://lore.kernel.org/r/20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com

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
Dmitry Baryshkov (7):
      media: iris: retrieve UBWC platform configuration
      media: iris: don't specify min_acc_length in the source code
      media: iris: don't specify highest_bank_bit in the source code
      media: iris: don't specify ubwc_swizzle in the source code
      media: iris: don't specify bank_spreading in the source code
      media: iris: don't specify max_channels in the source code
      media: iris: drop remnants of UBWC configuration

 drivers/media/platform/qcom/iris/Kconfig               |  1 +
 drivers/media/platform/qcom/iris/iris_core.h           |  4 ++++
 .../media/platform/qcom/iris/iris_hfi_gen2_packet.c    | 18 +++++++++++-------
 .../media/platform/qcom/iris/iris_platform_common.h    | 11 -----------
 drivers/media/platform/qcom/iris/iris_platform_gen2.c  | 14 --------------
 drivers/media/platform/qcom/iris/iris_probe.c          |  5 +++++
 6 files changed, 21 insertions(+), 32 deletions(-)
---
base-commit: bee6ea30c48788e18348309f891ed8afbf7702ac
change-id: 20260110-iris-ubwc-06f64cbb31ae

Best regards,
--  
With best wishes
Dmitry


