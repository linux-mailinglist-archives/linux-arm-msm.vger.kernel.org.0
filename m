Return-Path: <linux-arm-msm+bounces-88432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E78A6D106F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 04:12:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93B78307C4D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 03:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740653074A1;
	Mon, 12 Jan 2026 03:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BYYDZ50p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZyVaNRqR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82C1308F28
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768187508; cv=none; b=jxBZK2q8lo6LUEUPsaZarwCduXZzE1rgc9uaqMyimj5BWWQPiEvm+tZNXmKnpWprqR4eBXdvfAI4OKpqNTXceCr2GSQBSZSUcrqGJYP8rDqHRJYyf/mQpdXacWpKYwkma85rgAr+eHwszNv8fF1A+Junb7ENrQWk1+1Al6PwD8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768187508; c=relaxed/simple;
	bh=f0IcK+uitlTfyeJrFUEz4Vqgu8lk8UXoQy0b6rzmAKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kunazp1tgyitQw+gbzxTix+64nqBzCqakA59xoM1sC1Qj94igzzizY/g5mepi7bDlklYKY3DzYkkFUnHxVunj7vYcr0p4CdHjG6KpE8GhS/hq0L35rAaTHB8EUXLRrYEEe60cqHTw6rM+elCanYUcP9pxVXV0rRRUexrEhtvoSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BYYDZ50p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZyVaNRqR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C2NoVO113367
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SMZ7Iu9/ClBHG50He5BgPV5hNwYWu69ArfAKOu74zkc=; b=BYYDZ50pi/cIuXzo
	jdPcFwF48g76v0ns0XtyrYRh0tb4CHxjPeeTWrJE8cxbIGdr05643zWpEaydxRLa
	krZiueTB0iPXupKXlMfAzPeWZrFJArhzi1as7/kft0s5/bKjImdshyX3uOFdJbq/
	vM8BqcSwh/gL8Tf+kUIdyEF5RtTuvyRIKYM7/ypThlqUV/IPFYojEvmoTTkD1f6r
	nbMtcarLSIfCKZsYsee70ABEfpQST6TtLW4DjIX4ofJ4ZsV1uOZzvai0Kpc+u/wY
	saePXlAcsvTVQIIZ/n5DHNUL4KPul4so4oHMhYuO5emxBMnl4jHKz2iipcmmpxj7
	jldTGg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmr4ug3pa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:11:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b9ff555d2dso1694256385a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 19:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768187503; x=1768792303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SMZ7Iu9/ClBHG50He5BgPV5hNwYWu69ArfAKOu74zkc=;
        b=ZyVaNRqRPbFZDu3MeXJsUFdOQ2zjz5X1j/afuRlFEJGvFLR7r5fErPkhqCbd2+y83e
         Bu3dBT9cBpaCoLvcyXVV/00Wj39ejMlGvdr3zG8DLRvsYbwfpxQwFBTRx49lRSOQrnKj
         E9w5r9gyEQANRzmaJfc98kpXyChbOS3CX9Mc6qPerCP36PRJqEIHICP/MyOL9AfTiQ0W
         gVYuVpS2O2gMDoIRlQ3s13UpCM4hCLH2LwVkvnUv9H0iu+K0ca8nHvZpi1jqF4NJ4jZz
         H1BPbIhGfDYh9GguIwxGyvwt2vYssi4/n027pFBZiGTQbRlIDX+Efg8PKxy9Sx9AHwjQ
         Ricw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768187503; x=1768792303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SMZ7Iu9/ClBHG50He5BgPV5hNwYWu69ArfAKOu74zkc=;
        b=Pwvsf5XNuBPOPdulxYIekxG6fkxvX/WAcjEluzb2UeZb6LyBNqIFsnu306Q7RkU4Ct
         pVe3NTXLHCynZcW6wYFMHCY1Nvu9xSI/UAIpl4j4fMA5n08+W29ndTYwAfYnGL/8s+XD
         z+ToDiDCRZGwlngApd61ioYJ7OMuVzerp2r6Wh9AGGeEKgtMjb4j94I0Z1xIrIugNDhJ
         QIZ6Y0D/EWfgNu7busIuU8/hoW6kIgFO8UmWvlSEhzlLCYkbgeDcOanq79HkN574SIUA
         qSNGxR8ffnWJk3js1PYp6ndn9UnKtgaHByKUV2UbGk1WO3UKhbII/huKJpNaH4EN7lFS
         dJsQ==
X-Gm-Message-State: AOJu0YwCn3Wi5qTkUV/TZgeny5L/7+jUFGTe6P5LSPsLsOyE7mmLXgN6
	kCmdRgxuDZC71XcK5XtbpMXPE7DARd5fUQlUW4aQEsCVfh+6GpoA8f6hSUtFZWhCj9rN6GF//dE
	VNiTXCiKvpg76TrHMgVL9b5UHU60dpudtXI0CDQA9n77QHqWhEv9t/blL2hckDZRJhBtI
X-Gm-Gg: AY/fxX4Pv77FKbEGx2uBA0FeN+s3BRVZ9U1SagbO9SYbZ8UDgGio2nRUTA8CuB8DYTp
	1ocwziOg+ATdwnGqEpBedj44wL5crsii9q8mkyyKES83xSBbg57g9Oy9Juajrkb5dc27T1ziDbD
	rWBaf/N79H1qj3nzy8XwIvR5mDcw2dLMPF34RGUOmjEYBl0XEymcvKVcPEQFTTET4cOJ9ymogAF
	ngteLHhDG5YQZoGX0akeVhZcPebYMraoIIsIEtsJbKUozzUhMRc5J6mJQLx9LmtlmYDRDLDFPfG
	5LhcyPD5yCcl7jGPyc2++57T9k4SsNUN6dnKMrdEB/Vvv7C25uFKs5awD78O99iQsuoOWSqJ1kP
	gtnUzFZXYAeuaXcfFIwLQ8tykn6PKSsxqk+zBwhx1WrFZTvRXZjMq6m2NevM/cHbHe2g/wNWNe/
	b/LLPu/fIyHNmQUd1TxZMX7/s=
X-Received: by 2002:a05:620a:3714:b0:8a1:426a:2cca with SMTP id af79cd13be357-8c3893dd3f9mr2297038085a.41.1768187502532;
        Sun, 11 Jan 2026 19:11:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZlCZ55KSEfgo3DonvQKshjkirRC4BG8OKPHXr7tR1qmEJlecfCFxV41+QRvOGgoIo+Tibxw==
X-Received: by 2002:a05:620a:3714:b0:8a1:426a:2cca with SMTP id af79cd13be357-8c3893dd3f9mr2297035785a.41.1768187501976;
        Sun, 11 Jan 2026 19:11:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b792cf330sm2758871e87.102.2026.01.11.19.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 19:11:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 05:11:31 +0200
Subject: [PATCH v3 3/3] drm/msm/dpu: remove max_mixer_width from catalog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-max-mixer-width-v3-3-f98063ea21f5@oss.qualcomm.com>
References: <20260112-max-mixer-width-v3-0-f98063ea21f5@oss.qualcomm.com>
In-Reply-To: <20260112-max-mixer-width-v3-0-f98063ea21f5@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=19211;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=OeIeX85m68KtKpaL4CxfY88JJs2W1shJKLbOI0vfmPo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZGZjMMaIjKXPKvc1XHS1pulHpq31TrGuPxNCW
 2eI+YwwaEiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWRmYwAKCRCLPIo+Aiko
 1SAeB/4kF0tZOVzq1CgHJtcBno5YSpf8Gx3uDQa4t8w7Bo2a8WHb0P7niAKTI2mZMnocfHyB5J2
 h//O5OICEEwR6oEgm3RhxVVwBmbgB2tZcpmaf2q/GUYBIbgelyqRoq2KOVgULH2DvvphkFHQdeh
 qpKd1e/9/okApma+F05oABLLYCn7qj6kpDf+uxkuUebkestxwY4eTXrhSJfzlUSABg/OMj81iii
 StYAHc4Hy6Xzvb5LnJbRxfO+G4ryEFg+bx8LqpcY8lENw8w2VfIVvgMiRJMia98ZlVptmxMgW6T
 g4CgSbW/O+PR3mSFmRdEvL9AGa5a0JW1J7v7n8yR2Y1hkwUJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAyNCBTYWx0ZWRfXyV3wNz8F5809
 LRmSUWpn2pbugFXXB4YMY8XQ9iTFzFJmbwEllyUnbtzbY46THKQez1T35gX8osRf0YktPa1K/qf
 Me+zRwieu03y2boctkbJUas45IVJ9BIQhrTk+b7LIfBYLpWNrF/r2xawm9Z5hvKBf0A74VqGe5V
 beAO5KufL/llKJREylJbiR76bGCardSV+wz+1OmR0Zp23QcD+xicoHeuyoHBEhnSELELhOullH0
 3lPKsHB8iPOMO5KDGA3qNo3BXkSWx6IQD6Pt8vTE/jsGIOrZUPnplqMAWeXEVhNOuuN6SdLufUd
 L1j7HLj2bBiXauB4o1zJjW0sQjlsqUGmpc9Gc0X6q7U3/cPnDHtyDB44w9ICl+kAg2pYYW69Iix
 ZLf4+1XEn97kRsRgFnlkXxTXc00cJx2yi2E5ndDrPaHBJI9QCiFMG9dhD+6LLup8IeCr0YF45Kh
 O6ZKoz2wpm9/Q6zW1Pw==
X-Proofpoint-ORIG-GUID: VkPUuPuZaj6LsN5dEwiSDNjJqXLuPgq0
X-Authority-Analysis: v=2.4 cv=YocChoYX c=1 sm=1 tr=0 ts=6964666f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=XwF-NPJyeaUn0DJ09rAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: VkPUuPuZaj6LsN5dEwiSDNjJqXLuPgq0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120024

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Remove the now-unused max_mixer_width field from the HW catalog. It
doesn't represent an actual hardware constraint.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 2 --
 31 files changed, 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 56d3c38c8778..18866ca279df 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -8,7 +8,6 @@
 #define _DPU_10_0_SM8650_H
 
 static const struct dpu_caps sm8650_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
index db8cc2d0112c..13cc84b28058 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
@@ -9,7 +9,6 @@
 #define _DPU_12_0_SM8750_H
 
 static const struct dpu_caps sm8750_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h
index 13bb43ba67d3..59a4859ce67a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h
@@ -7,7 +7,6 @@
 #define _DPU_12_2_GLYMUR_H
 
 static const struct dpu_caps glymur_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
index 29e0eba91930..c6923e0093cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
@@ -7,7 +7,6 @@
 #define _DPU_1_14_MSM8937_H
 
 static const struct dpu_caps msm8937_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.max_linewidth = DEFAULT_DPU_LINE_WIDTH,
 	.pixel_ram_size = 40 * 1024,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
index cb1ee4b63f9f..14d0619c1479 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
@@ -7,7 +7,6 @@
 #define _DPU_1_14_MSM8917_H
 
 static const struct dpu_caps msm8917_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.max_linewidth = DEFAULT_DPU_LINE_WIDTH,
 	.pixel_ram_size = 16 * 1024,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
index b44d02b48418..17f6d1ee90aa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
@@ -7,7 +7,6 @@
 #define _DPU_1_16_MSM8953_H
 
 static const struct dpu_caps msm8953_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.max_linewidth = DEFAULT_DPU_LINE_WIDTH,
 	.pixel_ram_size = 40 * 1024,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 8af63db315b4..1885ea92a808 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -9,7 +9,6 @@
 #define _DPU_1_7_MSM8996_H
 
 static const struct dpu_caps msm8996_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.has_src_split = true,
 	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index f91220496082..3fafb10661cf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -8,7 +8,6 @@
 #define _DPU_3_0_MSM8998_H
 
 static const struct dpu_caps msm8998_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 8f9a097147c0..b2bd87f4af43 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -7,7 +7,6 @@
 #define _DPU_3_2_SDM660_H
 
 static const struct dpu_caps sdm660_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index 0ad18bd273ff..e4304ace8eb9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -7,7 +7,6 @@
 #define _DPU_3_3_SDM630_H
 
 static const struct dpu_caps sdm630_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 5cc9f55d542b..ee3b78ce6bd1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -8,7 +8,6 @@
 #define _DPU_4_0_SDM845_H
 
 static const struct dpu_caps sdm845_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index ae1b2ed96e9f..02621def12b2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -8,7 +8,6 @@
 #define _DPU_5_0_SM8150_H
 
 static const struct dpu_caps sm8150_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index b572cfa7ed35..04afc22d9fad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -8,7 +8,6 @@
 #define _DPU_5_1_SC8180X_H
 
 static const struct dpu_caps sc8180x_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index a56c288ac10c..371fcb7f7bef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -8,7 +8,6 @@
 #define _DPU_5_2_SM7150_H
 
 static const struct dpu_caps sm7150_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index 26883f6b66b3..a5a3944a5601 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -7,7 +7,6 @@
 #define _DPU_5_3_SM6150_H
 
 static const struct dpu_caps sm6150_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x9,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index fbf50f279e66..42d6d1a6cce4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -9,7 +9,6 @@
 #define _DPU_5_4_SM6125_H
 
 static const struct dpu_caps sm6125_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x6,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 7b8b7a1c2d76..d39ca9b287d4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -8,7 +8,6 @@
 #define _DPU_6_0_SM8250_H
 
 static const struct dpu_caps sm8250_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index c990ba3b5db0..afe83f5e4349 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -8,7 +8,6 @@
 #define _DPU_6_2_SC7180_H
 
 static const struct dpu_caps sc7180_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x9,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 343ff5482382..90d696707227 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -8,7 +8,6 @@
 #define _DPU_6_3_SM6115_H
 
 static const struct dpu_caps sm6115_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 093d16bdc450..d7a94b7c69f1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -9,7 +9,6 @@
 #define _DPU_6_4_SM6350_H
 
 static const struct dpu_caps sm6350_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 47053bf9b0a2..fadbfd4f9f95 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -8,7 +8,6 @@
 #define _DPU_6_5_QCM2290_H
 
 static const struct dpu_caps qcm2290_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index 98190ee7ec7a..9427ec024d60 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -9,7 +9,6 @@
 #define _DPU_6_9_SM6375_H
 
 static const struct dpu_caps sm6375_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 85aae40c210f..5fe2673fa8d3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -8,7 +8,6 @@
 #define _DPU_7_0_SM8350_H
 
 static const struct dpu_caps sm8350_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 2f8688224f34..223ba5b0e8b3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -8,7 +8,6 @@
 #define _DPU_7_2_SC7280_H
 
 static const struct dpu_caps sc7280_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 303d33dc7783..37a539a195df 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -8,7 +8,6 @@
 #define _DPU_8_0_SC8280XP_H
 
 static const struct dpu_caps sc8280xp_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 11,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index b09a6af4c474..bda58b5c48df 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -8,7 +8,6 @@
 #define _DPU_8_1_SM8450_H
 
 static const struct dpu_caps sm8450_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 0f7b4a224e4c..c5affbb42ecb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -7,7 +7,6 @@
 #define _DPU_8_4_SA8775P_H
 
 static const struct dpu_caps sa8775p_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 465b6460f875..a34d85a82e99 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -8,7 +8,6 @@
 #define _DPU_9_0_SM8550_H
 
 static const struct dpu_caps sm8550_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
index 6caa7d40f368..21e40f098d6e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
@@ -8,7 +8,6 @@
 #define _DPU_9_1_SAR2130P_H
 
 static const struct dpu_caps sar2130p_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 7243eebb85f3..6906fb060c19 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -7,7 +7,6 @@
 #define _DPU_9_2_X1E80100_H
 
 static const struct dpu_caps x1e80100_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 3d979e856b7c..c959d59ac129 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -259,7 +259,6 @@ struct dpu_rotation_cfg {
 
 /**
  * struct dpu_caps - define DPU capabilities
- * @max_mixer_width    max layer mixer line width support.
  * @max_mixer_blendstages max layer mixer blend stages or
  *                       supported z order
  * @has_src_split      source split feature status
@@ -272,7 +271,6 @@ struct dpu_rotation_cfg {
  * @max_vdeci_exp      max vertical decimation supported (max is 2^value)
  */
 struct dpu_caps {
-	u32 max_mixer_width;
 	u32 max_mixer_blendstages;
 	bool has_src_split;
 	bool has_dim_layer;

-- 
2.47.3


