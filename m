Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C66B313D53
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 19:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233489AbhBHSXp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 13:23:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:53760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235578AbhBHSWB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 13:22:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5CBBD64E37;
        Mon,  8 Feb 2021 18:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612808480;
        bh=CQW2KH8hztBtqgksHVPea2uZay2ILfsC+tVqR0PIWaE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mp2CF9xbSTMZl5F7CWA1EJ3bh17FeANgjlT9oICwoFw5XKHWP+g+ffxHnf9bz9mAH
         L+pdbnqTeZPGMgoMNDme/lg835/JBQtYjodgv7B2AC6Z7MVkSPFgGIVMSOsoI6GtNj
         7VXKXtFhbNjJjSBm+AKtEi7s0Ct7U1a1CtI4mgQ0KNoxxXf6RtKl8EX6ZJ9hc0bXBH
         3ywGh3PmWOfUEZRnZ4tTsW2xE0IgMtasvOB8F1V3nvlYvZkZH1EaeGzfFXfW/xQUGQ
         pWA6ifIJby4WKuIQ006+r3uNhbNuwLaJ8cRXraQkrHt5/iA0wnQjFr3TxuOOD3vEcf
         uqk+MGZmBKYkA==
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
Date:   Mon, 08 Feb 2021 10:21:19 -0800
Message-ID: <161280847912.76967.9613917615673032246@swboyd.mtv.corp.google.com>
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
>  drivers/clk/qcom/mmcc-msm8998.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

We didn't do this on sdm845, so I'm not going to apply this patch. The
rate caching thing is a problem with the display driver that should be
fixed some other way vs. setting nocache here.
