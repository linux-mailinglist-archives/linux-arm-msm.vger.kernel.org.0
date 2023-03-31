Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE836D21C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 15:52:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbjCaNw1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Mar 2023 09:52:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232356AbjCaNwZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Mar 2023 09:52:25 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D6BA3ABD
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 06:52:23 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id d17so22459781wrb.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 06:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680270741; x=1682862741;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ndIVAAziZobigxMNwiVWE11rlsFi2JwX6ZgxWjCGcm0=;
        b=wfVZo1AvVtOn8P0YUF7riOYVU8cR8gTb2KvbUwJ6xDOJfb/jGgPyQHz4dX3mEVUDWi
         LXS+aNq5xsBR8fAHVpLWXfUnLc/m0Aauip2Clt0x2m5Wftz59ylv8eDczWn5zGfN9pNA
         HT/ROBFKQOtrcD4mTube/ac5/u8lqUfmHAv3mPPL5AQc1UV6djq0rSl1XT8bUmVpqPC5
         Y7XIP8zEBSW6kf8S+UQZ4+BAI9Ma+I78rwa1W9LilWQer9fKiMqYhG15u7trER3Aqs2Z
         d/Jckjshd66ZTjTN3jnPh0X3UWnatnEXIAi92bEVa8KYW1tOazyaHZ6Jr8pLuj+yj9rA
         QCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680270741; x=1682862741;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ndIVAAziZobigxMNwiVWE11rlsFi2JwX6ZgxWjCGcm0=;
        b=r6l/Tybi+xNrFVED7ZjeliAD6dtsGsHZZRlUrvEdIQZW7EH8h8BYCfpJL+LXcYuDNf
         GhFrXr/WO1gp20klI9ImWLrOQY+dhjqtEXs8vBvg0kEOrOKJSMjZUCqYRNsMo0/vNDxU
         cvK9A5WSG7oAYQAH6Xj5t/nwmJ+9wMxVnrUCdygQoGrZtH5BhuPRMBC5O2dXJu6EkNg+
         YrHoBryXeKFrZ+4yvB9j+dCLd+ykGycXKortEI+7yGecwUGB9JHtXF5gp0kpFTl0enfG
         KBtYEOk/e1uBVV2+/MNzEFcXA2edoR28baXLZbWDYTPBARNauHJunMWV/IJM6idMwdtd
         KrAw==
X-Gm-Message-State: AAQBX9cubqDAyDPvTQrjOfv6kreg6bV+94F35nYWAizTNhBIipbGduXv
        JI7hAzbUv+8wDNy5FR4YjJHxtw==
X-Google-Smtp-Source: AKy350aixDCatwepMhXp5kqrMJHuZM0Rv+jW1KnG2xGMYhUC3MpWKKAMVfR0T+o9/WCPWXrV7fJwAQ==
X-Received: by 2002:adf:ce01:0:b0:2e2:730a:c7dc with SMTP id p1-20020adfce01000000b002e2730ac7dcmr10087378wrn.25.1680270741678;
        Fri, 31 Mar 2023 06:52:21 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id w18-20020a5d6812000000b002cde25fba30sm2307750wru.1.2023.03.31.06.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 06:52:21 -0700 (PDT)
Message-ID: <233c8e94-d926-c5b2-a0b7-87333d5cdc2a@linaro.org>
Date:   Fri, 31 Mar 2023 14:52:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 00/18] Add Qualcomm PMIC TPCM support
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com, lujianhua000@gmail.com
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <CREPJP5KTX2D.VCM8IIZIP1ZT@otso>
 <9c541f81-8501-a142-1df8-6e71509c0d88@linaro.org>
 <CRKFT6BE3AW9.3OH8GRUPW2TLN@otso>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CRKFT6BE3AW9.3OH8GRUPW2TLN@otso>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/03/2023 09:48, Luca Weiss wrote:
> Hi Bryan,
> 
> On Fri Mar 24, 2023 at 4:28 PM CET, Bryan O'Donoghue wrote:
>> On 24/03/2023 15:10, Luca Weiss wrote:
>>> When plugging in the device with TCPM on into my PC (peripheral mode)
>>> then the USB device registers and unregisters every couple of seconds,
>>> never stays stable on. No messages in dmesg when this happens. This only
>>> happens with the USB-C plug in one direction, in the other it
>>> works reliable.
>>
>> Sounds like we need to do some SoC specific debug on orientation
>> switching in the PHY.
> 
> I also know that the phone has a AW35743 chip in the USB path,
> controlled by DP_AUX_EN and DP_AUX_SEL gpios but I think this is only
> for displayport, right?
> 

https://www.awinic.com/en/productDetail/AW35743CSR#product-details D+/D- 
looks like USB 2.x ..

Your DP should go over TX1+/1 TX2+/- depending on orientation and # of 
lanes in use.

https://www.allaboutcircuits.com/uploads/articles/Fig1m11292018.png

>>
>> I wonder how many lanes dp_opts->lanes says for your part ?
> 
> Not sure.. Where is this configured?

Heh - now that I look my lane count == 0, a bug to be fixed..

Hmm, Luca can you test this change

-       if (orientation == TYPEC_ORIENTATION_NONE) {
-               if (qmp->init_count)
-                       ret = qmp_combo_dp_power_off(dp_phy);
-       } else {
-               if (!qmp->init_count)
-                       ret = qmp_combo_dp_power_on(dp_phy);
-       }
+       if (orientation == TYPEC_ORIENTATION_NONE)
+               ret = qmp_combo_dp_power_off(dp_phy);
+       else
+               ret = qmp_combo_dp_power_on(dp_phy);


> But I also don't have DisplayPort over USB-C (video out) configured yet.
> Related question: does video out work on sm8250+pm8150b for you?

Nope - WIP. I see getting TCPM upstream and working as a first step, 
then we look at introduction of the redriver, DP work, dt etc.


> [ 1722.130836] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_cc: misc 0x000000cb cc1 0x00000001 Ra cc2 0x00000002 Rd attached 1 cc=cc1
> 
> - unplug -
> 
> [ 1867.223052] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_cc: misc 0x00000042 cc1 0x00000000 Open cc2 0x00000000 Open attached 0 cc=cc1
> ==================================================================================
> USB unstable (device plug orientation 2):
> ==================================================================================
> 
> [ 1894.263324] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_cc: misc 0x000000c9 cc1 0x00000002 Rd cc2 0x00000001 Ra attached 1 cc=cc2
> - unplug -
> 
> [ 1907.264840] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_cc: misc 0x00000040 cc1 0x00000000 Open cc2 0x00000000 Open attached 0 cc=cc2

Normal, correct.

For reference on 8250

Attached orientation reverse / cc2

[   77.719278] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: set_cc: 
currsrc=2 Rp-3.0-330uA mode EN_SRC_ONLY debounce 1 attached 1 cc=cc2

Detached orientation (none)
[   82.475667] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_cc: 
misc 0x000000c0 cc1 0x00000000 Open cc2 0x00000000 Open attached 0 cc=cc2

Attached orientation normal / cc1
[   82.485375] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: 
start_toggling: misc 0x00000040 attached 0 port_type 0 current cc 5 new 5
[   85.247368] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: get_cc: 
misc 0x000000cb cc1 0x00000001 Ra cc2 0x00000002 Rd attached 1 cc=cc1

Anyway I reckon that guard I have in the PHY code is wrong, would 
appreciate a test.

---
bod


