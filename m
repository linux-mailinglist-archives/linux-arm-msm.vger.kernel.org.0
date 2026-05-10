Return-Path: <linux-arm-msm+bounces-106807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0K8XNphUAGp5GQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 11:49:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FF45036B9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 11:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D1F143004C91
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 09:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D745366831;
	Sun, 10 May 2026 09:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIXIqxkf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA03372B25
	for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 09:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406496; cv=none; b=Rs1KTREnSrvInlhhtV+dPx0dTpeqRryB4Ty/X9nPqSHvjBxThX1SHv1M+eXekIV1LOe4ku/i6cxKEYBA11k7GxIINOJI02jQ09bis87TWExcaBRous4ucVQriqxPzz4+jJwlfTiiflP26HlBHZLWiDat0SqCFIS/5LlP+jB1lWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406496; c=relaxed/simple;
	bh=PThAJofFUpaf0I7H3OPLDBFfLJQH6zwvWvtmukAgzZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y5GSQe6X4y57B92sfX4Tyoz0rq/j5gAAxCSui4ua5kU0Z969HxpBxcXaCeHQHavvNtnir0MSxICboHVeE6cLq1dfgl/edLAge4h0OTaPWLmfzV5zRqevItI4PC3mZflq7Ntkhk5n+vANW3fsTipETxo9eHbV6PRi9faF+ALfY8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIXIqxkf; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso36380095e9.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 02:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406489; x=1779011289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJYDpcxH6Tn7+0ROYd7sOCYGz+GoNKS70+mlfSYBYV8=;
        b=UIXIqxkfDe6yto75EOjj7Nqn6jcpzylJ70+ijNqrIxVQe/iMOqMOLn4TJ7BboT7+Oz
         /4mhcmmcusdAzQNtldbSdJOeG/NZ27biyVx0IhoErzzbxj6zXKFNo1PXRBiaWbRh2msX
         5mwghnEo3LDL4Af8souX6q6YPCR2KGpdXD6MAFhjMOhYblvjjYJL3RoRS7ABMzdp11O9
         x2MAiz4SaGw/Um77J8BscZLHxTnMhdnvKToGOrBlRUJi7Y0fFYLkykz/UixlZQgJula0
         KWWu/Xv/BHIu31fEK0qVu8qSuZ4TNmXWOBMxz72tH2AQAZo8xhqLc2cFXTDs3aa+rkOe
         n8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406489; x=1779011289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qJYDpcxH6Tn7+0ROYd7sOCYGz+GoNKS70+mlfSYBYV8=;
        b=WplqFdYcJWtQX6G+jOjWYLzSZC4FzpB6E0yxbIsj+stm6ifjhg0goo4qvQ8MQiPJCS
         nz1DBSCvQJjFEitmKqGjp1UdoCtiMjR0f6QEe3FMzigo9Zkc2n1rBXYqIKdu8wQa+ZYT
         aC9+OZa69TZEjdaqrjxDU0mXoFgAufOuBbyw6b9KWvAAHnODcg4bYeiVzICM0SOaW0dq
         UHd+yf/YtDMhZR/uElHEPSZ4JfDT0XYLaN2AsPKEVBLy+ymvGE//i7RCc0qtaJdmNhWv
         g044TJUMcpNFvN4jrzuhDgz8q1rY0dPjshZUZc5jcNXXFV7Ka9umbxB34vzrz+uSDOeb
         M4Xw==
X-Forwarded-Encrypted: i=1; AFNElJ8F0Usy9y4jYCejkX7o/FbX10Je6W26nO4iQp1PgaPaQTfQQmZAcrocA8Nza8l3lmmM/pe6AWtIBE6eGr+U@vger.kernel.org
X-Gm-Message-State: AOJu0YylKZWY4LrLaPwRvNHfszzvIeO5+/jewm2F0rWp39KpWaGIJaxg
	Wtvsivs2+zCLKC0o4QOn7E1N8m0m7m7ZNz2eqr4A+epQ6jlY5iBOGOS9
X-Gm-Gg: Acq92OHKxJhoyMLNrJEK/vA8Vg4Na98Bk7MUtd+ahbDDKE8ZIWGycKkb1jlrJwYI2L2
	GVIOPGV91WFUQESSlrPdCulDGk3YCMO6J5msG3PneMMAYcy5q2RQH7ppJxHMLJRDc2dlIbGKD4z
	Euz0TFV3dt9az2Sav1woxmgvclnwRdw5auzHJECoeStJW1HcS0yjl5Nd3KvIMq7AcH2E75GtNNA
	UaoSxmIEaZFMC1DRsWHSXWnEMsTycwouFfMSfhjthd7nXbBfM3Wz7HWuHutTgCwxvB7D4irU0BJ
	TnS5PiKfVy+RR/3jgSGvgUuQ3JzWoKv49rRuy2yGIm4pjxzZumQDXePHLrI8AsXztqsIgdnZyv1
	N71ioYDfm246GjRFUk8hnWVC8+0BYWVcCBCT8gtvnoEnboSoYJXU/pAH9IPMv9hZGWI4PXjVGqk
	3UQ1D94yWzQDPnaO97cROdiLgG8trn
X-Received: by 2002:a05:600c:8011:b0:488:8840:e5ae with SMTP id 5b1f17b1804b1-48e51f3b589mr302185505e9.24.1778406489364;
        Sun, 10 May 2026 02:48:09 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0bf2sm182807925e9.4.2026.05.10.02.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:48:08 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 10 May 2026 12:47:45 +0300
Subject: [PATCH v6 7/8] media: qcom: venus: Add msm8939 resource struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260510-msm8939-venus-rfc-v6-7-e69465375900@gmail.com>
References: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
In-Reply-To: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: F2FF45036B9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106807-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,apitzsch.eu:email,qualcomm.com:email,0.0.0.30:email]
X-Rspamd-Action: no action

From: André Apitzsch <git@apitzsch.eu>

Add msm8939 configuration data and related compatible.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c | 41 ++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7e639760c41d..6ad20d58dda2 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -688,6 +688,46 @@ static const struct venus_resources msm8916_res = {
 	.enc_nodename = "video-encoder",
 };
 
+static const struct freq_tbl msm8939_freq_table[] = {
+	{ 489600, 266670000 },	/* 1080p @ 60 */
+	{ 244800, 133330000 },	/* 1080p @ 30 */
+	{ 244800, 200000000 },	/* 1080p @ 30 */
+	{ 220800, 133330000 },	/* 720p @ 60 */
+	{ 108000, 133330000 },	/* 720p @ 30 */
+	{ 108000, 200000000 },	/* 720p @ 30 */
+	{ 72000, 133330000 },	/* VGA @ 60 */
+	{ 36000, 133330000 },	/* VGA @ 30 */
+};
+
+static const struct reg_val msm8939_reg_preset[] = {
+	{ 0xe0020, 0x0aaaaaaa },
+	{ 0xe0024, 0x0aaaaaaa },
+	{ 0x80124, 0x00000003 },
+};
+
+static const struct venus_resources msm8939_res = {
+	.freq_tbl = msm8939_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(msm8939_freq_table),
+	.reg_tbl = msm8939_reg_preset,
+	.reg_tbl_size = ARRAY_SIZE(msm8939_reg_preset),
+	.clks = { "core", "iface", "bus", },
+	.clks_num = 3,
+	.vcodec0_clks = { "vcodec0_core", "vcodec1_core" },
+	.vcodec1_clks = { "vcodec0_core", "vcodec1_core" },
+	.vcodec_clks_num = 2,
+	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0", "vcodec1" },
+	.vcodec_pmdomains_num = 3,
+	.max_load = 489600, /* 1080p@30 + 1080p@30 */
+	.hfi_version = HFI_VERSION_1XX,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.dma_mask = 0xddc00000 - 1,
+	.fwname = "qcom/venus-1.8/venus.mbn",
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
+};
+
 static const struct freq_tbl msm8996_freq_table[] = {
 	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
 	{  972000, 520000000 },	/* 4k UHD @ 30 */
@@ -1121,6 +1161,7 @@ static const struct venus_resources qcm2290_res = {
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
+	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },

-- 
2.54.0


