Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D68E241A01F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 22:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236430AbhI0Ubx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 16:31:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236141AbhI0Ubw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 16:31:52 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC4ACC061575
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 13:30:14 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id q14so20753500ils.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 13:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UZvcsU3jPC2Tqc7j/AtvwZ18MVpNDDVJOl1x3POhGbU=;
        b=L0ILZT89coBxeIAX5+u1eqipNQmsiWIlNyIQph8LxnANRDb1MNnzzqFjDpYVwgm5PU
         w45sz1eC1AXfSYaigrK0SPXIaDUUgvll5gfyvkgfBd0jfvCqbRliOKy5eacWnAs6Gc1f
         VTem9J4OsUZrlmdW/RoKmnqHXWeCpgrkAnwTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UZvcsU3jPC2Tqc7j/AtvwZ18MVpNDDVJOl1x3POhGbU=;
        b=RmvV5CJmCO98wcNo7jPIgbhd2dNbYlq/Qiu5YlGj8Q2fBqMdjCoKPTrL6fOr0SlyPd
         cjs9dRygEfWrhGzncOX48/tuVc7Z2XltKM9n46K9+hdAGJbB6ZW1xjuQb6XG2XIpCfa8
         lqtVPDpyCBwbpbMGYJ1Uh1rhlFBmSZ1LNuEKSPQvJzUNS2QIrFvzU7hy6S6QvYJ3cl9v
         eRKZwvttruS7jcdWsVhrtpuGzm+CKTA4pNFUi7fNAZ+medGfMxvDjw3YgQkD+Z1+mtuH
         Cx5zgpid7VnokXnuL3kKyEU9PCqSsz8bbmghQtCI7xs9Uzd51MV+YQ6/avJgXISTeVYx
         NWwg==
X-Gm-Message-State: AOAM532hOqS2r0yHiXhL80YMkpBsGHqVjby25AP/aPUS2ea667PKSDqC
        c1uRoJ8kD2wweAELlcdZe2zKvQ==
X-Google-Smtp-Source: ABdhPJy3CIoP3cDu640nMRW1zwMO9LfH+7YzUyor3Xfei8wizLckYT/20eap+dGIf3Z7RnZqyF6COQ==
X-Received: by 2002:a05:6e02:1c81:: with SMTP id w1mr1483057ill.112.1632774613587;
        Mon, 27 Sep 2021 13:30:13 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id r11sm9439972ila.17.2021.09.27.13.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 13:30:12 -0700 (PDT)
Subject: Re: [PATCH] net: ipa: Declare IPA firmware with MODULE_FIRMWARE()
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Steev Klimaszewski <steev@kali.org>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210926065529.25956-1-shawn.guo@linaro.org>
 <YVIc77g464EpLtyN@ripper>
From:   Alex Elder <elder@ieee.org>
Message-ID: <f85b8088-6efd-5f3b-d064-f61afd273a3b@ieee.org>
Date:   Mon, 27 Sep 2021 15:30:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YVIc77g464EpLtyN@ripper>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/27/21 2:35 PM, Bjorn Andersson wrote:
> On Sat 25 Sep 23:55 PDT 2021, Shawn Guo wrote:
> 
>> Declare IPA firmware with MODULE_FIRMWARE(), so that initramfs tools can
>> build the firmware into initramfs image or warn on missing of the
>> firmware.
>>
>> W: Possible missing firmware /lib/firmware/ipa_fws.mdt for module ipa
>>
>> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
>> ---
>>   drivers/net/ipa/ipa_main.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
>> index cdfa98a76e1f..264bebc78d1e 100644
>> --- a/drivers/net/ipa/ipa_main.c
>> +++ b/drivers/net/ipa/ipa_main.c
>> @@ -545,6 +545,8 @@ static int ipa_firmware_load(struct device *dev)
>>   	return ret;
>>   }
>>   
>> +MODULE_FIRMWARE(IPA_FW_PATH_DEFAULT);
> 
> I think it's fair to say that no device that is capable of running
> mkinitcpio should actually use IPA_FW_PATH_DEFAULT, but rather some
> device-specific firmware file.

Actually, yes, I should have thought of that too.

The default used here just specifies the path name
used *if the firmware file name is not specified in
the DTB*.

So I don't think this is correct regardless of whether
the MDT file is split or not.  I think that's what
Bjorn is saying here.

					-Alex

> 
> Regards,
> Bjorn
> 
>> +
>>   static const struct of_device_id ipa_match[] = {
>>   	{
>>   		.compatible	= "qcom,msm8998-ipa",
>> -- 
>> 2.17.1
>>

