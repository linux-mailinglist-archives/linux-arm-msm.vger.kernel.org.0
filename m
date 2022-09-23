Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A1FC5E8093
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Sep 2022 19:21:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbiIWRVo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Sep 2022 13:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbiIWRVn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Sep 2022 13:21:43 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73CF4D103;
        Fri, 23 Sep 2022 10:21:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CB2BFB82685;
        Fri, 23 Sep 2022 17:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92242C433D6;
        Fri, 23 Sep 2022 17:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663953699;
        bh=iTHevsTlEaujRl4XGlJlAKee9GLvMoEL1KDpcQIPnzA=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=tTXQptwheZuq8kLrtrbugCYeI2LbgFOYd+l6Gl1GYEzXK7vKHBaNkbxswVNBDRHQv
         D5sTwfFWpbN3s4FTFSRUYOdENkO5KVgpAmHYfb400PWV/P9W78kgLckGPOyYdTrHzF
         Q1OZ4EXi/CwPQ9vj0vutTZwnulpwdlbjJxTPUacMRVqoxKzqHltiXS54gzTanhkyiJ
         YaVJptjBRqN5JRi7KVkYtdZ9dCWg5xGlnaA8bpdYa1lESpFCizEUyT8tKvjuIwVc14
         LInuyBQeVrlmndDlbozQc9SgcG8XMXdhtehYIP3C9r5COMmOe7FGFxhEODZ0g1n5nk
         RdSod+VV9Ib0g==
From:   Mark Brown <broonie@kernel.org>
To:     linux-arm-msm@vger.kernel.org,
        Richard Acayan <mailingradian@gmail.com>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20220920223331.150635-1-mailingradian@gmail.com>
References: <20220920223331.150635-1-mailingradian@gmail.com>
Subject: Re: [PATCH v2 0/2] RPMh Support for PM660 and PM660L
Message-Id: <166395369731.637366.12053156030098251858.b4-ty@kernel.org>
Date:   Fri, 23 Sep 2022 18:21:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 20 Sep 2022 18:33:29 -0400, Richard Acayan wrote:
> Changes since v1:
>  - properly label
> 
> This patch series introduces support for the PM660 and PM660L on the RPMh
> mailbox. My initial Pixel 3a dts is not very minimal but I think that this
> series is trivial enough that it can be activated in a single commit.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] dt-bindings: regulator: qcom,rpmh: add pm660 and pm660l pmics
      commit: 21c93a95553d0a07091ff9894f09f5bffbfd8c8a
[2/2] regulator: qcom-rpmh: add pm660 and pm660l pmics
      commit: 911ce7cf72d9c1066a52928bffedaa103290db9e

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
