Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDF47313D62
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 19:24:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235576AbhBHSYQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 13:24:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:54398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232667AbhBHSXh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 13:23:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F7DC64E84;
        Mon,  8 Feb 2021 18:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612808577;
        bh=3axVueoVXWZXbuc/cVWfyB6a0VC3IdhFb9Pcs/5SHWs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=fWN/RaC/7x2XOmBn2SdxAGWW0AuIY7gPqfxQWT8nMbObxZ9oWjF70WkiZ15x1VWI/
         5zMMPHA8qNToiqAqH7Uf7LZp11mVZWf2g6X96GHMOWoI+kyqyeUfC2lPsEXr7lD0fw
         spyl/WDIqySCMBxxnunc8jMk5K75iRnCTzU4RrNBVefS+rsqUME+mmUMaJDeBjaRsl
         calURxDWk1Fd25O0hafVldMbpBxUzrFeEak4q6+hLl7dVuIREyr0xJjGg6HtvcA9hY
         JmpfUDc7600pTcP0FTLzSaZNHJsp4YH4w1XV7kfV5mmmhRt/wkiEZTy8eINTobC27H
         wM9L+Re0OwRPQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210114221059.483390-12-angelogioacchino.delregno@somainline.org>
References: <20210114221059.483390-1-angelogioacchino.delregno@somainline.org> <20210114221059.483390-12-angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v2 11/11] clk: qcom: gpucc-msm8998: Allow fabia gpupll0 rate setting
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-arm-msm@vger.kernel.org
Date:   Mon, 08 Feb 2021 10:22:55 -0800
Message-ID: <161280857580.76967.14422472309861573115@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2021-01-14 14:10:59)
> The GPU PLL0 is not a fixed PLL and the rate can be set on it:
> this is necessary especially on boards which bootloader is setting
> a very low rate on this PLL before booting Linux, which would be
> unsuitable for postdividing to reach the maximum allowed Adreno GPU
> frequency of 710MHz (or, actually, even 670MHz..) on this SoC.
>=20
> To allow setting rates on the GPU PLL0, also define VCO boundaries
> and set the CLK_SET_RATE_PARENT flag to the GPU PLL0 postdivider.
>=20
> With this change, the Adreno GPU is now able to scale through all
> the available frequencies.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@soma=
inline.org>
> ---

Applied to clk-next
