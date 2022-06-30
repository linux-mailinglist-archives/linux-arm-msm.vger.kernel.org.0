Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3435561AB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 14:49:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234426AbiF3Mst (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 08:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234580AbiF3Mss (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 08:48:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF6F337A90;
        Thu, 30 Jun 2022 05:48:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E5F4161E76;
        Thu, 30 Jun 2022 12:48:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB46C34115;
        Thu, 30 Jun 2022 12:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656593326;
        bh=k/q/fhQMiNHwRSXcnMIjj16X53/sqxQxXQ33UBBRBQg=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=OWFzgAPisJ3hZoUITVF00FrWji4mXjlyy7SdsD71uKqqobN9B4pAfM11CjhFgChKa
         73deDyqQDY+CST+2qjun2EBLp9xqPtTacuwGMmWfsHQRmpC7rtW4gqENCP1hpHTf4K
         JCDA5A7eAKdXNklG71V93HR2st/ZYAeZ2m/6GeQ1ivqiYskk4Dj3nlWvV0nbyFPbMN
         1XaMitcGXlzG9Z8J0plWmCKyrXveMkg73ASnkmOPGxK5TZcNrT6PTqBR9xSu5wZznx
         RaQKJ3HkuCk50EjZ+fYRg9t3kqoYu2hUT/Hn22sIyrUjzNmUZPo+W70ukb2oJ+n8Tp
         Rc+rqHeA+Iv2Q==
From:   Mark Brown <broonie@kernel.org>
To:     agross@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        srinivas.kandagatla@linaro.org, bryan.odonoghue@linaro.org,
        lgirdwood@gmail.com
Cc:     devicetree@vger.kernel.org, quic_srivasam@quicinc.com,
        quic_potturu@quicinc.com, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org
In-Reply-To: <20220629114012.3282945-1-bryan.odonoghue@linaro.org>
References: <20220629114012.3282945-1-bryan.odonoghue@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: Fix description for msm8916
Message-Id: <165659332361.455663.5255774878482906847.b4-ty@kernel.org>
Date:   Thu, 30 Jun 2022 13:48:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 29 Jun 2022 12:40:12 +0100, Bryan O'Donoghue wrote:
> For the existing msm8916 bindings the minimum reg/reg-names is 1 not 2.
> Similarly the minimum interrupt/interrupt-names is 1 not 2.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: Fix description for msm8916
      commit: 59d0319cadff71a74c55fafc6f3cc1f2aeb6538f

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
