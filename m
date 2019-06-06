Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 790BD36F5B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2019 11:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727491AbfFFJB4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jun 2019 05:01:56 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33142 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727469AbfFFJB4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jun 2019 05:01:56 -0400
Received: by mail-wm1-f67.google.com with SMTP id h19so1369167wme.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2019 02:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=XsXyUphPtrpmwNj/tQvXOzDyUWyjFiksviUlxn2x1xY=;
        b=jPRtYV37F5H6T51+0EEEzb6L+y4m15NKpBkJZJFTRiRIciqq9Zm3Hei777tnOIG1ui
         buu+70/Fry97b2sseowzbUhWgq7BmnBhwG0xgFWfyqMH+ltj8gGdal6SLpwrby+nZSK4
         8cVBRlsankeY0OaXrBwQq6+T9jzWfRYFE200f4HE/UkI1szgWnPLFwACViFtJhkTD0wx
         Forwu9djdKm3Oqzmtp8PDZ+SAKYb7NMjoigkxzzXJpg3WgsOq+ejuWI1K4WQCYsSdmwz
         LahEdWRI3DN6iD+YdqwMLfmkUPMEIVX6msiswuKeSJfm0uhMw6rGjB3VRkojh7AKOxZJ
         IsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=XsXyUphPtrpmwNj/tQvXOzDyUWyjFiksviUlxn2x1xY=;
        b=NnvKCxI38C8fbZQSRD4HaHz4ipdyIV8pDHwi3lYmELnn7pNb9m9Z0uAgQvrWs+oIMM
         ysyY+MhYZdyLt4lR1+FkJpTwPUqMVJszitsTwEXWy9cZ8yo+DH0ypfWpzq0cr2SPS+Pz
         FNhVCfjjCagv7UJCnPHyR6jcY43Uz9EGK3Na062e5HgakCoshLyNdUthLIqvvItMpSAL
         3AuuisjA0XGJ0nEGZRvLi3uUjvc5cDqWnq+4LGroXVnxKRMv/2zpVF8m5md2TNIH7t7O
         YVny44uId1T//Bmrp2RkF+RpUF4bED9hd65z1ElKTj0sWwRRyMVoraVrhCygWKK9UaOH
         8TkA==
X-Gm-Message-State: APjAAAX7RBRgOlteQh6zD7EB/WKjMOz8JabAhPGejHOoKMT/S6SYVPnL
        jslNkT3FR/h47u6uwUr84IKjAQ==
X-Google-Smtp-Source: APXvYqzpjAMsL4kFCIOQCphvdkprJtRfTs+MHBHE8LspKB/dTrHj5S+CowpuwI0kC86fgNpnMMfrvQ==
X-Received: by 2002:a1c:f408:: with SMTP id z8mr25104651wma.140.1559811714426;
        Thu, 06 Jun 2019 02:01:54 -0700 (PDT)
Received: from dell ([2.31.167.229])
        by smtp.gmail.com with ESMTPSA id l19sm911488wmj.33.2019.06.06.02.01.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jun 2019 02:01:53 -0700 (PDT)
Date:   Thu, 6 Jun 2019 10:01:52 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: Add Lenovo Miix 630
Message-ID: <20190606090152.GC4797@dell>
References: <20190423160543.9922-1-jeffrey.l.hugo@gmail.com>
 <20190423160616.10017-1-jeffrey.l.hugo@gmail.com>
 <20190606055034.GA4797@dell>
 <20190606072601.GT22737@tuxbook-pro>
 <20190606081348.GB4797@dell>
 <e58a039d-fed4-0636-e17c-86f721ff5785@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e58a039d-fed4-0636-e17c-86f721ff5785@free.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 06 Jun 2019, Marc Gonzalez wrote:

> On 06/06/2019 10:13, Lee Jones wrote:
> 
> > On Thu, 06 Jun 2019, Bjorn Andersson wrote:
> > 
> >> On Wed 05 Jun 22:50 PDT 2019, Lee Jones wrote:
> >>
> >>> On Tue, 23 Apr 2019, Jeffrey Hugo wrote:
> >>>
> >>>> This adds the initial DT for the Lenovo Miix 630 laptop.  Supported
> >>>> functionality includes USB (host), microSD-card, keyboard, and trackpad.
> >>>>
> >>>> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> >>>> ---
> >>>>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
> >>>>  .../boot/dts/qcom/msm8998-clamshell.dtsi      | 278 ++++++++++++++++++
> >>>>  .../boot/dts/qcom/msm8998-lenovo-miix-630.dts |  30 ++
> >>>
> >>> What's happening with this patch?
> >>>
> >>
> >> The thermal-zones are wrong, but I'm okay with an incremental patch for
> >> that...
> > 
> > I guess it would take you about 10 seconds to whip those out when
> > merging?
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/agross/linux.git/commit/?h=for-next&id=ad480e0149cfc10defe76e88354b977360adb7a1
> 
> AFAIU, the fixup is to just drop the thermal-zones section altogether.

Yes, exactly.  A 10 second job.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
