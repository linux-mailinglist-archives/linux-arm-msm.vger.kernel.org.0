Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4DF0451AC6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 00:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343964AbhKOXnJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 18:43:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:45366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1351738AbhKOXlA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 18:41:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3AA5C63257;
        Mon, 15 Nov 2021 23:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637019305;
        bh=pPWGsdSRc3ah+Za5nl35yZ+jRecYwDbqdAFCvmivTqQ=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=YLfrj8o20Wo/XsGDGyxXCbPKBjuMweX+vvptZPnj8vt7RC9yL9b6x/Wbsf5Bsh0Uz
         1J0WKO2v9qBsglUnc9qzoaATUhWOJclaFGE8EfGFdFHaqXeMwzOcDAkS7VHEsVqEP/
         T0X2+1TWd00UQM5tzzwr/ov/HRnMtmCHTNpE+k73jc6x5kKnAnCDCc46SjbvcLvNxa
         JQHxTyrrJJTXZD9sMpfMsMMV6uqYUKxgCeC/+QuJfdXZ7RW/o526saQA80/xORbHcS
         NjTPiWdewyfaAJw+wTxVb0soDVZFXmpvlDg+Fqa2yP6InumhzndQz9zrFSY9EsbT5u
         rAyTkKLQIP7Ag==
From:   Mark Brown <broonie@kernel.org>
To:     swboyd@chromium.org, devicetree@vger.kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        perex@perex.cz, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
        plai@codeaurora.org, robh+dt@kernel.org, rohitkr@codeaurora.org,
        judyhsiao@chromium.org, linux-kernel@vger.kernel.org,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        tiwai@suse.com, bgoswami@codeaurora.org, agross@kernel.org,
        srinivas.kandagatla@linaro.org
Cc:     Venkata Prasad Potturu <potturu@codeaurora.org>
In-Reply-To: <1635938324-17763-1-git-send-email-srivasam@codeaurora.org>
References: <1635938324-17763-1-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH] ASoC: codecs: MBHC: Add support for special headset
Message-Id: <163701930197.675370.7604536221667945815.b4-ty@kernel.org>
Date:   Mon, 15 Nov 2021 23:35:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 3 Nov 2021 16:48:44 +0530, Srinivasa Rao Mandadapu wrote:
> Update MBHC driver to support special headset such as apple
> and huwawei headsets.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: MBHC: Add support for special headset
      commit: 3c8a3ad4019126f06016ab0128dde11817502f52

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
