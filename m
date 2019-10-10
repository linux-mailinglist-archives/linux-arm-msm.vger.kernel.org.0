Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E42A1D1F24
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 05:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732252AbfJJD6B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Oct 2019 23:58:01 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45567 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726722AbfJJD6A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Oct 2019 23:58:00 -0400
Received: by mail-pl1-f194.google.com with SMTP id u12so2083314pls.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2019 20:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yCBdvs8Jwa4VDHxDVMtxSZywytfhhhvE/gNvUzK59Sg=;
        b=FEpH5vFgHGLCreqL5r4bs7SmKkP36vBz0MrW9FclpZUgbtvvEPkVvUGYqhdViiKokZ
         RxyexodfIs6bIGkx40fmCLJNeERf44jsytAqg9qHRLoQSWrYX2F64dSZjgA+swnvd0xc
         mPdkvg1f8fS3b5A5MIdv3/e0vqnoF1FxU1gTydMLEqG1XqikpqNEHASO4p2GC4KR/JYR
         2xICkptpoXWyvyoJdgSvpAjSpokTT66S0BbtK09iNYTw9N6lVpz2JX1TskOC9w/9eqP/
         0KqAg/Ve/rUAkQAbDhIsVIwddPGRQTvNVoqKEAfmLemzzv2exwoh2UVJNgMWAJHiJye8
         SlEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yCBdvs8Jwa4VDHxDVMtxSZywytfhhhvE/gNvUzK59Sg=;
        b=lc4APANV2E5wqd64ZlV+POw2v0f5jBpFdYokR2R5mr14otnLDn9Qr4MjkciB6rj4eL
         fJCIk2KsnlTRELzcM6cWZOhEn6n4I84Znlbk8Q8ODZvNa0u//doAJyWn1HXoBwFcHc6D
         dd/wV8va0HBFbaG4QpDGmtLUxdAxbQwwB1ccryBX9i4e32Z63HslutpAAnIhNcFc/sao
         PsdCwY+kHmqRb3kBE8lZKU9QuROVUcwLUu75jsRotVlR0V6syNzdi2xDETcbWR4oZ/Co
         +ljQ+AI2H5w+W5AIq75gzHqEXHxnk93cqPnBgE1Y16SmQ1lQ4n2odmWb9ymgwXaFeMIx
         gbFA==
X-Gm-Message-State: APjAAAVmvd4lS000rnbYpi0tK5h7fMZo85kXudoIpmzrPty47fhKKCf9
        vaKzfiROBaQSlBkbBaHlDGRBtsuLVU0=
X-Google-Smtp-Source: APXvYqwrjD+eNGeAY4orJiDSqtPDPRYaXVK8xhcPyGwnRFCFwxeZwpNJDxmSq5bBL9A+5eqDU0f9kQ==
X-Received: by 2002:a17:902:7202:: with SMTP id ba2mr7050650plb.267.1570679879840;
        Wed, 09 Oct 2019 20:57:59 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v1sm5423513pjd.22.2019.10.09.20.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 20:57:59 -0700 (PDT)
Date:   Wed, 9 Oct 2019 20:57:56 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Evan Green <evgreen@chromium.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Subject: Re: [PATCH v2 0/2] Avoid regmap debugfs collisions in qcom llcc
 driver
Message-ID: <20191010035756.GO6390@tuxbook-pro>
References: <20191008234505.222991-1-swboyd@chromium.org>
 <20191008235504.GN63675@minitux>
 <5d9d3ed4.1c69fb81.5a936.2b18@mx.google.com>
 <CAE=gft6SmWH3-Td-mZZPn-3=EzwexEdYTR00z5NCP-X1sspihA@mail.gmail.com>
 <20191009174622.GN6390@tuxbook-pro>
 <CAE=gft53-N+kWZKQO6YRAT0NBX_zrGYkqTUWOGrK2mT5Krf+3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE=gft53-N+kWZKQO6YRAT0NBX_zrGYkqTUWOGrK2mT5Krf+3w@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 09 Oct 10:59 PDT 2019, Evan Green wrote:

> On Wed, Oct 9, 2019 at 10:46 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Wed 09 Oct 09:01 PDT 2019, Evan Green wrote:
> >
> > > On Tue, Oct 8, 2019 at 6:58 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > > >
> > > > Quoting Bjorn Andersson (2019-10-08 16:55:04)
> > > > > On Tue 08 Oct 16:45 PDT 2019, Stephen Boyd wrote:
> > > > > >     @@ drivers/soc/qcom/llcc-slice.c
> > > > > >
> > > > > >       static struct llcc_drv_data *drv_data = (void *) -EPROBE_DEFER;
> > > > > >
> > > > > >     --static const struct regmap_config llcc_regmap_config = {
> > > > > >     +-static struct regmap_config llcc_regmap_config = {
> > > > > >      -        .reg_bits = 32,
> > > > > >      -        .reg_stride = 4,
> > > > > >      -        .val_bits = 32,
> > > > > >     @@ drivers/soc/qcom/llcc-slice.c: static struct regmap *qcom_llcc_init_mmio(struct
> > > > > >       {
> > > > > >               struct resource *res;
> > > > > >               void __iomem *base;
> > > > > >     -+        static struct regmap_config llcc_regmap_config = {
> > > > > >     ++        struct regmap_config llcc_regmap_config = {
> > > > >
> > > > > Now that this isn't static I like the end result better. Not sure about
> > > > > the need for splitting it in two patches, but if Evan is happy I'll take
> > > > > it.
> > > > >
> > > >
> > > > Well I split it into bug fix and micro-optimization so backport choices
> > > > can be made. But yeah, I hope Evan is happy enough to provide a
> > > > reviewed-by tag!
> > >
> > > It's definitely better without the static local since it no longer has
> > > the cognitive trap, but I still don't really get why we're messing
> > > with the global v. local aspect of it. We're now inconsistent with
> > > every other caller of this function, and for what exactly? We've
> > > traded some data space for a call to memset() and some instructions. I
> > > would have thought anecdotally that memory was the cheaper thing (ie
> > > cpu speeds stopped increasing awhile ago, but memory is still getting
> > > cheaper).
> > >
> >
> > The reason for making the structure local is because it's being modified
> > per instance, meaning it would still work as long as
> > qcom_llcc_init_mmio() is never called concurrently for two llcc
> > instances. But the correctness outweighs the performance degradation of
> > setting it up on the stack in my view.
> >
> 
> I hadn't considered the concurrency aspect of the change, since I had
> anchored myself on the static local. I'm convinced. Might be worth
> mentioning that in the commit message.
> 
> For the series:
> Reviewed-by: Evan Green <evgreen@chromium.org>

Thank you, patches applied.

Regards,
Bjorn
