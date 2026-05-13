Return-Path: <linux-arm-msm+bounces-107492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMIWNbvsBGr7QQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 23:27:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD57753B012
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 23:27:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1717E303F09D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661C73B7B71;
	Wed, 13 May 2026 21:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ke006ddQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079C43B8BC1
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 21:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707587; cv=none; b=nB0UudqrxIbNN1idX7266shGJ+BaLnn/GNctf/JEi7sdHMHsSUZBqq0Vrlso6a/CKhHuqTsLMW1uowwOArFF5F1KRfkebxE5wRd2LrLGUURj+AKTTEWLGsJHC/tGiPcyMXtydJbvXL284P6UYLB7Q/rf+TYHEx7DbB2K/zNVIF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707587; c=relaxed/simple;
	bh=eWvwFj63Oe5rLHhL9VyXX1Yhyfqj3Z9mzRiwe5LaGlY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VxxBjBuWL3DcUadZwTcjJ0KTmzUXJN9j4eQtkoGn1GpWib/13T8eyreVsDCqFaiBDr5QwSwsljbtUAEKFiCjAeUvcai9uwdFrtYnrBDJpaqfjbnWYrhZbvc/HttDYmFDbSq5N9H7foTvbtdseddTYRO+PFKUQ1CbaawDGiqT/JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ke006ddQ; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-651d6347a69so7195242d50.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707585; x=1779312385; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ktJMLSr1SMVyv2PkF3WNZjUBeXP3YGWJAx5pUXBljGM=;
        b=Ke006ddQtjSVdQRSagn8qAzonPyGOJocJ8M/DpSzur/MfiuZApYe+J00NVbrFvbqBj
         kgFqbcaOE2F3Ya/4bDBFbRJ4BJ6GE/fsLjT9kpH/xa01sxzz32V3uRo8Dv8zZfGhGCSH
         oCqTzQieMTq78Cykon3++wPjmWJK+GZHxoC8eAjcrFYuMKQyn3oaGH+Q+ivhNysQJqTS
         hqli0cqVw++eHt5+yn7JVhYbLXO0OyF3r7cdXdjWdP9hsYnKEI1U0cS6PkZ0pJOrsHXo
         xmyEeqzI3b0IXrqEoOYoQxQSZ9LRZjf/oElwncJpETrUXgtaFMlCL8qTD3fb7kuLCDiS
         rvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707585; x=1779312385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ktJMLSr1SMVyv2PkF3WNZjUBeXP3YGWJAx5pUXBljGM=;
        b=UD0LaXxG/HidQvMXhYdrBBBLw4sghwo7e65CwikovnmZv8dQQ5oxEEMElHPopfZSCR
         3BNSXqA8wWRjL7VYHVCyx0GXkXO8JTiydZpBiMc/cGTwRS8wr3URwgRywL/8MgF1nIzK
         g7znLJLD5fuEvxSwouuxGP4W01lk0S6FCOAXBmi2FKDDT1fuBK6r9xgB+xULOY8jy7RC
         BB28LbZy2++thQkukaP4MERbS3GXlnM8OVnvo8btvv2TkpvVWfdneiArNlDv6OWW3+NS
         i/aMy4ybcTw0Ai2nVD/2R2erjusDwwBcprDoq6PcPNQEs2zyIhZ1buwIXPhN8tOPzLrm
         X+Xg==
X-Forwarded-Encrypted: i=1; AFNElJ+oFpGF13dSBzUMLWdQXgl/8xvUJxJOmy0irOno/Rmma+Wh75crj2THMyKgHC2ybEiY2BFvhACSuqayY79g@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbbu7BounpHAXFoZp6b47htKoXlM+ymW93c3hURS4mPG+BI4s0
	DiYfwzRYgkNUYTSSg/NuDRfHitXLZjgPoKv+rQDsWBU+tqVBjaeEPIvx
X-Gm-Gg: Acq92OEPoOOLIFud9VFyBsQaR2/tXplUi0SAClSuMULrIkBnE4zqJJuVwd/+mjkNGym
	5DE4xqxVuseGdIM2RUI2JhusQ81haLRvXQ81Ed+OdGyi7l/m8zcecPy8/vCAIAefz+w0fM+9AuA
	heaqqcHlpNzgveMWPw8PbCKtKVAj5SYTK+q947B9nOt6m7xodbLx3LckLmWtUtS87gzOAcDpNz+
	o/txqMIljOWjzsgAlK1sPDXWQk59PzzM8oFm+hd3NWgNshQ4LdBIAuPZBYAq4/hmXV3QnneoWiU
	333B8Z9K9dKzC09aZk4Z05VIk5WF+Cbneibb+KcT1TZ7fyIlyqAnwCa1slBvYryk4r4/fFFjZlY
	3YzMs0/uFyiRa/+5YqkRHtNBZ0nlqI2m4W3X14oY/8AsNREUFTbZhHZ1Ay9QIN+AmNcJDH4hiN5
	idg6IFb8BSgv2vGBw4c2BC5uKWgw==
X-Received: by 2002:a05:690c:6286:b0:7b6:783f:2122 with SMTP id 00721157ae682-7c7e668eb6fmr11694307b3.9.1778707580397;
        Wed, 13 May 2026 14:26:20 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b810csm3715107b3.14.2026.05.13.14.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:26:19 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 14 May 2026 00:24:36 +0300
Subject: [PATCH v7 7/8] media: qcom: venus: add codec blacklist mechanism
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-msm8939-venus-rfc-v7-7-33c6c6fb9285@gmail.com>
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
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: DD57753B012
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107492-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add decode and encode blacklist properties to allow disabling different
codecs per Venus device, instead of doing it per HFI version.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c       |  4 ++++
 drivers/media/platform/qcom/venus/core.h       |  2 ++
 drivers/media/platform/qcom/venus/hfi_parser.c | 10 +++++-----
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7e639760c41d..1b5e72980702 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -178,6 +178,8 @@ static void venus_sys_error_handler(struct work_struct *work)
 static u32 to_v4l2_codec_type(u32 codec)
 {
 	switch (codec) {
+	case HFI_VIDEO_CODEC_HEVC:
+		return V4L2_PIX_FMT_HEVC;
 	case HFI_VIDEO_CODEC_H264:
 		return V4L2_PIX_FMT_H264;
 	case HFI_VIDEO_CODEC_H263:
@@ -684,6 +686,8 @@ static const struct venus_resources msm8916_res = {
 	.vmem_addr = 0,
 	.dma_mask = 0xddc00000 - 1,
 	.fwname = "qcom/venus-1.8/venus.mbn",
+	.dec_codec_blacklist = HFI_VIDEO_CODEC_HEVC | HFI_VIDEO_CODEC_SPARK,
+	.enc_codec_blacklist = HFI_VIDEO_CODEC_HEVC,
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index ff9174a4e8c1..3f162b11e669 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -85,6 +85,8 @@ struct venus_resources {
 	unsigned int vcodec_pmdomains_num;
 	const char **opp_pmdomain;
 	unsigned int vcodec_num;
+	const u32 dec_codec_blacklist;
+	const u32 enc_codec_blacklist;
 	const char * const resets[VIDC_RESETS_NUM_MAX];
 	unsigned int resets_num;
 	enum hfi_version hfi_version;
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 92765f9c8873..8e762cf77968 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -206,11 +206,11 @@ static int parse_codecs(struct venus_core *core, void *data)
 	core->dec_codecs = codecs->dec_codecs;
 	core->enc_codecs = codecs->enc_codecs;
 
-	if (IS_V1(core)) {
-		core->dec_codecs &= ~HFI_VIDEO_CODEC_HEVC;
-		core->dec_codecs &= ~HFI_VIDEO_CODEC_SPARK;
-		core->enc_codecs &= ~HFI_VIDEO_CODEC_HEVC;
-	}
+	if (core->res->dec_codec_blacklist)
+		core->dec_codecs &= ~core->res->dec_codec_blacklist;
+
+	if (core->res->enc_codec_blacklist)
+		core->enc_codecs &= ~core->res->enc_codec_blacklist;
 
 	return sizeof(*codecs);
 }

-- 
2.54.0


