Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 338A3319446
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 21:21:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230448AbhBKUUg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 15:20:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:45752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230144AbhBKUUY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 15:20:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 09C8E64E56;
        Thu, 11 Feb 2021 20:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613074784;
        bh=hgPWTy5vpYMFvGLH/+5rEXt/XliZXxsfMcLT/KfH5bI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=EDLuJEmBN0E65YpEk6rE6iox2WV5N37qK24p3zZJOaRZSUsbGoA4kGp243LxWyLIi
         wDUxnKVbF278VO/ptGQ9shTmzImfRlGbEF48bYODox/ha1mHamaRr6Q9eaRisHXN2i
         edTCVALngVTRak7bn+oKBGJOBGL6VHc9ri0Y5RjBU2Zx5tJegnQWIfLy00E4hAPON9
         nFmeMrkKugWLrVSfLbUsT1obKgInHccs0GeEryP8xh1YQ0kiDqcj5WMtbQYvzKiirx
         Vb0rUkCkPTO7rXjdboN03cp1Hk7/qWmxbaUkfQeChmyrVsryDHp5CciU0y8JmPmptY
         TXuHW7NR7vE9g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210113183817.447866-6-angelogioacchino.delregno@somainline.org>
References: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org> <20210113183817.447866-6-angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v2 5/9] clk: qcom: rcg2: Stop hardcoding gfx3d pingpong parent numbers
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>, agross@kernel.org
Date:   Thu, 11 Feb 2021 12:19:42 -0800
Message-ID: <161307478271.1254594.18219937886787415438@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2021-01-13 10:38:13)
> The function clk_gfx3d_determine_rate is selecting different PLLs
> to manage the GFX3D clock source in a special way: this one needs
> to be ping-pong'ed on different PLLs to ensure stability during
> frequency switching (set a PLL rate, let it stabilize, switch the
> RCG to the new PLL) and fast frequency transitions.
>=20
> This technique is currently being used in the MSM8996 SoC and the
> function was assuming that the parents were always at a specific
> index in the parents list, which is TRUE, if we use this only on
> the MSM8996 MMCC.
> Unfortunately, MSM8996 is not the only SoC that needs to ping-pong
> the graphics RCG, so choices are:
> 1. Make new special ops just to hardcode *again* other indexes,
>    creating code duplication for (imo) no reason; or
> 2. Generalize this function, so that it becomes usable for a range
>    of SoCs with slightly different ping-pong configuration.
>=20
> In this commit, the second road was taken: define a new "special"
> struct clk_rcg2_gfx3d, containing the ordered list of parents to
> ping-pong the graphics clock on, and the "regular" rcg2 clock
> structure in order to generalize the clk_gfx3d_determine_rate
> function and make it working for other SoCs.
>=20
> As for the function itself it is left with the assumption that we
> need to ping-pong over three parents. The reasons for this are:
> 1. The initial model was MSM8996, which has 3 parents for the
>    graphics clock pingpong;
> 2. The other example that was taken into consideration is the
>    SDM630/636/660 SoC gpu clock controller, which is ping-ponging
>    over two dynamic clocked and one fixed clock PLL.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@soma=
inline.org>
> ---

Applied to clk-next but I modified it a bunch. Let me know if it doesn't
work.
