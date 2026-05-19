Return-Path: <linux-arm-msm+bounces-108547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMX/BAiBDGqLigUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:26:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BCF581694
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:25:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 493F830B408E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97E94F7980;
	Tue, 19 May 2026 15:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pf1+b31s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD514F7970
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 15:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203620; cv=none; b=NexUU+2jQq3aEkzN14hyE0Z7T8HbET7pSvAuFxMOtWhKPOgECLqFV7ge5/r/dPUZVWQ/D4p8Wfarmw5MznhspVezK9u9M8FO6td/akZN2c2IXQEuOEVo/QqsKDhLnfqZyTpo0mXgDhpuEOl/6kkt12Ccz54FN+4ilIbtny/FoOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203620; c=relaxed/simple;
	bh=aYhaIzNwDkK+FVYZ56jaWtzX4RysdwPlvKRxwy6pzZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tkk62txng2p7EA6mZYb9OwBgN8uabA07euq6ZtTNXITangthfQjZfpiNs8mFSawc0VEcygIiuHNU7r18m6oD1zhuZ8LYSH7Mv0yqdoYN1XHtgtXZRY2PM/1NA6W15itOX49PtN+l2TWF2RqlgFfSdJswz5DZ0iaSeZKSwuPIcM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pf1+b31s; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-672645dbfeaso5019000a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779203617; x=1779808417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yfYMJnZuLLMFjOVUeUnlk0ujttfbJS66AiqGq0iE0pc=;
        b=pf1+b31sT7s0MlBVk/5TWXX0SFF4RL3QgP/g5YmRpOAiCU5ZhMon12oNTxN3Uv9GpG
         3BYA8nO29XT+FWgM3uRNPF9AZWFuEJ0GOUaFE7l1GWoImqNoUUXaVr2zjktjQ1oVxXIH
         jDGJqiYkjjM3td4PeIPh2wSVu9zvtOSIfjnbwNr+BHfmkhT4TF/XaNHclzI5gPn+SZdD
         HlRE4Z1P5nV5f4tQ+JO3q4Miv9UROF/Uhqx2c2OMGam9E0o1fAXINHPgB2UMB2utQPWt
         /GWYZKjLF/zbjCganFp1MELbp3FGkf7Im7t007WYeK4r9OBeF1EGLvGHVVRHHmURSJhh
         bI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203617; x=1779808417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yfYMJnZuLLMFjOVUeUnlk0ujttfbJS66AiqGq0iE0pc=;
        b=J7bTELQedJFlD8l06OQbsrJVgVL6Gv7QyogrQ8K8LQM5PvmMKtI8UTquqK0ZpPwUCT
         3DIZut7i8bnO3N/oMurLfopfkjppzPJXVPnMGpZl0fOGcfbF7R90j4M5Vqu1XUjzff/s
         msFjga+QZKqpG0+I1VlaVR6oLs+X71VfedAB99ju7W5k/DRHjOwTLGfad419s+u/xJRV
         RuxBgTBqQB64SyVX1bzKBLcPfo/4boBhBXBTCMiDh/O1ICK53qKTcKdDPHCM8yht6akf
         xIVV3VHFP69n4QG2ldoZZVtIKDQfKLDre1vIZvp9zE6iJq3jRgNCjLehvPNyHwQk1jFT
         uo/A==
X-Forwarded-Encrypted: i=1; AFNElJ9/8pySyp1/bcI7y63V/Ot0w3QsboayBG00LuKEHtrqzICa74PpUJ61XlGpBPYfyN1j/Ho6eloOikdJW1lB@vger.kernel.org
X-Gm-Message-State: AOJu0Yyln85TtBjSn6DTvtXIVfYAnACC/v9K0yX/sqJyMgUfIOk4FS2t
	JUCz4dac3ibofKkj05TJBH1yBFgY92B9S0jxXR/pA1ApEbVsLSAVOwlE
X-Gm-Gg: Acq92OGPyp/XuDBY7DLBBkHhft+VMPl8Ig5VhosCI5MyuboQ7b7kfLeKrYn49eeP3BI
	I16GcvGit68RHxHivCThDqGxexDHi4X+juF+yGtTMU0QNRlbopkVUye5MeKsfJ1AJ9Gi05agsYz
	vJENlFVKoU+pPyMjVL3WpeQb3MIWqsLnXam2mBNTyc1ZIYjZybPrcQ3n9wH/uUxpO+iZrK5/dKR
	xbOp9iy/uNEb2z/gZVHU17Fjz26syldgK1d2xcb0+h8vf20iQ11U2EGM84nWJET+TnP3NV47wfs
	v+5yDBSsHVQb6mfUqEgkiGCnQ1HMCp0je240PPKuCe0hOtE6KJXOnukIfuBwqNcok6ZrFuyTdTI
	WQ3W8gQQF1/yBZpka4sZPtzGVpJxR35h9xklb6zH3LyFj7Emgx0Ef1tFPFf5FCyyVZc508XezU/
	HerUU2vs9ByAnoPNqfG9+tHYzsjEFFdtEChgop
X-Received: by 2002:a05:6402:13c2:b0:683:1cc8:84a8 with SMTP id 4fb4d7f45d1cf-683bd28ac44mr10467337a12.12.1779203617448;
        Tue, 19 May 2026 08:13:37 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b52675sm6697700a12.8.2026.05.19.08.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:13:36 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 19 May 2026 18:10:50 +0300
Subject: [PATCH v8 5/9] media: qcom: venus: migrate MSM8916 to new
 blacklist mechanism
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-msm8939-venus-rfc-v8-5-542ec7557ebc@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-108547-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A4BCF581694
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Blacklist unsupported codecs for MSM8916 reported by firmware to prevent
them from loading.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index a87e8afb23df..3baa6bb4968f 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -684,6 +684,8 @@ static const struct venus_resources msm8916_res = {
 	.vmem_addr = 0,
 	.dma_mask = 0xddc00000 - 1,
 	.fwname = "qcom/venus-1.8/venus.mbn",
+	.dec_codec_blacklist = HFI_VIDEO_CODEC_HEVC | HFI_VIDEO_CODEC_SPARK,
+	.enc_codec_blacklist = HFI_VIDEO_CODEC_HEVC,
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };

-- 
2.54.0


