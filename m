Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDD41402E0C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Sep 2021 19:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245469AbhIGR7Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Sep 2021 13:59:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233562AbhIGR7W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Sep 2021 13:59:22 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C771EC061757
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Sep 2021 10:58:15 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id x19so8783433pfu.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Sep 2021 10:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PH1/NKWKuIiK/UQ47Tpc0NCIfzOWPlskXSl+3rTMkTk=;
        b=P4QJo7HX5Djs/rgkb0gb3ueWcGU/Mut6ahkSnXfIIIjCSx2nvn0E3xJX9OAVFveJm8
         vL7UXndabvBoMDUAF4ILEnMc0hZMtNtFdrh9zlAPdArwxgZCV2LH4PsR0RKVYC0PjPIG
         d5zgyfGHrv4zwfYikaI+0PTFQG3yE0KnlYufY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PH1/NKWKuIiK/UQ47Tpc0NCIfzOWPlskXSl+3rTMkTk=;
        b=ptaRPeUumsBzz2yzrwl4BBlTPUO9YBFv/QU1fUsY7AsZiHdE+J3+rZ+IjQMKAtNhQV
         NMGFzlv04zUEyMsxR8IratulmAZXLBGKtsA9GdIjy+cFu1ckwbkcbLnusAhIqg/g6Zz0
         hTklkyUM4x/lBA3I3RSqaalldBTRd6oZpmCVLzpeJmV0DnXilISRsMryplKzCjx9j1SH
         Wue4ClzovB+u6pnxeYcDZWe1Cj1ThQ5stnIV9ZHdY0ze70qpHwV7g5Z0CbaLSivO9e2c
         hdCJBK2nFyjMIZXV0FB4Y6aZ0DiD/BMBl6HsL9y1vihe0jhxafnuJv3n1qZ1wN49VrFj
         tKeg==
X-Gm-Message-State: AOAM530Yb/vgFJ4gUFHmgoAmOdgVOwSTYc1T/KtTs7DSRYhyWypzukrz
        HKSd8X12fhDBp2FPGmY9WqknmA==
X-Google-Smtp-Source: ABdhPJxA3EKtCvWRbZmpp3xfkg33qPrCEleuHwhs6jqT4ojh2nloHdOTk5H7UFwjYOOXUPirqHb/xw==
X-Received: by 2002:a63:a54f:: with SMTP id r15mr18064078pgu.11.1631037495285;
        Tue, 07 Sep 2021 10:58:15 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c6b2:7ae:474d:36f6])
        by smtp.gmail.com with UTF8SMTPSA id d13sm11186217pfn.114.2021.09.07.10.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 10:58:14 -0700 (PDT)
Date:   Tue, 7 Sep 2021 10:58:13 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        swboyd@chromium.org, kgunda@codeaurora.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] leds: Add pm8350c support to Qualcomm LPG driver
Message-ID: <YTeoNX2Se/5o8Qrm@google.com>
References: <1630924867-4663-1-git-send-email-skakit@codeaurora.org>
 <1630924867-4663-3-git-send-email-skakit@codeaurora.org>
 <YTenSlKoDfAuB17a@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YTenSlKoDfAuB17a@google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 07, 2021 at 10:54:18AM -0700, Matthias Kaehlcke wrote:
> On Mon, Sep 06, 2021 at 04:11:06PM +0530, satya priya wrote:
> > Add pm8350c compatible and lpg_data to the driver.
> > 
> > Signed-off-by: satya priya <skakit@codeaurora.org>
> > ---
> >  drivers/leds/rgb/leds-qcom-lpg.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> 
> That driver does not exist in upstream or -next. Looks like this is a
> patch from some downstream tree, which you should not use as base for
> sending patches upstream.
> 
> It seems you need to send patches for the entire driver + bindings.

Sorry, my bad, I should have read the cover letter, which mentions the
dependency on https://patchwork.kernel.org/project/linux-arm-msm/list/?series=505483&archive=both&state=*
