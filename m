Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 101A26A4733
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Feb 2023 17:42:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbjB0QmH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Feb 2023 11:42:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbjB0QmG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Feb 2023 11:42:06 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5A14231D5
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Feb 2023 08:42:04 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id ay29-20020a05600c1e1d00b003e9f4c2b623so7636068wmb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Feb 2023 08:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+me6M6jnjT1BwxUdC2ofn0DEUQ3q8gLgwSnPklypId8=;
        b=bIBUUU/OU5U6029v2a4Hi50LmWjJGQF129QxmSOOPq8s/ZPNby3LJHh2ke7doe9Diw
         5N4SQU2bqBAXlNsqEEXTyYSu2mJPQG/6Ep2msNMvn3ntOj05avDZbkS9W/tqtzkNylGy
         KhznhjSyCGLBWWAiGNj75BeBQCTkhFnFvUv5pteAM5B0oSri0JcRiYU88iW4lM6jJQwI
         RdQfh3s5ze7jmefDZDEshQSJ2VmsRptQIG4VQi30lX5lGUTaKR09W4HJL/IF1W4vVIto
         9G/8B0Xn9U/HDMd4hDNKUZi0Tnw2Is/HSZ7G6XdSCjCGZB5HU7eVqV6OD2DBS7zNOGVU
         Uz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+me6M6jnjT1BwxUdC2ofn0DEUQ3q8gLgwSnPklypId8=;
        b=4w3UYCIm9AJY/FDyk4I6j2/9CUzOApWjHVsl7aFDqqvmhNPhxMbIHoMdWGLedl+dVm
         81Ino+pGt4bFtplmgR4rfm0XUgXwgxyGr8moGNKFeDxexk3joktIZuJMU967LBlvlKVX
         jTQ2gjVewW8s1xzLBaGtcWjLLLf6o9VNnVWmfbcGTyTcqmyPtKWNMlfiCAgHeIJrg3Pz
         uDaq5qiHKniW6uZAHOjTGaZWMMufLQUbHcKc7WkYpNcJc1lX7iowBxT31NlxLj34ogZJ
         piWnVOV6hLvGZst7lbSCjjQeRBqd96WvdnPzmEm6Gr7vneGSolLAJKpnGx7Aya9mbTDg
         VjhQ==
X-Gm-Message-State: AO0yUKUzu6jO29hn2BlZpUjN4waRj5BJdTtj4gYSEn5FSahbAfSH70WS
        ulPqBbO0aV9hx+8SONUpRThmUA==
X-Google-Smtp-Source: AK7set9OKtEbGWFvTt5z20GAMQAVyq83LuntA4CXTlGML1R/tG+SxdBAsCLesuG3aG2/JpAaFVGKLw==
X-Received: by 2002:a05:600c:713:b0:3eb:2eb8:9e36 with SMTP id i19-20020a05600c071300b003eb2eb89e36mr6478460wmn.28.1677516122878;
        Mon, 27 Feb 2023 08:42:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:fbee:23cf:fdf3:bad4? ([2a01:e0a:982:cbb0:fbee:23cf:fdf3:bad4])
        by smtp.gmail.com with ESMTPSA id az11-20020a05600c600b00b003e1202744f2sm13063531wmb.31.2023.02.27.08.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 08:42:02 -0800 (PST)
Message-ID: <b650c02b-85ba-89d0-4ca4-d37d5017839b@linaro.org>
Date:   Mon, 27 Feb 2023 17:42:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] MAINTAINERS: Add myself as co-maintainer for DRM Panels
 drivers
Content-Language: en-US
To:     Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230216-topic-drm-panel-upstream-maintainance-v1-1-ae1cf9268217@linaro.org>
 <Y+9awrqcQIOQNeaX@ravnborg.org>
 <45387999-a930-c03f-1acd-a02b9b4b3b3b@linaro.org> <Y/zOU8cu29hOi9hk@orome>
Organization: Linaro Developer Services
In-Reply-To: <Y/zOU8cu29hOi9hk@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Thierry,

On 27/02/2023 16:37, Thierry Reding wrote:
> On Mon, Feb 27, 2023 at 09:22:02AM +0100, Neil Armstrong wrote:
>> Hi Sam !
>>
>> On 17/02/2023 11:45, Sam Ravnborg wrote:
>>> On Fri, Feb 17, 2023 at 10:58:15AM +0100, Neil Armstrong wrote:
>>>> Add myself as co-maintainer for DRM Panel Drivers in order to help
>>>> reviewing and getting new panels drivers merged.
>>>>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>
>>> Thanks for stepping up!
>>>
>>> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>>
>> Thanks for you trust!
>>
>> Is there anybody else willing to ack ? Thierry ?
> 
> While at it, perhaps you want to remove me from the entry? I haven't
> had much time to look at these drivers for a while now and Sam has been
> doing a much better job than I ever have, so looks all in good hands.

Thanks for your feedback, I can send a v2 with your entry removed,
is it ok for you Sam ?

> 
> Acked-by: Thierry Reding <thierry.reding@gmail.com>

Thanks!
Neil

