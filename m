Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF46632CF5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Nov 2022 20:26:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231487AbiKUT0B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Nov 2022 14:26:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231463AbiKUT0A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Nov 2022 14:26:00 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BED38E2A9
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 11:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669058699;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eoLZmv4iwg/w4gE4QH+SCVnULAbBmRBckpkebszPHC0=;
        b=dERSuzHHbziKFzaK/KbeF63yVaxK9CqgaheEBXF+hF+FkmyJoisWdFKWVees03RmPxWfWt
        V5mfPxF/1v8QvqgOmBuHW8gY86kybaD1Aju501NNsknuYNEfyczQbNAvcWKbIdy6hD4IC7
        2WOxSpTZLOi5CGQacZKSoFAxW4eIQyo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-20-Hq53scAgNDmeC8p6ahJmdg-1; Mon, 21 Nov 2022 14:24:58 -0500
X-MC-Unique: Hq53scAgNDmeC8p6ahJmdg-1
Received: by mail-ed1-f69.google.com with SMTP id t4-20020a056402524400b004620845ba7bso7363663edd.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 11:24:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eoLZmv4iwg/w4gE4QH+SCVnULAbBmRBckpkebszPHC0=;
        b=pbY2l5L/GerNVORTJbsqDcCh+psuZHukw4gBHS0JdD6AMsQCJ9djhHGyMcCKNX7ufB
         o90dafRciJl4vbNYxgiW9Z/WfItMHtZMl9DHRdqIX43eMaEL0YZ8ijx49uabegJR7u5H
         Fp5DzIMV1LYkkBRUAIhLqsKixnrMWsVGr3UVunkt7OPky3d3mK1wl652VY9p5dCY+NZ1
         koVYUWELLcyuISYYA2Na0iM4HwJF0Ia9xWBujVUOpnGjbt9cJ97sxyQYooeqqHf6pn36
         GmUsKo9RXJA45mEhtTy0wQJB3F9Jvx4WLNVd9JrIXrmPic+KoeLKxaeOHiljJdOET6TS
         fVMw==
X-Gm-Message-State: ANoB5pkhPBKrLvioRuTi4Iw5/hreJVg2VpFsvvpo9TGZysB+gRKlY6mm
        0LlgLOoAUuJ5AAyaQjzL0966VjrfN2x6c0GofR4PbX5y8rUV3QzGKK49qGjcsHJ7JuSVMSF4I67
        zqy/LDKLh5E7SQalPCM8j8wvAQA==
X-Received: by 2002:aa7:c6da:0:b0:469:172:1f38 with SMTP id b26-20020aa7c6da000000b0046901721f38mr15457203eds.195.1669058697327;
        Mon, 21 Nov 2022 11:24:57 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4mcm+9l0MN74vmnCzLHArZvfNvXRoa2WAFysBeHkAtV8iX0vlC/zf5jCAN0bfmt/Xb/ffkbA==
X-Received: by 2002:aa7:c6da:0:b0:469:172:1f38 with SMTP id b26-20020aa7c6da000000b0046901721f38mr15457186eds.195.1669058697111;
        Mon, 21 Nov 2022 11:24:57 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ez1-20020a056402450100b004617e880f52sm5437350edb.29.2022.11.21.11.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 11:24:56 -0800 (PST)
Message-ID: <89e0955c-2878-6e3f-a947-e208340a9db3@redhat.com>
Date:   Mon, 21 Nov 2022 20:24:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH 1/7] Input: goodix - fix reset polarity
To:     Quentin Schulz <quentin.schulz@theobroma-systems.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Quentin Schulz <foss+kernel@0leil.net>, hadess@hadess.net,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        heiko@sntech.de, linux-input@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        arm-mail-list <linux-arm-kernel@lists.infradead.org>,
        linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
References: <20221103-upstream-goodix-reset-v1-0-87b49ae589f1@theobroma-systems.com>
 <20221103-upstream-goodix-reset-v1-1-87b49ae589f1@theobroma-systems.com>
 <1fa371bd-78a6-bb7c-4692-1d8132ec2ab1@redhat.com>
 <Y2P7SsPa04975Rkm@google.com>
 <692fd16e-4183-d58d-802e-2b83563aee4b@redhat.com>
 <267de96a-0129-a97d-9bf6-e1001b422a1a@theobroma-systems.com>
 <16c7f876-102c-60e1-4a81-3378b6c726fb@redhat.com>
 <554ebf0a-2304-6fd0-555a-0ce1b4615bf0@theobroma-systems.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <554ebf0a-2304-6fd0-555a-0ce1b4615bf0@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 11/21/22 16:06, Quentin Schulz wrote:
> Hi Hans,
> 
> Sorry for the delay.
> 
> On 11/3/22 20:28, Hans de Goede wrote:
> [...]
>> Ok, so I've been taking a look at how we can invert the 'x' passed
>> to the gpiod_direction_output(ts->gpiod_rst, x) calls and not break
>> things with ACPI.
>>
>> The rst pin is looked up through a acpi_gpio_mapping which
>> contains acpi_gpio_params as one of the per pin parameters
>> and that does have an active_low flag.
>>
> 
> I just read the kernel docs about GPIO and ACPI and I'm not entirely sure this is always 100% safe to do:
> 
> https://docs.kernel.org/firmware-guide/acpi/gpio-properties.html
> 
> Specifically:
> """
> The GpioIo() resource unfortunately doesn't explicitly provide an initial state of the output pin which driver should use during its initialization.
> 
> Linux tries to use common sense here and derives the state from the bias and polarity settings. The table below shows the expectations:
> 
> =========  =============  ==============
> Pull Bias     Polarity     Requested...
> =========  =============  ==============
> Implicit     x            AS IS (assumed firmware configured for us)
> Explicit     x (no _DSD)  as Pull Bias (Up == High, Down == Low),
>                           assuming non-active (Polarity = !Pull Bias)
> Down         Low          as low, assuming active
> Down         High         as low, assuming non-active
> Up           Low          as high, assuming non-active
> Up           High         as high, assuming active
> =========  =============  ==============
> """
> 
> But since we actually override this during our devm_gpiod_get_optional by passing forcing the flag to be either GPIOD_IN or GPIOD_ASIS, we should be good for this driver IIUC?

Not entirely I just checked and for some reason the ACPI GPIO
lookup code will override the gpiod_flags passed to gpiod_get()
if it can determine a set of flags from the ACPI GpioIo entry.

For output pins like the reset pin, this requores a pull bias
to be set, which often is not the case, so then the GPIOD_ASIS
which we pass in is used.

But if a pull bias is specified in the ACPI GpioIo entry for
the reset pin then thats get translated to GPIOD_OUT_LOW or
GPIOD_OUT_HIGH and setting acpi_gpio_params.active_low as
your patch do will flip those.

So this may cause unintended side-effects.

This is something which we can fix though, we can force
the ACPI GPIO code to honor the GPIOD_ASIS we pass in
by changing:

static const struct acpi_gpio_params first_gpio = { 0, 0, false };
static const struct acpi_gpio_params second_gpio = { 1, 0, false };

to:

static const struct acpi_gpio_params first_gpio = { 0, 0, false, ACPI_GPIO_QUIRK_NO_IO_RESTRICTION };
static const struct acpi_gpio_params second_gpio = { 1, 0, false, ACPI_GPIO_QUIRK_NO_IO_RESTRICTION };

Which will make gpiod_get honor the GPIOD_ASIS for the reset pin
and the GPIOD_IN for the IRQ pin.

It would be good to do this as a preparation patch, because
this will be good to have regardless of the rest of your series
because the gpiolib-acpi behavior without the
ACPI_GPIO_QUIRK_NO_IO_RESTRICTION flag may already cause the
reset GPIO to get its value changed at probe time which we
do not want to happen in the Goodix driver.

If you can send me such a preparation patch + a new 1/7
on top, then I can give this a test on a x86/ACPI device
with a goodix touchscreen.

(Maybe send them offlist if you don't want to send out another
version this quickly.

Regards,

Hans


