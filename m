Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD3B2B30A1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Nov 2020 21:35:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbgKNUf3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Nov 2020 15:35:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:33444 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726112AbgKNUf3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Nov 2020 15:35:29 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B8C60223EA;
        Sat, 14 Nov 2020 20:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605386128;
        bh=7vnaB3VFxpvaHHYts3jclhQxPRL+APAK9cgp7E6I5H0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LvcivOj0XV9O4mPgbisHUZs/geMn7U1K76ejPdJJ4Q6M8jjRRje6weWtOwpZSPGDg
         Yl2Mgr8PyuUSEQz28ACRTBQqrySnOdCQFZr0X4lw8v4qNsxuzz59FFv/QHCCyhuXw0
         AcpPCx6MEG8wOiISU0qDcgxH6up3GEihN2pM9W+w=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201106093819.GE2621@vkoul-mobl>
References: <20201105104817.15715-1-manivannan.sadhasivam@linaro.org> <20201105104817.15715-3-manivannan.sadhasivam@linaro.org> <20201106093819.GE2621@vkoul-mobl>
Subject: Re: [PATCH v2 2/4] clk: qcom: Add SDX55 GCC support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Naveen Yadav <naveenky@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Date:   Sat, 14 Nov 2020 12:35:27 -0800
Message-ID: <160538612750.60232.17440819605514427384@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2020-11-06 01:38:19)
> On 05-11-20, 16:18, Manivannan Sadhasivam wrote:
> > +#include "reset.h"
> > +
> > +enum {
> > +     P_BI_TCXO,
> > +     P_CORE_BI_PLL_TEST_SE,
>=20
> This is for test and we removed this for upstream, so can you do that as
> well (not parent will decrease for clks below)
>=20
> With that updated:
>=20
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
>=20

I half understood that. Just an FYI that I'm waiting for this update.
