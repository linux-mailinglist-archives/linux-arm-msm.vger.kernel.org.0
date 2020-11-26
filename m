Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E78B22C5CD6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 21:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389794AbgKZUG1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 15:06:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:36518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728118AbgKZUG1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 15:06:27 -0500
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net [92.233.91.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 446BA20678;
        Thu, 26 Nov 2020 20:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606421186;
        bh=adaS/dVFg+I2jIUyjCgMHXDFaVVNbAutXxzlBvgKO3I=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=wIR63Qa5lF2DvebM6pjM89Llu6MTZFL/1FDXqEmHKXwsrwlbdZVal6Ar6ifGB2rpJ
         OzGuhypkehTrmzSOnPWiANWHij8DdaBOUKeSjCO2PBZaw5KDNbY+7nJAIlL0MBiD84
         7TrZZGuVWlLDtgStnWvJ4rw6QColZz9UK+s/98Og=
Date:   Thu, 26 Nov 2020 20:06:01 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
In-Reply-To: <20201126093018.1085594-1-vkoul@kernel.org>
References: <20201126093018.1085594-1-vkoul@kernel.org>
Subject: Re: [PATCH 1/2] regulator: dt-bindings: Add PMX55 compatibles
Message-Id: <160642116161.9318.6557430942496411850.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 26 Nov 2020 15:00:17 +0530, Vinod Koul wrote:
> Add PMX55 compatibles for PMIC found in SDX55 platform

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] regulator: dt-bindings: Add PMX55 compatibles
      commit: 1008521b9b4f85d80ac1d80391ac39055c89f736
[2/2] regulator: qcom-rpmh: Add support for SDX55
      commit: 36dd70ceb4d955e6cd3ecd18e78169141aaa23b7

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
