Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46D5237A1D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 10:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231156AbhEKI2b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 May 2021 04:28:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:37092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231175AbhEKI21 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 May 2021 04:28:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 041D9613CF;
        Tue, 11 May 2021 08:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620721640;
        bh=xngQb/H4l+AEBkqcLavgTosOEueZ5/zsF+zrSKV7Dgc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MpeVf7eM5Bw86VyLLtpJS/EzrV+z1CuisGU4pqCPhSzfyQwx+2vmFl97LtcdOR58n
         sAeYbCkaWytBq7W2leR5GoOZ9YtwL7dYQjW1T21W6mgRkIq4MWDYVNRgo56x7SRKgW
         gFAwrnokQcQT4L19scu+9dIBZt+4UVnjvEk9PYW7PEpK9vv2agccColEYMVUaQVpCV
         yJFY0IRRx/s5rXLz1oQDP4AsMH4NNyfthVdZF5X4OxPw2EGPOnHS/N9kGPqqmwPOX6
         Dxl5SfP6q3I/Ushb6l+sdpCX5BTFiQTrO3LPt50m1/2wgu8iFbYWDSh0g7/cA81Xrz
         qBezT8U+L800w==
From:   Mark Brown <broonie@kernel.org>
To:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
        Liam Girdwood <lgirdwood@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan T <kathirav@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: regulator: qcom: Document PM8226 smd regulator
Date:   Tue, 11 May 2021 09:25:42 +0100
Message-Id: <162072067395.33366.7650476255510624158.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210502115304.8570-1-bartosz.dudziak@snejp.pl>
References: <20210502115304.8570-1-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 2 May 2021 13:53:03 +0200, Bartosz Dudziak wrote:
> Document the PM8226 SMD-RPM regulator entry.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] dt-bindings: regulator: qcom: Document PM8226 smd regulator
      commit: 00c8b0b1e6e1314bb57aab6438fbc2803c637d9d
[2/2] regulator: qcom_smd: Add PM8226 regulator support
      commit: 8c816d56a2a4e757bb121d1af4c04f47ac0572d3

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
