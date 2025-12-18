Return-Path: <linux-arm-msm+bounces-85710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A484BCCC5CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 15:59:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 193FE30CBF5D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 14:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7180729A33E;
	Thu, 18 Dec 2025 14:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BGqp9xqV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R6ZB7uf3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D827B257448
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 14:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766068712; cv=none; b=r9j+gu9KeEKt7ZUKWODmgTI9E08G3alDCxBBTT9SxH5cv18FfJncMAEZ11CwN/bSe8CG/TJp8hdEv3zb/xtuiv50jrazQkOTR92u8N7RsrkJm5f+THvNFHXZRrnA0kDYCj9C4XWZCRhnAD8smUrLWw3h+EPllzgwRGZmu20C6yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766068712; c=relaxed/simple;
	bh=KGT0ib6f0S9x+W7J89kuc0HaNX2OlP5UrNenSreVEj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c2bfeDn06AbCfNrSTC3SlUpEfpFkf26yv8rDusuxsPlmLSokwNvXSRJibFXnTqLqjJzFuqaBefMfiUP6HFJRkAeE0/hC+vIdnC77ZVZcpSuxnIn1UodIvAOXIdySBmRHPidxJvO6lK8KblhjU9xzuO4N6cb02reBzr41llX1lUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BGqp9xqV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R6ZB7uf3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI8wXL5167607
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 14:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	arjhpi8+qGbxWhcL6W8JUcOjwqn6XDw6bd+kn0lzFcM=; b=BGqp9xqV4INw9bwg
	HrKPfFA1MBdG1N3ZpOE68KEHyMRHpYn4KiUV8Ei2EfFgP8w/rD345kaauinxeIx6
	/TUdZ9uK7XVo/WTBChFK5E+9nJNUrWo14Vj/MayUREogf7rC6YnhKWg7sbDr2fu7
	zVL5qsMQH+UJmPux6YVDq2RyzBKHbkN2KiCHP7nioUSOt6X5S4gQP2TPrRMg4YOx
	p8rD0WkcdAXvkNt33FE3igOtOLL/Hx9yxewzMvlXOKNbO8M0MG1nrW+r3EkWBAnS
	eS7CsBSlafmOB+XajdVQ/llaLv1FPNMDj2cu9L/k1ff45zbK/5RbC9VLp1wyOhvB
	OCFQQQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b45w52m00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 14:38:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6ceab125so15825071cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 06:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766068709; x=1766673509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arjhpi8+qGbxWhcL6W8JUcOjwqn6XDw6bd+kn0lzFcM=;
        b=R6ZB7uf3D5MQez9iWQslQZ2w+aSZvOyyD7OA3vTS45F+ZgqBmzF5QLdVQ/1/ujFBAQ
         x839QxaFepuh7rpmAHSAsPb2IugTDt2bMpyTA5eJuGYU9jAWca5HtE6ddiDhBRz0LTKX
         UpoIhM0ragG3jA+TgZ9iDeLTP4dhWwLPEGWVxBoMaJmGwVNrTmqeLNIqlj4OQw/WU2NV
         uIlC/UYu4JeVhgHNf+mrVdU6X7e7m7+LyXbfN2HF5oHCjghTOo3fq5S22T5YHQM9OusO
         4FwLo1/H7fSH/OfHHQYKaOFalaYedFa2SYGwX3BPxR78534GqqxGicyYo1DhNfH/vZVa
         a3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766068709; x=1766673509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=arjhpi8+qGbxWhcL6W8JUcOjwqn6XDw6bd+kn0lzFcM=;
        b=GKi4GaxNd13iyWC9fD/b20qvI2jvEoj52EMyppIqCCLqZjavS+tQUL3wh03VblhnP/
         USGVsd5IMVkt8vdkUERQ+STvar5UNomXv+gX9fCRtA5nDca2UqRlXDAD2CGewsbDS9HW
         KK0+SQbRRaQNvTyThnQBdatmSsIaogQMnaEbGA2wyaTBD0EtVOUkbzUz9GFMxHwyDYEi
         az99mFHbk6MwgElq1ug9d586W8QvCVXx1AOJ1V8lc4zjulSNvQ7wXH/nRv0tV4JyTCym
         /2T75UXnU+eda+RsncSpcJ0RgAoIZ7tI2jtJG02oEc9ynpH8mqd4djYfeSc+zntwA7Kq
         mtbA==
X-Gm-Message-State: AOJu0YyE37h5KUPVfPlI5TgwSW1hNpUUe+LuT2yiLITU8GR/NnLB1zWK
	MpXZd9ep92mkZCf427JpEprtZ6o+bNzSA/8A0TEyBjhXI0hyQqfKeAMZij8D9kmrDPuQ2CWr8zd
	etZHjt1wUyvip5O6R41ECOkQYJvU4o447YXyRpFiLnwgWk8qK8J4wxx5O3bBLWAXSLQfV
X-Gm-Gg: AY/fxX6UnYD1YSwzDEImzWeyV64LyAqU7qFezuWt2XOlyTy1z8ah4z/7JinLjRmaz7o
	40mY8sSQW2T5BAwXzkq39MxdWdEbNlNPLv4zY1Ah9xtvo5rNG3PCzLMeOvVraVV24Jqt0WEAnYA
	WTksmciAO+dsTqhdxVXQHVORgsE9z5zrJv8FyvsZt08sBSZWLPHiQS7tKTcltyR+wa1txghGq49
	6lCaPCHxNr3MaGXC3Jxo8coz4R0XcyPcpoc18EsCYUrSsbPJ6GDn3NbBG2Afvfg6zgu4vaYkGPE
	3qnn1LuXNJ21d56Xm2D9vyFolHKMfFTu7c9d9oO9IB3rWmeyxq0lschcvubDkbXS3wiy4vz4U5k
	eh7LIHPA+JJjM03lvFyExNCvjau5numnhxFoA8YkMWvK349rLqB3hRL8Of/31wdyLpjC8Lbhtwm
	fYjxgm6+ucjRYcXSsSyuzN9Ak=
X-Received: by 2002:a05:622a:14:b0:4ee:197a:e809 with SMTP id d75a77b69052e-4f1d061d706mr302052101cf.75.1766068708805;
        Thu, 18 Dec 2025 06:38:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcg8dFCAsyO9pwvmK9MJW2JZ06mgPgkK4l/4HdqBgJw3ymeSyRkcOvfkIParY+kVgr2ypNJw==
X-Received: by 2002:a05:622a:14:b0:4ee:197a:e809 with SMTP id d75a77b69052e-4f1d061d706mr302051581cf.75.1766068708240;
        Thu, 18 Dec 2025 06:38:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a132d3c3dsm1160214e87.33.2025.12.18.06.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 06:38:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 16:38:23 +0200
Subject: [PATCH v2 1/3] drm/msm/dpu: drop intr_start from DPU 3.x catalog
 files
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-mdp5-drop-dpu3-v2-1-11299f1999d2@oss.qualcomm.com>
References: <20251218-mdp5-drop-dpu3-v2-0-11299f1999d2@oss.qualcomm.com>
In-Reply-To: <20251218-mdp5-drop-dpu3-v2-0-11299f1999d2@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpRBHg8OfLvn0uQIXX6WQcuVNIO8Sro9H2Ob8kA
 s58zG7Nv0aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUQR4AAKCRCLPIo+Aiko
 1RufCACyAvrzOcUC+fY/wgdMyLVgKXHpxwFseR/uYdJ1oL9zzrT4Ku5hHF0Bg0HJ46DQm80VODm
 9cjGRdANAieLloTZbZjkxwQCqDLCzgKJmMRSRA/DtoGEIh85M3Q1tQ6E51xhyQga1yFB5Oj9zBm
 rNWmihuF/f+5hixnO2QwpRtW2Skq08PpBcBPpcMEPdKLZ4lMN8qTKwN1wBKvTX4qHRMCdHYjpv3
 tOom2izrH1HUjG76W+9cdQW8GIbe2UJqZ1c6rASXxIvvaZhzmBJGG7PgIgzj37KsWUsZ7cdRPpG
 Y+Lr3a9R3MsxSV0dkdy4BrYX1mlFse9q2fknJ/hTZlEq+by0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: qxPo2w6DZnTrVavIeaXOkS_FMLvAFgyz
X-Authority-Analysis: v=2.4 cv=eKceTXp1 c=1 sm=1 tr=0 ts=694411e5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-wdOMmJq3JXEukoY-DMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: qxPo2w6DZnTrVavIeaXOkS_FMLvAFgyz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEyMSBTYWx0ZWRfX0mHLvyxUk6S3
 bVSFJq5/+eP96TAzC6gqZELsoLittc710Pog+AXXWNRCRklA8dLDcy7jaiP60TcsepeNBu7Jeml
 sdzdx0yU1Mo+ZB5Ovs1Hf+lyWLZaTkuCAviwhNDDcWVYZeGxysOlcVXDJdXc3QO9PjLVAw8Rf8d
 UBepbJiQ4sM92GPvhSHRmbD5IVzX69W93woRRZlMBVQNaUm0Mx6D9WE8DniwLjqDmfDJK2d2DPk
 iMo4zBRXzRC/MLCx5ZKPEd2qVky0ViNtwVoZ/9uTt/4DsPfJcCns0BEbDYZpf2okG6een1P9BEo
 BPFkY6fo+gXD6QN2sOUTgGimxARh6p0tIGNXrcY3v/S4atGuNiDDzjxpdE6aY/Yow5P0MScxYvN
 5tFrhXYuelKkV3Q/6Q6WMJIbBKPmJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180121

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


