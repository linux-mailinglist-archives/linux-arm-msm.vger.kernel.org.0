Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3E42D1F6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 06:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbfJJEPw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 00:15:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:48610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725774AbfJJEPw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 00:15:52 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6D7E0208C3;
        Thu, 10 Oct 2019 04:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570680951;
        bh=7PY8feDlXkVWW2KYFarN3ehYZj6sWp1UyoI9DgEgCys=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=xmVp7TcRnycdRPLvxC2NqH2qj2fFayaLt8zo2n+Ue4voXI+miBM/1/iRcw8zqOFqo
         DDkomvqz4wOxakoWArZIIpY4Wp/EVuY8sJ9zuKpUA2n1oMy5ZX6WN/j/V18ZWD6nqG
         RJiH4KaJYx42Ym80geAwBFPRNHbP9XJ0SLNpSQ+c=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <eba920f5-f5a2-53d5-2227-529b5ea99d32@codeaurora.org>
References: <a7e27415-02d9-bfe9-c0ea-59dc236a7f91@free.fr> <c1762201-a1fa-8ed1-24ff-f30916ee45dd@free.fr> <155389876377.20095.15037552865160559827@swboyd.mtv.corp.google.com> <eba920f5-f5a2-53d5-2227-529b5ea99d32@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Manu Gautam <mgautam@codeaurora.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        Amit Nischal <anischal@codeaurora.org>
Subject: Re: [PATCH v1] clk: qcom: Skip halt checks on gcc_pcie_0_pipe_clk for 8998
User-Agent: alot/0.8.1
Date:   Wed, 09 Oct 2019 21:15:50 -0700
Message-Id: <20191010041551.6D7E0208C3@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Manu Gautam (2019-10-09 01:31:09)
> On 3/30/2019 4:02 AM, Stephen Boyd wrote:
> > Quoting Marc Gonzalez (2019-03-28 09:26:59)
> >> On 25/03/2019 14:49, Marc Gonzalez wrote:
> >>
> >>>               .enable_mask =3D BIT(0),
> >> Actually, 5f2420ed2189 is not the only similar instance.
> >>
> >> $ git log --oneline -G BRANCH_HALT_SKIP drivers/clk/qcom | grep -v con=
troller
> >> 924a86bf9793 clk: qcom: Skip halt checks on gcc_pcie_0_pipe_clk for 89=
98
> >> 5f2420ed2189 clk: qcom: Skip halt checks on gcc_usb3_phy_pipe_clk for =
8998
> >> 2abf856202fd clk: qcom: gcc-msm8998: Disable halt check of UFS clocks
> >> 5f75b78d3d67 clk: qcom: gcc-msm8996: Disable halt check on UFS tx clock
> >> 12d807cd34b8 clk: qcom: gcc-msm8996: Disable halt check on UFS clocks
> >> 096abdc296f1 clk: msm8996-gcc: Mark halt check as no-op for USB/PCIE p=
ipe_clk
> >> 7d99ced8f4c6 clk: qcom: Add support for BRANCH_HALT_SKIP flag for bran=
ch clocks
> >>
> > I keep asking Qualcomm engineers everytime this comes up why they can't
> > fix their phy initialization sequence.
> >
> > Too bad they don't care anymore!
>=20
>=20
> I have followed this up with QMP PHY hardware designers and they have
> confirmed that QMP PHY must have pipe clock enabled at the beginning
> of initialization sequence i.e. before bringing it out of reset and start=
ing it.

Awesome, thanks for following up.

>=20
> Otherwise there is possibility of incorrect locking of pipe_interface/
> retime buffers in PHY.
> Hence, for both USB and PCIe we have to continue to use HALT_SKIP flag.

Does anything go wrong if we just leave these clks enabled forever out
of boot? I'm inclined to rip the clks out and just slam the branch
enable bit on all the time in gcc driver probe and return NULL to the
callers of clk_get() for these clks. I don't see how this would be a
problem because when the upstream phy is disabled this clk is disabled
and so we aren't wasting power. It should also save us time and memory
because now we don't have to call into the clk framework to turn it on
and sequence that just right in the phy driver.

