Return-Path: <linux-arm-msm+bounces-84238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F6FC9F4B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 15:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 2AC56300008B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 14:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37B6B2F0692;
	Wed,  3 Dec 2025 14:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UrhJH2CX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BC836D4F3
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 14:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764772236; cv=none; b=Mu2ozssQENmTkRAh4TuuSxjPPgR6eJUtcxqgEP3E2yRy/uMrih/Q0GC12OZKDKrDHXJ/wEjyreX+Xx88K0J3YO75od1BEz80filyKl+tU86A95/VBaK99pFho07p4G3JfLf+NMVRK3sDJDzHk41Q88zabE6ZCArok4Lu6Y8hWcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764772236; c=relaxed/simple;
	bh=RMChCRFFEZ65dmSjyz2PAZW0ExUoxw2HKVT2lrK37xM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YJF8ZVstbqSzYAaAd/uVIclBAX0bztp6eksJ3ydfgnQuwl9eI5lt/GAWPxy84JnSgovBgdIgl2AL9wokHspJxid8g5Z5+SuQJG6Sj3H8Pcgrr5UZtEUIjzDGDksKykVszFPxIkLisbFSWPOkavhbxcDjxOm8SH9AxZS0isG7c0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UrhJH2CX; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8b1bfd4b3deso516688785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 06:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764772233; x=1765377033; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=13jA8V8frcQh+Kv0METbSRDdSF+gbSTvzPzmiYwzA0c=;
        b=UrhJH2CXRSclZwuRXaat2zhftrQS34JvO6HkxZ0hwtB0joAGBB9SH3NUIIjlCPeBSJ
         j38LtqatDrriLhS0eD/FtoQj3BIf7dR+wgrdLNP4u1zP4BnUb+u19jzRd2Z0m4XNmsfX
         /41r1DUFG0EwsJ0V4R0Cs3XArX7TClAMIdUNu6OtCq++7vz/6VZxXs1iI+Te6drUiGHS
         udP5xpeTtidtGMi0OMwisSQhvYW+SKebNXlvqPKEdQf4WEgUzTatnyFX1VkM0rt29sC+
         SfEdflW+WuFMew9WWI8rOV2GFAUpWL4IqgAIX6S6Jf4du1YsqK56HZLppIHBnRICUozX
         BDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764772233; x=1765377033;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13jA8V8frcQh+Kv0METbSRDdSF+gbSTvzPzmiYwzA0c=;
        b=Vfd2/cn/hbmK640cHw6r+2LVUTyCPTE+XTFwM2d0lhAQ4/ZeOGebEfbl8lWWvIe+fT
         n+3/6Lcuewu10gUE6J/rWGYuDGMAB8bd6IDkSKdF4dxTGmYfWZwCUhjIrklSSiahahWk
         SG4/xXJfLuU4euZydUPTD1QqF9IBISXTDl6c24h+ojs2/5bV/2tyr1qUjcpVoET0yq6P
         egg3ZC/k04R1JPLx7bsJLmI6WMJCsO4DP/T6xJlwcuFUPWnm+fBT4UQyobI3NIHb+9mz
         1+2ENigdeA1YFfzva4XL3tRsQaM4Uf4fxzCZgJbV8UgCdJLFUEJMR9Kso+8Nw5JaAzZZ
         5n5A==
X-Forwarded-Encrypted: i=1; AJvYcCWUN8FKiKxn7VRa2MreCIYpUu8xToX0w1OrhVrrvx7xd5txsI6QJgx/76EcrjjDDepBwY44D0gEYD8s6DMg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+HkO4bcB1Y4CkKYbydf0PwNMHAfV7lDBIIon5GuKh/2GcIz+s
	J2heYg4SSQRiq52r8nELlnEbDXPu2Xd+9b/itzEq6EBZQtBuCQ7MhbAedHTG9dvkDroxOGW33MM
	V+/ZmBMHgtjRZFxZwmIjZsk0B91ziYU2vG3cZlIfgJg==
X-Gm-Gg: ASbGnctfoLDmSk/Hq35eoyQHheuBCXWS2mecapY8j3KOMHCYjvZt7xWGee6c3RDMFx9
	B1CzRG31hJTwdVwqPpyWjbRR8Ll4aPIgdAAXzqRePbHFbt2NlxR85Jwttax8VXJOmCp+Ay3eMHW
	oY+SwAW7Z3A0z3+vHVYR4eyu31jtfa4u7Fr+vxA4thY4fa3GKuVICFW6Y3SrnCP0vcpYURSrVct
	E53XGEfVQpPs5VcYKTpcLtvwDBcpsB0mE4Ci+E/rjTOUw9kdNuNZBRzH6QCWNSVwaRXPssps/Ii
	O7bjKPeYn/NYpi5R7//konmTNGPs
X-Google-Smtp-Source: AGHT+IG+dtM/tA0+7V4eO7aEdSCo29eBvV6UxX/J0OEYRSm8uig5vICwrUHf4L3vwGq/i2bZdmVG47rgb3kSBNUvnZQ=
X-Received: by 2002:a05:620a:2584:b0:8b1:c1d3:8e91 with SMTP id
 af79cd13be357-8b5e5b15b5bmr314414185a.39.1764772232991; Wed, 03 Dec 2025
 06:30:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
 <20250908-enable-byte-cntr-for-tmc-v6-6-1db9e621441a@oss.qualcomm.com>
In-Reply-To: <20250908-enable-byte-cntr-for-tmc-v6-6-1db9e621441a@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 3 Dec 2025 14:30:22 +0000
X-Gm-Features: AWmQ_bnPEN-1MzILBf1Rpw3Tgp2yMP9ShncM3uAGstu8OXc6GMqh6xi_bqmbgKo
Message-ID: <CAJ9a7VitqEix7dumLq2ND=6+PU_eCkm8=YkHB0n7iHdJ8iKeVA@mail.gmail.com>
Subject: Re: [PATCH v6 6/9] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, Jinlong Mao <jinlong.mao@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Sept 2025 at 03:02, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>
> Add an interrupt property to CTCU device. The interrupt will be triggered
> when the data size in the ETR buffer exceeds the threshold of the
> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
> of CTCU device will enable the interrupt.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> index 843b52eaf872..ea05ad8f3dd3 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> @@ -39,6 +39,16 @@ properties:
>      items:
>        - const: apb
>
> +  interrupts:
> +    items:
> +      - description: Byte cntr interrupt for etr0
> +      - description: Byte cntr interrupt for etr1
> +
> +  interrupt-names:
> +    items:
> +      - const: etr0
> +      - const: etr1
> +
>    in-ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>
> @@ -56,6 +66,8 @@ additionalProperties: false
>
>  examples:
>    - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
>      ctcu@1001000 {
>          compatible = "qcom,sa8775p-ctcu";
>          reg = <0x1001000 0x1000>;
> @@ -63,6 +75,11 @@ examples:
>          clocks = <&aoss_qmp>;
>          clock-names = "apb";
>
> +        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names = "etr0",
> +                          "etr1";
> +
>          in-ports {
>              #address-cells = <1>;
>              #size-cells = <0>;
>
> --
> 2.34.1
>
Not sure if you need me to review this purely DT hardware description
update but...

Reviewed-by: Mike Leach <mike.leach@linaro.org>

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

