Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0A6031007E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 00:09:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbhBDXIJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 18:08:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbhBDXII (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 18:08:08 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABC63C0613D6
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Feb 2021 15:07:28 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id h6so5559208oie.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Feb 2021 15:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oBEcaWbSLzpX/rEXXWJP6zOnGV4CTAni8qoOWeGtT64=;
        b=ZkgpZAtAXYk6ktEqi/8ODD04OZgThAIcDKHAeIemBN5VGDNx/G2cziSU8LbCzp30Aa
         hutgfTW8/VCYM9d9IrktanE92OO5Ky5cNQulPtUOdKvLwGCLQSY2ZtzTBQgdtRRNqLXs
         ZTZyALQ6DXhmaR4JO04kQtPqVkmab/dqbWbLeIZRiS7cCsEi/ls6vg51SF6Y9muBN6Uv
         JMb4LvNVEc0ON0CwD3/Kk7oYGUN8NsZGMa2c8pql8YrSIc61twj8Sfpj9Nhk8G3rL7/4
         02PF2QY4F+BpzaKAHUvoTqWce0oKenc8/Fr8U6O5mec9P8hxeLko8l2vG29gwnWKTrWL
         foMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oBEcaWbSLzpX/rEXXWJP6zOnGV4CTAni8qoOWeGtT64=;
        b=kEhEDSpqo0FnpmJFrzUzmXLIWzG3oS2YMl6izChdNSpTfqN849aU9x4MQIIsCvr9l5
         S2L6rH6rFlJR2vGP8VRgqYoXw+SQZcfkv50ifJ+ZrLIlP7KvVrAOQL2oO1WvQBgns6V3
         uc8IXIEmhTP58aFfkrIRuT7pceTlJCTs5QfFyXwU+pGRo0SZCnHceKe6ahDI6iuE0uOe
         EEaGZ53pQ/Se+4HkgtVHXJW4pAL6Ub78DSzsFCMTuZGSWb6sGJe1pOuaA1PMxkZkE+wY
         EmmTqXdf5vNbBQmhn+u+bf7sMFKlZrx6l/W+0deEtXRPJa4bWxHWfvXHZUMXzcKgUzgx
         y/BA==
X-Gm-Message-State: AOAM5309A4P2FHR8D4F71yoJaEYdmwxliEY+fLMMSZ5JP1hP1g2ZFU7O
        JJ5e+vhv0wDWTz0lCHV43H8nEQ==
X-Google-Smtp-Source: ABdhPJwRZu69eFbw8LY7RFbBsQrPKbb/Z5BE4KBeaTCDwCXMydra8mVqDwHGk8yvQyDdU51oVgwYLg==
X-Received: by 2002:a05:6808:1315:: with SMTP id y21mr1279861oiv.112.1612480047978;
        Thu, 04 Feb 2021 15:07:27 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c18sm1400201oov.20.2021.02.04.15.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 15:07:27 -0800 (PST)
Date:   Thu, 4 Feb 2021 17:07:25 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8250: add pinctrl for SPI using
 GPIO as a CS
Message-ID: <YBx+LcgrbyUKpYig@builder.lan>
References: <20210204204904.294555-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210204204904.294555-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 04 Feb 14:49 CST 2021, Dmitry Baryshkov wrote:

> GENI SPI controller shows several issues if it manages the CS on its own
> (see 37dd4b777942 ("arm64: dts: qcom: sc7180: Provide pinconf for SPI to
> use GPIO for CS")) for the details. Provide pinctrl entries for SPI
> controllers using the same CS pin but in GPIO mode.
> 

Doug, can you confirm that this is the final (or at least current)
verdict?

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 380 +++++++++++++++++++++++++++
>  1 file changed, 380 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 3cea28058a91..03015174ec06 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3046,6 +3046,25 @@ config {
>  				};
>  			};
>  
> +			qup_spi0_cs_gpio: qup-spi0-cs-gpio {

There might be others who need the same states, but I would prefer if we
move this to the device's dts.

> +				mux {

Rather than splitting the properties in {mux, cs, config} I think it
makes more sense to split them in {spi, cs} or something like that.

Regards,
Bjorn
