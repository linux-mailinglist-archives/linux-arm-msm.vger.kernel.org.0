Return-Path: <linux-arm-msm+bounces-55073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D3CA98079
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 09:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78F6219412DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 07:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7339B267B8D;
	Wed, 23 Apr 2025 07:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="az5ksTKK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11CE26771B
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 07:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392859; cv=none; b=aYkJp0As6FBk960HyP2SbDjhpFkdtqpnGH70oyqaewuI6jMt8Oz+6fs8M9tYypEwCs1P+2LsrN65FTIfbtyH/xw023Wo1dQ7MjC7wXvvGey8hJUTaaZKIiLWQ+ykR88WtdfYsgKWmwBXi2INJygjHi6gN9DVh/xra+5Yx+9vfO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392859; c=relaxed/simple;
	bh=X+alFMRpOfesOk/IJi5wo30ja91IZAsoaus9JZDGqQM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hpcq1iFVFHLuSLZyVde1xoQ19EL8gWKPJn0djRej9an7vCqWhZdUu9lznCWnv3zsmuwrOFk9DLuvemf77QCLKanaPutL6haYOiFmSlu+U16RffX9d+dHys9KjGBfRF26CVQBfDLqLtcowdHSZmrXizxfbqCjqP6w3l9ZNxgTUIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=az5ksTKK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0i7ei003025
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 07:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LKuqsPzAXCz
	FWePIoEgomsLN2CbaF43dCIi9kkExK8E=; b=az5ksTKKjLiz6kywT6qxpekEYC3
	TJPdQl5UYnd7LgxfcaXZbBvW3ta3hK61L/jz0hkLKMnuTGC5ilQvZDezy6Rw+BrT
	2ZRoJftBn7uv/sDYXT49QMjdQPgkAEeZoZkNgnzkMd680cLV1470VXhAq+ByhgQl
	S9+hUAqwnOkltoeDDuqYzKJUzULY8u0K3G80z4pXZDl0xv4uCgqev1HYnR4SEqa3
	MKJm4jj23tEbmAscYT83B9ARy438oebajfvRGelJCCP2KHbdnBiPIvvWh58L0KYM
	D2B3/u47qjFvHR65O1ls3Ucg1kdYr6xiSHHzxUxVp9DOu3ZuFrmxJqUmjsg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy179e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 07:20:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5c77aff55so1107183185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 00:20:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392856; x=1745997656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKuqsPzAXCzFWePIoEgomsLN2CbaF43dCIi9kkExK8E=;
        b=AeF1CXUdmHKSb5+PxaYxJwu/aTJufzRy/M4Z2wDRxNlKTKN0AG9+fX6jd3tFFUidE/
         29XwCn9RSPCO+pCYSIeg/RWfSZi8lzMyC1m2oVYHEh0l8wAR3vABqCitlY9HcIjRpJTt
         kSKwaVjD45IiiGBfnbSJ+KnprbPhbXOneJzHsU4PVkJcHeDx9i/vCUiZZd2Z9ApEneh/
         LQuzwACmJ7vo5Bu0edrFeiiZbnVp8xGsmAKBCim8qLzSwGlYpyf0kR9C4It1eL5mPbAa
         w/edDS4BBCSw2dkN+MGzngqwxQt0tD2HSf/ePxp5JbeCdpJee0ilOzi8dtbCWDU/NgMy
         4FWA==
X-Gm-Message-State: AOJu0YwmO6tjqeXJWdXdzqnGj182nL4nvkyx64UqpbOCESen7IKYTEEL
	XTZXn4yvMLczJcHHlEsXZ/ZQ/QAG/Em7OyfHag49A1PE2kowbA0A6V7tS4itCRPYnqrQ46WgbNg
	wgx3amwzNTTD4M5UKIwOfEMYfha8Jr4tvE7NAwGf6Ds5CmXuID5JSr7WiDysw1KtN
X-Gm-Gg: ASbGnct1C0LDLegs3IqPoOa7q4OCRYiJ7shUY7NaC1HIM9d27YEoktA960u4+OBLBnX
	pBJrS+6Ei0hNYNPEvJwUtBVW4l4T7hISkevONH9FHuCXIkdJnbzeBBsloWj2MuslH4IV82OFWFg
	sNh7Ijc7Qv0HV+zMeKa4ZM0nyoLOd1e6CQ6H0Zw9CTpUeRdJ5090GhXsmLr4JzF7nhcIWMbtHxK
	Q5R9yzOyu+YaMjPBpgWm033URnkjtTackS6AluSah0F47We61uALyNymG+j/530xfmHcsVvQ3Cc
	zUVMYxJnsuuhHlxNHG/cWffak2s0lnBYYhHKGwkcDJ/CbdU=
X-Received: by 2002:a05:620a:5ece:b0:7c9:4d4d:206e with SMTP id af79cd13be357-7c94d4d21f3mr281114385a.6.1745392855865;
        Wed, 23 Apr 2025 00:20:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0UPk1lUMWe1R7PeZhmMEGfZByAK0XYQ4UhgB3PUm5+9GincFeZninZj7EJQUIIEfkFSssPA==
X-Received: by 2002:a05:620a:5ece:b0:7c9:4d4d:206e with SMTP id af79cd13be357-7c94d4d21f3mr281111885a.6.1745392855536;
        Wed, 23 Apr 2025 00:20:55 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:10e3:ecaa:2fb2:d23a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec42af6sm757138366b.43.2025.04.23.00.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:20:55 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v4 4/6] media: qcom: camss: add support for QCM2290 camss
Date: Wed, 23 Apr 2025 09:20:42 +0200
Message-Id: <20250423072044.234024-5-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
References: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA0OSBTYWx0ZWRfX8IEeQ5nalaX8 XHAPaGnQzsCRyDODB62ckf4VuldciBVgpfXuN541wiexCxaVUWowe29rStsr9om5biBmcJqaZnd ZLNlYUDR0I0q5mqxQv6MadCWNa6FzsCqLgaAbdIc+AuXIbx5V7AMgTXL1UWxKfFYuSIPJ4L7kkc
 mvVnnIsxyLaoR7aikO6spZu5O08oSfCLAxZZeaAJ4bSbF2AIWtjM7/hFx4/sMJ6GeLqtHiBdH2K CkmhXzbdZnuhbi1VuQgmYHrdnMgVN829cT49iQnmKrs2Vu5KW5x5esTf1ozz4Al+9mFFaELGvLj j2dG5oWF8o7yqWIQg2JsyEZwN9G2NS/6uD3sL8HXYZycDFwBY/PSqszJZv7bHIHBd612h7GPdm/
 FsOCMnUtsXfwAmiljMq/BWJtQVJa16EbV9S83Sqlz3SDdkXV57Pkt9exFzSJKRBK94FBJeMJ
X-Proofpoint-GUID: EvlPP7waZY9JSaf5Wf1hR2xFVDo3k8Nz
X-Proofpoint-ORIG-GUID: EvlPP7waZY9JSaf5Wf1hR2xFVDo3k8Nz
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680894d8 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=c8dJUS_lH9wIvx9YmlQA:9 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_05,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230049

The camera subsystem for QCM2290 which is based on Spectra 340.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
 drivers/media/platform/qcom/camss/camss.c     | 148 ++++++++++++++++++
 2 files changed, 150 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 4bca6c3abaff..c575c9767492 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -340,6 +340,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 		}
 		break;
 	case CAMSS_660:
+	case CAMSS_2290:
 	case CAMSS_7280:
 	case CAMSS_8x96:
 	case CAMSS_8250:
@@ -1969,6 +1970,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	int ret = 8;
 
 	switch (vfe->camss->res->version) {
+	case CAMSS_2290:
 	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 06f42875702f..64f263b8065c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -515,6 +515,140 @@ static const struct camss_subdev_resources vfe_res_8x96[] = {
 	}
 };
 
+static const struct camss_subdev_resources csiphy_res_2290[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "top_ahb", "ahb", "csiphy0", "csiphy0_timer" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 240000000, 341330000, 384000000 },
+				{ 100000000, 200000000, 268800000 }  },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+
+	/* CSIPHY1 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "top_ahb", "ahb", "csiphy1", "csiphy1_timer" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 240000000, 341330000, 384000000 },
+				{ 100000000, 200000000, 268800000 }  },
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.id = 1,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	}
+};
+
+static const struct camss_subdev_resources csid_res_2290[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "top_ahb", "ahb", "csi0", "vfe0_cphy_rx", "vfe0" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 192000000, 240000000, 384000000, 426400000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.hw_ops = &csid_ops_340,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+
+	/* CSID1 */
+	{
+		.regulators = {},
+		.clock = { "top_ahb", "ahb", "csi1", "vfe1_cphy_rx", "vfe1" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 192000000, 240000000, 384000000, 426400000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.hw_ops = &csid_ops_340,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	}
+};
+
+static const struct camss_subdev_resources vfe_res_2290[] = {
+	/* VFE0 */
+	{
+		.regulators = {},
+		.clock = { "top_ahb", "ahb", "axi", "vfe0", "camnoc_rt_axi", "camnoc_nrt_axi" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
+				{ 0 },
+				{ 0 }, },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 4,
+			.hw_ops = &vfe_ops_340,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+
+	/* VFE1 */
+	{
+		.regulators = {},
+		.clock = { "top_ahb", "ahb", "axi", "vfe1", "camnoc_rt_axi", "camnoc_nrt_axi" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
+				{ 0 },
+				{ 0 }, },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 4,
+			.hw_ops = &vfe_ops_340,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+};
+
+static const struct resources_icc icc_res_2290[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 3000000,
+	},
+	{
+		.name = "sf_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 3000000,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_660[] = {
 	/* CSIPHY0 */
 	{
@@ -3753,6 +3887,19 @@ static const struct camss_resources msm8996_resources = {
 	.link_entities = camss_link_entities
 };
 
+static const struct camss_resources qcm2290_resources = {
+	.version = CAMSS_2290,
+	.csiphy_res = csiphy_res_2290,
+	.csid_res = csid_res_2290,
+	.vfe_res = vfe_res_2290,
+	.icc_res = icc_res_2290,
+	.icc_path_num = ARRAY_SIZE(icc_res_2290),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_2290),
+	.csid_num = ARRAY_SIZE(csid_res_2290),
+	.vfe_num = ARRAY_SIZE(vfe_res_2290),
+	.link_entities = camss_link_entities
+};
+
 static const struct camss_resources sdm660_resources = {
 	.version = CAMSS_660,
 	.csiphy_res = csiphy_res_660,
@@ -3865,6 +4012,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
+	{ .compatible = "qcom,qcm2290-camss", .data = &qcm2290_resources },
 	{ .compatible = "qcom,sc7280-camss", .data = &sc7280_resources },
 	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
 	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
-- 
2.34.1


