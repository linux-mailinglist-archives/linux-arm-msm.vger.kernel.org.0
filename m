Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C45D82B8A6C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Nov 2020 04:26:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbgKSDX4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Nov 2020 22:23:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:45844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725970AbgKSDX4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Nov 2020 22:23:56 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 510C520679;
        Thu, 19 Nov 2020 03:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605756235;
        bh=foHNkQnrkydpP/j0TruYdwQhazxvbepEMOw0Gvl/Xv8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=u+nTrI6x/8vTSAOf2t/MQfTX2JQFKdcQTKLEn6/rJW2vUUvbAWjw4WP61caup0QuE
         AYdpX4yd/GTBJnB/xBRLx+VQKl4+HRrRAoj5bYXJDEt4Z/1YwZCVW5UnBJPZ7Evmo0
         sUApO7QzJz4LLTeP1L+hOeWe7rO0CCtAsVNvoMCs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201118144401.GA8942@thinkpad>
References: <20201105104817.15715-1-manivannan.sadhasivam@linaro.org> <20201105104817.15715-3-manivannan.sadhasivam@linaro.org> <20201106093819.GE2621@vkoul-mobl> <160538612750.60232.17440819605514427384@swboyd.mtv.corp.google.com> <20201118144401.GA8942@thinkpad>
Subject: Re: [PATCH v2 2/4] clk: qcom: Add SDX55 GCC support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>, mturquette@baylibre.com,
        robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Naveen Yadav <naveenky@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date:   Wed, 18 Nov 2020 19:23:53 -0800
Message-ID: <160575623386.2717324.1766580531259003708@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Manivannan Sadhasivam (2020-11-18 06:44:01)
> On Sat, Nov 14, 2020 at 12:35:27PM -0800, Stephen Boyd wrote:
> > Quoting Vinod Koul (2020-11-06 01:38:19)
> > > On 05-11-20, 16:18, Manivannan Sadhasivam wrote:
> > > > +#include "reset.h"
> > > > +
> > > > +enum {
> > > > +     P_BI_TCXO,
> > > > +     P_CORE_BI_PLL_TEST_SE,
> > >=20
> > > This is for test and we removed this for upstream, so can you do that=
 as
> > > well (not parent will decrease for clks below)
> > >=20
> > > With that updated:
> > >=20
> > > Reviewed-by: Vinod Koul <vkoul@kernel.org>
> > >=20
> >=20
> > I half understood that. Just an FYI that I'm waiting for this update.
>=20
> Looks like this change is not needed. Can you please consider merging
> this series?
>=20

No. Please document core_bi_pll_test_se in the binding.
