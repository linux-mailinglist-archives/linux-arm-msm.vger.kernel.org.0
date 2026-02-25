Return-Path: <linux-arm-msm+bounces-94145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFoGDDYRn2nMYwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:11:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 889B5199431
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:11:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6FF33302B046
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181D5392C50;
	Wed, 25 Feb 2026 15:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vO3UMRGG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E563D332F
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032290; cv=none; b=ZORqIHAHAx99BTJmONID2bK6XjmJpFyi5Q/QwbQVZ69l07VwLErPp2BAOImWrn3vl5KPyL0wycZNKIsUvCmEcjvrquRmyswy8/R1yeNePNpCBscnrCN0ta/mP19mUnltz8uOWmYqkLmRZzRvrDSNYMjqc8zGqXi3d6yZ5AgINWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032290; c=relaxed/simple;
	bh=foZjVoQRCiO5EiFO0xsiUtYEo9hBVgElUvLSY4ypLnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oYY0LqdbeVAvcxgWFXztepswzZ5v8qA9nhVcrxbtoyifN3otdXbO1WI/JlA1U70Tas6KhMD5VwcLLRSCT9v5BwhwinV2t5my44+UEldqEWKe3zKtK6lNTsBL05ybBOIysUjTXhVTmAgovdYy5TVUS5x9nscmEw7HUNra6KUswSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vO3UMRGG; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso55177275e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772032286; x=1772637086; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ih6FpLQGj+0QoTrk9bZxrKkeQWeNNrlBbXBKCOgjpFI=;
        b=vO3UMRGGzIFmsWe26XEk2vddMzhRhxoX9rwzfaiTAzNsArzIKEIZlhk4MpkokMhX0E
         sTR4ibQBewk4rV70TanoGdDs/aNVrI7Q+9qFQx0hjD8LMcDv4U4kVXfRdbo6gnVaLxB/
         +9B3z/qI7VoFAXCZuWqJFXshrAYjPd8mysXzrSe8aWgDSgRpF7cNFIsH7FbcX+UfrUFT
         RtCrbF2p+HiGOdx1M/N7Jig0tD7klVZ1LFURCbdL3t195Mc3iCOf5ERHGH4pzmeGByAJ
         n6CJQCmqIysRz3yF3EG29Kfwk5gzIXyn0P1UOYndEdkiiRBS0JFZJ0wMeUtTIExnQu7m
         qtTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032286; x=1772637086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ih6FpLQGj+0QoTrk9bZxrKkeQWeNNrlBbXBKCOgjpFI=;
        b=OOvAO38emvZdufG91zRMigC2OPufGdG3PSDDBV/svV0lhNdoIX79ZRYysczlMFlPKb
         q/nNXZ/mFD2ZO0JEmF9h/4nOMunBb4cTyoKYFq3Cn3CHtFAJHnJnnOi4nrfG9BT+Nan6
         htKErZ+o1WiMWfS0YOog+thjUVz0KFWWIRPhvrPdr7vaM8ID84JVV5G1BpPjcZNwQl0x
         lRRtZGAJKJPivOUKN4v9luj4Iars5ng6YUxheMNiNcDgV/rkfd912eq1dgAeUS2E47iS
         Og7XmXPc1A8FutYWFyZSOrukzKcPxSxdMhoIcSBNy4X+nxvsoyOTQxa7N+RZQl97rroJ
         ygqg==
X-Gm-Message-State: AOJu0YwpfPePcOiwItz9U3QiQKkwf/5dAk04BR4Q1G5BZb6sngr31ewk
	o+G175YIEBAOkwOcU5yAuuELScoxjMN39XjcrNtfGPXWUaojk6/Cv3WTPHPh0LARH8M=
X-Gm-Gg: ATEYQzw8W6tAwqlqK/PIYW2ZKBaDXvJRa/5KPxJWTXtfnuS6DI3oH6cv40/bYEZOHMC
	tvzBeriTsDs/2pxJegETopNyoDr/HjrVy3kViagiuXd/xZjD5EjJpLn12qmAhSPtYsBQrV1VNoD
	y6bw7+rXaoqTL16nvdgycov6naKepqyCwNhcuRG5ro246Ez1j6aRpYTyqsd/QhuZ7gEe+5xs0O1
	HtVKQorlyDHk6iHyc5FDVko7EsYS5kpADeGre26U9HG8ExtWVeJfrLkNcCc2W5wf5lNFanBfraf
	yvycUF+q/0izyfqqCB/jT5Bten31TuuqIi7EBtYLqqFu1mXLPtV8DbpjS2anEUiu4AAL7RTFL+r
	4r8vzqvhUosvgAtg8l+pL95xkBG0+mE2Xiq36dXKXboBsDoIr9kln98F8Q9EJTQfQrivMNDMSZ7
	QqNwHMWGGHNvAkbxa54iORt9glOsx3YcK6VN2C3v8OBzXW6hb+Mu+z+c+S+nx45wbY
X-Received: by 2002:a05:600c:4589:b0:480:1e9e:f9b with SMTP id 5b1f17b1804b1-483a95dea3emr338807445e9.16.1772032286387;
        Wed, 25 Feb 2026 07:11:26 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9a5esm33950695e9.4.2026.02.25.07.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:11:25 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 25 Feb 2026 15:11:18 +0000
Subject: [PATCH v8 01/18] dt-bindings: media: qcom,x1e80100-camss: Assign
 correct main register bank to first address
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-1-95517393bcb2@linaro.org>
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
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
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2593;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=foZjVoQRCiO5EiFO0xsiUtYEo9hBVgElUvLSY4ypLnc=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpnxEZca1HsjDAJ6+HfVuj/Vtr/IKLciK7avurR
 iFioEc0uCCJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaZ8RGQAKCRAicTuzoY3I
 Ot/ND/9XruPd1dbup1n5pBerZGkY+lReBH62eETyjKGRtBDgrB5yIgdgIe4ZSmG7hhUf6vDc/gN
 cr4GwOj4dyo5qhG6w+RgPrey/q7Nb+YsFMJhOm1OizQ5Bej9DNSVXDKFmev/FW6cX/PtFIUYz5I
 6UXvbauSfQR3t1ZXB0BOw169uq6LsQ1PYbD7X+3sFkRhJxNzv4clQIjwkfx66XAia3Ol/4tzvAF
 fkCNK2fOUhTCyEOGG/Zb8WVxni11Qg3GYzEoiu0VnbwFcODmo9YqEDaxLg1v+bSWGokixTVSVHc
 NOW1EALg8uAp25zE3D9ZYl8uwb6OkO6MeDOEkuvRWJXoaolh3Seb8IH0d+W9U79uLhHm5U/Y+Uq
 vXobiouYmIOywMZdzUi55Wb4/aV4Hc110PtaicfkA1MGuN+UbkURdfvf5N3ZFVDfLjkrugQ8iQe
 bmcnF47x8UkyWH514UmVqwpGSUNkjgBy7nwu1JtcM60l89SvFgD3kYgkITV6aGSIlUxGFtQ1W2I
 Dnane7PN/Y7PDeyPXS4DKRwBHKRGdEQhklhB51URamzyTVtP53pkoEtRNKdqrmJ3p89iYwruwJQ
 spXdQa0xjbwTJyYaU2eF/+GQRyFt/Qpktjn7Yt2I0BAGQQGFaGdTnxjHQzVGtVxv/e9RV5U8gMx
 Q9vbFaj57dAtpFg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94145-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email,acb7000:email]
X-Rspamd-Queue-Id: 889B5199431
X-Rspamd-Action: no action

The first register bank should be the 'main' register bank, in this case
the CSID wrapper register is responsible for muxing PHY/TPG inputs directly
to CSID or to other blocks such as the Sensor Front End.

commit f4792eeaa971 ("dt-bindings: media: qcom,x1e80100-camss: Fix isp unit address")
assigned the address to the first register bank "csid0" whereas what we
should have done is retained the unit address and moved csid_wrapper to be
the first listed bank.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/media/qcom,x1e80100-camss.yaml       | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 2d1662ef522b7..9aaed897f7e0e 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -21,12 +21,12 @@ properties:
 
   reg-names:
     items:
+      - const: csid_wrapper
       - const: csid0
       - const: csid1
       - const: csid2
       - const: csid_lite0
       - const: csid_lite1
-      - const: csid_wrapper
       - const: csiphy0
       - const: csiphy1
       - const: csiphy2
@@ -190,15 +190,15 @@ examples:
         #address-cells = <2>;
         #size-cells = <2>;
 
-        camss: isp@acb7000 {
+        camss: isp@acb6000 {
             compatible = "qcom,x1e80100-camss";
 
-            reg = <0 0x0acb7000 0 0x2000>,
+            reg = <0 0x0acb6000 0 0x1000>,
+                  <0 0x0acb7000 0 0x2000>,
                   <0 0x0acb9000 0 0x2000>,
                   <0 0x0acbb000 0 0x2000>,
                   <0 0x0acc6000 0 0x1000>,
                   <0 0x0acca000 0 0x1000>,
-                  <0 0x0acb6000 0 0x1000>,
                   <0 0x0ace4000 0 0x1000>,
                   <0 0x0ace6000 0 0x1000>,
                   <0 0x0ace8000 0 0x1000>,
@@ -211,12 +211,12 @@ examples:
                   <0 0x0acc7000 0 0x2000>,
                   <0 0x0accb000 0 0x2000>;
 
-            reg-names = "csid0",
+            reg-names = "csid_wrapper",
+                        "csid0",
                         "csid1",
                         "csid2",
                         "csid_lite0",
                         "csid_lite1",
-                        "csid_wrapper",
                         "csiphy0",
                         "csiphy1",
                         "csiphy2",

-- 
2.52.0


