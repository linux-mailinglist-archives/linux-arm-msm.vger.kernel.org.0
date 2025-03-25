Return-Path: <linux-arm-msm+bounces-52419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 712ADA6E7E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 02:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4FEB3B044C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 01:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52836149E16;
	Tue, 25 Mar 2025 01:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="fS/TbaFe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B20713D89D
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 01:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742865187; cv=none; b=IlBnYsXr9DlkdiuTUbdudr58zdtYrWXAtIDb1O4qLuGL08GkKprM0AE3hvBRXD3UR8fTeXhE8XcAwLIjDWIs7F6mDNkFBqRZS2JezRWcveD4aXq/TzxDmbBC+A3yxcCZW+6ZQDmyzNzfxM8jlyRZVHYjTyF9qc5YCRr2pwTNJs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742865187; c=relaxed/simple;
	bh=59b8GxSKdHIoohtTVvoh6d2qSq20IxVL/ynPTXhEdgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gXj8dxW+zgfVmYrEwqR0QL3iDO2k6dapUddoQz4WqdiahQhwFBpd4MCIWvLVPJa6PwJXXfGdUbqhHEVbMBmF47oUh9Gw9uIW4Z/C0N6SYhGSSaYHGmA1lw6bx06puZxql25MTssDUSJlFSsucsR29U2Nz5GJ6Xzm/61N0D8lkh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=fS/TbaFe; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3d46693a5e9so45119475ab.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 18:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1742865184; x=1743469984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tilX7QnvKAF8sEocr5hjC3RCRlvcCP2GLlCgaOM9mZU=;
        b=fS/TbaFeyrcMwOU69Oifk/aTtztKozl07K1xH4DNdY0LmOgvVJGesuaitLdkPnFQXj
         ostoAvOyzLeLEJ5gZxtwj8IQAP9CYrYpSqz/Cb7VQsm6YIGRPf0YzpBRiWfkPxlcN2L8
         GWmITUYWEkdYPEqIP+xdcRLv2WPgrMDxlJw3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742865184; x=1743469984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tilX7QnvKAF8sEocr5hjC3RCRlvcCP2GLlCgaOM9mZU=;
        b=IMZoNinvGvNki2Luh7setRsX7a4a834/+6btV4xZGSFyUnWppsw619WQ85r6aH6bsG
         vW8dkWfnrrykoLUVajELdeDpq8t+HnfHoZhO/syhGV5QripRULiG4ZFHljGKS9uBwNbl
         JOgFC7jmG0C8BLsL5Ssd08GPYdOUdgtGZyQjxS6BrFZA/Gm+oBO2LsWDoV+/Tvskp2mf
         egsV+w5lIL5igafIibjyQGbOxr9G6VdsYQMWIddDj/aXTYsTbbQOyOKp9hMbf+iWwsa3
         K+ZD6Tj/jcP/GfPoqKIt5dec9PvocByPN27AP9xERPpyQ9gJyEdNu81h9/2zxWO6UV7l
         6BEg==
X-Forwarded-Encrypted: i=1; AJvYcCXv4KdWZUvzS2DtBa5Mam1jahAwJpetqfd9ayy5QGcfbE6fvOo00EqX4tQ3v7h+BHe4Cp+XLgvWCpTnbRXV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx01wbuztQMfxNjL7WNXWL1hrD+bma6tm5/r20SGCJIXTlMtbgo
	cP7dfRDN2O2McEjJXG2+gYUcz+n9P4nsXPYZAbMBnsBaoQ4lHu2x3jbM+ugFog==
X-Gm-Gg: ASbGncsU91IUojLIOBAGQ2DRDu96NXVleXjReFcusGulxUzuWv/Ct3rYK0/mk9rFXra
	TEAQHBEctUUWgp1JzbqRYeb7u9kOZk8NSOLKoa57GuqXgiRIvWuFb9EVEWPgB82atAr8kzLgGdm
	YBv7zGOSGvi15b3eflE8h72D23dGiB4APqCUjA231w1dUqx+ftDk1Olcjk+Xxid8QN9Q95z/RTd
	pgZh+xOJCK8WFt+qhupg5BsJ9034HtiaDIw7Eh5etPW6xT6QU7u/V9+GwtLOqvK+Fwgs9iS0I98
	OStfIiWyot1rSUt2xZRFgDXNXLBKzaJ5kq1VpLBuMI4Dt0bVmqixCmCPYar7nA34V5MBSa4sBKH
	pcuGzo/IAfXhg
X-Google-Smtp-Source: AGHT+IGSsAzB0Of7YOYUV68uvoK6ZCJ/6KJgHQicf12+sgaAuVAWuoM864+T45bF4b0vuJZt/1JG6w==
X-Received: by 2002:a05:6e02:3904:b0:3d4:4010:4eff with SMTP id e9e14a558f8ab-3d596164076mr128011515ab.13.1742865183547;
        Mon, 24 Mar 2025 18:13:03 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d59606ee04sm20819565ab.6.2025.03.24.18.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 18:13:02 -0700 (PDT)
Message-ID: <5c8fa538-6c04-4fcf-bcad-21fc1e2a0a9b@ieee.org>
Date: Mon, 24 Mar 2025 20:12:59 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: net: qcom,ipa: Correct indentation and style
 in DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250324125222.82057-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250324125222.82057-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/24/25 7:52 AM, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Looks identical with the exception of the white space change.
Thanks Krzysztof.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   .../devicetree/bindings/net/qcom,ipa.yaml     | 124 +++++++++---------
>   1 file changed, 62 insertions(+), 62 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> index 1a46d80a66e8..b4a79912d473 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> @@ -210,70 +210,70 @@ additionalProperties: false
>   
>   examples:
>     - |
> -        #include <dt-bindings/interrupt-controller/arm-gic.h>
> -        #include <dt-bindings/clock/qcom,rpmh.h>
> -        #include <dt-bindings/interconnect/qcom,sdm845.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/interconnect/qcom,sdm845.h>
>   
> -        smp2p-mpss {
> -                compatible = "qcom,smp2p";
> -                interrupts = <GIC_SPI 576 IRQ_TYPE_EDGE_RISING>;
> -                mboxes = <&apss_shared 6>;
> -                qcom,smem = <94>, <432>;
> -                qcom,local-pid = <0>;
> -                qcom,remote-pid = <5>;
> +    smp2p-mpss {
> +        compatible = "qcom,smp2p";
> +        interrupts = <GIC_SPI 576 IRQ_TYPE_EDGE_RISING>;
> +        mboxes = <&apss_shared 6>;
> +        qcom,smem = <94>, <432>;
> +        qcom,local-pid = <0>;
> +        qcom,remote-pid = <5>;
>   
> -                ipa_smp2p_out: ipa-ap-to-modem {
> -                        qcom,entry-name = "ipa";
> -                        #qcom,smem-state-cells = <1>;
> -                };
> -
> -                ipa_smp2p_in: ipa-modem-to-ap {
> -                        qcom,entry-name = "ipa";
> -                        interrupt-controller;
> -                        #interrupt-cells = <2>;
> -                };
> +        ipa_smp2p_out: ipa-ap-to-modem {
> +                qcom,entry-name = "ipa";
> +                #qcom,smem-state-cells = <1>;
>           };
>   
> -        ipa@1e40000 {
> -                compatible = "qcom,sc7180-ipa";
> -
> -                qcom,gsi-loader = "self";
> -                memory-region = <&ipa_fw_mem>;
> -                firmware-name = "qcom/sc7180-trogdor/modem/modem.mbn";
> -
> -                iommus = <&apps_smmu 0x440 0x0>,
> -                         <&apps_smmu 0x442 0x0>;
> -                reg = <0x1e40000 0x7000>,
> -                      <0x1e47000 0x2000>,
> -                      <0x1e04000 0x2c000>;
> -                reg-names = "ipa-reg",
> -                            "ipa-shared",
> -                            "gsi";
> -
> -                interrupts-extended = <&intc GIC_SPI 311 IRQ_TYPE_EDGE_RISING>,
> -                                      <&intc GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>,
> -                                      <&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> -                                      <&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
> -                interrupt-names = "ipa",
> -                                  "gsi",
> -                                  "ipa-clock-query",
> -                                  "ipa-setup-ready";
> -
> -                clocks = <&rpmhcc RPMH_IPA_CLK>;
> -                clock-names = "core";
> -
> -                interconnects =
> -                        <&aggre2_noc MASTER_IPA 0 &mc_virt SLAVE_EBI1 0>,
> -                        <&aggre2_noc MASTER_IPA 0 &system_noc SLAVE_IMEM 0>,
> -                        <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_IPA_CFG 0>;
> -                interconnect-names = "memory",
> -                                     "imem",
> -                                     "config";
> -
> -                qcom,qmp = <&aoss_qmp>;
> -
> -                qcom,smem-states = <&ipa_smp2p_out 0>,
> -                                   <&ipa_smp2p_out 1>;
> -                qcom,smem-state-names = "ipa-clock-enabled-valid",
> -                                        "ipa-clock-enabled";
> +        ipa_smp2p_in: ipa-modem-to-ap {
> +                qcom,entry-name = "ipa";
> +                interrupt-controller;
> +                #interrupt-cells = <2>;
>           };
> +    };
> +
> +    ipa@1e40000 {
> +        compatible = "qcom,sc7180-ipa";
> +
> +        qcom,gsi-loader = "self";
> +        memory-region = <&ipa_fw_mem>;
> +        firmware-name = "qcom/sc7180-trogdor/modem/modem.mbn";
> +
> +        iommus = <&apps_smmu 0x440 0x0>,
> +                 <&apps_smmu 0x442 0x0>;
> +        reg = <0x1e40000 0x7000>,
> +              <0x1e47000 0x2000>,
> +              <0x1e04000 0x2c000>;
> +        reg-names = "ipa-reg",
> +                    "ipa-shared",
> +                    "gsi";
> +
> +        interrupts-extended = <&intc GIC_SPI 311 IRQ_TYPE_EDGE_RISING>,
> +                              <&intc GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>,
> +                              <&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +                              <&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names = "ipa",
> +                          "gsi",
> +                          "ipa-clock-query",
> +                          "ipa-setup-ready";
> +
> +        clocks = <&rpmhcc RPMH_IPA_CLK>;
> +        clock-names = "core";
> +
> +        interconnects =
> +                <&aggre2_noc MASTER_IPA 0 &mc_virt SLAVE_EBI1 0>,
> +                <&aggre2_noc MASTER_IPA 0 &system_noc SLAVE_IMEM 0>,
> +                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_IPA_CFG 0>;
> +        interconnect-names = "memory",
> +                             "imem",
> +                             "config";
> +
> +        qcom,qmp = <&aoss_qmp>;
> +
> +        qcom,smem-states = <&ipa_smp2p_out 0>,
> +                           <&ipa_smp2p_out 1>;
> +        qcom,smem-state-names = "ipa-clock-enabled-valid",
> +                                "ipa-clock-enabled";
> +    };


