Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1603F40B7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 07:44:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729895AbfKHGoh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 01:44:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:59902 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbfKHGoh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 01:44:37 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E868F21882;
        Fri,  8 Nov 2019 06:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573195477;
        bh=51RCMu1MiYJDTBePgqgqeZQyJIRjMshPhr4mlXze2fk=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=fY5cg7x80+6jRjvlwzGNp77jBXJexceFVpN+QIesOGJcQmj2Yh5HGh6XvoAYD12Il
         Obh9AO2w0/yoOQPjXBs4wS2qjcUUqMsqLBiny8OX/u5OwEXh2oitSqk7vzfs2lBeHV
         4tsRPHzgGCBW0ckvJFWt3EDkMSooTmEGAIpfgnos=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAOCk7NrHyY0+tF=90Z1WDa7VpgehDY7kHiqcR6g8K_P_uRpRQw@mail.gmail.com>
References: <20191031185538.15402-1-jeffrey.l.hugo@gmail.com> <20191031185715.15504-1-jeffrey.l.hugo@gmail.com> <20191107214352.8A82E2166E@mail.kernel.org> <CAOCk7NrHyY0+tF=90Z1WDa7VpgehDY7kHiqcR6g8K_P_uRpRQw@mail.gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-clk@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 1/3] clk: qcom: Allow constant ratio freq tables for rcg
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 22:44:36 -0800
Message-Id: <20191108064436.E868F21882@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jeffrey Hugo (2019-11-07 14:12:09)
> On Thu, Nov 7, 2019 at 2:43 PM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Jeffrey Hugo (2019-10-31 11:57:15)
> > > Some RCGs (the gfx_3d_src_clk in msm8998 for example) are basically j=
ust
> > > some constant ratio from the input across the entire frequency range.=
  It
> > > would be great if we could specify the frequency table as a single en=
try
> > > constant ratio instead of a long list, ie:
> > >
> > >         { .src =3D P_GPUPLL0_OUT_EVEN, .pre_div =3D 3 },
> > >         { }
> > >
> > > So, lets support that.
> > >
> > > We need to fix a corner case in qcom_find_freq() where if the freq ta=
ble
> > > is non-null, but has no frequencies, we end up returning an "entry" b=
efore
> > > the table array, which is bad.  Then, we need ignore the freq from the
> > > table, and instead base everything on the requested freq.
> > >
> > > Suggested-by: Stephen Boyd <sboyd@kernel.org>
> > > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > > ---
> >
> > Applied to clk-next and fixed the space thing. I guess ceil/floor
> > rounding isn't a problem?
> >
>=20
> Thanks for fixing the nit.
>=20
> Hmm.  Looking back at it, floor is only used with the rcg_floor_ops.
> Right now, you can't use a constant ratio table with rcg_floor_ops -
> looks like you'd probably hit a null pointer dereference.  I'm having
> trouble seeing how the floor operation would work with this constant
> ratio idea in a way that would be different than the normal rcg_ops.
> I think I would say that either you have a good reason for using the
> constant ratio table, in which case you should be using the normal
> rcg_ops, or you have a good reason for using floor which is then
> incompatible with a constant ratio table.  If you think that the
> constant ratio table concept should be applied to floor ops, can you
> please detail what you expect the behavior to be?

I don't think floor ops make sense. I just wanted to make sure that the
floor and ceiling stuff in here isn't going to cause problems. Looking
again after reading your response I think we're going to be fine.

