Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 527E4F3A0D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 22:06:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfKGVGI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 16:06:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:43832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725870AbfKGVGI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 16:06:08 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E536F21D79;
        Thu,  7 Nov 2019 21:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573160767;
        bh=P+gx8Y/MLONswYmjEe2LF/E5o+K8Co2kGUVThgIx6LM=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=jIKB5C2x+SJZOlNufX08NfzFtDu9aVv23suQ4ls9Rloi1ALvkEhRVGcYNncwfIycj
         jFg0hk8QdtOYiTIg92DIRf4FzqaB8ZyIk0vliOFuHOiMLpglU1rB6m81J/ce9FYDfd
         zNcCVL4thHL7MIMliT6h24Gj8v9uPLz8XKLnu/bo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191031174149.GD27773@google.com>
References: <20191014102308.27441-1-tdas@codeaurora.org> <20191014102308.27441-6-tdas@codeaurora.org> <20191029175941.GA27773@google.com> <fa17b97d-bfc4-4e9c-78b5-c225e5b38946@codeaurora.org> <20191031174149.GD27773@google.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Matthias Kaehlcke <mka@chromium.org>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v4 5/5] clk: qcom: Add Global Clock controller (GCC) driver for SC7180
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 13:06:06 -0800
Message-Id: <20191107210606.E536F21D79@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Matthias Kaehlcke (2019-10-31 10:41:49)
> Hi Taniya,
>=20
> On Thu, Oct 31, 2019 at 04:59:26PM +0530, Taniya Das wrote:
> > Hi Matthias,
> >=20
> > Thanks for your comments.
> >=20
> > On 10/29/2019 11:29 PM, Matthias Kaehlcke wrote:
> > > Hi Taniya,
> > >=20
> > > On Mon, Oct 14, 2019 at 03:53:08PM +0530, Taniya Das wrote:
> > > > Add support for the global clock controller found on SC7180
> > > > based devices. This should allow most non-multimedia device
> > > > drivers to probe and control their clocks.
> > > >=20
> > > > Signed-off-by: Taniya Das <tdas@codeaurora.org>
> >=20
> > >=20
> > > v3 also had
> > >=20
> > > +   [GCC_DISP_AHB_CLK] =3D &gcc_disp_ahb_clk.clkr,
> > >=20
> > > Removing it makes the dpu_mdss driver unhappy:
> > >=20
> > > [    2.999855] dpu_mdss_enable+0x2c/0x58->msm_dss_enable_clk: 'iface'=
 is not available
> > >=20
> > > because:
> > >=20
> > >          mdss: mdss@ae00000 {
> > >                     ...
> > >=20
> > >   =3D>             clocks =3D <&gcc GCC_DISP_AHB_CLK>,
> > >                           <&gcc GCC_DISP_HF_AXI_CLK>,
> > >                           <&dispcc DISP_CC_MDSS_MDP_CLK>;
> > >                  clock-names =3D "iface", "gcc_bus", "core";
> > >     };
> > >=20
> >=20
> > The basic idea as you mentioned below was to move the CRITICAL clocks to
> > probe. The clock provider to return NULL in case the clocks are not
> > registered.
> > This was discussed with Stephen on v3. Thus I submitted the below patch.
> > clk: qcom: common: Return NULL from clk_hw OF provider.
>=20
> I see. My assumption was that the entire clock hierarchy should be regist=
ered,
> but Stephen almost certainly knows better :)
>=20
> > Yes it would throw these warnings, but no functional issue is observed =
from
> > display. I have tested it on the cheza board.
>=20
> The driver considers it an error (uses DEV_ERR to log the message) and do=
esn't
> handle other clocks when one is found missing. I'm not really famililar w=
ith
> the dpu_mdss driver, but I imagine this can have some side effects. Added=
 some
> of the authors/contributors to cc.

NULL is a valid clk pointer returned by clk_get(). What is the display
driver doing that makes it consider NULL an error?

