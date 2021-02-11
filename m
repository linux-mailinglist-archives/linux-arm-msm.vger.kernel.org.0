Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6216A318F04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 16:45:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbhBKPnk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 10:43:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:57846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229821AbhBKPlI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 10:41:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6B1164EA1;
        Thu, 11 Feb 2021 15:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613058028;
        bh=zwgpHvB2pG/cgh/9ys3TmdSepVbZhel/XWss2jXMKsQ=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=FMakK3QQlvkvo/kqKMiGSb1zlcNpRX2vftjjz5T8YKZ8TpVnTcvrD5u/LxyxHoZ2K
         08OzscQZlk7w4GXd4rdQP2bCvZ7InIR7dWq/HziHxd8Fk1MRxQPHkJCrEF6L5jhUcq
         f7BQL95mtBNy0+Ugj2sn/VR7FaEIpDGZbcgqWN9BHv4eB4JG+F3d0hHPFWZmKW7kKn
         ZLmUCssQY3Ik091dxnVYM9RKwl6m+mGfGBO96VWznxrUzrGDrM38pM4JZ41mghuAI1
         p2qfhm3R1HXRzwJnuAFSJOXAcqx88XCxcgL4Bq512CAxCpWPu4wjtHuKIQNbbl8GyD
         /RVUbwdADgffA==
From:   Mark Brown <broonie@kernel.org>
To:     linux-arm-msm@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
Cc:     "open list:VOLTAGE AND CURRENT REGULATOR FRAMEWORK" 
        <linux-kernel@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20210211034935.5622-1-jonathan@marek.ca>
References: <20210211034935.5622-1-jonathan@marek.ca>
Subject: Re: [PATCH] regulator: qcom-rpmh: fix pm8009 ldo7
Message-Id: <161305796963.12598.841305500980411793.b4-ty@kernel.org>
Date:   Thu, 11 Feb 2021 15:39:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 10 Feb 2021 22:49:35 -0500, Jonathan Marek wrote:
> Use the correct name to avoid ldo7 commands being sent to ldo6's address.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: qcom-rpmh: fix pm8009 ldo7
      commit: 20ccc362c3d20da734af896e075b74222589f2c0

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
