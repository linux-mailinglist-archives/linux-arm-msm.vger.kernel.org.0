Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 035EC24B1AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Aug 2020 11:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbgHTJGh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Aug 2020 05:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbgHTJGg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Aug 2020 05:06:36 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F53C061757;
        Thu, 20 Aug 2020 02:06:35 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id v15so546933lfg.6;
        Thu, 20 Aug 2020 02:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZB4PCuqp8Bl2dkJy5Fm6Sj2/MRT/e7zYVg69/U7Iw3A=;
        b=jRSU7EbPYuaZa+y1ww5c1uQFbyH05AS+4/y9F7u0zfd9hNB2tnzBPNp8je59myQNMQ
         jHPH6tBd1Wwn7BdCa00KVXc60BSdX0Ndq10P7ka8NPFWg1ZJ3LsSZv0w8HBp6uQ3NiAh
         dj5XA0KHwLfCp0cjSlMmH6bx+JfVFMeQqSseCHBBmtyfNIM9YIojgpQJL8XUFhtSBjsW
         EUKBfwxwlk5cLYa8WcK31DAuysfcZ2hLaBPSEULzoNNVE+3ShAUapOTgWe+4CkfB57ZP
         mL01BWILpPiVjIBecOCA99KxCmG02TPxV3cr0jcgUSZ2kUozu8reoSXmgLtmVOjnXzBX
         ScIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ZB4PCuqp8Bl2dkJy5Fm6Sj2/MRT/e7zYVg69/U7Iw3A=;
        b=Lsh2CwfShDBkNd0QHhxQpJ5PFwQ1O8F9BGOG7/khoezcFf5LJAMoZGtHtZ+OGM4S1t
         W0/XsySxQa++blbuW0C9ETdM8ZGWeMkPl38hwiELgHemG4gCp9ih2UGuzNe/GujRc+FC
         54yc/StFO5BdUEj0vM0vKtS4C/Pg/3Gk28AvEaCqo98kxuQmVHyUJkd27LPGY6zFkm7t
         njkNlXJVXwKYs4NuSCpDj1AnYMCIuS0R51n+YLWEkE/Qh4YFMYuYsS2EpGf36FnRaT5Q
         6eca+EpWPxIo1Wz2rxy7H44u1N+LWAtrsRqZKkahr2MAkeNdt4uxFPLnMqXWJ4fL12lV
         JS8w==
X-Gm-Message-State: AOAM530BxC/WcGbim/ATHLCysKAIaCi3aeOFZKnI9gM7PGg/7HvA9a6O
        Iv8QqWBaYwqN/6Vs1jhuHPI/GMgpAa/Iwgub
X-Google-Smtp-Source: ABdhPJx586OB1ZFNi8bmTijB1iKrXx0pOQq+0PCvDWVugFZLEr8cnAEYNYIu9kBNKKo6DTiGbe/wQw==
X-Received: by 2002:a05:6512:3185:: with SMTP id i5mr1144189lfe.205.1597914394167;
        Thu, 20 Aug 2020 02:06:34 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:42ab:a165:4cb2:5f04:a1e8:63b? ([2a00:1fa0:42ab:a165:4cb2:5f04:a1e8:63b])
        by smtp.gmail.com with ESMTPSA id j2sm322988ljb.98.2020.08.20.02.06.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2020 02:06:33 -0700 (PDT)
Subject: Re: [PATCH v8 4/4] arm64: boot: dts: qcom: pm8150b: Add DTS node for
 PMIC VBUS booster
To:     Wesley Cheng <wcheng@codeaurora.org>, sboyd@kernel.org,
        heikki.krogerus@linux.intel.com, agross@kernel.org,
        robh+dt@kernel.org, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20200812071925.315-1-wcheng@codeaurora.org>
 <20200812071925.315-5-wcheng@codeaurora.org>
 <1ed0a34c-6219-fe3d-7d9c-13a74ce2d4d0@gmail.com>
 <02111c69-73fd-5e8c-5594-27393865d458@codeaurora.org>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <eaf4618c-54da-c522-52c6-1edec7744872@gmail.com>
Date:   Thu, 20 Aug 2020 12:06:23 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <02111c69-73fd-5e8c-5594-27393865d458@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20.08.2020 10:47, Wesley Cheng wrote:

[...]
>>> Add the required DTS node for the USB VBUS output regulator, which is
>>> available on PM8150B.  This will provide the VBUS source to connected
>>> peripherals.
>>>
>>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
>>> ---
>>>    arch/arm64/boot/dts/qcom/pm8150b.dtsi   | 6 ++++++
>>>    arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 4 ++++
>>>    2 files changed, 10 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
>>> b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
>>> index 053c659734a7..9e560c1ca30d 100644
>>> --- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
>>> @@ -53,6 +53,12 @@ power-on@800 {
>>>                status = "disabled";
>>>            };
>>>    +        pm8150b_vbus: dcdc@1100 {
>>
>>     s/dcdc/regulator/? What is "dcdc", anyway?
>>     The device nodes must have the generic names, according to the DT spec.
>>
> 
> Hi Sergei,
> 
> Thanks for the comment!

     You're welcome.

> DCDC is the label that we use for the DC to DC converter block, since
> the VBUS booster will output 5V to the connected devices.  Would it make
> more sense to have "dc-dc?"

    Better use s/th like "regulator-dcdc". As I said, the names should be 
generic, reflecting the device class.

> Thanks
> Wesley
> 
>>> +            compatible = "qcom,pm8150b-vbus-reg";
>>> +            status = "disabled";
>>> +            reg = <0x1100>;
>>> +        };
>>> +
>>>            pm8150b_typec: typec@1500 {
>>>                compatible = "qcom,pm8150b-usb-typec";
>>>                status = "disabled";
>> [...]

MBR, Sergei
