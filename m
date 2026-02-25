Return-Path: <linux-arm-msm+bounces-94148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GL6LG5wRn2nNYwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:13:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8145E199505
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:13:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7D05D302EE3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DAE03D7D61;
	Wed, 25 Feb 2026 15:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wJv8Pi1F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0041C3D667E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032295; cv=none; b=tHPMDr01t/8+hlfxiOuk1o+qhDeUAqtkjkvlUZCd68h6addyz95Td2ehfXTBAaE+sF7TMgGKo/kiLDKc8E00kre+U6Gi2ilfjEKrVVviNRVufoecO2kuF5fwzODMZvV4MPv5tdg6/8x3Vz860d+SP/WghaNkqgokeiZsXl5Fchw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032295; c=relaxed/simple;
	bh=y+rchs4R/gmwBMioZThqUzQ4UKpfdBxjsA6hK2x7gps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DA5DK5g7Q4YTbNYio2/iS4XLzMzdK73E7vVS6WPNiv3TNNY5uwrKzwuwrEDVcyknuEAYdhlOIAMWsQpFXao6QyzW9cgsK/CvZr0D57WhXLeQm166BxDikWUMpiTE5X6nlOMvGTr24/wN7+okk8FHnJCu6PXH/2aS05DTZvu42eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wJv8Pi1F; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48378136adcso40999865e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772032292; x=1772637092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WFKphUeuXUEgIDtm5O4s5dZtbsXMn/VT87BVzkY2Bn0=;
        b=wJv8Pi1FeabS6OiCzW0q0ognKsP8JosAz0DFodp5wSHGheKTgWvrJtJyj7Ao41AdPe
         5vsi2zmdjM7cjk9AdMKW6jymt0hIoQwp+jhz41hvDwVL+1QMSeRNXw8svmZ2N17Iiepe
         LcUCsgIbC3cdkfhXqYx4WDe7Gl7++rU3poyNYkMn25z+XMnDMEMf0RNsoOv7f7+YcePp
         m2DVbwJhRVn2OIC92mJ4qGjq9qdaW7Th0+AK06h36ugxIo0fePIXAeM0287M9SH60mb7
         pLhYqQ8ZDYY+I2Z2rtkqTtSuxAYiSt9QTBSohyg/H7HaIvWhqWAwZuzgoS4aBsxamgsx
         zHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032292; x=1772637092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WFKphUeuXUEgIDtm5O4s5dZtbsXMn/VT87BVzkY2Bn0=;
        b=uMOfo90ijRngeeMvcT8E3zpBjK2wGfo7msPIVSc5m49HMiBPyMGMCLSYDoUQgWoFpz
         0oHsWlsAR4qc1kuNRQSF6/5vO/tpXurK3Elc+hP7PPFsMK+O25esf5iMJqVFUREgg1tM
         Z2IJBwyzMjlheDmSm1NjrgJr3FU+bJqarkyYGDzNc8VaadD92cZFyaKhvhYGgqT/wFcH
         XjYcjWFxtKbqhgBX1RmfaUbRzXMWUqYcsC4QQRnPAOmNCGNFKcOSURBPbng7MxYqaQ5X
         OUswLI3KtVAzZZy4ARCGNYbDd5/CTMzj/ZTwzNhS2PmEokPJbanMCFwF+Z0iM4/Ij2qj
         HS0g==
X-Gm-Message-State: AOJu0YwFDne7hgjAEQGb8trqr6kuhZJuYiZhrsMStZsjvgQs7PN3wyLL
	jqfs3UwZpNL1RWg19VLTpAAWKxvXznf0jr82pkZvGSL/dvDLfOpAue/tGBqs0YXV9ko=
X-Gm-Gg: ATEYQzxhOjbiYBiAWo1qzg/6HUasZVgZ4QsE9yzi8vmrS2IRu3LGmAT1ZAU5MThFMmG
	ViWPSXeUecwZD57Mm5FhL9udcRaGRIFwhUv4pRmjYOAmgFqmPRixiHawk5a0y/Ft7A57/p1kLhQ
	FmrLPNxFNmiwbUIA9cbkX9F7JudqaflXPzYYzl/1EN/O//eIPZSO5Hwxa/jf+EqbhznUtxLtzBw
	nr8S1oixNmrez3S/OuBnvN8fr1/VEJmUklwgoUYFU3AgK7B/vP+KKeo3gtapwalH8cCMPu1ttaO
	bIIBKfWnyRnkMKcuzrj1f7WYHsTlboKZcjRQWP6nG23DGDv6a78RqhEGJgB0KTgT0dddSGj/SP7
	9quKwc3XAThOTdRPAobKEgAqfvQ7h/eBo2cQ5hdjb1SG6jpBQk238JB3d7pUX9ovGbQui4B/q8U
	nW9DSNd1qL9InrBbf5QpaqSYC2QwW2+wKS6l8CXzRErNUq77f5vRk0EnRw1LuRH1X9
X-Received: by 2002:a05:600c:4750:b0:480:1c2f:b003 with SMTP id 5b1f17b1804b1-483c219ec0bmr10360185e9.20.1772032292337;
        Wed, 25 Feb 2026 07:11:32 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9a5esm33950695e9.4.2026.02.25.07.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:11:31 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 25 Feb 2026 15:11:21 +0000
Subject: [PATCH v8 04/18] dt-bindings: media: qcom,x1e80100-camss: Reduce
 iommus to five
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-4-95517393bcb2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1597;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=y+rchs4R/gmwBMioZThqUzQ4UKpfdBxjsA6hK2x7gps=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpnxEaexXMYV9++JH7H2L8a9qBGfzVTkdNQ/vvm
 jUj14KnUNSJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaZ8RGgAKCRAicTuzoY3I
 OkEMD/4us1q+EYNIFcXhTg/XgEb9cUlyyGMvwfvnag++k5c0Vi7dhmnTHI5ZZvBnLuWEtDJCdnl
 DWw+yTezyq39xBbfeLAciafoPMx5t7lKTeE/woEnbgeB2piMqAhUfp3aiFXWoROSqiJtiO7mK/n
 Q+/gPcia0OrG0bQ1X3+nxsP9RfhVu/Sr3wXVJAVL4tD26+VD3yFcC+9EjVSTuhz0L3XLZaK3AYt
 ZGS2uBKoAyOys03j/KdKL27BFbJYG6zlvs/DJBwZY5wKN9LS8ictStUjaWTufL72MJ/t0shfk6K
 +yxX7p4f9w5Wkix7PvJ8BOhGEHjCycehXGe6v/lftYHDBKW6qbagv4D/COxpKBfiePe857qhhTP
 fdtoP0tiHB5qX6zubere/oYpcZEwxBO0L3oiFP3xmJh1tvoVfTko0EejX2yeOGP/zWXuhu2lpwY
 ItdjeffzNY1H2mv01QuZgIURZmxZ16zyRr2N/W53ouLt+KMJi0wNLa902np8NpXm8ilfzvuIrfY
 g/f9Vawic0sK5Jr9j8FBXDH+KrcmP3FNNbTsgcp7rbeww/pN9oehiosW1O09Bq3h0ff2B5uKmSA
 4CUceP720YjN5iRpnwOM9+VfC8FnNMuaqDNeo0FYXOnMoo+nuLwpjGtRyo/6BPQ75VBfAq8fYTR
 Dr5vW9nwnW8qr6A==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94148-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8145E199505
X-Rspamd-Action: no action

Rather than bury the BPS and IPE inside of the CAMSS block we can define
them like the CCI/I2C and CSIPHY as their own individual devices.

Remove the IPE and BPS iommu entries from the main CAMSS yaml. There is no
upstream user of these iommu entries right now so this is safe to do.

We will instead include these iommus in the BPS and IPE device nodes
instead of jamming them into the existing CAMSS binding.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 462b1355c9fb7..d39013d4a83e1 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -98,7 +98,7 @@ properties:
       - const: sf_icp_mnoc
 
   iommus:
-    maxItems: 8
+    maxItems: 5
 
   power-domains:
     items:
@@ -353,11 +353,8 @@ examples:
 
             iommus = <&apps_smmu 0x800 0x60>,
                      <&apps_smmu 0x860 0x60>,
-                     <&apps_smmu 0x1800 0x60>,
                      <&apps_smmu 0x1860 0x60>,
                      <&apps_smmu 0x18e0 0x00>,
-                     <&apps_smmu 0x1980 0x20>,
-                     <&apps_smmu 0x1900 0x00>,
                      <&apps_smmu 0x19a0 0x20>;
 
             power-domains = <&camcc CAM_CC_IFE_0_GDSC>,

-- 
2.52.0


