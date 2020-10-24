Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB682979F9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Oct 2020 02:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756460AbgJXA3F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 20:29:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:42194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756447AbgJXA3F (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 20:29:05 -0400
Received: from localhost (cpc102338-sgyl38-2-0-cust404.18-2.cable.virginm.net [77.102.33.149])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6A52F22274;
        Sat, 24 Oct 2020 00:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603499344;
        bh=9BP/Tx8/G2Jv4bAebjttfSpXGNYyE/F5AB49sTdDya0=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=Ie/cSUilz6KmF7JXPQZ/JZgnRJzhMlPhKkyXdIfu/xpOZMMCYOwPCneydTdOWTRPn
         Us++o5bIrTmVxP55HTgLQnbXAFBk9HDynTyq1pBF1BeCFEHTDsxp4tuY/P0YdKzvJY
         +DPATz4N1LxXnaokxzAo78QVtTgEDLxFN04jDSpc=
Date:   Sat, 24 Oct 2020 01:29:02 +0100
From:   Mark Brown <broonie@kernel.org>
To:     lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Robert Marko <robert.marko@sartura.hr>, robh+dt@kernel.org,
        agross@kernel.org
Cc:     Luka Perkov <luka.perkov@sartura.hr>
In-Reply-To: <20201016204404.2405707-1-robert.marko@sartura.hr>
References: <20201016204404.2405707-1-robert.marko@sartura.hr>
Subject: Re: [PATCH] MAINTAINERS: Add entry for Qualcomm IPQ4019 VQMMC regulator
Message-Id: <160349934287.28496.16648584940272337349.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 16 Oct 2020 22:44:04 +0200, Robert Marko wrote:
> Add maintainers entry for the Qualcomm IPQ4019 VQMMC regulator driver.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] MAINTAINERS: Add entry for Qualcomm IPQ4019 VQMMC regulator
      commit: 43c3e148830aae5469c411a2bf951d4fe7fcea29

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
