Return-Path: <linux-arm-msm+bounces-89493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F753D38CE2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 07:36:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE37530208FE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 06:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09776318B94;
	Sat, 17 Jan 2026 06:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcDteEPV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LbPrs1lH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F5B3033C3
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 06:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768631762; cv=none; b=OgVf4oZzHdYcMC2rIGeMLOoF3jOnoh3xfrpEkm3EgCCdfj4AnH3BHXn2B7KwIE6r7bk+mOjsGhCFKKCDcH29JR1m0IUwZPcPoUGGm5qzXAJYFWgwx3nfmUO37UKi4P6GoV2q4lAPnh8TLgEjffcCupLWeoGEZ+vkMrvCNzPay90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768631762; c=relaxed/simple;
	bh=mEiXyz3E0C/8C/OEmdDzBTl/B0+VTZUOuLjDeTlkZ2I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PihO69f7fV6YnlYbT1vDhKkP1yxjNAPCWIWYU/EE7T/+hjH6zpQ/2IVUxQmipkK5B2AX++RXv7BDZw9I8j29Qddw0F8xQYRHUjj/i/4MvRWm1BGRYD98qsyRBdb7mFVeEY3cykJ2XIh4mxgw0H371QbpCDA3bW1suiXEm57nPks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcDteEPV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LbPrs1lH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60H3QOqR3465864
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 06:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1iSIAGNrGGkSorkUrHybP7
	sUtLOj4ZU5tkiLrYXIrCs=; b=mcDteEPVVjgYJNT2aGc7YtApBbfgWDpLQAB6Rw
	XXwWYOFSvCIzRuEap6TJJAFol/k6ZjgFrahqHHTCv8ZyISipLpLF9nlysRZzAOR1
	lLJjijBGlnUL/AbOu4RvUFygpkct9Cpdkv/wPV4d+t94gpTdkZ0te4tKq7yutPE0
	XK8fg86uLJJpIY09zuIDm7KpeCuBkO8+QMCzBUscmQdc4zKO1GXXP1cpsLfDUy4U
	5AHWfhXZsWX6fnoLQ0+vJJad2k9OdcugJ2a3OgXAKiwmzHR+1tVoPCmknqw+5DnX
	myvKazqA5qbGQwIQHOgjxuK4tjB8WyWtPXN1agENcvsvsPTQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2gugast-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 06:35:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52f89b415so679445385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 22:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768631759; x=1769236559; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1iSIAGNrGGkSorkUrHybP7sUtLOj4ZU5tkiLrYXIrCs=;
        b=LbPrs1lHI2A4BNFOazwMYbkWZOVm5cl9ivxCzmQQjhc64Ltr5jMUtk+HhmO7XVXlf2
         r/AXH4RlSHNK/PTaXAEXpBtqvVHaNk//FJ+T36QHMgfPstPrhYIEiFytou+UQZhQArxo
         /COaP9d35j/XeHM9rvA9v2E4Q80mBbgWTvXjEP7OAMP2iinQh57xUKZCRGzrcP7cwKeT
         FqM5Ifae910/TDYZyllJQPwssms2wOueHJdAhvCIz7rkLvejf5DIoGDd7RIOiSUsP7aa
         s8a5O6Wad/9UTUK3BreDjrBZlh3Ux6OsuEuZcPjBIdtdq4Q0CPd/nhC14b2kvTatfwfq
         kIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768631759; x=1769236559;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1iSIAGNrGGkSorkUrHybP7sUtLOj4ZU5tkiLrYXIrCs=;
        b=M7MtY/4Ba0eHWjptbauDVeCdvmPt/1chnIPfqfs39XAv8MJfN+t9SmcLu9sSMpq0Cn
         Afp8+sTILZvPEDoPKlBiNYtX+W8zFaO+rb9QmHL7IPjmiKgobiX5roQqov+sDYzw4X2r
         jWDroLP5ZD7DOm6Gd+2vJivN1ZrGD2smcudhgozLdqHyA3MhMFMD9P1xTdL52meEvjr2
         fdw9GmrV45oBd4sHB9w7BXq+DQQ6a/ZHl3IDqcX/5j4k7oSQ8jiiSnrP83uyKy/zvdHM
         aD+6tVYUh5d6pqxRKyfFRBPVEHG9MrHzGeBo/aYAEomJ+HzjXBpqSoD5cX31rLlLiXWl
         nwJA==
X-Gm-Message-State: AOJu0Yzn0AmXNEREp2JqxFhnQ7oEDAGx4vf3Qze/Ld96I+o1PPVwn1w/
	PCS+ug8m5b5SDLyyl9349dx+lkvnwoviYy/b+mR+gQdB4Zd5mfZHGGuok+8FgXQpkR44hevS281
	ptWawXVFH8S5nEc1wPIwOUmQACyWopxcpGmB4Ay/6gY41dDG3f31MzGZnhwK1axX3cWPd
X-Gm-Gg: AY/fxX7ZRPi/tYUjroceSiJRAxXhUSyfK4g7GalQv+l7tXT5TIQljALEyzSklVO0QIu
	b4cpjhs6NSGuKAnnTu7ACS/qDjVcrD+JtAJhyE2IhcSNhXIMHLcvhmR2FD7pAe64d6zHU61+LUh
	7IJo3GgyXuQUJczNF5WPR+CsubGeTvoyfRUH682yM6aAJ7bEwnQ1cKgI9/4ekvqrpxQFLQmOLyM
	JgH5WKTF0KZSOP7FzYaW0X7fQXiWJ01XstB/X2gVrngSD/LU05vgnPZTU/qeUK2jCq8nSCp8Df+
	4QEDw1mcoGCYqV4DUxP0osdbAz80IRDnP/XxDo47C3+LZ5IZrPSj+VbwALVKtun5gjSZIGNTqgO
	C1qrkTxMU+z8ibAzYwo/zhZlYlSPi5gLbmB6nV6U5l54Js66n9DWeaPOVVBuRwO4r2gPJrW/rFF
	9zlKTaUKasBYdshNFQhs7UnF0=
X-Received: by 2002:a05:620a:2d87:b0:8c6:a749:3361 with SMTP id af79cd13be357-8c6a74933a9mr457674885a.41.1768631759077;
        Fri, 16 Jan 2026 22:35:59 -0800 (PST)
X-Received: by 2002:a05:620a:2d87:b0:8c6:a749:3361 with SMTP id af79cd13be357-8c6a74933a9mr457673685a.41.1768631758615;
        Fri, 16 Jan 2026 22:35:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384e790fdsm14049851fa.23.2026.01.16.22.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 22:35:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/4] drm/msm: UBWC-related fixes
Date: Sat, 17 Jan 2026 08:35:53 +0200
Message-Id: <20260117-msm-ubwc-fixes-v1-0-d5c65ea552c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMota2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0Nz3dziXN3SpPJk3bTMitRiXWNTgzQz8xQLM4MUUyWgpoKiVLAEUE9
 0bG0tALqlUHpgAAAA
X-Change-ID: 20260117-msm-ubwc-fixes-350f67d860d5
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=817;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mEiXyz3E0C/8C/OEmdDzBTl/B0+VTZUOuLjDeTlkZ2I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpay3LCexxQWNuNf5Bwo1GfDaeKRFNST6mP+5MR
 RuA4akOZq6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWstywAKCRCLPIo+Aiko
 1VGtCACV+GM/f9mZ7H9m7cxSCTa6NmJCm/gSLkiqnweGDdE+neyRgWKCjhjGg0/wSNljRdubbPI
 LVhFYbnexBV0dQb0j0+ab8aay+/6qcdPUvj8xmiiF3BoWetIOuugdDgIR4YoMM5kP4CcDKmsGqp
 F1s3GsUih/4acrtTBsWd6wGX/GfsJ0PXzbc+K8ev+oDsNBB0KySX4I/sgx/WUaxeJ6a4ZGaVq3v
 9zHO+kaBfAtR2YvHYbmEqlA8oW0bG6FNh35+jsxeDzLIn7HBqTWKHfs72cBR3vLw3OjIS0ZJIuJ
 8Tvi8+i8Zxma2sD+5+DpkOUURJ0+KMfIcOrjjxexRhwR8HOa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDA1MiBTYWx0ZWRfX0j0Ln3bKWpbh
 Ywz6NIlflev9NtgqJxEVqh9xl47krjbwnI/RcgH8RK99VAeSHOgGkIFwZkzwISr6pvI5vQepvex
 9Q+cNRWcsVDR+8BYa4FVxpbKidSoKPjEPi7tI1u8h4Se9+o9e1ogRD8V2luObmJzbw/oefun+0F
 fZISxPi+EtayoYrQlhe4Gvpx+olc8HpJrdJ+Xf80QwdIhkOt53oCxBwsZJGLqRhBDMiwnpCi1gy
 aYwf127enXvSLos52LNd361xZ83NhDiMPKRc/W2UK7iexP0mFpEn6f5IrbVC0luC5NywvnsR9Mm
 rPiJeMo7pD2qz8np9NGPqXvZf/rR6Fc8YgjktIdmrBnBysADS7uUDbAQL6jTYjcxUzzjwLfZGRn
 D9ZQTaWEKw8yAc7WraeSYSv6trllJtfjRiLDgkKd2FR2e14DRICY2Tza5VL8Ems2HeCmH8mScur
 ns3UfCJwIBF/TvMRkwg==
X-Authority-Analysis: v=2.4 cv=Sev6t/Ru c=1 sm=1 tr=0 ts=696b2dcf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=4HV87y4NaVraivzdFb0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 4dL7l824UQ2RL3ApgJkK6Rb1h49ruDhj
X-Proofpoint-ORIG-GUID: 4dL7l824UQ2RL3ApgJkK6Rb1h49ruDhj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_09,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601170052

Fix several bugs, possibly causing image corruption when using UBWC with
the drm/msm driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (4):
      drm/msm/mdss: correct HBB programmed on UBWC 5.x and 6.x devices
      drm/msm/dpu: offset HBB values written to DPU by -13
      drm/msm/dpu: program correct register for UBWC config on DPU 8.x+
      drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming on UBWC 5.x+

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 55 +++++++++++++++++------------
 drivers/gpu/drm/msm/msm_mdss.c              |  2 +-
 2 files changed, 33 insertions(+), 24 deletions(-)
---
base-commit: b775e489bec70895b7ef6b66927886bbac79598f
change-id: 20260117-msm-ubwc-fixes-350f67d860d5

Best regards,
-- 
With best wishes
Dmitry


