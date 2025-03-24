Return-Path: <linux-arm-msm+bounces-52337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 025E6A6DA9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 14:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E5DE188978A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 12:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6073525E83F;
	Mon, 24 Mar 2025 12:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="bmguFzJE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B476825DAEE;
	Mon, 24 Mar 2025 12:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.177.23.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742821148; cv=none; b=or/f6ohPtujY+s4eUdaAYbKDZNmqINz2N0Li/vPJZvWNL7pH+66k7qwAwUssHm+o0rGADfObVEnYQ9KGeQJvw3AYZh65wNzWA7RiWnpUjCQrZysPsekqUghZn/Sg7xPY9EI6/JDfBKUfGEy8O8+c8WTi9PhlQjL7wVYGV/Q66z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742821148; c=relaxed/simple;
	bh=SFFq3J4gZhE4NEQPRKA4r4uw31OBT2ZLslV569uGoM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nxYBVbGrbhi8FHy8G99kGurf8dAZDttNdXxoHdNmxaSH/sbGN2d7MGyAMLgQl603bq9r8hGuUCutbboUn0xgyiMJE1ewoBqkXu4H4NYj9hSNChJSuuVVnr6FLr5bFG7aO3caSGM00gTz5JR3jPn3+xufwzYVd3SCx+yLU9bBB9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=bmguFzJE; arc=none smtp.client-ip=89.177.23.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [192.168.2.71] (office.icewarp.com [82.113.48.146])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 0BDD51669CA;
	Mon, 24 Mar 2025 13:58:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1742821136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ghHaIoZTdVg9s4AcD2zJxE+31Mhe4sZUJ4hTXusvaGY=;
	b=bmguFzJEiOBbzjWzRn6AMh2wdiX+dlHiGJLokvL2KAqR9iQbGzH1wVn1RYonHzGrLIi17s
	Atw/knSrWKHsXIKx7mTIB/rKV70HFWjEEIkbghwmZW+9RehgeyAuYY8xzSJt/sbKHlGA8k
	Fk1I/4g/56QFVXYD8uSJkgGUAdcTxFs=
Message-ID: <2cf735da-9f20-4372-8b08-0b40c335ba6b@ixit.cz>
Date: Mon, 24 Mar 2025 13:58:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: iommu: Correct indentation and style in DTS
 example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Yong Wu <yong.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maxime Ripard <mripard@kernel.org>, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20250324125250.82137-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 xsFNBF5v1x4BEADS3EddwsNsvVAI1XF8uQKbdYPY/GhjaSLziwVnbwv5BGwqB1tfXoHnccoA
 9kTgKAbiXG/CiZFhD6l4WCIskQDKzyQN3JhCUIxh16Xyw0lECI7iqoW9LmMoN1dNKcUmCO9g
 lZxQaOl+1bY/7ttd7DapLh9rmBXJ2lKiMEaIpUwb/Nw0d7Enp4Jy2TpkhPywIpUn8CoJCv3/
 61qbvI9y5utB/UhfMAUXsaAgwEJyGPAqHlC0YZjaTwOu+YQUE3AFzhCbksq95CwDz4U4gdls
 dmv9tkATfu2OmzERZQ6vJTehK0Pu4l5KmCAzYg42I9Dy4E6b17x6NncKbcByQFOXMtG0qVUk
 F1yeeOQUHwu+8t3ZDMBUhCkRL/juuoqLmyDWKMc0hKNNeZ9BNXgB8fXkRLWEUfgDXsFyEkKp
 NxUy5bDRlivf6XfExnikk5kj9l2gGlNQwqROti/46bfbmlmc/a2GM4k8ZyalHNEAdwtXYSpP
 8JJmlbQ7hNTLkc3HQLRsIocN5th/ur7pPMz1Beyp0gbE9GcOceqmdZQB80vJ01XDyCAihf6l
 AMnzwpXZsjqIqH9r7T7tM6tVEVbPSwPt4eZYXSoJijEBC/43TBbmxDX+5+3txRaSCRQrG9dY
 k3mMGM3xJLCps2KnaqMcgUnvb1KdTgEFUZQaItw7HyRd6RppewARAQABzSBEYXZpZCBIZWlk
 ZWxiZXJnIDxkYXZpZEBpeGl0LmN6PsLBlAQTAQgAPgIbAwULCQgHAgYVCgkICwIEFgIDAQIe
 AQIXgBYhBNd6Cc/u3Cu9U6cEdGACP8TTSSByBQJl+KksBQkPDaAOAAoJEGACP8TTSSBy6IAQ
 AMqFqVi9LLxCEcUWBn82ssQGiVSDniKpFE/tp7lMXflwhjD5xoftoWOmMYkiWE86t5x5Fsp7
 afALx7SEDz599F1K1bLnaga+budu55JEAYGudD2WwpLJ0kPzRhqBwGFIx8k6F+goZJzxPDsf
 loAtXQE62UvEKa4KRRcZmF0GGoRsgA7vE7OnV8LMeocdD3eb2CuXLzauHAfdvqF50IfPH/sE
 jbzROiAZU+WgrwU946aOzrN8jVU+Cy8XAccGAZxsmPBfhTY5f2VN1IqvfaRdkKKlmWVJWGw+
 ycFpAEJKFRdfcc5PSjUJcALn5C+hxzL2hBpIZJdfdfStn+DWHXNgBeRDiZj1x6vvyaC43RAb
 VXvRzOQfG4EaMVMIOvBjBA/FtIpb1gtXA42ewhvPnd5RVCqD9YYUxsVpJ9d+XsAy7uib3BsV
 W2idAEsPtoqhVhq8bCUs/G4sC2DdyGZK8MRFDJqciJSUbqA+5z1ZCuE8UOPDpZKiW6H/OuOM
 zDcjh0lOzr4p+/1TSg1PbUh7fQ+nbMuiT044sC1lLtJK0+Zyn0GwhR82oNM4fldNsaHRW42w
 QGD35+eNo5Pvb3We5XRMlBdhFnj7Siggp4J8/PJ6MJvRyC+RIJPGtbdMB2/RxWunFLn87e5w
 UgwR9jPMHAstuTR1yR23c4SIYoQ2fzkrRzuazsFNBF5v1x4BEADnlrbta2WL87BlEOotZUh0
 zXANMrNV15WxexsirLetfqbs0AGCaTRNj+uWlTUDJRXOVIwzmF76Us3I2796+Od2ocNpLheZ
 7EIkq8budtLVd1c06qJ+GMraz51zfgSIazVInNMPk9T6fz0lembji5yEcNPNNBA4sHiFmXfo
 IhepHFOBApjS0CiOPqowYxSTPe/DLcJ/LDwWpTi37doKPhBwlHev1BwVCbrLEIFjY0MLM0aT
 jiBBlyLJaTqvE48gblonu2SGaNmGtkC3VoQUQFcVYDXtlL9CVbNo7BAt5gwPcNqEqkUL60Jh
 FtvVSKyQh6gn7HHsyMtgltjZ3NKjv8S3yQd7zxvCn79tCKwoeNevsvoMq/bzlKxc9QiKaRPO
 aDj3FtW7R/3XoKJBY8Hckyug6uc2qYWRpnuXc0as6S0wfek6gauExUttBKrtSbPPHiuTeNHt
 NsT4+dyvaJtQKPBTbPHkXpTO8e1+YAg7kPj3aKFToE/dakIh8iqUHLNxywDAamRVn8Ha67WO
 AEAA3iklJ49QQk2ZyS1RJ2Ul28ePFDZ3QSr9LoJiOBZv9XkbhXS164iRB7rBZk6ZRVgCz3V6
 hhhjkipYvpJ/fpjXNsVL8jvel1mYNf0a46T4QQDQx4KQj0zXJbC2fFikAtu1AULktF4iEXEI
 rSjFoqhd4euZ+QARAQABwsF8BBgBCAAmAhsMFiEE13oJz+7cK71TpwR0YAI/xNNJIHIFAmX4
 qVAFCQ8NoDIACgkQYAI/xNNJIHKN4A/+Ine2Ii7JiuGITjJkcV6pgKlfwYdEs4eFD1pTRb/K
 5dprUz3QSLP41u9OJQ23HnESMvn31UENk9ffebNoW7WxZ/8cTQY0JY/cgTTrlNXtyAlGbR3/
 3Q/VBJptf04Er7I6TaKAmqWzdVeKTw33LljpkHp02vrbOdylb4JQG/SginLV9purGAFptYRO
 8JNa2J4FAQtQTrfOUjulOWMxy7XRkqK3QqLcPW79/CFn7q1yxamPkpoXUJq9/fVjlhk7P+da
 NYQpe4WQQnktBY29SkFnvfIAwqIVU8ix5Oz8rghuCcAdR7lEJ7hCX9bR0EE05FOXdZy5FWL9
 GHvFa/Opkq3DPmFl/0nt4HJqq1Nwrr+WR6d0414oo1n2hPEllge/6iD3ZYwptTvOFKEw/v0A
 yqOoYSiKX9F7Ko7QO+VnYeVDsDDevKic2T/4GDpcSVd9ipiKxCQvUAzKUH7RUpqDTa+rYurm
 zRKcgRumz2Tc1ouHj6qINlzEe3a5ldctIn/dvR1l2Ko7GBTG+VGp9U5NOAEkGpxHG9yg6eeY
 fFYnMme51H/HKiyUlFiE3yd5LSmv8Dhbf+vsI4x6BOOOq4Iyop/Exavj1owGxW0hpdUGcCl1
 ovlwVPO/6l/XLAmSGwdnGqok5eGZQzSst0tj9RC9O0dXO1TZocOsf0tJ8dR2egX4kxM=
In-Reply-To: <20250324125250.82137-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/03/2025 13:52, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.  While re-indenting, drop
> unused labels.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../iommu/allwinner,sun50i-h6-iommu.yaml      |  24 ++--
>   .../bindings/iommu/arm,smmu-v3.yaml           |  20 ++--
>   .../devicetree/bindings/iommu/arm,smmu.yaml   | 104 +++++++++---------
>   .../bindings/iommu/mediatek,iommu.yaml        |  18 +--
>   .../bindings/iommu/qcom,apq8064-iommu.yaml    |  20 ++--
>   5 files changed, 92 insertions(+), 94 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml b/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml
> index a8409db4a3e3..ad51ace9ca09 100644
> --- a/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml
> @@ -48,19 +48,19 @@ additionalProperties: false
>   
>   examples:
>     - |
> -      #include <dt-bindings/interrupt-controller/arm-gic.h>
> -      #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
>   
> -      #include <dt-bindings/clock/sun50i-h6-ccu.h>
> -      #include <dt-bindings/reset/sun50i-h6-ccu.h>
> +    #include <dt-bindings/clock/sun50i-h6-ccu.h>
> +    #include <dt-bindings/reset/sun50i-h6-ccu.h>
>   
> -      iommu: iommu@30f0000 {
> -          compatible = "allwinner,sun50i-h6-iommu";
> -          reg = <0x030f0000 0x10000>;
> -          interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> -          clocks = <&ccu CLK_BUS_IOMMU>;
> -          resets = <&ccu RST_BUS_IOMMU>;
> -          #iommu-cells = <1>;
> -      };
> +    iommu@30f0000 {
> +        compatible = "allwinner,sun50i-h6-iommu";
> +        reg = <0x030f0000 0x10000>;
> +        interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&ccu CLK_BUS_IOMMU>;
> +        resets = <&ccu RST_BUS_IOMMU>;
> +        #iommu-cells = <1>;
> +    };
>   
>   ...
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> index 75fcf4cb52d9..36b31197c908 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> @@ -82,14 +82,14 @@ examples:
>       #include <dt-bindings/interrupt-controller/irq.h>
>   
>       iommu@2b400000 {
> -            compatible = "arm,smmu-v3";
> -            reg = <0x2b400000 0x20000>;
> -            interrupts = <GIC_SPI 74 IRQ_TYPE_EDGE_RISING>,
> -                         <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>,
> -                         <GIC_SPI 77 IRQ_TYPE_EDGE_RISING>,
> -                         <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>;
> -            interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
> -            dma-coherent;
> -            #iommu-cells = <1>;
> -            msi-parent = <&its 0xff0000>;
> +        compatible = "arm,smmu-v3";
> +        reg = <0x2b400000 0x20000>;
> +        interrupts = <GIC_SPI 74 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 77 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
> +        dma-coherent;
> +        #iommu-cells = <1>;
> +        msi-parent = <&its 0xff0000>;
>       };
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 7b9d5507d6cc..5b56e4f9d106 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -621,73 +621,71 @@ examples:
>     - |+
>       /* SMMU with stream matching or stream indexing */
>       smmu1: iommu@ba5e0000 {
> -            compatible = "arm,smmu-v1";
> -            reg = <0xba5e0000 0x10000>;
> -            #global-interrupts = <2>;
> -            interrupts = <0 32 4>,
> -                         <0 33 4>,
> -                         <0 34 4>, /* This is the first context interrupt */
> -                         <0 35 4>,
> -                         <0 36 4>,
> -                         <0 37 4>;
> -            #iommu-cells = <1>;
> +        compatible = "arm,smmu-v1";
> +        reg = <0xba5e0000 0x10000>;
> +        #global-interrupts = <2>;
> +        interrupts = <0 32 4>,
> +                     <0 33 4>,
> +                     <0 34 4>, /* This is the first context interrupt */
> +                     <0 35 4>,
> +                     <0 36 4>,
> +                     <0 37 4>;
> +        #iommu-cells = <1>;
>       };
>   
>       /* device with two stream IDs, 0 and 7 */
>       master1 {
> -            iommus = <&smmu1 0>,
> -                     <&smmu1 7>;
> +        iommus = <&smmu1 0>,
> +                 <&smmu1 7>;
>       };
>   
>   
>       /* SMMU with stream matching */
>       smmu2: iommu@ba5f0000 {
> -            compatible = "arm,smmu-v1";
> -            reg = <0xba5f0000 0x10000>;
> -            #global-interrupts = <2>;
> -            interrupts = <0 38 4>,
> -                         <0 39 4>,
> -                         <0 40 4>, /* This is the first context interrupt */
> -                         <0 41 4>,
> -                         <0 42 4>,
> -                         <0 43 4>;
> -            #iommu-cells = <2>;
> +        compatible = "arm,smmu-v1";
> +        reg = <0xba5f0000 0x10000>;
> +        #global-interrupts = <2>;
> +        interrupts = <0 38 4>,
> +                     <0 39 4>,
> +                     <0 40 4>, /* This is the first context interrupt */
> +                     <0 41 4>,
> +                     <0 42 4>,
> +                     <0 43 4>;
> +        #iommu-cells = <2>;
>       };
>   
>       /* device with stream IDs 0 and 7 */
>       master2 {
> -            iommus = <&smmu2 0 0>,
> -                     <&smmu2 7 0>;
> +        iommus = <&smmu2 0 0>,
> +                 <&smmu2 7 0>;
>       };
>   
>       /* device with stream IDs 1, 17, 33 and 49 */
>       master3 {
> -            iommus = <&smmu2 1 0x30>;
> +        iommus = <&smmu2 1 0x30>;
>       };
>   
>   
>       /* ARM MMU-500 with 10-bit stream ID input configuration */
>       smmu3: iommu@ba600000 {
> -            compatible = "arm,mmu-500", "arm,smmu-v2";
> -            reg = <0xba600000 0x10000>;
> -            #global-interrupts = <2>;
> -            interrupts = <0 44 4>,
> -                         <0 45 4>,
> -                         <0 46 4>, /* This is the first context interrupt */
> -                         <0 47 4>,
> -                         <0 48 4>,
> -                         <0 49 4>;
> -            #iommu-cells = <1>;
> -            /* always ignore appended 5-bit TBU number */
> -            stream-match-mask = <0x7c00>;
> +        compatible = "arm,mmu-500", "arm,smmu-v2";
> +        reg = <0xba600000 0x10000>;
> +        #global-interrupts = <2>;
> +        interrupts = <0 44 4>,
> +                     <0 45 4>,
> +                     <0 46 4>, /* This is the first context interrupt */
> +                     <0 47 4>,
> +                     <0 48 4>,
> +                     <0 49 4>;

If you want to squash another change,

0 xx 4
to
GIC_SPI xx IRQ_TYPE_LEVEL_HIGH

anyway, with or without:

Reviewed-by: David Heidelberg <david@ixit.cz>

> +        #iommu-cells = <1>;
> +        /* always ignore appended 5-bit TBU number */
> +        stream-match-mask = <0x7c00>;
>       };
>   
>       bus {
> -            /* bus whose child devices emit one unique 10-bit stream
> -               ID each, but may master through multiple SMMU TBUs */
> -            iommu-map = <0 &smmu3 0 0x400>;
> -
> -
> +        /* bus whose child devices emit one unique 10-bit stream
> +           ID each, but may master through multiple SMMU TBUs */
> +        iommu-map = <0 &smmu3 0 0x400>;
>       };
>   
>     - |+
> @@ -695,17 +693,17 @@ examples:
>       #include <dt-bindings/interrupt-controller/arm-gic.h>
>       #include <dt-bindings/interrupt-controller/irq.h>
>       smmu4: iommu@d00000 {
> -      compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
> -      reg = <0xd00000 0x10000>;
> +        compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
> +        reg = <0xd00000 0x10000>;
>   
> -      #global-interrupts = <1>;
> -      interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
> -             <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
> -             <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>;
> -      #iommu-cells = <1>;
> -      power-domains = <&mmcc 0>;
> +        #global-interrupts = <1>;
> +        interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>;
> +        #iommu-cells = <1>;
> +        power-domains = <&mmcc 0>;
>   
> -      clocks = <&mmcc 123>,
> -        <&mmcc 124>;
> -      clock-names = "bus", "iface";
> +        clocks = <&mmcc 123>,
> +                 <&mmcc 124>;
> +        clock-names = "bus", "iface";
>       };
> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> index ea6b0f5f24de..1eac27893b03 100644
> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> @@ -218,13 +218,13 @@ examples:
>       #include <dt-bindings/interrupt-controller/arm-gic.h>
>   
>       iommu: iommu@10205000 {
> -            compatible = "mediatek,mt8173-m4u";
> -            reg = <0x10205000 0x1000>;
> -            interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_LOW>;
> -            clocks = <&infracfg CLK_INFRA_M4U>;
> -            clock-names = "bclk";
> -            mediatek,infracfg = <&infracfg>;
> -            mediatek,larbs = <&larb0>, <&larb1>, <&larb2>,
> -                             <&larb3>, <&larb4>, <&larb5>;
> -            #iommu-cells = <1>;
> +        compatible = "mediatek,mt8173-m4u";
> +        reg = <0x10205000 0x1000>;
> +        interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_LOW>;
> +        clocks = <&infracfg CLK_INFRA_M4U>;
> +        clock-names = "bclk";
> +        mediatek,infracfg = <&infracfg>;
> +        mediatek,larbs = <&larb0>, <&larb1>, <&larb2>,
> +                         <&larb3>, <&larb4>, <&larb5>;
> +        #iommu-cells = <1>;
>       };
> diff --git a/Documentation/devicetree/bindings/iommu/qcom,apq8064-iommu.yaml b/Documentation/devicetree/bindings/iommu/qcom,apq8064-iommu.yaml
> index 9f83f851e61a..aaecad32dc9d 100644
> --- a/Documentation/devicetree/bindings/iommu/qcom,apq8064-iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/qcom,apq8064-iommu.yaml
> @@ -65,14 +65,14 @@ examples:
>       #include <dt-bindings/interrupt-controller/arm-gic.h>
>   
>       iommu@7500000 {
> -            compatible = "qcom,apq8064-iommu";
> -            reg = <0x07500000 0x100000>;
> -            interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> -            clocks = <&clk SMMU_AHB_CLK>,
> -                     <&clk MDP_AXI_CLK>;
> -            clock-names = "smmu_pclk",
> -                          "iommu_clk";
> -            #iommu-cells = <1>;
> -            qcom,ncb = <2>;
> +        compatible = "qcom,apq8064-iommu";
> +        reg = <0x07500000 0x100000>;
> +        interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clk SMMU_AHB_CLK>,
> +                 <&clk MDP_AXI_CLK>;
> +        clock-names = "smmu_pclk",
> +                      "iommu_clk";
> +        #iommu-cells = <1>;
> +        qcom,ncb = <2>;
>       };

-- 
David Heidelberg


