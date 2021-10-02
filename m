Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30EB441F89C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Oct 2021 02:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232361AbhJBASf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 20:18:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:56136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232391AbhJBASe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 20:18:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B4E6761A38;
        Sat,  2 Oct 2021 00:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633133809;
        bh=djCM2MPz4yHHqyvVmJ7vTCfBqWgi6PNsQ/jqOwIa6+I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ExcHzP3aXHG6wAeaJIm/OsR6Om6LkYaxcMgBBTMPg8E6rwv+Htxzax50FHcI0cTsD
         GQ4sX7roiglW//DpNgcXWuyEhwj6SjwHfuTbfyUYantX31bdFALLxF+CfbFpMcAN6J
         cPMAd2xrVVl2HmGrE5wsHt2o5kN5mb/McBM3K3Axxv2xIZnTIy1xy5Z8x+2Zns0cVG
         UG4OfuO9eYnl1nv44W8Oavp3oThY844j91mhwvdR6Exuy83aEUJZUmEPJosTunTqeP
         2KGmGk4Iff3QpopD0l6EXeh8ecdU0r+iTWo17WKkmWbWGTLpbSrgp6LgcdCSdkcLLq
         Wp/YyUwDWbYMQ==
From:   Mark Brown <broonie@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: Re: [PATCH 0/2] Add PM2250 qcom_smd regulators
Date:   Sat,  2 Oct 2021 01:16:26 +0100
Message-Id: <163313363140.52167.8614698450886602712.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210926084549.29880-1-shawn.guo@linaro.org>
References: <20210926084549.29880-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 26 Sep 2021 16:45:47 +0800, Shawn Guo wrote:
> The series adds Qualcomm PM2250 smd-rpm regulators support.
> 
> Shawn Guo (2):
>   dt-bindings: regulator: Document PM2250 smd-rpm regulators
>   regulator: qcom_smd: Add PM2250 regulators
> 
> .../regulator/qcom,smd-rpm-regulator.yaml     |  4 ++
>  drivers/regulator/qcom_smd-regulator.c        | 49 +++++++++++++++++++
>  2 files changed, 53 insertions(+)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] dt-bindings: regulator: Document PM2250 smd-rpm regulators
      commit: 482f8032f496d8fa1441da742fd57fadbb17fb3d
[2/2] regulator: qcom_smd: Add PM2250 regulators
      commit: 400c93151f4160cf75e065d40e3774a18c8555a0

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
