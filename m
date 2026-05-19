Return-Path: <linux-arm-msm+bounces-108544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJbgNYeFDGoniwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:45:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3570C581ABC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D124131FC589
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3ECC4EA386;
	Tue, 19 May 2026 15:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OkOw7HDb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D244E3774
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 15:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203608; cv=none; b=dcbSRZSF273wR1iB/ZgiHotGUayvSElCfzXo/MC/dup6KKredCyWwrzfRikEyiA+0kAQ8WwWHgcHr9Q84PXRyrRct5LOmQfbEAlnK5uQUEuKAFUvkgbrMvukeA/B0+E85TxoFSKHz8/mYdHX2DFl9aO3a3hxbIBUO8jobAILL6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203608; c=relaxed/simple;
	bh=U2Bp/Xc0dTJFjq2uSqbXXCvsJyGOH0R6f9lCOAE7i+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U+2oPFPgC62nM4SzMXSoV+AspKRQUzRdTQ+hgkjUefYqXEuiWNQQFAYP3iX2d7tFvHMWj3JwC77eRzLL1L2t/j6E0FJyzTsc8ghrzG9tqiIDH2aQG/3xtoYIpNXKP/0AXz5kvzfwuGcPVD5+LOGDnXriP/AdF6///A7DP6EvSjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OkOw7HDb; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-67c2b4809baso8385071a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779203605; x=1779808405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C/v05q6UOvuJ4DYkluO9mWC+JtH7XndlyQ+TlGglxGQ=;
        b=OkOw7HDbEdUl7wB5wpkAQUXhhtbnB3+YiHNuBflnr2F5XYojoBmtx2DnCziaeuZ0YO
         4nMkSf7ncTPAl6tpPWHXFQbyFkFprzU4Xg84CuWitE97QYn65zIMUk9P5jv0PpOw445y
         eak5jZOoRK3wrPj8X37Dvf2a3tD78wlg3NPj2aW1yVFiagmTVyfUmwZA/dCe9jaWm03r
         o8X4fqhiBozPjwXX5AjW48GhwMAIoel1C/GwvymBSKLyQTM5Ch7b9xUg3B05o2sWV0fr
         nmlN8Ya0mgrgKiINVM+aHLf2Rqs2oc8t0aBvob/BHCozJjbcuAFMrzLefXHHvu6AFdX4
         JFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203605; x=1779808405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C/v05q6UOvuJ4DYkluO9mWC+JtH7XndlyQ+TlGglxGQ=;
        b=Rkm80NRvIiCq5ukOV/wpNTM1pO+1mG5GV9kJ4sbuoPLxc9dCwrwEHtBR9qp9lzr5iI
         iypL72yASUuqSdQYjnu6n1J9OvTm7Ac6zz0/4Wqrwel/t7218dsyhBqwgox+f/SG+Zo6
         alrSCCZYskyoFPanfcLcoJQmdcrdAo5uixgaZXqnYYXBH2PWMNAiblleHhcCM8GvUrCs
         nPcjNi/nM2IKw3i6aavg3qC/KWeZX2kjEGUnN6GZTIGcsf8r8GVMpjSHh3jlI2/nmvn1
         f9CmGMKcPPs32gsvUlqaECCoNEA89yozlCgmEnov1akEyzlhILZvtOk4VWL5Q+iQyeGu
         hKXw==
X-Forwarded-Encrypted: i=1; AFNElJ/SnChwRYYn0n+FgIundsfqxCucxUkm4JfGsOV1LF9meXTx2Id9baNs47SOiFRhlzfKKGmjvqJWVoYo2ecT@vger.kernel.org
X-Gm-Message-State: AOJu0YyEQud1TrNOH8KOlw99e+xmsFDTKVryeHoXtUytgNUAMNe7TomL
	Du4ZM2q0ScGE+O2iBZDGaJqls5Vmn3W9+7oteMZVXQm0uy4vNGQ92YtO
X-Gm-Gg: Acq92OFtOIRqqw3WXiIs/i+UKrhEbIiQy8sn11VPQAO3f2B5nNWDNpdDTpv5Du1muhg
	2eT7FtpsSH1y1Lmudl4CCIhBqrTi0bQaKfTlB3PpHAbCUFsVYRQT0mm0YXVbCzqllpOC+D2eNTl
	PBeQP0sDMRcK4PKafCbxLgsDeMTz5PeftwjQOzBqfVic4eQ40HWloSaN574UntlvshjLKUzqGhL
	ZaSqmgMs9X1xTy9IcOJ1WzwBdxIb17lRhDueZCpfSY+ak4vCCvZmPVO2Rs/T19S5OZ4QRaMJsAJ
	wHaWVkr3yCwLiN3AMg9P9Je49TJL2JVsqdW0pjw8x9HnPCpsFlHBxMO0aRcZW/1dr9/j3uAs9vV
	pzyoKftT0AINkRyIFNCXNll9JEqVNO/712NFx92cdhMJDWQL91xuP71qzqNSVEhu1ja622HGnlW
	HqQEYZMp2H4xAmZRXEzkpagH+T1eEC+/18HBDa
X-Received: by 2002:a05:6402:1357:b0:680:ccda:55bf with SMTP id 4fb4d7f45d1cf-683bd095c51mr6997580a12.16.1779203604701;
        Tue, 19 May 2026 08:13:24 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b52675sm6697700a12.8.2026.05.19.08.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:13:23 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 19 May 2026 18:10:47 +0300
Subject: [PATCH v8 2/9] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-msm8939-venus-rfc-v8-2-542ec7557ebc@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108544-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3570C581ABC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Allow Venus core GDSCs to have their control passed to hardware, so they
can be powered on by Venus firmware.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/clk/qcom/gcc-msm8939.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 45193b3d714b..243d31a32e92 100644
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
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
 	.pd = {
 		.name = "venus_core1",
 	},
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 

-- 
2.54.0


