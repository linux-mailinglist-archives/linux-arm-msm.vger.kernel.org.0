Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3609C3FE235
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 20:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238421AbhIASQR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 14:16:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:52508 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230063AbhIASQR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 14:16:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76932610CA;
        Wed,  1 Sep 2021 18:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630520120;
        bh=WeLEa/IQW8mZoaZdVjZki0IYsQTHhIvg0zU0r+hyVdM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gm4r8awO2hKuC/ixokWZ72Mkm+I7VYkmMDItk/W1GV9bpjEO43UNKnbrvjYtVVBs8
         s+aZeMkaq8E7PgR9D8tfeZ0bCddaC+G5wva2wvcll6Gm3o7ZtlFuOGKssOfV4NOZRl
         rN6RzqRZkdWEDW89cDkaf2yJlZ6Jw+TK9YAtUswTmnl/QldtlMGZhVH4LN222YbKyo
         loL8V0yA6lG9UJnAIx5if/Rx0z4pn/MeE6eQa4SMCq/9MM3oD7A4wUD6nSp8t2BsCO
         GBrBp1JftctFTn7p4LIxhBEjYUtJAf9wIF8f1bgLBEgBZzxrcnozbA3FJkZuicYsOP
         jL27X1pJg13OA==
From:   Mark Brown <broonie@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] regulator: qcom-rpmh-regulator: fix pm8009-1 ldo7 resource name
Date:   Wed,  1 Sep 2021 19:14:41 +0100
Message-Id: <163051927361.21773.14106624092156452594.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901114350.1106073-1-dmitry.baryshkov@linaro.org>
References: <20210901114350.1106073-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 1 Sep 2021 14:43:50 +0300, Dmitry Baryshkov wrote:
> Fix a typo in the pm8009 LDO7 declaration, it uses resource name ldo%s6
> instead of ldo%s7.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: qcom-rpmh-regulator: fix pm8009-1 ldo7 resource name
      commit: 863580418bc82062083be854355f2213d3d804f5

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
