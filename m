Return-Path: <linux-arm-msm+bounces-103476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNSKEV/c4WmtzAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 09:08:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A53417B66
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 09:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8B328302D77E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 07:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B99934572F;
	Fri, 17 Apr 2026 07:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="KI0gSCtr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2253396F4
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 07:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776409678; cv=none; b=Ui95tWZF2wvzPQ+CHF8CfuHjvFuRByuW554kYpRIrw7R8oSojNy2Tfl7k0Ucs++jdS/IaYLB/yx+QB8rA7zLX95aBH4ALoxkLCels/zaPuwdztyH1WZVDAVZJFeDKIAoTQ9yEjJeKtkOiZhvNerqMCHx1PxGOZFt/lbEl89PR1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776409678; c=relaxed/simple;
	bh=++e5FZB0tsvADRX7W3I2ua7//VvtHVnA0IB0LJVNzdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A+RcT4Ol8lagJ6AG28z55RfZCmIqyQ+wokWB03ZdBd0yVuPLU9W7Cyd7CxwqiNZMuvHxIRc9FNJXVU/PP3A/+PKOqBjPh7uPzOGQNuq6y9u0inTxMMHk/CI73NTDvbhh8SeAb5UJRKQaXbc5PsQW6KP6HDaxSOW5qZSGK+2Up7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=KI0gSCtr; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-672bd8d2400so671384a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 00:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1776409674; x=1777014474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JjyHbpSUyn7H1fP6Lf1b6SGYz/5Pq+5nMg5uPxkZH/0=;
        b=KI0gSCtr1Vqld7CvrdNWBKb6UUd+HiAFPp4Id5DFUBk7QOcmTvJDgbidO7AKF8vu7B
         w9tx1ezniuwjYlGUcChECpk9VvGmHokLHnKNamSFthjuyyOLO3sDIzZbZwkkBA0oCEK5
         xtW6pP74QqeBjYgbhXKczwBEnP4E4QV+T3+GiBD6oGTukDSoISJs9t4vFDxsrEp+JH01
         U4T8eedDbPSZ+dbVLFeJK9M0wgTail30zkreQUW3G01EbqWi9CXtZrR6LqDRnNJC0ZM/
         01IvuDRcxsrjCtzleWwT2+1x0+d1Q4Kam1me3yqcymF2TzmqEMnHdxjgpxAd1Dhlawi+
         glvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776409674; x=1777014474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JjyHbpSUyn7H1fP6Lf1b6SGYz/5Pq+5nMg5uPxkZH/0=;
        b=Vb9QopjMoZnLC/mVY9dxCmdXk+te5OtCj6bY4L0n+hl3JJkOODSi3ypcikBdCle+w6
         c0y/vY2CFqBe9y1zbvFZ9XqGA3gFDCgahyQxi8YGdTSDofWaPsww7aZQuBE0afcAdr48
         2gvZNEc2oJAMk4xwTWhU+J83ncsdCd4HmXsjTWZ0WoGXU5BI3WzxpzDaZB6FyJATHdlf
         2raNuv1Y9gKy1UHHLxrd8qiCnNlAyHkhR5CcbnGNeVtCqtrErZWsWP7ixyy6K1VCOeBW
         wqesqBA10DPryZ3CYqOMXnqZMZT3G6km69cA+5qTcevIGBzBdd2fJ/34JJ5j4wH5R7Dp
         czpg==
X-Forwarded-Encrypted: i=1; AFNElJ/y4GSx58N+cXwtMZPvvB5KDdQjtftswO8HycNa4Wf7cAIs00+2JFvxPvCJ87RsdK+Ys1nILqxlxtmuHDF/@vger.kernel.org
X-Gm-Message-State: AOJu0YyYxY6bOZNOyIvsT6/lk/WDGAdqS7J1TG3TkE2ZU2/ofIXWNY3x
	IrT+34n7zYCgNvzjfKCxQ0wZoqSKnY1bPMB1dlpb7yDppzj9DDP36GmAi+Qmthojl14=
X-Gm-Gg: AeBDieutzE5s3iKe0liXkjUdr4ErrvO4L6cq5e1ZRt3r/rnd7LxLdx5D//30g7Idn0X
	KrGYvHzmLcXjaRtihYNZBaTwzj7StPykkYJnR50HP8UZJNiEtaG+OPbWZGTIANVG4WO4rCH8L1R
	i32fvO/UtLLRX6AFyNiz+GRpXTsbd5J6qjkgVU/UsCoWx2VCQAOZLeVxZ/4h0eXOj3SWHMrARUt
	DOxsMJWec6ZuVyE6CSimjjUV21TxhqDJn84Z7Pne9ztSdsWYtKhdZAQQgtwodblimoY+9WejAbl
	BSwlEWBJ28AD4v43gNc90++4O1vPhAKeOh8ui9VI+Zbxbdz2o2yxjJl6tztwxWioMw4MfTUIC0U
	InAzvHqa+RI4h1ocz8LrehZjkWlwPSWTvvKfarT7OIIX85VYDRsWTa6zPfEUTIM8mg9lA8NmzK2
	FPESq4uLXSr3DuPHoqi6qSf4te8/7ibZvnoCjo01LH87uQnjQN3o9T1yNwqwTd4QIL2pkXcGFHg
	8SpodD4nQEkFMHG
X-Received: by 2002:a17:906:dc89:b0:b98:6926:13cb with SMTP id a640c23a62f3a-ba418b7e13cmr85858466b.9.1776409673778;
        Fri, 17 Apr 2026 00:07:53 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451cdfd27sm26448466b.26.2026.04.17.00.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:07:52 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 17 Apr 2026 09:07:46 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: milos: Add GX clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-milos-gxclkctl-v3-3-08f5988c43a2@fairphone.com>
References: <20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com>
In-Reply-To: <20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776409667; l=1066;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=++e5FZB0tsvADRX7W3I2ua7//VvtHVnA0IB0LJVNzdk=;
 b=8898ctpJBm3z6J1Uj5QTf6yngGfQCbUWxKiZsXVNy4Ta5P8d/CK0C0G4aB6tnCpRQPEcfJeNB
 L8jWLKqiTU4Av8SW1RkWv8ZYRUHrsnE6+elqbkdzzz/fze4rBXJsT2v
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103476-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 05A53417B66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a node for the GX clock controller, which provides a power domain to
consumers.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 4a64a98a434b..4bd9181ca03e 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1542,6 +1542,16 @@ lpass_ag_noc: interconnect@3c40000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		gxclkctl: clock-controller@3d64000 {
+			compatible = "qcom,milos-gxclkctl";
+			reg = <0x0 0x03d64000 0x0 0x6000>;
+
+			power-domains = <&rpmhpd RPMHPD_GFX>,
+					<&gpucc GPU_CC_CX_GDSC>;
+
+			#power-domain-cells = <1>;
+		};
+
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,milos-gpucc";
 			reg = <0x0 0x03d90000 0x0 0x9800>;

-- 
2.53.0


