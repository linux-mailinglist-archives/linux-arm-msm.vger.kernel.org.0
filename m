Return-Path: <linux-arm-msm+bounces-62392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 048F4AE7D22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:34:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2C0016AC28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F90F2F2C52;
	Wed, 25 Jun 2025 09:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="TYWShlci"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C582EF9D8
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843411; cv=none; b=bXNSJzI69p9EJi4mngWvnUXgxU82iTxGU9tRj/d/HeTElh3qe2MYJ0rjvhA3u0fg9HtICKN21SV8m1aPfFqdVpd2OVOCGE+RDjCNoH28LK7J72Sv8i91LyHooYIQ0/INDzCDc2j5q05G9nKkU6PEYyVYY5OE32eO2tkqPumguTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843411; c=relaxed/simple;
	bh=jj4FXpnaY2L8qRW5W5/06pfPaCeBVQY5CbMDnnBtNOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iu8hxnpJo11vFoq8T0rM0lNJB0EeJw9Cu0vVX9fkzUCdsDn2Yak0OWOVWsSVjToi86L14PpZh8fbbLYHggOYrSstwZNpw52TJJ1Rfoz2BQUb2eibYJHwcnpzG01uDPydQxTDml7fTeBNXHcM5c7dilEAwzsPT/EQFuoBA+Z6460=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=TYWShlci; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae04d3d63e6so844101666b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843400; x=1751448200; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PueVIxrY0Lhx5OoYalpVzj7TJ+cyHwt+DTi/ni2FBMg=;
        b=TYWShlci2W5Vwl3f0oDuA0g1jKsPVsnAaplQ6wJo0q1upNo7DmpauwIWLYQWJybV1e
         MP3HQsU4RR+e+fV2MeWLKo14TBHoNVcCqw6nypUZJ9Cd4OyvYuRjV6hg046cDcCoOTNJ
         Q/Leh3Sx7qGqljcXbzOmTAWIhkUAe0vkzORj58R3RuK0OoAMVJ+97djUq9NiiVtvnfa7
         3Ecc8Em4E4DW7vERFkRl5Etwnovx12CB9z2pF3Q2JgoVTyuc9U50fcRBiS1rjFHk30F8
         otXqmlPtDZ4HqfC5rupSp75N7Oc9Npz5fAeW16UBNxeWoIMv1lWfnm8j0A9hrWE1QtTw
         zfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843400; x=1751448200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PueVIxrY0Lhx5OoYalpVzj7TJ+cyHwt+DTi/ni2FBMg=;
        b=iWjLQkw0tVJBtejX+/hzTD8/Jk5oVqayl9X+IDSAoM44DeFptaU5YQROpO3AFyjk7n
         xXbMFHC9qf19LRJ3ogtHoJbctx86AIEVGxcOlbdzCtQvPjwXSOy2tWmolu/pxlqSmg/b
         v57ny5lpVHiDuOoJM/OGhdH0LWlmKz917k/wJQQ8tL/sybPC2s5aCv4Rqsa3Sib324JV
         qYX//BTAt2vBzlBk0J7m/aqxQw8HX1UsiD8XVbKpxBExSrqxmgtkWtmqs2jbjJq6PTER
         2964nPpkMXWQTMmlQr1iua0hRLbHXR/LDbK7egaWNPSZdi9ZfRvF1yK5Rqw4IjnEJKqV
         UY4A==
X-Forwarded-Encrypted: i=1; AJvYcCVkXzDV+s/2HsXNitWCbLicZtyxDRtp0BUWfWLZOGlPV3J09JpAvV0X+f0MkigGSXRmYNSkcg4w3jgYVuLH@vger.kernel.org
X-Gm-Message-State: AOJu0YySy9XO9Jgk0+1zSCRTo3iD/l8lZRsBSFYLyjr3xWVgg0cp265D
	TO8gn28bgB37P4xlLgFssFKL8o/5xRgu9pXgpk+dEehQTwx9RzuvX8wkz9zIY/LOcpg=
X-Gm-Gg: ASbGnctG2vfK2pqcQuPZTVIotjHFJ9Nw9/KW3j37OQDO0QodWs7yOZlFbp87agkb21w
	UfOG22hirdmu7rTS2AMVdeK4SjZqmJRZtQmTANRz5Kr5iOighpgdYBqnxxGxMiHc5j15mCBH/Sd
	miZ5XRlAI9TMC3VWn/l8drISmJWWax0JbphHX5mkyuJY9ckfXGMqYyf8yGdfwDOT06iHVIqF/L4
	tGr61C66NHYozsWqR8BY92jLEim00gKvs1HO0/9M8VtfyiHhlPdO8fT/jwaA3b78wT6uLH9UgQw
	G+zgK8ciKH5+spDaxFqxtGdOi6WqyHdTrmIEHDORo6XsIjvTetIBBpp4NTY0ireMrRjKsSxjpJ2
	T+7Hi6g69AcfDW0OviVHnh3orOV+H0wG+
X-Google-Smtp-Source: AGHT+IFufR/i6s8bQEjNP+fAneYyap2WFk8eT5JzaxB2nRH9U0X06huQYHvxc1UIF4P5JtCVtPmAUw==
X-Received: by 2002:a17:906:6a12:b0:ad8:8529:4f77 with SMTP id a640c23a62f3a-ae0bea790d5mr233626966b.38.1750843400340;
        Wed, 25 Jun 2025 02:23:20 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0aaa0a854sm270277766b.68.2025.06.25.02.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:23:19 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:23:06 +0200
Subject: [PATCH 11/14] dt-bindings: soc: qcom: qcom,pmic-glink: document
 SM7635 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-fp6-initial-v1-11-d9cd322eac1b@fairphone.com>
References: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
In-Reply-To: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843387; l=920;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=jj4FXpnaY2L8qRW5W5/06pfPaCeBVQY5CbMDnnBtNOA=;
 b=QKOjYfcAGy5ZXnCmFyoCw5qgS3UKBJcYTNOrXIfiYw6DV7itFoCGZHGaadZiBNtQHiCfzjhFV
 Na8qSuO8OQ1DyaQjIxXMBvzPUgOVhYUCHVfApprHUM0Cz5utU9EaZ19
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the SM7635 compatible used to describe the pmic glink on this
platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 4c9e78f29523e3d77aacb4299f64ab96f9b1a831..2b77021b278dd9dca604cf31e39d9eca98f2aa7d 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -37,6 +37,7 @@ properties:
           - const: qcom,pmic-glink
       - items:
           - enum:
+              - qcom,sm7635-pmic-glink
               - qcom,sm8650-pmic-glink
               - qcom,sm8750-pmic-glink
               - qcom,x1e80100-pmic-glink

-- 
2.50.0


