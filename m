Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7975283DD5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 19:56:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728534AbgJERzh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 13:55:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:50056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725960AbgJERzg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 13:55:36 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0D281207EA;
        Mon,  5 Oct 2020 17:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601920536;
        bh=gE8r4CwFuniZqjG8+OVcEN5ZuvAvi+yzUk3tl8ozSsE=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=eoUFY/IgP1qHdxbN5ZhFOu6BxHfazdvFl6bG8o7AJUNQ+dOrzVN5qvlUoGVsm96Pm
         Qw9eogxfjfAzpkTtvsGGGDcWFUbgwDbnyVBRjNJMqLUKlV23aVo1ky+upIx1Elqpee
         MFvO0WJlGdAgMlOd1RSLdimhvcg3Yu41LgvyoJbI=
Date:   Mon, 05 Oct 2020 18:54:33 +0100
From:   Mark Brown <broonie@kernel.org>
To:     linux-kernel@vger.kernel.org,
        Kathiravan T <kathirav@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vladimir Lypak <junak.pub@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
In-Reply-To: <20201004083413.324351-1-junak.pub@gmail.com>
References: <20201004083413.324351-1-junak.pub@gmail.com>
Subject: Re: [PATCH 1/2] regulator: qcom_smd: add pm8953 regulators
Message-Id: <160192046344.23248.15299965776034446498.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 4 Oct 2020 11:34:12 +0300, Vladimir Lypak wrote:
> The PM8953 is commonly used on board with MSM8953 SoCs or its variants:
> APQ8053, SDM(SDA)450 and SDM(SDA)632.
> It provides 7 SMPS and 23 LDO regulators.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] regulator: qcom_smd: add pm8953 regulators
      commit: b1a2fb10b8ef07a32061c53426303f73533d867b
[2/2] dt-bindings: regulator: document pm8950 and pm8953 smd regulators
      commit: 357dd65a9aa8ee0c77c94dc4601075a33f33e528

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
