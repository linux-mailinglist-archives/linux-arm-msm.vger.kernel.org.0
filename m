Return-Path: <linux-arm-msm+bounces-70404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B684B316EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 14:06:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 587121CE7F92
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 942BC2FC00B;
	Fri, 22 Aug 2025 12:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TQ7nZN+0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C0D2FB62C
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 12:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755864275; cv=none; b=FkBzaV2Kgsujy9hoHkcNXaFiRXwyvxu2DJOWWc/gJty5gdXJP3G3UElfImPhK+IBtr9KMvs+P2wd2HSP6Xqy6aDFf0u2sle2PPtSc48iBAPEVrA+TP+0Tdugq2bHj04XzsgMYanl4N0hJgl/Ww7mw0Dz+ggOtXh+E2sbhTG0900=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755864275; c=relaxed/simple;
	bh=4AgdR+nUPxDGpHVpCtNImgOl8nVt25du4PkFAcxkq+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NZqPTpd+rw+PHPq+ULLNj3I7S1oMblPuuK6YLD3P/W8ZqMBi002ony9nrYWZRaQQiZJq1d8I0nA1nbuu5Ve1uIJl6UBcVBi15aYt59xskw8B7kVgCqBCZKXsYjN0OTaQ64iSjXXYBPcwpX4/LHxJxfP8QHU2IipXkndoaVEv1+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TQ7nZN+0; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-61c2874224cso25922a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 05:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755864272; x=1756469072; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NbrfAeV+o+Cz+hO2auUG52osA65sHT4USeC81XSA+wc=;
        b=TQ7nZN+0yRE7Prt4PyL2WGiPY6tIQfwfdcutbh4Gb9/gp6EQZ6i46s6tf+SZksg/BH
         1dD95ghIefxsHmmBw85Z0h82ZGvWaz4zolVZOwlJMOsV5l4GiTbrNTUz3XM06fmVF+Yy
         8a872WRhjblCiYjY/fOy0/PRdKjBM76d1dUvVIh4HNi4lvXwCHiCbtL2XJWYABtT1GDG
         92Fb1LeHRkQX7Ph6iTK41tp22IF9BttaI0Z7uuFCWD7hOMl89dSFEkWgVQME66Bvg+iy
         xOBzXPpkBNeUKXXyk2JRDbbS3I65QLdeHHBYX17S+6UOdItN01i8yHjnvvVyJK0zkKgf
         qnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755864272; x=1756469072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NbrfAeV+o+Cz+hO2auUG52osA65sHT4USeC81XSA+wc=;
        b=UuMgmRZ09pKGcF/JHyJLU2mz+D343dSJcMstoGr+AlRlavtXx6delUYmZVjg2bKGmN
         Ftqxrilu8cu5SSqUhnuB5VSKh3GZb01vmBHZAfe/HrLdbakprNbSj9zl2CwZx5Ce2k1K
         4YFEfeb04qMw4HGuGOWOsu3FYJXHvWgFqjV1VYCXk7CwWvlhGcUAg5N9dtEoiNDTHyih
         Ut4LYzXu4U6Xnq/6PGSVtdxP8/axbqpE7FPpFSVyukBpwdWsWWPVbOtF+rtJzhFGFz19
         QeKqLGuQLuJBDSY9YvyazD0Orvupn7cWJIbmv6MJ0iBEvmO+shXueavNsTPASEQXXn4b
         Q/FQ==
X-Gm-Message-State: AOJu0YwvUNnjAvWeoEm9XWPeTPD+t/Ycgy/unRWmduUkfL93xKWTWBCT
	I+RrT2d1aTM8Jfl/iDMVWlsusi79ab6piNGvSA85GUtYA1e3tYR22LAuu/CV2HjJ6Cg=
X-Gm-Gg: ASbGncudI3/GXrjk24qPy71/8bsYoHVQndLSwyMDdhqH/p+4scu/BGkSVBzVdtfrSSA
	Z5lOTzXfuZRi+UuvDRZdYXI/UfSWbDKO0dnFIlq9S4gESpdKjnriLvZpYtfdly+KrcmsZp3bMsB
	b6qhU6EM5jULiVBGbrL6ZlTaJuD+1lGSp/SWSp2DmYrX0BWpDefDWWXUXQyjP1Zc8UvA8AuOreb
	XfWAeDb0ZRmPaYjHjI6FN2dm31O2ie5um6zH07Aty/bsnUQr1bbqDci0N1X/9QhvbMGhb4QUHmq
	t4Q/SI2z9+SFdjTvH8H+hEbCQRd6LgRF4F8/hMVxK+rvFWzOXVl546/CZIbWz3LUmpC9keDPIy1
	n6JkWo/6lhp3KwO86dLDk8GxwWVYq+BF+YKUyEvg=
X-Google-Smtp-Source: AGHT+IEJffxFDEj2R9m0x28FIe9VrxTqcj/uMX3YkndkHiU8QlzdxcWkcllPkZkBXnTW0SjDzDaG0A==
X-Received: by 2002:a05:6402:358d:b0:615:7ba6:4876 with SMTP id 4fb4d7f45d1cf-61c1b91089cmr1189212a12.8.1755864271851;
        Fri, 22 Aug 2025 05:04:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a757b9b39sm6690444a12.48.2025.08.22.05.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 05:04:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 22 Aug 2025 14:04:04 +0200
Subject: [PATCH 04/15] arm64: dts: qcom: qcs404: Add default GIC address
 cells
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-dts-interrupt-address-cells-v1-4-d54d44b74460@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1316;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=4AgdR+nUPxDGpHVpCtNImgOl8nVt25du4PkFAcxkq+o=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqFy968KrWpcNsnAFGUg9XJ3mJSKIWopwzbg04
 mTISg5CPpiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhcvQAKCRDBN2bmhouD
 135mD/9hURYOd/nJEFfMI6LBdyWWOiMY4qcxncB6LMr5EQanXHMKXb03ETrd8DowTa3wGJ7IjmK
 6Op8/hHuB/Dwh/TwZC4IdWxU0x8LbZ3/9lXsQereMCqo1CXSEJmjJNgr9qOekhJfHHL58QT+hNr
 rFzIGwiZ2jtBi9xd4/n2v52pj43sQGiIRd1/aEM4yiv2sk2xfQpLB6/6CP1CxajKcDyNF/MyUV2
 myoelI7T9uf/u3vqGga63eAnyY6/b8lLxXikd3q/4j78kxJZHZAYdz14K1JrFVpFZwwJei5pHfC
 KCbqjVlq2pkLJTGHMYjPRitMjQzl+QTx6jFgtZ2Swo7IZCEPq5hfmhEHN+E82KE646njnmV50+A
 ZZ8hTjhgCmxzMrqGIiSEh4bQtkW+sGvTNTX+RHJ11VMMqjjIF1JWdCmZ5ZEushzTSuiVLsfWQEM
 yI5Yf5SQQImTEBECEvsUDS6EzEEH1qlNfzIxaIXBLlKj1vZKS63pai9I5zQ5uYelkAU6h8PJ+Yy
 Ps0M/2lFLZ2SvvkBu7zjwgHD//z7GBPnZ7Ur8N7eb2PHra8l3H95mxAkj9v41Jr0KSjmt9SZoyZ
 rdRfj23madG6PrQKg/AtvNBmCt53LK9vY61zujNUuFPhc3/adpTraVuJ4RcsU0hpLXZsJGIcWvy
 TPfj4y3JVlwocwQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add missing address-cells 0 to GIC interrupt node to silence W=1
warning:

  qcs404.dtsi:1496.4-1499.30: Warning (interrupt_map): /soc@0/pcie@10000000:interrupt-map:
    Missing property '#address-cells' in node /soc@0/interrupt-controller@b000000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 5a9df6b12305c796b441dc8c75687c469943cab8..4328c1dda898c26cd1cd172762ad87b8c4ce068b 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -1312,6 +1312,7 @@ pil-reloc@94c {
 		intc: interrupt-controller@b000000 {
 			compatible = "qcom,msm-qgic2";
 			interrupt-controller;
+			#address-cells = <0>;
 			#interrupt-cells = <3>;
 			reg = <0x0b000000 0x1000>,
 			      <0x0b002000 0x1000>;

-- 
2.48.1


