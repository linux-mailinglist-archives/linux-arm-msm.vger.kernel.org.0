Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF4FB419D4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 19:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236592AbhI0Rsm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 13:48:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:57354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238199AbhI0Rs1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 13:48:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5371A60FC2;
        Mon, 27 Sep 2021 17:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632764809;
        bh=Xv8E3XMv7rJdlIMJuXuej3bRuGoogKs0Slzg6FGG0JI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YsK5/9uavSQ5SsWVC7nSi90dnB44wefRa4BVpitO9Z+A182jp52gxj0eiI/ox7bFg
         sM5uLSfQfjZ14vX5OyuK76XZ548cXn8fUU/HKcDSDjQPMHnyTTi3+MvESBOV60TmvN
         dBpMCnoLr8LAe6kp1S9tL/T5kB20xYGrZOou20ttNTGIVdgcuJnJRSq5R52RfQOvfV
         /T7f0LAqJ1l0m38X2gRYxs4SM/cWZ03AuXfpOPfa6edJ7hqIu7LvSUgifV7Xu6RupP
         sdlQpvUuU7MrvW9lys9m93VSPOIGLIw7xaL1LKrrHdTDFFNjq+mqk8SO17wUI/mMEw
         qgQHJr6X/coTA==
From:   Mark Brown <broonie@kernel.org>
To:     Rajesh Patil <rajpat@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>, rnayak@codeaurora.org,
        linux-kernel@vger.kernel.org, skakit@codeaurora.org,
        devicetree@vger.kernel.org, sboyd@kernel.org,
        dianders@chromium.org, msavaliy@qti.qualcomm.com,
        saiprakash.ranjan@codeaurora.org, linux-arm-msm@vger.kernel.org,
        mka@chromium.org
Subject: Re: [RESEND PATCH V10] dt-bindings: spi: Add sc7280 support
Date:   Mon, 27 Sep 2021 18:45:20 +0100
Message-Id: <163276467078.29936.10417562338523817107.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1632725335-4570-1-git-send-email-rajpat@codeaurora.org>
References: <1632725335-4570-1-git-send-email-rajpat@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 27 Sep 2021 12:18:55 +0530, Rajesh Patil wrote:
> Add compatible for sc7280 SoC.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] dt-bindings: spi: Add sc7280 support
      commit: eca17cbabd0cd52d32949b5ae27a4b3344e87781

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
