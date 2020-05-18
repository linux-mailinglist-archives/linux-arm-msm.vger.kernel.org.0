Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA651D8608
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 20:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730643AbgERSWo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 14:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729033AbgERSWh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 14:22:37 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18B12C061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 11:22:37 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id k3so3822912ual.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 11:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B7TcTnxdgBKTVFL5gUH9Cy+Jbda1czl9E/pUOuzMN/k=;
        b=Evwhtrr7DfFquZt/cm+QLYTGVqidVIKhvJS22rNpNJk94fG/F9IzQhDU4y/bCEU4cH
         xd+K0m6JnG5eb4d5M7YXq22v9ymYRgljTktq1YE98d9c1ZmfHOsOmS8lske6MfpztrSe
         NRMzZXp+d2uuIbdUtV6Dcuz5dAbQ4ji99HeIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B7TcTnxdgBKTVFL5gUH9Cy+Jbda1czl9E/pUOuzMN/k=;
        b=qUR25E4csav6o4B/kmkGafA14ajfDpBPO2mHkE/pK8IPZ6e28sNk7oCkN9WjQCqJSo
         54zG3xn7Edh/KGAyA6LXMhT56ij3CfDaJOTJBY1RKVB2cvpCJN76Gk6G2NoQaiSWW1cl
         jky5H5iaLFNzkrQDcbhgUj1DHmj5IrTZP0hzstde54e+V/253NuaeBcbtrVVNP0XcuYh
         aNJp8B6FyXB69UgWH32EROvmUS7PHMIz/7+WcOaiEfheiZdUSCthVXV5rvJvI0eWPX/c
         wR82PEnSllNffBtAPftvYZKaiuxnjQ++ROKNUmpuTaTfuwV/BMK1FJd5ttBXRD340F5V
         NGyg==
X-Gm-Message-State: AOAM531Upusw7DFpAAEa/4gwbCvavsMAquU33Cy4+OWfpZOgnTDI1Il+
        Ij2HhCUUAg7MW8JbZaJiTbO1jJfDUc0=
X-Google-Smtp-Source: ABdhPJxQYzbnkr2VsFui2l1Oxt/SV2sJMBEhp4qYiPsxte9H/gIZTEl3Yb52kVtsXrPQnaBocLKF2w==
X-Received: by 2002:ab0:688a:: with SMTP id t10mr2029690uar.75.1589826155848;
        Mon, 18 May 2020 11:22:35 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id h23sm3011345uap.7.2020.05.18.11.22.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2020 11:22:35 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id u2so2428241vsi.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 11:22:34 -0700 (PDT)
X-Received: by 2002:a67:d199:: with SMTP id w25mr5312377vsi.169.1589826154516;
 Mon, 18 May 2020 11:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200506140208.v2.1.Ibc8eeddcee94984a608d6900b46f9ffde4045da4@changeid>
 <CAF6AEGvXkeOrHGMHo=C1zXhDc9rquQJc8oGDB4VDfhTfdtqyTg@mail.gmail.com>
In-Reply-To: <CAF6AEGvXkeOrHGMHo=C1zXhDc9rquQJc8oGDB4VDfhTfdtqyTg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 18 May 2020 11:22:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V9Aphv=sV36CcK=ka2zNh7Hwiog4qiUEC7wpgjqYSi5Q@mail.gmail.com>
Message-ID: <CAD=FV=V9Aphv=sV36CcK=ka2zNh7Hwiog4qiUEC7wpgjqYSi5Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/bridge: ti-sn65dsi86: Implement lane
 reordering + polarity
To:     Rob Clark <robdclark@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Rob Clark <robdclark@chromium.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sam,

On Fri, May 15, 2020 at 2:43 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Wed, May 6, 2020 at 2:03 PM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > The ti-sn65dsi86 MIPI DSI to eDP bridge chip supports arbitrary
> > remapping of eDP lanes and also polarity inversion.  Both of these
> > features have been described in the device tree bindings for the
> > device since the beginning but were never implemented in the driver.
> > Implement both of them.
> >
> > Part of this change also allows you to (via the same device tree
> > bindings) specify to use fewer than the max number of DP lanes that
> > the panel reports.  This could be useful if your display supports more
> > lanes but only a few are hooked up on your board.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>
> Reviewed-by: Rob Clark <robdclark@gmail.com>

I guess get_maintainer is somehow not tagging you and I haven't got it
through my thick skull to CC you each time.  If you're willing, I
think this patch is ready too.  Happy to re-post it with you in the To
list if it helps.

-Doug
