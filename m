Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF7C851867
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2019 18:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728019AbfFXQWG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jun 2019 12:22:06 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:42217 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729932AbfFXQVw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jun 2019 12:21:52 -0400
Received: by mail-io1-f68.google.com with SMTP id u19so2369667ior.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2019 09:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EO8eeZ48f6EoVfLk0+Ia7DkcWqdLXYNwWud7QgwjUxA=;
        b=j/ELAhg2UmVVT/WszfKjP0eVP6XomPXTVwyKZdSvtL+ZfxzgYeaOtX9ahKvHpdamwH
         yVYSC/sOcvC8M2NmLy8DvQG5D7Z/9PyPVOM9lRo7OPF78WmueHL0Jgp1zGC2hWPlPP4l
         hTKVN++WoXD0aVpQikgglS80GZqpeLwsNlRnC3v8TH9LiWO6KIVVwG513TZgIvq6yUod
         bz50kbawIi6oofsSlwp9FymUCenj4mpFg7X7Uv9wYKx04iWTbcLMvqdhMU/A6/BaGxR+
         Uv4bT5iOViDyTKoOUWZaxUnDw0W0DlptJe0+0yKvAjAmhuuHpCDLUYaCza9GBCGYL7XJ
         R2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EO8eeZ48f6EoVfLk0+Ia7DkcWqdLXYNwWud7QgwjUxA=;
        b=Qiwd6k7MdcZOPacUtNLvQc/qDKBZTM8EmL8hp+au5SwgFZbHJRSiWG/M+AFCZnSi6z
         M/laSb7hs2axrVoKZhOpuhZ4D1wNE08gWfDkM5HnrlsFD2Ox6hKD3b0EIN911MGB4P8y
         ZMn09ilaDJHQYKzSgamoKUlq/8OAWRR1li4srq1GFDg9xIuMUS3wDyYNgJkf/nKRnFoC
         yqXBpEZANgcgz9MY5IhpDKY6KleSZPovzyF10YncWLtbeChQ3/b9Y5/a5Q6/3wFUDG5Y
         YCbLHX96HttPqzX3HxTCeA93HSs7r5VTNuJ6nnLfBnwjdQWK3R/DEvqmjCeIlmvmiV+F
         bz7g==
X-Gm-Message-State: APjAAAUzf97InHDsB+DCkNoVB8Jgvr5hvwJ1Cm9JcN/hgFRRTpPJ32TL
        0FEi9ZDaKlbuk7IvqQUR1U+wfA==
X-Google-Smtp-Source: APXvYqxz3FaFhWw2FnWfg4aUKQQZ6vaEckamt/BYnOdzvhusMwszWyk5+OepCRBdKbupvmmVwjgR3w==
X-Received: by 2002:a5e:9308:: with SMTP id k8mr266555iom.143.1561393312086;
        Mon, 24 Jun 2019 09:21:52 -0700 (PDT)
Received: from [172.22.22.26] (c-71-195-29-92.hsd1.mn.comcast.net. [71.195.29.92])
        by smtp.googlemail.com with ESMTPSA id l11sm14545587ioj.32.2019.06.24.09.21.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jun 2019 09:21:51 -0700 (PDT)
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
To:     Johannes Berg <johannes@sipsolutions.net>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     abhishek.esse@gmail.com, Ben Chan <benchan@google.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        cpratapa@codeaurora.org, David Miller <davem@davemloft.net>,
        Dan Williams <dcbw@redhat.com>,
        DTML <devicetree@vger.kernel.org>,
        Eric Caruso <ejcaruso@google.com>, evgreen@chromium.org,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-soc@vger.kernel.org, Networking <netdev@vger.kernel.org>,
        Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>,
        syadagir@codeaurora.org
References: <380a6185-7ad1-6be0-060b-e6e5d4126917@linaro.org>
 <a94676381a5ca662c848f7a725562f721c43ce76.camel@sipsolutions.net>
 <CAK8P3a0kV-i7BJJ2X6C=5n65rSGfo8fUiC4J_G-+M8EctYKbkg@mail.gmail.com>
 <583907409fad854bd3c18be688ec2724ad7a60e9.camel@sipsolutions.net>
 <31c2c94c-c6d3-595b-c138-faa54d0bfc00@linaro.org>
 <b90977f94df020986c6bb490e7fd0262603726b0.camel@sipsolutions.net>
From:   Alex Elder <elder@linaro.org>
Message-ID: <5ffbcce1-f93d-5746-5037-9dcc03cd73f0@linaro.org>
Date:   Mon, 24 Jun 2019 11:21:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <b90977f94df020986c6bb490e7fd0262603726b0.camel@sipsolutions.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/18/19 2:22 PM, Johannes Berg wrote:
> On Tue, 2019-06-18 at 09:00 -0500, Alex Elder wrote:

. . .

> Anyway, I think for now we could probably live with not having this
> configurable for the IPA driver, and if it *does* need to be
> configurable, it seems like it should be a driver configuration, not a
> channel configuration - so something like a debugfs hook if you really
> just need to play with it for performance testing, or a module
> parameter, or something else?
> 
> Or even, in the WWAN framework, a knob that we provide there for the
> WWAN device, rather than for the (newly created) channel.

Agreed.  I think a knob is appropriate, it's just a question of how
that control exposed.  Same answer to your question below.

					-Alex

>> The hardware is capable of aggregating QMAP packets
>> arriving on a connection into a single buffer, so this provides
>> a way of requesting it do that.
>>
>>>> #define RMNET_FLAGS_INGRESS_MAP_COMMANDS          (1U << 1)
>>>
>>> Similar here? If you have flow control you probably want to use it?
>>
>> I agree with that, though perhaps there are cases where it
>> is pointless, or can't be supported, so one might want to
>> simply *not* implement/advertise the feature.  I don't know.
> 
> Sure, but then that's likely something the driver would need to know,
> not necessarily userspace?
> 
> johannes
> 

