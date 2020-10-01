Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1C45280A7B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Oct 2020 00:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733309AbgJAWsV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Oct 2020 18:48:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:56288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726741AbgJAWsV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Oct 2020 18:48:21 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7CF582074B;
        Thu,  1 Oct 2020 22:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601592501;
        bh=ZdismrIrzDFufmTFsLx3DkSFP3z8hChR5m3PaFMvsTk=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=srr0ipw9YVb4cj0nj4QUsXqEKnrqtWSWCbq0SXcuT4C1uKlM7FyGMsSXzqenbPZPm
         riFSmN6FEmo2QfFMcFE7e+zOFW4nr2D2d7Kk0RMzCvZkVj1ZPdyDODOdAVpLbds5KB
         XHH0WXsHZJsRvH3Zt/HpUeYb9ONRvu4NbmWOnp0Y=
Date:   Thu, 01 Oct 2020 23:47:21 +0100
From:   Mark Brown <broonie@kernel.org>
To:     "kholk11@gmail.com" <kholk11@gmail.com>
Cc:     konradybcio@gmail.com, bjorn.andersson@linaro.org,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        robh+dt@kernel.org, lgirdwood@gmail.com,
        phone-devel@vger.kernel.org, marijns95@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20200926125549.13191-1-kholk11@gmail.com>
References: <20200926125549.13191-1-kholk11@gmail.com>
Subject: Re: [PATCH 0/5] Support for PM660/PM660L SPMI and SMD regulators
Message-Id: <160159243691.44970.9175489185107541886.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 26 Sep 2020 14:55:42 +0200, kholk11@gmail.com wrote:
> This patch series enables support for the regulators as found in
> the PM660 and PM660L PMICs.
> While at it, and to make them work, along with other regulators
> for other qcom PMICs, enlarge the maximum property name length in
> the regulator core, so that we're able to correctly parse the
> supply parents, which have got very long names (details in patch 1/5).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/6] regulator: core: Enlarge max OF property name length to 64 chars
      commit: e9bb4a068b206f61ef01057cfeafdb852fb244c5
[2/6] regulator: qcom_spmi: Add support for new regulator types
      commit: 328816c2033160a6929fb0c6f0018b7c8d75cefe
[3/6] regulator: qcom_spmi: Add PM660/PM660L regulators
      commit: 0074c4472dcb20e989d9870c0b3aba42d0aa44b8
[4/6] regulator: dt-bindings: Document the PM660/660L SPMI PMIC entries
      commit: f9f061a5486f6a87e32fac80223ae44d4aefc06f
[5/6] regulator: qcom_smd: Add PM660/PM660L regulator support
      commit: 6d849653b00f2336efcd371fe85a7eb31bb094e9
[6/6] regulator: dt-bindings: Document the PM660/PM660L PMICs entries
      commit: f627691db72921f300e333fbbfe8349142a94807

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
