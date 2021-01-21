Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A40472FF4DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 20:44:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727167AbhAUTmY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 14:42:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:47326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727069AbhAUTmT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 14:42:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26EA923A5A;
        Thu, 21 Jan 2021 19:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611258092;
        bh=Chxeu+g19JLsrGMWeKplIRP6g6WFenfG7k7lC/ePb1E=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=pUFsvjIiPxCW6jnr1GDLL+RimioFgWewhbcDTV8VZKTBZ1784Wdj2znDzokbterxw
         4xHHkBoCNn5VpT4/BKawLUFdoQT9yPl7J6AsxVJ5EmmVf8MDt1v0G+OUvpnDHNGiim
         wYxXLPuTxBoTO7wHNOcZbm3WeXkkaUduE0RsW1W9Miybzj89ljmQUqaBZ9GOGQOjNj
         PTAnk0GTUNuadN6RdDqgrDNLHhjpk/83YjeLqzW1vo0FqPZm7DQf9+nHI85kK9ar41
         PvP7TOKifqg5HdRihgx1WzPWtVMSs4FP/91WN0NjHYUH2oWUe1zGORKcsYILgIRgRZ
         7wb1E9WmTdCqg==
From:   Mark Brown <broonie@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
In-Reply-To: <20210120224901.1611232-1-bjorn.andersson@linaro.org>
References: <20210120224901.1611232-1-bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: regulator: qcom-rpmh: Add pmc8180 and pmc8180c
Message-Id: <161125803281.35944.8325193773140119701.b4-ty@kernel.org>
Date:   Thu, 21 Jan 2021 19:40:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 20 Jan 2021 14:49:00 -0800, Bjorn Andersson wrote:
> Add RPMH regulator compatibles for two of the PMIC variants used on the
> SC8180x platform.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] dt-bindings: regulator: qcom-rpmh: Add pmc8180 and pmc8180c
      commit: 71ca776a8885aff469f2aa45382518513ecce883
[2/2] regulator: qcom-rpmh: Add pmc8180 and pmc8180c
      commit: e46c52f7efa25a1cd72c7a7399af9fddc41f5a8e

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
