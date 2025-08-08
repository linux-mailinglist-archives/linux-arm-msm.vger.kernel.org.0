Return-Path: <linux-arm-msm+bounces-68088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0527B1E4BF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 10:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B208584545
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 08:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D3C26E6E4;
	Fri,  8 Aug 2025 08:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gRkfAeS6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BC326CE14
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Aug 2025 08:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754642982; cv=none; b=seXNm+1p0h16VhaWA59x0c8A0jyblN0DgDSlImcvmYLic0mnO3/ZhTmDpJM2qIDmD8nVTlWDVQ8FyNTEph22qDdfgXfxSmnbLzYROafCaFQD+Gi8v+HFJQUv6v2Vsp/bt4UGNo5SZouHe25Jr7wq47qUc295nrm/Xr6+btUUXt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754642982; c=relaxed/simple;
	bh=dARtMRs88U+SkvksFaX/4ibKTv2r3ZxeZPWci1xWpd0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b0KrWhkFSAL/ZpL1rJEEkHhZnfOB4YzTMbhSUPkrpBltgHNQ7bmx21c4QJ5/zY3grcHUcV9i7ChyAvxIvG/94Hvlsb6sS47k5kDmRFCYTsBPrkxaJ+4E896uEPvzLWFIVIT0Twi4/hJVJAzMRRuJMLJ+DgNpm3xKmnXLDHUH6P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gRkfAeS6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5786maue017929
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 Aug 2025 08:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gdpKkg3HGmZ
	RyeizFHxrsWvpDDfvGRJLvLm05RIe+XY=; b=gRkfAeS6fKgZ+079cxiajdKtR7E
	cqqqzmmVU2wbqOSqLc4mvErqanRsZIniYGBqzoL4Rt5LBiT5CdCvjJjaqZY3RU8c
	up0Vd5LqUWkthe+Qa26I+Aqr+WrxThywiuNGByhIcvqbDTLTY3+DoB6kOvSEUiT1
	YF7KvbuOAwVz6ACSnYhIyocfKr7fvsctN7oZXI/mfSSbxOQ9uCJwuz7+BtrsvX3O
	a2iiYT9LEKgehAWl/OP1+vKj37BBdAyZNYOAbixarYqYcyeJb+MdhAiBoOCU2Olg
	57V4Tz74sZaMERJNqyyBPIJbB6UDbOCeLZnuwFcpCsC3CQRbAi60USlCMwA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c586exuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 08:49:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4af199d0facso55178181cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 01:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754642978; x=1755247778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gdpKkg3HGmZRyeizFHxrsWvpDDfvGRJLvLm05RIe+XY=;
        b=xSikJH6CeKiwSQZ5q2jxXil/PaZr9RXCvgIPch6Bm/Ci0WKaXI7AZ0IYXoCOKB52da
         Crbe0vcy7PwA98O3Ul1s6XIZ4dnmbKO3NunKSoQ18ANsL0PSERclwC1EBCvtCJ4mmzgD
         sClIlr95KewvsdfSd4HlNPihd9Mw+Ys4+l3+sMrf4zmskexAq7nade9zLpjG0m1Co9eq
         HhNXBcP7Jgbp/PEaXNBB7/DJPHZr00wKkE/NwfWPkXUkktg2nSwXwzDCxiSp4vSZCg/R
         UJqgBHfl+XSjATihzo8wOUTHqQBqjyqiUvFfLhpbzAwEJ0HLC3SH+i/c3c/TOiZpUflN
         2pxg==
X-Gm-Message-State: AOJu0YyRNGS1nF3/eBmGfP/HtLyqYR3PCeeD6lcqtj1PDSm1S/XNfR+s
	8NHMaQsjb9VsL/uhzhcYJc5Jb5iQAf5vRH4L/JYkIifJ9+yiUVAuhurtfb8sXIpdeGz9Kz7tqFc
	vuqYzvKkeYqwXSTeM8cRFPJ0EkmPZJX5h6fohmsEIFkXh4wfQx1SeGCP3YUKSZ3KoeIeD
X-Gm-Gg: ASbGncuQTgGojhQTEmUmdWNrHpkY5eKreHkzPec2CL9t6Zty3JcF2Wmr+XAQPcjyrcx
	+z0n3eXnHHkksDx8bOPkzLD3IEOEXqlesMJGvyHzHvHeehwkBAIvAYKuyakn46KiOjyFzy+lVAr
	tI3glYSB2JnMykOjVv4mlIsDgRzhDdrQjB8PJFJzGSq20O1+lELG4pc9QihgfyPexkdUy3fLVn1
	oxucfQJrvxaYHq62O5nDvGgk6BLEhmfWrfvw1kC0t92MzJ89BmvMN46k1vDEr3UxqWac71uDEra
	euYCwnQQHM4EdIWwbSVeK6qEKYCWHsJAGnJ5P0/jvqAtM5yR+bDl9qJgGJbNBQfZGd6HHk9REEt
	T/y7jvDSuUq2M
X-Received: by 2002:ac8:5e4b:0:b0:4b0:7db9:92d7 with SMTP id d75a77b69052e-4b0a06eefbfmr94523701cf.2.1754642977620;
        Fri, 08 Aug 2025 01:49:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEguep/u/Npa26sKOi/vH/ZjbSdbK+aUw3YEpsOPlBPMGTppeQE2XwHp4/7VlNOhHsDaotKjw==
X-Received: by 2002:ac8:5e4b:0:b0:4b0:7db9:92d7 with SMTP id d75a77b69052e-4b0a06eefbfmr94523471cf.2.1754642977131;
        Fri, 08 Aug 2025 01:49:37 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e58400f5sm122904295e9.2.2025.08.08.01.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:49:36 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, konradybcio@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 6/8] media: venus: core: Add qcm2290 DT compatible and resource data
Date: Fri,  8 Aug 2025 10:49:21 +0200
Message-Id: <20250808084923.1402617-7-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250808084923.1402617-1-jorge.ramirez@oss.qualcomm.com>
References: <20250808084923.1402617-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AMJ-TgK2NPBC7YR0SlbW4SU1jvB9_djm
X-Authority-Analysis: v=2.4 cv=MZpsu4/f c=1 sm=1 tr=0 ts=6895ba22 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=5fA-3PHwp7xA7VOvTvgA:9 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: AMJ-TgK2NPBC7YR0SlbW4SU1jvB9_djm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA2NCBTYWx0ZWRfX73udAreHrmwN
 x2+Hwmx9uGIBHreYHKDUITEsEKmlHKAZSTRs18o60aKO193bJl/QRDnixnty0CYq1j09yJvoPAX
 rDxbCTdpfVzCWafApMI2XiHPk71B8D68tSt/vF376UkgFDjdHHchGi/jdQbVuyi6p37n1UjibSw
 VMexxsnmLSCQ64PVmKA8JGSMghjh1Tiut8dGfUTU9lgnc4k3Fwq/W35ZyrUQFTaKypTA8tUhpo4
 rfcYpfq32LsaCmQKkCa0kk7bo+KVLHTguFjuMQoLgsrbKlexlwWcyJuN7/AfrDCFoWELZHZ/Ga2
 q2d07yYPq1bdOYjpaBTvxsPguBlWBYe+w0LH6z03gIR7WAYJv1yxn/DNhzJ3Zz4fnBrc9waXQSL
 tfAntl8y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060064

Add a qcm2290 compatible binding to the Venus core.

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
index 9604a7eed49d..a7c960d1d818 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1070,10 +1070,60 @@ static const struct venus_resources sc7280_res = {
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
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
+	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
-- 
2.34.1


