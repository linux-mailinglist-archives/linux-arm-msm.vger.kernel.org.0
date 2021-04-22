Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90CCF3688A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Apr 2021 23:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237153AbhDVVjA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Apr 2021 17:39:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237132AbhDVVix (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Apr 2021 17:38:53 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBB5FC06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Apr 2021 14:38:17 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id l2so4940242qvb.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Apr 2021 14:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=17RfyaTeIokTgRDeo35cefRpLMh7tU98i8pYpROElO0=;
        b=PqX7Wx1GDjMnldVpYXbkC66iKUtc3CNsfbF1O4XgF7ZthMmuTr3QPfutSPuJ/3q2QY
         NN0ALoFEZgT3ePeNb10Ef7gWTVkDSuzNNOYenQC5VbcG5Vi230kHb+qrOFT5eJKQdupy
         VLY96TSiQ57Q9yYVA4NbLheuJrPqYlXQwhwtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=17RfyaTeIokTgRDeo35cefRpLMh7tU98i8pYpROElO0=;
        b=Qd9TAmdMzoUhkrH7SMDW6CGFaWY8XNLAF2pskk0VcdOyEgvq9hTWKieH2eCWjiW5/+
         b8tYl9r7gqlqQlYkMRntYPQHEq5ODfpbXs/1tu94efX0QCSdWN0VJBT7jnx3goHXUtKa
         6Ifre0bjys/SePkFVS4Gpxq4tuGkTGVOJwvCEiQDIAXblksGLngV6lBjHMw4h9po2Isu
         yOLvYC19oXI94jZ4D/pnNnKnKL7YqhXrHIsIztzMc/50ULoEHxmjXeBUdiQ06DYGbGuz
         QgWv2GztaZ3KH/SSYSFxVJyRfhbnqcaIqeOSGG/OI3zNlo3tONclOLbIhnAWp3I0LObg
         IwTg==
X-Gm-Message-State: AOAM533o2AGqiza5UaC866AXgtewN/Qzcjx4NVRvqnH8gN5X3ljzwuNd
        HzoDFfdXO6OhLR0y6Tykn5yep2eoTn2NOg==
X-Google-Smtp-Source: ABdhPJzkspXpkirDKKOqhpKwSl1+w5AEPrq4iFQVs5yXRwdl44feG8mElTpwuPBaYtDnSX0sKrTS4A==
X-Received: by 2002:a0c:ee81:: with SMTP id u1mr846451qvr.14.1619127496683;
        Thu, 22 Apr 2021 14:38:16 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id u11sm2901162qta.91.2021.04.22.14.38.14
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Apr 2021 14:38:14 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id c195so53233936ybf.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Apr 2021 14:38:14 -0700 (PDT)
X-Received: by 2002:a05:6902:4c3:: with SMTP id v3mr1207135ybs.276.1619127494005;
 Thu, 22 Apr 2021 14:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <1619112931-2144-1-git-send-email-sanm@codeaurora.org>
 <1619112931-2144-2-git-send-email-sanm@codeaurora.org> <YIHBzxN/9O9a98Xd@google.com>
In-Reply-To: <YIHBzxN/9O9a98Xd@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 22 Apr 2021 14:38:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vzx29E6hH+L8rZyyrOjt2JLzS8ho1Cym6bNY6gt5dO9w@mail.gmail.com>
Message-ID: <CAD=FV=Vzx29E6hH+L8rZyyrOjt2JLzS8ho1Cym6bNY6gt5dO9w@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Add USB related nodes
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,


On Thu, Apr 22, 2021 at 11:34 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On Thu, Apr 22, 2021 at 11:05:31PM +0530, Sandeep Maheswaram wrote:
> > Add nodes for DWC3 USB controller, QMP and HS USB PHYs.
> >
> > Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> > ---
>
> What changes with respect to v1? Please always include a change log for
> versions > 1

It looks like this was here:

https://lore.kernel.org/r/1619112931-2144-1-git-send-email-sanm@codeaurora.org/

...which I guess is a "cover letter", though it's not really formatted
properly (it should usually be listed as "patch 0" in the series) and
also cover letters are discouraged for singleton patches like this.
Also: even when history is added to a cover letter it's usually
friendly to reviewers to also include it after-the-cut in your patch.

-Doug
