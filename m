Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4176B4768CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Dec 2021 04:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233409AbhLPDnm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 22:43:42 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:37706 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230521AbhLPDnm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 22:43:42 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 06EC9B82285;
        Thu, 16 Dec 2021 03:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8815EC36AE0;
        Thu, 16 Dec 2021 03:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639626219;
        bh=5hKoNaQ+HAwH+tSWORUY6f0I3DZPpBNvehXeSTCwacc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Cpj3tqo2QrfPHO3XWqN7gd7+sLQz9s/wuJTUctF4c+hNyxVQsLbVH/371v1mE88Mk
         86iDUiBrMxu0YIu9Qq1A+2qZ++HGwcXaJIu6RKsVR4KT0ZRiA38wDOpxTSD2F6Mwh6
         jFZiXVK6mvSKpSJcdioJr10b7H+snzr+Q0woU2qlmEmoYbNgeC8sOtLOtcBuWbpTk3
         UHi2jSb4SiCCYHjk4MOI5sPZYNxdehAfMg5Xl+GmEIjLSj3SbO94kQYxvXIGoE2R54
         qiCbtO2SeeW19r70SP1TpIDaJxFkKsuL+uinu3+RxXbs8Tm68x7JvBbbVTUhanml4J
         YcOx5ZPYvJPIw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211215201153.orgyt6mlmxryrdpn@SoMainline.org>
References: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org> <20211215193704.2821775-17-dmitry.baryshkov@linaro.org> <20211215201153.orgyt6mlmxryrdpn@SoMainline.org>
Subject: Re: [PATCH v3 16/16] clk: qcom: gcc-msm8996: start getting rid of xo clk
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Date:   Wed, 15 Dec 2021 19:43:38 -0800
User-Agent: alot/0.9.1
Message-Id: <20211216034339.8815EC36AE0@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Marijn Suijten (2021-12-15 12:11:53)
> On 2021-12-15 22:37:04, Dmitry Baryshkov wrote:
> > The "xo" fixed_factor clock is a leftover/hack from a time when we
> > couldn't make rpmhcc the root of all clocks. It is going to be removed
> > once all users of this clock are converted to use clocks specified
> > through the DTS. Replace internal usage of the xo clock with the cxo
> > (RPM_SMD_BB_CLK1) parent, specifying xo_board as a fallback.
>=20
> Nit: as mentioned in another reply I don't think rpmhcc is the sole
> problem why "xo" exists (xo_board exists to subustitute it for now).
> Rather, "xo" seems to be a remnant from an era where clock dependencies
> were not (fully) specified in DT but instead relied on fixed, well known
> global names for these inter-driver (inter-clock) dependencies.  Maybe
> this alias was needed to streamline the use of xo_board until rpmcc
> could be used though?

A long time ago, in a company far, far away... oh wait that's not it.

I was trying to get by without the rpm clk driver. The idea to express
relationships between clk controllers in DT didn't really take off for
another few years.

Registering the xo_board clk from the GCC driver eased these problems by
letting us set the parent of the gcc clks to an intermediary "xo" that
we could replace with the rpm version of that whenever the rpm clk
driver existed. It was also supposed to be a drop in replacement for
when rpm wasn't enabled, but nobody does that so that idea sort of fell
away. See commit a085f877a882 ("clk: qcom: Move cxo/pxo/xo into dt
files") and how the parent is ee15faffef11 ("clk: qcom: common: Add API
to register board clocks backwards compatibly").
