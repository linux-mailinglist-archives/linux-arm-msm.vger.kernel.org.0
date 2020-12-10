Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8760C2D68AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 21:29:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393054AbgLJU21 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 15:28:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:44744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392561AbgLJU2U (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 15:28:20 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607632059;
        bh=9y+3Nfm7lh5y4hDPA2A5Isn8m9DsaGNzmkaBAi4wo9c=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Gg+/F3L2PQw8tjoClXbwNj3jH4z+nG8vSY6yrc8Yysg5Fk5SnUEPgCWDyRuxUkDAj
         g2EPEvam2LYmIEMM/6pArgyAglyDj6X0ajnk5DO4UnyBNNMcuOTmWMsFhnLjQC8K8f
         RB2EjwhUjtvPiHO6d47IKwvC7vdqasMURh6y/RzaoRTpajD7WzCVgnH5wYa/ym3kPw
         Lo4u1P6730gJyeD/3NS22ocQw7upObeKn+aBRnpVaVFOY/X+YYs8IuZeVd+BusyyYa
         UBnpr82NQCQzpDKUFMVt1Yn7JnDP1I2VW/am8gxEhpay8Nl6zeJ83Zb3zm9aL3tLw3
         awmtoAyOf4aNg==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201210102234.1.I096779f219625148900fc984dd0084ed1ba87c7f@changeid>
References: <20201210102234.1.I096779f219625148900fc984dd0084ed1ba87c7f@changeid>
Subject: Re: [PATCH 1/2] clk: qcom: gcc-sc7180: Use floor ops for sdcc clks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Taniya Das <tdas@codeaurora.org>, vbadigan@codeaurora.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>
Date:   Thu, 10 Dec 2020 12:27:38 -0800
Message-ID: <160763205823.1580929.3473607704954928540@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-12-10 10:22:38)
> I would repeat the same commit message that was in commit 5e4b7e82d497
> ("clk: qcom: gcc-sdm845: Use floor ops for sdcc clks") but it seems
> silly to do so when you could just go read that commit.
>=20
> NOTE: this is actually extra terrible because we're missing the 50 MHz
> rate in the table (see the next patch AKA ("clk: qcom: gcc-sc7180: Add
> 50 MHz clock rate for SDC2")).  That means then when you run an older
> SD card it'll try to clock it at 100 MHz when it's only specced to run
> at 50 MHz max.  As you can probably guess that doesn't work super
> well.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Fixes: 17269568f726 ("clk: qcom: Add Global Clock controller (GCC) driver=
 for SC7180")
> ---

Applied to clk-next
