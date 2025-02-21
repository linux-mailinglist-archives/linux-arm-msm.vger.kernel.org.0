Return-Path: <linux-arm-msm+bounces-48786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E70D4A3EB0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 04:08:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E42D7A47A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 03:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192DC1E9B31;
	Fri, 21 Feb 2025 03:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Thj7SIuk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5F41E7C19
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 03:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740107179; cv=none; b=Xbc3q2/hyNXhEZG8Srg10g5K9tqDaA6tKNsWgpRyb+SHoF1ByXK4+vk7P4grvzQd0WacKKnw1+R0elQr03+lLVlRSDwPKV+CQ9Q1w+MtYSbLwXoCeSM/xRlyOXUYcq51COMaP5Nj81OrTcfeqNwcQ3n2rlOONLYFnpruhrqKVLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740107179; c=relaxed/simple;
	bh=r63bMyziS5VAUoRIbBTBNVf6CyjstQjiNuFZTwV1jAY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EB619FKLR7qqgjTmbpraJmSgOo66OByAd62YcBvLq8wCbDus/70EPdtnlIWO9iNXNEEeU+GdY/kLVF2pPhWfhFpTEkJCNz/dBqpevT0mWXjL+z6F9ZVjuV5G/ALHUMlft/IUkhDFbOrhGh8XlVz/5ImcutdYQXH7+PP5i1R3CVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Thj7SIuk; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30613802a59so16693941fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 19:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740107175; x=1740711975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=md2U+XG4zVBPU+kJo14bBfe09ZT4A11xAQxscpC41RA=;
        b=Thj7SIukDN7+EJpsNFLHpo0DrlnZ2pll5VT5txODaHgJKiJePmuPW/sJNkFG0VTki/
         FLFfySz9lLxKPk2CpX3ycOxUQPqRv8MIu3nVGdkjqU4gs6+MGgNSmcRfzHhUbHCZRpdZ
         sRGxJRSR3TptDQVFVV+f3A3tJU5FL8C+lOV/tua8IPwa+rb+ibNRgunfsYZCsgMMd2Ng
         AIrk2QQO2/LowCGNJNTYKyMsWtFCKKBnNX3ekrC0mszk1lcZ0mMpp561fosFhk7Xu7XO
         1MfaYGf8TS0dVxrDmrcWo0Akp721m/0ZbLMy9NiX+4nhHNtdlXsTZA5GO44mP5AW7X3S
         1tQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740107175; x=1740711975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=md2U+XG4zVBPU+kJo14bBfe09ZT4A11xAQxscpC41RA=;
        b=Oqrf5Ar8epnEUXAKXKqkittJwh/eByQYBdekzEErZYUeFFEyl2PG6E8C5jI0/GFzGo
         zqEq0N990Bcxn4kRc0bqOvKSr830EdI9CqihER3qgzLvzROnaaVqldi/h+QTOObuvJpo
         09l3iU1JPfKToe3p9B6HcLfrwZLZe9y4LyKgc/A9cjZraBs0jqLQYL1wGq9Kq8AAW3WC
         TqqnnF08npAnCr7uT1G7RSPGkzB5mjCLKshpNSDOtUYf+MIX3PyBmXOgD8WfAOuEOQ0d
         BYzvncA0aXjUmxThn2E+lYvodVIYNFY3yfbjvuM0yGNaFrmhtOtau9D721B+xSRRsaCi
         K6+A==
X-Forwarded-Encrypted: i=1; AJvYcCXqeZTyYi7cyTxqBaOobhlArj+CaVpf9FhwIP9XggpWA+PTAp8JLhxhzM3o1eWCkqhczGrp6wB3NJiAKuY0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4+Pks65rlRFUfrzJYrON51/sJdLnhpErJIXFM6tL1vnPc9Bsc
	FUyH2LFscf6YGdB8STSCqeK5dCgsYiIZfOC2AZ+V9CtLqhJjGiet066wdEyWwxs=
X-Gm-Gg: ASbGncv9OrAFAD46L8/zAGYuWCGJgyDZrWuFFjUsk3U2KMQjlHcb6xI7h853JVRLIKz
	fsFUZYNONOZqxyLm1LGpIlMVxft18PFund1MZRgKamtQfSPdfkTI7pnGZu2fVP7rVl9JUwcZJ70
	mw9CmN1RZjSX6e6YDYmptZCqhl83TO6oAw/lZrMr5nDUNF53TBIsIcjtrhNB0LWYFnSzUiXk98n
	eAhXCdZiA0enpFz56Z47EaT09wjEc6GP61o8Qnzr8od5juxZYZIWbTpyg0q+QfhWnQHz0a7RpJE
	22wvf0zQDbj/HD2/K2MvTwZpIo0OkLydpalwV+fqvZxuUmM0bvI+ba2/FOx82MnQ6ecnKg==
X-Google-Smtp-Source: AGHT+IEkCKO1qHn/CLGLJrlkaW0VmyfjmyJLlNnnkj2GKxT28k4CdaGsFTxMvNT8RgAQ7Nxch7LsGg==
X-Received: by 2002:a2e:9e13:0:b0:30a:4484:3ee4 with SMTP id 38308e7fff4ca-30a59960525mr4536621fa.23.1740107175293;
        Thu, 20 Feb 2025 19:06:15 -0800 (PST)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00--782.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::782])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a2be45876sm16021071fa.68.2025.02.20.19.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 19:06:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 21 Feb 2025 05:06:03 +0200
Subject: [PATCH v2 4/6] PCI: dwc: pcie-qcom-ep: enable EP support for
 SAR2130P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-sar2130p-pci-v2-4-cc87590ffbeb@linaro.org>
References: <20250221-sar2130p-pci-v2-0-cc87590ffbeb@linaro.org>
In-Reply-To: <20250221-sar2130p-pci-v2-0-cc87590ffbeb@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mrinmay Sarkar <quic_msarkar@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=992;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=r63bMyziS5VAUoRIbBTBNVf6CyjstQjiNuFZTwV1jAY=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnt+2aLBoqC7gDH2lR6m3K+MOfN99dXco+FQOjY
 Z7D5QrZfN6JAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZ7ftmgAKCRAU23LtvoBl
 uNpAD/4kNOZSOtJdaVWeVbYNca7r58HQ6qqCh6bHGhy2ow0CqxOf3rrkU++ZvfSR+uU+7nMIOhB
 dPIj/V1OG694l1g6LN0r2mYQGAwzhkGID6G1A30OQJg6Jeb4qCGOIBrv0GLKdeppxVk4O9k5Euk
 X85HA795bwkpC95P9r4jYNMFr1oNagHER9g1KKlUOJH6fYOB+llzsCYVNaCmad5of9zuMOkK6Qw
 8PnYX3uP+YKUog7y52RIca5OC/v4WRzzp8U8fNcxsjuEtngK2igQuvsMaZLM46jL9rP4wbr6Gtt
 OZ5WK78E+a0lqaUM22kkOCFkmkZ4gMM1q08hQFZOi0snXM5WCRJvIJOv1dbTBrtJ6x0xaAV1HKp
 yahVAV+hB/DiUlYvB6KoxAJjuixvSz1v8ZmZcCKnK7awHOYjVKgFTpb0BNab4VfHol1xUdc+fUx
 DWQOfBb4uzMPQFr8LRgMpVrumqf0gNrm+Nf8SJCHYAq1LPGqVfomkKWGtq05gsJ6OFQlHTeQLA6
 g1mq7f4ZRp4m6jAX6d0yLeJDdLFZdftnlAhJYrF+k61kqr7fIHUIWKi7PS62nfWGoGQKEvfbWZn
 k5SCY/74hHLh5Ii8iFRYLoSuCtsrPw8dNTBirjYm3XL1ysv0OIkoQnzcGk9z937Vc+SrZjecIY7
 SmyMA1H7CsmeeGA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Enable PCIe endpoint support for the Qualcomm SAR2130P platform. It is
impossible to use fallback compatible to any other platform since
SAR2130P uses slightly different set of clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index c08f64d7a825fa5da22976c8020f96ee5faa5462..dec5675c7c9d52b77f084ae139845b488fa02d2c 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -933,6 +933,7 @@ static const struct of_device_id qcom_pcie_ep_match[] = {
 	{ .compatible = "qcom,sa8775p-pcie-ep", .data = &cfg_1_34_0},
 	{ .compatible = "qcom,sdx55-pcie-ep", },
 	{ .compatible = "qcom,sm8450-pcie-ep", },
+	{ .compatible = "qcom,sar2130p-pcie-ep", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_pcie_ep_match);

-- 
2.39.5


