Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB193287E69
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 00:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgJHWBh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Oct 2020 18:01:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:53650 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725852AbgJHWBh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Oct 2020 18:01:37 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 78C6822241;
        Thu,  8 Oct 2020 22:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602194497;
        bh=1Trx4y8lWFXd32x7Lp/9FsQLAB6JWNO65LqIwTr929A=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=znBIJHMFMH53R7iQ6Ha+M+ULw6+xqcfRiE6fFTHeWloGEp7X4jnciw9VOXHWMMPIO
         w9kMFSCrU5MuyMD9oRKnkErO1wR3Se/eQkg9WfPt1qyl91Limd7PdgZKytwsmYAdiO
         zkVzW/+zW+a9L+rGdjinCof4Ap6bFPmXUqtJv36E=
Date:   Thu, 08 Oct 2020 23:01:34 +0100
From:   Mark Brown <broonie@kernel.org>
To:     devicetree@vger.kernel.org, bgoswami@codeaurora.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
        linux-arm-msm@vger.kernel.org, lgirdwood@gmail.com,
        bjorn.andersson@linaro.org,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        robh+dt@kernel.org, agross@kernel.org, plai@codeaurora.org,
        linux-kernel@vger.kernel.org, tiwai@suse.com,
        alsa-devel@alsa-project.org, perex@perex.cz
In-Reply-To: <1602134223-2562-1-git-send-email-srivasam@codeaurora.org>
References: <1602134223-2562-1-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v11 0/7] Qualcomm's lpass-hdmi ASoC driver to support audio over dp port
Message-Id: <160219448332.29664.6810740521715495883.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 8 Oct 2020 10:46:56 +0530, Srinivasa Rao Mandadapu wrote:
> These patches are to support audio over DP port on Qualcomm's SC7180 LPASS
> Asoc. It includes machine driver, cpu driver, platform driver updates for
> HDMI path support, device tree documention, lpass variant structure
> optimization and configuration changes.
> These patches depends on the DP patch series
> https://patchwork.kernel.org/project/dri-devel/list/?series=332029
> https://lore.kernel.org/patchwork/project/lkml/list/?series=464856
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: Add sc7180-lpass binding header hdmi define
      commit: 12fbfc4cabec65950bb0cc10eab0fc5c4c4d039f
[2/7] ASoC: dt-bindings: Add dt binding for lpass hdmi
      commit: 8e3fdc52ccc64c64912b4785a39f525db9db1fbc
[3/7] Asoc:qcom:lpass-cpu:Update dts property read API
      commit: 4049a3b87847fec754632d233bffbd608364917f
[4/7] Asoc: qcom: lpass:Update lpaif_dmactl members order
      commit: d9e8e61243958409645c18c9267b6dbaaaf22364
[5/7] ASoC: qcom: Add support for lpass hdmi driver
      commit: 7cb37b7bd0d3c93e381ae7abf30971819966bd9d
[6/7] Asoc: qcom: lpass-platform : Increase buffer size
      commit: 03f20e209d07968c410fc404b3d636dc446d3ef2
[7/7] ASoC: qcom: sc7180: Add support for audio over DP
      commit: 2ad63dc8df6b6108aee82dc77c820e3918bc0a65

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
