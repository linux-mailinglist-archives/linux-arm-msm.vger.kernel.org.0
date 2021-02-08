Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12A18313D3B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 19:24:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235579AbhBHSWB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 13:22:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:53394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235556AbhBHSUz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 13:20:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0938464E92;
        Mon,  8 Feb 2021 18:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612808395;
        bh=TtfP3/anknuXDH1Jo7eOv7R7sK08brogIlUR0I+OoMI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BDzODMhJpFuQ86xUKMvCFcPgMSp9fEpzFTc0Z4lXAlx4swJINeE5if2hsAu3KdT6Z
         CZX1IRKCztCY2f9Gftz6jLabGCYEEmp/m39wNM7D/k7kNYTXpC95b8vpm/HqVDJ34M
         TwsF9S2xzMjHLbaRQfatZDKbmUVy0FU3+pI48KkUf5qO+LeMJ8XWmuP4tpzaY3Klyb
         Ox7sDM3YlyDWAZl1ECEPJlPXTUcc59w7fvn3plTLMGwX9RghBoOr88EzJfXsePrMW2
         k+EU2aN3k49hlatv6EUQxbUZAlJukrFhrdlZ0VZ8ltkBlgVPfNj4BsaW5oIwsRhM/q
         VsqXwPiguSI/w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210114221059.483390-7-angelogioacchino.delregno@somainline.org>
References: <20210114221059.483390-1-angelogioacchino.delregno@somainline.org> <20210114221059.483390-7-angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v2 06/11] clk: qcom: gcc-msm8998: Fix Alpha PLL type for all GPLLs
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
Date:   Mon, 08 Feb 2021 10:19:53 -0800
Message-ID: <161280839390.76967.10938228458812649791@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2021-01-14 14:10:54)
> All of the GPLLs in the MSM8998 Global Clock Controller are Fabia PLLs
> and not generic alphas: this was producing bad effects over the entire
> clock tree of MSM8998, where any GPLL child clock was declaring a false
> clock rate, due to their parent also showing the same.
>=20
> The issue resides in the calculation of the clock rate for the specific
> Alpha PLL type, where Fabia has a different register layout; switching
> the MSM8998 GPLLs to the correct Alpha Fabia PLL type fixes the rate
> (calculation) reading. While at it, also make these PLLs fixed since
> their rate is supposed to *never* be changed while the system runs, as
> this would surely crash the entire SoC.
>=20
> Now all the children of all the PLLs are also complying with their
> specified clock table and system stability is improved.
>=20
> Fixes: b5f5f525c547 ("clk: qcom: Add MSM8998 Global Clock Control (GCC) d=
river")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@soma=
inline.org>
> ---

Applied to clk-next
