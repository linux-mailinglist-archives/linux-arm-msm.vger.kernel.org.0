Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED62E39824C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 08:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbhFBG76 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 02:59:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:44570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229955AbhFBG75 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 02:59:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0158F60FDA;
        Wed,  2 Jun 2021 06:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622617095;
        bh=txv+la2kohw7oxTrtxAG2QM64KnaR/i2kauGYQpaw6I=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PjEYlKT9z5a2teYyRQcyEU+TJ/MxGxIh2s/0QOkdW8+BTte7jI+vN+IWFWYHt1G5u
         SceFiQgosn0ggw3EBEGnwtBux6I/SJvVEFsWCyNqO91bDkUEy7StaOhFesDu6jc1KK
         sQLRj8X3NT0uQdqCfatXbg1GfHhFp6ubODOQaDInUE01gZPFG7EUo51wx6fBHKHPrw
         nZ9uQSnynhYR6HrOuyo4ALWT0lvG0HxbOMLWlTGkaV6VmUCBIfaVC5pLrUQtY2cXY8
         OpCpsB+uvkP7UXTnKgx5a/WK4rtxJbkLPhPBR+nC0sLwbH2OxnpGjnHRTK5iE4Q4A/
         0KEw2ohL5kK8A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <162261690404.4130789.10296098922791923637@swboyd.mtv.corp.google.com>
References: <1619519590-3019-1-git-send-email-tdas@codeaurora.org> <1619519590-3019-2-git-send-email-tdas@codeaurora.org> <20210503191837.GA2220566@robh.at.kernel.org> <162261690404.4130789.10296098922791923637@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: Add SC7280 DISPCC clock binding
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette =?utf-8?q?=C2=A0?= <mturquette@baylibre.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
To:     Rob Herring <robh@kernel.org>, Taniya Das <tdas@codeaurora.org>
Date:   Tue, 01 Jun 2021 23:58:13 -0700
Message-ID: <162261709373.4130789.1672298535915353982@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Stephen Boyd (2021-06-01 23:55:04)
> Quoting Rob Herring (2021-05-03 12:18:37)
> > On Tue, Apr 27, 2021 at 04:03:05PM +0530, Taniya Das wrote:
> > > diff --git a/include/dt-bindings/clock/qcom,dispcc-sc7280.h b/include=
/dt-bindings/clock/qcom,dispcc-sc7280.h
> > > new file mode 100644
> > > index 0000000..2074b30
> > > --- /dev/null
> > > +++ b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
> > > @@ -0,0 +1,55 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> >=20
> > Dual license please. I'm tired of telling the company that complained t=
o=20
> > me about having dual licensing for DT stuff not dual license their
> > stuff. Please pass that on to your coworkers.
> >=20
>=20
> Taniya, is this going to be resent?

Also, can you update the gcc binding that was already merged?
