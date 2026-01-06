Return-Path: <linux-arm-msm+bounces-87728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB01CF9BF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 18:38:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DAF13105A19
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 17:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49FC34F275;
	Tue,  6 Jan 2026 17:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lRGd2Lkx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8010A34F251;
	Tue,  6 Jan 2026 17:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767720470; cv=none; b=a4bEcXROd94u3B80LyzchMwhk3RM0C4VfATetmbH7DuHOCiYecejX2kBWx/AGonStD0P1RDck77cRdM8iWQd1NS0+0I/t2jJo2aMG0cOsfX1lJGEIr3wPMZqZPj1Mbu3Za129GbZ+HrWFzUg76I4aYn655OxxzMwmL8zNzOdS6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767720470; c=relaxed/simple;
	bh=LJEzhFJJgshI64B7E/9xKLjZ/zb5hIwrwDMYuCJ3w5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNyP+aJ/nBetUhAB/RZPTIWGxQJGjdtBT9UUfE2SyJHVO7zJxicGaDmvSfjrseftqKdA/E0n4nFXa/KdIk3//xV14662h5XuxbP99dJKZmB08zF7G0wKlW6wqgm05gc8yGls6YvVFqWrC7OABpP+QJWXHWebicPHnbHs7pRfSoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lRGd2Lkx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93515C19424;
	Tue,  6 Jan 2026 17:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767720470;
	bh=LJEzhFJJgshI64B7E/9xKLjZ/zb5hIwrwDMYuCJ3w5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lRGd2Lkxh2D1ONWqr4YnEVh3M6/a7fKFce+62x+7c7b/8RupwUjJuq+t1Ols3BkWc
	 Sf/0/MTiDE6c1I0ycnUvXRITQBOoukegCxk6C46GHcbTSJJG+i7nxv5lWel6xttYBg
	 PQI5vooo+tZcRfoKLRfmxE8dfUwZkZkwMe8mQ84b2W0NqKQ7CnlHbBucJVITnBJcYr
	 RxbqdmoytUoIkT/Yt5b0rMxZ/sx9R48iTN7uy4ZYZDM9c5bwaWoDCZgDH57F5cwe37
	 M90UusMHTp2+YjF7pvXJfKUOICvwO53LqXpnaHoFgeZOq/KWpKzxD85r9JwjHi/Qvb
	 j78vMoWNi3bFA==
Date: Tue, 6 Jan 2026 11:27:47 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Le Qi <le.qi@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@oss.qualcomm.com
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: talos-evk: Add sound card
 support with DA7212 codec
Message-ID: <tujqzohs2vmfezrqt7cag252zboypk2sksu4cjoycxsscf7yd2@h7dlc5vuwqyg>
References: <20251204083225.1190017-1-le.qi@oss.qualcomm.com>
 <20251204083225.1190017-3-le.qi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204083225.1190017-3-le.qi@oss.qualcomm.com>

On Thu, Dec 04, 2025 at 04:32:25PM +0800, Le Qi wrote:
> Add the sound card node for QCS615 Talos EVK with DA7212 codec
> connected over the Primary MI2S interface. The configuration enables
> headphone playback and headset microphone capture, both of which have
> been tested to work.
> 
> Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos-evk.dts | 54 ++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos-evk.dts b/arch/arm64/boot/dts/qcom/talos-evk.dts

I don't have this file. Please rebase, retest, and resubmit once this
exists in linux-next.

Thank you,
Bjorn

> index 02656bc3cdcb..7e8f7e7f1d5e 100644
> --- a/arch/arm64/boot/dts/qcom/talos-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/talos-evk.dts
> @@ -5,6 +5,7 @@
>  /dts-v1/;
>  
>  #include "talos-evk-som.dtsi"
> +#include <dt-bindings/sound/qcom,q6afe.h>
>  
>  / {
>  	model = "Qualcomm QCS615 IQ 615 EVK";
> @@ -40,6 +41,46 @@ hdmi_con_out: endpoint {
>  		};
>  	};
>  
> +	sound {
> +		compatible = "qcom,qcs615-sndcard";
> +		model = "TALOS-EVK";
> +
> +		pinctrl-0 = <&mi2s1_pins>;
> +		pinctrl-names = "default";
> +
> +		pri-mi2s-capture-dai-link {
> +			link-name = "Primary MI2S Capture";
> +
> +			codec {
> +				sound-dai = <&codec_da7212>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai PRIMARY_MI2S_TX>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +
> +		pri-mi2s-playback-dai-link {
> +			link-name = "Primary MI2S Playback";
> +
> +			codec {
> +				sound-dai = <&codec_da7212>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +	};
> +
>  	vreg_v1p8_out: regulator-v1p8-out {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vreg-v1p8-out";
> @@ -107,6 +148,19 @@ adv7535_out: endpoint {
>  	};
>  };
>  
> +&i2c5 {
> +	status = "okay";
> +
> +	codec_da7212: codec@1a {
> +		compatible = "dlg,da7212";
> +		reg = <0x1a>;
> +		#sound-dai-cells = <0>;
> +		VDDA-supply = <&vreg_v1p8_out>;
> +		VDDIO-supply = <&vreg_v1p8_out>;
> +		VDDMIC-supply = <&vreg_v3p3_out>;
> +	};
> +};
> +
>  &mdss_dsi0_out {
>  	remote-endpoint = <&adv7535_in>;
>  	data-lanes = <0 1 2 3>;
> -- 
> 2.34.1
> 

