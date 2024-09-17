Return-Path: <linux-arm-msm+bounces-31900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB06697AF1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 12:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BEE21F224A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 10:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA53170A0E;
	Tue, 17 Sep 2024 10:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="avABdRfp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEEE15A853;
	Tue, 17 Sep 2024 10:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726569797; cv=none; b=trOE9xQokQOgT8aZQlHQLtVHVGzlR20xMdHNIuo8uUErySuWOKwcP4l8AXi/m0qYCEhud22khGeFj3HYI1fqYofS1SB2rGjAXep2WwQFYOr9NnsddAEK2TSIdOlG46hM4Zws8+rqji7BZQsEMKucNkngNZaQue3d4kGF936T0LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726569797; c=relaxed/simple;
	bh=n81L2trzyp31tus8/KCiZJidEZh+JZJGPMDzdZ3+wFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KK5l5rVIIwnFXySN5X0YzPWo1uNgWGaRDNOySbFfnx3uZ6UEMo6sCDl79Vd+4Vj4tXOegtICcsT8qcJ46cIIamoUK17xNSGQu+2dmPrrLLjKMoNN0W6ewmtDrTy5NKyeTm4tOVUkIsd80GrfZPBTov8Zpr+TsVDarmd8Qm1V7Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=avABdRfp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB66CC4CEC5;
	Tue, 17 Sep 2024 10:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726569796;
	bh=n81L2trzyp31tus8/KCiZJidEZh+JZJGPMDzdZ3+wFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=avABdRfpLdPwQPfO4vptX5IXn8WXkMDTB4RxbFz2i2i/vlaBBNz5J9+2Bm8GkZgCX
	 tNqjfQL/eJdjd2b/uDUkUbXXgQY3icZxjV39/T/7zYvj+BC7hbmvPxBS9Nulf0ATkn
	 490HDxbdZWtcx9NJCAxi3oUiT5lIVx2E4LgwNERUiNyCMqelZYS2qR81NNXQyqEWZS
	 X17em13q2dZmrRi4REl+g+FHNBGdu3au/Ffde3NfVeC4NCxfhbP2rGJPcRkmqLJx7h
	 7YKF0z4e3ykxFhu3hd3TGVXpgvTYDXLPBq9sYCcSU7EvXONCpqademyfNBxfuzM3+e
	 i03Tb7QFptjLQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sqVgF-0000000061P-2cfg;
	Tue, 17 Sep 2024 12:43:36 +0200
Date: Tue, 17 Sep 2024 12:43:35 +0200
From: Johan Hovold <johan@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-t14s: add another trackpad
 support
Message-ID: <ZuldVzzK24JdCgQP@hovoldconsulting.com>
References: <20240917102715.4096-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917102715.4096-1-srinivas.kandagatla@linaro.org>

On Tue, Sep 17, 2024 at 06:27:15AM -0400, Srinivas Kandagatla wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Trackpad HID device on some of the T14s Product Models 21N2ZC5PUS is
> at I2C address 0x2c add this to be able to get it working on these laptops.

> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> index 941dfddd6713..8468f99d9bed 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> @@ -467,7 +467,19 @@ touchpad@15 {
>  		wakeup-source;
>  	};
>  
> -	/* TODO: second-sourced SYNA8022 or SYNA8024 touchpad @ 0x2c */
> +	/* SYNA8022 or SYNA8024 touchpad @ 0x2c */
> +	touchpad@15 {
> +		compatible = "hid-over-i2c";
> +		reg = <0x2c>;
> +
> +		hid-descr-addr = <0x20>;
> +		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-0 = <&tpad_default>;
> +		pinctrl-names = "default";

This doesn't work currently. You can't have two devices claiming the
same pins (and these HID devices may be probed in parallel even if at
most one will probe successfully). 

You can work around this by moving the pinctrl properties to the parent
bus node as we did for the X13s.

Johan

