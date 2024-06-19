Return-Path: <linux-arm-msm+bounces-23242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B1C90F460
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 18:45:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1DB6B20D62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 16:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81097152792;
	Wed, 19 Jun 2024 16:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="bRc4s9TG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D7E1CA92;
	Wed, 19 Jun 2024 16:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718815520; cv=none; b=UCovuaeCeJHSaZpPf49Oa0qqfDOA0asEh4swJZJhLRY21kqIHDCfYIBqklAjWBvozVOPq9oHLHyIU45CMwkOSaXj21HUhyn2MlYVUHJSVmHlUTKhlpIfGliRuJIwRCLBJ6xDKy8F+TEeKQh5FT6XsfuMc12UQ0mOAOg8who7rqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718815520; c=relaxed/simple;
	bh=qvVridwWwQmob31TyZVDbjKXPWXa87Ibcv2ivGGEZoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jxowu8YJFbtXipWpJrpnWBWLeanArW7O6FzLnSrNe+g9QhrlVcqJ+ruCbrQbRJTY0D2i1Puy40zccZrYJBlgzbx5s6AuocyjzE/34EJTqhA+tRb0D/+6dBQHkzhItleuUZt6RKgvPcV0MITRUFeJ0RKPzxBpZZp0OaO/hrV8ED8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=bRc4s9TG; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1718815510; bh=qvVridwWwQmob31TyZVDbjKXPWXa87Ibcv2ivGGEZoQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bRc4s9TGmBdnvHyTSe1m0SNC5qq5gEodlXzjnVFL7lOwj25+wNWW1ptl4p2p/NwxT
	 i56foqtE6oXSF/5aiIDOkuWvYGUkwsT3UKHcuFtb9BiZwVIsNFlnY7UVXjE6CKl1y1
	 BzkhiU8A72XCwZUeGpaFQOEHwAhzPdEX62o3Vj7I=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 19 Jun 2024 18:42:31 +0200
Subject: [PATCH 5/5] arm64: dts: qcom: msm8976: Use mboxes in smsm node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-smsm-mbox-dts-v1-5-268ab7eef779@lucaweiss.eu>
References: <20240619-smsm-mbox-dts-v1-0-268ab7eef779@lucaweiss.eu>
In-Reply-To: <20240619-smsm-mbox-dts-v1-0-268ab7eef779@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=769; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=qvVridwWwQmob31TyZVDbjKXPWXa87Ibcv2ivGGEZoQ=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBmcwsUDLw3yV8gKY79ruCKuzpYguejuRsxbBHOl
 xHzwilmhmSJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZnMLFAAKCRBy2EO4nU3X
 VnXcD/9+mIzqYuSxhA4VBRwhVSVsoK/QkX06RzREXNuUvml0w4U1xc099Pnn3NJOQs/R/z2OnFN
 iFYm9WzFGE5VMSWOd3fzgwHzIGesUtm2gZnVkntoI8+a1yD0XBubXqxxJEybiavqLDuQXPWl42S
 jCnUX5U6rmKfHV7ZaD7UGAzwbZPBgxz37kP0MF0R6xOx08cspZlOCne4pV3BTFMxAun1FTFmCqM
 1uEdaGAILohyrprMw9Sld0QqpiZJpTWRxt9kgmqMoS2hV+GpRhdjPBQulfAQxDL2t/Bj00XnCwq
 YL+JXKuudGYEo9AjYniybQSj3CvTtvMhuEK2ovvscA3GtmIwcQunk3UsH+13W3yW8BgjnLcv6Nx
 6RSYX6RcJOiBtAkOb7wDnbnFkSBvsXrZugClXZQ3NYmlorVPYUBgKA1WhF8ntlYZEPLBPD1z8SG
 udPh899ddMdJnRqS/qbCnRovnvAmNpT5EiYGELD8mFq4rQHxgJBB6/XvWenjII/yTWQW2MrxUXX
 aS7v4y52StANLIqn14gmpgstC8R9lXlv0eBbF/roIgVrHa3WNJbIlXpt8lXfY2lo/F+GjetorlI
 xSigWcpB5/rBDenOi2CCDPwxx6J9foefJzdP30cWbNrNxtCBXu2POcnN4+u6P0vcvj7EtL4QVVo
 uQYKBpz+078/nXw==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

With the smsm bindings and driver finally supporting mboxes, switch to
that and stop using apcs as syscon.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm64/boot/dts/qcom/msm8976.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
index e299d42c5d98..d62dcb76fa48 100644
--- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
@@ -439,9 +439,7 @@ smsm {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		qcom,ipc-1 = <&apcs 8 13>;
-		qcom,ipc-2 = <&apcs 8 9>;
-		qcom,ipc-3 = <&apcs 8 19>;
+		mboxes = <0>, <&apcs 13>, <&apcs 9>, <&apcs 19>;
 
 		apps_smsm: apps@0 {
 			reg = <0>;

-- 
2.45.2


