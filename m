Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C623645E94
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 17:21:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbiLGQVF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 11:21:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbiLGQVE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 11:21:04 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3676F63B94
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 08:21:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E48AAB81EC3
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 16:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F155C433D6;
        Wed,  7 Dec 2022 16:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670430061;
        bh=1IXaF6ehsFBhyHoRvFGMVXStNy+CBtDspYbzGhzVFtY=;
        h=From:To:In-Reply-To:References:Subject:Date:From;
        b=FSYkRiNMVCM241Lv8TZTZe6mS0QUEXGjwgNF+rEOcy6ZCxndcdec6RKFQyNL3HOlN
         2GZucMI7fMOzkCDZdDnvZWxm6GbvQZVlI0WvOQ160Hco1WmadZQrk1FzMteTFw2zEp
         +UJCzom6BH/HC5Qq8dFe1xE/9Z/yFNw25kKuRINjYurE/tovDiLW3Rym2OjfZ7D+Vy
         OaXOnrwUhbyEy79ELpYpawbcuNXmlZwMrS/qP+21x9CgZ4oWRZc6vNSWTsarRs2u4/
         d57V+9Chq7jomcL4FOLBA88J2w1Xcc7waK1fPLhHzd/oATgQgMqUyUUFl0OG7fekH6
         R9vd1H8dYAsVA==
From:   Mark Brown <broonie@kernel.org>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        lgirdwood@gmail.com, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, Yuan Can <yuancan@huawei.com>
In-Reply-To: <20221203062109.115043-1-yuancan@huawei.com>
References: <20221203062109.115043-1-yuancan@huawei.com>
Subject: Re: [PATCH] regulator: qcom-labibb: Fix missing of_node_put() in
 qcom_labibb_regulator_probe()
Message-Id: <167043005990.286324.7071844820943980406.b4-ty@kernel.org>
Date:   Wed, 07 Dec 2022 16:20:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.0-dev-b77ec
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 03 Dec 2022 06:21:09 +0000, Yuan Can wrote:
> The reg_node needs to be released through of_node_put() in the error
> handling path when of_irq_get_byname() failed.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: qcom-labibb: Fix missing of_node_put() in qcom_labibb_regulator_probe()
      commit: cf34ac6aa2b12fb0c3aacfdcae8acd7904b949ec

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
