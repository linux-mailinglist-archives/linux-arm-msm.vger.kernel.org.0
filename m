Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9160D389908
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 00:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbhESWCR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 18:02:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbhESWCQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 18:02:16 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB0CC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 15:00:56 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id v4so11368923qtp.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 15:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fao4pMvDQFMNttHvh2Tc9Sb+MGKeX3bWZRZpFguyiys=;
        b=PPgDGpbuoGEED9QAwmpAsgJAx3ymEIUyG11VW9Xcm5H4OUNy4elBCbyWlK825AqO39
         fMe8xwhHr4DnnU4xL5EXAUx6lUopSi7YMt6xzQRqU0vRA8hb5gp6r0DTtHwDu9ZQXWHt
         fB2breL8N+2diWODytNtMqVR0/+P1hkFDbaJ/X6gF2M+0PnUadGEeVIFe5nqwl3SF6tO
         M4qFMxmGSNtZVatgRpCW6ZlLsawUqUljodttFhvEFtXkMyQapYhJ7TTljHNv0pFKE347
         a1tE8Q35yBW3z3e/Rf5wi3XBBJtRO0Y1aRg/iaHYKToxJQujkcui0dRjkbRpHon1RUx9
         GamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fao4pMvDQFMNttHvh2Tc9Sb+MGKeX3bWZRZpFguyiys=;
        b=Y4bfR7U5xgg1MHpZ0ZTHNhLr1R+9ljz/f5wveQcvlswiDazg/TS4D4/BybL+oxLbrC
         zj7LUcBMoPQURtA2xkjdvFgVdmt+DFVdBuCtZHHBK0hhAwvZ9xPoMnS1lzMekXUZYul1
         V/AlNexGFOLxi0BHlBAQ8t78avEPKaJqt65vxARIik0ww6XkD3RRh0eQNiTH+8R/1FRx
         yliFSOQRs/6EVVXGGGyuYuhvUfh0ZfLgo8rL/w61F9ohdWr+0EGbrSbT+sUwTYTgUKfp
         mmaRcLgP7Rodg7+x4M67TeTDuMCbzygy6efyhtcZnskRlem8C3tAaFJRrPc94pW6ThPL
         ajrQ==
X-Gm-Message-State: AOAM530fmJJvBV6f9XkQ9/XZOTsrDogEF7X0C3ZwcIF/z/nMq/LS0GL+
        7JUs2PhyMcFbgzEH9ctO43h36e/pK1/qWJ7MKSCSrQ==
X-Google-Smtp-Source: ABdhPJyV6MKTkaeTWNG80G61f6/yhvGHA4QkSCt3TnFzRyetTIndD60HVSKu920VNcCYW2R28hu+DE4GAu2ccVl4D24=
X-Received: by 2002:a05:622a:413:: with SMTP id n19mr1817406qtx.238.1621461655556;
 Wed, 19 May 2021 15:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <aff4807e-e554-2e32-5789-dfaf65128a8e@connolly.tech> <CAF6AEGvnL9mOp3vKuSvz=KDijtFVMdKCF4BXSLxXeoR38O-SUg@mail.gmail.com>
In-Reply-To: <CAF6AEGvnL9mOp3vKuSvz=KDijtFVMdKCF4BXSLxXeoR38O-SUg@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 20 May 2021 01:00:44 +0300
Message-ID: <CAA8EJpqyuzEFqcd6YY=GEnjzNBpEndB1GD6A9h7rGK6_yuSbcg@mail.gmail.com>
Subject: Re: fw_devlink breakage on SDM845 / a630 with DSI displays
To:     Rob Clark <robdclark@gmail.com>
Cc:     Caleb Connolly <caleb@connolly.tech>, saravanak@google.com,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, 19 May 2021 at 18:36, Rob Clark <robdclark@gmail.com> wrote:
>
> + some more folks and msm list..
>
> I suppose I didn't hit this because CONFIG_FBDEV_EMULATION is not
> normally enabled for CrOS.. but I'm not really to familiar with
> fw_devlink

I've had multiple issues with the 5.13-rc1 because of devlinks.
Reverting f7514a6630166a7b566dee9b1af2e87e431959be (of: property:
fw_devlink: Add support for remote-endpoint) made things work for me.

>
> BR,
> -R
>
> On Wed, May 19, 2021 at 8:26 AM Caleb Connolly <caleb@connolly.tech> wrote:
> >
> >
> > Hi,
> >
> > Since -rc1 I've been hit by some DRM breakage in freedreno which happens
> > when fw_devlink=on. It seems to cause some clocks (rcg) to get stuck and
> > break DSI displays, here's a full log from the OnePlus 6:
> > https://paste.ubuntu.com/p/8kPx4nFGF5/ (that is with
> > "deferred_probe_timeout") The PocoPhone F1 also seems to be affected by
> > this.
> >
> > The display will still come up after pressing the power button a few
> > times, although it will be incredibly slow.
> >
> > It's worth noting that the issue only happens with
> > CONFIG_FBDEV_EMULATION is enabled, I've previously required this to see
> > kernel logs during boot and general boot splash with postmarketOS.
> > Without it the display will be stuck on the bootloader splash until I
> > press the power button and cause it to update once UI (like Phosh) has
> > started (though this has been the case for quite some time).
> >
> > I'd appreciate any help with debugging / resolving this issue, I'm
> > afraid I haven't been able to determine much from some brief digging.
> >
> >
> > --
> > Kind Regards,
> > Caleb
> >



-- 
With best wishes
Dmitry
