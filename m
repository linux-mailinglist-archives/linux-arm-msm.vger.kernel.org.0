Return-Path: <linux-arm-msm+bounces-58502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FD6ABC3EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:10:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D3DD1892020
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 16:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C80C28B7C8;
	Mon, 19 May 2025 16:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l330/fRJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FAD28B514
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670714; cv=none; b=Rn0Bx2baik37GzR/EiswLHfCKnCfo83dYvcsMeFN6b3WWoE+nNdGXLPaCbPTJdFEeIT8I6dfgYoATMvrwNfDHjxl/YtoBbysuGeeprBk6tAoiKokBtD6IM1KRsK2xk3T+IsDZBzYCYwdn0VSVgsM8HgkGd4ypeHjiN9zjVavB9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670714; c=relaxed/simple;
	bh=yu1RKR86AYBwaBYKeeSq/9Wt7HB5D8dF3OMfjsg+j/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VBNYeA6VA7GcTj0LSsMpGh81JVHJ+mHkYByZjzzQs8TtmRStDRxrmv9H7PHwr5QirozFU+HbJ5tmRia5KThp8hfngtRVZLTvQ5BXU2XwrvNZYNN8CDc4x4jVTs3JBUy2B8ZROAeu+Q7khOrDffaAkCbZqdaE+Amta7ErTv7WLYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l330/fRJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JF05F6021434
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ea6wr1i8bD7Empy2CwNO/ECmmeCFCrn1wDLpqx7ULEE=; b=l330/fRJkRFGnzdS
	Mh1PBgU9E64l0siabdmCfGv25XT6FPFEq6OYOt+fH1A4ITP9dqzNpCqRqIVvJ9dS
	AizIDtAoldl7KZxymWSzeMMXDDXB9GLL0Pwkm0WDSo9vA/TPIx80PtVEByKNNFyz
	NnzST/G/KqMrQl7ILp09IWrz/Dm6r/aXMw5R1VJ4FXSHpVzljHbo+/AWfVTam6XE
	MSEfjB4IWhiJDebWitaX9LOr8oc9461XdTJP6oXb0DZksZ8kOGjCvgG339cKyeQE
	nyXkg7Of7Ew5IcnMolZzxz6LAmHqg1KIc1QYpWgR0V6rXD1aibL0uCRZOjwJUQQG
	jkDEbA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r6vyr5td-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:05:11 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4033c872b60so5170613b6e.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670711; x=1748275511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ea6wr1i8bD7Empy2CwNO/ECmmeCFCrn1wDLpqx7ULEE=;
        b=L6d3tEqK7kNUYuFWmSLUJR0XY7GLEYlRbLnVl/ZYEnOZ/7nLswM61Pr7Qjk83O5aZE
         BNNDMCmHK0M+GPhNjQMwaqta2SFt9nh/6AAdl+BrAUcVnuqdz+ysZlCyWUVkFbqR5MuE
         w//vDE1hhz7lJ6vpslNkhUBS+KA2DuCaJ1DEBEv5stFUZPyNKk6GyVNfALgwgFPQW3dA
         5Cu7mXWOig1s9pSInGWgOqqAiZ5ZN85rOvNjZdAFtCPSTVKW+paGMhX1HQkO0NHrH6CT
         tqrSbWhNQtFV6kQKH4+Fj96p1JKgsNUAxmQTfe0uHw4exBVLBboeMC0h16RMu7fn3Wgk
         zFNw==
X-Gm-Message-State: AOJu0YzxzD3J6QiVSpftLQKBULQtCFYoSVWTSw+iE6Ovuazo4rZxA1P7
	O3WvDAa3+S1N2n+zF9EAqQGwt1WKo2L2F+KPI8yGawjXFLGYBsCnWeBz9PvsonZ+TYVuNqn9ckL
	nmNRanGpWm2GrX3X5GXCJt1VsfR+x9deE09EqpZUldOkreItn08N/eMyd2Tn3JVhA1FWj
X-Gm-Gg: ASbGnctwbZrHJ2mcRxtI2HKYW2XCZjZr8YyKFZTmz4vo/opwuOc24fDS0GjicQNIAw6
	PRPejXg7EVbqsC9GhmTxrmIKN0XGhfWqwV6ie850pFzQmD5y6KlzGMB1eIiL1CWj4BRdlYQZkst
	TLR0vzmlkPhMx37dOPCsuyKaC6+aeb7lrxib0vmjuMMZAg79mSuqoAA3w9q1Bj3Hx56j2gKGVxN
	WIflNQFgkYZ/pnwp5aAAst2XIp/BqxoeTFp92lD3EtBHeY+3v9aikk1/eBA4nxeE0XTmOdx94GO
	MxwtuJFQiqYcxiawvsAKsnNsF7q6CZlra3xPEgLOhozeF7aTx32LoChKqZJ6DtfXdf8pg08f8nA
	8uCpEQ62TSssl0zgDuT2bmVYO
X-Received: by 2002:a05:6808:6b8d:b0:3f8:d2f8:d735 with SMTP id 5614622812f47-404d88dd6b0mr7617014b6e.33.1747670710831;
        Mon, 19 May 2025 09:05:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEohu2HTpezrZKjYZzab40lnugimadF330qDKDeroQaoJwaPnUM5h62Ck57ATIfwpVwkh2mgg==
X-Received: by 2002:a05:6808:6b8d:b0:3f8:d2f8:d735 with SMTP id 5614622812f47-404d88dd6b0mr7616985b6e.33.1747670710450;
        Mon, 19 May 2025 09:05:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:05:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:27 +0300
Subject: [PATCH v4 25/30] drm/msm/dpu: get rid of DPU_WB_INPUT_CTRL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-25-6c5e88e31383@oss.qualcomm.com>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
In-Reply-To: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14567;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yu1RKR86AYBwaBYKeeSq/9Wt7HB5D8dF3OMfjsg+j/A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z9QSaPbv4oWIi8YEqjg4w0aHm3syVW4pnlR
 9a9iJ11we2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWfQAKCRCLPIo+Aiko
 1TwUB/9jrtkqZHILUK+VKMLLVoM2dP4+44OwUSKu54jrkEllBCajvROTBMSyXLeBtc2+1fKZAeM
 wITeXKB42AjmZhdIMG5FQMkfHc615un6mLz2pRuci9q1CCTaoCLuL5PbyzqfZdQwVEMsxkc8DS2
 UAotZZ1hVlKEjHpsNj4eKoD/wiKzt2LZPFyTaEsF3EetGSRn7EMtyyPT/QAk38Rp2WwJajWBoAE
 sqPu/zG4nxRuVn/bt2xXqtrV30fJw3DcmGHMQK0CZESgN24mOXKGePJn33eD2NmVwiwC5A0ZcbL
 PbobujIvNXswNSkuwejXjyN5euHSk57GSNw3jMpybIkhvavM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=NfHm13D4 c=1 sm=1 tr=0 ts=682b56b7 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qMlBm1ryi7ijQuv_G2cA:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfXwO8MUjmx/eO3
 FPhVA+8f9/gD8ktrD95duxUvXNuO4ATXP+Y3leYwBdgj6Er4rvRj0cj5LBo1wELrx8wSmr5D4N3
 IKmeANv596ynIhw0CLFjq0p8T6GKEu/7eFGqvcRsJoO+4NQMP/3pfPEDayy/3c9ayEX34d+q16n
 SWcvvv3UWXHjPnVrdYSvGVZXmg4j7/UKak5pFXjCrOs1QrpMikOPL6WYo2y+4d8v4R21rDmOGar
 lmIjXl18NTkx9w7jjCkjJn3fH+ssLpyYLESv1alHLXONJo7vimP3pYSlpL89E5+OcsfSB+gPiBH
 y7JBNcEWvZ4q6ek1ZeOHV23jcCtNCuTlFRh0kzw0+O5b/6AKvP6uRQPJQJV2aTtGGYDumAKwDiM
 tYeZVVL3UXO1mDxea6XXuhbiUFdF1PmrHvPWOdyfZzquxNunrCDL/VHEcPXyquBbtGRayVaT
X-Proofpoint-ORIG-GUID: iJu9duJRzCMD7K0C8jQU5gR0FgoTkIfw
X-Proofpoint-GUID: iJu9duJRzCMD7K0C8jQU5gR0FgoTkIfw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150

Continue migration to the MDSS-revision based checks and replace
DPU_WB_INPUT_CTRL feature bit with the core_major_ver >= 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c                | 2 +-
 19 files changed, 17 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 013314b2e716a6d939393b77b0edc87170dba27b..56d3c38c87781edb438b277c77382848b679198f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -318,7 +318,7 @@ static const struct dpu_wb_cfg sm8650_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.xin_id = 6,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 5d3b864d28a86fb86fc4576210c9418604afd844..ae1b2ed96e9f10a6e7a710fc8bb4e40dec665cf9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -275,7 +275,7 @@ static const struct dpu_wb_cfg sm8150_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index a6e9dfc583f283d752545b3f700c3d509e2a2965..fc80406759cd52f0d633927c8ba876feaff48e07 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -281,7 +281,7 @@ static const struct dpu_wb_cfg sc8180x_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index fe9c9301e3d9d2d3a0a34ab9aed0f307d08c34ca..a56c288ac10cd3dfe8d49a6e476b9fff062f8003 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -241,7 +241,7 @@ static const struct dpu_wb_cfg sm7150_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index 8fb926bff36d32fb4ce1036cb69513599dc7b6b7..a065f102ce592311376f1186add7a47dca7fd84f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -154,7 +154,7 @@ static const struct dpu_wb_cfg sm6150_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index 5c2c8c5f812347970c534769d72f9699e6e7049a..2950245e7b3f5e38f3f501a7314bb97c66d05982 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -133,7 +133,7 @@ static const struct dpu_wb_cfg sm6125_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 9ceff398fd6f554085440f509b6f8398b4fbf304..7b8b7a1c2d767eafca7e7440098bb28e2e108902 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -312,7 +312,7 @@ static const struct dpu_wb_cfg sm8250_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index f6a0f1a39dcc3c9e82c07889d71905434274cdf9..c990ba3b5db02d65934179d5ad42bd740f6944b2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -148,7 +148,7 @@ static const struct dpu_wb_cfg sc7180_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index a46e9e3ff565ba5ef233af76f1c6cebb1d0c318a..093d16bdc450af348da1775ff017d982236b11b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -142,7 +142,7 @@ static const struct dpu_wb_cfg sm6350_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index b4d41e2644349bdbdbdacbe1e9b3748f90df4f3b..85aae40c210f3aa1b29bf0b5ea81ee1f551a6ef6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -285,7 +285,7 @@ static const struct dpu_wb_cfg sm8350_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 5d88f0261d8320a78f8d64c9bb68b938f83160a0..8f978b9c345202d3ea1a7781e4ef2763b46c6f6e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -159,7 +159,7 @@ static const struct dpu_wb_cfg sc7280_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 3c0728a4b37ea6af25ab64315cfe63ba6f8d2774..b09a6af4c474aa9301c0ef6bc0ce71ba42cce3a2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -298,7 +298,7 @@ static const struct dpu_wb_cfg sm8450_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index b8a1646395916fde04b9750cf548edca5729d9c2..0f7b4a224e4c971f482c3778c92e8c170b44223f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -305,7 +305,7 @@ static const struct dpu_wb_cfg sa8775p_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index ef22a9adf43ddc9d15be5f1359ea5f6690e9f27c..465b6460f8754df18bbcf4baac2f8a3ebdea3324 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -294,7 +294,7 @@ static const struct dpu_wb_cfg sm8550_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.xin_id = 6,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
index 2e7d4403835353927bc85a5acd3e6c5967cac455..6caa7d40f368802793c8690544c1c82b49a617cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
@@ -294,7 +294,7 @@ static const struct dpu_wb_cfg sar2130p_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.xin_id = 6,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index ac95d46b3ecf2d95ec0d516a79567fe9c204b5f6..7243eebb85f36f2a8ae848f2c95d21b0bc3bebef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -294,7 +294,7 @@ static const struct dpu_wb_cfg x1e80100_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.xin_id = 6,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index ad0460aa5b5ce5a373dab18c89e4159855da4d2b..6d7be74bafe326a1998a69ed9b3495c5acf6350f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -98,9 +98,6 @@
 			 BIT(DPU_WB_QOS_8LVL) | \
 			 BIT(DPU_WB_CDP))
 
-#define WB_SM8250_MASK (WB_SDM845_MASK | \
-			 BIT(DPU_WB_INPUT_CTRL))
-
 #define DEFAULT_PIXEL_RAM_SIZE		(50 * 1024)
 #define DEFAULT_DPU_LINE_WIDTH		2048
 #define DEFAULT_DPU_OUTPUT_LINE_WIDTH	2560
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 41906dadff5a8ef39b2e90f3e80bb699a5cf59b7..8c394e7d6496ca2d120c81c7776b4b979368be23 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -140,8 +140,6 @@ enum {
   * @DPU_WB_QOS,             Writeback supports QoS control, danger/safe/creq
   * @DPU_WB_QOS_8LVL,        Writeback supports 8-level QoS control
   * @DPU_WB_CDP              Writeback supports client driven prefetch
-  * @DPU_WB_INPUT_CTRL       Writeback supports from which pp block input pixel
-  *                          data arrives.
   * @DPU_WB_CROP             CWB supports cropping
   * @DPU_WB_MAX              maximum value
   */
@@ -155,7 +153,6 @@ enum {
 	DPU_WB_QOS,
 	DPU_WB_QOS_8LVL,
 	DPU_WB_CDP,
-	DPU_WB_INPUT_CTRL,
 	DPU_WB_CROP,
 	DPU_WB_MAX
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index 4853e516c48733231de240b9c32ad51d4cf18f0d..478a091aeccfc7cf298798e1c119df56737e3dc4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -208,7 +208,7 @@ static void _setup_wb_ops(struct dpu_hw_wb_ops *ops,
 	if (test_bit(DPU_WB_CDP, &features))
 		ops->setup_cdp = dpu_hw_wb_setup_cdp;
 
-	if (test_bit(DPU_WB_INPUT_CTRL, &features))
+	if (mdss_rev->core_major_ver >= 5)
 		ops->bind_pingpong_blk = dpu_hw_wb_bind_pingpong_blk;
 
 	if (mdss_rev->core_major_ver >= 9)

-- 
2.39.5


