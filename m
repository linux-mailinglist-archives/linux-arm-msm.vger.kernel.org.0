Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC69C7731A0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Aug 2023 23:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjHGVtc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Aug 2023 17:49:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjHGVtb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Aug 2023 17:49:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CD08106
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Aug 2023 14:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691444881;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YHEXVCywwxnL3+xyJJPUcqccsbZsOMWnhPL9+GXNqy4=;
        b=ODnC5nANPNGPo44EujZM5B8W2jVYl3jMtjVxWZzjpQGGz2k1LaZTvhLM30Y5d//NX4tc4v
        dAsTCffCR84TyQBkVA81GL2H5CUPuIcnBhqGs08r/065atkDp7D/K0B7TcWXzNE9cGY2pl
        bWiype/WEbPCnqLcb3VtUkVY8WFyudE=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-jOLjCiazMPmKfUzdUeXxgw-1; Mon, 07 Aug 2023 17:47:59 -0400
X-MC-Unique: jOLjCiazMPmKfUzdUeXxgw-1
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-56c7adba6afso7832434eaf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Aug 2023 14:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691444879; x=1692049679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHEXVCywwxnL3+xyJJPUcqccsbZsOMWnhPL9+GXNqy4=;
        b=Yw8cxzC/ZCcfSEzsbWknrJv5hiCPWPm6xZL78F0fJeabDFJqI/9E81cTEC3br5Cdzj
         1b62FPxG9jezy0p2Kh8YeSzR8irhoXyQPwD4+qHDghygELvFcrS3/mtkUT/NC19NbW9b
         cDiQUyfvdcUJtwsGOz1fc24ud+BAVOqUdX6AGI7GwNNbU61IL8wBrQGijuyay8QDPpww
         +Tc/ZKGcw7TpYjtXzdHIj4Cyq04Sglvo+u9DYtDVpObx6U8qgjfjfSQBC3rry3sw/qi/
         iqh6gBqgl2onlWBHBwh+vRn4uQpHQfryymtWWXNMeugptxpuW6UIlL4YWQsgSCVL2gg+
         3MMA==
X-Gm-Message-State: AOJu0YxfAuZN0CIRGrsRA3G9YAPOHG/dvvM3PG05Iuq/9Y58OiVLO4QL
        qjh1hGFetLOf2Z5DLNXjxBiZCS977NxaHZpRg3cNUttfjqVQmoME/kugZG8iWP5/4wBTVGWk/jG
        jizuw94ZhoczAt75XOE7m3iVefA==
X-Received: by 2002:a05:6358:8820:b0:135:3e6b:8430 with SMTP id hv32-20020a056358882000b001353e6b8430mr11287224rwb.5.1691444878701;
        Mon, 07 Aug 2023 14:47:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEjnWBGNLEZDCFW3+e9y490mH2qbmOyX+eUDEAeyBj1lYQvhcrGVAH+Gk1Lc+uBPgQg5MM8g==
X-Received: by 2002:a05:6358:8820:b0:135:3e6b:8430 with SMTP id hv32-20020a056358882000b001353e6b8430mr11287200rwb.5.1691444878415;
        Mon, 07 Aug 2023 14:47:58 -0700 (PDT)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id u17-20020a05620a121100b00767fbfea21dsm2895439qkj.69.2023.08.07.14.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 14:47:57 -0700 (PDT)
Date:   Mon, 7 Aug 2023 16:47:55 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 7/9] arm64: dts: qcom: sa8775p-ride: add the second SGMII
 PHY
Message-ID: <7uf7bii3tuejqocnka4wsa5zdys5vnhjretuj66eikgo3if5tl@mga2qbyqdim7>
References: <20230807193507.6488-1-brgl@bgdev.pl>
 <20230807193507.6488-8-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230807193507.6488-8-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 07, 2023 at 09:35:05PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add a second SGMII PHY that will be used by EMAC1 on sa8775p-ride.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> index 55feaac7fa1b..5b48066f312a 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> @@ -286,6 +286,14 @@ sgmii_phy0: phy@8 {
>  			reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
>  			reset-deassert-us = <70000>;
>  		};
> +
> +		sgmii_phy1: phy@a {
> +			compatible = "ethernet-phy-id0141.0dd4";
> +			reg = <0xa>;
> +			device_type = "ethernet-phy";
> +			reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
> +			reset-deassert-us = <70000>;
> +		};

This is connected to the (another) Marvell 88EA1512. I mentioned in the
earlier patch for sgmii_phy0 that you dropped the reset-assert-us.

Unless there was a reason for that, I suspect you want to add it here
too.

Otherwise the description matches the bit of schematic I have access to.

Thanks,
Andrew

