Return-Path: <linux-arm-msm+bounces-2225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC147FB525
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 10:02:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27AE61C21046
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 09:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3467932C6E;
	Tue, 28 Nov 2023 09:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="NGkt5BpA";
	dkim=permerror (0-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="8/1mIY83"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.165])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A702DE4;
	Tue, 28 Nov 2023 01:02:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701162126; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=r6eAu2ggbZSwoSOSC2LB9/TsOtVSDFGz1Yn6exqUJQ0DHNrZcDZFk2KMB6Pf2oxC4i
    BD9rNHK1hh72OUMXPKLavH9XGEbp8ZBmEli83jQTqYUvLSva2U2lgNj9pIX3HuMVJt+2
    qUz6BBCiePvo5XSEigRXFjYsQHZ3rLlZvVPXMb8P5gsWGcddPchoOkSsj1QNmgaWew8G
    6c5Ml6V5mmIOeUMjXSAZUPm8rCOv7yZZf2k1BAnlxms0I+mBi9T87BkWQnq6AU/3Zjn5
    bCpGLFHdB0BpP9+jgJ/ZYgEWUPJQz3LSIEqXVujdRK4OG77rNrCb8vS78Cn7rkaFkelM
    VQ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1701162126;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=njnHQBlxJazLWcAbW1gqa8mgblbBdF2CRCqEZQfBIIw=;
    b=qzWaaTlBGfcOt2NSli9uC30OIHhTm7Et3bwWlm5HYltZczHIohrUpFsbELgy0mQfkS
    WLyMz3zcRmaMElchm3RwfdjsZjVb+DeFjRQpFLfanu2K1+Ee6n52PZX/sHVTsBBPg6DY
    P5KBI2rUPZEwXI181zMZX6FcG0zFldP3BDmfAbL6LD5gWXt6A/XYrNilOalrEWN1yRFr
    nqPOIVRn30AqUGijCfS29EyfgvhiOP/EmYVHWyrs4QT5OxcZpJv9Y6jmDOwHRCn0negL
    1TTkuctz5ZvQSFL1jWE5UVbC2TNr894f2i30jcJhcjDaLQfuF91h5IJQ0/+8Ve/FuZfH
    58RA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1701162126;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=njnHQBlxJazLWcAbW1gqa8mgblbBdF2CRCqEZQfBIIw=;
    b=NGkt5BpAHMAwG5ZGf2LpEqrMuOEjWLA6KVKLpltw4TzVMPa9HVzLWEtcKSBfqWrujV
    qBOb4Dr8yy4PqS7SnkqExRYuFSIIElBJulaur0QNIREh0xy5LNNScHRpV0Ovj65xoe2R
    MZmoW4OWEBqr1uEslj3AZKcxky/jhP6NL0nhANSgY1EUHpY5zIdu5MsqZ7ghvg2N4jdy
    fYEqXZ7s2chHCM17/Dx78JTKLrSMGVOScX5rMWRHytabBb4IhYkYLHxhEzbiqRhMJSon
    MUFdLiI8i8a9xMdgl7S9Jd5vbf79Nk1Dk69X9amD5LK4afivnJjWMjz0ylAWKLMMoOYB
    UifQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1701162126;
    s=strato-dkim-0003; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=njnHQBlxJazLWcAbW1gqa8mgblbBdF2CRCqEZQfBIIw=;
    b=8/1mIY83/yDD+zTLGU3PquPNdvq5bT+5tGhBNu6pRU7uN+7Y0kocxGPDSnyY8/AxHp
    urFKBT2uGou13TLtIEBw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJD4peA8paF1A=="
Received: from gerhold.net
    by smtp.strato.de (RZmta 49.9.1 DYNA|AUTH)
    with ESMTPSA id t3efe7zAS925ktT
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 28 Nov 2023 10:02:05 +0100 (CET)
Date: Tue, 28 Nov 2023 10:01:47 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/8] arm64: dts: qcom: add initial SM8650 dtsi
Message-ID: <ZWWse_i-wjSTH8O4@gerhold.net>
References: <20231124-topic-sm8650-upstream-dt-v4-0-e402e73cc5f0@linaro.org>
 <20231124-topic-sm8650-upstream-dt-v4-2-e402e73cc5f0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124-topic-sm8650-upstream-dt-v4-2-e402e73cc5f0@linaro.org>
Content-Transfer-Encoding: 7bit

On Fri, Nov 24, 2023 at 10:20:39AM +0100, Neil Armstrong wrote:
> Add initial DTSI for the Qualcomm SM8650 platform,
> only contains nodes which doesn't depend on interconnect.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 2439 ++++++++++++++++++++++++++++++++++
>  1 file changed, 2439 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> new file mode 100644
> index 000000000000..b0a9ca53d58e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -0,0 +1,2439 @@
> +[...]
> +		timer@17420000 {
> +			compatible = "arm,armv7-timer-mem";
> +			reg = <0 0x17420000 0 0x1000>;
> +
> +			ranges = <0 0 0 0x20000000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			frame@17421000 {
> +				reg = <0x17421000 0x1000>,
> +				      <0x17422000 0x1000>;
> +
> +				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> +
> +				frame-number = <0>;
> +			};
> +
> +			frame@17423000 {
> +				reg = <0x17423000 0x1000>;
> +
> +				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +
> +				frame-number = <1>;
> +
> +				status = "disabled";
> +			};
> +
> +			frame@17425000 {
> +				reg = <0x17425000 0x1000>;
> +
> +				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +
> +				frame-number = <2>;
> +
> +				status = "disabled";
> +			};
> +
> +			frame@17427000 {
> +				reg = <0x17427000 0x1000>;
> +
> +				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> +
> +				frame-number = <3>;
> +
> +				status = "disabled";
> +			};
> +
> +			frame@17429000 {
> +				reg = <0x17429000 0x1000>;
> +
> +				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +
> +				frame-number = <4>;
> +
> +				status = "disabled";
> +			};
> +
> +			frame@1742b000 {
> +				reg = <0x1742b000 0x1000>;
> +
> +				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +
> +				frame-number = <5>;
> +
> +				status = "disabled";
> +			};
> +
> +			frame@1742d000 {
> +				reg = <0x1742d000 0x1000>;
> +
> +				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +
> +				frame-number = <6>;
> +
> +				status = "disabled";
> +			};
> +		};

Nitpick: Personally I feel the empty lines between each property here
are a bit overly verbose. It would be better readable without them.
Might be personal preference though :-)

> +[...]
> +	timer {
> +		compatible = "arm,armv8-timer";
> +
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;

I'm pretty sure GIC_CPU_MASK_SIMPLE() is only valid & used on GICv2.
Unlike arm,gic.yaml, arm,gic-v3.yaml doesn't mention "bits[15:8] PPI
interrupt cpu mask". Also see e.g. commit 4a92b6d75bab ("arm64: dts:
msm8996: Fix wrong use of GIC_CPU_MASK_SIMPLE()").

Would be also good to check if any existing DTs have introduced this
incorrectly again since then.

Thanks,
Stephan

