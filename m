Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 716C4778028
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Aug 2023 20:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233073AbjHJSXX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Aug 2023 14:23:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232921AbjHJSXW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Aug 2023 14:23:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED751128
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Aug 2023 11:23:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8B49A665A1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Aug 2023 18:23:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45F9C433C8;
        Thu, 10 Aug 2023 18:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691691800;
        bh=yEGJ9dLYBX1tuwX/8liG9T8nGDu7MX05EJ5jcaX0YSQ=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=vIE8tmi/mTFC8N3iLJQ0z9xy1QSgXuDyZbJVvVFmA/AVs+MdbItt61MnSKexK7m8f
         jrI/SASCiaAhdeIIkIbSiNyIaXGZjvebKBDC6n5gv48VrSYFaLttmDDuZ8mGfenxak
         4415FVLibmtPC/jm3vZK/gXJGuRz29ePggZ/7n0tabaCXvuu0z3AVqnzkj2TuNTyLY
         8YobiuPseupiLquSkZdV6E8kfbb90C7PyAGu/QssUALQVcNm2TcE0KvJOT4Sh+d7vU
         kpIB9jP54WkWwgijDUASMKBjt9DtZipBBVI7M+1l3xBVQ7kOzDf7yIw2xdzfO30rGr
         HSuGT3kHLSzxw==
From:   Mark Brown <broonie@kernel.org>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        lgirdwood@gmail.com, Li Zetao <lizetao1@huawei.com>
Cc:     linux-arm-msm@vger.kernel.org
In-Reply-To: <20230810114858.2103928-1-lizetao1@huawei.com>
References: <20230810114858.2103928-1-lizetao1@huawei.com>
Subject: Re: [PATCH -next] regulator: qcom_rpm-regulator: Use devm_kmemdup
 to replace devm_kmalloc + memcpy
Message-Id: <169169179944.623172.11055158134809277266.b4-ty@kernel.org>
Date:   Thu, 10 Aug 2023 19:23:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 10 Aug 2023 19:48:58 +0800, Li Zetao wrote:
> Use the helper function devm_kmemdup() rather than duplicating its
> implementation, which helps to enhance code readability.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: qcom_rpm-regulator: Use devm_kmemdup to replace devm_kmalloc + memcpy
      commit: 55975401fdf86ffe4736a557ae9d6f3d81ee5ba6

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

