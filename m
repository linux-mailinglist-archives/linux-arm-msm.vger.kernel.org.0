Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3697412D313
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2019 19:04:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727207AbfL3SEo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Dec 2019 13:04:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:33888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726602AbfL3SEo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Dec 2019 13:04:44 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9E700206CB;
        Mon, 30 Dec 2019 18:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577729083;
        bh=PefIuhleT62reL1BGXQA1Kqd0QhpZCj1UPeZANIHGDk=;
        h=In-Reply-To:References:From:Cc:To:Subject:Date:From;
        b=2GV3WUJ23FqwRWHpgiNTl/gBeW2YfcgSVFxrhVmsATo0HkEcGXIFzRiHNrw/mD+nn
         YVjGFZcFxWf/f/ZPcBKC2THggoyc9dhBrI+6IDzx1apM7yhOzsTUVmNRaJXTM6l/J4
         UARnIv23D82aqMx8vuY2SOVWGOoXcnCThVfdc6pc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191227022652.GH1908628@ripper>
References: <20191125135910.679310-1-niklas.cassel@linaro.org> <20191125135910.679310-8-niklas.cassel@linaro.org> <20191219062339.DC0DE21582@mail.kernel.org> <20191220175616.3wdslb7hm773zb22@flawful.org> <20191224021636.CF47E20643@mail.kernel.org> <20191227022652.GH1908628@ripper>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Niklas Cassel <nks@flawful.org>, Andy Gross <agross@kernel.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 7/7] clk: qcom: apcs-msm8916: use clk_parent_data to specify the parent
User-Agent: alot/0.8.1
Date:   Mon, 30 Dec 2019 10:04:42 -0800
Message-Id: <20191230180443.9E700206CB@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2019-12-26 18:26:52)
> On Mon 23 Dec 18:16 PST 2019, Stephen Boyd wrote:
>=20
> > Quoting Niklas Cassel (2019-12-20 09:56:16)
> > > On Wed, Dec 18, 2019 at 10:23:39PM -0800, Stephen Boyd wrote:
> > > > This is odd. The clks could be registered with of_clk_hw_register()=
 but
> > > > then we lose the device provider information. Maybe we should searc=
h up
> > > > one level to the parent node and if that has a DT node but the
> > > > clk controller device doesn't we should use that instead?
> > >=20
> > > Hello Stephen,
> > >=20
> > > Having this in the clk core is totally fine with me,
> > > since it solves my problem.
> > >=20
> > > Will you cook up a patch, or do you want me to do it?
> > >=20
> >=20
> > Can you try the patch I appended to my previous mail? I can write
> > something up more proper later this week.
> >=20
>=20
> Unfortunately we have clocks with no dev, so this fail as below. Adding
> a second check for dev !=3D NULL to your oneliner works fine though.
>=20
> I.e. this ugly hack works fine:
>   core->of_node =3D np ? : (dev ? dev_of_node(dev->parent) : NULL);
>=20

Ok, thanks for testing!

