Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC136659141
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 20:48:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231261AbiL2Tsy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 14:48:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiL2Tsx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 14:48:53 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7D6A1659A
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 11:48:50 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id c34so21326056edf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 11:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=541SBCv8SU6FPzh9UWaGvbUvGVDwpHo87zFERdHNWi0=;
        b=Rzvy+I7F75jZMdEUittNMZUI83ttB0C748UEtsIIh1KqT+IpY3yEU5fNM8GyBgKoxb
         WP2bL4k67n5d836msKdYlrc6q83/CrGAYMNKBOERpDehMbekQB+aDip7qBvd4sBCgtN2
         g3sSuVGWaZwUcLjFvIqVsPmjHTXmzfNPRGmwbs26NIQ1nKeuif8px+UTOBkZtCq8sUKo
         c29d/9j2WIBA0sRf6W0pxadb6SAqAu8iAzHvadDHRFV54eYXjwebgvPdbjliQ5DdfipW
         i/0B+uGTz50cD5txm0Y0KClWITQMXLqDfJ5jfAL2HaXVPuw/zxEMm1gT2w1e1ZEFk2rQ
         5Qew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=541SBCv8SU6FPzh9UWaGvbUvGVDwpHo87zFERdHNWi0=;
        b=MqYG1OTIzwDR9keSOl/IvHqGTgfj9ah5uNZisRqObUZKRygLrBqSR8bf0oIwFvGNAo
         4uKN6VnKRJ1q5DDhQyETsK8TPTFOpB2OMxsDIQgmr+Z8LzgnZpK6g4EP+nP8L6ohzq9j
         ozwXUHM/msspM/vJidMxaacW721ZHRAPWTl/ffy5ueElbxCmuS9PKlgsdVGyY30uzbmJ
         ETJt57ImA976/HePnUGOMJUYJgQGGgaCMvXQw42QI+6Uy69TA01FcQrrVVFzCF3XAH10
         7Sd3z9COXdLz9RKdGLe5MiVutCe11sgHY9PGPwPdEpeonYOg+t3Ol/WxX1bV9AEOp9o+
         DCGA==
X-Gm-Message-State: AFqh2kotLxezifNiYuFvlAIbJjE6OFUzsLl2vAkICPQXSiJMh0aotkpr
        b6dELq3pF1Xz12viHtrY9vQjqQ==
X-Google-Smtp-Source: AMrXdXtzMH8RQc69dHcJbPn/IEciyDfXVfpA7FY0UV5nx5VJSiLTDU10Hdm1GSWIS/rb8qewbPffkw==
X-Received: by 2002:a50:cc4c:0:b0:479:8313:2fdd with SMTP id n12-20020a50cc4c000000b0047983132fddmr26523037edi.10.1672343328647;
        Thu, 29 Dec 2022 11:48:48 -0800 (PST)
Received: from ?IPV6:2001:1c06:2302:5600:12a8:8cf4:e3f6:f90f? (2001-1c06-2302-5600-12a8-8cf4-e3f6-f90f.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:12a8:8cf4:e3f6:f90f])
        by smtp.gmail.com with ESMTPSA id m9-20020a1709062ac900b007c0d41736c0sm8838265eje.39.2022.12.29.11.48.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 11:48:48 -0800 (PST)
Message-ID: <d1cd6d30-2142-765b-c201-4d6662576665@linaro.org>
Date:   Thu, 29 Dec 2022 19:48:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: Add qcom,dp-manual-pullup
 description
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     agross@kernel.org, andersson@kernel.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20221229183410.683584-1-bryan.odonoghue@linaro.org>
 <20221229183410.683584-2-bryan.odonoghue@linaro.org>
 <Y63jBu38L/5cQ75S@gerhold.net>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <Y63jBu38L/5cQ75S@gerhold.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/12/2022 18:57, Stephan Gerhold wrote:
> AFAIK it is not possible to route VBUS directly to the controller on
> these SoCs so this property would likely be added to the SoC dtsi
> (i.e. msm8916.dtsi and msm8939.dtsi) and used by all boards.

So db410c signals the SoC via GPIO 121 / USB_HS_ID

https://fccid.io/2AFQA-DB410C/Schematics/Schematics-2816094.pdf

Which causes ULPI_MISC_A_VBUSVLDEXT to be updated depending on the state 
VBUS.

But not ULPI_MISC_A_VBUSVLDEXTSEL this is the additional register that 
downstream updates when "VBUS is not routed to the controller"

I don't have a bit-level description of these registers at the moment 
so, I'm guessing that ULPI_MISC_A_VBUSVLDEXTSEL *is* being updated.

The reason for that is if I just set ULPI_MISC_A_VBUSVLDEXT then as a 
device a host never sees my SoC via the internal USB hub.

In other words, for me at any rate I need to see both

- ULPI_MISC_A_VBUSVLDEXT
- ULPI_MISC_A_VBUSVLDEXTSEL

to get the pullup to work and hence the Hub/Host to detect the 8939.

> This means we could just bind this behavior to the existing SoC-specific
> compatible (i.e. of_device_is_compatible(..., "qcom,usb-hs-phy-msm8916"))
> and avoid having an extra property.
> 
> Thoughts?

So. I'm OOO at the moment and didn't bring my db410c but TBH to me I 
don't see why we do this whole dance with the pullup on/off with VBUS.

The right thing to do is to run an experiment statically setting

- ULPI_MISC_A_VBUSVLDEXT
- ULPI_MISC_A_VBUSVLDEXTSEL

On/off at power on/off respectively on

- db410c
- My reference where I already know it works

I'm not really seeing the utility of - partially waggling one of two 
registers with VBUS.

Why not just push the pullup on with power-on and off with power-off..

Its worth an experiement if you have the time, if not I'll check it when 
I get back home.

---
bod
