Return-Path: <linux-arm-msm+bounces-62385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2F6AE7D34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:35:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35E7318932A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49362EF66E;
	Wed, 25 Jun 2025 09:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="SALde4YR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD86288516
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843401; cv=none; b=GxQU1xE8kecJMi7M96JFWg8J2DetQlIAfTZlaTl5Q1yJA/lR7bSNDLEC8EJbwsCPOb2Z82kE+fvABduQZLqv2rgD3a8AOTWj/udTeEJjQHEudSUnyYHnNfW8YYmj2e4J6/NZXFFe1o0oKMf+5EY/5pJ0A0k4yiXNAxucssch3T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843401; c=relaxed/simple;
	bh=kMLBa8XpPsXDlevy1KezXuXVxIBGJ+gP0d2yYQ8HaFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QcRiqRSOaBBne5UbOThJX0sB436kKgsfIMcLvU3zzDIENv3LbPntdcUUo+DNd/K7w+xb930vs7kZH7ONRaZY2pbcHmclCDwCBMKNpxI8OR4wEsv/VZkJhcdkXZlcpSbZu+KWF/uFV0da41EJLWoIp/8ak4VWEIOWK18diFPk8y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=SALde4YR; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-acb5ec407b1so1057103266b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843393; x=1751448193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UOHLr8D9V4NN9mFAr1BTUycpg0tsYamgkXBgt1W/9eI=;
        b=SALde4YRCJjksmuc6U8y+xUk9jyb2O/Ii0opn4gsCd6/TCvaIJzKRlprrvC8XAb4Dh
         lLLqcrU6IdVaB7uKOgnQCoz6tLsOErtEotkc5+92GRKVUYmRtJ8UvB6jw3kKF4sHO855
         EF1qkh3M/wcp25k6AbZLNoE4DzpKyUDdQ968CBjuDhV1TLQChy3EMlQBqblE3L5wekPi
         tmuz8wAMnfVwwXSsq+vLczJjZNYWOUYhtWCYyruEU+3Ao6xitWLT9wDpv3L0iWvYFhDF
         gB/FFzSc5GWOlq25Y6ZarYNLQXG7N8fZHinVT0wSeD/chjzZqY+KeDnzN9VSFAHRNv9j
         nn1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843393; x=1751448193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UOHLr8D9V4NN9mFAr1BTUycpg0tsYamgkXBgt1W/9eI=;
        b=DAepyiE0yciEhnBok4mMtm0ESiLRlvjXrXzzgMtk0ZcXkNsKk7mmEyW8jv7XOhM5MH
         Obp4xYAJHDUr+wv5IujWzs1nHotfg+FP5Q4p4TGNGzWRW4pXyqYai/ULL4e+cEHNPeoG
         3wg0FKz+4UbBoRqTgdAsZhZVDd83qeoPx4SEo7A+JYPf8jl5xYkd162puejNuq8wIc1o
         TSK/+t7gigC50C6xNILBnX9NZiWML+bpxSFPKSK7nKD9MEHXHnVT+Zk26B9z6GIklFHQ
         eIcHBgCCkUVvN6hQY9pPAh5jzYv7q45QNOXm+IWIJzxBz7QFtepwHDEuKRehWW81UeT/
         1gsQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+qWBUWea/UFR9SLPmRx+0fAZCjHFA4u44sGPXdUH0k2bSCgruOkQhCTWS5sdrFSK7z1wd5ipvqKAzAouG@vger.kernel.org
X-Gm-Message-State: AOJu0YzKyX6H9UHLp5XvtAegnwRPP2MesV3X9Ht0MgTlf84DeJkZ7Tpm
	9T7A4AlrWJYG186NzsHX5lQ4ysK4TzvvMvOk7yp4XZchb1dLw6xGbBfJddT2eh1DYFY=
X-Gm-Gg: ASbGnctexLjhk38J5GvXOw9RSmdth0R+eTjgpnE6MMk99BGOGMEV6/9ZEwxj/cpdSC5
	xRtfeMTzR1NlaO921EPvqPAbwwAGa296OuQ6VuCeCWakEaPPgksRi4IiytBFB+s3YQZsHUmAcDP
	KRFYBNVZgDIJSu05gAxJfC//H4+jtfTdjl6hPfBnC9dBEbJSC+6TLyQdej8Ov8KAf37nppYVCu6
	f1wGmhs4IPHBF10SQR4tIHaL+amzaBQ4srFggKJNwQ4BZh96LZVR0KSFd+NYCCk6ft/lDooGHTn
	fCmfXdSCCw0LGDkhFUvPcKUE6/v0No87TSFV9//9Jf8fesRrXbFFA0D0jhNbGSJOlUOY2+0+OM5
	B7dmh9ftpvYjMte09gvU6PWyf6iwU3vVo
X-Google-Smtp-Source: AGHT+IHB94tY24lAu3oQO4eGRW4BZuV+A/oDZCQK+b5Z9Mh+mG0nksh62lt/+F3W7DxAhvn4P2IzDA==
X-Received: by 2002:a17:906:d0c5:b0:ad2:417b:2ab5 with SMTP id a640c23a62f3a-ae0beba2300mr176480866b.60.1750843393322;
        Wed, 25 Jun 2025 02:23:13 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0aaa0a854sm270277766b.68.2025.06.25.02.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:23:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:23:00 +0200
Subject: [PATCH 05/14] dt-bindings: qcom,pdc: document the SM7635 Power
 Domain Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-fp6-initial-v1-5-d9cd322eac1b@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843387; l=893;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=kMLBa8XpPsXDlevy1KezXuXVxIBGJ+gP0d2yYQ8HaFg=;
 b=mdr+a+luUjX7AFv2DO5FQDsLMYgOBVUahwjTho7Ooy7Ze3zZt8tNJoSuRat0p8SJ/e1grPELu
 6pVuw/hE3yPB2VtbzJkUjC9SFW/NHJPRSwLMfmGq3pXJPW/wvwZrJgp
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the Power Domain Controller on the SM7635 Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index f06b40f88778929579ef9b3b3206f075e140ba96..e809f50734bc3136a8915a12a1a1cba2bdb62890 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -43,6 +43,7 @@ properties:
           - qcom,sdx75-pdc
           - qcom,sm4450-pdc
           - qcom,sm6350-pdc
+          - qcom,sm7635-pdc
           - qcom,sm8150-pdc
           - qcom,sm8250-pdc
           - qcom,sm8350-pdc

-- 
2.50.0


