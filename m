Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48CED52DF98
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 May 2022 23:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245297AbiESVxS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 17:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245288AbiESVxR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 17:53:17 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AC6E53707
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 14:53:15 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id r3so862214ljd.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 14:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=82NZuQY377Ihw3HW2I+gVmVonHsYI+8hlsd5Oyk8KqM=;
        b=Y2HM83ZwKGVd2oQPvq7hWt7bevOdzWVBmTADVZQusS/XkBl9LkgVa7Jrqd+euW+7WL
         cSTyNefh7hCVX/KmxN0F9N68IIAI+TVO+ptr9nZ9Vrp86+Ih1XP3mxxA8yhxryfFqt2N
         ikmzKnLP+ymvFeawGzPDeXXxqOSXi4YXFQFfqGK9ZFPzgVh9vhrrjw9rfTSCOhLLUV9U
         l/VXYtfTPjJDFg83oI39DUvSm0GvvyAShvxoE2AvdSqtaoavx1ZVNFy22Vq4wZrH1tSA
         xDo6Ms8TJgAURKvI9wNMVysy8kVhxVxzALwlSUdYx0WTPr9SFbU9yOPkoXSDJejoXXnr
         inNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=82NZuQY377Ihw3HW2I+gVmVonHsYI+8hlsd5Oyk8KqM=;
        b=3zNdmXfFkjBed+kuQYVtUr0MDamARcVbjagal7v/91o57SoO6Rt5jjCnF3yXSD9e8g
         49d/Np5qdJXDrXVyRwcoRh5ioOoQ1OFrWUzEt9tSlQN9cmek1oDwHxlFJ+D8bWcHz8kr
         /SzwnFyN5SeJD8NCIQVurlBwuMkTxrp7qTEwpod4OMVnWNNaPIOkh8cecl0ekP1r+dGY
         oJyabwUNG/NGUypdjIf7KbKaIyi3ACEhcJT0URyfI41dXtpS95qRjM0AE5rYda1jmrzC
         5Zy2gPWriYBEGfj3XibUniJt84SpFVFz85/oC3+xDVSCuC0LmkMGgDRC067pOEPQ42KP
         fhZA==
X-Gm-Message-State: AOAM531GhX1j/njaqG+36slg9DSDhf1ypIt7ZnRrTG4GrtB8PxAORRIu
        U61bWBx9asngg8hY0JE91IfT5Q==
X-Google-Smtp-Source: ABdhPJwIid+306dVJaEE+OZZU1A40yZDIWW8vC5Q5e+PfDdit1T3JGqCz84V3v58s4LvLXgVpYzocA==
X-Received: by 2002:a2e:a90c:0:b0:253:cdf8:3682 with SMTP id j12-20020a2ea90c000000b00253cdf83682mr3834925ljq.236.1652997193833;
        Thu, 19 May 2022 14:53:13 -0700 (PDT)
Received: from [192.168.1.102] (mobile-access-b04822-211.dhcp.inet.fi. [176.72.34.211])
        by smtp.gmail.com with ESMTPSA id t8-20020a2e7808000000b00253d77ad51asm58796ljc.10.2022.05.19.14.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 14:53:13 -0700 (PDT)
Message-ID: <06baf3b7-6b2d-4cc6-64d7-7bd1b3a18335@linaro.org>
Date:   Fri, 20 May 2022 00:53:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 0/2] media: dt-bindings: media: sm8250-camss: Add
 power-domain-names property
Content-Language: en-US
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220518121104.951621-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220518121104.951621-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/18/22 15:11, Vladimir Zapolskiy wrote:
> QCOM SM8250 camera subsystem depends on three power domains, at the moment
> all of them are not differentiated one from another, however the power
> domains compose a hierarchical structure with vfe0 and vfe1 as subdomains
> of titan_top, also managing vfe0 and vfe1 separately allows to get more
> fine-grained power control in runtime.
> 
> The change relates to my review comment for v2 of CAMSS on SM8250 submission:
> 
>     https://lore.kernel.org/all/13ad033e-cd5d-3a8c-b036-50a3ac4245c0@linaro.org/
> 
> Apparently it becomes important to manage CAMSS power domains much better for
> newer platforms, this referes to platforms with Titan GDSC, for instance CAMSS
> on SM8450 has 6 power domains, and dealing with them in bulk is not an option.
> 
> There was a note in commit 2f6f8af67203 ("media: camss: Refactor VFE power
> domain toggling") about problems with power VFE domains on/off, but perhaps
> it's related to the fact that Titan GDSC is a special power domain and VFE
> are subdomains, the latter shall not be enabled earlier than the Titan, but
> the driver did not construct a proper hierarchy and leaves a room for races.
> 
> The change should have no implications on any SM8250 CAMSS users, since
> none of the supported in upstream boards enables the camss device tree node.
> The correspondent changes in the driver will follow this dt specific series.
> 
> Most likely a similar change is required for SDM845 platform, but it would
> need additional investigation and testing.
> 
> Vladimir Zapolskiy (2):
>    media: dt-bindings: media: sm8250-camss: Add power-domain-names property
>    arm64: dts: qcom: sm8250: camss: Add power-domain-names property
> 
>   .../devicetree/bindings/media/qcom,sm8250-camss.yaml       | 7 +++++++
>   arch/arm64/boot/dts/qcom/sm8250.dtsi                       | 1 +
>   2 files changed, 8 insertions(+)
> 

These changes will be unneeded, if it is reliable to state that the order
of 'power-domains' array values is fixed.

 From Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml

   power-domains:
     items:
       - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
       - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
       - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.

Apparently it's insufficient to ensure the fixed order of the power domains
by running a check against the schema, and likely it can not be improved,
but please correct me here, if I'm wrong.

That's said, what is the preferred way here? Leave everything as is and rely
on the order of item descriptions, or add a new power-domain-names property?

--
Best wishes,
Vladimir
