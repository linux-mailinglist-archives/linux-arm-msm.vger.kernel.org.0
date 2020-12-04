Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1A82CF78C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Dec 2020 00:34:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgLDXbp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Dec 2020 18:31:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:42192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726061AbgLDXbp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Dec 2020 18:31:45 -0500
From:   Mark Brown <broonie@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20201203071244.2652297-1-vkoul@kernel.org>
References: <20201203071244.2652297-1-vkoul@kernel.org>
Subject: Re: [PATCH 1/2] regulator: dt-bindings: Add PM8350x compatibles
Message-Id: <160712467174.7793.4605968041488999857.b4-ty@kernel.org>
Date:   Fri, 04 Dec 2020 23:31:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 3 Dec 2020 12:42:43 +0530, Vinod Koul wrote:
> Add PM8350 and PM8350C compatibles for these PMICs found in some
> Qualcomm platforms.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] regulator: dt-bindings: Add PM8350x compatibles
      commit: ff7f380d21d0e530c3501a007cec68da6dd4d650
[2/2] regulator: qcom-rpmh: Add support for PM8350/PM8350c
      commit: bebb2c6d5ca23d6b7556d39564212b619e068562

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
