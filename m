Return-Path: <linux-arm-msm+bounces-104800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNdiIk6m72mpDgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 20:09:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA944783E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 20:09:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D62330BC3E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 18:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E133F0741;
	Mon, 27 Apr 2026 17:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p5ZVQvp6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766E73E7174
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312756; cv=none; b=mED/t6AC4251JuWIvGPG9r0IeSdv6J/S8SxylDi7X2zIR/DANQbwu0fWofjONMHr7SVlsPWivfo+LTsyaC4CG75UOdM+vnIVCAq2p1fTFeMvJtacTxi9jMGjwe7PlzLMZ6Pa6d5YTtMvfleHteVyGde8Y6VW/OiGKTwtBlREwb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312756; c=relaxed/simple;
	bh=xWCQTiEzfghbC7VbFI1MEd1lM2554cl+8OHIw3Kedgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sAj3LD7BJIbxtsEnK1azbDZAQrRLGZeJpEX6tIYCC3cEmhqPcadyCNE/AlapI4lKbxeCMf/nbRfHS59SSNtEOmJtkjTtERjiceC0nXQ2D2JpQ+Squxt2ivUTN4euYs7HjXeCswk1HgsqWK4Xl4egu7PD75ng4wdSRl0CZFH8gug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p5ZVQvp6; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-794719afcd4so110567167b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312754; x=1777917554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0h4F2YIx0fMm5jaITLIGlQr4i8xFco3Ysa7cVNzVI2U=;
        b=p5ZVQvp6TM0j/+XHmRcwDNTJPWaN261r7k6FsjHaTGeI285qLQCtHQJ9xgdScU6pbq
         RpNsQFtN7RSEGE+ccSPi54ek+KbCMYOH1YFuoZuHBs46NpR5Eo8xk0vC+LCdNhq4X+bo
         DTTarJZYrpketYNy2mA7zctymOEntvlvQhtitOu5ZHB8+8MGfQsFgVh54Vh4Er0AveP2
         f0u68oWeGx+DclCKgDfAj8M/8/xbGBaXYs1zXtUV7SMjrVMCHn0MAGUGNiJagr/IfImA
         JvhUohoOaU7lvLMwFTnJavaR18b3hdQhiod/hONYoGfomp2xXF9wglSoWCPdcROJgrX+
         iXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312754; x=1777917554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0h4F2YIx0fMm5jaITLIGlQr4i8xFco3Ysa7cVNzVI2U=;
        b=lApaIv1FWEpv2On+9dTyrSIEU2bQp0BY8kbBg2UYnOPFvpLoYAxQhk5584p82pZBpa
         RY0b3EUccZCNV6NbiWqecjnIEqywiZWkQ0EgOIBRJgiQLhJJEhwQ5UIRucG+I+uDAkhn
         lJYDHgjzyaorLbvf3deP10DUsP8m3RgnD3cnVVWeJg9GQX+edxcPZ0vqeKeAw/wU6mL7
         /tQwEQwpu1iLOFe8vhwVR9Tbrm4swgGd9Eylhto4xtHhZ29ChKh5Pv2L93p5AcU7oguH
         8IdIhOP97AyVP5FGEdzxXrvPFlLc3dlVupzzqbQPpFL+mg+adsnDhyygfzrTSu3B+1yo
         znyQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zHGDo9f7s2hyAsarA67gI6FO28QGMfQTuiPE/Mzpn6h5dHQ0+GkaC3txqqqMlPi+wBKe1EbD8RjpZyQiR@vger.kernel.org
X-Gm-Message-State: AOJu0YxWeM/AIGwZ933hRTAWEuZXNZasv+s17vV+EMTRsQ+4P0jT99Ac
	JLqPeaISI80gbA0jlFtHoG9KUxcUEJRT/p2tJg6SR2pMViRzSUjROdEsuX85v7o9b24=
X-Gm-Gg: AeBDiesOJpW2bJmCMKChcjxqUy3Oy+QUWKv8oeT5pVNsaQQSjE4SpEONP3qErJ+ewy6
	aVQf+HG4tjQf9deHWD4yLRUwv5VCQztqrScCaoSnQMYx0EiD8Ea/3GgbWyhHSH3PVPBIXMM/3dM
	NuCnZVJoFayhGMOdLuO4/N27kj8bbZ72CX29fcpINYJP7N/UKvaojoE7Hw8s5+sec9M8pw54PkT
	4L7bqpK3cfZ4sUTXOGYSaWeTHap0S+ZQ+VOM37wG41cCm54lQiGyHwZJhesxfScPuiegzl9g9U5
	2i/wVZ1enqCXTnQpr5iV4yr2CEVVk9r6XSpa6fsq8f8x0OMrz+xM0kA1oorsgni1ivtn295YySK
	9TVqe7M/RMHLBon2l2VopDDAwyWxTmUM3wNYSuy0PpCIZa3+EoF6mBN8pIMZv9/S6QtnhG8HVgP
	x0TThR2vj8bnefj0yX9VcVcG7r1db7Nnkhy5MZ
X-Received: by 2002:a05:690c:f06:b0:7b8:338d:7d7a with SMTP id 00721157ae682-7bceda1f77dmr4172297b3.14.1777312753954;
        Mon, 27 Apr 2026 10:59:13 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:59:13 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 27 Apr 2026 20:58:29 +0300
Subject: [PATCH RFC v3 07/11] clk: qcom: gcc-msm8939: mark Venus core GDSCs
 as hardware controlled
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-msm8939-venus-rfc-v3-7-288195bb7917@gmail.com>
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
In-Reply-To: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
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
X-Rspamd-Queue-Id: 1EA944783E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104800-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
to these GDSCs to indicate that they are hardware controlled.

Venus core clock cannot be enabled if Venus core GDSCs are switched off.
But since they are hardware controlled, they can be switched off at
any moment. Vote for the Venus core clock to enable it later when GDSCs
get turned on.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/clk/qcom/gcc-msm8939.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 45193b3d714b..420997b00ae0 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 	.halt_reg = 0x4c02c,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x4c02c,
 		.enable_mask = BIT(0),
@@ -3681,6 +3682,7 @@ static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
 	.halt_reg = 0x4c034,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x4c034,
 		.enable_mask = BIT(0),
@@ -3753,6 +3755,7 @@ static struct gdsc venus_core0_gdsc = {
 	.pd = {
 		.name = "venus_core0",
 	},
+	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
 	.pd = {
 		.name = "venus_core1",
 	},
+	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 

-- 
2.54.0


