Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4415D259BD6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 19:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728879AbgIARHz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 13:07:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729476AbgIARHs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 13:07:48 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 616BBC061246
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2020 10:07:48 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id u128so1151880pfb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2020 10:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1VyEi1l0lOpd52Y7IvNbMVag3NVkD7N6u6BLF7rZqxQ=;
        b=d9f5Gtt7VQ7McMueG9lou77FPV3UfkIMWyZ2e+cscKXv6JkNF7PYpBaZHD3b7ZYsex
         +7mpAQ0Nm5GaK5MhZX5peVPJlFGn/h6VzYKhrTSx7tnfjy3q9jOGABY+AQfWOR1tgA8e
         MMWy3ABq++u/Y4ttPLGF4zk4/yOXTntKxIh2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1VyEi1l0lOpd52Y7IvNbMVag3NVkD7N6u6BLF7rZqxQ=;
        b=LaNsavkW3OJsS9ukaAVL0sK02ls6wK2B8oMjm6bEigAF9DgkeQ38UgyTsvFyrR8koI
         Obt33uvRIsItmAzfokwrQrgp9dOePkD9XgPPxL5DcMwXhDPTqmMAblrgJ2clHl0anOVk
         jXV7wPr3nb+xFSTkhZxDf5t0dS6XopjjP3YUUMhJtViRxkgAPbhyFLpYdqU7KHhDLn6M
         x0tJK1ggc1lexc3P40Mt2oZ7l1Bp7unk05ISs0CaC2BYg6KymHzo75gp7A0Zj2vlu14U
         UQ+mKy8KN37yXE7BzmBRxD3NLXF3f8SFhbtvFUledbhvYb0PEYocFtzkiFQ62OypnKC/
         BNGA==
X-Gm-Message-State: AOAM532bmpduvBUYhA1FpS9Fr9u6nlCFMx/bPjPlPmPzXOdLzx/G1msc
        SoVhbrwVdY9RJ+2uu7f6r2OGxw==
X-Google-Smtp-Source: ABdhPJy/J9QTlV1QLz55vVOu3QT4SNaPomEwKXsQSSS5USZRon8dmLop0heEKjD6Ih3bJYQHimqowQ==
X-Received: by 2002:a62:1a91:: with SMTP id a139mr2676443pfa.75.1598980067698;
        Tue, 01 Sep 2020 10:07:47 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id a5sm2818723pgb.23.2020.09.01.10.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2020 10:07:47 -0700 (PDT)
Date:   Tue, 1 Sep 2020 10:07:45 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org,
        Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add 'sustainable_power' for
 CPU thermal zones
Message-ID: <20200901170745.GA3419728@google.com>
References: <20200813113030.1.I89c33c4119eaffb986b1e8c1bc6f0e30267089cd@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200813113030.1.I89c33c4119eaffb986b1e8c1bc6f0e30267089cd@changeid>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 13, 2020 at 11:30:33AM -0700, Matthias Kaehlcke wrote:
> The 'sustainable_power' attribute provides an estimate of the sustained
> power that can be dissipated at the desired control temperature. One
> could argue that this value is not necessarily the same for all devices
> with the same SoC, which may have different form factors or thermal
> designs. However there are reasons to specify a (default) value at SoC
> level for SC7180: most importantly, if no value is specified at all the
> power_allocator thermal governor (aka 'IPA') estimates a value, using the
> minimum power of all cooling devices of the zone, which can result in
> overly aggressive thermal throttling. For most devices an approximate
> conservative value should be more useful than the minimum guesstimate
> of power_allocator. Devices that need a different value can overwrite
> it in their <device>.dts. Also the thermal zones for SC7180 have a high
> level of granularity (essentially one for each function block), which
> makes it more likely that the default value just works for many devices.
> 
> The values correspond to 1901 MHz for the big cores, and 1804 MHz for
> the small cores. The values were determined by limiting the CPU
> frequencies to different max values and launching a bunch of processes
> that cause high CPU load ('while true; do true; done &' is simple and
> does a good job). A frequency is deemed sustainable if the CPU
> temperatures don't rise (consistently) above the second trip point
> ('control temperature', 95 degC in this case). Once the highest
> sustainable frequency is found, the sustainable power can be calculated
> by multiplying the energy consumption per core at this frequency (which
> can be found in /sys/kernel/debug/energy_model/) with the number of
> cores that are specified as cooling devices.
> 
> The sustainable frequencies were determined at room temperature
> on a device without heat sink or other passive cooling elements.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> If maintainers think 'sustainable_power' should be specified at
> device level (with which I conceptually agree) I'm fine with
> doing that, just seemed it could be useful to have a reasonable
> 'default' at SoC level in this case.

Any comments on this?
