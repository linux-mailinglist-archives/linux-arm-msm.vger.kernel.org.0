Return-Path: <linux-arm-msm+bounces-64692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5CAB02F71
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jul 2025 10:07:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B89A41A60212
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jul 2025 08:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B56C1F91F6;
	Sun, 13 Jul 2025 08:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cSPh43rn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD091F03DE
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 08:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752393998; cv=none; b=dWVDSYEUgBySONZBkxH42HaOkUYDIihywwj3f8JP/d8i+iyvUZXSdJxsdujVCEg1eRMhggjs59DcFIf/x18lgQmIFXv9WbSSOq+ZTxjkAdcVSO33P5so09P98xr74C+br47u8mxM6MF/STBhiS47IM1Y0GdWKIgpnsA/TCLoEA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752393998; c=relaxed/simple;
	bh=tMLsPA0quQvuGmIREPbj4TjYGghQCOz1jliVkGJZk/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CDTiqeWgHo6sBIKbTWoa27gOTgbFqL1DKYYbbbbDKlH6xnANxGpickunxBtA/3ZxqM+bIFcyCnZqahDnvR2g52Yc8d888hxT0oozAGVyIaztHYKWHJkoGrxY1q8quPk0RDYbq70SgeJNzGJUy+aBV2smODw8aokb7RQi7DuXWoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cSPh43rn; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so2651814f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 01:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752393994; x=1752998794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AdkfO4ocsxOWvyOKIsWLa8yR7W3TV/OTXW4E8s0id9w=;
        b=cSPh43rnl0OpMF1Cv27rL2MSxBiF+tJZgM9IST5JZv4D5UCoUIq9ut1J0+BV/WkTYq
         SVrSr1P6hIkOTOyz9clA0Al7oipo3WoBQcH9XBEDt1MZwKjbM6w6708uifLQ9dSPWK6F
         d8oaCjXHel42nHbtT0Jo8cloNJ7rVRVHxfiKZKt1XJePJxfGx/+oWNgPpLxEptuZlqKg
         je9ogFrLDCLNLQ+sKUBaXAeuV6R0sYGmrzsJA6IRalmR8XjExDKboqGuo8JLqP7SsiHb
         ZorKtcD2d/Yb7sg2QERWnH9bcftRZqUA4FuNvQHdv1QDXOm3Zcd/SP9FeUEiviBCzAdH
         zPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752393994; x=1752998794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdkfO4ocsxOWvyOKIsWLa8yR7W3TV/OTXW4E8s0id9w=;
        b=mUumLcxSvOgwxWAUJHqg2uSVLTRTI7zt3epTo7PYLNPRjxx4zF86KKgXyZQTsI1ilv
         pCPGFARUCJqMnBllqUas5/p2TnZL7ozQ7finAuhPG9msjy/2bwLEFKiz8wpERaEawrTf
         mx1zPbM1uNygcpNcvNQiJyOTDupAtDlhzJL7b8HF1+Vuy0FaNabpwSKN7EWrC/JkcTXc
         jj6jb54XXMmXGDqnu0HzTw/Rk1zFWqyQNgwN/eErm0ZuP8wuy/yNu1itZcuNDoaKBYBj
         A8p23HwOiX+uiw/iQrXXKP/YNsJ/swMw97WlTdOiBrAknm7hxP+LmkY+3fqpGs/ybMvk
         VLig==
X-Forwarded-Encrypted: i=1; AJvYcCWl+vcuR2qC93UIXvbMQaymtxfL6sgkfyxMDMXyzjuipHgvc2svWWjCcPD/Vf/WuEsZaOdTQv9/ecGcR+BT@vger.kernel.org
X-Gm-Message-State: AOJu0YwAhbbzVH9WBYCjun7ztdX9GQv0cw0m6mhaOA1hWO4bsSXRuoeR
	8AQUtkg4rUjyBQD4j245d1LBlmXw7BECPgwtE1/15rzjAzpRgHY6/AzjzxC5Ha+JZhw=
X-Gm-Gg: ASbGncuiFV43SJZQP2L9vHpYdBIOFAK8xyFju11b9HL4wNtrvmJhmYHQc50/ZLFl6zf
	HXI3ZgVv+2MiK1yiGO6GBk1Z6as7jeYseP4zuoEoJMh6tF09KXeqdA7s3Au0j3df2D7sQ7tU7Un
	fwma3u7VJnA6xDV/WyUd6Vg4YGBcxPySCHlW0DIoNIqdHguVjXMUTqcSce9dRV1V92KLQUPoQ/j
	pEM+5/67sMzqrlvF3rayEl6LU9DQjhFWg1pwHvJRXMyTulvxSsfF1hahfaQ2dR1eapKntAwfI8v
	BVmCUZjtPFTFt9931I9U9duVM1rFNb9575S8zyWTDN4by3TadFPgEbiGZi4VLbRYcdeYRbRNRHs
	vvy4c0XNBrZkYXtgJdKYPUDsIuyvePLFuBMPd
X-Google-Smtp-Source: AGHT+IETm4Mw4C1WYnuRN1dk6ybQZp+9JbAH95T21UPA3HATzrdU0KuRyY3yw2FY1OGAeUmBlJ7Q9Q==
X-Received: by 2002:a05:6000:2410:b0:3b5:f0af:4bb0 with SMTP id ffacd0b85a97d-3b5f2dd1547mr6813098f8f.23.1752393994069;
        Sun, 13 Jul 2025 01:06:34 -0700 (PDT)
Received: from [192.168.224.50] ([213.208.155.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc22a8sm9386608f8f.34.2025.07.13.01.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:06:33 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Sun, 13 Jul 2025 10:05:26 +0200
Subject: [PATCH v2 04/15] dt-bindings: firmware: qcom,scm: document Milos
 SCM Firmware Interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-sm7635-fp6-initial-v2-4-e8f9a789505b@fairphone.com>
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
In-Reply-To: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752393945; l=1075;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=tMLsPA0quQvuGmIREPbj4TjYGghQCOz1jliVkGJZk/w=;
 b=wu4AXtzoN4ob1c0+EbjfVXv57Iq6e0C+uSlV0gsPf5gka7RfNfnS0ibFZYnFdL1sPEcYX22VD
 XbfEFfvkl6AB0MjF8vd/pEno76wGjhFqV0jo7S1Szl8EFehBgvQGvL1
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the SCM Firmware Interface on the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 8cdaac8011ba499794ebc5b4291b7983c209821b..b913192219e40324c03f4ff1dce955881e7fb3d2 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -32,6 +32,7 @@ properties:
           - qcom,scm-ipq8074
           - qcom,scm-ipq9574
           - qcom,scm-mdm9607
+          - qcom,scm-milos
           - qcom,scm-msm8226
           - qcom,scm-msm8660
           - qcom,scm-msm8916
@@ -198,6 +199,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - qcom,scm-milos
                 - qcom,scm-sm8450
                 - qcom,scm-sm8550
                 - qcom,scm-sm8650

-- 
2.50.1


