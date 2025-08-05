Return-Path: <linux-arm-msm+bounces-67746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26325B1AE9F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 08:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 449C13BD8D5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 06:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63AE2239E97;
	Tue,  5 Aug 2025 06:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RJjncFcP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B9122CBF1
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 06:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754376289; cv=none; b=Wp5PE4h/4iui9E/YSe+AQBl2mLZkT0MPnGCdGInwWfr2aTwrg0rCfRet1sttj4vjt8qvSucnHsbkmRNulNFoDG7JTkxkGz+yHsNK5jaGY9i9VOOBGL4CmVN5oxbn6p6qB/p/o38yEXimnEmfKF43PoGoE0GBg3G+tdYRHykDm74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754376289; c=relaxed/simple;
	bh=K4mCViCHCWuXv/g4/AJKSvpp4YQj0BbDQ6qxHf9Frmk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n9D52ZpXpB9ViryE/3M5OHk3DJ3I6WrWP5yOv2kKC3UF+mb+eaz/qzvLpwYFERkbphqWw6MOU8rTIST/ULBKdQYgkAHaF5JpHlvkYSzmLe815uGP+Wo+VQ/ijdThcm8hobjT9QRBTHQyLVNzbuVDquHpIKH3EtxM4UdS3nAQwGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RJjncFcP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5756OOEX021762
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 Aug 2025 06:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+M/8qH7Msyp
	gORIluOg3H4YeiT5EdzbwVLL3V4pOe+M=; b=RJjncFcPKpTelP01psr7odknSo5
	aSVjEYCMeEcgZPObYbLUAsGa/SshrIP3DnJY78L7oTx5DfiLGiF5x8DMHyk/3SV1
	8pdMEvTrtp0ysanKb1RZaxeZFIWptamkiugKS88/Ty/5z6FGAny6eVe4sCW0UyBw
	Yy0bNTy41TLMfS7oHFoucZgCRVTEaPvM8igXpKV5SUU0Nz+wRu1qU+3eo50ajXZM
	9WEljbNv7nGJUeXHGDA24V3rO0s5cQ9bVg1EYdy14OpJqqrmw7FtlCHuXTxZDrCa
	/LlTIFbC254p0UMUrW8mrIW1U1qELg21iYBrE5wk+nbAzMbhSwDwwLl4RzA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489byc7e7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 06:44:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b07bf0783bso27980021cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 23:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754376284; x=1754981084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+M/8qH7MsypgORIluOg3H4YeiT5EdzbwVLL3V4pOe+M=;
        b=NDgWofjhwVHMJaepTjmqW5a1KQiQhItNYL4Ksj1PxkRwteGLZCNniUq2YUwctBQlSp
         Svg6hrccXEWQTsPNQTXaGosd/Tuf0TY2uQoHvybQO8az3goRW7RsvMThwczLUO7NTM0k
         VJ+dXmbLStBNPRWnqkpN7/vVJ7ca+BmlRpr8sLrHbKYOAhLLBnWG6eMVEEhEkVDnXwAU
         GDHl8JAOCRe3lJsR1HVwOTPD5iD65+baH58qLs9GNS4zBe10yGrNZx4/q1V+ZslUWr9a
         JHQrMM1DJVki+vWFShOPspqLlnbdEf+BLpSvDqp7VPCg+FJGlz33JzmdoiyK6y9RFMuQ
         n+Sw==
X-Forwarded-Encrypted: i=1; AJvYcCXGkF20ZM5+gWnQyPyDtT6ZGGREViodA5l5aQdnim0IG98S20zItQfIxazsMAqw2lBS5/c/Ayq2qzvZl2Ku@vger.kernel.org
X-Gm-Message-State: AOJu0YwTrU9XqT/xJSRotS1Yise6u5tSHAH5n1fMnWtf03QPVpM+AorQ
	grmmNHylHi0BXe1zRPG0fbSkMFBArvnazKsFmun40Tne6ee8PIrel7Mh8B9Rt4lsXnbBSfVttTm
	NC1q/n0se5gtcGAczda7pk0x+pOlQh2Z5qKlMQDnesClTcmhMcFjo3YBMW9MGEmc9OY6r
X-Gm-Gg: ASbGncve+XNwjtNJ/klOPd2/UiGQxRdxCzLutKA1FycJQLqkpCyqbLm6J/uwIGBvbPK
	K7532NJVyhi1ilGtDrPm6I2Rco+RC7kayW1W8kTuZqJ8bLDkUb5FjbCRJhfWPVg3hRc7WXq5+VA
	EKWYYnICCLKD940oCaGPt5TKUYPz56KnKQyXXz94YPLBQqzJhPcf9L6cCKbaJjYeymt6Vz2LrJz
	iqwxrOmUeclN+SZ7aze198KDdEcuPUUe7HfjocjdOBphhGSlPpjz0xNy3w9uhWYWsSWx+h3O3om
	kB7rxtrjrAzBdNmDmIVSDdiCMcoK7Y7QADAg8wERZZi5dVRNYcihwBfO9RL4WsurxbrdK4gRdJj
	vGCI5I2S/bX0i
X-Received: by 2002:a05:622a:138b:b0:4b0:681e:abdb with SMTP id d75a77b69052e-4b0681eb979mr109131551cf.28.1754376283690;
        Mon, 04 Aug 2025 23:44:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSfdnAqhmXQQ+vuUhuVgCmpAmNLrSe16OUeFjQWiJjyBL/9kwP0NnsALWpSPWMAwe7Vg9hZw==
X-Received: by 2002:a05:622a:138b:b0:4b0:681e:abdb with SMTP id d75a77b69052e-4b0681eb979mr109131291cf.28.1754376283208;
        Mon, 04 Aug 2025 23:44:43 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589ee57922sm194015815e9.22.2025.08.04.23.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 23:44:42 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, bryan.odonoghue@linaro.org,
        quic_dikshita@quicinc.com, quic_vgarodia@quicinc.com,
        konradybcio@kernel.org, krzk+dt@kernel.org
Cc: mchehab@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 5/7] media: venus: core: Add qcm2290 DT compatible and resource data
Date: Tue,  5 Aug 2025 08:44:28 +0200
Message-Id: <20250805064430.782201-6-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qkEDF6c15dYtHOadgW_rKvMuuz7Ib6KW
X-Authority-Analysis: v=2.4 cv=Y6D4sgeN c=1 sm=1 tr=0 ts=6891a85d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=5fA-3PHwp7xA7VOvTvgA:9 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qkEDF6c15dYtHOadgW_rKvMuuz7Ib6KW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA0NSBTYWx0ZWRfXwPbvPgoUapWQ
 IxuP/WLYTnuSg/g6ia6DND9mKNhQRBg1+NPD7IAg0xqtYU935CwC3oCKpoMs3XruzIAipa1GbmS
 ioGWbahvmoktxEHjR7Q9jTIj0D1iRb2kMAktn4dOO7sMGlZFhtT15h9y4bqO3cnVpzbTun9bddC
 t1t8MPd40IceQzROw1MCnsLfmULVox/T407DoGT8tfTdbA8rGMi69puZjLNJFbdFG1my78wVRYe
 Pj0fusi/3QGTOfOEFFIAMxwBTKw3KFAL39QZwZhROaGo1JqXFoDqvRiVD06s4M9WgveB34TpqqZ
 6bkCoGNxcsgrCz3zB2HQT7sOQeHCMfBPmhPJWkfFItWXp9IqOIiDyJi/2/AnOZWtO7+JGazsf9K
 6zAjotkX3QQVHUBIwTRMpY5Eo0okp8kvu8f6GrnUipV5s54BL/VdmYxW6k0po6Hw93IvcU54
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050045

Add a qcm2290 compatible binding to the Cenus core.

The maximum concurrency is video decode at 1920x1080 (FullHD) with video
encode at 1280x720 (HD).

The driver is not available to firmware versions below 6.0.55 due to an
internal requirement for secure buffers.

The bandwidth tables incorporate a conservative safety margin to ensure
stability under peak DDR and interconnect load conditions.

Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/venus/core.c | 50 ++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index adc38fbc9d79..753a16f53622 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1070,6 +1070,55 @@ static const struct venus_resources sc7280_res = {
 	.enc_nodename = "video-encoder",
 };
 
+static const struct bw_tbl qcm2290_bw_table_dec[] = {
+	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
+	{ 244800, 413000, 0, 516000, 0 }, /* 1080p@30 */
+	{ 216000, 364000, 0, 454000, 0 }, /* 720p@60  */
+	{ 108000, 182000, 0, 227000, 0 }, /* 720p@30  */
+};
+
+static const struct bw_tbl qcm2290_bw_table_enc[] = {
+	{ 352800, 396000, 0, 0, 0 }, /* 1080p@30 + 720p@30 */
+	{ 244800, 275000, 0, 0, 0 }, /* 1080p@30 */
+	{ 216000, 242000, 0, 0, 0 }, /* 720p@60  */
+	{ 108000, 121000, 0, 0, 0 }, /* 720p@30  */
+};
+
+static const struct firmware_version min_fw = {
+	.major = 6, .minor = 0, .rev = 55,
+};
+
+static const struct venus_resources qcm2290_res = {
+	.bw_tbl_dec = qcm2290_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(qcm2290_bw_table_dec),
+	.bw_tbl_enc = qcm2290_bw_table_enc,
+	.bw_tbl_enc_size = ARRAY_SIZE(qcm2290_bw_table_enc),
+	.clks = { "core", "iface", "bus", "throttle" },
+	.clks_num = 4,
+	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
+	.vcodec_clks_num = 2,
+	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
+	.vcodec_pmdomains_num = 2,
+	.opp_pmdomain = (const char *[]) { "cx" },
+	.vcodec_num = 1,
+	.hfi_version = HFI_VERSION_4XX,
+	.vpu_version = VPU_VERSION_AR50_LITE,
+	.max_load = 352800,
+	.num_vpp_pipes = 1,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.cp_start = 0,
+	.cp_size = 0x70800000,
+	.cp_nonpixel_start = 0x1000000,
+	.cp_nonpixel_size = 0x24800000,
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/venus-6.0/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
+	.min_fw = &min_fw,
+};
+
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
@@ -1080,6 +1129,7 @@ static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
 	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
+	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, venus_dt_match);
-- 
2.34.1


