Return-Path: <linux-arm-msm+bounces-62003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCBDAE3772
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 09:52:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4F57189587B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 07:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5D3221FDD;
	Mon, 23 Jun 2025 07:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="muVQYezh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D6C21FF3F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 07:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750665003; cv=none; b=CxkNqAusi+/6lIUA1I7n0cBn/LFgf1JkpuaI+HGJreXbr0eoeO+7vThiYqwN59iBWIwlOVxnD4VGj/w8DAMAuRlMyY1YKFignTLiomZzNeXy1FE3m8oRW8V6DNWBBzM8uiB3Ox8JizshFozSgN1zK89bGqKMHfhx6CCek3x/8NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750665003; c=relaxed/simple;
	bh=cH+A+MjcVGC/i2HYnkR3s9WU3JModY4E/GfJacde7uY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tpo5M3uyBuCe/WzUTP0jucKBQk9Lck8T/fePF3oRBEiBYV9YBedmpfjDqH+VPVQVdlNHw26rA4I63eGXyWZ+YRS2DaNeBIR0oamr3oKyYYJptYXeFyvNEEGtkfpTHy7KbgIc90/fL3u3hBVm6kgLA5Xu8Qpzn9FEu/eNiHpx1qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=muVQYezh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MLpMAU000884
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 07:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8J4xLisib0P
	UNCX7F+6K1Pljmp1lAqOEWPlHd7U8+GU=; b=muVQYezhMoadTJs6WisDWTZD9gi
	jogcEItcj7Vi0F5tUZjspsf+zhPwoYNit2GBWJR4zBGWOtfZwowjADHkehOw8tos
	VTiWl6CIUkriJXH43Bvmzovc22wyFbN6ZBX56KDy2FAybdKREUA7EzYp1YEwLKw1
	I0YtfQEt0IY6sLtruhYTZyt5xdfHjB6KRWA2GCuHWCyZY7oR+gGI80ml9jPjvRGu
	6tlByTz3/qhkV+LeeIOS0Y2z1i8Jl6QlqNwlno7VEOagLT9hBoTupIvJr9WdkDqM
	jabScxQPYTPkWDQ2phpoHsywQei1mSDhayCuzkqNUkbJrgYJpTSpsljUi7g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eh1fsnnn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 07:49:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d400a4d4f2so433325385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 00:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750664999; x=1751269799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8J4xLisib0PUNCX7F+6K1Pljmp1lAqOEWPlHd7U8+GU=;
        b=mfOylon1hxqxw93ZCdjWfDhjZYvK4q0V98+cUjLZCuTDq08RDrp5a6hJdotdVGye8r
         XADONj43s9/zFfMnhS/o/P0V9rZu2iQuJ9zdul6o0660ZNuX1eLdBOWaZzpVxCEUf2uz
         bqOB2t4AMCrmwT9zdogja6OHt7z5U2T2RAhrXDFb3rAbWYvtyve2XUm0urcu/MMhxdl8
         i4knGVTIV130HkD8I6ovpW8m4HlaMIJnjqCQoAtRgCklhx1NYoSA6SGcDIJ1/g49a6dX
         jbINln1pFzU5vNRg6G4K22LZiTtXeBFRyhlhoX2MS6WUIyUpaFIrHHcc8KpGJkpFuIv7
         eqZw==
X-Gm-Message-State: AOJu0Yw94mzGKFXOVQi88XeCIJU9SJNcbFBt7Gp7B3loX44R+EPbV/jV
	v/ipw/c4YWPAyqfQKFdJYcfX6cgsJYjJUV3muQj9d1Z9rGsFa5ymCT9CAZJGfrucc74VxAllkpe
	NJz3f18cKOUt4LXBXiUz/fv4I0NSlm5vpxSCrXldxLMdp9wKJwspDFeyxYADjgy11pJBh
X-Gm-Gg: ASbGncti7zHMN9eWKRrx4QcrM1brHqUKDrBdr/7FxFa+08f1s06pJgrV2fHoCG3wIKI
	4Iq4r5+/xmToBZwzRRtQ0VZIZwOQUYnNPGwgT5IH4yhuVN/NW+tWqrZC4ildIouvGYwRixgsr/v
	yhtpX6+dwMOLC4+50zeXD3M4L34jAarCjGRJ/sRMJn7+nsh3RVO9N93BufaWNtRfxCz5EwqwtdF
	8WaIaTL3SscWSUY562TcJWrt3dVmX836nZ8lb5x+UEnBngCFHHO8kAe9aeBahMQsgitd/MDqPJe
	0X2swFdB186EGLgThsLMNyiYgt4RK5c730LTHe43y5pp6BWwrnWy4GXDxN7lb24pTyU16icDMYu
	k
X-Received: by 2002:a05:620a:4403:b0:7d3:a52a:125 with SMTP id af79cd13be357-7d3f9923f0cmr1477814585a.26.1750664998687;
        Mon, 23 Jun 2025 00:49:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGGPyNOllQk9/Q2F0cGH3t0SOxPclBqyGCztEZ0NQrWXoprecRp0lVRoYZaMH2VHLGHf53KA==
X-Received: by 2002:a05:620a:4403:b0:7d3:a52a:125 with SMTP id af79cd13be357-7d3f9923f0cmr1477812985a.26.1750664998238;
        Mon, 23 Jun 2025 00:49:58 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f17ac7sm8755313f8f.23.2025.06.23.00.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 00:49:57 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] media: venus: core: Add qcm2290 DT compatible and resource data
Date: Mon, 23 Jun 2025 09:49:39 +0200
Message-Id: <20250623074940.3445115-5-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623074940.3445115-1-jorge.ramirez@oss.qualcomm.com>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250623074940.3445115-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aflhnQot c=1 sm=1 tr=0 ts=68590727 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=6h1BjrdT-BD1Ylfs7NgA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA0NCBTYWx0ZWRfX1PAFDu55RUvm
 pLn7VndDcxrCkuiWV4N0qTQUeELxmVIJDCKzpfGh8DhB9jvuu8pb1KkAU/2sb/ESXNAAxhbYOKp
 zWlLDMjF2Gfzg9BRqlVFpRq9L5f+owHiGVeuQiKZzQosUq0tdUmxaswd+C3OiSKGD1QahBGuolq
 sPktpazu9DKr08PFwQyYjb/5yYzBVIUufkyHIx+FPYxoeOQbbU3ieLpiFnr9m3OOqVeMdHJa2T7
 h2pOhR9S29hc2J+uyyPuk63aDJ3ytYf5AcqN0GdiHttElo3OjeO1UVE8+v8O4eI1hF99JkCH2i/
 RUdc8ew2fGMnNSZUir2K9V/ctWO+zQsyjI5HblpyPgUGhPGXYX0EZj5OaacwXJzanwl9XkRwt/q
 lo1U2auGWirAh/bDCPfprAAMIrxY/AARfzVi3ncwAJBr6INmvtqk/hY1jsVpnoZBhmq9jVdq
X-Proofpoint-GUID: sQsVWkZiY6ZiFw-84_ZDpy8ykIf7n-v9
X-Proofpoint-ORIG-GUID: sQsVWkZiY6ZiFw-84_ZDpy8ykIf7n-v9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230044

Add a qcm2290 compatible binding to the venus core.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 40 ++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 736ef53d988d..81fcda8fb4a1 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1062,6 +1062,45 @@ static const struct venus_resources sc7280_res = {
 	.enc_nodename = "video-encoder",
 };
 
+static const struct freq_tbl qcm2290_freq_table[] = {
+	{ 352800, 240000000 },	/* 1920x1088 @ 30 + 1280x720 @ 30 */
+	{ 244800, 133000000 },	/* 1920x1088 @ 30 */
+};
+
+static const struct bw_tbl qcm2290_bw_table_dec[] = {
+	{ 244800, 2128000, 0, 2128000, 0}, /* 1920x1088 @ 30 */
+};
+
+static const struct venus_resources qcm2290_res = {
+	.freq_tbl = qcm2290_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(qcm2290_freq_table),
+	.bw_tbl_dec = qcm2290_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(qcm2290_bw_table_dec),
+	.clks = { "core", "iface", "bus", "throttle" },
+	.clks_num = 4,
+	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
+	.vcodec_clks_num = 2,
+	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
+	.vcodec_pmdomains_num = 2,
+	.opp_pmdomain = (const char *[]) { "cx" },
+	.vcodec_num = 1,
+	.hfi_version = HFI_VERSION_6XX_LITE,
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
+};
+
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
@@ -1072,6 +1111,7 @@ static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
 	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
+	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, venus_dt_match);
-- 
2.34.1


