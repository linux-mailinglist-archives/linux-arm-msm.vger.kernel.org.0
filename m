Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55FBC3F8E1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 20:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbhHZSsE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 14:48:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:34300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230056AbhHZSsE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 14:48:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C641D61037;
        Thu, 26 Aug 2021 18:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630003636;
        bh=EL23t1MgNn5mJyuhMr3CMmMaRyOve01i2usCZcwV6W4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=DS6tOSftw1CS5gZ8+vDqrQTJTQ2Q80zp8swMFssOMwPR4G6t+dAf7D+yTCy2Agbke
         eIlNY4nWpYHzPettXYqcoAnonxUb13tYN8aZDVdqbgL7WI9bjgB/VouJxOSmjhmrHf
         x47tzwx83ndqn4CPPJmBhbsclIX8/HEnfsMcLds/Ak7T6dKTndSdt2DeT14QD2TrVR
         KMhnWiLM/AWKsVdYNjm4E4guPtLHqcYkDd4u15CESX7kLexvHR+XaNPf+bn/x6Mwrh
         9yY9VDw0ZANSlGP+BE41vT8tTblfEmnH9XEZc0at/yGsU1VFsRROHtGzlmTLRRvwUm
         GTZuWJvuAKmGg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210825204517.1278130-1-bjorn.andersson@linaro.org>
References: <20210825204517.1278130-1-bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2] clk: qcom: gcc-sdm660: Replace usage of parent_names
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        angelogioacchino.delregno@somainline.org,
        Marijn Suijten <marijn.suijten@somainline.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Thu, 26 Aug 2021 11:47:15 -0700
Message-ID: <163000363556.1317818.13808174908685575043@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-08-25 13:45:17)
> Using parent_data and parent_hws, instead of parent_names, does protect
> against some cases of incompletely defined clock trees. While it turns
> out that the bug being chased this time was totally unrelated, this
> patch converts the SDM660 GCC driver to avoid such issues.
>=20
> The "xo" fixed_factor clock is unused within the gcc driver, but
> referenced from the DSI PHY. So it's left in place until the DSI driver
> is updated.
>=20
> Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somain=
line.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Applied to clk-next after moving back the arrays so the diff is smaller.
