Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59719148D03
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2020 18:32:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389574AbgAXRcM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jan 2020 12:32:12 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36271 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387661AbgAXRcM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jan 2020 12:32:12 -0500
Received: by mail-pf1-f196.google.com with SMTP id w2so1456710pfd.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2020 09:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CxnFfi1OVtcvBCqSwcv0ZRctexZ9zrixK0G0Fd+YL9M=;
        b=uAQTbihJp9Y377xep7kVEyC+tfqQ1RNOMgHCu+FmUGNTld/PKnP5PmFCvPZfXYtMb+
         ujFDt5FsY2Su1FkuDyta3kmF08yhl6zQ3U1Cenpy7YkzAKaXGmP3idWcYd4JDxr6/Gh+
         aZsV1pyVwEBaDAjUOzQSlMRawIPJEDasbggi4218ieg1f/MvrxWgGrRDnLcc1kM1Vxz+
         ma2FUf0Nn6jga+b3Jr6v8Jw0z9JLIJFCjU5dex7gP1+xG4WrEJb2K8ZkPGTKarCVKMEq
         928fsSwlHio6XGBCtu8zSV9k/W7e+lYeZKi3z0j5TrE2dE2dNYZoo6tOllJf2qbOu+Ft
         KSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CxnFfi1OVtcvBCqSwcv0ZRctexZ9zrixK0G0Fd+YL9M=;
        b=R0+qbQzKITDIHwycMmXeoKH5xft2981LS2EPap/eBxPA2LAP1/PLv9hZMQi1pKlCSl
         C1dAkclhCMoq4ReoV8HQ6oQ8Ys99RlGCI7L3yzR5nJG+rK3xXzqOh8Go+OloSKS7b6Ez
         LbrL3X+4VhnFOsqGRLyq1feQamdggrhVuqBBMXcluGN3Y84kJXYBPL5NHi1FBb/8Ahy7
         jX2AO3S8wrbE1mNr+zPtHKfToU9Z3MZC8doJIhUllZpGYVL4iFXeCneU2KvXiZFanT4M
         K8GYRI2+4UFy0lC5vzWv0gewhMyyNCSvf1lm3kiLDGSq529i4rwyD2FvuAlD+w7puFPF
         qthQ==
X-Gm-Message-State: APjAAAWyDj0ljUIKNhFTUTmBgJ5TG/xIXs2n7dUWTpdXFQKPeVbZxxvW
        KQW+QzbcVJsfKSlsQm5PX6qzAA==
X-Google-Smtp-Source: APXvYqwDf89NqtAzeKmdxMJBFd8Gev2DtVh0Oryoa24PJycUxhDvWQcSvp/ck/kZ74zux/rtOiZz+A==
X-Received: by 2002:a62:b418:: with SMTP id h24mr4455754pfn.192.1579887131841;
        Fri, 24 Jan 2020 09:32:11 -0800 (PST)
Received: from yoga (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d2sm7245833pjv.18.2020.01.24.09.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 09:32:11 -0800 (PST)
Date:   Fri, 24 Jan 2020 09:32:08 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        kalyan_t@codeaurora.org, nganji@codeaurora.org
Subject: Re: [v3] arm64: dts: sc7180: add display dt nodes
Message-ID: <20200124173208.GZ1511@yoga>
References: <1579867572-17188-1-git-send-email-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579867572-17188-1-git-send-email-harigovi@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 24 Jan 04:06 PST 2020, Harigovindan P wrote:

> Add display, DSI hardware DT nodes for sc7180.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>

Thanks for respinning this Harigovindan, just a few more small things
below.

Are the drivers ready for me to merge this?

> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
[..]
> +&pm6150l_gpio {
> +	disp_pins {

You can omit this subnode level, i.e. just put disp_pins_default
directly in &pm6150l_gpio.

> +		disp_pins_default: disp_pins_default{
> +			pins = "gpio3";
> +			function = "func1";
> +			qcom,drive-strength = <2>;
> +			power-source = <0>;
> +			bias-disable;
> +			output-low;
> +		};
> +	};
> +};
> +
>  &qspi_clk {
>  	pinconf {
>  		pins = "gpio63";
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 3bc3f64..3ebc45b 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1184,6 +1184,130 @@
>  			#power-domain-cells = <1>;
>  		};
>  
> +		mdss: display_subsystem@ae00000 {

Whenever possible, use - and not _ in node names.

Regards,
Bjorn
