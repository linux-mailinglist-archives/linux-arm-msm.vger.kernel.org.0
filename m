Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E551A155907
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 15:11:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgBGOLH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 09:11:07 -0500
Received: from mail-io1-f42.google.com ([209.85.166.42]:41641 "EHLO
        mail-io1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbgBGOLH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 09:11:07 -0500
Received: by mail-io1-f42.google.com with SMTP id m25so2299624ioo.8;
        Fri, 07 Feb 2020 06:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hwAVc8buUw/sXi4l5AGn5t8v/Of6qVn4+kM7CimiWbs=;
        b=RiThLvRaLcY+VY1nLgFfR8Wc7ihO/J62UUWv3LUtuTcFUBZfZCQF9Db7FXUxLoxK1C
         MvU9Z3ZTiELbj071a88cJKvn106vCNg7tFw+35XrbOrgfQ1m7ZBDZ9tlc1Mt+HV4TgfZ
         xBsn5/FxnhZ7cZqQmjCc03kKSe0O1SJl7A+E41hp5Qg58Sj8/eixwP9rZrj2fJT5Ps2+
         rHVvQYpZMaOqfhMCiKWYivGnJY+rV38VK1kfUfoWETqfaa2ZUU/U/feyqdsy0tTiWGtw
         arb9C21VMXHDNZAlH6y/vlbRmDtE59FkdRmkyxayDazwYJuuUE8gs6/lfwQsR0SILMDV
         0yew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hwAVc8buUw/sXi4l5AGn5t8v/Of6qVn4+kM7CimiWbs=;
        b=h6E6I1tkZoBDrMGlVRcuvuI9SPyWwrZLajUI4uck9J4Bwlj0DtQVsUPwuleTMuwZy/
         dI8OZ9BVkcnBLHe7aDWoTH1dTPbUJDS4fOAP0DzUv96dIcN0vT8w3lnEMvPFe2uafGrg
         CImfn2GRUDaJhyYZBpSa/pgNo7BCmCp3KqjrRYUs9az1hpxTHs7Qr7F3ig+v7OK9T4yO
         R0HWCLMAIgIdJENAgJWxdjjg37fk4w6u/GYSS4ttoTNQIbySC8Prdwbhw70IF5J+s5dI
         KxT+H0Z/MJYxfY47D0LywxmqBLBq2uPVckeWr/FMMOrxn9/MOAUgZWvl0b1jQQeNepmw
         sP7g==
X-Gm-Message-State: APjAAAU20wMUaMv4VFp6BBuLL1VdJ5W4NvvbkaTgaBSBKSJLkEk3cIVD
        UqcE62eEUzBip5R0w7SBQuRWsmTpvpa43YVSkLY=
X-Google-Smtp-Source: APXvYqx3j7zH+QaAUuEIZqF5KOX67+KACiYeFAz54D60MjqYLdvguyv/8mRyGFXbS5DW7jigB5BO9WpWi0BjLQzMaTc=
X-Received: by 2002:a5d:8c89:: with SMTP id g9mr3170240ion.178.1581084666491;
 Fri, 07 Feb 2020 06:11:06 -0800 (PST)
MIME-Version: 1.0
References: <1580980321-19256-1-git-send-email-harigovi@codeaurora.org>
 <CAOCk7Nr9n-xLtWq=LEM-QFhJcY+QOuzazsoi-yjErA9od2Jwmw@mail.gmail.com> <2f5abc857910f70faa119fea5bda81d7@codeaurora.org>
In-Reply-To: <2f5abc857910f70faa119fea5bda81d7@codeaurora.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Fri, 7 Feb 2020 07:10:55 -0700
Message-ID: <CAOCk7NoCH9p9gOd7as=ty-EMeerAAhQtKZa8f2wZrDeV2LtGrw@mail.gmail.com>
Subject: Re: [Freedreno] [v1] drm/msm/dsi/pll: call vco set rate explicitly
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        DTML <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>, nganji@codeaurora.org,
        Sean Paul <seanpaul@chromium.org>, kalyan_t@codeaurora.org,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 7, 2020 at 5:38 AM <harigovi@codeaurora.org> wrote:
>
> On 2020-02-06 20:29, Jeffrey Hugo wrote:
> > On Thu, Feb 6, 2020 at 2:13 AM Harigovindan P <harigovi@codeaurora.org>
> > wrote:
> >>
> >> For a given byte clock, if VCO recalc value is exactly same as
> >> vco set rate value, vco_set_rate does not get called assuming
> >> VCO is already set to required value. But Due to GDSC toggle,
> >> VCO values are erased in the HW. To make sure VCO is programmed
> >> correctly, we forcefully call set_rate from vco_prepare.
> >
> > Is this specific to certain SoCs? I don't think I've observed this.
>
> As far as Qualcomm SOCs are concerned, since pll is analog and the value
> is directly read from hardware if we get recalc value same as set rate
> value, the vco_set_rate will not be invoked. We checked in our idp
> device which has the same SOC but it works there since the rates are
> different.

This doesn't seem to be an answer to my question.  What Qualcomm SoCs
does this issue apply to?  Everything implementing the 10nm pll?  One
specific SoC?  I don't believe I've seen this on MSM8998, nor SDM845,
so I'm interested to know what is the actual impact here.  I don't see
an "IDP" SoC in the IP catalog, so I really have no idea what you are
referring to.
