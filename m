Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F33C433C985
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 23:51:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231664AbhCOWum (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 18:50:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231377AbhCOWul (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 18:50:41 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B183C061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 15:50:41 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id ha17so8842956pjb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 15:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=R2+ovV6L3in/MumK+lTJGLQ5/2i+MFlHYR2x0Kz43Uk=;
        b=Kx+vExQNwcrCcz/1VobS6pnZvxjXg3JIuqQQh4w+D0sdgaaWHUWrYxM1EmMqJTZoez
         I4w8XUY2s/aa6lYc/pfrSzcMBQORMijou/ifDRycyWarXqsLBxFYdHvVeWuvQEo5rrYf
         g+0gBIibn5kjjFd/0YexcLsUVmF2/Ok0Ab6hQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=R2+ovV6L3in/MumK+lTJGLQ5/2i+MFlHYR2x0Kz43Uk=;
        b=r/EJCszryEOgLvyyfxBNa4e4Q2dGm97czZWzrxv1YzZ4j+Jad+jXmuX19ZNoWnS0Xg
         DXpcMbsN8KyR6NePbjoEC32Lx3jo4tkxIxHsCOD1OS0xn/iOBBiM3IiP2VddIQePy/3S
         s7c8y9CHjT7OFhK/BYIDBZHnz70M+sXYR5fj5/ZV3VzncFPyN+zJbPVrVPm+uBDvFBsQ
         JAbr1fiblLzKW1yY9a8W1Sdi5i3A6a00GhYvQuBDeM++GKQ/HR7PRo9+mykquDcxv9Iq
         j1tkPmGQMGEhdMxc+WW3MFuBkcFaoQ+CkT62+u0PEUCvhgMbYQaFqrwbjesg/cQYM9ih
         Z+zA==
X-Gm-Message-State: AOAM533HIqKO2Ar06VXjOim+QGOnvfibb5/ox2f/bba8IjQJMFyoY/GZ
        rBK6KSte7WFVHxK7tPnxt4/zrQ==
X-Google-Smtp-Source: ABdhPJy+q49KIQaR8QnZDHxJ8pD9j0Svh6so5BA+3ZGasQchet21dplnLkDJwDQU4EEkdHLC4GQfmw==
X-Received: by 2002:a17:90a:3cc6:: with SMTP id k6mr1447789pjd.212.1615848640724;
        Mon, 15 Mar 2021 15:50:40 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:9867:b969:5d4f:e017])
        by smtp.gmail.com with UTF8SMTPSA id c24sm13631741pfi.193.2021.03.15.15.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 15:50:40 -0700 (PDT)
Date:   Mon, 15 Mar 2021 15:50:39 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sc7180: Add CoachZ rev3
Message-ID: <YE/kv1CwPoEGs9O8@google.com>
References: <20210312183228.550779-1-mka@chromium.org>
 <20210312103211.v2.3.I95b8a63103b77cab6a7cf9c150f0541db57fda98@changeid>
 <CAD=FV=Xq4bd8j3_to_9rJmyqWTi-78OWVCd0meaJ9e_pmOH+Rg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=Xq4bd8j3_to_9rJmyqWTi-78OWVCd0meaJ9e_pmOH+Rg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 15, 2021 at 02:49:04PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Fri, Mar 12, 2021 at 10:32 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > CoachZ rev3 uses a 100k NTC thermistor for the charger temperatures,
> > instead of the 47k NTC that is stuffed in earlier revisions. Add .dts
> > files for rev3.
> >
> > The 47k NTC currently isn't supported by the PM6150 ADC driver.
> > Disable the charger thermal zone for rev1 and rev2 to avoid the use
> > of bogus temperature values.
> >
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> >
> > Changes in v2:
> > - added CoachZ rev3
> > - updated subject and commit message
> >
> >  arch/arm64/boot/dts/qcom/Makefile              |  2 ++
> >  .../boot/dts/qcom/sc7180-trogdor-coachz-r1.dts |  9 +++++++++
> >  .../dts/qcom/sc7180-trogdor-coachz-r2-lte.dts  |  4 ++--
> >  .../boot/dts/qcom/sc7180-trogdor-coachz-r2.dts | 13 +++++++++++--
> >  .../dts/qcom/sc7180-trogdor-coachz-r3-lte.dts  | 18 ++++++++++++++++++
> >  .../boot/dts/qcom/sc7180-trogdor-coachz-r3.dts | 15 +++++++++++++++
> >  6 files changed, 57 insertions(+), 4 deletions(-)
> 
> So what you have here is good and we could land it. Feel free to add
> my Reviewed-by tag if you want.
> 
> ...but I want to propose an alternative. It turns out that these days
> coachz-r1 and coachz-r2 are actually the same. The only reason both
> exist is because <https://crrev.com/c/2733863> ("CHROMIUM: arm64: dts:
> qcom: sc7180: add dmic_clk_en back") wasn't the proper inverse of
> <https://crrev.com/c/2596726> ("CHROMIUM: arm64: dts: qcom: sc7180:
> remove dmic_clk_en").
> 
> It sorta squashes two changes into one, but if you combined your
> change with one that folded "-r1" into "-r2" it would actually make a
> smaller / easier to understand change, essentially, it would be:
> - just a rename of the "-r2" file to be "-r3"
> - add "-rev2" into the list of compatibles in "-r1" file.
> - add the "disable" into the "-r1" file.

I agree, if rev1 and rev2 are the same in terms of the DT they
should use the same file(s).
