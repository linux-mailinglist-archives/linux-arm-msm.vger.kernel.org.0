Return-Path: <linux-arm-msm+bounces-112196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vI8LFvkiKGpl+gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:28:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B9066105C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:28:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=haXfyvEo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112196-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112196-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2A45A30932E6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 14:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F40346795;
	Tue,  9 Jun 2026 14:15:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8653431F5
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 14:15:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014525; cv=none; b=sj6mh6PAbP67GDs57pSSyC/eFw+yZADLQwaSV2BQ3YIQ9aPrAdtecAH0p89PPZVSnrJub6pP4+xLI/ZNpJ54MD2VojN1oKnqSl+cVCON10TcRRdKTf2MZMiOsNTv33dUcMrPZtaupxBkg9JI4TxrphIb6gf93ajE2SArd5U9UcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014525; c=relaxed/simple;
	bh=ej9p/9bQNkiwdVcT+ypbUdG+Fj4hlOWg+YTcRiul/pk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hQk0ypurbmXF0Y0UCeckrrclgm5WTiGKqOBmsTCRDMovtnyhUANw81jbhUDbfPxVNjXElIWX465PodeL5ZW7M94TFd+tX8d3eT5jEobZBrlkY2K6QZLyXtAfymJs4uE7vA9nHS7GR1HvbeJQwDxVkkMb56lVxSD1MLfmbg1BtE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=haXfyvEo; arc=none smtp.client-ip=209.85.221.47
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45fd464d51fso3050634f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014521; x=1781619321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pglUIua8WjARODUMozEmu5xUT4qkmtEixeHke4+/IOI=;
        b=haXfyvEoH8CVLREOabADEEvTn7Eg99oPzBveh0m4Ur4FboZFiMEp07QORYaWqpj7HW
         cRCAbeO9TZSgNco2N88XXFSaSPL0p8P+ADayx31LaBDkZsjXYZR9ZxJM/9wseFAtQcG8
         K4XUoj8XATwQGriCfqm9MoyEV9GzauBuT5vGb0b7aNeWoxZcSRp+BR5B5bCY+wc9Zatw
         szuucvWSMAOdFuXEGGPZ8cD4uRjv/sSrSoiDYv3KrdhR0JRd4nk3LlZroeDJSib5RvB2
         BUWICR89ep3t3v7Q3A1ApXyRfCVcRd4lzpqjZHeCNexy8YfpU4LLAEcT3ak8QGqykToA
         i59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014521; x=1781619321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pglUIua8WjARODUMozEmu5xUT4qkmtEixeHke4+/IOI=;
        b=ik1yjMJhS7V2Jyd+U4p0kQ0nsEUCAJWNkFmXZPun6SRlVdAmiPY6dBNZc2BWP4Xu9+
         t5Ok/UcT0R7AIGazWoH/W52clg0S3X936norRtBjXsf8GiNcV/8kBnBMteAezk9GRVCg
         bfYiGz1qSfzouf5veLELu8NbyNYw8CaU3IDFYmx8E3a9Jeqqoe3m74u/zgsxjWp3c4om
         GLaefvaq1ZJnp16haZeO1fRtISVeZYc2X+A/KhbZ/eAn5O660Uh/ekPJ9xFopG3XnT//
         UMiTueox+xm4mo+VilAJxj9NSzSGdyu1cGR745/PgTQ7/Qd8ytxmHO3bnPV8BfR0d7M6
         ClMg==
X-Forwarded-Encrypted: i=1; AFNElJ+txod11SqsMuEMQ4lom6nugPoHbNdShLpktgvu0iHEk7/tiVePf+L5Uw1pRTO9/Pn+Ml+7QygW1Uz5l8OL@vger.kernel.org
X-Gm-Message-State: AOJu0YyuLeMNDOZs/LqWglyK6hxpIMSwy7UTMZ2L/c2HndrldEdQ2AH9
	dnIKQBZcVQJsUOtF2Zzg153qHJYkqXEj3z801f32TVLpyhC3nx7+rIy8l46KExGbTPg=
X-Gm-Gg: Acq92OFtISbtvSbZ5OpCrW47QO66u5mXTOS90yrZUNcGQiBuiJY9fL3UA8g+ibgdGyB
	rZwcH+Ibxqs/ojGMYGv5z7rfDtWUPfk0Fo/B1gyv12tbgRH4wFRuGphTUxmKR1ju+iDoN5AAYil
	kB6YivKqEqEYe4aBA4vkszB/Ihk6rDmzqmz4t1Y2RNLUt0UHNlbD+Qmon/Jxk2jj3MW1aCASGsm
	lVJ5Mon2cr4NUgBbcIrwUWXvURkj5cUcrZE7fVJbZ5eAg4Ud+3F4inPp4nHIQmkLxGWKIz/5i/j
	ehi7h0fpitXcIpRtncW4IdBWw07XOc42Ro7mSRsXhxVyXDv9sZsOxjQFrkWZz8vJW2ShwUr3xpM
	OcpvFC5AeeU8ck2dTOkE5ylLp5UEVSNMXNGvm7SboIUxdrggkqq9pPvPccY+SRk5DzWD4za6YlZ
	GKVyzLoKIqjeyje9ebtEzf705V1uy5rcSOy8g6rA5PiA8p8kw=
X-Received: by 2002:a05:600c:45d1:b0:490:b9c3:6c62 with SMTP id 5b1f17b1804b1-490c261007dmr322915635e9.28.1781014520941;
        Tue, 09 Jun 2026 07:15:20 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:20 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:41 +0200
Subject: [PATCH 05/12] clk: qcom: gcc-mdm9607: Fix halt_reg for
 gcc_apss_axi_clk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-5-5e9717faf842@linaro.org>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112196-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 90B9066105C

gcc_apss_axi_clk specifies a halt_reg of 0x4601c, but this is already used
by gcc_apss_ahb_clk. The correct value according to the downstream driver
is 0x46020.

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/clk/qcom/gcc-mdm9607.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index d0b08b112fed..8fc3ff2559f0 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -1463,7 +1463,7 @@ static struct clk_branch gcc_apss_ahb_clk = {
 };
 
 static struct clk_branch gcc_apss_axi_clk = {
-	.halt_reg = 0x4601c,
+	.halt_reg = 0x46020,
 	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
 		.enable_reg = 0x45004,

-- 
2.54.0


