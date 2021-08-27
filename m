Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 357D43FA0CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Aug 2021 22:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231565AbhH0UpI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Aug 2021 16:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231346AbhH0UpI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Aug 2021 16:45:08 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95EDFC0613D9;
        Fri, 27 Aug 2021 13:44:18 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id t19so16426929ejr.8;
        Fri, 27 Aug 2021 13:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zJr7lhkEOS+2Z0JGIvGtQDn3Bm/wL2AxAcCTTaB5zNk=;
        b=WCHoy+oKQ8bZOak+BZggZ583d7O0cv+1+g2yrprRtC4gAHmlpjKCnDgdfz6Y8Yhawj
         jSvfubWMNZKE2KeqB5mv6Ux9ltmlPwrVHi1K6eMLINkfhMsETXN4S0Ye1NBEbQMd3Bwv
         5sjA4h9dTClZSuT8Bhvpt5Cr4rQfT/HtF7Xm0kap5rn7ycNBq/KemNqzlotu3QrRs1AA
         puMMF4Cu1I2gGzyS84habQ7INMcb97kJsmHIWbbvzvs/2TDYnvnaNuxSEjL2s+o/NBnI
         K4tqgBxlZBh4uYajk8eOsDvzykPdbUsmNBAtyB1DkctyqzQwNZwShAfp8QqkyqiIT9UT
         UwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zJr7lhkEOS+2Z0JGIvGtQDn3Bm/wL2AxAcCTTaB5zNk=;
        b=Q9SV+pF1P6KkR47F+9a035un8XluBWqbDps/ZBVKxoGZ9zoIiXhjC1jrKJIHfP4A8X
         WJuyUBpFGNd0ZOlmPPX9tcSk/ufCQGPnh/4BvbXX0MvMqcBc1J2p+NP2KsA0ek0NZ/00
         V4Q29zVAhM0LbPRy+6nFxAgbPiNTyY0OdW9tKGM3KqCbhpxjwUDNezZ6uTxjDnaUesIE
         jnwZVY9wlzAcoNlA5hPqlYT+DYLuHxDtgYNeA8mQ0MQAiTIAhyRL0R4SQDXnUujQiCIG
         1GYAWsSOuDEtn3MvtvAJ30RMJfDOLECdlkDBfGhWlXJ6YKbla2ue0hCtZhDFVlGnk9/1
         D9mQ==
X-Gm-Message-State: AOAM530Ds5k/0mJh+UmXYWW4qwYhKZhrzt+N/t2QNe/MNRUV/WghOxpf
        ANwuRVaO7aXmtKUc2DQeEtU=
X-Google-Smtp-Source: ABdhPJy0pcZhHZ4YSlyn233g+sfmZqY43BAJNvI5pugXacP6vqXUP7DofxzSPnazyMLoZP4v6kzLRA==
X-Received: by 2002:a17:906:63ca:: with SMTP id u10mr11654707ejk.411.1630097057184;
        Fri, 27 Aug 2021 13:44:17 -0700 (PDT)
Received: from ?IPv6:2001:981:6fec:1:1b32:912f:78cc:6c61? ([2001:981:6fec:1:1b32:912f:78cc:6c61])
        by smtp.gmail.com with ESMTPSA id dj25sm3988934edb.51.2021.08.27.13.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Aug 2021 13:44:16 -0700 (PDT)
Subject: Re: [PATCH v2 0/3] Revert "usb: gadget: u_audio: add real feedback
 implementation"
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ferry Toth <ftoth@exalondelft.nl>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jack Pham <jackp@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        USB <linux-usb@vger.kernel.org>,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        Lorenzo Colitti <lorenzo@google.com>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Pavel Hofman <pavel.hofman@ivitera.com>
References: <20210826185739.3868-1-ftoth@exalondelft.nl>
 <1j4kbbxqgr.fsf@starbuckisacylon.baylibre.com>
 <CAHp75Vdu8v1QSi0CQw7qp-yPhMtwJ_hQO=GT5pWoD0nxmKoF_w@mail.gmail.com>
From:   Ferry Toth <fntoth@gmail.com>
Message-ID: <4dc02e9c-4009-b964-520a-7e380a819cda@gmail.com>
Date:   Fri, 27 Aug 2021 22:44:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vdu8v1QSi0CQw7qp-yPhMtwJ_hQO=GT5pWoD0nxmKoF_w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Op 27-08-2021 om 11:15 schreef Andy Shevchenko:
> On Fri, Aug 27, 2021 at 11:05 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>> On Thu 26 Aug 2021 at 20:57, Ferry Toth <ftoth@exalondelft.nl> wrote:
>>
>>> Although there is a patch resolving this issue (see
>>> https://lore.kernel.org/linux-usb/1jilzsy8g7.fsf@starbuckisacylon.baylibre.com/T/#u)
>>> it needs a little work and will not be ready for v5.14.0 release. Until then
>>> revert the series.
>>
>> Seems like a quite messy solution when the fix available :/
> 
> Is it? AFAIR Thing pointed out to some problems with the proposed
> solution. Have those been addressed?
> 
>> Change with the updated commit description is avaialable BTW [0]
> 
>> [0]: https://lore.kernel.org/20210827075853.266912-1-jbrunet@baylibre.com
> 
> Dunno, but this gives me 404.
> 
I think:
https://lore.kernel.org/linux-usb/1jfsuvw817.fsf@starbuckisacylon.baylibre.com/T/#m922149b7e74204c8ed1bed2c624910ab4eafd43c
