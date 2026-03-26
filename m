Return-Path: <linux-arm-msm+bounces-100124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLS8OHNWxWkk9gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 16:53:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0442F337E79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 16:53:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 43E63313F1EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 15:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFCEA3FBED0;
	Thu, 26 Mar 2026 15:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cil34ZzA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC0537F8BA;
	Thu, 26 Mar 2026 15:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774538757; cv=none; b=YQjmh3/UR3rOEy11ADlryCd/8nvGdSjz7cZASMWGS6DklVaVvZzKyeusxd51t6MV+ib3GzHH/Q4iJDdMCcoR1M13qiqQSW8EXZcbl9nev25p9QYpZ2cNX9i8jbi72ILs0DZdKNEJwovJjqKmtvd2+T+exkPqZhVV1nq/6sLLAhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774538757; c=relaxed/simple;
	bh=qk/rcRQ3hjSJAYtvCxohTRw/Hyc74Sdqg0FjnvL1Grs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RY9LnYkLTuOXspShiqY/dlgPcx50Po/su89Rl1AzByNsKHqUYDT/ikHKiI72LO+Yxg1YWLaUm1gXsaA7u7RJ4Ebz2QBOtr35DclaxMUWstjf4oVZ3gU79uJ8e2JB4dL9c6C2tiWbPD5iC5SzfnbcK44GRvKw6fOw8/MT3zX/5Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cil34ZzA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954E2C2BCB1;
	Thu, 26 Mar 2026 15:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774538757;
	bh=qk/rcRQ3hjSJAYtvCxohTRw/Hyc74Sdqg0FjnvL1Grs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cil34ZzA9c0vm5+RaNiqZV5rrSey2kC30oN8kmO4QDIDwUzmmjT5dSdRri7WXcuHv
	 QrYSqW+D3ZUaJOfH5j7nKOGUEJxB091+avUpnrCW77ylEqkdYQPVGcyHhBovk5Uh8b
	 cIRyVhA01Pwmu00v6nNkRRYe/u+CMkI0PSu7mY7ceSE3RD/6cyhc8V8ibAjAg3tnom
	 hQoSIHJztEtln3S6/Fpqj1VfnltQSPHI9e5Smsgvl+5mxsaVdDKrbrIposUq0kr6ic
	 uHe8FFsl77wLtQkYgCOh4RNHDnPoZgr+mdYQAwYoAx82R9dbzXvgkUeSM+sWgjxam5
	 xBJSsP7UuxW1g==
Date: Thu, 26 Mar 2026 10:25:53 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Le Qi <le.qi@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa-evk: Add DP0/DP1 audio
 playback support
Message-ID: <acVPsjFuFITlsihL@baldur>
References: <20260210024037.3719191-1-le.qi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210024037.3719191-1-le.qi@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100124-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 0442F337E79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Feb 10, 2026 at 10:40:37AM +0800, Le Qi wrote:
> The hamoa-evk DTS currently lacks DAI links for DP0 and DP1, preventing
> the sound card from exposing these playback paths. Add the missing links
> to enable audio output on both DP interfaces.
> 
> ---
> Changelog:
> 
> v2:
>   - Changed commit message to explain motivation
>   - Removed redundant sound-name-prefix properties for DP0/DP1, since these
>     are already defined in the SoC DTSI.
>   - v1-link: https://lore.kernel.org/all/20260209091139.622756-1-le.qi@oss.qualcomm.com/
> 
> Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>

This should be here, now I had to rebase my whole tree to fix the
missing s-o-b. Please use b4 to avoid such mistakes.

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> index 2390648a248f..4428c8f45493 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> @@ -616,6 +616,38 @@ platform {
>  				sound-dai = <&q6apm>;
>  			};
>  		};
> +
> +		dp0-dai-link {
> +			link-name = "DP0 Playback";
> +
> +			codec {
> +				sound-dai = <&mdss_dp0>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +
> +		dp1-dai-link {
> +			link-name = "DP1 Playback";
> +
> +			codec {
> +				sound-dai = <&mdss_dp1>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_1>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
>  	};
>  
>  	usb-1-ss0-sbu-mux {
> -- 
> 2.34.1
> 

