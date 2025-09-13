Return-Path: <linux-arm-msm+bounces-73407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77150B563C5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 01:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 150A417BEC2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Sep 2025 23:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF0A2C11DA;
	Sat, 13 Sep 2025 23:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="iRw3nseq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164852C11C4
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Sep 2025 23:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757807851; cv=none; b=Obk1MXJechJHnkYHVSQl5wrZ98zmyX6V8SyYYz8G+LtDGKRdzxS+Q5vbysHqrNyIOyIz6PRjvvHzXagrewU96MlrdydjvTezDBmlxkm2j2gaAWmUJnUwK+PQmGI5lx9S+zdtikBf3/s6eg+Pvar0jaCQL/ztJjfSlu80F8HfZ7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757807851; c=relaxed/simple;
	bh=6bLD46X8x3E4I079hgaoowVPtod3Ucq7fkS0dDlZ5ew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=icBfC3mKgRtXt2sigwXxQsKmHqEmBiExMjb2Mcvq/bGmTlxEaZx0n0xW0GCX+9neeZMOYinghOaiZYjQsu/uhIY6Q97EH4gcq0sMZ6pdofBPj8ZICXqTDm/q/aO5Zl1EE9D/RAQ/INq4EuRsy4IvCcLArW4cejxesR/FJcDgUGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=iRw3nseq; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1757807848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IjNANYA80cq3QQ6vvc6d6KFOYvlKwEVwLjYWlqlgLfQ=;
	b=iRw3nseqtQ+0QHHRnWZQ0usiZeMaSRgB0ewacqq2jsNsRZJ75QUqCpyloHdjo6zdXn6IGn
	dZneJjt+svsz3McO4pwH2h5wsXx6gz/tu6yA3YHiEWwOsHS/5s+Zk2jeGxeoJNAyaSAu3j
	0M9xeLrSDhDnG2ImIiOajxthdj/d1WEXXRWMqnarxoDC6WOfD+adx7wbW/SD0g3G31iNan
	v+TnlwLhxAeQIjlkZkV1ZEtnrHjO31VfZgpw6dNSPCo731VsEMgxqrWvr9om+VVqH4aAdH
	97evpgTY7lgbn1jIv9qtpNcWo0cCru/7lhyTV2ClMeIJVwV5NhYrL9lFjSOPbA==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sat, 13 Sep 2025 16:56:35 -0700
Subject: [PATCH 02/11] arm64: dts: qcom sdm845-lg-judyln: Add battery and
 charger
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250913-judyln-dts-v1-2-23b4b7790dce@postmarketos.org>
References: <20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org>
In-Reply-To: <20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757807839; l=1275;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=6bLD46X8x3E4I079hgaoowVPtod3Ucq7fkS0dDlZ5ew=;
 b=7kkgyBz8AvdzvqULgwqsUYveQdsEUOi9t/otwbzIO0ZJvUbb8EfPvyIw+5F9L84y7FoIETjnL
 puWUFnYwDFWCieKIvRR4EFpySvU5AJCfSiOIGokDpkXExG1TBb42sng
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Values based on lineageos kernel

Co-authored-by: Christopher Brown <crispybrown@gmail.com>
Signed-off-by: Christopher Brown <crispybrown@gmail.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index 49225e4fa80e5f45a36964d5d733dc238e4413f8..da093b581c857c5acc9f0e72c9d3519977e13eab 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -37,6 +37,16 @@ key-thinq {
 			interrupts = <89 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
+
+	battery: battery {
+		compatible = "simple-battery";
+
+		status = "okay";
+
+		charge-full-design-microamp-hours = <3000000>;
+		voltage-min-design-microvolt = <3200000>;
+		voltage-max-design-microvolt = <4400000>;
+	};
 };
 
 &adsp_pas {
@@ -57,6 +67,11 @@ &mss_pil {
 	firmware-name = "qcom/sdm845/judyln/mba.mbn", "qcom/sdm845/judyln/modem.mbn";
 };
 
+&pmi8998_charger {
+	status = "okay";
+	monitored-battery = <&battery>;
+};
+
 &tlmm {
 	thinq_key_default: thinq-key-default-state {
 		pins = "gpio89";

-- 
2.51.0


