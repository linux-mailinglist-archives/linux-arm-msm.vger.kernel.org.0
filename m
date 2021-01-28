Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58E4E308003
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 21:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231267AbhA1U4O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jan 2021 15:56:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:56250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231235AbhA1U4H (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jan 2021 15:56:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6EB9964DDB;
        Thu, 28 Jan 2021 20:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611867326;
        bh=1Q3JBbzrKlWRCyGG2/vnKM+0MChylTS66CNfZCbA83s=;
        h=From:To:In-Reply-To:References:Subject:Date:From;
        b=W2AmedK8qteza6t210CV/04DlkSh4wmuXEyHvn4+d6/UTDb61kzk9dk14593RdgV4
         qtMMwcvtaDyY0uXkqcu95Gef2utD3hbfV/CPk+chhWQGJEbdjgNrc7ZNm/jMSXQDpM
         ZCEoQAwZE6OglIFrQ6G1n/uVfSHfGQaC+vAGYZsUEt/nf+LYbAn0XyzleKxVkGcSLe
         2kEC4PXDzBeDDalioxGRjR2BE/RVIaGpSpj5sg14PAXienTIlTCaIbmHTKIMZIFlog
         mXrVlnMqAaRtMgMbifNMncXHgvbADwA36ARZn1eLqpIbd4YLlxipUWhaX/nred/guT
         +SGS1DMIBqUzw==
From:   Mark Brown <broonie@kernel.org>
To:     bgoswami@codeaurora.org, linux-arm-msm@vger.kernel.org,
        plai@codeaurora.org, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        alsa-devel@alsa-project.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, perex@perex.cz, devicetree@vger.kernel.org,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org
In-Reply-To: <20210127151824.8929-1-srivasam@codeaurora.org>
References: <20210127151824.8929-1-srivasam@codeaurora.org>
Subject: Re: [PATCH v2] ASoC: qcom: lpass-cpu: Remove bit clock state check
Message-Id: <161186727762.43763.16675933644941230011.b4-ty@kernel.org>
Date:   Thu, 28 Jan 2021 20:54:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 27 Jan 2021 20:48:24 +0530, Srinivasa Rao Mandadapu wrote:
> No need of BCLK state maintenance from driver side as
> clock_enable and clk_disable API's maintaing state counter.
> 
> One of the major issue was spotted when Headset jack inserted
> while playback continues, due to same PCM device node opens twice
> for playaback/capture and closes once for capture and playback continues.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: lpass-cpu: Remove bit clock state check
      commit: 6c28377b7114d04cf82eedffe9dcc8fa66ecec48

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
