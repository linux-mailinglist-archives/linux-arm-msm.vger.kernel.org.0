Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4114C6591F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 22:05:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234116AbiL2VFb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 16:05:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbiL2VFa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 16:05:30 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB0F415F28
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 13:05:26 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id bj12so47466156ejb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 13:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kRNvQQbqnc8KpHoJTZ87k7EPwQ8SCvjzbGkb6QD2t84=;
        b=AtpuXY4pnZ/cz0rHmEe4NJ0VRgHooaz5lYW1clJ77Gyl3wlv3NASy2lWHNOPISj2z+
         WDrqh4h+g8dTh1z6ToLGHIa5cJoa1vRQSQDNEXT0kJxDe2fXAsSljWj8qf1JIYnlTOgY
         wyEBb0iT2cgDgv765MdZqONc3N9dGJQG9gu6Bp8TyByDdvbEbQn86XGYvtncC+xuSH6W
         VjRhnfDE7W/XV/tVI4WUWXSDhPXtGX/YaOdVJJVgVskefjWdaXfiHD3DHNhYC7cpssya
         gdjsZEu3BV8p7qS/e/an47bB6hPrja7v+ZvZ7rEhoPNMTOHXwzV5pZ/x88AUZtOGeLp/
         hviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kRNvQQbqnc8KpHoJTZ87k7EPwQ8SCvjzbGkb6QD2t84=;
        b=io50sAnBcXOBk8sLJWXT5P93L3fkxcVNdKx69VDIswqOPe31MTmIGYVG1M/ZI72z0a
         VfBfkmBeAwwdy58fqLb4N0nLqa+asnQmXl5oeSawwsZXokKOPIWrYsh8SFIMCAupKIsA
         8czZT0OR1Nh0DZXXNFlcCinajn4D42XFgsmY2koctWEzbGABMLx7xU0iVBFpgY/Hyyql
         7H70v70P8kp/uWVHYLoMCSEWnu2tS1nn16mmOR+cKgusnOn4UFgs+3ItzjSf2+iqdIvW
         YXUJl2SB2MLOEkmLmcgSQ008sEXpUDgv1xWJZBDBmPRYRxizxu5IGVdEn6itOTWAAVss
         /beg==
X-Gm-Message-State: AFqh2kqs0gBEcM9mFVgCPUgngAYn3x3AhZwRZ4jWICcBy2+ShZiBml43
        DsYwYfj+rqj9ou7q45ji85bZTQ==
X-Google-Smtp-Source: AMrXdXsaE45OPfrv95sRhArvsNcedxszCSPth5aVOjsY5weGoCmGV3Nl27JhjKLR4xx64Mf9m6NppA==
X-Received: by 2002:a17:906:5786:b0:78d:f455:3105 with SMTP id k6-20020a170906578600b0078df4553105mr24292744ejq.45.1672347925471;
        Thu, 29 Dec 2022 13:05:25 -0800 (PST)
Received: from ?IPV6:2001:1c06:2302:5600:12a8:8cf4:e3f6:f90f? (2001-1c06-2302-5600-12a8-8cf4-e3f6-f90f.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:12a8:8cf4:e3f6:f90f])
        by smtp.gmail.com with ESMTPSA id gf26-20020a170906e21a00b007c0b9500129sm8905790ejb.68.2022.12.29.13.05.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 13:05:25 -0800 (PST)
Message-ID: <6061938c-b830-2fe0-2f4d-368e34c33676@linaro.org>
Date:   Thu, 29 Dec 2022 21:05:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/2] phy: qcom-usb-hs: Add qcom,dp-manual-pullup logic
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     agross@kernel.org, andersson@kernel.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20221229183410.683584-1-bryan.odonoghue@linaro.org>
 <20221229183410.683584-3-bryan.odonoghue@linaro.org>
 <Y63uSgMdP4m6nvhL@gerhold.net> <Y64AfHcUw192Pyr6@gerhold.net>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <Y64AfHcUw192Pyr6@gerhold.net>
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

On 29/12/2022 21:02, Stephan Gerhold wrote:
> On Thu, Dec 29, 2022 at 08:45:15PM +0100, Stephan Gerhold wrote:
>> On Thu, Dec 29, 2022 at 06:34:10PM +0000, Bryan O'Donoghue wrote:
>>> Downstream has a flag called qcom,dp-manual-pullup which informs the
>>> downstream driver if it should toggle ULPI_MISC_A_VBUSVLDEXTSEL and
>>> ULPI_MISC_A_VBUSVLDEXT.
>>>
>>> Downstream states:
>>>
>>> "qcom,dp-manual-pullup: If present, vbus is not routed to USB
>>>          controller/phy and controller driver therefore enables pull-up
>>>          explicitly before starting controller using usbcmd run/stop bit."
>>>
>>> Working with a system that has both an external Type-C port controller and
>>> an internal USB Hub results in a situation where VBUS is not connected to
>>> the SoC.
>>>
>>> In this case we still need to set the DP pullup.
>>>
>>> This patch enables and disables the DP pullup on PHY power_on and power_off
>>> respectively if the DT has declared the bool "qcom,enable-vbus-pullup"
>>> effectively replicating the downstream logic to the same effect.
>>>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> [...]
>>
>> An alternative that I've occasionally used for early bring-up is to
>> simply use a dummy extcon driver [1] that permanently reports active
>> VBUS. The end result is the same. While it's clearly a hack perhaps this
>> makes it a bit more clear that ideally you really should try to assign
>> an extcon device, to avoid keeping the USB controller and PHY on
>> permanently.
>>
> 
> BTW another nice trick that should work in all almost all cases is to
> use the state of the PMIC USB_IN pin as VBUS detection. All battery-
> powered devices I have seen route the USB VBUS to PM8916 USB_IN. And
> even many boards like DB410c seem to do that or at least permanently
> supply 5V there. In all these cases the &pm8916_usbin extcon will
> report a VBUS state that should make USB work.
> 
> Have you tried using that on your MSM8939 board with the Type-C setup?
> 
> &pm8916_usbin {
> 	status = "okay";
> };
> 
> &usb {
> 	status = "okay";
> 	usb-role-switch;
> 	extcon = <&pm8916_usbin>;
> };
> 
> &usb_hs_phy {
> 	extcon = <&pm8916_usbin>;
> };
> 
> Stephan

I checked USBIN before my last email reply.

Its possible its connected but its not there on the 8939 schematic I have.

---
bod
