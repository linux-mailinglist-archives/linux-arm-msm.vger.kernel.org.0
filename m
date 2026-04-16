Return-Path: <linux-arm-msm+bounces-103422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKJLIZzo4GlInQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:48:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA18140F207
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A9AF30B4965
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B053CE4A3;
	Thu, 16 Apr 2026 13:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBzo9v3B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD81C3CE495
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347061; cv=none; b=FpOB0Ktqfg2gqg5w0nljrTUXpLpBmB/7z4YX7PEzSMlDsSwkYd4A8+Y2ANMj7odwi9ILT1a3dreU45CMgWtCHOvl9fKGtr984vnE4CzRkbLy+/8W2OCfjgRCavdawAmDvq1KWk4W+Tf2TQPQT5Guud5z0KiYqYPtcHBmG0T04oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347061; c=relaxed/simple;
	bh=bnP1qUzxxDgsBazJDYG2Zcd6T9gbhSvkb8cnNDpbGSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PUmIJF6WXiCuZGBufw9kxJzLVNbpKJGFpCPoJTCmiFdzfuqoWdcf4o6NePemtzgEEC3BVxJ+fKAkmgU/q+u8SCgBnsyGgcZ+at8/Lzwi2/oWOsVqCPwJLb7KEHfOqXlPwHtfJaVMC0It8DmMdoW8iBWmmRgzNjbvsPCN7OFI6gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBzo9v3B; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7927261a3acso79606037b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 06:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347053; x=1776951853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y32Ndil+CEYiAt6NbtKxMI4lGiTcdGiLMhKF4jZK8hQ=;
        b=GBzo9v3BUxUCrUkmYKv7o+ezPH6SNBLplrx31NRm9n9yfQOFxPazhrA74TYAvrKDU3
         qLuQbhDhWfA3MOTzHveNdr3oqRJqcySHroX5/OD2fQSTBLj3IolMTMNmIKcdqYJlrPe2
         xNSP4W3pIJtMOnQndJJglO9lrA0M16joP5CnJibZ+pR8r5wfOI0x6EayutB33njbut7M
         aKV+jkrn7MoczZgws6vf7I9Mji6dVAwjYBB6gSjHDvnUDOObk1DXR0DG7N7cLr+6KI8N
         kRjjJtABPI26PHWj35H0xEIwzGj9mdXTaPm5OR5rQLA2LTlGo7P0LgkSsP5mo4Xw6wrL
         fe3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347053; x=1776951853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y32Ndil+CEYiAt6NbtKxMI4lGiTcdGiLMhKF4jZK8hQ=;
        b=HaWczhQQoAoFT0UFTMl4Cq3YzVGX4UAULAwUN61Xj2yl7IL1HV6ZjLu/nATPp+1Rw8
         JqEdXU5URosfG4gkdiOmOmF3lecH75RQZY7GQwFmfVnbdw+H3F/93duz0YiG0zx6ZCH7
         HHKXi9dn/qB5AYSIEKmmriNjYou/rEGDoeRnmDfLZ/hfJ7W6MmtxwgLeMCt6U23KbV+a
         Qk5nLQ83VkZtzek44pI0sV9zfck2eVeLBoH/TaZE8cLyKiGLePPRQztRiO3lIbodYB+z
         CfWhjomZ0Krv3GamFKUlkJMhOIEkkxrirVqp7vOiuxPcSCQJZQ5EGLBiHB1M/0tu8Bds
         iEoQ==
X-Forwarded-Encrypted: i=1; AFNElJ8uYD0O41NwT85f6p1He8CILdo6y+x+9AhhG3nEAh0Idkp2K7OGpjw8esuAHasQHWI7t4SHK3e1kwe4IDg+@vger.kernel.org
X-Gm-Message-State: AOJu0YyvyK3j+Or5zIcSQVvMpJMOYObovfYE07iIVZ4UFdXTivOCdvGR
	NHcC7KSyK1Mapa945HAkbp/aOqkOHWhKpgK7qUcZ+lwp7C+/JsegrhS7
X-Gm-Gg: AeBDiesNa72vlFLvePeaP7d4ZMcX0ZLU6cV8tykaZClc7G2UmBxCg3G2hfJmg4mGOEJ
	n3ILuBmntnkAd+h4Zf2zILIZRznhXM67BcZQGBDYRScjpdJk53scyuHjoUDvk2P799SrLhSD0Sx
	6SePuaklkZifdkdy4PNmQMObq57o+WwPSpgj8TViBtAbn+ZcabJa15TerxEVSYs195UiZGkmYjh
	CQOHvekSZfPwE98Y9o3Cg8VX6N6kQwC4CpdgAbp+/O8LvphYW61Qu71h/FkmUEGel5eWOnGvAQi
	t2yiTnjK5XVUuogKN4VCxXPz39bDuL+x66zniaqL/9VWvIAcFUlPa6RqrqLLILEpDbu2Pk10dzg
	Dxwv9VS1mv9yuuw66aR22FTQAxOMwLrPjWIm+XwyDrpZOEQE9OiqKdKqraoc2PXcw8YZZbQa5zs
	XtGcoXIe6Ezhh0abz4IqXZJjtHoQ==
X-Received: by 2002:a05:690c:6983:b0:7b3:a5ae:4213 with SMTP id 00721157ae682-7b3a5ae4e16mr158916767b3.50.1776347053547;
        Thu, 16 Apr 2026 06:44:13 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:13 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 16 Apr 2026 16:43:49 +0300
Subject: [PATCH RFC 02/10] media: venus: add pmdomains to the struct based
 on the purpose of cores
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-msm8939-venus-rfc-v1-2-a09fcf2c23df@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103422-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EA18140F207
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add vcodec0_pmdomains and vcodec1_pmdomains to indicate power domains
for Venus cores.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7506f5d0f609..e56ce740d1eb 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -80,6 +80,10 @@ struct venus_resources {
 	const char * const vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	const char * const vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	unsigned int vcodec_clks_num;
+	const char **vcodec0_pmdomains;
+	unsigned int vcodec0_pmdomains_num;
+	const char **vcodec1_pmdomains;
+	unsigned int vcodec1_pmdomains_num;
 	const char **vcodec_pmdomains;
 	unsigned int vcodec_pmdomains_num;
 	const char **opp_pmdomain;
@@ -144,6 +148,8 @@ struct venus_format {
  * @vcodec1_clks: an array of vcodec1 struct clk pointers
  * @video_path: an interconnect handle to video to/from memory path
  * @cpucfg_path: an interconnect handle to cpu configuration path
+ * @vcodec0_pmdomans: a pointer to a list of pmdomains for vcodec0 cores
+ * @vcodec1_pmdomans: a pointer to a list of pmdomains for vcodec1 cores
  * @pmdomains:	a pointer to a list of pmdomains
  * @opp_pmdomain: an OPP power-domain
  * @resets: an array of reset signals
@@ -198,6 +204,8 @@ struct venus_core {
 	struct clk *vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct icc_path *video_path;
 	struct icc_path *cpucfg_path;
+	struct dev_pm_domain_list *vcodec0_pmdomains;
+	struct dev_pm_domain_list *vcodec1_pmdomains;
 	struct dev_pm_domain_list *pmdomains;
 	struct dev_pm_domain_list *opp_pmdomain;
 	struct reset_control *resets[VIDC_RESETS_NUM_MAX];

-- 
2.53.0


