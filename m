Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFAF53BED7C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 19:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231146AbhGGRzs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 13:55:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:52120 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230196AbhGGRzs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 13:55:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 60D5D61CCA;
        Wed,  7 Jul 2021 17:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625680387;
        bh=PxwpDaFOL7YNqHER3nHFJ1/ExlvewUZXOswIKlIEtmI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NvktAldGamqE+b2+uHaD0HGFyuXqh9AO42yZopm5CsbVJNnMQRuNp9LiPkWWZEU+G
         ukKVe4hpQXPX7OqR58VnB7EptCg8vVgz0SN53qneztValrOg7ID7qxtggFkU6eviVz
         hv+b6HzKo05TUWsEskGq4ydwh2OWNcge8otwfGlNzWWMw+dMAi8TC1WF4UZKemfYPn
         45OMmGzfkB17940sgOsVlSXN0jEkhZqunfdFevbAyk5qnuqgbtD+Awze5N6oZm9ClR
         4OeeaXQ25UFxVCvMaAfdJYQ8kXUFabdX5gucaQBC5iL28uFXGZPjn3C+gHBzCImJCu
         xFpEfoOua4LvQ==
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] regulator: fixed: Mark regulator-fixed-domain as deprecated
Date:   Wed,  7 Jul 2021 18:52:32 +0100
Message-Id: <162567917757.18771.6197916653765804450.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210705133441.11344-1-ulf.hansson@linaro.org>
References: <20210705133441.11344-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 5 Jul 2021 15:34:41 +0200, Ulf Hansson wrote:
> A power domain should not be modelled as a regulator, not even for the
> simplest case as recent discussions have concluded around the existing
> regulator-fixed-domain DT binding.
> 
> Fortunately, there is only one user of the binding that was recently added.
> Therefore, let's mark the binding as deprecated to prevent it from being
> further used.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: fixed: Mark regulator-fixed-domain as deprecated
      commit: c9cd752d8f3a6b13afc5332a60bea3e68f141738

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
