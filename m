Return-Path: <linux-arm-msm+bounces-100808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGqLHYKAymnX9QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 15:54:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6330435C618
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 15:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF5053012E4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773DA3A63EB;
	Mon, 30 Mar 2026 13:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a+FJQ+Wc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355E13A383B;
	Mon, 30 Mar 2026 13:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774878829; cv=none; b=UemjePr+6+DstOEivqdAng+UFYHqVT78hzGdCpHwOQsAs/G+2MV7zC+pOcMLklSdNJ0mxgQpeDING7ce6uJUU+7rwoc2rFaOlWqiBJdzBRcIgUGOOE39Kfz6zdlLrfNt7Hw38j0hBREDI7oFqA4LHM2XLpxJWGbsaNwEo4R8yAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774878829; c=relaxed/simple;
	bh=J39HQakE17TWGqXGcLV22IHerUENHBaQNJGkO+DWfVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=McOoNjWzJonVKWQd22cxrd5KXQqqm/7KWPThcKGn+vXIZgxkxXQGBp9m7bn08xb6bH9yZ0XxKWgyyigUt4amJIfLvbHM1WYkUva/b5MrKrHMfmoHU2QoS2GiIGZAxSSh+h/0vvuAg9HqlOSEs3DghuPlqOqwOSQZ2AJIC4K9ti0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a+FJQ+Wc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B97C4CEF7;
	Mon, 30 Mar 2026 13:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774878828;
	bh=J39HQakE17TWGqXGcLV22IHerUENHBaQNJGkO+DWfVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a+FJQ+WcRxq71rBQSTXYga8LfprytjOdj5avxwAOMdPab8bNFLKblb4Y3XosKyKwz
	 wFDqZLR3Ek1YhQskaeQ6KjElHpjNZwGVySeBHYQfH7CmraEuqnfXyU6BDcpBgqHYnI
	 sJ1MBBY76rfA1WNoC8nN1m0g4FvNCR8ApruJfEnqEZmWW/0PQnYxWjNnQGCfZGNjPT
	 rxzw9sTHZcS6xf4sjDp7T/SRTIH1PTfzzJcsxkIxA/ynCvGGZYvyW5LpAI/2qS3GqW
	 x+6MKFOALo+u9fmsxvBKBsbVS2uoBWDQQfS336CZkKkqd+PbNZapSu5WL8auUGwCqs
	 lEMpeR0lXGlbQ==
Date: Mon, 30 Mar 2026 08:53:44 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Le Qi <le.qi@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@oss.qualcomm.com, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: talos-evk: Add sound card
 support with DA7212 codec
Message-ID: <acp_9Z6Bhq9ngDAi@baldur>
References: <20260324060405.3098891-1-le.qi@oss.qualcomm.com>
 <20260324060405.3098891-3-le.qi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324060405.3098891-3-le.qi@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100808-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.17:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6330435C618
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 02:04:05PM +0800, Le Qi wrote:
> Add the sound card node for QCS615 Talos EVK with DA7212 codec
> connected over the Primary MI2S interface. The configuration enables
> headphone playback and headset microphone capture, both of which have
> been tested to work.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos-evk.dts | 65 ++++++++++++++++++++++++++

There's no such file in the upstream tree. Please test on upstream and
resubmit once this is ready to be merged.

Regards,
Bjorn

>  1 file changed, 65 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos-evk.dts b/arch/arm64/boot/dts/qcom/talos-evk.dts
> index af100e22beee..6352d614e288 100644
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
> +		pinctrl-0 = <&mi2s1_pins>, <&mi2s_mclk>;
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
> @@ -109,6 +150,19 @@ adv7535_out: endpoint {
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
> @@ -124,6 +178,17 @@ &pon_resin {
>  	status = "okay";
>  };
>  
> +&q6apmbedai {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	dai@17 {
> +		reg = <PRIMARY_MI2S_TX>;
> +		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +		clock-names = "mclk";
> +	};
> +};
> +
>  &sdhc_2 {
>  	pinctrl-0 = <&sdc2_state_on>;
>  	pinctrl-1 = <&sdc2_state_off>;
> -- 
> 2.34.1
> 

