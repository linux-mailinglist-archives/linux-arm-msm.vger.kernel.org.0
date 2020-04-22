Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC84E1B351B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 04:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgDVCqJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 22:46:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:58806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725912AbgDVCqJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 22:46:09 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F0894206D5;
        Wed, 22 Apr 2020 02:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587523569;
        bh=WDVNXLuDKHJmMAKTFYft3OMO/USP/AU36btJw83knso=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Of9o2uQzI9EzXzjRvHOeCuJLwn/xkYTytsQYc2MEfhFMsiacEV0sYZ7tMG2EGSqLr
         ASKMJcPD5HFJOisISVcF7owCxs6dJkKwm1cWeSODxwKR5kU2D4MFCBhbiBgIj8625M
         QimS93P99SUmrAhwd9XzhSiNYsF4pfWI9WSvXKgw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200329124116.4185447-1-bryan.odonoghue@linaro.org>
References: <20200329124116.4185447-1-bryan.odonoghue@linaro.org>
Subject: Re: [PATCH] clk: qcom: msm8916: Fix the address location of pll->config_reg
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Date:   Tue, 21 Apr 2020 19:46:07 -0700
Message-ID: <158752356720.132238.12302452053488329235@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bryan O'Donoghue (2020-03-29 05:41:16)
> During the process of debugging a processor derived from the msm8916 which
> we found the new processor was not starting one of its PLLs.
>=20
> After tracing the addresses and writes that downstream was doing and
> comparing to upstream it became obvious that we were writing to a differe=
nt
> register location than downstream when trying to configure the PLL.
>=20
> This error is also present in upstream msm8916.
>=20
> As an example clk-pll.c::clk_pll_recalc_rate wants to write to
> pll->config_reg updating the bit-field POST_DIV_RATIO. That bit-field is
> defined in PLL_USER_CTL not in PLL_CONFIG_CTL. Taking the BIMC PLL as an
> example
>=20
> lm80-p0436-13_c_qc_snapdragon_410_processor_hrd.pdf
>=20
> 0x01823010 GCC_BIMC_PLL_USER_CTL
> 0x01823014 GCC_BIMC_PLL_CONFIG_CTL
>=20
> This pattern is repeated for gpll0, gpll1, gpll2 and bimc_pll.
>=20
> This error is likely not apparent since the bootloader will already have
> initialized these PLLs.
>=20
> This patch corrects the location of config_reg from PLL_CONFIG_CTL to
> PLL_USER_CTL for all relevant PLLs on msm8916.
>=20
> Fixes commit 3966fab8b6ab ("clk: qcom: Add MSM8916 Global Clock Controlle=
r support")
>=20
> Cc: Georgi Djakov <georgi.djakov@linaro.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Applied to clk-next
