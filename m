Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB95B1EC8D6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2020 07:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725855AbgFCFb6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jun 2020 01:31:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:45768 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725275AbgFCFb6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jun 2020 01:31:58 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AA8C72065C;
        Wed,  3 Jun 2020 05:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591162317;
        bh=jcNjRebtGEGF7OHTOpZIQrFoXxBn7By/a9J0O9eUj+Y=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=wAMWMMwCHBjbm/o3TC6OfFpQGJsCZZb5Q9kmmX2Jftvzfx2A0ID7ocYrScjo2smV8
         TWNvBd/0LvLPifoc7OZqyCevCDo/BVuUISmHRDUV7cM/3QtHO9PEGnebkvZiRI44kf
         875TE2CDZ3ATQ94tpu/lkC2eilbj5HPgA1y0DV2U=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4266555a-5e4f-4340-1b3c-487a70805751@codeaurora.org>
References: <1590582292-13314-1-git-send-email-sivaprak@codeaurora.org> <1590582292-13314-5-git-send-email-sivaprak@codeaurora.org> <159063116486.69627.5280506237179820811@swboyd.mtv.corp.google.com> <824cd7bb-0971-d387-4b78-75c36ddf2f66@codeaurora.org> <159104019638.69627.9161269856470136421@swboyd.mtv.corp.google.com> <4266555a-5e4f-4340-1b3c-487a70805751@codeaurora.org>
Subject: Re: [PATCH V6 4/5] clk: qcom: Add ipq6018 apss clock controller
From:   Stephen Boyd <sboyd@kernel.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Tue, 02 Jun 2020 22:31:56 -0700
Message-ID: <159116231690.69627.14045441534011952150@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sivaprakash Murugesan (2020-06-02 03:47:20)
>=20
> On 6/2/2020 1:06 AM, Stephen Boyd wrote:
> > Quoting Sivaprakash Murugesan (2020-06-01 05:41:15)
> >> On 5/28/2020 7:29 AM, Stephen Boyd wrote:
> >>> Quoting Sivaprakash Murugesan (2020-05-27 05:24:51)
> >>>> diff --git a/drivers/clk/qcom/apss-ipq6018.c b/drivers/clk/qcom/apss=
-ipq6018.c
> >>>> new file mode 100644
> >>>> index 0000000..004f7e1
> >>>> --- /dev/null
> >>>> +++ b/drivers/clk/qcom/apss-ipq6018.c
> >>>> @@ -0,0 +1,106 @@
> >>>> +       P_XO,
> >>>> +       P_APSS_PLL_EARLY,
> >>>> +};
> >>>> +
> >>>> +static const struct clk_parent_data parents_apcs_alias0_clk_src[] =
=3D {
> >>>> +       { .fw_name =3D "xo" },
> >>>> +       { .fw_name =3D "pll" },
> >>> This pll clk is not described in the binding. Please add it there.
> >> Sorry I did not get this, this PLL is not directly defined in this
> >> driver and it comes
> >>
> >> from dts. do you still want to describe it in binding?
> >>
> > Yes, there should be a clock-names property for "pll" and a clocks
> > property in the binding document. I didn't see that.
>=20
> These are defined in
>=20
> https://lkml.org/lkml/2020/5/27/658and
>=20
> https://lkml.org/lkml/2020/5/27/659
>=20
> it has been defined as part of mailbox binding, since this driver does
>=20
> not have a dts node and it is child of apcs mailbox driver.
>=20

Ah alright. Sounds good.
