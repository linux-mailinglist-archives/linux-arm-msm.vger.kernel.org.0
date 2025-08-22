Return-Path: <linux-arm-msm+bounces-70409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E01A9B316F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 14:06:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAF7E5C21B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3892FE57D;
	Fri, 22 Aug 2025 12:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t8eav59l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122DD2FABFA
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 12:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755864282; cv=none; b=E17FHb9TJQ5ReTdW9xMCAdW66wwUSbsEGbb9yOu/BLGkgtbvxD3Hvl0E1tZBFtAqxYAIDor5KgCr8vqVyDYvaFM3DApDBSfq57TgruIFrXQKCsYnF8OVlkyUBxvy1yLQSxas8wOcF9T+x47czErGerShDQeCWw+CMCtlE16jzUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755864282; c=relaxed/simple;
	bh=YQ+XbFW/8lO2P0B2PZ1HFyUscAH5YzihzpphldOG8og=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RZRP611dPwlU3CNQQ42BW8iiun2gK7rCBqTMh/VCw56TnGA0pHEdHVQgcw4k40S1yHAAV2g7m/+cWLVg7Z9xENSMOMt18COBwAZ1dAjHHQJHKWIP/utY1D+06gqfi/bih7/1RSGPatpyvaZHOr06oNyS5pPKbpIU2gQSL1eq+8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t8eav59l; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6188b5e3de6so299995a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 05:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755864277; x=1756469077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aSHCZyBIl0+Mccuv4ZcmEDnZR30iJO58Wb2y765+r3E=;
        b=t8eav59lhRdPBvbs9PwZgNZ61M5kl6/Sf3uQKNl99D/SXysW2NI6r13IOteCd25gkJ
         ZngqabBgkjEx+KQC6uK8sRTqmod0J6fCGWgyNpkyLrkijsr7aXyjZdRcVZAyGaHYg2lH
         HFV1N7yBquumz/7vNAaYmacLpWqRGeM6u3vUDDqIuVYLMkUpghtjoDs6TVnI3L6rovkW
         wohKzLbtBJ/OrTpHFToy88ryRwFb2PdThg+wdpfQloT5+tbXRMmjpRzKXJAL0QKYzbNn
         LcZlLilCgPX12X9d3MuK1o6QTCe/I+pv9lkA8AZLRVY7eCsuOdIrKhTU5KZgKI2aNZ68
         /RyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755864277; x=1756469077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSHCZyBIl0+Mccuv4ZcmEDnZR30iJO58Wb2y765+r3E=;
        b=kM36fJUQMhX3aOou9cS8dhJ1bTPhdRcoUkbga6Da5ScYWwhJEWFxO0aTQRl0pUriHR
         kkAWCqYqLh6xTLWU40tGcuWwVjhPjRS4pVmL1p/kqdHzf/r3aa3l+08//4HWwpEMLzUa
         VlmBn1jXvkah7c+rpW0FhwWIJUXDCN0j2dmQZMGtJFvYsUA+qyC2epea/YGzzD8qaufM
         GUEvC1qEZ4FK5kFPVUQPI1i5Quni2QIHP6vAnTqaO/DbRr1e+xWc0Vb/++bXEbzpvpXs
         lx9/T4SNZdA+htT7ZYMYoNl2wChTX8lgeYQE1SBn01wwbT8R9T2b0BwGbsWOIOnk4gTY
         uzXw==
X-Gm-Message-State: AOJu0YwPMSxj298KPC6hngjaYFtYz6hxmbBJZVIFExbTV4vQhmQbLzl7
	wlm28l6/nd3smUT+tTaW5q/UUsV5vMiRipexHmezpGJjZrbhektQfpV4Z8FH0yddIMo=
X-Gm-Gg: ASbGncvPcKCI+cUvbj8Rne7ABzOTw3NrPDaLromZxaJ+C9bYwLTSoarBLrwrL2V8ggE
	rPQTS/+jYVp58bGROCdqZ8gnqL8j3rqzRXRbg3jYbug1KzG6AEUyHh8ZLncHhZl+x6nZX7zIXoO
	wrTpL8Q69KCkic8ziztI0ayTymoYqdMRdE2Yr3iB5e3KUz/YHDBAk7v1/RdVBb1Xs14u3/qUUZA
	rb6kjHtBGXzwKbsbzfg+1M1kXMyp2O3UXclson6EAMReRmr2p8FKkSWIJAXjsk8cVdNOkWak/Px
	Vf9xCaPZMPCPkMAkaRjR5at4nj0DKjNHNddlNB+uDKT5DpurMHE0QEAE2U17EVZ9/Tx1p79jAhP
	iezapu8gygFz6AHFRtsv8RZEGADx8PXAoAWxOOEdrtJTt5JJiPA==
X-Google-Smtp-Source: AGHT+IH7FGdZmjEraDxJWfBqGYxc6mCVhP9spbLViFtU/+UVheDiGx1G++0yU86YB0yZZqaMU/vXGg==
X-Received: by 2002:a05:6402:358d:b0:615:7ba6:4876 with SMTP id 4fb4d7f45d1cf-61c1b91089cmr1189387a12.8.1755864277308;
        Fri, 22 Aug 2025 05:04:37 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a757b9b39sm6690444a12.48.2025.08.22.05.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 05:04:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 22 Aug 2025 14:04:08 +0200
Subject: [PATCH 08/15] arm64: dts: qcom: sm8250: Add default GIC address
 cells
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-dts-interrupt-address-cells-v1-8-d54d44b74460@linaro.org>
References: <20250822-dts-interrupt-address-cells-v1-0-d54d44b74460@linaro.org>
In-Reply-To: <20250822-dts-interrupt-address-cells-v1-0-d54d44b74460@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1307;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=YQ+XbFW/8lO2P0B2PZ1HFyUscAH5YzihzpphldOG8og=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqFzB6+297T/mf93jhRCwQIXtm3nL0W3Tb92Kz
 n+zeo6lxoCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhcwQAKCRDBN2bmhouD
 18/9D/9jrbJUeB8CB6+8oMHmTZfSKch32byqduGz4OD0SoHHDHRYeKNOgrppcVGYsa9WgjKSGOI
 XfbM0LqCxV9giR3xEadd1MQg1RAX9yDqVCZYLgWi1AKMTHxQLn2tsNtJ59iYa8J9SmRLnEPovBF
 VwvscXXQO+P0P9QYyQ77h+BWDumYeN5tFXMUV6zhkmYXqg6NQXdp/FGavj/bqfKwd3tXOkZMF0R
 4zQCf0oY24DzJD2qMvTlAcPdRDfaeU+uUyMilTzSJnYSC9b2uUV+YouGQ84Fqat65S5eInyqj4C
 rbLzXca3sVvVUMraUTBB68NliCbfbvbm+OzhL/pr4K0ZnuQWvWeEDrqQPwbmStPO+DOrTezySsZ
 BOI5NLHp7CUpkCx92wM1lNmM2xyx/TXwSdTCRKohxXOOKbKVQMeMG4i3+i6+nXgyU3T74Irvueh
 X07Bmbujm6Fo4a7m3EWvv8Zg4YvcCQJrB7gUwgoSvT3sNu8kLa4E7WR7mukVVHoBpQjy3RnOMUe
 EUsoMgGwtnqTR4zOHR2nc7B0osyVmhHPEZbM2PTBv+0z6s/5E1bgHK2pTR8piWgCMCQ1rvmmr4j
 PUiTtngP548H6Efhbns3d7Ien9g8ifVqXYdl+6vjwe2hLGqIGZOqJqZXBghdlUhsyyXLQs2iGhB
 tpjteK1B0l7r5bA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add missing address-cells 0 to GIC interrupt node to silence W=1
warning:

  sm8250.dtsi:2166.4-2169.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map:
    Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 244339cfbed5c32708c282de18f5655535e2ff45..8e0eb802d68e9670a10cd6e227bd1eccbd872866 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -6084,6 +6084,7 @@ compute-cb@5 {
 
 		intc: interrupt-controller@17a00000 {
 			compatible = "arm,gic-v3";
+			#address-cells = <0>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			reg = <0x0 0x17a00000 0x0 0x10000>,     /* GICD */

-- 
2.48.1


