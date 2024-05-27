Return-Path: <linux-arm-msm+bounces-20640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F32C78D0944
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 19:16:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABEA22830CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 17:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57D938DDB;
	Mon, 27 May 2024 17:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uLnDTfTp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D2B1DA58;
	Mon, 27 May 2024 17:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716830191; cv=none; b=GOHBQI15s9cAP30Wx8lRKOFb8gYcrocEHcet01ODvLctxNH5BC7OeEd6sQzZCWPhpKM2ifvAm3w0Aw2HkMFJ2oKk48tYeIvf4hz6EnYAPAcXDJjjIpDVMstaWgg7DPYoDCCwokFvQvSIg2yu/4gniIBzjOorcF3J3KGFxUhnhEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716830191; c=relaxed/simple;
	bh=EjOc56aRyzKFkw2McUibnXXwAFLZ8zW7DftTuyG0EAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kjjwvtgF/bPcq+6GG43+YdaM3HleLxOaE3qy5vkTVBn6Pa4ifk7N+2T8r/u+Udex9EdbN3BJXiaJJAQC2HcmWtr6FbJSn88diRwti9nj/7+vmSf1A62ksnQdCTpCfaRtTahZf+bV+gHtq/iQeDQeXcPNL+vWFxZkH+LzuGkq2Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uLnDTfTp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A5CBC2BBFC;
	Mon, 27 May 2024 17:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716830190;
	bh=EjOc56aRyzKFkw2McUibnXXwAFLZ8zW7DftTuyG0EAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uLnDTfTpXCpxPpnS1b0p2OW/U4+nez++TEk9DGB62hFkWd0WTYihGnPZW8G0oHuaC
	 3ACt4pJ0uQl2yYk0yj6m/1bUpbxGxuM9xi8XwV6xF2bzfUOWDW3hgGplgDGOX5BbMn
	 ljGhVezYa4ioJybgoZbd80ptWCBkX0fQTC8x5gtEk7QRdKhq8arHWLzSeJ6BYW/3Xt
	 ZK8hXyZhAkCBjsYPYsnOd9Sh8eQKQXRhaWssWk/rUkeyyJqhTFzH3qG7iMnR7xLkNS
	 qk0qGz2VmviprKrdnfW/xyyzSWiJ63/uRVkXhKtNqASuTWQ6MYlLZPl1kWphF7qI0B
	 o94A0Kk4lU/gg==
Date: Mon, 27 May 2024 12:16:27 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: pm7250b: Add a TCPM description
Message-ID: <rjhf6pzdcw6zjneosshvg4d6ov5twxndya7q2btf3tnj5yy3fs@zzu6rfg6wzlu>
References: <20240329-fp4-tcpm-v2-0-d7f8cd165355@fairphone.com>
 <20240329-fp4-tcpm-v2-2-d7f8cd165355@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329-fp4-tcpm-v2-2-d7f8cd165355@fairphone.com>

On Fri, Mar 29, 2024 at 01:26:20PM GMT, Luca Weiss wrote:
> Type-C port management functionality lives inside of the PMIC block on
> pm7250b.
> 
> The Type-C port management logic controls orientation detection,
> vbus/vconn sense and to send/receive Type-C Power Domain messages.
> 

pm7250b is found in devices where USB Type-C port management is
performed in firmware, presumably using this hardware block.

As such, it seems reasonable to leave this node disabled and only enable
it on the targets that doesn't do this in firmware.

Regards,
Bjorn

> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/pm7250b.dtsi | 39 +++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> index 4faed25a787f..0205c2669093 100644
> --- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> @@ -51,6 +51,45 @@ pm7250b_vbus: usb-vbus-regulator@1100 {
>  			status = "disabled";
>  		};
>  
> +		pm7250b_typec: typec@1500 {
> +			compatible = "qcom,pm7250b-typec", "qcom,pm8150b-typec";
> +			reg = <0x1500>,
> +			      <0x1700>;
> +			interrupts = <PM7250B_SID 0x15 0x00 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x15 0x01 IRQ_TYPE_EDGE_BOTH>,
> +				     <PM7250B_SID 0x15 0x02 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x15 0x03 IRQ_TYPE_EDGE_BOTH>,
> +				     <PM7250B_SID 0x15 0x04 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x15 0x05 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x15 0x06 IRQ_TYPE_EDGE_BOTH>,
> +				     <PM7250B_SID 0x15 0x07 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x17 0x00 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x17 0x01 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x17 0x02 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x17 0x03 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x17 0x04 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x17 0x05 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x17 0x06 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x17 0x07 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "or-rid-detect-change",
> +					  "vpd-detect",
> +					  "cc-state-change",
> +					  "vconn-oc",
> +					  "vbus-change",
> +					  "attach-detach",
> +					  "legacy-cable-detect",
> +					  "try-snk-src-detect",
> +					  "sig-tx",
> +					  "sig-rx",
> +					  "msg-tx",
> +					  "msg-rx",
> +					  "msg-tx-failed",
> +					  "msg-tx-discarded",
> +					  "msg-rx-discarded",
> +					  "fr-swap";
> +			vdd-vbus-supply = <&pm7250b_vbus>;
> +		};
> +
>  		pm7250b_temp: temp-alarm@2400 {
>  			compatible = "qcom,spmi-temp-alarm";
>  			reg = <0x2400>;
> 
> -- 
> 2.44.0
> 

