Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2FE7210CB2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2020 15:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730928AbgGANus (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jul 2020 09:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730408AbgGANus (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jul 2020 09:50:48 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C282BC08C5C1;
        Wed,  1 Jul 2020 06:50:47 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id dg28so19793263edb.3;
        Wed, 01 Jul 2020 06:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=x6o1wkUwjMuIR89Ql/nev/CvdBqKZU3NdYKJFabOM+Y=;
        b=rvVIaySq9mtTuhuIi+50y4YnttLRbH/7eWb3ro520avRBvTmtcMlkt+hn+Eki5xRMK
         xjDAAqxGbBAPL4vrUpuuJagnSTGmvK52DjomFS4Ui8xj/89Jf5N7Y/9HyD6k6jgsOVeY
         c4KWJWKUKu6VWx0Et+jBjsQ2gZc/lcI2c9zlfuege0n10g26xBKyUEwtjpIcvTc2cjUN
         DRtJ+mWbAmxvjUAdADT6fAOFbCLK3NlJ+/1SJwE1NoyP7xOeKxjUeEh9SqnSo26j0PVg
         soe5BlKucj5CVRNuGpuRfKb++UNJOhU5Mp55WQcWvAIGaTTpHLPm0KNY3FYeRr0hLnNY
         oxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=x6o1wkUwjMuIR89Ql/nev/CvdBqKZU3NdYKJFabOM+Y=;
        b=ZkBtNHrCgSRwzUEA3UftBOzkiKSV61+R3TcdEPC/eeNLpDF8riAGNcfjLONNXyAvk5
         n1klnvlj0+1KQZklZAHLNXrZtTwSZRwUg42+7oKsGo+yA7P2EnO9yElsvDW0pqxxbv6J
         hbmWF6h1p51MopEEVrMGnJlxPdcigGqlSiA0lRgvF9Ii6Md9ULQgMt5IbKWiKWk3srsF
         lX2UHMSLhP5rK4HK9aTGFdXN+KqFAshMeseUzlz4D88TUMfI2yVNL5tpx/d5YP6QVbeZ
         Azt3TYX3us2hAkfJquV/M4FLt23d9R5WUCUTkW9FgqkEaVOEBV925sYLB9X6nHO9KtOi
         JtKQ==
X-Gm-Message-State: AOAM532VbTs6Haq9P7XYrCAcr5qhY7ndB/9wje5NEjXldt9jOrrhcFLX
        K7zezDPygA8a48uKWVyZ8WGyaLKnKsc=
X-Google-Smtp-Source: ABdhPJwVTHv/cW8OyFVqXrMuKBDBcr1ErMCL/gontOQJK/hpXYAxnQ5jriB9yEsF4o9YWv67PWbuqA==
X-Received: by 2002:a50:f05d:: with SMTP id u29mr30155381edl.137.1593611445900;
        Wed, 01 Jul 2020 06:50:45 -0700 (PDT)
Received: from [192.168.86.31] ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id o21sm4575872eja.37.2020.07.01.06.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2020 06:50:43 -0700 (PDT)
Subject: Re: [PATCH 0/7] ARM: dts: qcom: msm8974: klte: Enable some hardware
To:     Brian Masney <masneyb@onstation.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org
References: <20200630140912.260294-1-iskren.chernev@gmail.com>
 <20200701103041.GA3246@onstation.org>
From:   Iskren Chernev <iskren.chernev@gmail.com>
Message-ID: <9fb3c6b4-85fc-7528-a2c7-58a1350fa241@gmail.com>
Date:   Wed, 1 Jul 2020 16:50:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200701103041.GA3246@onstation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/1/20 1:30 PM, Brian Masney wrote:
> Hi Iskren,
>
> On Tue, Jun 30, 2020 at 05:09:05PM +0300, Iskren Chernev wrote:
>> Enable support for various hw found on the Samsung Galaxy S5:
>> - touchkey (the two buttons around the home button)
>> - touchscreen
>> - notification led
>> - wifi
>> - external SD card
>>
>> Please note that for working wifi the correct firmware is needed. Check [1]
>> for links and locations.
>>
>> Also note, that to actually run a mainline kernel on the klte, you'd need
>> to apply this patch [2]. Any feedback on getting this to run on pure
>> mainline are welcome.
>>
>> [1] https://gitlab.com/postmarketOS/pmaports/-/blob/master/firmware/firmware-samsung-klte/APKBUILD
>> [2] https://gitlab.com/postmarketOS/linux-postmarketos/-/commit/765f55b248cd3b231af8431fe2f2aeca263b4e4b
>
> Good to see more msm8974 support upstream!
>
> Regarding the second patch, that should only be needed in order to
> use the GPU on these devices.

For the klte, without this delay rpm init patch, the device reboots soon
after being booted. I tested with pure v5.8 and next-20200701 (both have
basic klte support, including usb ethernet for ssh). With the patch
applied, it works like a charm.

Note that there is no GPU enabled in this setup (unless I'm missing some
piece from the SOC dtsi).

> I hope that patch won't be needed once
> IOMMU support is added, which is the last major missing piece in order
> to have the GPU working upstream. I posted a RFC patch [3] in January
> but didn't get any suggestions. I suspect some kind of memory corruption
> since the board gets unstable with that patch.

If the IOMMU is only used for graphics, then the problem remains for klte.

> If that hack patch is still needed to use the GPU once IOMMU support is
> in place, then I planned to troubleshoot it further by adding some log
> statements to various probe functions with and without that patch to see
> the probe order between the various subsystems. I suspect the issue is
> that a clock isn't ticking yet.
>
> [3] https://lore.kernel.org/lkml/20200109002606.35653-1-masneyb@onstation.org/T/#u

I'll be happy to help with that.

> Brian

Iskren

