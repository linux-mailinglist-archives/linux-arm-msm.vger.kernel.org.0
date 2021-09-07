Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06EF4402F1D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Sep 2021 21:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346040AbhIGTtU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Sep 2021 15:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345746AbhIGTtT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Sep 2021 15:49:19 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 362D7C06175F
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Sep 2021 12:48:13 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id i3-20020a056830210300b0051af5666070so538085otc.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Sep 2021 12:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=w+pEkVJd/h+WI+7Ik9xWqY+Z8oL6sb51sITpdGLwuE0=;
        b=ZfXkyFLoNLwSCxIt2lcXw2d4jOGw2BhBPBTFYcXhipfSjLsFGRUgNK6ftpTAP5TXWq
         ruwHEv5trPt3h2I/CyAqcbyOo83YrThS3Kjacjot2cOxAKpRgjgr1lQizsZ7yTchvihV
         ErsPeqGVBrbrrKzNFlwtX95iDjPuVYP5wRuiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=w+pEkVJd/h+WI+7Ik9xWqY+Z8oL6sb51sITpdGLwuE0=;
        b=sC6ZndafB+Y8WdYsZPWXEdyxW6HtpW5hh5mwikD3BGfe5LT1t8ZJA62Sf3BiqG1plk
         kv5RK5S5fDH0mCnSxl/F4w79RMB1Er79zKYLVws5Cfkn8scKMkAuqscEQosg02/rfOug
         LJj03PXNtkm0oj19jU6KgyB9oofQBicg8AUOD0zOkf70lVrPrIDjc25Vqb1tIGCJImCs
         LEuEzOB04sFKCaR2/rg0zd0ITYwESPpUGIsSdawEQWHdNJ7+WP/FcLHfg/Sxh+mBK5I+
         ijjZ/uQYd2xokhnBuc3MVGv6HTqW5W+4gV/FJfY+hIWXTVgv/8VBATGtu2EDmKbSJuR1
         j/ZA==
X-Gm-Message-State: AOAM533n8ksCjk0e5cmH/yr19wNAibGbca+M65mAs6IwA48eNImsEd2W
        CWZEdAqL1/aDDj33CQsz5genWY6tm62rgSdxlZUNgw==
X-Google-Smtp-Source: ABdhPJxksUjTUTa8Exx6uQm/t3KaU/loUjkBf+4L6i+ATrGe4465p6dpfz+D435OVm1pzqfNM6HNZXNRx4Iq1MprmqA=
X-Received: by 2002:a05:6830:1212:: with SMTP id r18mr58677otp.159.1631044092581;
 Tue, 07 Sep 2021 12:48:12 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Sep 2021 19:48:11 +0000
MIME-Version: 1.0
In-Reply-To: <YTe+a0Gu7O6MEy2d@google.com>
References: <20210905210400.1157870-1-swboyd@chromium.org> <YTe+a0Gu7O6MEy2d@google.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 7 Sep 2021 19:48:11 +0000
Message-ID: <CAE-0n52d_GBh70pSDXTrVkD5S6akP4O9YcE4tVRKZcvLtLZSmg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Don't always treat modem stop events as crashes
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Kalle Valo <kvalo@codeaurora.org>, linux-kernel@vger.kernel.org,
        ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>,
        Youghandhar Chintala <youghand@codeaurora.org>,
        Abhishek Kumar <kuabhs@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Matthias Kaehlcke (2021-09-07 12:32:59)
> On Sun, Sep 05, 2021 at 02:04:00PM -0700, Stephen Boyd wrote:
> > @@ -1740,10 +1805,19 @@ static int ath10k_snoc_probe(struct platform_device *pdev)
> >               goto err_fw_deinit;
> >       }
> >
> > +     ret = ath10k_modem_init(ar);
> > +     if (ret) {
> > +             ath10k_err(ar, "failed to initialize modem notifier: %d\n", ret);
>
> nit: ath10k_modem_init() encapsulates/hides the setup of the notifier,
> the error message should be inside the function, as for _deinit()

Sure. I can fix it. I was also wondering if I should drop the debug
prints for the cases that don't matter in the switch statement but I'll
just leave that alone unless someone complains about it.
