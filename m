Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D01894FBBD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 14:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345465AbiDKMQD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 08:16:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345028AbiDKMQC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 08:16:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7947F40939
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 05:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649679226;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dfJKHQAC5Jvnr02zMyniqOPetfe6aLaGCnFQ9aCHPXo=;
        b=XYrp/YrcXBJG564tvXukEhxS/3lf6N1ytiYhF1MsfnwKaYlL6cM1mYTQdIrxKbJu5DGX+p
        pmEHiv1aTIq8ARTxB5sbjTogoKut+F+J/0HsZf7UVYl5p6MINEHGyE5cw96Q5SH8ME4LMM
        yr9cmZ/JOUWUj81ggTOjWzbjdX81m5I=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-N-zhxl9bMKaz-Ia8xpfNZQ-1; Mon, 11 Apr 2022 08:13:45 -0400
X-MC-Unique: N-zhxl9bMKaz-Ia8xpfNZQ-1
Received: by mail-ej1-f72.google.com with SMTP id hs13-20020a1709073e8d00b006e892eb3e79so858555ejc.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 05:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dfJKHQAC5Jvnr02zMyniqOPetfe6aLaGCnFQ9aCHPXo=;
        b=IZTtvItoY1TOSH4jRr2B0coBz3M/iBEfcZft2NZRCuLFX8QYu7MqxDqdWGaMKesN+L
         EhfHwOS/U1Lv1L4Y2GrSZ0vPtTB99rT/q3AQd+reVaptld+92y+dtX+al5hpQ9eXjG6j
         iTL0tP1zpIEO66APauKl8PZ4XRybXKYqW55LgDMvfag/jJJHbszl4108kLlOhv1J4hRB
         MT8gPJd1yGR7U2BvihJtpH6PjhZai7qkFKTl0KFYm/9D586Qg4AIkP0v6D+NhlktocKg
         6i8cSXwIoOUc7sy83b5SCNZlRhJHIs9p2cMXxSiGZcnQ2j+w76y8or+F4e15t4oQXsxR
         LinQ==
X-Gm-Message-State: AOAM532y36n9JgAOt22yv93htEXqbFqY0eP/VCkWSb/fOxRimwSKL46j
        egTwXpzddCIHUVkDb4lmrR4HNG5H+YUKieKZw1KENDq7afb+R6BhJ4rW46Q9tQm/od6M6gWehJc
        qsG67wmsF0g1M6KC0Mm4+t524Lw==
X-Received: by 2002:a17:906:1604:b0:6e8:7c02:c5a with SMTP id m4-20020a170906160400b006e87c020c5amr7412142ejd.690.1649679224268;
        Mon, 11 Apr 2022 05:13:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKGm4XGa2KIa96YZ4mvOMQ7ZLrYpFilFPuGfmwMl2L0tdNghlMPIVVb5P2HwvQuikJw3KOhw==
X-Received: by 2002:a17:906:1604:b0:6e8:7c02:c5a with SMTP id m4-20020a170906160400b006e87c020c5amr7412124ejd.690.1649679223960;
        Mon, 11 Apr 2022 05:13:43 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id t7-20020a50d907000000b0041cda2f0548sm10670845edj.10.2022.04.11.05.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 05:13:43 -0700 (PDT)
Message-ID: <d648629e-2339-449f-f63c-41af85ba35b5@redhat.com>
Date:   Mon, 11 Apr 2022 14:13:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 0/4] platform: surface: Introduce Surface XBL Driver
Content-Language: en-US
To:     Jarrett Schultz <jaschultzms@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Gross <markgross@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>,
        Jarrett Schultz <jaschultz@microsoft.com>
References: <20220405210750.619511-1-jaschultzMS@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220405210750.619511-1-jaschultzMS@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jarrett,

On 1/1/70 01:00, Jarrett Schultz wrote:
> After v4, there were some suggestions to change the driver again to use
> nvmem that would include some other changes to the sm8150 dtsi. While
> the suggestions make sense, this driver was supposed to remain simple
> for the introduction in order to get it into the tree and I think that
> it would be best to implement those and any other suggestions in a future
> patch. Hopefully this patch is now in a state where it can be accepted.
> Thanks to all who have helped and been patient along the way, this was
> my first patch :)
I appreciate your efforts to get this upstream, but this is not
how upstream development typically works. We usually iterate a patch
until all stakeholders are happy and then merge it.

So unless Rob changes its mind and gives his Reviewed-by for the
devicetree bits from this v5, then this cannot be merged as is.

Regards,

Hans



> ~ Jarrett
> 
> ---
> 
> Introduce the Surface Extensible Boot Loader driver for the Surface Duo.
> Exposes information about the driver to user space via sysfs for
> consumption in manufacturing mode.
> 
> ---
> 
> Changes in v5:
> 
>  - Minor changes to yaml
> 
> ---
> 
> Changes in v4:
> 
>  - Small binding definition changes
>  - Removed ACPI propagation from patch series since it has been
>    cherry-picked
>  - Fixed the Signed-off-by: and From: mismatch
> 
> ---
> 
> Changes in v3:
>  - For the yaml documentation:
>     * Updated description
>     * Fixed examples
>     * Updated 'required' field
>  - Further propogated ACPI dependency in Kconfigs
>  - Updated sysfs several binding descriptions
>  - Renamed files to conform to naming conventions
> 
> ---
> 
> Changes in v2:
>  - Per Maximilian, added patch 2: propagated ACPI dependency from the
>    directory as a whole to each individual driver
>  - For the yaml documentation:
>     * Removed json-schema dependence
>     * Elaborated on description of driver
>     * Updated example
>  - Changed target KernelVersion in sysfs documentation
>  - Updated MAINTAINER changes to be properly applied across patches
>  - For the driver itself,
>     * Added types.h inclusion and removed unused inclusions
>     * Minor updates to code and acronym style
>     * Remove __packed attribute on driver struct
>     * Use .dev_groups for sysfs
>  - Added more in-depth description of driver in Kconfig
>  - Modified dts to reference a newly added section in sm8150.dtsi
> 
> ---
> 
> Jarrett Schultz (4):
>   dt-bindings: platform: microsoft: Document surface xbl
>   platform: surface: Add surface xbl
>   arm64: dts: qcom: sm8150: Add imem section
>   arm64: dts: qcom: surface-duo: Add surface xbl
> 
>  .../ABI/testing/sysfs-platform-surface-xbl    |  79 ++++++++
>  .../platform/microsoft/surface-xbl.yaml       |  70 +++++++
>  MAINTAINERS                                   |   9 +
>  .../dts/qcom/sm8150-microsoft-surface-duo.dts |  10 +
>  arch/arm64/boot/dts/qcom/sm8150.dtsi          |   8 +
>  drivers/platform/surface/Kconfig              |  12 ++
>  drivers/platform/surface/Makefile             |   1 +
>  drivers/platform/surface/surface_xbl.c        | 186 ++++++++++++++++++
>  8 files changed, 375 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-platform-surface-xbl
>  create mode 100644 Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml
>  create mode 100644 drivers/platform/surface/surface_xbl.c
> 

