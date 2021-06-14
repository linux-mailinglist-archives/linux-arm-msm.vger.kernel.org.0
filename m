Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 057BB3A6F8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jun 2021 21:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235534AbhFNT4y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Jun 2021 15:56:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:52984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235518AbhFNT4v (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Jun 2021 15:56:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2B6D3611EE;
        Mon, 14 Jun 2021 19:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623700488;
        bh=YzulUFMFki/iYiWjf8Var0pCv66AUmtnxzcZgz7kSHc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=A19LLbD3NvVDOSHJTkzTIi1NZHF26MsG7BJ6+awHPVUtnnWmTYE8FEhNB/lrxMV4U
         EMKMWqWP5y+6AvTPKbN7fZpGm3t0FVaQbVTv4cfSoV2pFBqTae/6ekMy+o9V4NdNsc
         UzGat7jDYk4+L6kkGNaxU9t+bgGmgHfni2IJZV422GDdo/8p5xQjbpYizvAM4XGT0D
         uwVFUR7JXAynpwxVy4lW0uF4m/F4uupRY/Eqgb+z83qDFR6uIWpnE81SwDG+Yv8kfV
         y4AX9LlZbQQTc0NPMAGiQ+ivRxAAh/VDREch9Uw63KyNNpXkBc7QAB1tETmKKdbSB0
         O9ntoBlQpODpg==
From:   Mark Brown <broonie@kernel.org>
To:     agross@kernel.org, srinivas.kandagatla@linaro.org,
        rohitkr@codeaurora.org, perex@perex.cz,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        plai@codeaurora.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
        robh+dt@kernel.org, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, lgirdwood@gmail.com,
        devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
        judyhsiao@chromium.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org
Cc:     Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3] ASoC: qcom: Add four speaker support on MI2S secondary
Date:   Mon, 14 Jun 2021 20:53:42 +0100
Message-Id: <162369994008.34524.16929754677790147790.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210609133039.4648-1-srivasam@codeaurora.org>
References: <20210609133039.4648-1-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 9 Jun 2021 19:00:39 +0530, Srinivasa Rao Mandadapu wrote:
> Add four speaker support on MI2S secondary block
> by using I2S SD1 line on gpio52 pin, and add channel map
> control support in the lpass-cpu audio driver.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: Add four speaker support on MI2S secondary
      commit: c223f41c1a52bfe10f1d3311679b1d1f9813e500

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
