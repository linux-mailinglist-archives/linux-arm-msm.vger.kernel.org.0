Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A8084FE935
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 22:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232251AbiDLUEw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 16:04:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232289AbiDLUEl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 16:04:41 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B73C50B0D
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 12:55:07 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-e2afb80550so9983568fac.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 12:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CGTJTpWXXHIMvgWSDZ68zYUg/fCCwEozangB97I8rD0=;
        b=Pbs7Gfj/DXMFCdbAlDjKKzrndCfmac7HbNOfrNcn53cPm5klzmZjfq/QCdP90891eU
         KUMfB5TxFVAQKx8I3tCoGofyCT/aZXolfTPr2T/gePMrziIkYcKzyqPAbZRMVlg4eBsD
         /4gF9xk4ZDvVXKY5N7RSCU8pIf3oeKZJchIykN+ewmvO/qCvZMcewqeafAaHYmtKstvB
         8vzBxcsNV73A2902ndAyZLyNnUwTab4Ytu+fLThx1mdbCskz+0Vh0B5Y3NgxlII6gQNz
         a5s8cOC421rL/Efwyv45jifJNvmnHp8If0aWFVK0WakozSNTeKV8tlV1LYjjLaUF8Y1e
         zJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CGTJTpWXXHIMvgWSDZ68zYUg/fCCwEozangB97I8rD0=;
        b=bzLu8KLe6z3H1Ayt4lQBl3mu67Wz4NeUbTGl4XvaH2rePbsOyzrd1w7JPCPmbdf58N
         ouRtD4FmXVhBrhqK4h1IkC7GKLQ7gtUX9ouTGteYKz1kKRInGe7vu/pIgcGkRBe/y8eb
         PyY5QxzKIElMeMOO9ns3BT48OMUX/pOXUl0f9j80yParvHxmDwKR8H7PUvOfiIp58/9d
         3araHWR9H450C/rN+SS0gVZABMoOaRBNJjKc/0E/1BvDPfyKOb+bNSzuEyyg6v/WT8X+
         u3kUrqWl84U91AIqzjhsIHJe+6PWNo6mbbdXVQEJIWRnIMtgm4jfjvKFT/obphTDB5C3
         zUvQ==
X-Gm-Message-State: AOAM531FX/TYWzA8c+VscBAFmDwchjlZEJukbujF2N3bJMYHO68GdTrJ
        OItsLGK9cxjpi832yjunS/bHcg==
X-Google-Smtp-Source: ABdhPJzPATJT+P2mIC6e/A+8O1ypvhGmpnslIZ91QJHY4Vb6Hg7OBEAXe0pJHo4HV4wKGTkIEoVuHA==
X-Received: by 2002:a05:6870:15cb:b0:dd:fe5b:aed5 with SMTP id k11-20020a05687015cb00b000ddfe5baed5mr2870892oad.157.1649793306773;
        Tue, 12 Apr 2022 12:55:06 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id c12-20020a9d75cc000000b005b24b061940sm13758497otl.33.2022.04.12.12.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 12:55:06 -0700 (PDT)
Date:   Tue, 12 Apr 2022 14:55:04 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan McDowell <noodles@earth.li>
Subject: Re: [PATCH v3 01/18] ARM: dts: qcom: add multiple missing pin
 definition for ipq8064
Message-ID: <YlXZGKpbYQZgGGwW@builder.lan>
References: <20220309190152.7998-1-ansuelsmth@gmail.com>
 <20220309190152.7998-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220309190152.7998-2-ansuelsmth@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 09 Mar 13:01 CST 2022, Ansuel Smith wrote:

> Add missing definition for mdio0 pins used for gpio-bitbang driver,i2c4
> pins and rgmii2 pins for ipq8064.
> 

I'm probably not looking hard enough, but I don't see where these are
used. Could they be introduced as they are being wired into their client
devices?

Thanks,
Bjorn

> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> Tested-by: Jonathan McDowell <noodles@earth.li>
> ---
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 34 +++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index 11481313bdb6..cc6ca9013ab1 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -382,6 +382,15 @@ mux {
>  				};
>  			};
>  
> +			i2c4_pins: i2c4_pinmux {
> +				mux {
> +					pins = "gpio12", "gpio13";
> +					function = "gsbi4";
> +					drive-strength = <12>;
> +					bias-disable;
> +				};
> +			};
> +
>  			spi_pins: spi_pins {
>  				mux {
>  					pins = "gpio18", "gpio19", "gpio21";
> @@ -424,6 +433,8 @@ mux {
>  
>  				pullups {
>  					pins = "gpio39";
> +					function = "nand";
> +					drive-strength = <10>;
>  					bias-pull-up;
>  				};
>  
> @@ -431,9 +442,32 @@ hold {
>  					pins = "gpio40", "gpio41", "gpio42",
>  					       "gpio43", "gpio44", "gpio45",
>  					       "gpio46", "gpio47";
> +					function = "nand";
> +					drive-strength = <10>;
>  					bias-bus-hold;
>  				};
>  			};
> +
> +			mdio0_pins: mdio0_pins {
> +				mux {
> +					pins = "gpio0", "gpio1";
> +					function = "mdio";
> +					drive-strength = <8>;
> +					bias-disable;
> +				};
> +			};
> +
> +			rgmii2_pins: rgmii2_pins {
> +				mux {
> +					pins = "gpio27", "gpio28", "gpio29",
> +					       "gpio30", "gpio31", "gpio32",
> +					       "gpio51", "gpio52", "gpio59",
> +					       "gpio60", "gpio61", "gpio62";
> +					function = "rgmii2";
> +					drive-strength = <8>;
> +					bias-disable;
> +				};
> +			};
>  		};
>  
>  		intc: interrupt-controller@2000000 {
> -- 
> 2.34.1
> 
