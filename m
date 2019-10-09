Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A66CFD1378
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 18:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731385AbfJIQCE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Oct 2019 12:02:04 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40020 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730503AbfJIQCD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Oct 2019 12:02:03 -0400
Received: by mail-lf1-f66.google.com with SMTP id d17so2073414lfa.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2019 09:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=17Y7y039jET7/TQrdZoED93OrqqyMRwnQxJ9vtZBzO8=;
        b=c9Atcn/EI08Kf2cBMOvlLq7SNQ707PZ6EdVeCazR/Dm8zc5uaCAs3UNj/GYvUqYqzJ
         aMXdTfRdgQTYmaPwcj4QiAuKEHKcxMD9ezuazTOGBACs29dqmx3rbJGAvaRpsxX26MTQ
         fdzuLGgOcX6EDmt6y6XBhXYz14ayEhIMnEfqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=17Y7y039jET7/TQrdZoED93OrqqyMRwnQxJ9vtZBzO8=;
        b=llOWnJQCFZjxiCxUtY40EvKNupQ/1Bul7en1PDGHYo1r0QBCdt/+2dj6NoTKx5wWMF
         jx3XmzLrKe6aQb8LzhtaXvYC92KXJsAtRePF+chklbGJVB5d1P5ONBh0z5Z4Q85umuqd
         +ZiPaymOfwjzBzEPw+T8+lTQecmH+OqjmalillzkUZZbJXonrhhMcTdUBqtZ9BpuHKTb
         fDP/p4hxNh0KQGEBuaejr8CsP92jiWaX7HEZvSD9C5HIrH90S1KsZZIUfgb1/syluLmL
         cE0bp5UqzgvIHELa6WH/YPzYz3k1dW1E78D47jST5TXUArSxvI0jUb0RJ03RYDU5/SKy
         8QJQ==
X-Gm-Message-State: APjAAAWi2NY2CraFIExmmbnG4N5poz9tyDsDK9K2NsZaQ0TzYGho4m3f
        QPZN2qEPuZIZhRFuB8H0fLT2gojgU4M=
X-Google-Smtp-Source: APXvYqxcwMsxsKgEYErrj8hWLxb01eCmTv0D0VIexn4/1/jvCDfTvCD1mh6XptbaN07m/dC/TskG1Q==
X-Received: by 2002:ac2:5453:: with SMTP id d19mr2633253lfn.89.1570636921092;
        Wed, 09 Oct 2019 09:02:01 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id i6sm565488lfc.37.2019.10.09.09.02.00
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2019 09:02:00 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id m13so3015618ljj.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2019 09:02:00 -0700 (PDT)
X-Received: by 2002:a2e:a41a:: with SMTP id p26mr2740656ljn.15.1570636919621;
 Wed, 09 Oct 2019 09:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20191008234505.222991-1-swboyd@chromium.org> <20191008235504.GN63675@minitux>
 <5d9d3ed4.1c69fb81.5a936.2b18@mx.google.com>
In-Reply-To: <5d9d3ed4.1c69fb81.5a936.2b18@mx.google.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Wed, 9 Oct 2019 09:01:22 -0700
X-Gmail-Original-Message-ID: <CAE=gft6SmWH3-Td-mZZPn-3=EzwexEdYTR00z5NCP-X1sspihA@mail.gmail.com>
Message-ID: <CAE=gft6SmWH3-Td-mZZPn-3=EzwexEdYTR00z5NCP-X1sspihA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Avoid regmap debugfs collisions in qcom llcc driver
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 8, 2019 at 6:58 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Bjorn Andersson (2019-10-08 16:55:04)
> > On Tue 08 Oct 16:45 PDT 2019, Stephen Boyd wrote:
> > >     @@ drivers/soc/qcom/llcc-slice.c
> > >
> > >       static struct llcc_drv_data *drv_data = (void *) -EPROBE_DEFER;
> > >
> > >     --static const struct regmap_config llcc_regmap_config = {
> > >     +-static struct regmap_config llcc_regmap_config = {
> > >      -        .reg_bits = 32,
> > >      -        .reg_stride = 4,
> > >      -        .val_bits = 32,
> > >     @@ drivers/soc/qcom/llcc-slice.c: static struct regmap *qcom_llcc_init_mmio(struct
> > >       {
> > >               struct resource *res;
> > >               void __iomem *base;
> > >     -+        static struct regmap_config llcc_regmap_config = {
> > >     ++        struct regmap_config llcc_regmap_config = {
> >
> > Now that this isn't static I like the end result better. Not sure about
> > the need for splitting it in two patches, but if Evan is happy I'll take
> > it.
> >
>
> Well I split it into bug fix and micro-optimization so backport choices
> can be made. But yeah, I hope Evan is happy enough to provide a
> reviewed-by tag!

It's definitely better without the static local since it no longer has
the cognitive trap, but I still don't really get why we're messing
with the global v. local aspect of it. We're now inconsistent with
every other caller of this function, and for what exactly? We've
traded some data space for a call to memset() and some instructions. I
would have thought anecdotally that memory was the cheaper thing (ie
cpu speeds stopped increasing awhile ago, but memory is still getting
cheaper).

But either way it's correct, so really it's fine if you ignore me :)
-Evan
