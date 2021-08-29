Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB30F3FA878
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 06:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231902AbhH2EBh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Aug 2021 00:01:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:33818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229483AbhH2EBe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Aug 2021 00:01:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D01A160E73;
        Sun, 29 Aug 2021 04:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630209642;
        bh=vriY2Miz0l2axx3o8K+06y1G4BysaSccyvC+2MeU4KQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=K/ruHj619h7zhcKBZSFm+meS73aqX6g23Cgzf0IYWTo9yS3Ytm5qVzubhGEyEdKsu
         BNvALFhKoia7bLSB2w+GdOWdh0yig/9Y+juFpqicjrSVFJtWYKjn4TPMzInkFN+iFG
         B/LFJibTr2aP8XiaqoO7gW2wxKzC3P1wgfyx7dGbKTcAk+aR7ZH+MUX1ix16x8uxUN
         JNU0jFsf2O/axv/BPVyzcX6FlUcEZHTwuS346pxL4U/Dqx6pII7y6/slFHXRMe+RUp
         p/4NpCT1IadX5AVKPfK7L9WV4/IZinsKnDa0pSrOY40M8EfX8VUbkLo0gnzOvshJgY
         bSUHr/BQqF8yw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210816135930.11810-1-lukas.bulwahn@gmail.com>
References: <20210816135930.11810-1-lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] clk: qcom: adjust selects for SM_VIDEOCC_8150 and SM_VIDEOCC_8250
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Date:   Sat, 28 Aug 2021 21:00:41 -0700
Message-ID: <163020964167.2676726.11842390922063654401@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Lukas Bulwahn (2021-08-16 06:59:30)
> Commit 5658e8cf1a8a ("clk: qcom: add video clock controller driver for
> SM8150") and commit 0e94711a1f29 ("clk: qcom: add video clock controller
> driver for SM8250") add config SM_VIDEOCC_8150 and config SM_VIDEOCC_8250,
> which select the non-existing configs SDM_GCC_8150 and SDM_GCC_8250,
> respectively.
>=20
> Hence, ./scripts/checkkconfigsymbols.py warns:
>=20
> SDM_GCC_8150
> Referencing files: drivers/clk/qcom/Kconfig
>=20
> SDM_GCC_8250
> Referencing files: drivers/clk/qcom/Kconfig
>=20
> It is probably just a typo (or naming confusion of using SM_GCC_xxx and
> SDM_GCC_xxx for various Qualcomm clock drivers) in the config definitions
> for config SM_VIDEOCC_8150 and SM_VIDEOCC_8250, and intends to select the
> existing SM_GCC_8150 and SM_GCC_8250, respectively.
>=20
> Adjust the selects to the existing configs.
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---

Applied to clk-next
