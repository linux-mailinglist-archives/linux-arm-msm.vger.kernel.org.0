Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B694A2DF0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 16:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbfE2OAY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 May 2019 10:00:24 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:46444 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbfE2OAY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 May 2019 10:00:24 -0400
Received: by mail-io1-f51.google.com with SMTP id u25so1866362iot.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2019 07:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0VGl6o87phfM9urdx72wlD00hd105HAU2SoUY4M/gec=;
        b=n7vCz5/ga85hnXCXWPrBsYoZXqJrQUUaM5PX6J7rbWj8O1Tu4iGwZ3oJKQql/8hCoJ
         WoFfeOq2PNC2ClNuGx7WJd38k+FGv6+xbsFdNNT/tNvCKCRQP6OyuJjPAX8kP2aGMNA/
         ULlAPXO3JVNnFGS4dG8lBlyeNAwkwoQUZEgiDVS/fGHUQiKb2pWGOJBjwpLNwPU/ss1V
         lGW7cdLnkZ8s0IQ8+HcISgW0rgWEDFAEHhf+vt9aulPXkRyLueWp38t/zPCb/wXKfGz/
         oJQkE0Sy0E5GLWUwx0DviQOcxPxIk7PvLNZ9L3FNpdbRq8MkB2oMUvGKk5fRxFAsmoah
         /HfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0VGl6o87phfM9urdx72wlD00hd105HAU2SoUY4M/gec=;
        b=kaNkVwPK6Q39bvq5kcYwa9+lfc5VYEUu7lnIbVbRMyLUwEgXMSzzhi3pZLuXPqGgff
         2XK4wM1q1v9T1agaODmbfl+gUYRtlHgXI6y91pHlXGyil6O2SEQHMYZyaisQItVqh/+f
         9rzgCWQJxf/yn0BoUf4ssWO0AiShMfscERVTrCMtvanThPb6dBGKc3Wsyc/0wAtxepIo
         MUCuiRtv1q52KRy/+27gy49tv2odDC8gF/6S5PbnGNxIY7090CpkfT5GoGODBgvYd2+t
         teatjqEW2GIs7AMI3ESZZvZUGNBUmvAkK26zfwCAjosFm8Pvzwv5slSKi1pXApKRCys8
         VflA==
X-Gm-Message-State: APjAAAXpLsLxLgEXqAZgv6wf50QXsAJ38JUegq2DI8boWpvimXkrt/kS
        OmWSSqH1PCOHq7L73+ZLthr553sizto4EETYRO8=
X-Google-Smtp-Source: APXvYqww4nSWDXwWQQ6DYaUmh2jSjm3Da8rFrUV+OlBTVcEpOZrPD6vvAgo6J/eGU0ARWodKmnJaPIbUR+dvz1h9Nxk=
X-Received: by 2002:a5e:9513:: with SMTP id r19mr756808ioj.263.1559138422972;
 Wed, 29 May 2019 07:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190528164616.38517-1-jeffrey.l.hugo@gmail.com>
 <20190528164803.38642-1-jeffrey.l.hugo@gmail.com> <8117078a-68b0-97eb-14d9-10ca83e16cc9@free.fr>
In-Reply-To: <8117078a-68b0-97eb-14d9-10ca83e16cc9@free.fr>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Wed, 29 May 2019 08:00:10 -0600
Message-ID: <CAOCk7NpO5eWHH8H1zQU2-B9k+POYpRC_u82Lxr9JFVLjg-fJ1A@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: qcom: Add MSM8998 GPU Clock Controller (GPUCC) driver
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 29, 2019 at 3:46 AM Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:
>
> On 28/05/2019 18:48, Jeffrey Hugo wrote:
>
> > +//static struct clk_hw *gpucc_msm8998_hws[] = {
> > +//   &gpucc_cxo_clk.clkr.hw,
> > +//};
>
> Did you really intend to keep that commented-out code?

Nope.  I clearly didn't scrub these well enough from my work in
progress branch.  Funny, I'm pretty sure I ran checkpatch over them,
and checkpatch used to catch c++ style comments.  I wonder if that
changed.
Anyways.  Will fix.

>
> Sorry, can't really comment on the actual code, it's all way over my head.
>
> Regards.
