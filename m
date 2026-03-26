Return-Path: <linux-arm-msm+bounces-99976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEg/O7uLxGn50AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 02:28:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9639132DDA0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 02:28:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A7A73053A58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 01:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7BE37CD25;
	Thu, 26 Mar 2026 01:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c0FS7gpb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CEE37C0F9
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 01:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774488490; cv=none; b=qS7EpNqmCGXvDE9E/MIhbYVkCwS/HNyCTCVa4YU2FwJ64vOcdB6gP42LmJTkTz/3Hjvr39TPW9MrxTGvp7uZBpp6ZMBLFU38LyBfuO6kFOO3sqLlp7604qarfDKsVcnRXwoztvPl5DS5Jl8SpnAjw0ZYOt3DY+NrBuyOwynxdhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774488490; c=relaxed/simple;
	bh=YKW1V7XuMJ4AeReIm3Qwtpj6WjYoSkYt9XgvGuaFoSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c5WmuYlqOIfNEbaDV/1LgQaBeiQxqR1nRMHPalC4ZSk50UKAY1cfA/E+Hb3qddpwU3PY7G8W2W5RkA7TQvEc2rB7GniJm8YmB7fIYdSy3jO9JZEfE9QOEeBtmaJDc/Tvb2aH0R5tRQULhhD65n/fBNtTQvTE9nIG07TmgczRgNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c0FS7gpb; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48704db565eso5999235e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 18:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774488487; x=1775093287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P21FDgbBj2GIbBZ7VBtv5L9RLy5tJ4WiwvtA0ou3a9I=;
        b=c0FS7gpbKxS2+Xj8brsaRetc01HMQlP32vMUmD6UIpvhCifFbTq667FgcIIkjPuaLx
         4owO6xI946gRIKuDKObsunpfEUssxPunoZpIr+fnnM4Tq2Yl5+4ClPvS4o9hvu894LA0
         FEtj35O7R2V+Gj138aNbltNjAaXXhvrtiVvrID/WUiQ7qyguczAVzew0pYd3xqzlNq3D
         HAz/Pdc+6DjkpoxgoBPI3sGe2agMHggxE0bGGh/WPD/HHvCmcnS+W+09OaliTItO8tJ+
         XFR8d0VqrB+EaMMCvKljDexCwpVC1uSgRYqQ0uSdSmDCVEQgC+zOTTy0NBS5HuwkEDGv
         ZE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774488487; x=1775093287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P21FDgbBj2GIbBZ7VBtv5L9RLy5tJ4WiwvtA0ou3a9I=;
        b=qipp2wlemBiGyF2bmla0QNQ/OWbqwcGmVVJu+Nnerc8A4+LgG2vlenHNlpsanGUrzJ
         t71FGwmJD7ES0IxnbaG2Q3ImY8L/hv3IWqXsf7DoVWAr3Pn7syFdIKPcQCSrSQx2Ht0V
         kDVYrZSgnBdB7hrS0nRzZBHknxAUfEJPz6KsH5LVugRUOKOAne0ClFtvbkjrDumRe6be
         UAXBUetSdlCzBalSdEGgnv5Z1csBhylQz/7MupOWIvayMG+oNek4H+l1RBP1x3Og9BZs
         EWw1qoY9PH+ovIWrX0oU5NhYgwV4yM7AyvMYa6etpkmBQA0iETztyDr5eaPxQSRT4+xI
         8zbQ==
X-Gm-Message-State: AOJu0YwV2+wT69Y9W1W2aA9nMmWSvutfRL13g6miWLOn2irPcKw4IVAb
	jFrVU8J7p3csT9slblaX8T861P+h8seIi2afm6oLqus6O4PD+r02GCIiRmFuNJWdxhA=
X-Gm-Gg: ATEYQzzK9YJXQaMZJ/+78sCSjBik50P+/HByQxjrIJ3KHEwsuLiehm2ibpwSpU2XjSh
	MWzXc+zceypsB4r081IGMBU4xOONoMyPP6Q5CsQpj5vlIk1JMlyJ1b4iUx37dtY5kI4ILSYR6nz
	bEDf2sb15zWmIGkW/Vc5vnTJ54w/uV6CXQ6LsaL+fkXmACVMM/fknKGoL0urs5EuDrq1lxVYOeH
	hoNMq1sknWCux8NzfsY2fPAd2VqPxT6FAzgN5mX5ZcOScTBvXGPFdK3YTteTcmGRB0Sk+AGhjI3
	oPFWcGei2PzIxSSk9SXIarsjmwgd6InXde2/p6N4IJjZXMDuRnvisCzzIcw35rUCyZ/hkZsgbQ8
	/95fawbvehULC9onz/zrqk7pwuXmByTbkj4y30ycoCxxu0UhzTbrb61um4LYDYkBuu9yGONBDj4
	fxS5cHRowPdJaSEDWe3AKunl2r0EjfK/d3I3A=
X-Received: by 2002:a05:600c:350f:b0:485:40c6:f528 with SMTP id 5b1f17b1804b1-487160a213bmr80479925e9.30.1774488487128;
        Wed, 25 Mar 2026 18:28:07 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.163.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf1c4sm3918051f8f.23.2026.03.25.18.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 18:28:06 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 01:28:31 +0000
Subject: [PATCH v11 3/7] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-3-5b93415be6dd@linaro.org>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2666;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=YKW1V7XuMJ4AeReIm3Qwtpj6WjYoSkYt9XgvGuaFoSY=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxIu/t9wn0hjOdBeGp1+ZXyrdnpvlJZRgwHIFn
 gVTWXwfNdGJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacSLvwAKCRAicTuzoY3I
 OoLtEACy/NhZw3B+kOA16FZWbXQzqgmtyi90H8KVps1zpqy5P/5Wnx7Yyhack7yH/S/WazGWavk
 nu1rmIM5HpFqDEFTOiL6dtQ/4UZ4mr+NmyQMxMDRkVNmwDRlUC1wOI93eYIWl5AmF63jfhytaMl
 buqSyEga2A5R4VeocXLwPL6YrLsdYBjo85PJt4NZpL+8sMq3iIQY4c214oQ0tE7wRlYzARDSnNs
 wWs8/7XDsgC8kiXOC2X42nVFbEXyv8GROVnSllMUNXtyt8BHNtryTpmM1ecdiRa3fR+L+fpxs+/
 sxTSkko+IahfRebJPkqGcAqxlbtOz9dTUuTmfV4/Qo1ZwVAr5H6v55byB1ocViBNKde8fyq40tY
 CB6qHjT9hhz83YYLMAR9F7M6mWNc7T1L8fdstLDnHVb1VdL/r9I9MUHDopr0O0pu4ozgS36Uj9A
 Bkw/dG9zJ8DYDRRtFoWeBETVto7aIeA6sney65DtIAwgjpSA5koaVbS6JNRd9AKoeqGy0vTbunX
 MfdzrV6tsl44jMEfVq+Xk/Yag4aeLwpWLSdAhv5J/FInbVV30WgysEMIK4T2zLqYfgFHAm7Riph
 r7FZAwrJ+xJNNZSfDljO3clL/iRFQj7K96i7NbD17n5qPEW/IIzQcUL2SDj9bBBaymXEhSUp7FT
 8GRl/ih9TlzVCdw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99976-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 9639132DDA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The original iommus list included entries for ICP and BPS/IPE S1
contexts. Only the five S1 HLOS stream IDs are required by the CAMSS
ISP hardware: IFE/IFE_LITE read and write, SFE read and write, and
CDM IFE. The remaining entries serve other hardware blocks which will
be described in their own nodes as support is added.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 26 ++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index f44138f522bba..d2763977a494d 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -112,7 +112,22 @@ properties:
       - const: sf_icp_mnoc
 
   iommus:
-    maxItems: 8
+    oneOf:
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
+          - description: Legacy slot 0 - do not use
+          - description: Legacy slot 1 - do not use
+          - description: Legacy slot 2 - do not use
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
 
   power-domains:
     items:
@@ -422,13 +437,10 @@ examples:
                                  "sf_icp_mnoc";
 
             iommus = <&apps_smmu 0x800 0x60>,
+                     <&apps_smmu 0x820 0x60>,
+                     <&apps_smmu 0x840 0x60>,
                      <&apps_smmu 0x860 0x60>,
-                     <&apps_smmu 0x1800 0x60>,
-                     <&apps_smmu 0x1860 0x60>,
-                     <&apps_smmu 0x18e0 0x00>,
-                     <&apps_smmu 0x1980 0x20>,
-                     <&apps_smmu 0x1900 0x00>,
-                     <&apps_smmu 0x19a0 0x20>;
+                     <&apps_smmu 0x18a0 0x0>;
 
             power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
                             <&camcc CAM_CC_IFE_1_GDSC>,

-- 
2.52.0


