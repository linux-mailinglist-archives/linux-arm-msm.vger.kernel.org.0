Return-Path: <linux-arm-msm+bounces-116936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GMAmLJzTS2rqawEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:11:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3667130EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:11:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=I0HxWENQ;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116936-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116936-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE77C3121CEC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 15:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F9F430CFE;
	Mon,  6 Jul 2026 15:37:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC03C3AB286
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 15:37:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352258; cv=none; b=rIIGAb+563w/qyZlHZlDS20D0/bKc4unuoMAPEV8FeTso/0R2rztyC8SFOAiYWfK1TYQa11AXJJEzAxae0udxj1pT4pYqOQ9RUqW1PGhgnL9Y2F1MhTR/m1hahKJL7d2bffA1Bibw6HxA+s3nvQ+yBnVTG4QMRCZ9vENwdMNl5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352258; c=relaxed/simple;
	bh=TUuEJNqU4wLzG01rIl4chtZAWRhzSH3iv8oWrKxgGA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cFP/umwgBVR2K9DQRkHB9WKrQXfzWgrfGH70NKq6HiebwmYzjjFWYLN5KLyGudqtmFzxn9Yk2CX59JhxL9uB2fZ68+lPF+bY/Lhz3p2EqDjpocmIR9TM0NrgexGEB9EC4Z1DfI4/JfLyvpK7t8lDCGqWMGpbKqIbPCWZ50jUQWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I0HxWENQ; arc=none smtp.client-ip=209.85.221.47
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so1275252f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783352255; x=1783957055; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+IhjzN+h4g6gki0ay7/Layv3WiGV2FztEG2doa2t06w=;
        b=I0HxWENQka9jsFtJ3EdMrgvxc3l0Wz6kXFc0w54MI+XkC1ZXRtbZplkGLKPPj5zvMN
         WxWzoz5zT2Ru4SLtPJ/IL3c7u9RIcXGTXvk3GrDlTi6RJ34dUHT5yYZmdcBLW7uGDj8/
         iBmVfwGmGpd+DVaIP0k2vJassjD7xW4r3L3i+IGnq64ow27llijUKAuFVkk+bOhKgkOK
         /+MA/whqMTvogvJirZvyVLRBcBIJa0qRihFPfD1M+OVWedoGSSdLdF9VWv6N9l9Vo3ra
         S0yxFuo/p2dSvzSEDbyYOdE/kmuolB8JW1wwVkNpm5palbbReplBuV8mDOn8gDJL+HOt
         aPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352255; x=1783957055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+IhjzN+h4g6gki0ay7/Layv3WiGV2FztEG2doa2t06w=;
        b=YmaCOcDnNwe2wcWRjhUsQ3JznGBKhSJ3hCPZ56NYj+r2caGVdElO1tqGMBcqli8R/e
         EFiEbRTmfVYSjDgEQI0FpQ26Pw0zJ8XHecOYcHBj2A6qhEXrqFYKjJ4bjnC3CymFGSDY
         scVU3Dv9WxDUjb+U1Jzh5agQEasM7tUzwF4TtP3pNxDKQEm6ciJezb2u2D8I3Ba4QY42
         qxaIo43FRE1SASRWF4BmR1qF/WjgCWJ2HMAVht/8NxLzUQhmVLpVqx0ZS0lM5gp3SHed
         E4YQZA1bRc5sWGJeSrSFJW/ju5h4CUFsN7pFDDXzAMYe/sjl7TWp/EZZo5y6wEFZv3xi
         zSqg==
X-Forwarded-Encrypted: i=1; AHgh+RpDiBZwDp3Yj9d/CJyGeuFKg/FG92f57Njurp+5C9eknDA3ROMTnSf57GYdEZny6dbg6zgxAvY2/FGSkdBS@vger.kernel.org
X-Gm-Message-State: AOJu0YxKoHkPjPhYBHiVUsgZ2/phQtX+s8Bv+68z5fQqfG7C1r0OrC8G
	VBI60I0J03msPexXVYB46TfYQfgXrHO9gK2DZBstMy62N4PLItT0ZuZSs9BytbsC9JDj/e+/jYE
	QZdAeTSs=
X-Gm-Gg: AfdE7cl8IhTss9FaTnjkbhnuREKo7ThU0Nh7TqJdIZuzkrkyPGIVK/42PpZlZM3G3UK
	du/w8gS0vGrOwu+PSPkD2wmj0enJC7jcm8NZr+PhEmpPDnOBqx2OfVG05F9yEe0/Z6p6b/U+ejO
	AYPiDdPt+pWE5AdC65UVGj5ZyyXIY31UB3+Npu5L1oH9ieid5VHdX0+adBZcuYNw2saDr2YpBKq
	gS62rmwJCP8mqiiy2k6V8o/s7BobkyVWzsvEZuRTMMBCjwiYl4ODIRSqmNFTuJQlrTPKRH8OiSt
	Jr+f8BOGrvamJZcA+glchdTm2fXGhX/k8ANrNUG6/fr952Z9T2aSqoR8B2Z2eMkYlFJag2PbycT
	GBv0anxD8Aork4DKjaPNZ6PHNm6l3EdW993AP0qoeuLjU5nbMkTS/omKOZEfwvzwuQq6bZjCnZS
	ssBx+f7zRJjsNgkKC2IxP//Xa56w==
X-Received: by 2002:a05:6000:b49:b0:47d:df96:c9ec with SMTP id ffacd0b85a97d-47de66d3108mr711386f8f.34.1783352255234;
        Mon, 06 Jul 2026 08:37:35 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e6ccsm26216613f8f.5.2026.07.06.08.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:37:34 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:37:16 +0200
Subject: [PATCH 1/2] remoteproc: qcom_q6v5_mss: Make ssctl_id configurable
 per platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-1-f59e728af621@linaro.org>
References: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-0-f59e728af621@linaro.org>
In-Reply-To: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-0-f59e728af621@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116936-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:barnabas.czeman@mainlining.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F3667130EA

Currently, qcom_q6v5_mss hardcodes 0x12 as the instance ID for the
subsystem control (ssctl) QMI service. However, some platforms (e.g.
MDM9607) provide the service with a different instance ID (0x22).

Make it possible to override the ssctl_id per platform by adding it to the
platform-specific rproc_hexagon_res struct. The same pattern also exists
already inside qcom_q6v5_pas.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index ae78f5c7c1b6..425601af50d1 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -162,6 +162,7 @@ struct rproc_hexagon_res {
 	char **active_clk_names;
 	char **proxy_pd_names;
 	int version;
+	int ssctl_id;
 	bool need_mem_protection;
 	bool need_pas_mem_setup;
 	bool has_alt_reset;
@@ -2191,7 +2192,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	qcom_add_smd_subdev(rproc, &qproc->smd_subdev);
 	qcom_add_pdm_subdev(rproc, &qproc->pdm_subdev);
 	qcom_add_ssr_subdev(rproc, &qproc->ssr_subdev, "mpss");
-	qproc->sysmon = qcom_add_sysmon_subdev(rproc, "modem", 0x12);
+	qproc->sysmon = qcom_add_sysmon_subdev(rproc, "modem", desc->ssctl_id);
 	if (IS_ERR(qproc->sysmon)) {
 		ret = PTR_ERR(qproc->sysmon);
 		goto remove_subdevs;
@@ -2271,6 +2272,7 @@ static const struct rproc_hexagon_res sc7180_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_SC7180,
+	.ssctl_id = 0x12,
 };
 
 static const struct rproc_hexagon_res sc7280_mss = {
@@ -2301,6 +2303,7 @@ static const struct rproc_hexagon_res sc7280_mss = {
 	.has_ext_cntl_regs = true,
 	.has_vq6 = true,
 	.version = MSS_SC7280,
+	.ssctl_id = 0x12,
 };
 
 static const struct rproc_hexagon_res sdm660_mss = {
@@ -2334,6 +2337,7 @@ static const struct rproc_hexagon_res sdm660_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_SDM660,
+	.ssctl_id = 0x12,
 };
 
 static const struct rproc_hexagon_res sdm845_mss = {
@@ -2371,6 +2375,7 @@ static const struct rproc_hexagon_res sdm845_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_SDM845,
+	.ssctl_id = 0x12,
 };
 
 static const struct rproc_hexagon_res msm8998_mss = {
@@ -2404,6 +2409,7 @@ static const struct rproc_hexagon_res msm8998_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8998,
+	.ssctl_id = 0x12,
 };
 
 static const struct rproc_hexagon_res msm8996_mss = {
@@ -2444,6 +2450,7 @@ static const struct rproc_hexagon_res msm8996_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8996,
+	.ssctl_id = 0x12,
 };
 
 static const struct rproc_hexagon_res mdm9607_mss = {
@@ -2479,6 +2486,7 @@ static const struct rproc_hexagon_res mdm9607_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MDM9607,
+	.ssctl_id = 0x12,
 };
 
 static const struct rproc_hexagon_res msm8909_mss = {
@@ -2515,6 +2523,7 @@ static const struct rproc_hexagon_res msm8909_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8909,
+	.ssctl_id = 0x12,
 };
 
 static const struct rproc_hexagon_res msm8916_mss = {
@@ -2562,6 +2571,7 @@ static const struct rproc_hexagon_res msm8916_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8916,
+	.ssctl_id = 0x12,
 };
 
 static const struct rproc_hexagon_res msm8917_mss = {
@@ -2606,6 +2616,7 @@ static const struct rproc_hexagon_res msm8917_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8917,
+	.ssctl_id = 0x12,
 };
 
 static const struct rproc_hexagon_res msm8937_mss = {
@@ -2650,6 +2661,7 @@ static const struct rproc_hexagon_res msm8937_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8937,
+	.ssctl_id = 0x12,
 };
 
 static const struct rproc_hexagon_res msm8940_mss = {
@@ -2694,6 +2706,7 @@ static const struct rproc_hexagon_res msm8940_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8940,
+	.ssctl_id = 0x12,
 };
 
 static const struct rproc_hexagon_res msm8953_mss = {
@@ -2731,6 +2744,7 @@ static const struct rproc_hexagon_res msm8953_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8953,
+	.ssctl_id = 0x12,
 };
 
 static const struct rproc_hexagon_res msm8974_mss = {
@@ -2785,6 +2799,7 @@ static const struct rproc_hexagon_res msm8974_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8974,
+	.ssctl_id = 0x12,
 };
 
 static const struct rproc_hexagon_res msm8226_mss = {
@@ -2824,6 +2839,7 @@ static const struct rproc_hexagon_res msm8226_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8226,
+	.ssctl_id = 0x12,
 };
 
 static const struct rproc_hexagon_res msm8926_mss = {
@@ -2871,6 +2887,7 @@ static const struct rproc_hexagon_res msm8926_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8926,
+	.ssctl_id = 0x12,
 };
 
 static const struct of_device_id q6v5_of_match[] = {

-- 
2.54.0


