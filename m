Return-Path: <linux-arm-msm+bounces-94306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uN98HQReoGm3igQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:51:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0651A7F7B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A6382300E693
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 14:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 301E33D3323;
	Thu, 26 Feb 2026 14:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e9xm1AcH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2DF3C1996
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 14:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772116133; cv=none; b=BkyYX2oJWP+Gc/vhAgmEcnqE8CWDgt5Kn7KvLU1LLNjP/Z0G0SWj1hFJY433QjrRVQSxxaHbykF7ZF856HWggt9OXaBdQfmqSlv2EzAZiLPghiaTEg+f1pICSXpyz2C9LWmRdIDU1Xb72oN4hBQsy8xmqUftyYlmArJ6rlA0KXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772116133; c=relaxed/simple;
	bh=WJDLlVX2Xzk+wCJnEgTtDLZA4OHjsU9S+VdRID0jrM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ccehRbTU9nTdj6HdZgxqv0yIEPKYod5FZsCMya+5RSW/8In/ZIK/lUjnz2M7N13PsTRMB8YdqLxJEd8W6mdzO9hxVnpUuDjOgAfY5RZ6XdySve2ILt4F/8YP4+W+BWS4G064qMulUjzmv9BD05q0Ew8pUf/u/Vs2UZNf3sbt604=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e9xm1AcH; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43990aa7dbaso725983f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772116128; x=1772720928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pBils5t80gyOQ06en6vqctPVY+b40EmRNjQtdblnFBU=;
        b=e9xm1AcHlxMX1N43xyXA2PMfdPacnmLvorhVdKCLqdrvbuh+VevRENkseG4WLdVvj+
         Ynp5EsSLe/P1ZNtZyMlWzHYZoRAjnB9LSxWcd5POBelfzvCk8qDPyjbuvKPgqqYZ6wku
         kxDeaEZoq7jyPWpUkK7qu+8YuhbZzRwCCRZ+UWn7mpQUpc6URs9hXhCtoV4wpcPIdz1j
         yq+nwIwBvl4gDjeW5bscZTNLbMhNlebWPTm89cbwxnjNQWwScGzsNFDZHLFVYIJs6GI1
         m1Xx2Z2Orh0hQEuMoQ+wwRDsZWhFggpf6Us/nWFlMuRSr+93l7EPJXCstkb4NCM7Gdmw
         lQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772116128; x=1772720928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pBils5t80gyOQ06en6vqctPVY+b40EmRNjQtdblnFBU=;
        b=WaVqXpu0xB1GuxpNtpUS6zJ0XkaaCOG32yYG3+6Xzg7w/NaFsKG4TBGfsZe7ayzVds
         B4n7Mt8bqyRDSM7F5h1/pdFz7b/EsSZwN4UfG7oPnJ0XtEEgw79lQtk6j/qb0qXuOOtF
         DQm39xgdYG+IGLnL/G2aXM/NVvu2vvvEOGhBp2lK2POwl0T1wYkQGK6d6jfuElM56UZA
         kydBaiRqMYc0ZJRaQ25ohTHliOE/UgdLix0Olts4wvqx2hc9aPnBfiUIKadHI3YTorYL
         Hd3QE/RkFZO8oxZhODvmJ0uoKm1UcqcCD69t+a07oqcPakLw3XmhsE96DQlWteODYE0B
         C0Zg==
X-Gm-Message-State: AOJu0YwU+ohQsAY7+ZQR1IBvZV78IPktc/uyoxFb3++1LsEf2OZZlIYC
	kXYCv+mxc3FYSC8i8XEtwCz6n6MnRWLfuMSvLvPjujRCtwQ0bFlWiqLrcJAbL3GrF6w=
X-Gm-Gg: ATEYQzxcaLFxaMvIQNqLHbv6PGm021WNhSHgxhbiMZtsTcFqg8+rFzmNJTJ1EF+DFOf
	B99Ox9662m7jZCuLiVl+wZBZaNFJfiwCS0qwT6NXzY/0Ks1dII8GUf0uHtaJqZ7lEsdXMQBzjyw
	pC4DMyNVkxxLaV1AsCD4RdGYbzgHjDs45PyMv6J0G3R4+8Lf65k12YnXTiKDM/dttafIsXW6dmf
	CnuH9VkWh0fH56KdUXrqYyfFW2NUGEnnLLR54Uzhi55dg8+qJtum7q05nQRmCqP6QsvDw6ifpnt
	ZuB7yPNR9OeWpLlFg8ui0kSWx4bcy1lUZnfc/SkNuJVffzct8L//fj4j1FGtqtyRd6J6dzBsfVs
	UfK7UTzQwR09n/yRlTpbef+FGuZCg3sxaMOl8iE86X892ES4tfSUIqcsQyUxwHnsX5S1W2X6OPF
	/ATKvnWUBwSh3GZjYRNy6GB8+8YJD7Chn5rZJcZUt6WoTdhubYz30IN5a9dERd3diA
X-Received: by 2002:a05:6000:4304:b0:435:add0:3d68 with SMTP id ffacd0b85a97d-4399430088amr8840100f8f.58.1772116127466;
        Thu, 26 Feb 2026 06:28:47 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4bf89sm39219897f8f.29.2026.02.26.06.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:28:46 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Feb 2026 14:28:44 +0000
Subject: [PATCH v9 3/7] dt-bindings: media: qcom,x1e80100-camss: Add iommus
 minItems: 5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-3-a59c3f037d0b@linaro.org>
References: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
In-Reply-To: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1331;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=WJDLlVX2Xzk+wCJnEgTtDLZA4OHjsU9S+VdRID0jrM0=;
 b=kA0DAAoBInE7s6GNyDoByyZiAGmgWJvI7Yftmj3tnq2NZsEYjkfrAv2WPd9BI/DTcJOV2ZZKo
 YkCMwQAAQoAHRYhBOaT+yqro23hF6tvtCJxO7Ohjcg6BQJpoFibAAoJECJxO7Ohjcg6RjIQAKSu
 pnlNPCH3LuCekIzc68sDIxfaU30BrwuGyg3baSla8/vw0tDXfdKOEoyop+TR/SzFNdMl1w2e2qu
 onPnhs9nJp9NjN8i0NIZFT3VjcxbupEwaiuDz9Kb8hDT68JQiCAihwCLfQk8PYUHvUxhrum1WzA
 aCV3TR2srBdbWo/b3+bIHMhHw5g/WKct4iJUoXyAl4zU+1b5fQybNoSCp9vFUUa89pCmA3nCUGi
 a4DBeh9wwzqBGfz5uzEdMmvPFJo8TvfI65HpYK8674pYpPFWnwDfYFEnr4B/EAsT1jNbHGH+j34
 fFtGq7Zsk6kep89GkLjDx39YgAO/UHmdo4FURk4nvgjzphZf9S5aLoeIbZzhoirUasgw46CJD4v
 hgxRWX1u88wPg7U4xwM45uXkc6d7hgDcQSh+m89o27N4w8ZQxn4oW83qS4kdXrPcpT0iMuYCqGq
 uYz/IsdMlkHK8Xolpvt+QIDn2oGv4OzY73m1CSMTBV9tZVlIaF5Wq43zXKnzkyjry2GOnoGIRPL
 4GlPsIJci1jb96UwCLeNpSzTugzWde6fsvnEVyPlZ0LiOHgnuYB2ryJJEneJMHhd0eA0JI3i4nQ
 OYBeoO8nSPvljxipyiQB6WrntjGd4Cwf5FfziYZV0Yw34eM+4r5jwO4xcI5qNUh74zdfy82JHy5
 sSm++
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94306-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: 8B0651A7F7B
X-Rspamd-Action: no action

Specify a minimum number of iommus entries. Currently the schema
requires exactly eight. Add minItems to allow fewer entries while
retaining the existing maximum.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 8dbaab16b11d4..f406cf6f8f9c1 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -104,6 +104,7 @@ properties:
       - const: sf_icp_mnoc
 
   iommus:
+    minItems: 5
     maxItems: 8
 
   power-domains:
@@ -404,11 +405,8 @@ examples:
 
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


