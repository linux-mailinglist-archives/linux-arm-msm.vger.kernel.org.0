Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB28248D5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 19:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727866AbgHRRkP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 13:40:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:59040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726716AbgHRRkO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 13:40:14 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6483D20674;
        Tue, 18 Aug 2020 17:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597772413;
        bh=ooxCk5qt4vhKhK+H2n2CUVqXFNvQPcsFmvf4uuXnIRk=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=CDKKabT6aflVcdQ9itUJQPEbfHSvSgcUvMhLJwoafda+A76oYolvOijmYt8ALXhcX
         YaHxIoog+lEVkKvGj0pEzqLWTGOsoxByn8Xk6+RUAz4ISOhQHMwBlR+Ntu+fG7HP4k
         UDjcBaVUvKdKgwik66Q7CDXf0lTcMKhq6b6yjhfc=
Date:   Tue, 18 Aug 2020 18:39:43 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:VOLTAGE AND CURRENT REGULATOR FRAMEWORK" 
        <linux-kernel@vger.kernel.org>
In-Reply-To: <20200818162508.5246-1-jonathan@marek.ca>
References: <20200818162508.5246-1-jonathan@marek.ca>
Subject: Re: [RESEND PATCH] regulator: set of_node for qcom vbus regulator
Message-Id: <159777237821.25048.6743477910042149752.b4-ty@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 18 Aug 2020 12:25:08 -0400, Jonathan Marek wrote:
> This allows the regulator to be found by devm_regulator_get().
> 
> Fixes: 4fe66d5a62fb ("regulator: Add support for QCOM PMIC VBUS booster")

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: set of_node for qcom vbus regulator
      commit: 66c3b96a7bd042427d2e0eaa8704536828f8235f

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
