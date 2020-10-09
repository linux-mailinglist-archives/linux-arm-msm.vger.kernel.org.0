Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B56212899B6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 22:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387868AbgJIU0O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Oct 2020 16:26:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733021AbgJIU0O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Oct 2020 16:26:14 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11B5CC0613D5
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2020 13:26:14 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id f21so11003964wml.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2020 13:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hYOxM4PpYJSaeSQ+XPte6Uj4UYHx5vN6QsY6Km7XsLk=;
        b=RhJIbuoP0KsitKkPaGbKDgqu5hJPfYFOTaLkPbYjK4Sh9AMdupXbOieF5DC/LSC+Fh
         PnpHiXAV6qQPFJh1JlDek34BgT7HL3X+3llmpDbcpU7vRTgUw+NakNNiPraWbzWzsDH4
         PpTAQ1jUhfnNmc5QPsjXX8WzSImUXGhknHL9A6neKdsTuoKt7XQMa1E+gPPN6qn3NxXu
         /18edD8SPPKQSPU4BXSqtUeeW+V7sWPt7eJwQ0jIocsSsSb0TgUW55PpUpcDiPJjDw5t
         0WiHSMi9DXp0WnUz26uRvrSgl3ZTHp6n8ZCBZirvWLsDRUMYdMZc/hwYmhhgCjs1S+eb
         fu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hYOxM4PpYJSaeSQ+XPte6Uj4UYHx5vN6QsY6Km7XsLk=;
        b=jwgdmT1QFYzL8mrhQjE7N78kfkNN7Zm7nH3IzX1FdRO3HKIkdEuM3xlH34bQXekL5Z
         I94QguK7spJ8/lHGv+d6ImKSntwwCZlIgwleAkFObBuuYQ2+A39vBNU1oEYm2C33g3IK
         fIrxHT9ZYh/7HS24cGVt9CYyJOxu3RDK6nNWJ8et37mcI8aSulHNfgvwReUGvEMudmQh
         VHjoJfhGIVVu31pAwTgmvwsdMNwXV8FcNIqprHSiCaCRIygcdgzD3Hdf9vZ/LrO5ISYw
         2mGN5uPtdgFdQw/hwgtobd9RInpcLavrTjxCDWfegvQwhF+8YdhTms9Rh6CyeLuBZ7Sg
         sX9A==
X-Gm-Message-State: AOAM5330VAf5gyXajbeoMpWQHS5tW1OaBgDD85Nx5aNhofHioAh6/KXB
        XJmXDLAriQVcPWXDmWtSP2mF/EN5aYShww==
X-Google-Smtp-Source: ABdhPJxbnsENi0PeWaWCNMl2NYvOrAm2/8Yiih0OdRteX/qKpRSYO0H97neU1SW2E6bfQUVjrc/QFw==
X-Received: by 2002:a7b:ce97:: with SMTP id q23mr15507627wmj.19.1602275171470;
        Fri, 09 Oct 2020 13:26:11 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:9c49:1413:45db:f86a? ([2a01:e34:ed2f:f020:9c49:1413:45db:f86a])
        by smtp.googlemail.com with ESMTPSA id f14sm14536712wrt.53.2020.10.09.13.26.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2020 13:26:10 -0700 (PDT)
Subject: Re: [PATCH] cpuidle: governor: export cpuidle governor functions
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Lina Iyer <ilina@codeaurora.org>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux PM <linux-pm@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <010101746fc98add-45e77496-d2d6-4bc1-a1ce-0692599a9a7a-000000@us-west-2.amazonses.com>
 <CAJZ5v0hJJxxb+J5UtyZe2S_Tn7ARoGvjwDjw4dq601VJrriH9g@mail.gmail.com>
 <20200922161215.GD30658@codeaurora.org>
 <CAJZ5v0ipDRkPe6N9B6RzvHyCBobz8B9EoBfPh4DANrL_e86+Ww@mail.gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <bd62ffea-9736-f8f7-6a48-13e81f802aea@linaro.org>
Date:   Fri, 9 Oct 2020 22:26:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0ipDRkPe6N9B6RzvHyCBobz8B9EoBfPh4DANrL_e86+Ww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hi Rafael,

On 22/09/2020 19:27, Rafael J. Wysocki wrote:
> Hi Lina,
> 
> On Tue, Sep 22, 2020 at 6:12 PM Lina Iyer <ilina@codeaurora.org> wrote:
>>
>> Hi Rafael,
>>
>> On Tue, Sep 22 2020 at 10:00 -0600, Rafael J. Wysocki wrote:
>>> Sorry for the delay.
>>>
>>> On Wed, Sep 9, 2020 at 12:15 AM Lina Iyer <ilina@codeaurora.org> wrote:
>>>>
>>>> Commit 83788c0caed3 ("cpuidle: remove unused exports") removed
>>>> capability of registering cpuidle governors, which was unused at that
>>>> time. By exporting the symbol, let's allow platform specific modules to
>>>> register cpuidle governors and use cpuidle_governor_latency_req() to get
>>>> the QoS for the CPU.
>>>
>>> Which platform-specific modules may want to do that and why?
>>>
>> We are planning a custom cpuidle governor for QCOM SoCs. With Android,
>> the idea is to make them loadable modules so they can be in a separate
>> partition.
> 
> Well, the $subject patch is not applicable without a mainline user
> requiring this, so it needs to be posted along with that user.

Putting apart the custom cpuidle governor mentioned above, would it make
sense to convert the governors into modules ? It is pointless to have
all of them compiled in, especially with distros doing make
allmodconfig, no?


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
