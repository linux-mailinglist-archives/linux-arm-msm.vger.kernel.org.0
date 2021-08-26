Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 791643F8DDF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 20:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243241AbhHZScf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 14:32:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:51124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232759AbhHZScf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 14:32:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9168660F45;
        Thu, 26 Aug 2021 18:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630002707;
        bh=sxl8vRje6pw3mYQTbT+6OnyNd0agftixyPnb0iZC2C0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YFynOUGS45MIcat9ll5QCVGE6K3v3Xoi3YZYMTp0kCwdLITDSO1Jp6mjK+PCM+bFM
         OkfmGcGV3NRjkIN5evKfbkj3EdFKC1pjYOBrf8jNzG+xpxcUvxPCgPjYNcuT4gfyiE
         BYckczGOV50RQT7rMbAqQBT+XZnykNc1NqKoMPpAURpjKjtSgOFY6suGYvRn5vja6y
         80AzCjcXuOikm27mjmTmQ4P3F2cYU7bXDHqKFLW0PVHvOIFuN1BQQ+qRLtJqKZGtJ0
         eV73JTvpUMS+miRRtSoSSliYfacw4mhJL9poI8xMTIWtDJyNCtgTz5sQLfij2DAz4U
         hx85T43h4B3GA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210727202004.712665-1-dmitry.baryshkov@linaro.org>
References: <20210727202004.712665-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 0/6] clk: qcom: use power-domain for sm8250's clock controllers
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Date:   Thu, 26 Aug 2021 11:31:46 -0700
Message-ID: <163000270629.1317818.2836576068466077505@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-07-27 13:19:56)
> On SM8250 both the display and video clock controllers are powered up by
> the MMCX power domain. Handle this by linking clock controllers to the
> proper power domain, and using runtime power management to enable and
> disable the MMCX power domain.
>=20
> Dependencies:
> - https://lore.kernel.org/linux-arm-msm/20210703005416.2668319-1-bjorn.an=
dersson@linaro.org/
>   (pending)

Does this patch series need to go through the qcom tree? Presumably the
dependency is going through qcom -> arm-soc

>=20
> Changes since v5:
>  - Dropped devm_pm_runtime_enable callback to remove extra dependency
>=20
> Changes since v4:
>  - Dropped pm_runtime handling from drivers/clk/qcom/common.c Moved the
>    code into dispcc-sm8250.c and videocc-sm8250.c
>=20
> Changes since v3:
>  - Wrap gdsc_enable/gdsc_disable into pm_runtime_get/put calls rather
>    than calling pm_runtime_get in gdsc_enabled and _put in gdsc_disable
>  - Squash gdsc patches together to remove possible dependencies between
>    two patches.
>
