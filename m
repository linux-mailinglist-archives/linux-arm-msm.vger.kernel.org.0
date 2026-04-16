Return-Path: <linux-arm-msm+bounces-103423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MORDEdzn4GlInQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:45:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A190A40F11E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:44:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 278A93028C73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11D033CF03F;
	Thu, 16 Apr 2026 13:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3KSvbNp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37CA3CB2F2
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347069; cv=none; b=VcDpbn4x4dMxc/VF4QbUr4f9D7Xn2rFpRoA5H9KCmR3o8c9Gty7+/ROczvhkTwSmvxoHXIWDINlm/0C1dPks6t1Ho0zM4lfIJ1a3bRgfkF05mWViCIMGOiY6pCMVIWBZQQRKDfg0KkMcWQ73HfbSoZKRn+YLBGG6idZzv4HfKHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347069; c=relaxed/simple;
	bh=YUBIHQ6vOyWADg6NA3iKgMyw3HPZcQRKnuaPJ5Oo6es=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jYVhViiPhd6cVZu3G8WknX53O8DbYadj6iEuaSjgERlcVRFb7pqfltAch0NKTrUsD6/6At8JMNljOXWQ58UyfNZ0Ag2r8lJiHbU5lzINhRi3GLtVBhTdKbGDsfUN6ddFB+az+GmCfHTFjV3WsjFiw2k2vha1jAX75MZurhFkz90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3KSvbNp; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7991db3dc98so95262427b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 06:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347058; x=1776951858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XHqFPeZpSYzG3dQH+W5IiqOFDuI28gmjRaXhJvazaTg=;
        b=U3KSvbNpp35twvtf3aPtv2dGsRzOTTM208QLC7aO3+2jMI5h0+oh1pkD4YiHStL23A
         Qt3RlpZ9uU8/nrbFem4a6rPWqPfO5u3ABv6gKHuYdtMEA4aMkOzBrrsQVTmuAvOo/xQt
         DYwbTtkUhQvpYkXEwZWzKgHsCC3m0EerIyeM+Umb4/tcfdXk3p8+rvCIoK4T+igsNRvb
         5b+UhElNM2/4rWqpgYM6s+dUY/UhuuD5mv0DFeheXcSBu7/RCnptMJ1wjSGCVlmEyFz8
         MLTMJp2qxRfbF+bcTnnO4GkP1Rl5QU/fpNC+iwkUkQGfQleHQyBdGy1ie5Gr5tPbglsU
         nLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347058; x=1776951858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XHqFPeZpSYzG3dQH+W5IiqOFDuI28gmjRaXhJvazaTg=;
        b=UbnKX7Wz+KB7AXIL8bNi3PB4QpZA8szY1JkbIHnk9ubPnDhzhG5YQr8+FFnOxAxbPw
         l52phyLyJqQHrcOSQxs9JBbBTH2k3Iwi6aSOy6eSJitqS8BDPkVGVY4RXzqGl67aGecT
         TVpCnIbOZ0KdpaLo6lbLhsbH7JFv9dZ3DFMn7E/atIK/WLC2xjpO6hoozklGMmGcd11P
         zs3UzMMIEhLCvbyaHoljl3mN1YQFRi7KrE7E3mWgaJSg12ZFWGGfQ+7sWbpniqo6ONJ+
         BecuVSt7FncAzg3BRc7QpyRf9ZHdDKNzJj8Hp/BYw54T8ljnc6Q7rcRc27U2m06XpYy2
         Z/Og==
X-Forwarded-Encrypted: i=1; AFNElJ8bYyDoFtnKiPFptrvzHpcYKZERPM+E/NY+C3r03tb4/a9tdG5FmAkrjS3mIMeAW7lBK5rd4UvuXl0nBhJb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz69bT5rm2k6ychbO7Mhw5qQ8ETUYh+qZH5mJ9NTQYDoudCu9Xh
	c5IAIN2/FF67ybk4TSU/X7W6mns15wgw9mwe9XY46rpl5DHU3eo4Dv5N
X-Gm-Gg: AeBDiet7s95l9WSxQfu2zu1N2dXywV4TxNyj/zmL67c6UukgmuUeuzbIP0KVCVVpn7f
	s+BJi9aXa0mIcRX/e3GrXMNP4H4Dws6C1eL2fk0gK4QFD1KUNHk+Y/b/JtG9ZFSJUr5VLuq8c9o
	WEQsgexlTSSqczAWQNyQyT9eGF7lGvCgwgVxE5gOFzhHK8dhAfeUL5SqYOVvmnxgeu/gaP18qLV
	qCdKL0yiwNd1UykJGEsyxdddJ/WovMVxyyfEtIRHfv5P7bPSAYjYChgEgjCJvualzsPSil179RF
	jQYxEXLppb7Pr/QkRg+7tlrcwCd5PFm3Q518b4MySzNZZeu5STESNarw67rvmoRJMT5nl8lHnUQ
	PYL7tDpvYokhmTOsyUpAmoILKfXUX3aYbh9uuKwPzcv3T1d54caw9SlopqJ6aDwD7QUtWidwuLJ
	58E91iU1oFzgQEesBB+p863QCm8HaO8mmpHzIR
X-Received: by 2002:a05:690c:6983:b0:7b4:378c:f72d with SMTP id 00721157ae682-7b4378cf8bamr136804687b3.42.1776347058339;
        Thu, 16 Apr 2026 06:44:18 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:17 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 16 Apr 2026 16:43:50 +0300
Subject: [PATCH RFC 03/10] media: venus: core: Add msm8939 resource struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-msm8939-venus-rfc-v1-3-a09fcf2c23df@gmail.com>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
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
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103423-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[apitzsch.eu:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.30:email]
X-Rspamd-Queue-Id: A190A40F11E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: André Apitzsch <git@apitzsch.eu>

Add msm8939 configuration data and related compatible.
Cores on MSM8939 Venus are used for decoding, not encoding. Move them to
vcodec0 so they can be enabled accordingly.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c | 39 ++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7e639760c41d..b67cf1628f1c 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -688,6 +688,44 @@ static const struct venus_resources msm8916_res = {
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
+	.vcodec0_clks = { "core0", "core1" },
+	.vcodec_clks_num = 2,
+	.vcodec0_pmdomains = (const char *[]) { "core0", "core1" },
+	.vcodec0_pmdomains_num = 2,
+	.max_load = 489600, /* 1080p@30 + 1080p@30 */
+	.hfi_version = HFI_VERSION_1XX,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.dma_mask = 0xddc00000 - 1,
+	.fwname = "qcom/venus-1.8/venus.mbn",
+	.enc_nodename = "video-encoder",
+};
+
 static const struct freq_tbl msm8996_freq_table[] = {
 	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
 	{  972000, 520000000 },	/* 4k UHD @ 30 */
@@ -1121,6 +1159,7 @@ static const struct venus_resources qcm2290_res = {
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
+	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },

-- 
2.53.0


