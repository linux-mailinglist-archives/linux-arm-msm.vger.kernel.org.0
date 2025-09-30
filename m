Return-Path: <linux-arm-msm+bounces-75592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C262BAD1E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 15:57:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B19517AA9F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 13:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8177F2FFDE6;
	Tue, 30 Sep 2025 13:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="B+nxDsb2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BABC2F99B5
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 13:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759240643; cv=none; b=lRkJvjGF5Tt3da8w8sDo8+JGKzFX4LrAp0RNGbabD+fZzACTNJBXN3vX+UMTVPopakp92vrgh3w7std0gjdp7GlXW1QZPsDFfm/to760CpOzXZRaK7Mhvtc7lU4EQFhImGRdKQh9vE8WRwdGDbAnfksCdJLeAD0ZNFcfIKxRG5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759240643; c=relaxed/simple;
	bh=9MhBfHLtfKllOPgLD5n4VkYHmbM5vctQ+vVeX9gfLdU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qGY9/A6KOZ5FbJwsFRYlMxAQPA6JbAhrh5MuPQvqDVvuGKoChpTWOsF8V80PhDmKayyxkxBgCUBrQ0wuYQVwSIRUjLPFAGJtzvM3/Z//oVYz6HvUqjtkKti3JiCz5AwnU4EPF9HXS5gs9TqAlsZs1/jGnaLWxzLHMgdSrywnuVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=B+nxDsb2; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb7322da8so1167630866b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 06:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759240639; x=1759845439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJqD04tCih34r7vGvIKjxsGrK+J1JCBmttdD15ym8gk=;
        b=B+nxDsb25EJD+b85y6OX3PZjBHiYUxnodFIUlZH9Umsw4hOxmAU/8UGi7M4Nb1R2X1
         adVuLd50oNm2tyaIUEYFKBUWiqej7dh6ppJe3odCLQNQ7GqdVh0wCqPX6m2r2Hr2d3zj
         cyP17v1xMpav+tpNe3eTwJTGqPBXGTCqx8kv9ZhAfjlZJ6yh9RloIwqRGJzHAJmL+xgg
         a8xmxz3fphK0HlcasTVycYP5kzxSe66PCucJJMmXVLvG3Jp6g8NvWZIN37TPLBXuYPnN
         fcIesLPVX6oxzHbiSZsh/kZH/eriQaJ1xyKU3whIjU+QChuaTN8oRNcZkkkN+pYlwxHK
         v1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759240639; x=1759845439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJqD04tCih34r7vGvIKjxsGrK+J1JCBmttdD15ym8gk=;
        b=LCj8trgwVi9RgznfUJ98lBer5Sg0NN/HSZ2dFfqvXhcoIMKHwapucI7Kr4D8V3uf7k
         iAQ6hjg8NfWI913jpSQ5K0I8GlKBsYkidAztRmxo3s3gjE/rPFujbcxyGqq6YLPj76K8
         Olz1il36TezvgHT0Cby+xq6oilBD9SGg8xSEMxPLndir336LAVglTGMLA5BU09K+WFhC
         P257OmyKDt/s3ys3BuooyPwf4wyyAwCwQgTri01RbQnSvmBKobGeTts9dnLgKFKjF49M
         8IId4auugm7u2vlGaA0V/Cdjiqu5yIcm/sXLaresYw750MUGWmSnTlj4lMvR4feGJrLQ
         wN7g==
X-Forwarded-Encrypted: i=1; AJvYcCUD+FA49lePbF7sGFTyRrm4ijBfBPsAjxCP4qHK2GpRInnFVGVFXcHPj4VZbZq9vpe0kUxP5ak//d7UPWtP@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj1zJD7qBYs6DVGXrXByPXeSCgFdkgHVSP1P35FM5/wLON//cE
	mBz8+wTFCcBECpZA27KokOylg4vNxgwjs8PmcHd6CeuwaqHEa/ckcop59PtiOVeXxMAxl31f82F
	O755GZDE=
X-Gm-Gg: ASbGnctdFuxDt3DdRXWsrcHZguCO4323K9xXntfhStNHG50Go/BozWR0HRQSbF4j71J
	kkCEh0DFRTOqG/11zXQ6fCHry8UXnGtsSV3mvZzmWrVQZ9x8IALrqshQqjOfmMSGR3fozBrz8f6
	Hv6ygiQJjk/Fwms+fqLhYZW+0R202RvWAD7O7Fng1nS3gFlyXBBgh65lCPrllJ2Ya58Vdvf/Q9O
	s+nJm9D9CQn3ULUOpZEMRHpyuxfn8RddEngNzfzcQ23lAjDsUUbfexSxY1I1VtwjRy+/sag+LY8
	Jf1/diX5Hxfg8nhJ/0Gvf6mGRivKBeFcHHnXSQQpkhOTOi7dPuyaoVOFY9fvb+YL2G7wvOKlE7/
	oSaTyk1fczFVlH8gyIpmVrOnQo3rL3XEhL7EgftxEcv1nBenU7i22Gy/OkkIg+AYV18IgDpUhob
	K4M+TosSyYc1PxWkxONKCWnCiCq0RM
X-Google-Smtp-Source: AGHT+IGZ33shaFUW5jyb062Uoeoxlt0WtvK77vrIa8wlglgVkKZrev+KcyCBMMVsBEftxPy7dxLLbQ==
X-Received: by 2002:a17:907:94c5:b0:b46:31be:e8fd with SMTP id a640c23a62f3a-b4631ce4902mr113558266b.26.1759240638658;
        Tue, 30 Sep 2025 06:57:18 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3fb818fb90sm370234866b.63.2025.09.30.06.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 06:57:18 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 30 Sep 2025 15:57:03 +0200
Subject: [PATCH 3/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Use correct
 compatible for audiocc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-sc7280-dts-misc-v1-3-5a45923ef705@fairphone.com>
References: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
In-Reply-To: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759240635; l=845;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=9MhBfHLtfKllOPgLD5n4VkYHmbM5vctQ+vVeX9gfLdU=;
 b=/Z2PW2Qk4YNfWk37c9jUtWn7t8/TMDeCCdp+pdPILEDGok8S0HaBRFxItaEvxxqJeom7gDjcf
 4Swql1aXtFcATWqFM4g31FmZ0ANAjH/jVGWwHR5Wkw5SFMTnBpiF7QK
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Use the correct compatible for this phone with standard Qualcomm
firmware and remove references to power-domains from a 'reserved' node.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 0a64e5721e092d1f3e4bb7329335704eee567761..aff2959c0131de90c42783b7c45f6e8e2ae18afe 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -854,6 +854,11 @@ &ipa {
 	status = "okay";
 };
 
+&lpass_audiocc {
+	compatible = "qcom,qcm6490-lpassaudiocc";
+	/delete-property/ power-domains;
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.51.0


