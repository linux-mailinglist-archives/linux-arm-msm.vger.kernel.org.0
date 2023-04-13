Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE0CC6E109F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Apr 2023 17:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbjDMPI3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Apr 2023 11:08:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231566AbjDMPIX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Apr 2023 11:08:23 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15E309013
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 08:08:22 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id d8-20020a05600c3ac800b003ee6e324b19so8306121wms.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 08:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681398500; x=1683990500;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CaM1xv1sbsLoMmb0QrXZ5giP1mKrj2pKvc6u8KC7eYE=;
        b=F4uupchmIw/pNZ+ZvAwfb0yMJCYlTh8icWr24Oqfk4zLhlCc5v4adBdD5FZrtJjUBG
         AZAvz/4oGy6HmDZy21gdqAfxUueHteBAUMhwmotfQusPD4M5koCWlrmZCuauhV4nLkel
         1kI17qL1LtOqDzSMz8fc1Q6uOXOA+qBtXcwSBKLTvyuymcwJlc/sFAzECzRRRKNO1ZOw
         MvamnXKFk93VUXbnJtw82VHgJSz7l5twCqSScbX9OtWnXNabdzvxaA19BE2LKTXHBZWY
         sCHDzrvdPug1h93B0TNtaBrxdFVy4dgnSkydLEbuvn8ihNhTctVUZtopAd4pXO1r+EqX
         nT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681398500; x=1683990500;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CaM1xv1sbsLoMmb0QrXZ5giP1mKrj2pKvc6u8KC7eYE=;
        b=bhfYhjzCGOAnvghuIs78UGMsDPTx0eUBuxm4VEg6oNMzaMWOaZBqJtAbwB39c4xdyD
         QpST/SYheIocBcGrJ4e8hm1WBFcxpgpnBaXqv8tPL/2sWBbL99CMaeVU8HpRPNUJcuaV
         I5dh4OaJAf1M13YU//99CGFT3LBrb+q5gCf75LHqvZoDFW4ACijXaL7p+mvPy5DmRXTL
         PN3uR/E9s+qnmrT4kITRBf3D+FGYilh5KmCz2bm+ey4iKPqKxGS/5OAZdnyn7pkna1Ex
         L8MX75PkIB8O/NwLC/aH8NeyFyHs4rnJflUo2hxSa3EpSzK2pWcqrBYyl7mHbbnh2HjB
         /X7g==
X-Gm-Message-State: AAQBX9cEJkQ58iitPizh80sbwZNXnOPO4D0uef+urxSY5xx40fWSIpsc
        /i9RvuklFKhz4FWeSmWRcNC7zA==
X-Google-Smtp-Source: AKy350Z185epe1A8h0U7HzfDUEBvHlwfIGHruMEXwjXr/4fAhZS4Ry0c8amgQSB0+4PazvJJWFzidw==
X-Received: by 2002:a7b:c30a:0:b0:3dc:4fd7:31e9 with SMTP id k10-20020a7bc30a000000b003dc4fd731e9mr1902530wmj.7.1681398500496;
        Thu, 13 Apr 2023 08:08:20 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v9-20020a05600c470900b003edddae1068sm5687787wmo.9.2023.04.13.08.08.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 08:08:19 -0700 (PDT)
Message-ID: <10551f5e-4516-c0cc-0b04-73aa38f80a2c@linaro.org>
Date:   Thu, 13 Apr 2023 16:08:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 00/14] Add Qualcomm PMIC TPCM support
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
References: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
 <CRVOZOPMKBX4.2T7FOCWF0RKBJ@otso>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CRVOZOPMKBX4.2T7FOCWF0RKBJ@otso>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/04/2023 15:19, Luca Weiss wrote:
> Hi Bryan,
> 
> On Thu Apr 13, 2023 at 1:34 PM CEST, Bryan O'Donoghue wrote:
>> V5:
>> - Amagamates into once device, Heikki, Rob
>>
>> - Takes feedback on usage form Luka and Jianhua on VSafeV state transition detection
>>    dev_err() -> dev_warn()
>>
>> - Orientation graph example and general expected bindings
>>    I discussed offline with Bjorn the conclusions of the glink/sbu model.
>>    The expected orientation-switch path is
>>      connector/port@0 <-> phy/port@X <-> dp/port@0
>>    This can then be expanded to
>>      connector/port@0 <-> redriver/port@0 <-> phy/port@X <->  dp/port@0
>>
>>    - Rob, Bjorn, Krzysztof
>>
>> - Data role
>>    The data-role path is
>>      connector/port@0 <-> dwc3/port@Y
> 
> I believe I have adjusted my dts correctly for v5 compared to v4 but now
> the usb doesn't seem to work anymore in most cases.
> 
> Only when having the phone already plugged in during boot in one
> orientation does USB come up, but also disappears once you replug the
> cable. I still see the same (or at least visually similar) messages when
> plugging in the USB cable or the USB stick but nothing more than that
> happens.
> 
> Not that v4 worked perfectly on pm7250b+sm7225(/sm6350) but at least it
> worked in most cases as described in the emails there. Since the driver
> structure changed quite a bit, git diff isn't helpful here
> unfortunately.
> 
> Don't think it matters but worth mentioning that sm6350 uses the new
> qmpphy bindings as described in qcom,sc8280xp-qmp-usb43dp-phy.yaml (this
> was also the case when testing v4 of this).
> 
> Any idea?

Can you confirm the output of /sys/class/typec/port0/orientation in host 
mode with the USB key / peripheral in both orientations ?

If that's still OK, then perhaps we can figure out the gap in the PHY 
code for v3

@caleb is working on this code for sdm845 which is a v3 PHY

---
bod

