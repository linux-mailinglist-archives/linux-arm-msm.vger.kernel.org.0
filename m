Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4BD33A13A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Mar 2021 22:00:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234731AbhCMVAA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Mar 2021 16:00:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:41432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234593AbhCMU7v (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Mar 2021 15:59:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D728C64ECE;
        Sat, 13 Mar 2021 20:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615669191;
        bh=Prh/GvLlCXahiqAWMZ5suVERYpG5btIIgSbUFPcodtc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PPgTBXoHCyaxPOsdFe1ja617sL9z3o/8j7RV1LBDWPKQ6DTMsiHGzlKlwOYvauN8b
         5gcTiYGkavqvWI8h1kJ52n3CC20ma1eb4rihbtLupNxu3iVWrKvAca5NKbkd5Y+Jq7
         UrCz/0+/Y56VwLorgCKTDtjlsBp/nnbbFwgMfsdW37mToFKiR9D9iCLy7/WbD+lff8
         56OmJthmcMU1eScTA/si38mIrUwOeHcVPcXg0LR04+rL93uYwq2aWM8HG83rEmyWW6
         PEBfYRjvtzgoUAQlkYJYAzzpq5p53i2TPnoNg3eCVF5MxIz9tx9Wri8U8wDZV8cp9m
         IUlv4W3JubjZQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210302234106.3418665-1-marijn.suijten@somainline.org>
References: <20210302234106.3418665-1-marijn.suijten@somainline.org>
Subject: Re: [PATCH] clk: qcom: rcg2: Rectify clk_gfx3d rate rounding without mux division
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        angelogioacchino.delregno@somainline.org,
        konrad.dybcio@somainline.org, martin.botka@somainline.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Date:   Sat, 13 Mar 2021 12:59:49 -0800
Message-ID: <161566918965.1478170.7122514783960594682@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Marijn Suijten (2021-03-02 15:41:06)
> In case the mux is not divided parent_req was mistakenly not assigned to
> leading __clk_determine_rate to determine the best frequency setting for
> a requested rate of 0, resulting in the msm8996 platform not booting.
> Rectify this by refactoring the logic to unconditionally assign to
> parent_req.rate with the clock rate the caller is expecting.
>=20
> Fixes: 7cbb78a99db6 ("clk: qcom: rcg2: Stop hardcoding gfx3d pingpong par=
ent numbers")
> Reported-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Tested-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@somain=
line.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

Applied to clk-fixes
