Return-Path: <linux-arm-msm+bounces-86707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0C3CE4917
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 05:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19365302AE0B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 04:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94C123185D;
	Sun, 28 Dec 2025 04:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Muz37/He";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e809wmOh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB92D23183B
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 04:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766894568; cv=none; b=RoWUxqAbSU5ye5LDOV95Dx2kYL22ePb1xmPWJVDP6i3DXuBcM/e1S06MK/R1xF8/u5KGfELyuY28VvQ6C5YTjqgkbw3+iQnUKu/facbuLSYv2IYzi1gQtE+Lq2R12buiNrM4rdoDlujSibA9TL9JZxEycSJ597fkA3HNnruHkh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766894568; c=relaxed/simple;
	bh=KGT0ib6f0S9x+W7J89kuc0HaNX2OlP5UrNenSreVEj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s/PLWldB+LPUtvuXScjDOk2YTyMEkHwSYEwcm2uFNtu4eIkmyNO2NAQiyv1XFChSXMBblrHw58QSeYWD6DJvuyhzI4pecGONw9evXKB0U8/7CpgD9ufU5nZN/Ljddemf2MnX2Hy4HjYZnzENeycQ9IuBbrlPM0wGJH8HaUi+ZfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Muz37/He; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e809wmOh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BS0xK7Q1879662
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 04:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	arjhpi8+qGbxWhcL6W8JUcOjwqn6XDw6bd+kn0lzFcM=; b=Muz37/Hej5t/bkPw
	VaS8uOKDyUTIDL7rtceX2OwSn6XhhJ6kNRdasFTr9dB7L86exxH8GJh/lLxReQ9b
	4prBZfExpufj3C7OP53ojUGaLMC5rB54RXY1p0UIRBIU9pKS8N15jCF81TiQqkC/
	cIEomWXGEzhxWqRtQKcH/juo1XEamUJh9D9tx/cmUHSfnNzSQf3qhKL5uIJ4gLif
	A9dA7nte3kTzI30V6i94AgShtCbn9vGEVIT732qFp8LisqG6LglPmHbQtx7KLNWU
	3WAMJcdWTbOVwwNwSfG6Jrxwj822W9g0M7GKBgPaUg6kZPqHwEq5m9YHChO71lIM
	exMXKg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6f61pwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 04:02:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed82af96faso172418811cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 20:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766894562; x=1767499362; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arjhpi8+qGbxWhcL6W8JUcOjwqn6XDw6bd+kn0lzFcM=;
        b=e809wmOh7/iiMA4Le2qjAzCTQOmYwgkpGL4yBLt+z7vyLF1TFXedj9R9o9aPdoiGn6
         pFCg+QZ4IqjiWqKqXeu7gXU9qG40rpiGseexGgFchbMv3J1z75bPk6VmkJ/ZguB3+K16
         oH9bJFlgVGAq3NEFwa4/LNy3+SAEijmrhsOx30m2xy9ouNnPG8YsdtrTUCN1xZTKCgqI
         PhoY1sslutEL2AeJmCan+/E8lsieMQc4lT4sMh9iNiNT7uOWtZx65n/ZmcCo/D45KioB
         WpT0KEIAA07SjUrMWn0RcBuS/ULL3GjYitghzc/yPF02To30BY500t98sknUWAmWNRcP
         ex0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766894562; x=1767499362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=arjhpi8+qGbxWhcL6W8JUcOjwqn6XDw6bd+kn0lzFcM=;
        b=IG1yFj8FhX8KXFxyrRwN59k7imDk52jwgqG8LXOkjHfc/YKjURqBS8atddgR72lR39
         TFHh4yUfRmhVpi+d4OO8w6chqaZZeG0Is4BZXze6XZCHzvs86rPnStgJzfp8yjZ4SqBg
         oXApnEhABaUcTsXJngWZaJ2w78y3glzqXmU8lHBePc02ZwNEohvUYS51DUf7mid35j9+
         HUertVQj5iqSL8oDPizS5P9e2Z0vvHo5AZMyqg2PpsSzk0QbsKRGcPEQtTlTzE5++EHf
         DSIpASyigGmibNOqp49DdSJ1V+HNwNGbLqp9p/6+qCfP9iISRfevsx3p43oLVzbQ7PvQ
         k+jA==
X-Gm-Message-State: AOJu0YxThrYA0y+xwHGXouuXXAKPPAtztoWuK9N89cUjTa6zXlwRBDyp
	IjeEMHkTPy4lJxrTYMrAYLtqhyhqXZS23nvl7CoMCnEC03R6rDE53HUC+ZuuxKSUWOGM1Mf3j0r
	kzhM/0lg+C9zGVHasyPVwNvkt8tDDl8ntPHKbdLoJcnXVna3Z6y9K8cpkdmVspivCou8i
X-Gm-Gg: AY/fxX6nfwCA5mYeHDzUUa/Fmcw1Twgf8zOTv30YD9PgxDU+i100CkojabNEzt5fubG
	u6cowFBd9GesSLx3tjvmDyo08b5tYQZ1x9wGfUp91LdHZHMD+DcLDeQQ2Vkfq7bVazV2+oIsRJf
	Djd9NaVTEShWbq603peC/ryB+iJhTeyYwTc9N1bkRSQFQpub86VdTC4yEhXixskxDjceDfIEk1Q
	qWe4dFePKTYzgBP45H+0M745o8g7YwoPysm5Z0igyC4RCcCR2bX3cssPcqMmZkrdrhai63UQRAX
	QBfvrCzrDpGuFNbP8VkmT0Zlwcc7dIChrmqwKX7ot8mFU/+nR3caS/XOeo7NypHSm9IQ34+Tyfm
	fOPpsgqjInwAxVhgv/jMUfxFaq3hxl7lkxhqmkQAG7MxDFmhkCYZZ1VJYrKPlnaM3ps+2Y4clVD
	JbwPuJWh7mBY/iLrGKdcz0WzU=
X-Received: by 2002:a05:622a:19a5:b0:4ed:aece:b331 with SMTP id d75a77b69052e-4f4abcef65bmr405971941cf.27.1766894562585;
        Sat, 27 Dec 2025 20:02:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjwlhdAkWEKQJLXeipUEE3TsK0r68DKPQO32dQw5IES/ATdDN83UnZEGSb7qmG18xos6ZFkg==
X-Received: by 2002:a05:622a:19a5:b0:4ed:aece:b331 with SMTP id d75a77b69052e-4f4abcef65bmr405971741cf.27.1766894562139;
        Sat, 27 Dec 2025 20:02:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5f07sm7840348e87.12.2025.12.27.20.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 20:02:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 06:02:27 +0200
Subject: [PATCH v4 1/3] drm/msm/dpu: drop intr_start from DPU 3.x catalog
 files
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-mdp5-drop-dpu3-v4-1-7497c3d39179@oss.qualcomm.com>
References: <20251228-mdp5-drop-dpu3-v4-0-7497c3d39179@oss.qualcomm.com>
In-Reply-To: <20251228-mdp5-drop-dpu3-v4-0-7497c3d39179@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3891;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KGT0ib6f0S9x+W7J89kuc0HaNX2OlP5UrNenSreVEj4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUKvbjejpcXIDufPZRcwKyaBy2RNUdXd4ttop2
 FP3OZLwRx2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVCr2wAKCRCLPIo+Aiko
 1QbXB/9B1mhe4T41K7aJyN0cYdhvDYqNU+LDp9NdJ/cExGkosJ7mVG3PE1Vi531K/aKKAqJwvVh
 UqWZlZwrQ1hYIWcatRCRn9VXlj5Me0azR99qyjvGEU3VGCMPYAkZrXsBDiHHNQYA9IYF8mp06jK
 nnCU3abw0xK+aZBmmaTh9mXBxE++Ppk2u/78WrSECtoQ9X2cOqD3sm7AuFN8LOFuszMg4n9akb1
 oRDU6W/CspOwKmUhmj7QXtQ899nKhORkYN99ZIwTt7TpYFvBRoku4DD7eqO66+87CG8k4CYUrcN
 f5W6flKFzieHKk0b1YXjzXtQ9tT6HppIQb2eIwTKMUaCI0sH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: CpSLe3WYto7h2iI6HkTC3Vr2312neJqN
X-Proofpoint-ORIG-GUID: CpSLe3WYto7h2iI6HkTC3Vr2312neJqN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDAzNSBTYWx0ZWRfXwh6cedLQk1ba
 GmrwxtBvzZJDd7Y3I1dlia09/r9oW5FS3SlzQm+eUADDvPj3a8GkTnOVq7L4b2xlYuImNd+6Gla
 Fuun7CwossJtTLzsQ5OAS9ArLjoPGDgGk47e6KmEL6y5CSlz01wD27SHYZDY5dOJQ/ahQKVflyq
 tcgzBpfNoscqoymcdfQhfKxoBwgdCRL+bJzh9Xpe3TC40ZZbo0DR5TIr/EI5B/fKYD/ATdBcuvC
 eQKwBYuDmn8mon9DGhFFSticmiFxtj4iY8juk+WiTzNpBkw0bL5nHLYtScfRDxKPuRwuNzvfLQN
 A2EqsEiOCW16eiBzO3KWvbyP9sPdKH7y/gh1rZbSTzI2KWx/zqSwAW/s3TZ3hsIkM6i2K27flIM
 upuuzek6s72bXeCeQlWRGV/3jrFD1ntfkNlClM8i7f1arqUTH8ndyly03HbWq9M9s0n4U6INVqq
 wewwb53XXrE18zSPDYw==
X-Authority-Analysis: v=2.4 cv=YuEChoYX c=1 sm=1 tr=0 ts=6950abe4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-wdOMmJq3JXEukoY-DMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_02,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512280035

DPU 3.x don't have separate intr_start interrupt, drop it from catalog
files.

Fixes: 94391a14fc27 ("drm/msm/dpu1: Add MSM8998 to hw catalog")
Fixes: 7204df5e7e68 ("drm/msm/dpu: add support for SDM660 and SDM630 platforms")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 5 -----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h  | 5 -----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h  | 5 -----
 3 files changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index f91220496082..b1b03d8b30fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -42,24 +42,19 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x94,
 		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x94,
 		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x1600, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x1800, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 8f9a097147c0..64df4e80ea43 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -37,24 +37,19 @@ static const struct dpu_ctl_cfg sdm660_ctl[] = {
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x94,
 		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x94,
 		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x1600, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x1800, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index 0ad18bd273ff..b409af899918 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -36,24 +36,19 @@ static const struct dpu_ctl_cfg sdm630_ctl[] = {
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x94,
 		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x94,
 		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x1600, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x1800, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
 

-- 
2.47.3


