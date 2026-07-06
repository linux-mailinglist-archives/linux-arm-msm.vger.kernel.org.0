Return-Path: <linux-arm-msm+bounces-116916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mpZqJnnIS2qzaAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:23:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3572A71285A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:23:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=w5IfcsvN;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116916-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116916-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0AAE8320A01A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 15:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB2B37D11F;
	Mon,  6 Jul 2026 15:02:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ED4370ADB
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 15:02:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350175; cv=none; b=t/TdeK1LAHDfw7sIIR0uimWV2rOn86xtRJRzYARBtB5TsRLXWC7hP/w6D4zSfnOHS5b11/qnM22tkb0J2SlcPWvo7mC1nJ+73UUa7q8vy4UiG0/C6rCF/i1B3HH2sdDuggqKt6UFjhiDFh0f6p+1tLy+IwIeY1sE3so9gYCHjUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350175; c=relaxed/simple;
	bh=ddXLZ+HAKriga+ZifOzvmEJGEglXjZ9S0Udn0vu+zgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r/ZYeAMz3srtNArUmql1uwHMTC2vASWsoMDxwzEe7A325A7+KUYjQXMly903EX6PnipbhuX7fj7CYclOKuDmp3bUmwna3yVBHen4uAK6XwKWVOx5q8jr13zZXWECi0Q7fcAUSylcLkAoyhMDiVm38rqDUPgN84PNx2l1xRI75lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w5IfcsvN; arc=none smtp.client-ip=209.85.221.46
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso3298939f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350172; x=1783954972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eER6i8TYh3jl5VZ7OJH5TeeR2E0/0LIEAZOr3oq+xIc=;
        b=w5IfcsvNwg8EyotaJ/fXkXdxJUINvZzavp5qZ9LKR3T4tcZp4O2ifrePS4UvkQMYSN
         Zub43qy0vIQUAscmFyV6+qsiVV4hZNanKg/mMrok2UeJEVfBjAHlb61SGF+Gqez5dwmx
         rkVjHnh8YCfIu5ZXW6wYDQRtraEL2LsLOyltR/UytZllnyb1ORpJYoQuSx1b/cA2d6Zu
         blpCq86CG141YwDfUrvhYl9oKqQqYsxnJoR9/7WFBbn5yMqjuE7jM4iGqJvsxcrpF+a8
         yBMLJTI2LYNiMCqA2UNgyiCPRbBP8L/i/ESRfZXVEuOnGenBkvhvKDnLT5AAxQnRioHw
         9bfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350172; x=1783954972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eER6i8TYh3jl5VZ7OJH5TeeR2E0/0LIEAZOr3oq+xIc=;
        b=RdxkBOQ0Ab2lEjMgZNjisqtq3B/NFpweHdO1WtFm+DreOVx3t3Bcm6SmOOxFsQt27F
         iI3G5mC5dzQz9kKfLPc+pvWmYyY1a6huupZRnTnlaYQprM0kTxo7qvf663C5PbAExNIQ
         Yj+kmxkxTuuXWWtabJEAzl1H61PkLqYKfIXCJmVNPX602HKEzTJ6buWsyHrWp/RkmYRV
         nYcEvp1CQcdVLQElGEDsxGMIk1VmnH89mT5SshMWfPhuVmC0O2miYakVBcNWOOMMFQuw
         hA3HkK94/1z2/4yKdhi2SqN2u7DsMQwfHBNRmjvjM7j6MNH4uoG6t0FNqTjU0+BWuXq3
         No3w==
X-Forwarded-Encrypted: i=1; AHgh+RrXdJkhvCpZdZ9vo886mM6ukUbZKCPV8HuEs/HsNrRAPvpPDm6evKC7JBSDQlORtNYant2+8YLDv6tIX3Gt@vger.kernel.org
X-Gm-Message-State: AOJu0YykeN/j8ns7V50+PdLwNpBPiprZbezVpNySvkoZKOLFRmP5mjTX
	NLL52oD52a8WQP73oW5RzdaXy+hLtTvuMm5bT7GV90XcqOQa1180H3k3VgLqbxZaxIo=
X-Gm-Gg: AfdE7clDzj9CbBEt0XX4TN29nxY+6McqFIBg7gwFYJVtb9QPrdBhSmRHreae6Ekk9Wz
	P50ncZSa1AgTZHcf05pijxjPhQn2nSt2n7Eb+wczolTLLyZr9pDZxj3KCP88yeBvqs90G+ZRo98
	7YxiO+0aukPPbOTeZdJ5L1ygVoKFLkrISWP0ryYZ+F4M6mLUHnhGNxcqlUjtjqPLAc9LtPVTChh
	jYoau0rApxawwxkAq07IePR2Sl8Kd0WO9QnyzOu3vwUej6ptPNHVQSTDLcbqmG12aWv9iOoz+JA
	FGfPIU1AZuKcd2Gy6hfGTq6fbibBhQm+KjhVnKY/1D04V3Vg8HMIUZWJwR2rPllxPuN77vvhqMp
	udwAj9PctbTo5451vgchGX+8D1xIPERS5Sb8V+6fEhZumG0zZTAwxFPNIK6tLJXNGCoIRgtR18m
	2SWzz5QEBUmWerrMFZYIuQliRosw==
X-Received: by 2002:a05:600c:c3dc:20b0:493:be36:94b3 with SMTP id 5b1f17b1804b1-493df08b968mr8675745e9.13.1783350172207;
        Mon, 06 Jul 2026 08:02:52 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:02:51 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:08 +0200
Subject: [PATCH v2 01/12] clk: qcom: gcc-msm8916: Fix enable_reg for
 gcc_blsp1_sleep_clk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-1-745565101869@linaro.org>
References: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
In-Reply-To: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
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
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116916-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3572A71285A

According to the APQ8016E TRM, the GCC_BLSP1_SLEEP_CBCR register is
read-only and only has the CLK_OFF bit to check if the clock is running.
This is a shared vote clock, the correct way to enable it is to vote for
BLSP1_SLEEP_CLK_ENA (BIT(9)) in GCC_APCS_CLOCK_BRANCH_ENA_VOTE (0x45004).

Cc: stable@vger.kernel.org
Fixes: 3966fab8b6ab ("clk: qcom: Add MSM8916 Global Clock Controller support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index 9c7c6b23ce32..e91406e6f527 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -1589,9 +1589,10 @@ static struct clk_branch gcc_blsp1_ahb_clk = {
 
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
 			.parent_data = &(const struct clk_parent_data){

-- 
2.54.0


