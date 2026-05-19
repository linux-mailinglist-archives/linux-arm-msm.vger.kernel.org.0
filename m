Return-Path: <linux-arm-msm+bounces-108548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMeOKfaADGpPigUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:25:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE17581670
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:25:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F2843191C20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6918D407CE3;
	Tue, 19 May 2026 15:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G59ac6Zk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E180407CE4
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 15:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203626; cv=none; b=QLXwImef+E+3DUze1VBum5pSJDAExmf7dD1E2K2w04sviCvCiQb1nWyIpAXaZoyZ7iMFdpE6mwNGwvAxOfHqJ5mWbcx22pBnyQd3kUY2cCD8uuVAPbOEERDvp6sxvZX0YdYOT7gbwjXNsfvVnQwrqEOp+6HCh6nWZvtAI1Kc/jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203626; c=relaxed/simple;
	bh=SKSKGA5wu5mHBy3LdJTJn/ga71reNQLH+wzxBhoGTzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QMY4MqKMVJSeOKG/4EE1az/Nh+h7H6FzJRaDFKFmB9E7tFAhGalazZoGR7eNv4FtuBXwf+SkFGG+0GKPY0sYYu45DL7liC/MomJ1oAq7Pv6UkgxjKv3ADMXnnNmASQ2jTpTPFb4ajub//GPzgqQwc8H8KaL3QML94/MzCSuonNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G59ac6Zk; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-67da63ae541so8114448a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779203622; x=1779808422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nOluIAb4J/mdtDnp0IJFTCHh0boFRqdkW+b5Er43ycM=;
        b=G59ac6ZkOahl07psVgdDZSUW2ys2JRHh68u6YsjMyNf6oWNudM4xijOHvKfuekh3Nu
         p8zU43x1mxMskdRzRNnf9d2ZKB+3mtOm9pTAoe56XahyCrg1pgMDCmu7/LCqzt7NquV+
         WA236oJgLTexJjyZ3X9TgE+ZtE+vKxHHk3JnGSyLtZWB6udaan0XHPr5Vhtbi/0VcwxU
         Hg8xENiRkDyJylakwh2L0NtmRf/aix/xUxJrlMyiZrhZW/uA1GPFHkfcHewctLtWzFEb
         LxAB52ef0voDNIL8Jf8USNIMBKTWHsCxMwEiCh2Xho8Fhj8GzUVmnSC2zb0mTlvo24W2
         JdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203622; x=1779808422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nOluIAb4J/mdtDnp0IJFTCHh0boFRqdkW+b5Er43ycM=;
        b=kRTMwMh/tEqQS4DyV4nEViarcOg2lQCSYP04ntGdR3MFIs9v8LPyspMB8gRxjnMasD
         WG6T1U/NoG7tmujuFqyi6ApMYJHO3bfm7hFgGPyiZ6ooX7AYskGWnvMpZtD84OwLBs50
         EJ+agB0PQP/OW3hYGVCTzaLDijwr407LiZ7G/ntVnqrPhIaSm5HY9NX+YDRfdTz3fXL+
         8XcwBpROKYc3z1f2oLKH5UEyIlGfhqD/US90Fq0fbcFE/W/DStvOiRXLW4njE8x2W+4S
         879M8JqCwj+hjeX3L+6jJWwJ6EX38rBEueMCiYFyM7ljv+z3SYoHRH4Dchg8gJJf29MD
         smtg==
X-Forwarded-Encrypted: i=1; AFNElJ/G+rtNFY5CSQzt2wc+DK9uuzexWcW83nQQUxuwpj7hzPOQaBiW+0gn6bX8K6IVkjnDcH0Ra0ul/gjs6nku@vger.kernel.org
X-Gm-Message-State: AOJu0YyqxTD4JdsVwfhYk+wPIDo2ZUxVLuhP14ZBP4RZhiWMqjaPw+MQ
	VlolR9CYmAuMhoDxyvuAoHiJRjJlMu3V40ZDBH9Yw7iHVMxetkTzqgJ3
X-Gm-Gg: Acq92OG/ZDlUwIs7qZaNjVCzeiRqkrNbSvciJN7pgKv/93Sb/QE6Qhf55Onzb9JNIFX
	RAdHKRm1ZBerehyBiGWm5GQnsVJmGMeY5+bzfqbUjoaViz6scsdx8+sKlupGqaOx3kUUsHZy0/y
	M4H1T4Bc9xLaXANnCZLHD+OxfGDXQ1cjSymcVYQZ2dQVhiVXAcjr3hLcOF13c1KqV+ceRfEqhCW
	joSYIQMCLvdnq4631+vVsKGsBNKFLu+8OyPaH6uPLqMhVbS1q+ZgTgBZSnfXevhi2uEf7SGp4Gf
	PvAN1f5hRrQil8H/2AfWXiF4I/RKMFjWj3zeQD9TBAntyA85tKXGTj8EgH2dP8bHKa87TGxUmch
	p8VMkGqpPy0UtPweJTAc45MoT05rpPPdTYNEzvTDlRCSIanuv19autsC8PHTi1jCp7U2fWSAusU
	EuFw0x0GiQ3f792XENp86AlzfcpQ==
X-Received: by 2002:a05:6402:358e:b0:674:40c3:f047 with SMTP id 4fb4d7f45d1cf-683bcd9eefbmr10573864a12.12.1779203621784;
        Tue, 19 May 2026 08:13:41 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b52675sm6697700a12.8.2026.05.19.08.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:13:39 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 19 May 2026 18:10:51 +0300
Subject: [PATCH v8 6/9] media: qcom: venus: Add msm8939 resource struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260519-msm8939-venus-rfc-v8-6-542ec7557ebc@gmail.com>
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
In-Reply-To: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108548-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[apitzsch.eu:email,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.30:email]
X-Rspamd-Queue-Id: 4BE17581670
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
index 3baa6bb4968f..ef9081d5335d 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -690,6 +690,45 @@ static const struct venus_resources msm8916_res = {
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
@@ -1130,6 +1169,7 @@ static const struct venus_resources qcm2290_res = {
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
+	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },

-- 
2.54.0


