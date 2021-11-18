Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC3D456324
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 20:06:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232825AbhKRTJS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 14:09:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:57178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232799AbhKRTJS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 14:09:18 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3EC161B04;
        Thu, 18 Nov 2021 19:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637262377;
        bh=lrQXLGoucITfjQn5uVEsfBONwOxznfVVuvtAaJyD/90=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=P1ePkJJCikKeYrGJ/a8zd/euNU1R/RZLpiajZIAyjotJoWtkIoEdFyqz3rt43uffd
         Q94vWeDzVpGL5xCu6Ky5XjPgP25JVVOWVRl6PoXr++vTyogK6zdIhACbwnDU24e+pP
         VXrobUniflyQIx3ZFqiWrmEU5KrETj/5QkpgPRvO93+JoNCB2DSb4scGTqE/l0XPwS
         nfsKCZ5W3QMyUGWB+31MFpzwgCQ/hhBA+RVMM4ZIptWBJRhiAfDQIQZx1zaNV9cqUh
         hBEMejqNHtDnRuh9FnySLY4J5PMRyj+WhtIc1Xa0Y6kR9pAP6txJGVq+Xa+m3kgw/u
         NqUcbYf+bCGLg==
From:   Mark Brown <broonie@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
        rohitkr@codeaurora.org, alsa-devel@alsa-project.org,
        perex@perex.cz, agross@kernel.org, srinivas.kandagatla@linaro.org,
        swboyd@chromium.org, plai@codeaurora.org, judyhsiao@chromium.org,
        robh+dt@kernel.org, bgoswami@codeaurora.org,
        bjorn.andersson@linaro.org, tiwai@suse.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Venkata Prasad Potturu <potturu@codeaurora.org>
In-Reply-To: <1637234411-554-1-git-send-email-srivasam@codeaurora.org>
References: <1637234411-554-1-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH] ASoC: codecs: MBHC: Remove useless condition check
Message-Id: <163726237329.96213.5010626132541741636.b4-ty@kernel.org>
Date:   Thu, 18 Nov 2021 19:06:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 18 Nov 2021 16:50:11 +0530, Srinivasa Rao Mandadapu wrote:
> Remove redundant conditional check and clean code in special
> headset support functions.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: MBHC: Remove useless condition check
      commit: b38892b5b85ae54b7b867313996f967122ede42e

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
