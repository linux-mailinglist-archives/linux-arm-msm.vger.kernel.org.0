Return-Path: <linux-arm-msm+bounces-110085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGUCEqUWGGoAdAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:19:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 959F15F078B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE29D31F8602
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 10:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D2C33B5E01;
	Thu, 28 May 2026 10:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VgNfazAL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zfp2DRtS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DC73ABD8E
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779962874; cv=none; b=Q3g2JAuIvjgvJ2MFKuW2lBsDVzCPvIIyiU46keyDgqaEhjlaALBcG4U55U2MvjMKl0IOGfm4X+oMdMtz2/kbG3wZgQWIUKOvvRrfYijhEsJpLlAW10ZErcLLxDs4Oyh3AWF1EYDgtTnhGsrgGixgTMZUw1IoioFx1FYxEbfRD7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779962874; c=relaxed/simple;
	bh=0bpujqBXj8ybvFop9bYyotPQK8jlJ2ekGPANR3iA7ac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UGThQQ2QEL/WncEyMMqrRe0Bv9bnJNTXKtWQf6dXVDQO5Kly03HGIeePa3+xXLMyazVl5fWkCU+3iU4a20YzZ0qJ03ayH+ZV9IIOt3j1GZWxmwX2IatZhIoRlUrFeg3bAPoAndCkZOJ2eoyDCMvC73BckTjWqCdsitGSJ+zJ648=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VgNfazAL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zfp2DRtS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vbJt566533
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3RwriUHLcTIRS+XdQpTMw9i8MGJ5W63QMAIYPHkoS/4=; b=VgNfazAL9a6dxoEP
	Fx/f1rsvXchmkI9lIEaBLYbFRrljnbAR1WP14dJXYeSaX/6c5wSKiS3mhjO2MG2l
	pMPK0RAhC7G+Ie3Vc9assFs1P8adNqUhBQGdy89DxJMWq0ezhPJjPTkatgWRKO2l
	zOWoenMt4FVDoKpxpFDA5WKJl1m742F4Mx3rWmjvt9xrSwzSBioKTiapEHCi5uEE
	BN/yRZ/cVa4CFqg1QpeSlGUobG4wPlU5/nQcEivDKVl5kiuI8nHsua/hSez5DxSg
	UW6Z9EwLIwE8XuJzvQDBccBr6Mlf+aYCXbF4GiQtweFO4nAmvYmYzk2Su786OOmi
	Dx4kLg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynja6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:07:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36b7c55406bso650046a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 03:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779962871; x=1780567671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3RwriUHLcTIRS+XdQpTMw9i8MGJ5W63QMAIYPHkoS/4=;
        b=Zfp2DRtS0R+ajY8J51pQiJTxLaINyz0NhVlL3+ERh4FUMg+RDN/otOFbAxfE7Y8Wsw
         ptHOTVtbso6fIUJMj/6r6MPBViIKIESSmjb0q4Zi/zMaT+MGSocrSjrgHRxydEN3eobK
         SwQLuNuM/QdrGdGLF657rDc/V88anJMGJURla8R+1dSiFmY6fLOUr7N5ElO3LafkpbIb
         yvuz0UsAOaydM2eNzDAaDq2SJzzOwO6VkWceaDb8mE2VuUT91S3SEmgnxCHe0pbjDsB0
         YRxaK3uVcptOzPHqEoGjCFILSGNMmNflYNQwAy/c1pM09cefrteiqv/Mxr3kcAo7Q6cc
         QNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779962871; x=1780567671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3RwriUHLcTIRS+XdQpTMw9i8MGJ5W63QMAIYPHkoS/4=;
        b=roGLgm4eQtiQTxmNzULv/srhhwNTMnZFuiUcUx9L0UwUdXmU8nlhbirDBTZARuPmsk
         SppZlnoKvmPN36cgdlp46eCwOR6i0SzRUr4/V6t/+miCP7GiebozvZhnfKYWxlmy7zY5
         kpDv2n88SVXZF7K6vmf7tsowjDDKaq6u3rgqEqMGZaeMRKUeLhWUsUONcW6LHMOR1GoD
         Oa8byJU7ueYQVJeZtfKuXZnwemCrnvZlANJaSI70WujcqweDS2MDwVOsr3NLkVYe+uL6
         OajcF3wdtFaxcsbiNqxg+fzwD2LyHPQv0kch2TjYat25vfxdc2KU+hDCb2q7py1P47tS
         2vCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/uHYMoD0LbSiLO+8KPvKy9UBQpYDRV2JRi+gwC07P2DjvcviBTO3iM/z+uFXLpnNxxaO4nhSgXJ44h1tVI@vger.kernel.org
X-Gm-Message-State: AOJu0YxUsYrwVxKue6ZhAhZpWmUjtgqozhTbRcaUP3OhpTWbGQpqDoF3
	F/1nadH3aOU1Tvo4sdENmpwqKNHU1bU/yLtPzSq/sAThh3elZXvjVgypTki7PAwGfAwawkNvIVp
	3DlpydnRLFRSNb0O21C9N7OfZV8fw51snaKNSsg3vSjC3sYY4CJWIU3jAvFZksxvwAfu3
X-Gm-Gg: Acq92OHuKX7IYlSoYNV73x6ROxi9rCXjgLUKAjOiUTNl8AuuvAFK1Gpz3gvT1Gh4lLs
	5xitmuVh1vReBWmZ0x45En26pElKVyLRhGbB4AB9UJMrafhoCkc9+Nlhk1ZjQWjCzMT7ufjrfbr
	eiv+7ZMjhKQiC9g07s7bowerBK8lw0hiifJ81/r4I+sv4nwEOjjJH6dXkhPtkXKD9V1sxdjEE5m
	XrHJ9Y4d6+EVmnqEmViedNEXExAu7p0Uk2HIA1d8V8zB+G5j5BzQgMrDSfHayBxSi221c50kotK
	0PKHQAKNIyJ1R41216z8OwVi4rqSULu8JDsHvRFJXDzfRwJaoXDi1RAwS8hoB1RKqEPEJf8lYZb
	y80UZEx35eaKrI/mCR/Q8c0Q/V24wlu6h8/Us7qz/FlHtnNEE4HpDMlk4otVtxRc=
X-Received: by 2002:a17:90b:2f84:b0:35f:b714:e516 with SMTP id 98e67ed59e1d1-36a674f4399mr26552783a91.16.1779962870767;
        Thu, 28 May 2026 03:07:50 -0700 (PDT)
X-Received: by 2002:a17:90b:2f84:b0:35f:b714:e516 with SMTP id 98e67ed59e1d1-36a674f4399mr26552726a91.16.1779962870174;
        Thu, 28 May 2026 03:07:50 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b7e38af60sm575296a91.1.2026.05.28.03.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:07:49 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 28 May 2026 15:37:06 +0530
Subject: [PATCH v2 5/5] clk: qcom: Add support for Qualcomm GPU Clock
 Controller on Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-shikra-dispcc-gpucc-v2-5-953f246a0fbb@oss.qualcomm.com>
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
In-Reply-To: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: NKkEyO87chPJ1D-eKIWfWkiVZ0-bb2KU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEwMiBTYWx0ZWRfX49yz0w2A8FHv
 srJ+vdMq5hTjupI3zZkfLruWYxq5I8oJxBe0blT4a4hXklmXYdQqQrM1XWepQzK533FMU4OHx3o
 bN+qm/zRAoTa6K5+Z4GI8bLO9XmZQSOyQE6oU4M8kedQCLbVCWFiX/cU6m4nwbMat8CyX0Hqr4L
 Yn68/ppK4zy/+LE+qHyYIUQHdOFxYobvo1NhbX/zIo+a6GZeeDa/oYeQggY0EOW2Vq3C1JsqJhk
 1ublXH1FlQfWcFVIna2N055WiQ/iIG1+UTAsaa1/u/kJOoU2tuHm26y/xgOBH7vE9VCw+iqSbLj
 CdUN7aAcxhj2ZoHYOfHYk4MV3l7cvKaVAkAPTMUiIxOZDlkWgefTc9o7KzN2r3eGFvAhjg/F0hK
 aXVfmTP1plF/LehZMwecblSe+SAC7g9WMEsZtW87EPoZveyGsbnlHO4FYxn9aaHRaTPmaAMDAf/
 ROiiPnyX6cnIphNS8Gw==
X-Proofpoint-ORIG-GUID: NKkEyO87chPJ1D-eKIWfWkiVZ0-bb2KU
X-Authority-Analysis: v=2.4 cv=Eo7iaycA c=1 sm=1 tr=0 ts=6a1813f7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=h4tiyZWTG5MJAiqrTW8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280102
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-110085-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 959F15F078B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
hardware block, with minor differences. Drop modelling of critical
clocks and keep them enabled at probe time, update the QCM2290 GPUCC
driver to align with the latest common qcom_cc_probe() model. Update the
GDSC *_wait_val and flags which are applicable for both QCM2290 and Shikra.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 174 +++++++++++++++++----------------------
 1 file changed, 74 insertions(+), 100 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index dc369dff882e69a8c0acd260953d5fcae9453120..296afcbfe0c9e4e147dcbd8bca807e8e4c50e185 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -2,14 +2,13 @@
 /*
  * Copyright (c) 2020, The Linux Foundation. All rights reserved.
  * Copyright (c) 2024, Linaro Limited
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_clock.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
@@ -20,7 +19,7 @@
 #include "clk-regmap.h"
 #include "clk-regmap-divider.h"
 #include "clk-regmap-mux.h"
-#include "clk-regmap-phy-mux.h"
+#include "common.h"
 #include "gdsc.h"
 #include "reset.h"
 
@@ -46,6 +45,7 @@ static const struct pll_vco huayra_vco[] = {
 	{ 600000000, 2200000000, 1 },
 };
 
+/* 710.4 MHz Configuration */
 static const struct alpha_pll_config gpu_cc_pll0_config = {
 	.l = 0x25,
 	.config_ctl_val = 0x200d4828,
@@ -57,11 +57,12 @@ static const struct alpha_pll_config gpu_cc_pll0_config = {
 
 static struct clk_alpha_pll gpu_cc_pll0 = {
 	.offset = 0x0,
+	.config = &gpu_cc_pll0_config,
 	.vco_table = huayra_vco,
 	.num_vco = ARRAY_SIZE(huayra_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_HUAYRA_2290],
 	.clkr = {
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(const struct clk_init_data) {
 			.name = "gpu_cc_pll0",
 			.parent_data = &(const struct clk_parent_data) {
 				.index = DT_BI_TCXO,
@@ -80,10 +81,10 @@ static const struct parent_map gpu_cc_parent_map_0[] = {
 };
 
 static const struct clk_parent_data gpu_cc_parent_data_0[] = {
-	{ .index = DT_BI_TCXO, },
-	{ .hw = &gpu_cc_pll0.clkr.hw, },
-	{ .index = DT_GCC_GPU_GPLL0_CLK_SRC, },
-	{ .index = DT_GCC_GPU_GPLL0_DIV_CLK_SRC, },
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .index = DT_GCC_GPU_GPLL0_CLK_SRC },
+	{ .index = DT_GCC_GPU_GPLL0_DIV_CLK_SRC },
 };
 
 static const struct parent_map gpu_cc_parent_map_1[] = {
@@ -95,11 +96,11 @@ static const struct parent_map gpu_cc_parent_map_1[] = {
 };
 
 static const struct clk_parent_data gpu_cc_parent_data_1[] = {
-	{ .index = DT_BI_TCXO, },
-	{ .hw = &gpu_cc_pll0.clkr.hw, },
-	{ .hw = &gpu_cc_pll0.clkr.hw, },
-	{ .hw = &gpu_cc_pll0.clkr.hw, },
-	{ .index = DT_GCC_GPU_GPLL0_CLK_SRC, },
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .index = DT_GCC_GPU_GPLL0_CLK_SRC },
 };
 
 static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
@@ -113,7 +114,8 @@ static struct clk_rcg2 gpu_cc_gmu_clk_src = {
 	.hid_width = 5,
 	.parent_map = gpu_cc_parent_map_0,
 	.freq_tbl = ftbl_gpu_cc_gmu_clk_src,
-	.clkr.hw.init = &(struct clk_init_data){
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "gpu_cc_gmu_clk_src",
 		.parent_data = gpu_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_0),
@@ -133,32 +135,30 @@ static const struct freq_tbl ftbl_gpu_cc_gx_gfx3d_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_gpu_cc_gx_gfx3d_clk_src_shikra[] = {
+	F(355200000, P_GPU_CC_PLL0_OUT_AUX, 2, 0, 0),
+	F(537600000, P_GPU_CC_PLL0_OUT_AUX, 2, 0, 0),
+	F(672000000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(844800000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(921600000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(1017600000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(1142400000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
 	.cmd_rcgr = 0x101c,
 	.mnd_width = 0,
 	.hid_width = 5,
 	.parent_map = gpu_cc_parent_map_1,
 	.freq_tbl = ftbl_gpu_cc_gx_gfx3d_clk_src,
-	.clkr.hw.init = &(struct clk_init_data){
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "gpu_cc_gx_gfx3d_clk_src",
 		.parent_data = gpu_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
-	},
-};
-
-static struct clk_branch gpu_cc_ahb_clk = {
-	.halt_reg = 0x1078,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x1078,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gpu_cc_ahb_clk",
-			.flags = CLK_IS_CRITICAL,
-			.ops = &clk_branch2_ops,
-		},
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -168,7 +168,7 @@ static struct clk_branch gpu_cc_crc_ahb_clk = {
 	.clkr = {
 		.enable_reg = 0x107c,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(const struct clk_init_data) {
 			.name = "gpu_cc_crc_ahb_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -181,10 +181,10 @@ static struct clk_branch gpu_cc_cx_gfx3d_clk = {
 	.clkr = {
 		.enable_reg = 0x10a4,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(const struct clk_init_data) {
 			.name = "gpu_cc_cx_gfx3d_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gpu_cc_gx_gfx3d_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gx_gfx3d_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -199,10 +199,10 @@ static struct clk_branch gpu_cc_cx_gmu_clk = {
 	.clkr = {
 		.enable_reg = 0x1098,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(const struct clk_init_data) {
 			.name = "gpu_cc_cx_gmu_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gpu_cc_gmu_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gmu_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -217,33 +217,20 @@ static struct clk_branch gpu_cc_cx_snoc_dvm_clk = {
 	.clkr = {
 		.enable_reg = 0x108c,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(const struct clk_init_data) {
 			.name = "gpu_cc_cx_snoc_dvm_clk",
 			.ops = &clk_branch2_ops,
 		},
 	},
 };
 
-static struct clk_branch gpu_cc_cxo_aon_clk = {
-	.halt_reg = 0x1004,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x1004,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gpu_cc_cxo_aon_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gpu_cc_cxo_clk = {
 	.halt_reg = 0x109c,
 	.halt_check = BRANCH_HALT,
 	.clkr = {
 		.enable_reg = 0x109c,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(const struct clk_init_data) {
 			.name = "gpu_cc_cxo_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -256,10 +243,10 @@ static struct clk_branch gpu_cc_gx_gfx3d_clk = {
 	.clkr = {
 		.enable_reg = 0x1054,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(const struct clk_init_data) {
 			.name = "gpu_cc_gx_gfx3d_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gpu_cc_gx_gfx3d_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gx_gfx3d_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -270,11 +257,11 @@ static struct clk_branch gpu_cc_gx_gfx3d_clk = {
 
 static struct clk_branch gpu_cc_sleep_clk = {
 	.halt_reg = 0x1090,
-	.halt_check = BRANCH_VOTED,
+	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
 		.enable_reg = 0x1090,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(const struct clk_init_data) {
 			.name = "gpu_cc_sleep_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -297,11 +284,14 @@ static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
 static struct gdsc gpu_cx_gdsc = {
 	.gdscr = 0x106c,
 	.gds_hw_ctrl = 0x1540,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gpu_cx_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE,
+	.flags = RETAIN_FF_ENABLE | VOTABLE,
 };
 
 static struct gdsc gpu_gx_gdsc = {
@@ -309,21 +299,22 @@ static struct gdsc gpu_gx_gdsc = {
 	.clamp_io_ctrl = 0x1508,
 	.resets = (unsigned int []){ GPU_GX_BCR },
 	.reset_count = 1,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gpu_gx_gdsc",
 	},
 	.parent = &gpu_cx_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = CLAMP_IO | AON_RESET | SW_RESET,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | SW_RESET | CLAMP_IO | AON_RESET,
 };
 
 static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {
-	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
 	[GPU_CC_CRC_AHB_CLK] = &gpu_cc_crc_ahb_clk.clkr,
 	[GPU_CC_CX_GFX3D_CLK] = &gpu_cc_cx_gfx3d_clk.clkr,
 	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
 	[GPU_CC_CX_SNOC_DVM_CLK] = &gpu_cc_cx_snoc_dvm_clk.clkr,
-	[GPU_CC_CXO_AON_CLK] = &gpu_cc_cxo_aon_clk.clkr,
 	[GPU_CC_CXO_CLK] = &gpu_cc_cxo_clk.clkr,
 	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
 	[GPU_CC_GX_GFX3D_CLK] = &gpu_cc_gx_gfx3d_clk.clkr,
@@ -342,14 +333,30 @@ static struct gdsc *gpu_cc_qcm2290_gdscs[] = {
 	[GPU_GX_GDSC] = &gpu_gx_gdsc,
 };
 
+static struct clk_alpha_pll *gpu_cc_qcm2290_plls[] = {
+	&gpu_cc_pll0,
+};
+
+static const u32 gpu_cc_qcm2290_critical_cbcrs[] = {
+	0x1078, /* GPU_CC_AHB_CLK */
+	0x1004, /* GPU_CC_CXO_AON_CLK */
+	0x1060, /* GPU_CC_GX_CXO_CLK */
+};
+
 static const struct regmap_config gpu_cc_qcm2290_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.max_register = 0x9000,
+	.max_register = 0x7008,
 	.fast_io = true,
 };
 
+static const struct qcom_cc_driver_data gpu_cc_qcm2290_driver_data = {
+	.alpha_plls = gpu_cc_qcm2290_plls,
+	.num_alpha_plls = ARRAY_SIZE(gpu_cc_qcm2290_plls),
+	.clk_cbcrs = gpu_cc_qcm2290_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_qcm2290_critical_cbcrs),
+};
 
 static const struct qcom_cc_desc gpu_cc_qcm2290_desc = {
 	.config = &gpu_cc_qcm2290_regmap_config,
@@ -359,55 +366,22 @@ static const struct qcom_cc_desc gpu_cc_qcm2290_desc = {
 	.num_resets = ARRAY_SIZE(gpu_cc_qcm2290_resets),
 	.gdscs = gpu_cc_qcm2290_gdscs,
 	.num_gdscs = ARRAY_SIZE(gpu_cc_qcm2290_gdscs),
+	.driver_data = &gpu_cc_qcm2290_driver_data,
 };
 
 static const struct of_device_id gpu_cc_qcm2290_match_table[] = {
 	{ .compatible = "qcom,qcm2290-gpucc" },
+	{ .compatible = "qcom,shikra-gpucc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, gpu_cc_qcm2290_match_table);
 
 static int gpu_cc_qcm2290_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gpu_cc_qcm2290_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = devm_pm_runtime_enable(&pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = devm_pm_clk_create(&pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = pm_clk_add(&pdev->dev, NULL);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to acquire ahb clock\n");
-		return ret;
-	}
-
-	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret)
-		return ret;
-
-	clk_huayra_2290_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
-
-	regmap_update_bits(regmap, 0x1060, BIT(0), BIT(0)); /* GPU_CC_GX_CXO_CLK */
-
-	ret = qcom_cc_really_probe(&pdev->dev, &gpu_cc_qcm2290_desc, regmap);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register display clock controller\n");
-		goto out_pm_runtime_put;
-	}
-
-out_pm_runtime_put:
-	pm_runtime_put_sync(&pdev->dev);
+	if (device_is_compatible(&pdev->dev, "qcom,shikra-gpucc"))
+		gpu_cc_gx_gfx3d_clk_src.freq_tbl = ftbl_gpu_cc_gx_gfx3d_clk_src_shikra;
 
-	return 0;
+	return qcom_cc_probe(pdev, &gpu_cc_qcm2290_desc);
 }
 
 static struct platform_driver gpu_cc_qcm2290_driver = {

-- 
2.34.1


