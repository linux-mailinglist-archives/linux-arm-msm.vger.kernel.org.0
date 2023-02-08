Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE21568F69B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 19:10:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbjBHSKD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 13:10:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231897AbjBHSJv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 13:09:51 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 230FC1024A
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 10:09:49 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id r6so7275582ioj.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 10:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wcOk9A3uTdyHp1L6rc14oZDeRDwX27bnymxLOXmwfSY=;
        b=heYrv9H5hssWCGaJvgEmDDln0GaFtcLuterSOqkQFZCBjpBeXEQy3YIfyhvqi949+l
         /jDbqwZeEAyoDXSXyeesTBP9R+abUss0E+KHd4q+BNeSv2dGosLNE+h2C1LSwb1eMK0E
         sjJ9WBwbtm06KhKSHFoSFcT6EN2JzDBSacYew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcOk9A3uTdyHp1L6rc14oZDeRDwX27bnymxLOXmwfSY=;
        b=rDyrQvme5UBup1PrxiJJoOemmQvL9yviyv5rGNcAxR/scIOsIBdcFafI0USm5oSQP6
         /m7FPfH0wmHv0uHI3/zzsufIcilR2+BNJFV0tQtOJnn/DUWGIIOtLf6U39H9XoKg61IB
         Ds87vWGhMoCCCaJ5MiDwHSPya/n28jW/1l1eq+1EqwVehYye2KKPAyIKs7bJrcaIjaGd
         fOsSWeSNxZm+WqnVfeRVXeOu2NI7nHESoBDvrPSu5tTftypmbwdbKg/ViOED8tFKFGRD
         yT9kO5h+BYveNaw/h/gdHkp0jkAcAcpA/6VFTCGoBOuXOse/c9luL76f8uGNj356JFUk
         NrzQ==
X-Gm-Message-State: AO0yUKV+VKwoUYEHowXB5wmkOweTDcNK1hjaIfjIZF+NiUVOTXnYkvFK
        H2Ioecg4uvgnpXVfF9D0DQB3yg==
X-Google-Smtp-Source: AK7set+pT9VTS51XdyHe4VGCcxeCwRNUF9W9NQ4gfUa57VRxzTTW0du58Vpq72oXlyG8Z1CUN3qNwA==
X-Received: by 2002:a5e:a605:0:b0:71b:cc7b:db4f with SMTP id q5-20020a5ea605000000b0071bcc7bdb4fmr5887098ioi.12.1675879789035;
        Wed, 08 Feb 2023 10:09:49 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id e4-20020a6b5004000000b006884b050a0asm4750223iob.18.2023.02.08.10.09.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 10:09:48 -0800 (PST)
Date:   Wed, 8 Feb 2023 18:09:48 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Power herobrine's 3.3 eDP/TS
 rail more properly
Message-ID: <Y+PlbAVDLoSUKJ7U@google.com>
References: <20230207163550.1.I5ff72b7746d5fca8f10ea61351bde4150ed1a7f8@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230207163550.1.I5ff72b7746d5fca8f10ea61351bde4150ed1a7f8@changeid>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 07, 2023 at 04:36:10PM -0800, Douglas Anderson wrote:
> This is the equivalent of commit f5b4811e8758 ("arm64: dts: qcom:
> sc7180: Add trogdor eDP/touchscreen regulator off-on-time") and commit
> 23ff866987de ("arm64: dts: qcom: sc7180: Start the trogdor
> eDP/touchscreen regulator on"), but for herobrine instead of trogdor.
> 
> The motivations for herobrine are the same as for trogdor.
> 
> NOTES:
> * Currently for herobrine all boards are eDP, not MIPI. If/when we
>   have herobrine derivatives that are MIPI they we can evaluate
>   whether the same off-on-delay makes sense for them. For trogdor we
>   didn't add the delay to MIPI panels because the problem was found
>   late and nobody had complained about it. For herobrine defaulting to
>   assuming the same 500ms makes sense and if we find we need to
>   optimize later we can.
> * Currently there are no oddball herobrine boards like homestar where
>   the panel really likes to be power cycled. If we have an oddball
>   board it will need to split the eDP and touchscreen rail anyway
>   (like homestar did) and we'll have to delete the "regulator-boot-on"
>   from that board.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This patch should be applied atop my recent series adjusting the
> herobrine touchscreen rails [1]. If I need to send a v2 of that series
> I will add this at the end of it as patch #8.
> 
> [1] https://lore.kernel.org/all/20230207024816.525938-1-dianders@chromium.org/
> 
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> index ded36b5d28c7..312cc0e1cbc7 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> @@ -110,6 +110,22 @@ pp3300_left_in_mlb: pp3300-left-in-mlb-regulator {
>  
>  		regulator-enable-ramp-delay = <3000>;
>  
> +		/*
> +		 * eDP panel specs nearly always have a spec that says you

uber-nit: you could replace the second 'spec' with 'requirement' to avoid
the repetition.

> +		 * shouldn't turn them off an on again without waiting 500ms.
> +		 * Add this as a board constraint since this rail is shared
> +		 * between the panel and touchscreen.
> +		 */
> +		off-on-delay-us = <500000>;
> +
> +		/*
> +		 * Stat the regulator on. This has the advantage of starting

s/Stat/Start/ ?

> +		 * the slow process of powering the panel on as soon as we
> +		 * probe the regulator. It also avoids tripping the
> +		 * off-on-delay immediately on every bootup.
> +		 */
> +		regulator-boot-on;
> +
>  		vin-supply = <&pp3300_z1>;
>  	};

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
