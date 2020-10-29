Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 418E229EC02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 13:40:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbgJ2Mk2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Oct 2020 08:40:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:53062 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726452AbgJ2Mk2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Oct 2020 08:40:28 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CFB492075E;
        Thu, 29 Oct 2020 12:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603975227;
        bh=uDEi8l3tLwU6LdqHUgog52VUPP3I1HsdRFofzCw0ukY=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=j3yDLKE8Wp8Q1jPOTKmVjhE3oBiG+HZWB6zJftxnxe4d/5KVCxSeRi6G4rtckRCI0
         jolHYITB5hlAs94rx72pDbftxSOn8E0/+zfodwJTaFAMr1V/F8c1XXqh+ltDP2DgJl
         3QDO43EUXr3lMO2OjrJlE+MM8m1kHIM0Z8hsHybw=
Date:   Thu, 29 Oct 2020 12:40:21 +0000
From:   Mark Brown <broonie@kernel.org>
To:     devicetree@vger.kernel.org, perex@perex.cz, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, rohitkr@codeaurora.org,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        srinivas.kandagatla@linaro.org, agross@kernel.org,
        plai@codeaurora.org, linux-arm-msm@vger.kernel.org,
        lgirdwood@gmail.com, bgoswami@codeaurora.org, tiwai@suse.com,
        bjorn.andersson@linaro.org, alsa-devel@alsa-project.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>
In-Reply-To: <1603798474-4897-1-git-send-email-srivasam@codeaurora.org>
References: <1603798474-4897-1-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v2] Asoc: qcom: lpass-sc7180: Fix MI2S bitwidth field bit positions
Message-Id: <160397520896.55401.5296685926917915952.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 27 Oct 2020 17:04:34 +0530, Srinivasa Rao Mandadapu wrote:
> Update SC7180 lpass_variant structure with proper I2S bitwidth
> field bit positions, as bitwidth denotes 0 to 1 bits,
> but previously used only 0 bit.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: lpass-sc7180: Fix MI2S bitwidth field bit positions
      commit: cf9d21984da2c8e852320d12c03ddb7d11760a32

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
