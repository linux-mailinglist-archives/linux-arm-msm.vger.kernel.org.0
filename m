Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BF78D173B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 20:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731072AbfJISAM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Oct 2019 14:00:12 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37385 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729865AbfJISAM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Oct 2019 14:00:12 -0400
Received: by mail-lj1-f195.google.com with SMTP id l21so3436549lje.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2019 11:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YmeJKDAW2I1yruAY3lk0iKjTiIjTCk6xnz0bx6eLJkE=;
        b=XMrdMa5P0q1bpVT/YQRnvcSKOWRUN0f0eZRKmI7S0MK6/Uf2O8KITsEALxVxHVbbh8
         WSVOOol/gviCdzpPsJeQZ9KYe4hJRDsZlXKOFRkUAnyHfVoTY9JKZbRSz68oJQxnIngB
         IFJB85PFJahGQ+uE43aCf5Huxucwr1DomVkeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YmeJKDAW2I1yruAY3lk0iKjTiIjTCk6xnz0bx6eLJkE=;
        b=JHmxH7FZliVW8oYFyXVaUb2CmqUUdoNbjiAMar3509nFRGv+KLhcNVgzfOvErKm5dp
         eySn/kW/XarZm7QpQuhOOg8xZLwnKTGLHd3GxOPJ8EtqvvN1MKUUjoVD3BNdoHZtDNBP
         5uyxcLaxcHacwCJEdQtuR0Lqqspn0zpU/8XIybVeSFWUPhuD9+4EmswP8M8wtpdAuc2O
         /sCscktvaAbdxGGJPr+Fa5K4D1DqvC752XESbYpfK36XYx+FHHICc4QHPIvZbt0p0NFP
         UXY6Lf9oj81uzcbRsnCUC+kwp9tC5NekHbFA8DQfIP/LSbKBMH6vIGJIsN3rUclyJGNA
         PFaQ==
X-Gm-Message-State: APjAAAWqJ3pSKmuu0Cj59Y2nAJmtg8ovYXZrbLcZ8PyX8aarQ7nUna3y
        0l0V7bKdrwGdZoc6pDI3giEKQLP+OCQ=
X-Google-Smtp-Source: APXvYqxcZ/2cjo+KErUcfowmUyimUHlyR8T4eIB2pvvHPaRp0CQJV7nSBEZVCgUNIjPaV02TsaAx4g==
X-Received: by 2002:a2e:9f4d:: with SMTP id v13mr2797789ljk.180.1570644009204;
        Wed, 09 Oct 2019 11:00:09 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id o5sm644031lfn.42.2019.10.09.11.00.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2019 11:00:08 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 7so3418750ljw.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2019 11:00:08 -0700 (PDT)
X-Received: by 2002:a2e:584b:: with SMTP id x11mr3244996ljd.36.1570644007544;
 Wed, 09 Oct 2019 11:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <20191008234505.222991-1-swboyd@chromium.org> <20191008235504.GN63675@minitux>
 <5d9d3ed4.1c69fb81.5a936.2b18@mx.google.com> <CAE=gft6SmWH3-Td-mZZPn-3=EzwexEdYTR00z5NCP-X1sspihA@mail.gmail.com>
 <20191009174622.GN6390@tuxbook-pro>
In-Reply-To: <20191009174622.GN6390@tuxbook-pro>
From:   Evan Green <evgreen@chromium.org>
Date:   Wed, 9 Oct 2019 10:59:30 -0700
X-Gmail-Original-Message-ID: <CAE=gft53-N+kWZKQO6YRAT0NBX_zrGYkqTUWOGrK2mT5Krf+3w@mail.gmail.com>
Message-ID: <CAE=gft53-N+kWZKQO6YRAT0NBX_zrGYkqTUWOGrK2mT5Krf+3w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Avoid regmap debugfs collisions in qcom llcc driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 9, 2019 at 10:46 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed 09 Oct 09:01 PDT 2019, Evan Green wrote:
>
> > On Tue, Oct 8, 2019 at 6:58 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Quoting Bjorn Andersson (2019-10-08 16:55:04)
> > > > On Tue 08 Oct 16:45 PDT 2019, Stephen Boyd wrote:
> > > > >     @@ drivers/soc/qcom/llcc-slice.c
> > > > >
> > > > >       static struct llcc_drv_data *drv_data = (void *) -EPROBE_DEFER;
> > > > >
> > > > >     --static const struct regmap_config llcc_regmap_config = {
> > > > >     +-static struct regmap_config llcc_regmap_config = {
> > > > >      -        .reg_bits = 32,
> > > > >      -        .reg_stride = 4,
> > > > >      -        .val_bits = 32,
> > > > >     @@ drivers/soc/qcom/llcc-slice.c: static struct regmap *qcom_llcc_init_mmio(struct
> > > > >       {
> > > > >               struct resource *res;
> > > > >               void __iomem *base;
> > > > >     -+        static struct regmap_config llcc_regmap_config = {
> > > > >     ++        struct regmap_config llcc_regmap_config = {
> > > >
> > > > Now that this isn't static I like the end result better. Not sure about
> > > > the need for splitting it in two patches, but if Evan is happy I'll take
> > > > it.
> > > >
> > >
> > > Well I split it into bug fix and micro-optimization so backport choices
> > > can be made. But yeah, I hope Evan is happy enough to provide a
> > > reviewed-by tag!
> >
> > It's definitely better without the static local since it no longer has
> > the cognitive trap, but I still don't really get why we're messing
> > with the global v. local aspect of it. We're now inconsistent with
> > every other caller of this function, and for what exactly? We've
> > traded some data space for a call to memset() and some instructions. I
> > would have thought anecdotally that memory was the cheaper thing (ie
> > cpu speeds stopped increasing awhile ago, but memory is still getting
> > cheaper).
> >
>
> The reason for making the structure local is because it's being modified
> per instance, meaning it would still work as long as
> qcom_llcc_init_mmio() is never called concurrently for two llcc
> instances. But the correctness outweighs the performance degradation of
> setting it up on the stack in my view.
>

I hadn't considered the concurrency aspect of the change, since I had
anchored myself on the static local. I'm convinced. Might be worth
mentioning that in the commit message.

For the series:
Reviewed-by: Evan Green <evgreen@chromium.org>
