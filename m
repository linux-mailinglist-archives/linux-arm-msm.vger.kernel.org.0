Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 557A659E8FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 19:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbiHWRTD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Aug 2022 13:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbiHWRSh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Aug 2022 13:18:37 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14696149772
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 06:42:46 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id m17-20020a7bce11000000b003a5bedec07bso9631174wmc.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 06:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=BZGc7KMGhxpJzjf28Ln+BTJ7PNj0I1gr2eyERPmw+6E=;
        b=y/iWkfpJUISXu0Vm90E9jvsLyOc5B7ZgXdAJQR5QDWr/pRswXwBbZj3am7Nt6RzFVs
         REQkaW+3Nspc7oAiOiaK5Vu+oNgcBHeIRM0usQjKUHtRAl13pSWtYxVK2rAdzw5dQaEP
         9WfB2SDH/heDiZXVdrqnF0nF0U9MCQjxAw/vm2HRXKcOnepuec6MZcbrNleJPp0Dn6sT
         dRX5+kirkNsNWDs6sv1J0bFhKB8AAH1PSsb8P/1Af074ZvBiPttq7NTf1crlD1Wg+5mt
         OkevNdVU8SLNpnR445tS0650Xd1S6WTgpiJloFFRit3+kJYBBxivmo1EBmpNfb0xjxoU
         cMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=BZGc7KMGhxpJzjf28Ln+BTJ7PNj0I1gr2eyERPmw+6E=;
        b=2qF1HkV/OjiC+coHNwZMWA38Ncd5uKn0eAL/mjoC7P3JzxuuDA8rTBBtzDwIbIo6Nr
         h9qVGkQlx6TJQ4XrNDzPJxDRAKJA/s2Wj8yov8mqV6gd3W7LsldsRGmqAe9CCyO3S7tg
         hDVt+C+DAbnMn49Hc+5jpsLWGvldKja/Eig8blrpSVMP6VfiqsqYYZkFuvtXZ0cu6Wfd
         ctnhgGrLfNrMfqLtrJXNyRJTs1ZuAq3DoAbRtK4PKxHT9ysAimBN5DHpYs3ynf+x/0SO
         oSGiqLCszil+LAqpm7ar6GAPBYLXqkblycS+ERhdVw1FlB4Td8Lyb8bl9kxA5ucvUtpl
         3TRQ==
X-Gm-Message-State: ACgBeo2mqGbMnSV0VBOiCUHsQvpJ0VWO38DyR602vz4sYjrDREYL6oCU
        kADiBrwBcti7C7O2D6i8+EpPkQ==
X-Google-Smtp-Source: AA6agR7XtzXaZmb7K0OoZq02IZ2hnLsUHJMmmuYbEgjGi7sq5HNjeSMjdaCLWIu5z/xGWoGpb+S38Q==
X-Received: by 2002:a05:600c:3541:b0:3a6:28e4:c458 with SMTP id i1-20020a05600c354100b003a628e4c458mr2308176wmq.188.1661262164635;
        Tue, 23 Aug 2022 06:42:44 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j14-20020a05600c410e00b003a50924f1c0sm17714166wmi.18.2022.08.23.06.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 06:42:44 -0700 (PDT)
Message-ID: <916574e1-ed62-cf92-a0ba-e7baf1a3f85c@linaro.org>
Date:   Tue, 23 Aug 2022 14:42:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Using CCI_I2C Driver for OV9282 on Qualcomm RB5 Vision Kit
Content-Language: en-US
To:     "halil.karabacak" <halil.karabacak@boun.edu.tr>,
        linux-arm-msm@vger.kernel.org
References: <e4bf306f4c275655f3fbe577f48fb616@boun.edu.tr>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <e4bf306f4c275655f3fbe577f48fb616@boun.edu.tr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/08/2022 08:25, halil.karabacak wrote:
> Hello everyone,
> 
> I have been trying to use CCI_I2C driver instead of I2C on my OV9282 
> with video4linux2(I want to see as /dev/videoX). However, I was not able 
> find much, but yesterday I found out 
> https://patchwork.kernel.org/project/linux-media/list/?series=647614 
> this kernel patchwork focusing on camss & camera drivers. I believe that 
> this patch also requires some other patches to work as intended on 
> kernel. Is there a way that I can use these drivers on my 
> 5.15.0(5.15.0-qcomlt-arm64) kernel?
> 
> 
> Regards,
> Halil Karabacak

Hi Halil.

Please give this kernel a try.
https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=linux-stable-22-07-18-imx577-camss

I've also included a defconfig there so others may pick up on the work.

To get the ov9282 to power up on the RB5 we will need to add in 
regulator_block_dostuff() support as was done with the imx412/imx477/imx577.

* 3de9dc7f67731 - media: i2c: imx412: Add bulk regulator support
* 9a199694c6a15 - media: i2c: imx412: Fix power_off ordering
* bb25f071fc92d - media: i2c: imx412: Fix reset GPIO polarity

Also the polarity on the GPIO now that I look at the git log.

Basically right now the media driver doesn't support switching the 
regulator on and we should make sure the polarity is correct for the chip.

I'd not expect the device to respond at all given it is not powered and 
might be held in reset as is.

I might find a few cycles to poke at this if you don't get to it first.

---
bod

