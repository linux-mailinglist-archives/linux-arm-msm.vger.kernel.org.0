Return-Path: <linux-arm-msm+bounces-112193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Tn48AgUiKGoa+gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:24:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F04660F87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:24:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=I1Ubwm6V;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112193-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112193-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 466A63040F8E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 14:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21D533FE0A;
	Tue,  9 Jun 2026 14:15:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A01E33ADB9
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 14:15:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014521; cv=none; b=GsvZPZWoatrYZrcQKQi9IL2l7TAGy/swPVP9kzWfeS9FXL8dyqMqrdzsvJB/ZaHFqyoPNWiqvOYcuWxOlZSdl7bp8fZn+hUecHAH85EFhdwbQIDyrhAtNNgfiCVHSTuaz911ba+M/oAV+7ps0FMSYiYpcsc4PBXs0wRL0BBq4ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014521; c=relaxed/simple;
	bh=Q08Pnp9hYn8y4XwSC7ar7m8YceBvgGMc5gaBTrBoxFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Il0ZCj72dd8gRhFFJgiy88z2cht0g3cm0StvB3HjgRqrOMZuwagqIpCn0K5jXFZI2+ypoPir6PJqmPB8ZfkeQnJ4Jw8R6uSdriuCXHPEu+4AvtPmYAcDT62/5XLexQkCyCAPP+F+aO84V61DFK10r/Ak/T9OC4vVWahyRNeD6qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I1Ubwm6V; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so19581055e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014518; x=1781619318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Plj6hFRlnFRW2ocke9lR1WLO0D2gksI3uU4IDph/GEw=;
        b=I1Ubwm6V6Rcz/e2huU9fymOGvqsqo7J2cnwYVexfjO9LAoBNmv0wnBQsknKgSno1mp
         r/66azxHahFLprshVg/9lu54a2T0217HYfoFeoCW8vi+FT9LmSv0ZUvc1mzklWDE4sTh
         2z5r+GE7Ic3x5pOlEdMViAaRml5Josb6IdOQnFOJsVNEevVyGzB/2tiDcbL+O226M5SC
         KRwtAT2CqNJRfMC5z8vCA7qGA/AfbyRAbg0ElFXcUmTogi+MaRu0p7a5u2GPf0i75BOR
         CcFZZhUWMq7KrvqRQnm7WPiplhU/f+4x06UiGQt7xAl56BFST2Rm/Z81zQXvX59I28g5
         SRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014518; x=1781619318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Plj6hFRlnFRW2ocke9lR1WLO0D2gksI3uU4IDph/GEw=;
        b=k3mUCbcmo8JdLKqDzJ+Pt20bcKPbom4xUVnc042R5Js3NGk4D9a2n96o1Ae87ApcgU
         tFnByB+Al4D9ofzXRZ76nY53dzrwvV5fREKdRCIBY37JHozqmbM8yL9UzGvOAXGq5due
         CoS4KJpGOJ14x2/4deX2+TlVougE1FTA2tSAP3BJJ3Y35oKlxwIqQTwJVspFvED7cAE/
         TJZ8v80SviGeLhbC5Y5Wq9u5Kq8+hYXoI+huGvM6cyQtbO1xllHxc9R0XkPMsxqscfNB
         H/LQbHPlXMovL+mj5V73RBVIIFGBCO24vmLQi6DBHaJSrZdtjjtK5H0R50y/4yxYhmzk
         RXrQ==
X-Forwarded-Encrypted: i=1; AFNElJ+A2aqF4A5kqJdonIfgYuyNHPGe7YhY6Re5ZeAPTn4W85NC05nXEMcTI//71BO0C3uovj1/npq/PeN64Q7d@vger.kernel.org
X-Gm-Message-State: AOJu0YwSgDec5fh5wTSFlfZTS6aj9e/6z14oPU/uHsmGj+fib04Fs4AW
	BrErc0W6LHOPpBwTSlogvKAUxoUNGH5D+uUsJPVWZr8+YFkWf4t6QL76g2v+jXVejiw=
X-Gm-Gg: Acq92OERgS4++jVMiN00u9pa3oVgfaMgx62CE00SKQ5+SjSrTCTNRCmDjkC8qeLvtCc
	WPVwrFiFdGHh8s4h0zNlK0jUupkU19A3FoY2Pex8WG5OaSfkVY/wx8FeHZSOfNO9LZBSX95Rakj
	gbJrNMPWp3rOcTEruWOCNB4EJn982TLGcDRzSLZxxxjtro4Vawugt7ORx7ZJ/OvjOB/pYDLkNXT
	72pi1Nxd2JRDjNDv+NwKpCCLMmOA+Z/s0IOJxkFJIZRXnKnoCnmtYgWKMAcj4hTyX+7uPkwZAC4
	Z6kYjkiQfSKBljrJ+5mhh2s3vo2f7LtEK2dZMw79OmaF2i8bYiglVXjqW6nZ75KghwxO0j/YWXQ
	nvyh39fQznfiYuVUoBCNs9TNgsy/b/2bFpZ0ydL9S2INz79njWTFEhLU28PIMDewZTh4lArdtpO
	+hp2JBWc11GaHMNZkthJnVqEH9dkd8y24OGEgZD/m6ZIUz7sc=
X-Received: by 2002:a05:600c:628e:b0:485:3abe:ab86 with SMTP id 5b1f17b1804b1-490c2599ff8mr363665515e9.4.1781014517822;
        Tue, 09 Jun 2026 07:15:17 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:17 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:38 +0200
Subject: [PATCH 02/12] clk: qcom: gcc-msm8939: Fix enable_reg for
 gcc_blsp1_sleep_clk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-2-5e9717faf842@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112193-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76F04660F87

MSM8939 is similar to MSM8916, where the GCC_BLSP1_SLEEP_CBCR register is
read-only and only has the CLK_OFF bit to check if the clock is running.
This is a shared vote clock, the correct way to enable it is to vote for
BLSP1_SLEEP_CLK_ENA (BIT(9)) in GCC_APCS_CLOCK_BRANCH_ENA_VOTE (0x45004).

Cc: stable@vger.kernel.org
Fixes: 1664014e4679 ("clk: qcom: gcc-msm8939: Add MSM8939 Generic Clock Controller")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/clk/qcom/gcc-msm8939.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 45193b3d714b..ffd7f14fcbaf 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -1929,9 +1929,10 @@ static struct clk_branch gcc_blsp1_ahb_clk = {
 
 static struct clk_branch gcc_blsp1_sleep_clk = {
 	.halt_reg = 0x01004,
+	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
-		.enable_reg = 0x01004,
-		.enable_mask = BIT(0),
+		.enable_reg = 0x45004,
+		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_sleep_clk",
 			.ops = &clk_branch2_ops,

-- 
2.54.0


