Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA9B072CC4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 19:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233757AbjFLRVh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 13:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232963AbjFLRVg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 13:21:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2CF7188
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 10:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686590442;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7qlKft7mE4b2kNS3x9A8djvNWYAtiYtMSSZe9V4o7Ek=;
        b=fdEYm5ePBJz8/sLLgUVBm+R801+8LnD8NjUGHFbjdaf27oyWXenG6Z3ZUtVNGn5uvySK78
        B+Osf9UhBiADVQH0iH08VioSP5Jl7ZV/lF6l1B9+FAMENolBKIZoRjRAKHGcmqluj2us/r
        IAZNz1smwBpSZ6pB4EzfEgUQEJJRgDs=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-w4ZQ4KNTOFqPFGtAeT_vgQ-1; Mon, 12 Jun 2023 13:20:41 -0400
X-MC-Unique: w4ZQ4KNTOFqPFGtAeT_vgQ-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-56938733c13so65630927b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 10:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686590440; x=1689182440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qlKft7mE4b2kNS3x9A8djvNWYAtiYtMSSZe9V4o7Ek=;
        b=lOZGQN6nSLN5TnM4Z0LAk1Y7ex5CuO+UezvfZtyTNDgj4+94UMrf5kn2/IJ/M1N2wk
         fI8P2sJX6X+mzxWkJvSnfk7GQm094Fjl8uzFmR8pf2erL7bmihuafWVIKq9OLEZ0COcA
         rO6kAaJZNfLbNohkz6CSioM+xM0Ud83uZt6EijCt/PUDAH3r+WB8XycP0FR8Eu2pUvEX
         gseXXC8/Domy5L8L9legQ0sR6ee4Lt0aSqPx4vxdNPX9r8zQXK5MAvyoYMhVZ8KJ4IXc
         oK8isOPirSQxjPSxPnANQ+3BUprgXjCwvsXSg5Wek4CIYGtlBG5sXhQGhiFfewPHIg4z
         7qfQ==
X-Gm-Message-State: AC+VfDxF5A7JvixJU4OS0PSaLa0XcaWK0oqqyJ2BF82aU44PNxCzno6l
        BMgWTjRuhiNKQczf9xfrsiB79C++sYeEfVg/av/guFdOcP8mC2KNVBRmSvAe+AliEGxfNaobLBp
        9zWq36xAzhqyRW2r0lJSOfpIL1qtA/mI3Ng==
X-Received: by 2002:a81:8047:0:b0:565:c888:1d09 with SMTP id q68-20020a818047000000b00565c8881d09mr11436058ywf.30.1686590440572;
        Mon, 12 Jun 2023 10:20:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6pK0EspHiEwXLJwZSnTgF0PmnWrSSsx5/e6T7JNdTcNpiEDXWG/J7snMtSub/jvW4XBEs/gg==
X-Received: by 2002:a81:8047:0:b0:565:c888:1d09 with SMTP id q68-20020a818047000000b00565c8881d09mr11436028ywf.30.1686590440315;
        Mon, 12 Jun 2023 10:20:40 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::45])
        by smtp.gmail.com with ESMTPSA id t7-20020a815f07000000b0054f9e7fed7asm2622065ywb.137.2023.06.12.10.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 10:20:39 -0700 (PDT)
Date:   Mon, 12 Jun 2023 12:20:36 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 01/26] phy: qualcomm: fix indentation in Makefile
Message-ID: <20230612172036.ztvjdzblh6bvmxp2@halaney-x13s>
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612092355.87937-2-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 12, 2023 at 11:23:30AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Align all entries in Makefile.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/phy/qualcomm/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
> index de3dc9ccf067..5fb33628566b 100644
> --- a/drivers/phy/qualcomm/Makefile
> +++ b/drivers/phy/qualcomm/Makefile
> @@ -20,4 +20,4 @@ obj-$(CONFIG_PHY_QCOM_USB_HSIC) 	+= phy-qcom-usb-hsic.o
>  obj-$(CONFIG_PHY_QCOM_USB_HS_28NM)	+= phy-qcom-usb-hs-28nm.o
>  obj-$(CONFIG_PHY_QCOM_USB_SS)		+= phy-qcom-usb-ss.o
>  obj-$(CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2)+= phy-qcom-snps-femto-v2.o
> -obj-$(CONFIG_PHY_QCOM_IPQ806X_USB)		+= phy-qcom-ipq806x-usb.o
> +obj-$(CONFIG_PHY_QCOM_IPQ806X_USB)	+= phy-qcom-ipq806x-usb.o
> -- 
> 2.39.2
> 

