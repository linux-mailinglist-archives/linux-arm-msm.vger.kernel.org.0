Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11D9432F781
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Mar 2021 02:30:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbhCFB26 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 20:28:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbhCFB2j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 20:28:39 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81DFFC06175F
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 17:28:39 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so66245pjv.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 17:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aZy+1fA0uSLl+EmuYI0FBIw1FF/OyCRyBw9pat+WqG4=;
        b=UsioOl5UZABrZVp7ywcWHZJKSWUcTQZYCik30gFZ54bGA471Er1UdDaH20aXQVCGT7
         lmpYt9HatKmDPs4/te1tXNY1fY1I1zb0uf3lB1q1qouxaVP3FJyHbdq2u2CVbOxLWypo
         wvEuRRIr1Qm4LZ1VWuSNyuMdPYSfk+mur/EKAR8QogUrunm5V1lAVBOFHWtV+8M60Xpp
         hRUzM7jJ9S1f5OsEszpn99MQrrCFT3fcU7miEqXj9LpLSP+vIY7oxOq6qpL6cAgyF4pt
         6+SeIJIj0wmgJ1LrMAC+MbKhEr5M9qTH7yZ8TSzazJiUsVnN+JvpSQTQsBbFkK2jo5lL
         Xdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aZy+1fA0uSLl+EmuYI0FBIw1FF/OyCRyBw9pat+WqG4=;
        b=cs8bIcbUfySIBVfIeT8jPcmfXAjfuWstMGFaVvHgecJJfUrHAXCyy8XqW556v4Ib95
         c3wlZArXpgkio4vtiBIDjh8vQjnBy6XDP3s9VpZdhNgSsWORcMmu/UkZ6G/vX8XGrOI9
         kg91AIpHlqz/JQAyZyjm0HUmxsj2bNLnkE8e0N05k8gwrA88/AN5xFj25xB7Ey7Cb68m
         YL8P5JDd+mZpKxxtR81sxT2dsV+2KphpIwacYX9vIqNzKxtCqnpzqvPzI/LAeYQXsRcO
         i4cNxw4QQ2pw0cngqMVAj6gOp+QX63kRNVXClFo8IMBbWnpeWXk9FBRm6XJxV4jL7IWi
         59mQ==
X-Gm-Message-State: AOAM531VX+6GSnojIDEjnvf3ptMDQkrr81YZyHUMTe7iVeMhEKmSqeHd
        JwMXHQBKYjKI5Cev+02FA6Xt4A==
X-Google-Smtp-Source: ABdhPJyZzSWt0feOqDeHGe6Lc2n07bDJWZ4pV+rRgAvmQsbMAx0YmqzNe5LAsowYtvF9MpxciyKI4g==
X-Received: by 2002:a17:902:8f90:b029:e5:dd6d:f9b3 with SMTP id z16-20020a1709028f90b02900e5dd6df9b3mr8886130plo.43.1614994119098;
        Fri, 05 Mar 2021 17:28:39 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id v2sm3158703pjg.34.2021.03.05.17.28.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Mar 2021 17:28:38 -0800 (PST)
Date:   Sat, 6 Mar 2021 09:28:33 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sdm845: fix number of pins in
 'gpio-ranges'
Message-ID: <20210306012829.GL17424@dragon>
References: <20210303033106.549-1-shawn.guo@linaro.org>
 <20210303033106.549-2-shawn.guo@linaro.org>
 <YEKl7GbxBhui4eoT@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YEKl7GbxBhui4eoT@builder.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 05, 2021 at 03:43:08PM -0600, Bjorn Andersson wrote:
> On Tue 02 Mar 21:31 CST 2021, Shawn Guo wrote:
> 
> > The last cell of 'gpio-ranges' should be number of GPIO pins, and in
> > case of qcom platform it should match msm_pinctrl_soc_data.ngpio rather
> > than msm_pinctrl_soc_data.ngpio - 1.
> > 
> 
> This is a historical artifact, SDM845 has 150 GPIO pins. In addition to
> this there's an output-only pin for UFS, which I exposed as an GPIO as
> well - but it's only supposed to be used as a reset-gpio for the UFS
> device.
> 
> Perhaps that still mandates that gpio-ranges should cover it?

I think the number in DT gpio-ranges should match msm_pinctrl_soc_data.ngpio.
Otherwise, kernel will be confused and be running into the issue like
below in some case.

> 
> > This fixes the problem that when the last GPIO pin in the range is
> > configured with the following call sequence, it always fails with
> > -EPROBE_DEFER.
> > 
> >     pinctrl_gpio_set_config()
> >         pinctrl_get_device_gpio_range()
> >             pinctrl_match_gpio_range()
> 
> When do we hit this sequence? I didn't think operations on the UFS
> GP(I)O would ever take this code path?

It will, if we have UFS driver booting from ACPI and requesting reset
GPIO.  And we are hit this sequence with my patch that adds .set_config
for gpio_chip [1].

Shawn

[1] https://lore.kernel.org/linux-gpio/YEDVMpHyCGbZOrmF@smile.fi.intel.com/
