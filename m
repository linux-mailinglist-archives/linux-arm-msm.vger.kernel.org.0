Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B27194FFCD2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 19:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235867AbiDMRe4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Apr 2022 13:34:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234041AbiDMRez (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Apr 2022 13:34:55 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB6C05D18E
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 10:32:33 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id 3so1995635qkj.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 10:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lnc7mWmtp/Azs9P18utqeeE6j4zrR2fYMw+BED1tF5s=;
        b=J6eYBfQKjOy6jVLE36Cda2NZLMx47kPxDFrqsMRFPkJSRGzzThvW9GqhxKirDebC/q
         123Yksrk0P6DcFZ9TjhrUtvgvVnnIQVMYMT1onwi31/8r9bx+nhgzGn/oA0TBiR19Urf
         2VqXq9APr6Tl+xZE+y4uFW/u+ES6DHL0aFztBq6Z0agGnKHizRcfsIRftsIES1Cph8k/
         muCxkCOcZP8uqS0y1jpOUKoC3psNW5sJ/HKFWO6xUhuHKGmPzSn7Qw4ZqHAgRG3i21v4
         8mVBZ1y362cfcjPhD/QFI93Y2dbgtlLNLxd8Em8JJ1yNk4aisBqayd9ccQBxS7lsLKyn
         RJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lnc7mWmtp/Azs9P18utqeeE6j4zrR2fYMw+BED1tF5s=;
        b=mLKaOF1O+irG7DR8RKauyvDRwTxOe8W9JtdkhIRzzNXkRv8fcCwwkib1qcn7H8dyGK
         EE6pKGPU9xH92woaR6pVI2Rnz52pL3sWt79DXjFXbHOnXyAmwxGezLC5aU8ArhZhi5bo
         g/NYzYhnt1HM06vppfomSC61P1JivZnT9Tu7fKNc6EGYg3QPeM9Y9HNb9XL520nCh5L9
         e4/a4Cs/hbQx3rrGQsCQRxYhEKBeCBUftfzG4wAesTceUHT5eqV0sY5Pg3hKrHQSCwnz
         sD60vhGS/8LwUelVfKXAzQI0FYov9Q0Q/SNQ9NZcxUhYzFZ13V3T1fmhl4KRLfVacDuE
         AX8w==
X-Gm-Message-State: AOAM533nTC8WBRwkS2cDh3tiNBuWItbTofuWH15e+Zta9UT4ycR/e/yt
        GyxSpnIKAryYAwkre1Ef97Qk2+3/PZYmRkGF4slSEA==
X-Google-Smtp-Source: ABdhPJxYfZjEo46v3aVp9XZYR4cLwdKA7VuBp8VEVH9paA23dAWnOwozb899wXJL0wKh4nDTSipKXllV+x1CIWarPjs=
X-Received: by 2002:a05:620a:170e:b0:69c:3721:b8e6 with SMTP id
 az14-20020a05620a170e00b0069c3721b8e6mr7617658qkb.593.1649871153077; Wed, 13
 Apr 2022 10:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220321231548.14276-1-ansuelsmth@gmail.com> <20220321231548.14276-4-ansuelsmth@gmail.com>
 <20220325011037.03173C340EC@smtp.kernel.org> <Yj0XTYgoMScoiUHP@Ansuel-xps.localdomain>
 <20220325012231.899FBC340EC@smtp.kernel.org> <62570197.1c69fb81.c3de2.7b70@mx.google.com>
In-Reply-To: <62570197.1c69fb81.c3de2.7b70@mx.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 13 Apr 2022 20:32:21 +0300
Message-ID: <CAA8EJpp2uipTtV=gitiL0g-ywOirC=-UGrQ4tZMwc42jy2TK1Q@mail.gmail.com>
Subject: Re: [PATCH v6 03/18] clk: qcom: gcc-ipq806x: add PXO_SRC in clk table
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 13 Apr 2022 at 20:00, Ansuel Smith <ansuelsmth@gmail.com> wrote:
>
> On Thu, Mar 24, 2022 at 06:22:29PM -0700, Stephen Boyd wrote:
> > Quoting Ansuel Smith (2022-03-24 18:13:49)
> > > On Thu, Mar 24, 2022 at 06:10:35PM -0700, Stephen Boyd wrote:
> > > > Quoting Ansuel Smith (2022-03-21 16:15:33)
> > > > > PXO_SRC is currently defined in the gcc include and referenced in the
> > > > > ipq8064 DTSI. Correctly provide a clk after gcc probe to fix kernel
> > > > > panic if a driver starts to actually use it.
> > > > >
> > > > > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > > > > ---
> > > >
> > > > What is this patch about? clk providers shouldn't be calling clk_get().
> > > >
> > >
> > > If pxo is passed as a clock in dts and defined as a fixed clock, what
> > > should be used?
> >
> > clk_parent_data
>
> Sorry but I'm not following you. No idea if you missed the cover letter
> where i describe the problem with PXO_SRC.
>
> The problem here is that
> - In DTS we have node that reference <&gcc PXO_SRC>
> But
> - gcc driver NEVER defined PXO_SRC
> As
> - PXO_SRC is actually pxo_board that should be defined as a fixed-clock
>   in dts or is defined using qcom_cc_register_board_clk.
>
> So in theory we should just put in PXO_SRC the clk hw of the
> fixed-clock. That is why I'm using clk_get(). I can use __clk_lookup()
> as an alternative but I really can't find a way to get the clock defined
> from DTS or qcom_cc_register_board_clk.
>
> (I have the same exact problem with the cpu qsb clock where is defined
> using fixed-clock API but can also defined directly in DTS and I have to
> use clk_get())
>
> I'm totally missing something so I would love some hint on how to solve
> this.

When we were doing such conversion for other  platforms, we pointed
clock consumers to the board clocks directly. There is no need to go
through the gcc to fetch pxo.
Instead you can use a <&pxo_board> in the dts directly. Typically the
sequence is the following:
- Minor cleanup of the clock-controller driver
(ARRAY_SIZE(parent_data), removal of unused clock sources, unused enum
entries, etc)
- update drivers to use both .name and  .fw_name in replacement of
parent_names. Use parent_hws where possible.
- update dtsi to reference clocks using clocks/clock-names properties.
Pass board/rpmh/rpm clocks directly to their consumers without
bandaids in the gcc driver.
- (optionally) after several major releases drop parent_data.name
completely. I think we mostly skipped this, since it provides no gain.

This way you don't have to play around clk_get to return PXO_SRC from
gcc clock-controller.

-- 
With best wishes
Dmitry
