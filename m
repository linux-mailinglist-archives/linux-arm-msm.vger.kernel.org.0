Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89939402ED7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Sep 2021 21:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346003AbhIGTPa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Sep 2021 15:15:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345991AbhIGTP3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Sep 2021 15:15:29 -0400
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BC26C061757
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Sep 2021 12:14:23 -0700 (PDT)
Received: by mail-il1-x133.google.com with SMTP id i13so176522ilm.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Sep 2021 12:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wptDSYLyDM12oE9PwIaapQVmJMO09viAmQFPtSVPYek=;
        b=g6tHrIqYCpyi3uj+Y8V0ZzItGWMeRuxbj7UZPUdqo9Ry/Sn6Ke28/Dg30vmx4JzCqo
         P666Khn7t7fmoEngyabMLFpP8CPK0f0OV9XBYX8VYiMK7gPoOcmKMoEVfQg4SzTjJ3l8
         Br8oh0YDph1cvQZS95VDMXVGHdGTntHbICFKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wptDSYLyDM12oE9PwIaapQVmJMO09viAmQFPtSVPYek=;
        b=bIbsxKzXZKWNT84L/t3FKbkKR8ul4psVJYd4QLOVwSNAcq5GHJxjHhpkn3PitrO7wW
         Q1FgaLJd+DHLVL7uSvbXWsNES8J4VYv1Jg8o0ICvHxyhsGMyrQAP8Bb1FiS0LiaNqfgW
         N1aV6I0EhGgKlFwc7gwflhhydIgQfc9gL8nHEuDO+/IZUzxfPHw8I204WTz7R0A2OaIM
         Cny/llQ4NoY0Oe1cfYI5aLgMd8fqdMWDhlkpu07MzmVgTqTQg0huz1mfnKtnXSCTC6xT
         aWAJtHiCDC+Btc4lLOZImBhYkS9Us03ya2Z7yBp0qHlT5uD/9TC79E9kaRcGVcya9vn/
         pREA==
X-Gm-Message-State: AOAM531gc3lxO5+HY/A7cUudmtwDmp8O3O8+pMsz63owNBLdomSAPiWe
        dfhJ5ASgCyAYzx2GES0sXPO2wt9AmQi6JA==
X-Google-Smtp-Source: ABdhPJz9W98dZNyDlGL625FYKhiYM9UEIjRJfl4hpk7DOtnUIcKO6cRaYmDCYnkHIKxW7i8X4B4+xg==
X-Received: by 2002:a05:6e02:1564:: with SMTP id k4mr13254847ilu.146.1631042062373;
        Tue, 07 Sep 2021 12:14:22 -0700 (PDT)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com. [209.85.166.172])
        by smtp.gmail.com with ESMTPSA id i20sm5601121ila.62.2021.09.07.12.14.21
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 12:14:21 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id a1so162665ilj.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Sep 2021 12:14:21 -0700 (PDT)
X-Received: by 2002:a92:6b0a:: with SMTP id g10mr3631557ilc.27.1631042060676;
 Tue, 07 Sep 2021 12:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <1627581885-32165-1-git-send-email-sibis@codeaurora.org>
 <1627581885-32165-4-git-send-email-sibis@codeaurora.org> <YS5LDb4KDFx/dRnM@google.com>
 <YS5hDq+xblntYbh0@ripper> <fde7bac239f796b039b9be58b391fb77@codeaurora.org>
In-Reply-To: <fde7bac239f796b039b9be58b391fb77@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 7 Sep 2021 12:14:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XHzwvudc4jABHVUC0OkKat-xdvo5yY2xRJ0VP5gds91w@mail.gmail.com>
Message-ID: <CAD=FV=XHzwvudc4jABHVUC0OkKat-xdvo5yY2xRJ0VP5gds91w@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc7280: Fixup the cpufreq node
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sun, Sep 5, 2021 at 8:20 PM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> On 2021-08-31 22:34, Bjorn Andersson wrote:
> > On Tue 31 Aug 08:30 PDT 2021, Matthias Kaehlcke wrote:
> >
> >> On Thu, Jul 29, 2021 at 11:34:44PM +0530, Sibi Sankar wrote:
> >> > Fixup the register regions used by the cpufreq node on SC7280 SoC to
> >> > support per core L3 DCVS.
> >> >
> >> > Fixes: 7dbd121a2c58 ("arm64: dts: qcom: sc7280: Add cpufreq hw node")
> >> > Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> >>
> >> This patch landed in the Bjorn's tree, however the corresponding
> >> driver
> >> change ("cpufreq: qcom: Re-arrange register offsets to support per
> >> core
> >> L3 DCVS" /
> >> https://patchwork.kernel.org/project/linux-arm-msm/patch/1627581885-32165-3-git-send-email-sibis@codeaurora.org/)
> >> did not land in any maintainer tree yet AFAIK. IIUC the DT change
> >> alone
> >> breaks cpufreq since the changed register regions require the changed
> >> offset in the cpufreq driver.
> >>
> >
> > Thanks for the note Matthias, it must have slipped by as I scraped the
> > inbox for things that looked ready.
> >
> > I'm actually not in favor of splitting these memory blocks in DT to
> > facilitate the Linux implementation of splitting that in multiple
> > drivers...
> >
> > But I've not been following up on that discussion.
> >
> > Regards,
> > Bjorn
> >
> >> Sibi, please confirm or clarify that my concern is unwarranted.
>
> Let's drop the patch asap as it breaks
> SC7280 cpufreq on lnext without the driver
> changes.

It's already landed so we need a revert:

https://lore.kernel.org/r/20210907121220.1.I08460f490473b70de0d768db45f030a4d5c17828@changeid/

-Doug
