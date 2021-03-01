Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA04C327AF9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 10:40:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234048AbhCAJkO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 04:40:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234038AbhCAJjr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 04:39:47 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAB22C061786
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Mar 2021 01:39:06 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id b18so8867282wrn.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 01:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=J67311LSdF6jMCXHcRsS2/P8YZ9lxrbt1gE7LzkRMqA=;
        b=SMs8rt66hMrlsINChSzuMepk42PUx9iaAaZVEOxSK5UptMf+PE3E8AgBZceDSHggYx
         QeZmp2FRQBjYAFj1sxNFwDfqGS9ubztYXljk92cv82I9ZwLgul4m/Grc3VYObKoiWoMO
         KMvTIZrsdbJnKJJFaJy4Sd71NCUFDdBRW1VdSacudcF9zSWSc6WN21IcVxWh3HKKhYYS
         Ls+ZZzj6fOJRag4C1A71591kdf5ekIvMr/VQrtU4lRhPVslxWWLzHKLXrglHsmS3Iohv
         mV4JCnu/viNvjvDFt+VmPy3x65XQOEM2kZC/NjNapIkCKbkxZVcSbw/zUAkSw+OFoqEo
         dz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J67311LSdF6jMCXHcRsS2/P8YZ9lxrbt1gE7LzkRMqA=;
        b=BL5aAhhv34OkhVtbwV2z0/DC41CJQEiAgvSnUtKgDOBS6abk5n6OaYVj9jtE8jWHWN
         Bj4EXOHmfnm5Vtu1ZjY06vV0mwVU/76jZtqJql4vVOJCw623AoS64Nepj+rSjLeXWDsq
         kZbX7Npo3I0OijxFeXGcTGszXzpZ5mW3uSqckUpR8K749ceRSm00E48SMXlfAKEN9pKj
         e94giU/vxhxO+zROFFXkQ2pj7Qu57wlvhv+V0Jxi30pYobT2/3je3Dsx+nOFSaASn6+x
         29bG5ScCE78KUbupwM8pYHxOSibTf75Giy/G7LCxt/cXK3m2WnJL8HnuG4xKQ71UIOrF
         zh6w==
X-Gm-Message-State: AOAM530nxqGzKavfjyL3T+vizLaWI0CdN1DufxrkIk0oOIqBqaJmIaEH
        0D3uGalmeBHVvx9gbamrE8PWAg==
X-Google-Smtp-Source: ABdhPJxxyw54JaDpxLeGBz4c4r4o9AdpPCLIRhPUI4Ox+mvAHwMnh/sSozrOG5nOE2++xvSKYigwGg==
X-Received: by 2002:a5d:6b89:: with SMTP id n9mr15695069wrx.74.1614591545301;
        Mon, 01 Mar 2021 01:39:05 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id p12sm20328888wmq.1.2021.03.01.01.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 01:39:04 -0800 (PST)
Date:   Mon, 1 Mar 2021 09:39:02 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     kgunda@codeaurora.org
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH V2 2/2] backlight: qcom-wled: Correct the sync_toggle
 sequence
Message-ID: <20210301093902.34mtfcouajc36y6t@maple.lan>
References: <1614341544-5306-1-git-send-email-kgunda@codeaurora.org>
 <1614341544-5306-3-git-send-email-kgunda@codeaurora.org>
 <20210226172601.aknj2d4hghkkqjol@maple.lan>
 <0cca377c2a7648c5f1606e38ba1b7d4d@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cca377c2a7648c5f1606e38ba1b7d4d@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 01, 2021 at 02:15:12PM +0530, kgunda@codeaurora.org wrote:
> On 2021-02-26 22:56, Daniel Thompson wrote:
> > On Fri, Feb 26, 2021 at 05:42:24PM +0530, Kiran Gunda wrote:
> > > As per the current implementation, after FSC (Full Scale Current)
> > > and brightness update the sync bits are transitioned from 1 to 0.
> > 
> > This still seems to incorrectly describe the current behaviour.
> > 
> > Surely in most cases (i.e. every time except the first) the value of the
> > sync bit is 0 when the function is called and we get both a 0 to 1
> > and then a 1 to 0 transition.
> > 
> > That is why I recommended set-then-clear terminology to describe the
> > current behaviour. It is concise and correct.
>
> Okay. Actually I have mentioned the "clear-and-set" in explaining the fix.
> Let me modify the same terminology in explaining the problem case also.

Yes please.

In my original review I took time to explain why patch descriptions
require care and attention and, also, why expressing the original behaviour
as 1 to 0 was inadequate. Based on the previous feedback (and reply) I
was rather surprised that the problem was only half corrected in the
next revision.


Daniel.
