Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90B7C448B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 19:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393539AbfFMRKk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 13:10:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:41600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729338AbfFLWmz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 18:42:55 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4E2EA215EA;
        Wed, 12 Jun 2019 22:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560379374;
        bh=z/CM3q0QFgMafRlvcoS3yJRC23xA3AlrEPJbgJvH5jU=;
        h=In-Reply-To:References:To:From:Cc:Subject:Date:From;
        b=it7bebKmAU/aYbWt4bSiJsGg/sdkB5rSyh++hpwiSLWNO4i6j1hMYOfxYp7/GEA4+
         h2+nhiwQjFPzHccevwb1HC7ZkmI5eAqJw7haeVx8s/D2dlyC3GCGyuDksWlEerLwhw
         HWYRn+EMAcof7ivCZNgh8EWiOQedlZRd/8gYbcoU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <dc11a192-f8c6-f90f-8214-303291b03258@free.fr>
References: <49b95f19-4da6-4491-6ed7-5238ecfc35a8@free.fr> <20190612191347.GE22737@tuxbook-pro> <20190612194915.8F5DD20866@mail.kernel.org> <dc11a192-f8c6-f90f-8214-303291b03258@free.fr>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH v1] clk: qcom: msm8916: Don't build support by default
User-Agent: alot/0.8.1
Date:   Wed, 12 Jun 2019 15:42:53 -0700
Message-Id: <20190612224254.4E2EA215EA@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Marc Gonzalez (2019-06-12 13:03:22)
> On 12/06/2019 21:49, Stephen Boyd wrote:
>=20
> > Quoting Bjorn Andersson (2019-06-12 12:13:47)
> >
> >> On Wed 12 Jun 08:52 PDT 2019, Marc Gonzalez wrote:
> >>
> >>> Build QCOM_A53PLL and QCOM_CLK_APCS_MSM8916 by default only when
> >>> we're building MSM_GCC_8916.
> >>>
> >>> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> >>
> >> Not sure why these are default at all.
> >>
> >> But both drivers are used on platforms other than 8916 as well, so if
> >> anything a fix would be to rename the APCS_MSM8916 to something more
> >> generic (such as QCOM_CLK_APCS_GLOBAL) - but then the content should be
> >> updated and the APCS mailbox driver as well...
> >=20
> > I don't see any use in being this specific. I'd prefer we just leave
> > this at the ARCH_FOO config level and not try anything more fancy.
>=20
> As Bjorn pointed out, why do these default "on" at all?
>=20
> https://elixir.bootlin.com/linux/latest/source/drivers/clk/qcom/Kconfig
>=20
> There are dozens of config knobs in drivers/clk/qcom/Kconfig
> and only these two force the default.
>=20
> Let's remove the default altogether.
>=20

Sure.

