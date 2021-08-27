Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A99D3FA0C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Aug 2021 22:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231779AbhH0UmA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Aug 2021 16:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231774AbhH0Ul6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Aug 2021 16:41:58 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3BECC0613D9;
        Fri, 27 Aug 2021 13:41:08 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id h9so16453084ejs.4;
        Fri, 27 Aug 2021 13:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Xf357nAIQp/DfI8J7kSV68oMUuTmpfBnw0jmnOXe50I=;
        b=i02ToSDhvCjpWFC6uRaCryi7/LoA9thyo2fw2FYBXwihADlLwRKxiCF9v7WVJ2Lhx2
         Y6fDfyjsiUQ8qOYfRkHPMBjsv9fl+BjwnQ05CYN93sRhl313UTNCM1nrbMdzmnwk11yj
         AXMWlfG1rT4eEiQXnKW0e4F01vXUsUTngUz0Mxkdc9UHWEyyxJAP5Gkn2YiSCoIYdTk0
         lxz4AJ+PBklLOYq4T2r+kIUwLER4I7N7QS3RTdTaf4he83kFr6v3ZO0hBnl1ODAbMp2U
         JUR40l2FbOcle4Ah7uIX0nOL8oQH66GsFwICiI8/XlnWt7z1Y2sHiCuS9ENrQqBpK5Jj
         ImbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Xf357nAIQp/DfI8J7kSV68oMUuTmpfBnw0jmnOXe50I=;
        b=H65stQ3GDPDBXRsv4LGA50oMFS+znfkP531+fr//9w7H2v2PU+f8RoeLWmqv6s2kU0
         kODDxOjEUrOpQVkHxbpVo4hzmbvFlWnVEpnvIRnb/ITozqjffHa9EadYLDLbj2NSeE+h
         y2/BdFUEDSf0BJvwTUUHDbbvM7jMnLpzs/QahCZt+Fe+Uy2UgUYGpFg3enVXatxMeW7G
         VGBayLGMtp132V4Ve6+c5g2IXZ8Tq6zVAbjyHHMYgf+XhamsUMt3kdxysix/KnyJ+UVw
         E04AM3Bn/UpzMo18GNYB5o+SdU3VEYishesylE6sQfd0Wbwow753caW0XOJzVnmjgkr9
         W5yQ==
X-Gm-Message-State: AOAM5321eZR7uUF2i4nlMS7DHQsbyUmcdUUZwXWake/9Nwdb7E3I6FWB
        uw084xlEQGuej1RjFuDay44=
X-Google-Smtp-Source: ABdhPJzzLZMz6eEGyk7vQVVUp9Qi6qWAHt1bt9JJN1w4oRxyhxemJFY2E+i7IWTJQYI/Nw7Zrd1BGg==
X-Received: by 2002:a17:907:3e05:: with SMTP id hp5mr11988313ejc.527.1630096867440;
        Fri, 27 Aug 2021 13:41:07 -0700 (PDT)
Received: from ?IPv6:2001:981:6fec:1:1b32:912f:78cc:6c61? ([2001:981:6fec:1:1b32:912f:78cc:6c61])
        by smtp.gmail.com with ESMTPSA id s17sm3863006edt.69.2021.08.27.13.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Aug 2021 13:41:06 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] Revert "usb: gadget: u_audio: add real feedback
 implementation"
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ferry Toth <ftoth@exalondelft.nl>
Cc:     Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jack Pham <jackp@codeaurora.org>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
        Lorenzo Colitti <lorenzo@google.com>,
        Wesley Cheng <wcheng@codeaurora.org>, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        frowand.list@gmail.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, heikki.krogerus@linux.intel.com,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Pavel Hofman <pavel.hofman@ivitera.com>
References: <20210826185739.3868-1-ftoth@exalondelft.nl>
 <20210826185739.3868-2-ftoth@exalondelft.nl> <YSiiTrW/ZF2PyGWd@kroah.com>
From:   Ferry Toth <fntoth@gmail.com>
Message-ID: <605f5ae5-365d-80be-42a4-8d273a20c3d7@gmail.com>
Date:   Fri, 27 Aug 2021 22:41:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSiiTrW/ZF2PyGWd@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Op 27-08-2021 om 10:29 schreef Greg Kroah-Hartman:
> On Thu, Aug 26, 2021 at 08:57:37PM +0200, Ferry Toth wrote:
>> This reverts commit e89bb4288378b85c82212b60dc98ecda6b3d3a70.
>>
>> The commit is part of a series with commit
>> 24f779dac8f3efb9629adc0e486914d93dc45517 causing a BUG on dwc3
>> hardware, at least on Intel Merrifield platform when configured
>> through configfs:
>> BUG: kernel NULL pointer dereference, address: 0000000000000008
>> ...
>> RIP: 0010:dwc3_gadget_del_and_unmap_request+0x19/0xe0
>> ...
>> Call Trace:
>>   dwc3_remove_requests.constprop.0+0x12f/0x170
>>   __dwc3_gadget_ep_disable+0x7a/0x160
>>   dwc3_gadget_ep_disable+0x3d/0xd0
>>   usb_ep_disable+0x1c/0x70
>>   u_audio_stop_capture+0x79/0x120 [u_audio]
>>   afunc_set_alt+0x73/0x80 [usb_f_uac2]
>>   composite_setup+0x224/0x1b90 [libcomposite]
>>
>> Pavel's suggestion to add
>> `echo "adaptive" > functions/uac2.usb0/c_sync` to the configfs script
>> resolves the issue.
>> Thinh suggests "the crash is probably because of f_uac2 prematurely
>> freeing feedback request before its completion. usb_ep_dequeue() is
>> asynchronous. dwc2() may treat it as a synchronous call so you didn't
>> get a crash."
>>
>> Revert as this is a regression and the kernel shouldn't crash depending
>> on configuration parameters.
> 
> Are these normal configuration options in the wild, or is this just
> something that you "can do"?

It's a work around suggested by Pavel, a line that can be added to 
configfs script.

>> Signed-off-by: Ferry Toth <ftoth@exalondelft.nl>
> 
> I need an ack from the original authors to revert all this...

A fix has appeared:
https://lore.kernel.org/linux-usb/1jfsuvw817.fsf@starbuckisacylon.baylibre.com/T/#m922149b7e74204c8ed1bed2c624910ab4eafd43c

This has been acked by Felipe. If we can get that in 5.14.0 it would be 
preferable to reverting this series.

> thanks,
> 
> greg k-h
> 

