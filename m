Return-Path: <linux-arm-msm+bounces-104538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODMvH7oJ7WkEegAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 20:36:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEE74675FF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 20:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA2B03060AFE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 18:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EDD6379987;
	Sat, 25 Apr 2026 18:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrF3ZFKe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC60377EBA
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 18:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141900; cv=none; b=PtA+6TjvDdnTwmJAm0EEm5FFZyQZZPWT5GOiT6/YF5iZHXk/bE1s5jyRf61Ub82AZqhaIahJo2GHbL+9EVpNv7Mke6hngOvoJ+ml/Nlu01E4SYwa0OH88PzQS95lh2y/SijisTvaSDHbAHQkHOQ2cu9I4dX+aELRt4YJfEE9DGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141900; c=relaxed/simple;
	bh=xWCQTiEzfghbC7VbFI1MEd1lM2554cl+8OHIw3Kedgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SoSkxuQiWTB4x5NLNAQakH7jsWwhZIpcIG3gnqMzD+DVtxKNzU2Vr3L/fICEk1U4sML/32xL8xyGobt7PpRXb/i9WD+Vrk87aOItli9gv6VwexQHUnLFnDaqH6H8r0rvsI4oUsY43YtRxsY0oOV/BXtBy5e1V2EMLBBAyDe7WzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KrF3ZFKe; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48374014a77so116311555e9.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 11:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141891; x=1777746691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0h4F2YIx0fMm5jaITLIGlQr4i8xFco3Ysa7cVNzVI2U=;
        b=KrF3ZFKe9Um4Y3L4wnLDRe9n+wB8r67xgvFCC4NiAHHcFkHppT/aic0emKbhfjOr52
         iH09DmjVUvThCR3+G73rNsinQoTR8qrW3SormLF892Hi+xu4ryjXo6V5GavbTX5l8eXu
         BVSO/B+w0fOjFEUUlRHvSfB7FDw7rF6O42q+tXfVygchbQsG4y/Kc3SSsdQgN34OOftE
         mGq7AXjjIoBSfdivAtVSkAHVEqDY8wVr5laeU0iu2JZ4Wxg/EG3Lhz1DeIzPlHpW12OQ
         uMHldYFtefdqF5C4p3baji89Ri2qjAn3jL6oHekijl8ijqPNPG7jGy8gYJ8ImbxQ9qlC
         gHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141891; x=1777746691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0h4F2YIx0fMm5jaITLIGlQr4i8xFco3Ysa7cVNzVI2U=;
        b=ZOdR7KMyckEp4oNg1Dbm9d6qL7XPXvCNh1PPQn1GEa2EAQKhrcgvQrTN+6q7Nl1isZ
         0GMV2Qt6KUB7IXPj8MiyIyk76brFD2e0luTj7mbac81raBk/LH2zMaqmOfLmcgN2vyGp
         vM0NbFRldUoPtcTvoNXuj8qU5q47psuQDF4IIoRx6x65+CFUR4fkCSYfEjiBKm8VlWBL
         30Eaun5RL7xVggdPvmtjky/u3egcXS+2KMCqzNABxGi7X1OKF3vnfQZ1j+bvKAokXwF8
         52NL9xoMz059Cy8o1WgB7QQGwKr41v0obBCksBnoMObvcpsBWq0L9HRBBjliycdfcztr
         dSNQ==
X-Forwarded-Encrypted: i=1; AFNElJ9UYz2vM4IuKGhHfxACzYlw1vdoT0eUsfSr+H7JkCRvz1F5F5EA7UEpGtREb+V2wTDXnV7NxBB17WSL5Wct@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi8NN+vpwaclckL9RX6fowTikmjDNQjWYzkQIvdCzeYuMdePbV
	Blaq7xlgur97honyKkkN4z+qj8Sv6DgQK6LfrwUKcp58dg7Cz3yKBxVQ
X-Gm-Gg: AeBDiesWh+644LZphEjlhzskVMma4I6SPII81r9FPVaK4VXyCgN4oLsZ1ntugckI0hG
	g9dAZUA6bcQM+sN48rsZAsS0LwJlDH5g6ftLFP8S4JYgEvB9DHzWHwRyLP3PWix4Ipcvauy0gPr
	e/oRK+hIjIsRFTSVrso0Vq7l4UUzzDm95WWLxqxp6/iOMqBOSQwWSCVoV2/vweYbL99Tm54HY//
	G9xIBNPyMEtsiR2IpCzQxsWCHRoWtK+K9ziYDepjWIFHHUIU9JHkxCUr+Ckox93zFfjB6cuDh2o
	eLKldcsMuE2S8hvTL52UCdHwO6d20Ymr7R93RajNZ2sqDgxsgimxI9hXGFxj4NloKUELe9ZHf1J
	vAgv9Dhe4gXGo4ZrGeRObt6S08mjPrUAMRh85Vun+OjY+x7RLTc6lRciaxYBNhXXnrHQGhlI5ap
	xUgt/VYYEb0CAZUG61R0Z14UgFRXRXOWjS8mT/6bRkUePlZg==
X-Received: by 2002:a05:600c:1da1:b0:488:bc6a:528d with SMTP id 5b1f17b1804b1-488fb785204mr579670405e9.22.1777141891411;
        Sat, 25 Apr 2026 11:31:31 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:31 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:08 +0300
Subject: [PATCH RFC v2 07/11] clk: qcom: gcc-msm8939: mark Venus core GDSCs
 as hardware controlled
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-msm8939-venus-rfc-v2-7-f69e52b36207@gmail.com>
References: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
In-Reply-To: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
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
X-Rspamd-Queue-Id: 9CEE74675FF
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
	TAGGED_FROM(0.00)[bounces-104538-lists,linux-arm-msm=lfdr.de];
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


