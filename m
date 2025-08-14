Return-Path: <linux-arm-msm+bounces-69153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B97FB25FB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 10:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B8011CC027D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 08:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8E02EFDA5;
	Thu, 14 Aug 2025 08:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rawq7ftz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C2F2ECD31
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 08:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755161586; cv=none; b=mEnKL555vzMr7Lyh+Fnc8B3/Xuiru+nE7P9Z1nEY/aq34mytvLaQIa9FuEpoNsU/U2yoLxiedD/clH8ACcX2BqraiJzYTA1C5C9jKN3O1c7/K/ANKM0SnKwjKWWtd/aJFW6G54/NlcTO6im4gHG/kz5hhFXOcBJosBwv9SvL08w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755161586; c=relaxed/simple;
	bh=3Yu4YRTqSg1zXYTpIyN2rJ/1IKFOnJNPBhgRAh5ZGNo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CkUB6ofVO5PUhys8sU0fElbl6HBbCANgVcN1bjmhL1r3WEYgxGseucPAWN1zq/yTgIhDceE+GObxWIiT6iJ72D0mpY6rVuV8a/emLlk/ShUF0jS48T/CAW0SkDyLDB7o4o/aMq4UsFPppVH/0gGb0mZQZrvAnIViADvz36QOCyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rawq7ftz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DLrdOX012543
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 08:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Wq+5fFLLIUz
	p66ajnRYUduOzP75SP1IxkQPm7IsLBtg=; b=Rawq7ftz3WydsXDuOyccZaSqMGw
	QGhP30/wyReidZZvBcZ+MQQsNr6s53wn0jQhjW0aR/p4QcBHAWDQgwSB2xIyW9JQ
	uamaWkHnJpuxQrC+CkbiUY8zpGDOeC/vPAbQzvgf9F4d/kFUGua2Tld/l5j9wTaX
	HTr/pKxcMibWFQPZHtHiMvN8BaeMxdArBAn0BIeEBoHwXg/Q5X1nkJ/lMgMq430y
	gNAJZl1woGDOQe8xFaiR1zOAKGWKWzwN5YPNe6kgiAMY4hcB8apYonee2ZYDK+EY
	Ml0ZkvVmsJynProG5E66Htgzr/OcBSkQhFZhIu4tgYds3YTzOujr82Vrw3g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhxd6aj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 08:53:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b0faa8d615so45828591cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 01:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755161582; x=1755766382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wq+5fFLLIUzp66ajnRYUduOzP75SP1IxkQPm7IsLBtg=;
        b=Lfn+ZLepV8UldaD7k14Ye86ItDB64SPAzS71DNkUobIrc/hjXbrgkiWYuNGSBbMrC5
         TWpJOgdoQEWjFF6SZNJQCaOQfz4KOMoEuj6BF1gmhUhzGzLU2S1/ViCZdRVDYMLxqUzE
         GpUXwzxN2UBn9mDbJ1CqK6f/kFRAOoqDLXbyuHrVtkgKlIsIyQU9/qTf9Yd3J5qv1AmC
         uGkiY0659m1ZaAc7DxN4u9LAJmymZfISE2QmQxBlZkuueJqQ7f1SISMw6qTkiAGwCuS7
         H70WY8vSTyGdtd77DEAVDdAsqn5sHx9OM+FGq9eeOyjr8g7Wtbp6ZV2WB5m9VJk0A0UF
         QPJw==
X-Forwarded-Encrypted: i=1; AJvYcCVrW+QDOv+SroCb/4wByMLXgFfHSQquhoRsolQSNXgAcgP44+hNI2BOJTNBZJZ2kV2F4SQZlQaodwk3WwRC@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9DjRkXZWpH4czi1OwJCeOmhJD1mTMEGxc3TnC8FGazuosaElT
	aLItRGAx7+uFa3YiXnJYrub1yP+CTLGx7T6ZywU2gc/nn/vIQQrXYLdzbV6CcYlfX+fKH9hIFLt
	P4edvBzECxC9ZiUFmSMCuu4V2lJDvnIT9WvCRhRDYL8grQo553C0FUPuoLMu7dJ03xtq6
X-Gm-Gg: ASbGnctxQSRelOaX8i1nRH+H0SG+X8ZB50aWtBcgOOmxIBVJw5KGvrTzkoIW8TN7kdT
	ydKjCK5M6zCGrtrYcEUU1ehfppFlAlougdY3WpyX6kF5nLwMKGXvfS531jTK4FGDhYzBJVmphjp
	0nqGHwL/QY9FyrGwgeComMAf1xrMjw6RkTLe9wFARHFtZW3uJwidFf6hvNPjOhESYxlJLlhYgaB
	eNGBpBDlIDyo12U1qiltsmzttvpSNpng9dhQ2j+o3laHLProeeck06MWIMzkF+NDtX+BqFz9zhF
	0LbuF6a9Kmm00Zqek8hnOVb5PzfWzr1KiB08Bp31uoFjfs74kmr/nH2l0tKv+Ydvm35VRyvNBxI
	IJUx05by+Kh8p
X-Received: by 2002:ac8:7d12:0:b0:4ab:63b8:3320 with SMTP id d75a77b69052e-4b10bffdce8mr21509871cf.23.1755161582201;
        Thu, 14 Aug 2025 01:53:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbCJhhwINAU6zsIVUj0FUXSUYhKMewKYSebZl9Jrf4JlH0c2h4fQT4SdU+0VvyGI9Vf9VRAg==
X-Received: by 2002:ac8:7d12:0:b0:4ab:63b8:3320 with SMTP id d75a77b69052e-4b10bffdce8mr21509621cf.23.1755161581708;
        Thu, 14 Aug 2025 01:53:01 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bc93fsm13155895e9.2.2025.08.14.01.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 01:53:01 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 6/8] media: venus: core: Add qcm2290 DT compatible and resource data
Date: Thu, 14 Aug 2025 10:52:46 +0200
Message-Id: <20250814085248.2371130-7-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814085248.2371130-1-jorge.ramirez@oss.qualcomm.com>
References: <20250814085248.2371130-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX/mCed+jEBI08
 0BbipzLsbEfKXunqkYA2TfZyel+45e70QcC4oMwSigor6etBna3es9itUGXl4/WyBq4QUEGVSKk
 Y3+pj5x48qOoQgWyfQuFOgTWE2sBxdZuA9TKbgWDbYnTOQStNFs9PGg7+YEWftMVI8D6b6EtF07
 ZKHo7cwrqPbm29XNwtQ4VgfatSmVLMt6jLlobkFIrdzrrvpzmKPR7BRFX9wT51YsmuHqsj5Eqdc
 baCx9G7m5kVaQ01hWSU9iv7GW4gKX7S+3+dqr4Y8+w5WkxGZUnrDwiyMrC1QSxReVePMyqI9GyM
 GQeItGX6em4YgeQ63mlaIbiUilwjfx2Xy9usxqUh5cpUzMbVfjE9OYKNIfAWtYTmNHwL2yvPSWW
 LphNgEYU
X-Proofpoint-GUID: 4Zy1eoGmiEGxtOeA0KqqGVq3-DW2_8G6
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689da3ef cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=5fA-3PHwp7xA7VOvTvgA:9 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 4Zy1eoGmiEGxtOeA0KqqGVq3-DW2_8G6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

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
index 0ff48c92749c..abf959b8f3a6 100644
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


