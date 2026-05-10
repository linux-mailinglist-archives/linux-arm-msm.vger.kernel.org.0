Return-Path: <linux-arm-msm+bounces-106805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDZmOQlVAGp5GQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 11:51:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 557CD503756
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 11:51:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC54130413BB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 09:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22E137CD28;
	Sun, 10 May 2026 09:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKvODCBM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED13637C930
	for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 09:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406488; cv=none; b=e5tnCXEJgG6UoTQebAYBOFBVkp3X+Wh2dmC1O+VhdmSJJe4BKXNPTKrvQDjrGpwbzwh3qzbOKYpcfU6TpiQWE4AmmbOxw8Q191Id8pBb+IRYeV4eu/MuaO5x9CajtSxGDbXWpRDV8nOUlrIaT77CSe/OfBwZJ/TttxHQxjK0SGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406488; c=relaxed/simple;
	bh=LVWWWUYdv9PCfUhr1DTi4tk8Hze1kjyRj4+I8oegEow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r0AXJtZGK/UfqzQLMWI2bJVnNTr5SkQp3PgVl7PBGEQFLdak4wicIxZb0VpauMssTnHxzy7eCT2wgELUtTy5kgoGyD+jKQCEepfEzraGy/BY9K5Zos4KHa0zP9nW8vWlATFuTbZaVss2/vgq4G1Eldt4BxtAl2z0mlPaX7BjTWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKvODCBM; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so25970265e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 02:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406485; x=1779011285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pgYHSDLzlb7ot3DGMDiEetIcL4BenND3LUUZjAQekh8=;
        b=RKvODCBMXGHFhmD+8r3Nqe0oYd2nUXpE3d7VKaUzaj9Bla3JjpSb90JCwiz9ASi50Q
         Smhy3PQ9U6t3WSsF3BtGjAMHkmkAl1ZmCAW5U9T/qhigXX0qym9bsOLR1X5mMCL5p00+
         6OVrDcHWOgw6L2Hr8eCa624MwnriX8hH2T3e7zeRsfkHANW3Y8maceDumTCd1kiYk6Ht
         ig90YfLXoT/qTRt7/1aw9AoQvD5V35xxnOWDfuLD/k6sv/skdG+ArFpNfQEh5t+lx2Wh
         +/WB6/MxKSvzCz4680wdVnZeT+jVJkLfYKWOLu92HULup4Z0tlmoha+umPFXK4xTCZln
         V/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406485; x=1779011285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pgYHSDLzlb7ot3DGMDiEetIcL4BenND3LUUZjAQekh8=;
        b=bT3nsSkb4EesPVMMk8+wC4h8HoCnMv24SvRoXNWiKF25y2sipCN9bxJuKzvOzxaWNV
         HrZTPL4LEI8sarGBW9hnPkPTJj/cLWDoLvaGBQ+e7AC3Dh/ttSLbV128ZNqKTeM+8LlQ
         EGElJAUwHP0e2h7gJTi4iL2HT47xZ7W3MEbcCO/6Xl6e5RrVEagtRbRCaXv3JpvdbM26
         WAFEyYvNwsNA3RhsSp6nXeX73bm/Jc+N3B8SjSTKxn4U3xRel61w4lnlArUU16C/cWem
         71rhdZ3qZDAhDPHBgQGDMiCROBRMKeMd6u1c253CGpdFwqgLhoexlXVs5eCUOGB6qz9S
         02Rw==
X-Forwarded-Encrypted: i=1; AFNElJ/5CvZqoCF/O2M3QHsDuX5/l8cl5wJiFvLMcY/OcvTkn7OPM08/EhdYff5gyrcVR/Ff5bzj84e5RthzycNw@vger.kernel.org
X-Gm-Message-State: AOJu0YyDeQRjPtwRLSu/7yhVv3H4y2h021YS6MJPzgt/W0kF2yO5nNkr
	yfR4tEnLLkRXGVIhiPi3Gw2gldy9Fm4SMZ5nuZdNHCH3u7JDntplUO6s
X-Gm-Gg: Acq92OFMoX5wtijMCRNVS//ob+U8IB4/5F29QzvvMbEmsE+hM+PLvCTB6nk9hbYkih+
	Q8/ps2AZAXe/kdam6nipHZsL9TWCoNjlwkeh6tmP+H0N8PwVpW0Ie/ah9ok8wkcVq4CsWNRdpW1
	qU440GdcLT16KdAzS6qbvwIoN7EAfM5G4EMuMDh1MKN5vejS82PyFqtxpyf+VBRhW6ozWQfzY+v
	mn2tgHgTfBYX8+SR7UTzI0ni8t+7f9ChgXOf9ofSUAAnOAzTaxkvZH9xQ2G1ST/g2JzzPSMcFbX
	heAfZYjT86Q0Br3r2qLGeIxNweVt1JbGslPGaLbyB03IQZNok0UjutYOVqEOAmStuEbBY6k++I7
	PbHKHa2rqNGLpOmWtLi8YkDGzpxyZ1wjZaf44svSxiTGB9yxxXD1e/luIUbzpz19XOm2jjPPAdd
	wXL53HYMSFsMVisk58ZFbA9qWPfebr
X-Received: by 2002:a05:600c:3b8f:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-48e642deefamr174341785e9.7.1778406485414;
        Sun, 10 May 2026 02:48:05 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0bf2sm182807925e9.4.2026.05.10.02.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:48:05 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 10 May 2026 12:47:43 +0300
Subject: [PATCH v6 5/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-msm8939-venus-rfc-v6-5-e69465375900@gmail.com>
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
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 557CD503756
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106805-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Action: no action

Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
to these GDSCs to pass their control to hardware.

Venus core clock cannot be enabled if Venus core GDSCs are switched off.
But since they are set to be hardware controlled, they can be switched
off at any moment. Vote for the Venus core clock to enable it later when
GDSCs get turned on.

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


