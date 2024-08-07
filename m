Return-Path: <linux-arm-msm+bounces-28088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1104194A7F5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 14:43:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B672B23416
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 12:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51C31E7A32;
	Wed,  7 Aug 2024 12:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C7VSnXZL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA811E674C
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Aug 2024 12:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723034561; cv=none; b=caSNnZBnssjn/YfPSVo00XczXhhW18p1xXl9lK68jMyIEq6+8UvUeehv24biSrsqS937ORGjPo2qdia+8VtyXsPCuPxFQIqvI6HAQA0WWB3VHalHJrFUVfnpS/IfnHSQfWl7m0ueAHHXaK0h30Vllk35A9Jw6KD8rcGPMe70naw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723034561; c=relaxed/simple;
	bh=9Y9fTcOhiBPuA873ux/LX6B5gN+erlEY8ha9Ck3axBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpL7/mZ2bL+SFpDB4grNK2WqgKd/eu1kfjp8MTYg5MqdLEchvoobQMSd87AANQ/ioCRSpyE2uAu89bIQz0647RDx9RnSH82VW7PHHC7DK1501Z6VdEySdEaZr5jXCUFEiB43vQ3Q2y7/3RqCNZLcvnuisdnt5I1TIKWMKxHs1YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C7VSnXZL; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5b7b6a30454so2533188a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Aug 2024 05:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723034557; x=1723639357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0KduDAjvBohMYXY4M8kHhofc2W7E+OIMPoPcc+Z3/tI=;
        b=C7VSnXZLbDFH5/Rg5Z2EFXsmohkNxewbw7tPJuNo51LLW5dvUZ0NyPJObFKypCKz3b
         zsnsiWfNvmDZ0KFLaXje+g81RrewzcLazHNiwYR8tMQMzEnpGRa7Q7BB2/vcz8XZemJR
         HdFkNH66FPpPgyNS5xMkW0HvpLfP4uKXzQQXqJBuc1UPMmPwvbnyDdXGlSGodM833MO4
         8TrR5ucC3CYBJfnKW/HmtvHaEXsqW1Vt682owUvGssqhRlYEmcmeeewlzmI7inKttE9i
         db9fM7PW3MKT82kUu9eWVbu7/t1ZvDH/5THZZJKpXLtgVWCMAh6a4QsbcUK/MEJRXdKb
         KIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723034557; x=1723639357;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KduDAjvBohMYXY4M8kHhofc2W7E+OIMPoPcc+Z3/tI=;
        b=dF5bx1arDO4N6E/HavL6Jfm3HsC2qXcSZJTAcIWBeD6UAr8YJ3UCYRJwAGRH43EsvS
         KNkzYyd6qK0bhnN82eFrHgGaPMdN1dO/HkoyHEW0UGh8J7xiiDa/oQ3b1CVRm5XDzhLe
         MNgVpSS6Lnkkj2bNU2rQzeeSTfRz8mCdi8N5iPntNmhV0iZHPedMlHnBH1z50xnA4y0S
         L4108efoY3xeJi+M7PFGdJzRSgHb3F0rgKuILDCzwb9VGlbNvTqykeMQjVPzmfYZM/cA
         FNv0l7Uv7r0EbzS5qPMUyDGJ3dVOeyaTLjEAB4unOz8Rzt9hyZrEcZP3rgQMg6a7C77l
         vQ9A==
X-Gm-Message-State: AOJu0Yyg+A5PQvtn8+bhpZf4lfGpwf784xCnEyBRNtmayxs2VUeAoL3U
	Z6YQvgMIFSUvCd/PcckaypJJZSh7ZcPtjavTt3RNuIL4K4dOTgd/xB24ufFz86s=
X-Google-Smtp-Source: AGHT+IEqud0+ETf/nPRDTg2cemFiL5vHCF/0w2D2H92no4nW2InXkuGAQgnIeQpmeY4yEKkzHqEbSw==
X-Received: by 2002:a17:906:7303:b0:a7a:b4bd:d0eb with SMTP id a640c23a62f3a-a7dc4e8764cmr1345394066b.24.1723034556901;
        Wed, 07 Aug 2024 05:42:36 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff1f:b280:dc22:8b8c:c079:b18e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e841a7sm641107566b.179.2024.08.07.05.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 05:42:36 -0700 (PDT)
Date: Wed, 7 Aug 2024 14:42:31 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Clark <robdclark@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] arm64: dts: qcom: x1e80100-yoga: Update panel bindings
Message-ID: <ZrNrtx1qvPYatpsw@linaro.org>
References: <20240806202218.9060-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806202218.9060-1-robdclark@gmail.com>

On Tue, Aug 06, 2024 at 01:22:17PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Use the correct panel compatible, and wire up enable-gpio.  It is wired
> up in the same way as the x1e80100-crd.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Thanks for the update!

> ---
> Corresponding schema update is in drm-misc-fixes
> 
> [1/2] dt-bindings: display: panel: samsung,atna45dc02: Document ATNA45DC02
>       commit: 1c4a057d01f4432704c4dc8842b6e888a91d95df
> 
>  .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts    | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> index 70977e9fa266..3c13331a9ef4 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> @@ -190,7 +190,6 @@ vreg_edp_3p3: regulator-edp-3p3 {
>  		pinctrl-0 = <&edp_reg_en>;
>  		pinctrl-names = "default";
>  
> -		regulator-always-on;
>  		regulator-boot-on;
>  	};
>  
> @@ -592,9 +591,13 @@ &mdss_dp3 {
>  
>  	aux-bus {
>  		panel {
> -			compatible = "edp-panel";
> +			compatible = "samsung,atna45dc02", "samsung,atna33xc20";
> +			enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
>  			power-supply = <&vreg_edp_3p3>;
>  
> +			pinctrl-0 = <&edp_bl_en>;
> +			pinctrl-names = "default";
> +
>  			port {
>  				edp_panel_in: endpoint {
>  					remote-endpoint = <&mdss_dp3_out>;
> @@ -669,6 +672,16 @@ &pcie6a_phy {
>  	status = "okay";
>  };
>  
> +&pmc8380_3_gpios {
> +	edp_bl_en: edp-bl-en-state {
> +		pins = "gpio4";
> +		function = "normal";
> +		power-source = <0>;
> +		input-disable;
> +		output-enable;
> +	};
> +};
> +
>  &qupv3_0 {
>  	status = "okay";
>  };
> -- 
> 2.45.2
> 

