Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7210313D46
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 19:24:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235618AbhBHSWR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 13:22:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:53540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235561AbhBHSVU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 13:21:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5276C64E84;
        Mon,  8 Feb 2021 18:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612808401;
        bh=Q2bV0W0mG9IErCZlLHYlZZENLrVP+bhFSPA37zd7yC4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=V8AGt3XuTmxpuatBgyimbWe5UdeNMQ6RItBqIwQMpMZAulnv84nM401vN3bTpF/kF
         Zwaw5XJBndyZgrxHL0qxPBo7WmtccPZnSBREo0CMjki18w3s8ATJhjCYShFId82AA5
         VXssfrp1oigtUiIPmmWOZ3u8nd/Y3P3+rxOgrN/SIc29U3coxYYL/IlHA8I0fShumV
         RxYmde97aciAbPpAcFV9R9PmGdV3ZcdmgU0EHv1uEk0ShoU6iM5hSGgBG1orYIEoNj
         1VX9BV7y+Hyu8bpQNrvqmlUWBErkH/y4s12rAGUt07SWcoM+hJlVorA4wpTJpsv9dQ
         LHj8ekHR41Lpw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210114221059.483390-8-angelogioacchino.delregno@somainline.org>
References: <20210114221059.483390-1-angelogioacchino.delregno@somainline.org> <20210114221059.483390-8-angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v2 07/11] clk: qcom: mmcc-msm8998: Set CLK_GET_RATE_NOCACHE to pixel/byte clks
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
Date:   Mon, 08 Feb 2021 10:20:00 -0800
Message-ID: <161280840018.76967.9481288975245040550@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2021-01-14 14:10:55)
> The pixel and byte clocks rate should not be cached, as a VCO shutdown
> may clear the frequency setup and this may not be set again due to the
> cached rate being present.
> This will also be useful when shadow clocks will be implemented in
> the DSI PLL for seamless timing/resolution switch.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@soma=
inline.org>
> ---

Applied to clk-next
