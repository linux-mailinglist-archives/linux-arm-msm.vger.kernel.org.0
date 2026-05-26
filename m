Return-Path: <linux-arm-msm+bounces-109834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKotD/GgFWprWwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:32:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D52CE5D68A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D49EE30144D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848B53F7AB8;
	Tue, 26 May 2026 13:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MrZTYUmm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90FD3FAE0A
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802308; cv=none; b=f/hzaOYqe/0wZmsO8XrB27Aqghh00MVjRmnKAmzmbqMQumC2FOxsQ9+5a1qN9k2JkiPrML+m25E7NmP6sWkyw4/xD8cYBmKkG2lpE1x5Xc5mar2uRKHeVqI271nGHIZPoNuMMBoy3c1V7+/GlXBpOqHGcji6sHLaNzwn/T3ql28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802308; c=relaxed/simple;
	bh=DevLhieZ2Jb0JoG3u3mXqGfpLCKqdiC/50tm4MHf7SM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iIQIF+uCGMXlvSIHR2AUDs6H17Ux8p8s9lda1r/3V8yAOPNQuFlFMw48Ih/TAa3zaafeGJFtKIWfN4ItRSOnoSNO8lJWpf/oh3w5G4J3KxAKETgmWKGD1TvmjGPA2RlHFy1IWH0RxVP/QY+BKR/yJk2RwwdVzdHOLfOEUBWNQCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MrZTYUmm; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48e6db3ff7eso54683395e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 06:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779802302; x=1780407102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TcbIlr1puve+xrm8T0Jkr/obWl/FvkGIhLR+4PXKcyc=;
        b=MrZTYUmmg9/KQcCudWc1YnxidIPEaKqKlH+V11h9z2R80GGaxsHtIgfNM1fSm1zZOW
         7dxaiW4b9pfXsh/Wk2+8Ecx3nGkuALUFkshw9DaMqurjBDI6swKk1WRtTOLmshHvZ0ju
         OIGM+a82zpyh0E6I/rfi8sOCroFdvY4t+HMt+6fhWmlcsExqXXnd9Q2wOEGF39GUCtmA
         yypR7IrJs2KBmO4LjJfbNuVwoz1QeYXgF1kYJ1rj+Po/qYWMAT7AKUCEfIdoYdHzFVlb
         Jluluw+XR/FUXlgoqUmDt5Pg7bNWUjP5mVgsUA/4ZSgsz/xQFQF1rrlzUCr13anqR0sQ
         Nv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802302; x=1780407102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TcbIlr1puve+xrm8T0Jkr/obWl/FvkGIhLR+4PXKcyc=;
        b=EeYLBoOFQE8KZhUrr2jTnFAL+Lsdv/RJZeEphzoHiJx9fGDjG8xv99j3N6c0tj5GhY
         4I+9JP6yQHyBhUorZM5aksiFm0qmotFv72a295wrjPE5RCul0IXrY4TI+2/KFVhZDZ5s
         s1sgiLQMgnkjY6ClKBOKs5RFd09JZxX08LT1wW9DLI/F7WCcXH9HMpzLwGNqefwKOoZz
         54Sd4B6FvyHI4/ZhG6ftDKzLUlA7yBSMilxaTNl+WS3vcWNlsGbE6JiAQqI2TaP/t/Cs
         EUeIFEh+unfbaJI/QxBMXTDzPYbSc+mYuGm1v3PGDVN9g+MAsvan5UYbcHxXfGamhkc/
         dn+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9ZnhvQFZW35f1HXKpyQeDDuP4W5g/de4MIiabTZVncp2gy7/rdlS7A+PKzna5pemsMYdMJ2xQtycJc+AAU@vger.kernel.org
X-Gm-Message-State: AOJu0YyLMhhrumMYseUhSxXIiKUbr8ZD646IydMNg+RsIL14rf0/rdDn
	Ln+ZEaok7Eo1pOwlhLnb3inw5m6U/sTjQJw21GAeyO6cX+1Vou148p7I
X-Gm-Gg: Acq92OFE0KAHtYpS8BlFBB+KBTfsSfFPCejSVl3VV0swXLjg8AXgEN1XJSgFG6PAi3L
	z9ViMucP1HH/CsS37H7MzGu2+f2pu5EQAAN3qICo4b/jQNFMa9SQnBzsVnduv27lvwn6gWZsz13
	QwgmkfklcdhAsXKzF/Wgr6FYenqEp/3adnjfdFZguqTktL8/a9IAEZfTHJkBPNhgxkf5f9GJGsy
	TMFP+zB6ZI2Rgzxc8UQIghrss9jBH3sX4cFgG/xHqNsxBqNJy9KK3/cS7XjRdF/nqN51dk9AXSy
	d+j8pAM+ojHdy9TYxmKPcieu4s01GU3DXsbrYNebFLWcgPVF1cQKnYxn3JXjMbMT5P862V0upPr
	85SrHhrHwwh+L7xB0InSQf5BZL/S0recV/lq5KuQH1205mdKmEZuryZN0Thi1Wf68eFPFernYXA
	leBJ6Tsas0rxzy6S1osujnNYgjHQ==
X-Received: by 2002:a05:600c:84ce:b0:48e:6db3:ff2e with SMTP id 5b1f17b1804b1-490426aba7fmr175000465e9.15.1779802301797;
        Tue, 26 May 2026 06:31:41 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452580dfsm170958895e9.1.2026.05.26.06.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:31:41 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 26 May 2026 16:24:28 +0300
Subject: [PATCH v9 5/8] media: qcom: venus: Add msm8939 resource struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260526-msm8939-venus-rfc-v9-5-bb1069f3fe02@gmail.com>
References: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
In-Reply-To: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-109834-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.30:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,apitzsch.eu:email]
X-Rspamd-Queue-Id: D52CE5D68A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index bd88e2b484a5..243e342b0ae7 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -693,6 +693,45 @@ static const struct venus_resources msm8916_res = {
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
@@ -1133,6 +1172,7 @@ static const struct venus_resources qcm2290_res = {
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
+	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },

-- 
2.54.0


