Return-Path: <linux-arm-msm+bounces-75460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33351BA7F98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 07:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF9E017F3BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 05:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75F5257458;
	Mon, 29 Sep 2025 05:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="EIeOvGWV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF26E2512E6
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 05:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759122369; cv=none; b=V358GLxho1oXDBRLVmtHya08ma30hautAbjEuCZc1vnJGR0ZUO74BQVsv5sKD2TxSdbV6uQ8w6PyaiDAHXEJ49dZVouaM4fDN3GIxymIiJHbw5Gy+1KoTrwgFHSnXA56msILTLwIxHRqN8+F42q+VC5rXsfMfLlHYWMV7oUBNOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759122369; c=relaxed/simple;
	bh=uH4xUmZ8K1fw2JfzLI/Rwfgn22YwanRr5AnExFmNLFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a0/wgxRbMlqZO3+jiQt2eDc+fqv5i6XMWOKsmehUb+SH+YLHgGAtugZD82hvMcZ1t14rIRGWeAqeg/cM2PVy0U5hPCRMlXXoaokkyE66WzkBeyCHZlm7zbV1cKg2TFpuDbD9TmsoUW+nPan78PLhFXwwfrQuDr0gr3t/0WlLCoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=EIeOvGWV; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1759122366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qGTHSa5dj9rIa6BjvGegUqwQIyTfNnRcGbAhM2nGFB8=;
	b=EIeOvGWViDYNtWRUIPO2j/liy3NshqfExJBtBn4Uh4DXhJnIAz62fFtbuJ862dPDaJU9Ou
	0Gdfc4fcNiwQQW8mY6smD10nzUavZSRwAFlrAda6iUT/TiwzHt26uoTj+kxfsMdjn0hmmN
	wZBGiPhPe4e88JGqlmqcjb7GUIBnKg+hYMKswWqkbippKyB1ZT7wJiN7dE2XX0gzFo6cj+
	CYrYCoESBsQxIeP3yIz1DyzX4jVzeqtdWS/tg5MfoNHjkq9nAfx/iVQv/9SAMn/hMlnXi8
	ARGRu+a1FeeuUE5PV07/tGLqv3vhFIX8xnUKxdrqef59PQXGLbUegSAKBQ+LhQ==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sun, 28 Sep 2025 22:05:34 -0700
Subject: [PATCH v3 11/11] arm64: dts: qcom: sdm845-lg-common: Change ipa
 gsi-loader to 'self'
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-judyln-dts-v3-11-b14cf9e9a928@postmarketos.org>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
In-Reply-To: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759122330; l=957;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=uH4xUmZ8K1fw2JfzLI/Rwfgn22YwanRr5AnExFmNLFw=;
 b=cr2MGizWiBrsEIWw7NM654dT+ZNNIFbDJZ2TZ7ZlUIk5RPqT7M4J8AuHrCMb8STzhi8JLQA5x
 hl1QNe+zDgXCx1rwApfw2cnDzzTTZsuK7/oh/3noRGwiTDk9x9HrU0W
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

This lets modem get a bit closer to working

[   15.885735] ipa 1e40000.ipa: channel 4 limited to 256 TREs
[   15.888550] ipa 1e40000.ipa: IPA driver initialized
[   21.038968] ipa 1e40000.ipa: received modem starting event
[   23.097401] ipa 1e40000.ipa: received modem running event

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index f309e6ebc075a691c7a522238b4a93ba9e63f3c0..898f87818d3d4d028cc762d7ffdf33b3c2352c92 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -484,7 +484,7 @@ zap-shader {
 };
 
 &ipa {
-	qcom,gsi-loader = "modem";
+	qcom,gsi-loader = "self";
 	memory-region = <&ipa_fw_mem>;
 
 	status = "okay";

-- 
2.51.0


