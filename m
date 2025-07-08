Return-Path: <linux-arm-msm+bounces-64096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A4DAFD60D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 20:07:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE8951BC71F1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 18:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E752B2E973E;
	Tue,  8 Jul 2025 18:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CfVhxTMy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36F32E8DF3
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 18:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751997949; cv=none; b=rXBa52zr1ErMU/A9XUl476AfZlxD8BBrJvzoeyp67Kku+KbnBmxRYpN/ZzgeNVfvu1v/SAqMkscK6ZpmCSPnYYO0M8Uj1xUUr3k+Frq7LQw/CBs4XlUNBfY2jo2gRcWhpuA1w9iIGvtdwlSc1hXE9QONowNjrGLEFcilkUfOySI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751997949; c=relaxed/simple;
	bh=OxNfsPbEJJVN+awzaENbdWaGNtistdBy+KfHPzGS4lc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZrhDZFig/OPkvzHpjLSwPRWyK+p5hf8DiUeLheSPMGO7+LvnIZXaXnsafluetFhNNrYS4ran49ECz685Jp+Sg+hfrdrm6AVxdTIz+iqkth+/GT5WT6oFM1KhFOPvWmsxAhF5fhLIeQZe4RFCBTwpYjAhlNFWWYIrH+T+URrzmK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CfVhxTMy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAJmS008388
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 18:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g/AcEZbY/3L
	hPC//AHj1l8zIdFMRt7GCdZHsFAjwcrI=; b=CfVhxTMyCMloVL52x+jy1ie/Nk6
	4EhBbLG3pKs4UE/hwxt0TxuCXes4k4tNEHK4iuWDToHfVbw1/ulHSa5mLxmWtyp7
	mSgtr2J+pbIIpQdGwwyDpcMwowduoVTHzkMSxqawXbK76r1LUTPz/91ZXDditEpX
	1uzd07OB2cXtEpgPkeuYKoJT07noos1YG6hi8C3Gs7ZZpwLEAYosJECZp7FvjOVW
	9Kt/UO1y4CF4kKdqGV4AUsiryzt8PCXeKBiNWUXfL33VDF3sP4J/f0lEA+IOxHCG
	3kLSS7xn7Mk87cBbRJ9gSyY6h/oavs/4bmTBRNEuZSMMCrMsmLyWQJojP0g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucn152w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 18:05:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a44c8e11efso143578251cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 11:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751997944; x=1752602744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g/AcEZbY/3LhPC//AHj1l8zIdFMRt7GCdZHsFAjwcrI=;
        b=Em0IFqO1DbEzTjRlkOychIKc36Bk6M0B4L93V5xG1hW7e8kkJRIw0RteliJERqOrNT
         lqnWC8tytT2yYdfzzcpYkzTLiLlP7DDcgNOJlp7W6+H6UBE0355rvpd0GZ3+UoKW2nYu
         fhEbGCdVkjOTKYK/KN1Bu9m6L+QMol4CrdSWqho8TKyjAG2tozEEy58mUhTbIHCyrGH2
         xTHfNcJxgS8j5TtSUQykZSsywBz/IK5DV4DeXNlEYpJB5+f2HvyzMbBXGfEPLVic+bv/
         fSyiStJIyOJpOb/qWnI6V+0JV5lPbhyscOnBOeTBX4ii86bnxPMCg/o4ND87UuMvT5BT
         UePw==
X-Forwarded-Encrypted: i=1; AJvYcCXmUuxEQj8m/DYUZbPhw2EWzawagG8nVDsYM89BTBalGA4A6g9TxbISfSPQJbbaga7udExm9AiRrZjbMPoQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyVx2i4YifvTJL27SHA57uoOmx7PVJm/N/6S3d4qMxiEVZg5Dg3
	qv7qL3edC7SmhwxqW5M82NGuaqpe6BAqPszhVhd0ykew9udvzRnIwfBYtj4AlPDv/a8ianlANK+
	736qT6WT9fkgZ9tcclOz87qjVn4ZrLLpCy0Ggeu5wTuxC+EGXqqMk0qft3r4r/rEbwRiv
X-Gm-Gg: ASbGncsE7EVECn33jao1O/YuRXBUoECNYV0l9h1XFwTl8qdNgYT8c5sv4CNXSP87htj
	hGPYkQ6lLSjQpjHt1Tx8NlerGlYKUuojMVSYiAK3VNAR0Ez0GmdvgN/k5p8+tOaM+J91hX9VZYe
	o4sfhvr02ObhlPpwyM9edmhczWX9fVPY1O02HO8k28Q9zxNXfsouNIauo4TrYqXTw3z5mNzCDV4
	zKG8M9wo3SssSvoRl2kgKGyvaSX6vM9u9vVIZqU8Z2GC57pXRpz5iJxE7TU4ht1wi38eevRXNeg
	KcZ0Npdtbt7Z25rlTJiVxqyCT3tTfKb+1BYBfH/ezaqadWmQ7YTcqvRb1Op73E5qyCUjWSOi9A=
	=
X-Received: by 2002:a05:622a:1996:b0:4a7:234e:6c00 with SMTP id d75a77b69052e-4a9964ac1b4mr275033311cf.2.1751997944357;
        Tue, 08 Jul 2025 11:05:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkMRM9KKBfHt3zmgrQce93lQ6Cs15i1fHDTvD9lJ6RJtXqxX1W18f2vx1jwlhNHD7f/t/16w==
X-Received: by 2002:a05:622a:1996:b0:4a7:234e:6c00 with SMTP id d75a77b69052e-4a9964ac1b4mr275032581cf.2.1751997943708;
        Tue, 08 Jul 2025 11:05:43 -0700 (PDT)
Received: from trex.. (97.red-79-144-186.dynamicip.rima-tde.net. [79.144.186.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0a5csm13394906f8f.29.2025.07.08.11.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 11:05:43 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, bryan.odonoghue@linaro.org,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        krzk+dt@kernel.org, konradybcio@kernel.org, mchehab@kernel.org,
        robh@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        amit.kucheria@oss.qualcomm.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 5/7] media: venus: core: Add qcm2290 DT compatible and resource data
Date: Tue,  8 Jul 2025 20:05:28 +0200
Message-Id: <20250708180530.1384330-6-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250708180530.1384330-1-jorge.ramirez@oss.qualcomm.com>
References: <20250708180530.1384330-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686d5df9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=oX6B8lV6/A+qF9mARCc04Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ykJq56P0K5uy9zAsI_4A:9
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: IcRnj4kjTT63zeELEV3e9eq22sJMTRnd
X-Proofpoint-ORIG-GUID: IcRnj4kjTT63zeELEV3e9eq22sJMTRnd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE1MSBTYWx0ZWRfX6PpHLAAoEwTF
 fyiJARkl2dvja9yNYPCbYJBXLhUQcEIsFGpm9FeiLYIsqxwa8S5zTmEJotUeXHAxXc3G6IdZIs4
 HxkngRdwiz4ZtyKoOsue0+PGIZgP36NhikGv0Z2YbvoQ1WimDdTn0iq7loxkIllLQhWgO1CgcvL
 5Pn37q0bCUyPPl8I9+ezrZBQkcVsdvShWs+tXc1sXGrEfBqUTL6MP/8xXShIgs1k7sMvb4sLM0A
 mtpDSK31cEDHOs1TdEvPsF3wDW99vfo6LijMff188iv/aaX8XAN6AnFuxJ20T7pvgLGfxmKkKM8
 F2trD9yla24fUyBSDSmv09Rcd68MqZHBXuY4ocg/uXC2e+2Dquir6i4/Q7K3p+NB9AfpprUMhnX
 u5AHAwCH7+5gLcHEqpqq/uHN+KLBvT5yPv9IVJKX5Np5R/UAGVx9wUG8jMp4Ifqp4YZbPlVG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_05,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080151

Add a qcm2290 compatible binding to the Cenus core.

The maximum concurrency is video decode at 1920x1080 (FullHD) with video
encode at 1280x720 (HD).

The encoder is not available to firmware versions below 6.0.54 due to an
internal requirement for secure buffers.

Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 52 ++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index a4472cc2088b..a486115bbe57 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1082,6 +1082,57 @@ static const struct venus_resources sc7280_res = {
 	.enc_nodename = "video-encoder",
 };
 
+static const struct freq_tbl qcm2290_freq_table[] = {
+	{ 352800, 240000000 },	/* 1920x1088 @ 30 + 1280x720 @ 30 */
+	{ 244800, 133333333 },	/* 1920x1088 @ 30 */
+};
+
+static const struct bw_tbl qcm2290_bw_table_dec[] = {
+	{ 244800, 2128000, 0, 2128000, 0}, /* 1920x1088 @ 30 */
+};
+
+static const struct bw_tbl qcm2290_bw_table_enc[] = {
+	{ 244800, 2128000, 0, 2128000, 0 }, /* 1920x1088 @ 30 */
+};
+
+static const struct venus_min_fw min_fw_encode = {
+	.major = 6, .minor = 0, .rev = 54  /* encode min fw version */
+};
+
+static const struct venus_resources qcm2290_res = {
+	.freq_tbl = qcm2290_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(qcm2290_freq_table),
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
+	.dec_minfw = NULL,
+	.enc_nodename = "video-encoder",
+	.enc_minfw = &min_fw_encode,
+};
+
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
@@ -1092,6 +1143,7 @@ static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
 	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
+	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, venus_dt_match);
-- 
2.34.1


