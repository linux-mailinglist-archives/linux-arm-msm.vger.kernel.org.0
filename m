Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33629408978
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Sep 2021 12:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239288AbhIMKzt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 06:55:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:51432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239251AbhIMKzo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 06:55:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7CF5561051;
        Mon, 13 Sep 2021 10:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631530469;
        bh=C/CD9dwxoPjq7daDRZanhVCJzqf9jrManidvO4tPMbc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SRcNfK6l9h3nCMDX/jSnvRdRNFGmqSxn6rH6Qk6+gt4rzELoC4eezGrETQzk0EG+X
         VAlSBZgobV2lcJfNgwwDf/5e05cxdXLjp9cNzHevwMjBp+IapRILOTMyLxp6t3vGQ7
         buCKeMKk07qu6gL4gbyJL27++ChJfXOb1aqgYQZ8wWk2zztq8zfF36MDQnKneuZaCX
         3fcWf6LXxrvD8O0vZlCmvdpz6Y7U7+2JL7QCUByb1MQnPE2mFEDXQS/tzv8JQeM/6e
         +89RYriJOTLqfNAYVs4A1XMKYItBRCv1VB8FG/Yasgr4VWH609mpFaY8w1IEUB9e/X
         6zQxDpflQAk2Q==
From:   Mark Brown <broonie@kernel.org>
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Robert Marko <robert.marko@sartura.hr>,
        linux-arm-msm@vger.kernel.org,
        Luka Perkov <luka.perkov@sartura.hr>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: vqmmc-ipq4019: Make use of the helper function devm_platform_ioremap_resource()
Date:   Mon, 13 Sep 2021 11:53:12 +0100
Message-Id: <163153010300.45871.10330234930176401038.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210908105752.2035-1-caihuoqing@baidu.com>
References: <20210908105752.2035-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 8 Sep 2021 18:57:51 +0800, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: vqmmc-ipq4019: Make use of the helper function devm_platform_ioremap_resource()
      commit: 6998c575b6dc26275b61987a3d70a8a4c976048b

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
