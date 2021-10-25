Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 716C643A29C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 21:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237557AbhJYTuc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 15:50:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:36944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235738AbhJYTrY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 15:47:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1772561205;
        Mon, 25 Oct 2021 19:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635190820;
        bh=7i0EGCIRB4HrVnhBD2qDiI6GxHmFk3q3ZtD9GUd1INA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IZYbzKSAk4vMkqevR8sy5nqAFXwOoSEHNjogCmvkDtWsYdgskXTD55Ei3quSLi94M
         Tz9Qut0hR+P5PJ8rOxjSr0+3M4TZHsvMkx6fPyWU1MqeqHWx2pF+VhEhiNMfD5qgF8
         TAFp8Um1yuM9lCuSNkBaHcjktU0lAszMP2DqG1SweVLNdYExWfAXrtONGM3aQXfFt9
         EuPTF1C92aqmiJ0Mky79Tik4ni4tSvZHlzX29hxf6JC62o/AbnryKX11+HbAxmuwka
         o8R9oFc5EufcPhddizzL3lGuaJ4PBzNJzTVZePfkYBEJ5U7tG6f9587RXP0GM8Cgj+
         dEL+I6AvuI8dw==
From:   Mark Brown <broonie@kernel.org>
To:     alsa-devel@alsa-project.org, plai@codeaurora.org,
        srinivas.kandagatla@linaro.org, devicetree@vger.kernel.org,
        perex@perex.cz, lgirdwood@gmail.com, judyhsiao@chromium.org,
        bjorn.andersson@linaro.org, swboyd@chromium.org, tiwai@suse.com,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        rohitkr@codeaurora.org, bgoswami@codeaurora.org
Cc:     Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3] ASoC: dt-bindings: lpass: add binding headers for digital codecs
Date:   Mon, 25 Oct 2021 20:40:12 +0100
Message-Id: <163519067112.407220.9849529941824458080.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <1633670491-27432-1-git-send-email-srivasam@codeaurora.org>
References: <1633670491-27432-1-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 8 Oct 2021 10:51:31 +0530, Srinivasa Rao Mandadapu wrote:
> Add header defining for lpass internal digital codecs rx,tx and va
> dai node id's.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: lpass: add binding headers for digital codecs
      commit: de6e9190a8a74d55ed936ec483919b328bbbbf5c

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
