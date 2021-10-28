Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 006EF43D801
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 02:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbhJ1AWH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Oct 2021 20:22:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbhJ1AWG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Oct 2021 20:22:06 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4972AC061570
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 17:19:40 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id n11-20020a17090a2bcb00b001a1e7a0a6a6so6553509pje.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 17:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:content-language:to:cc
         :references:from:subject:in-reply-to:content-transfer-encoding;
        bh=8hL4Jqifd0AqJfsoeSiVVrM/htd90YTwh+/QL+wMYOE=;
        b=F93KwyeuhwvUblxbiN9AHnABBpT0SDhBsNATgF0SFWLYQh0yWU+DzXWq3Eh2uh1J6q
         cDLS3PdXCm6xTEC17TeUvlICdZfwr7SIwrnt4V0pU8zxnDNhLKinTJ4f3wBHCapA3vSe
         fceA05q1SxC9iRkyNndPWsogerSrgjHEMvm6Klz9fWnyEFnDgbZXF0bFXIwH/QlVsmlH
         hEjcqPE23JgTkD7Bi7s6hWbT3PRJaCOtGoY5lwRf3EDIMO2lhOQ1j+j3I6ZIySd3QrTb
         wB8VQLFuJ0LuU0mtF2CSZ2oGp9UIcbO74beajkkClPZj4cbh6ft7ysTrnwtDeM0TUgmM
         +6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=8hL4Jqifd0AqJfsoeSiVVrM/htd90YTwh+/QL+wMYOE=;
        b=ri/2SJ1R6S1k3X4xeNnze1oAsMDqaANP0g5IGZkHn6GuDFXzaUuQm3pBJYj1h6T/FQ
         TCFj8bqdOB/RtksOh9nKHFHg9Gg7XK6+mPx7KIyI4SSEYnGRMEkXbbJ/4Xp2+BEG2tQO
         LlFVwIMM51SFBnzjTScQyYGyp5VGfbTWOhaMh6MPvYfN1pVvpxUh9ddiui83fr6awydr
         XkhvfeIpqum4HnA6GdiV1pGljEPHNIVY/KKNRn9RqAmeIETgKOVByImWjIYQHQ72cxPt
         1SOY3bL118xqR1xcwOEW1zUWlK9ORaTfI2g4bnPRnsuv7li+SgdtXTJ27UdBL4DqSQzo
         vCOQ==
X-Gm-Message-State: AOAM531rO9lOGEvYZm5Mc0lkH/M15atBko5fD7Zb8Tv4tPAXgEw5IMS1
        E4/EtIsXpkqJbVvoz4mGxNcvBw==
X-Google-Smtp-Source: ABdhPJyu9MyzsDbU0tdfRTLWP9RqAQHWwh9iBmH89gLRJ6pWDjBOMKJ5/XCIGCQAbXWNd6WAZE5ouw==
X-Received: by 2002:a17:90a:f195:: with SMTP id bv21mr917394pjb.203.1635380379858;
        Wed, 27 Oct 2021 17:19:39 -0700 (PDT)
Received: from [192.168.254.36] ([50.39.160.154])
        by smtp.gmail.com with ESMTPSA id d15sm1063545pfv.22.2021.10.27.17.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Oct 2021 17:19:38 -0700 (PDT)
Message-ID: <5c3d9b0a-8c68-feec-74b6-59f2e29b1d11@linaro.org>
Date:   Wed, 27 Oct 2021 17:19:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To:     John Stultz <john.stultz@linaro.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211025144345.267107-1-tadeusz.struk@linaro.org>
 <CALAqxLXjh9o925G9smW+uwWqKDarsvrBuzr+UL1CsQc4m7W+oQ@mail.gmail.com>
From:   Tadeusz Struk <tadeusz.struk@linaro.org>
Subject: Re: [PATCH] media: venus: Synchronize probe() between venus_core and
 enc/dec
In-Reply-To: <CALAqxLXjh9o925G9smW+uwWqKDarsvrBuzr+UL1CsQc4m7W+oQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi John,
On 10/27/21 17:01, John Stultz wrote:
>    Thanks so much for sending this out, I definitely would like to see
> these crashes sorted!
> 
> Unfortunately this patch causes some odd behavior when I use it with a
> modular config.  The display does not start up and trying to reboot
> the board ends up with it hanging instead of rebooting.
> 
> And booting with this patch in my non-modular config, it just seems to
> get stuck during bootup (I suspect waiting on firmware that's not yet
> mounted?).
> 

Thanks for trying the patch. With this patch I was able to boot android13
running 5.15.0-rc4-mainlineon on my Dragonboard 845c with the default
config common/build.config.db845c. Without it it was crashing.
It doesn't solve the firmware loading problem, it just makes it fail
gracefully for the boot to continue. If you share your config I can try
it and see what's wrong.

-- 
Thanks,
Tadeusz
