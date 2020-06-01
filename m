Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C0CA1EAFBE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2020 21:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728631AbgFATgi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jun 2020 15:36:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:58768 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728059AbgFATgh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jun 2020 15:36:37 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 28DEE206E2;
        Mon,  1 Jun 2020 19:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591040197;
        bh=xLw+tlg5Ya7G23FRwVuk0LpveeWH40gTWVGtW4vXxI0=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=Eh1WKgxZex7GNj0rq0S/8F6FSNXsHMJe6jX5aNN3ShW+dNEBZHcpp07X0Yp9wXVW+
         UWmByAECBPKkWMaJarsVvshCo87ULjTMAGXUjgfFliWTI7sU4k4qhXT7shNjE19I62
         QGYRlumSxCTolgcpRwfESKh6uX0d995xDAv8fgGg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <824cd7bb-0971-d387-4b78-75c36ddf2f66@codeaurora.org>
References: <1590582292-13314-1-git-send-email-sivaprak@codeaurora.org> <1590582292-13314-5-git-send-email-sivaprak@codeaurora.org> <159063116486.69627.5280506237179820811@swboyd.mtv.corp.google.com> <824cd7bb-0971-d387-4b78-75c36ddf2f66@codeaurora.org>
Subject: Re: [PATCH V6 4/5] clk: qcom: Add ipq6018 apss clock controller
From:   Stephen Boyd <sboyd@kernel.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Mon, 01 Jun 2020 12:36:36 -0700
Message-ID: <159104019638.69627.9161269856470136421@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sivaprakash Murugesan (2020-06-01 05:41:15)
> On 5/28/2020 7:29 AM, Stephen Boyd wrote:
> > Quoting Sivaprakash Murugesan (2020-05-27 05:24:51)
> >> diff --git a/drivers/clk/qcom/apss-ipq6018.c b/drivers/clk/qcom/apss-i=
pq6018.c
> >> new file mode 100644
> >> index 0000000..004f7e1
> >> --- /dev/null
> >> +++ b/drivers/clk/qcom/apss-ipq6018.c
> >> @@ -0,0 +1,106 @@
> >> +       P_XO,
> >> +       P_APSS_PLL_EARLY,
> >> +};
> >> +
> >> +static const struct clk_parent_data parents_apcs_alias0_clk_src[] =3D=
 {
> >> +       { .fw_name =3D "xo" },
> >> +       { .fw_name =3D "pll" },
> > This pll clk is not described in the binding. Please add it there.
>=20
> Sorry I did not get this, this PLL is not directly defined in this=20
> driver and it comes
>=20
> from dts. do you still want to describe it in binding?
>=20

Yes, there should be a clock-names property for "pll" and a clocks
property in the binding document. I didn't see that.
