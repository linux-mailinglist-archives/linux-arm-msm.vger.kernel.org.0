Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 933612DC76A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Dec 2020 20:55:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727852AbgLPTyp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Dec 2020 14:54:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727125AbgLPTyp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Dec 2020 14:54:45 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2550BC061794
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Dec 2020 11:54:05 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id i24so26105220edj.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Dec 2020 11:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lEgdzUb4kSlkgADpRNG+q/tRgzSb8ZpRL/wEUP9L+VQ=;
        b=imoloHBvtPrZY/JA9bQuXNXMr+rCClt7TQksZkIAcpdWZ512pJr4lDEzxizPLOZ3aQ
         CltfgbXr67ahIti0psXtTQpHcbMsweSRbJM6kspQvENjs3dvVChWEZeBKMnkj4JYkhqa
         zSoot57YFMCUHol/AjHgRqtX5mLVtT2vKmhbquwj18jJlKHt6HXSksiNWKikFe/QV+gG
         Hqt5gZ2lMVl4P3ovyeIQ4T68sPESOXzMnaMODWbmrAb49cTz/veijtuqin0ZGC850IlR
         MFBeCJX7Twevq5AqPYpegNWKpu1w1Y9vGoRiDa6+xR+O21g3z31x4NtoxYQ553X+pYca
         n4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lEgdzUb4kSlkgADpRNG+q/tRgzSb8ZpRL/wEUP9L+VQ=;
        b=UlO5MKOoEn6eInJrFrTEnZsL0GlTVOxl2UwVZU9d1N//maIyuFjh180o/38ZGe6/UP
         J8Ha0wwS9a7dveQ/ei06QUGl8Ew5i9vj7hHMHLrn87qWrNX2/rS6iR8vKlxudDeUoJ3W
         0NRwZ/1KCR2+5tR6uqLYYRFY6lB1GerVO7wRnJUPXJxy+IOjVkKJjgmuGQfa2m9qmjw/
         4POpM7aJAOXzvHdfkuFOGnJW+A/ySyMu3vq9zg0HAGFutFMf9l8f/PNWb67U31bBhWJi
         2szUA3NmYM0QlPvmI/6OzN/mBqUB+lZCWlwgM1WH/v4UHPJn7GLa9b0unGKHgPzmutU5
         7e5w==
X-Gm-Message-State: AOAM5320vSTuiNfFRRgP5jEmBjXpjdBpLaZNkacMiVW56IQh30h4s+JY
        4uIzo0pewERaM+FC7xME2jarNXdLemxxZ9Ji
X-Google-Smtp-Source: ABdhPJy6++UOacI85zTLwVjF/BdSq4wtOQ3wRw/BTSIuIuRY1RtTMMJJCFnNYFM4dAiuMJ+BdN4Uqg==
X-Received: by 2002:a05:6402:139a:: with SMTP id b26mr35568051edv.47.1608148443877;
        Wed, 16 Dec 2020 11:54:03 -0800 (PST)
Received: from x1 ([143.244.37.47])
        by smtp.gmail.com with ESMTPSA id i13sm2067327ejc.57.2020.12.16.11.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 11:54:03 -0800 (PST)
Date:   Wed, 16 Dec 2020 11:53:57 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] gpiolib: Allow name duplicates of "" and "NC"
Message-ID: <20201216195357.GA2583366@x1>
References: <20201215170308.2037624-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201215170308.2037624-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 15, 2020 at 09:03:08AM -0800, Bjorn Andersson wrote:
> Not all GPIO pins are exposed to the world and this is typically
> described by not giving these lines particular names, commonly "" or
> "NC".
> 
> With the recent introduction of '2cd64ae98f35 ("gpiolib: Disallow
> identical line names in the same chip")' any gpiochip with multiple such
> pins will refuse to probe.
> 
> Fix this by treating "" and "NC" as "no name specified" in
> gpio_name_to_desc()
> 
> Fixes: 2cd64ae98f35 ("gpiolib: Disallow identical line names in the same chip")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> The introduction of 2cd64ae98f35 breaks pretty much all Qualcomm boards and
> grepping the DT tree indicates that other vendors will have the same problem.
> 
> In addition to this the am335x-* boards will also needs "[NC]", "[ethernet]",
> "[emmc"], "[i2c0]", "[SYSBOOT]" and "[JTAG]" added to this list to allow
> booting v5.11 with the past and present dtb/dts files.

I am the one who added the gpio line names to the am335x dts board
files, and I am happy to change them if it will make unique line name
logic simpler.

I used the notation of "[<non-gpio-functionality>]" to make it easy for
the user to realize that the corresponding gpiolines could not be used
on these boards (BeagleBone and PocketBeagle) for actual GPIO.  I used
generic names like "[ethernet]" because I didn't think it made sense
to confuse the user by using the precise name of the non-gpio function
(such as "[gmii1_rxd0]").  I could post a patch for the dts files that
restores unique names for "[ethernet]", "[emmc"], "[i2c0]",
"[SYSBOOT]" and "[JTAG]".

As for "[NC]", the BGA balls corresponding to these gpio lines are
simply not connected to any circuits on the board.  I happy to change
that to whatever name people prefer for a non-connected pin ("", "NC",
etc).

Thanks,
Drew


