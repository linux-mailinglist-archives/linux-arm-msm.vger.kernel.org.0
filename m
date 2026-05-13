Return-Path: <linux-arm-msm+bounces-107493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IK1AC9ftBGr7QQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 23:32:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F52153B0DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 23:32:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A4C2304C7F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E3593B9601;
	Wed, 13 May 2026 21:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jwqgme17"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C092C3B1EC7
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 21:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707588; cv=none; b=lCsvGJMFTdvo7eGevyI8f2WNXM2VY1JWwBKDdYKiMvZpJekKkDawcaYFkkgH2tEHWWxl62uj31ptO05gQJLw5TA0W0l/JNO+PblzIz+wmuz06WxYYG/bzYVO1qLO9DWBByFgK67QphLGiYk+v7lOuFGtdeJm8v927yS7JIq47Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707588; c=relaxed/simple;
	bh=kbRxkDSklKmUXRkpNNt2jlXF+tF+3iVfzCr636P03P4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Goznlf7Z9TziQNSMWveFTHNd7t4DQxcql1bvGIE1VXLAz+ThdANDB2ZlDEICUm1ZHd4/AMiAl26IqMOztvTedsxNEXDeNXC0LKxWQwH5xMDicGvqYD5U0ANnirwCghB+jF3lA4iJssO5MyHf2ch2HUxq+SAv126gzgF8d+ipIko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jwqgme17; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-65c24be9e4bso8467165d50.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707586; x=1779312386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O3TcPVRIkkCvtZzIpVvk6MMaDhrZ9WpVELhUPvDjGtg=;
        b=Jwqgme17n8uOUs6ZlP0KdYudX83NJbk9t0JGX0V3YTPd2KaYUvP5wy1io4mxcOBUOA
         q3c/ixn897y83zTBLixiZLrP7ls+JX3O1rSY7CIAi+OHP+1qluvSXU2b6DK7LPT0N9cK
         /nLe9lgzoD4EGKuIp/vMUXPIMfPvVRh63N8GOMZ9qJboxEsy6JDXiRZ+X/q2wJq4molG
         sDnL8WBb10tvcAtbOC5ONtbsfmMfH2Ua6OV3kmJGVSeDm0hc3ZRFhrPJFC3xX1to5Wuk
         rQioImlMTJAp4zmK9Aggi74xn3SnbJevjtXCvg2Nv26xg9yTKkq/XsMVVatT8ZykUnt2
         Sosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707586; x=1779312386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O3TcPVRIkkCvtZzIpVvk6MMaDhrZ9WpVELhUPvDjGtg=;
        b=C4Mr+l/c8FrPDNi2syuyNAKHrY4SSOYqeEpWb3dVtFu8tFBSzj2jZ+lCdlLLFAVN49
         DWperiimCm71bOSr1fQTDNJCT9Ee0/Z40S0xQr+AdlyEYrD73s8u0+38Py37zBeIkaMh
         3RsAzVWPvOR+Ky9WXUdxFJfGqABCalJ8XHYhUmY20Y4SitSn7hJqrlsuIuNX4Q/YB27y
         jp2iOxpXIpHh7mh/42wx9SkqzAdmIG+tVtv5SzG85aOmR86NrxVHrSHYACD90+U9xWpy
         kK2KwonA6HLBR3Ai2jQKaphIA2BMgWDrJuo+XASMT8Iq/7YZk9HffbQziLfY7J00DtkE
         8GyQ==
X-Forwarded-Encrypted: i=1; AFNElJ8VocRTllkwqb4CuovJo/HgKZKE3VGwpKr6335HQ2+swwVRM5te5aVS2txOhY2rl93NDkRU0CwevWnNCfUz@vger.kernel.org
X-Gm-Message-State: AOJu0YygnR13a2wEQrrLhVOteeoej6HbbOdLWA70Y2Uu0+Or8HH3rDMj
	4nJ05sU0bWYNy3xTfNXDkw9NNoOVlpCss0guOy3GZNj1q/pU340M10TW
X-Gm-Gg: Acq92OEoOhXO6BhzNmIZwvZVuIgKqDNB6Ff+8Sbp6igQeU+LuE69hPzT1baTiSKk+c4
	+UyTbsxnsxtAjsUyEUHShlxK9pDIjZz0VkduppF9l+DOXPtpYtbLN4fxHe7HrtFma3N7jfxb90K
	C3mKKm3BTpF6JtxnzkXOLUvgoXH2UJ85QH4Rv2oHmXfG4o5x25A3UCc8Hnmc5BVqjSCT2vzcWsq
	PZGbqhI4lEH1PjpWIpFyv7bUrObQ2u92RTG1HP5JTiMVUhl/PdhWuRcxRCHF3VN9m4lEYNr1UUR
	ZPqSwkGmafBg25h3ozz703gvANeHKibBBfhuvz5px6ror/DYjbxChTVw93TzuUIUlf6I1KR9fad
	+KV2dejiNFu3fJ9dm9xkPcK5Roiys2P4IbbO1awAaU8j2W3j0dJ/Wnsatmcf6rDoYME/zdDvCi+
	0fH3pKuK8t2nuQJ3s5rVZkIPqoFA==
X-Received: by 2002:a05:690c:e3e2:b0:7bd:8782:bb63 with SMTP id 00721157ae682-7c6aa11b5ccmr54775837b3.19.1778707585933;
        Wed, 13 May 2026 14:26:25 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b810csm3715107b3.14.2026.05.13.14.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:26:25 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 14 May 2026 00:24:37 +0300
Subject: [PATCH v7 8/8] media: qcom: venus: Add msm8939 resource struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260514-msm8939-venus-rfc-v7-8-33c6c6fb9285@gmail.com>
References: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
In-Reply-To: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
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
X-Rspamd-Queue-Id: 7F52153B0DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-107493-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

From: André Apitzsch <git@apitzsch.eu>

Add msm8939 configuration data and related compatible.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 1b5e72980702..b6eb96e43319 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -692,6 +692,45 @@ static const struct venus_resources msm8916_res = {
 	.enc_nodename = "video-encoder",
 };
 
+static const struct freq_tbl msm8939_freq_table[] = {
+	{ 489600, 266670000 },	/* 1080p @ 60 */
+	{ 244800, 133330000 },	/* 1080p @ 30 */
+	{ 220800, 133330000 },	/* 720p @ 60 */
+	{ 108000, 133330000 },	/* 720p @ 30 */
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
+	.vcodec_clks = { "vcodec0_core", "vcodec1_core" },
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
+	.dec_codec_blacklist = HFI_VIDEO_CODEC_SPARK,
+	.enc_codec_blacklist = HFI_VIDEO_CODEC_HEVC,
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
+};
+
 static const struct freq_tbl msm8996_freq_table[] = {
 	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
 	{  972000, 520000000 },	/* 4k UHD @ 30 */
@@ -1125,6 +1164,7 @@ static const struct venus_resources qcm2290_res = {
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
+	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },

-- 
2.54.0


