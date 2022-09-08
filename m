Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D37575B115F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 02:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbiIHAhf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 20:37:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiIHAhe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 20:37:34 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86110DFCD
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Sep 2022 17:37:32 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id n17-20020a05600c3b9100b003b3235574dbso93475wms.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Sep 2022 17:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=+K5yytv/026gKQYAhNdokU2IKHV4BjcXcIWAHHhIzts=;
        b=cfuM7GN80hio+cXW8A85/3zrOslpyavTsZWyZ5TPrfuLZwN7v0sM9pzJlZIzsW1PSo
         sNQ6/8XARSnJL7Tsnmubuod3YDRIF4OqplkhlO4+kqXvITF5YfmL3qgK/adUyvwvRUq5
         vSdR3Ie1Y5G9NA0/jEWMV+rzZrYdayFCviVVT80zrSxRv56kS8s9sJpud9GGCMrODrTV
         z4b/SHjCyUSf9LzHNX42ksVVnKCu5ejswKMp/Zz+FjsibV1IfrlvJxGLtxgfszd8WCXo
         /6LkhD7J5wcp+ni1YzQn2v3dpaxso8cbp73hkmWxr1uEzo4u2ZzGeiCb6juc9AWLR/VV
         OKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=+K5yytv/026gKQYAhNdokU2IKHV4BjcXcIWAHHhIzts=;
        b=eWWXOD0X/u2ljHN5bFj3tCbGNxQqIFufCOCErlHudb3/Os10EzhZjQVvt/LqA41jbM
         2R7LGRnvDWT2GXZS9veR46Q/ZNN4GaYB8swc58VIZiiZn5oIuhuI1HyJSukBqDrXqDpk
         xM+BbTQjE0vvnML5K1bQBg9ovXz8lSEM8wGmsAk1+1yywprPELsPunzXZ2Q/bLb1zWuz
         mf4IBVg6orrYAIJETbhC+HBNeKbJKKXjC9skb/9PQdJTpOr3GduLSNifowbqFf3rc3bS
         y/c3292R88PCHiujSzd2i9wOuz5euIN8eQ6zAR9O0kB0Tv30AHi3TvV9vkHx9/9V6SYZ
         Q8Pg==
X-Gm-Message-State: ACgBeo2aNoYfEYciqkeALJau4WeXIkjZXzmAVArAkSsBG/Fhkd9weUkI
        5+jwxr2FXBt4HPRWDRCrcC0B/Q==
X-Google-Smtp-Source: AA6agR6jUBtLT3VQc14i49XUscGyKvRq56TN/L2G9ZSvP92JciID+QkosnYjWXwdMEYfYOzTDiKtzg==
X-Received: by 2002:a05:600c:19d3:b0:3a8:3b06:655a with SMTP id u19-20020a05600c19d300b003a83b06655amr504828wmq.182.1662597451027;
        Wed, 07 Sep 2022 17:37:31 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p18-20020a05600c431200b003a5c064717csm700901wme.22.2022.09.07.17.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Sep 2022 17:37:30 -0700 (PDT)
Message-ID: <4cd73207-eff9-2f72-fabd-da3ed3a9f6bd@linaro.org>
Date:   Thu, 8 Sep 2022 01:37:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Using CCI_I2C Driver for OV9282 on Qualcomm RB5 Vision Kit
Content-Language: en-US
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        "halil.karabacak" <halil.karabacak@boun.edu.tr>
Cc:     Linux arm msm <linux-arm-msm@vger.kernel.org>
References: <e4bf306f4c275655f3fbe577f48fb616@boun.edu.tr>
 <916574e1-ed62-cf92-a0ba-e7baf1a3f85c@linaro.org>
 <1ecd2058040c8e087ab1e0c34d3aac2d@boun.edu.tr>
 <69bdc9d7b5556575bf38cc6adc100e4a@boun.edu.tr>
 <23b50db5-e0e3-700f-40b5-3efb25735dfc@linaro.org>
 <a0388d8c-65fc-28e9-be5e-d75d576f5de0@linaro.org>
 <166258721180.2677993.14675525254961646895@Monstersaurus>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <166258721180.2677993.14675525254961646895@Monstersaurus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/09/2022 22:46, Kieran Bingham wrote:
> Hi Bryan,
> 
> Quoting Bryan O'Donoghue (2022-09-07 17:03:51)
>> On 24/08/2022 14:34, Bryan O'Donoghue wrote:
>>> On 24/08/2022 12:08, halil.karabacak wrote:
>>>> After some trials and errors, I achieved something but, are these
>>>> resolutions in the attached file correct? And I could read nothing
>>>> from the camera right now.
>>>> Regards,
>>>> Halil
>>>
>>> They don't look right.
>>>
>>> Are you trying with the imx577 or the ov9282 ?
>>
>> So I had a poke at the ov9282 today.
>>
>> ov9282 is detected on this branch here.
>>
>> https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=linux-stable-22-08-01-imx577-camss
>>
>> libcamera can't eat Y10P though
>> [1]
> 
> Hrm - it should 'now'.
> 
> It was originally added in [2] in November last year - but the
> corresponding V4L2 entry [3] was missed. It's been added last month, so
> should work now. Please let us know if it still causes you issues.
> 
> [2] https://git.libcamera.org/libcamera/libcamera.git/commit/?id=9e3470ad3e4f03364c8160917117d62fde5a7d88
> [3] https://git.libcamera.org/libcamera/libcamera.git/commit/?id=26c82ce13697e1af5950f4935ecff83c6453f351
> 
> --
> Kieran

Ah NICE

linaro@linaro-gnome:~/libcamera/build/src/cam$ git show
commit 6225d647b47982833fa654bf9cf65eb8c04d2036 (HEAD -> master, 
origin/master, origin/HEAD)
Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date:   Sat Sep 3 17:44:00 2022 +0300

Available cameras:
1: 'ov9282' (/base/soc@0/cci@ac4f000/i2c-bus@1/camera@60)
2: 'imx412' (/base/soc@0/cci@ac50000/i2c-bus@0/camera@1a)

---
bod
