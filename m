Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1154D41F934
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Oct 2021 03:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232323AbhJBBi6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 21:38:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:53642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230255AbhJBBi5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 21:38:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A776E61A0A;
        Sat,  2 Oct 2021 01:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633138632;
        bh=S1iJBVNG9DMAouGbDTOh9/aGx161HWIJcwmGxISWhBY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rno/fqW3+LxPx58gzTld6Hi4mX0C72T4ydmWT4mvG+r0f2oSr+AbFQPjpebFkYUIb
         OjcAf08z18flToVp/1U4WzBmpX3qJgWug02i2vNaQbm4M5CJgkulQPN0iSn+b9xjjC
         49tn0/IguuzSI3d3TyOSxWTzGf2sMOKeOVvhHtY/bwCDMDxpAhlTo+K1bHEPwTq/ob
         cLMXb4Z128BymUAFETxzDQxju9wy5jNVjk8zSVbgNuhCc2eAYiXvMZ50G3yw314wd6
         0iovB/vFqtpO8srsQyIiy430Zg57a5s8Ha0i4KfeOoaMgXJKHHsw892r/HWxgJJcOP
         8X1yKGy1ObsxA==
From:   Mark Brown <broonie@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rajesh Patil <rajpat@codeaurora.org>,
        Andy Gross <agross@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, saiprakash.ranjan@codeaurora.org,
        linux-kernel@vger.kernel.org, rnayak@codeaurora.org,
        mka@chromium.org, msavaliy@qti.qualcomm.com, sboyd@kernel.org,
        skakit@codeaurora.org
Subject: Re: (subset) [PATCH V1 0/2] Add device tree compatible for sc7180 SoC
Date:   Sat,  2 Oct 2021 02:37:06 +0100
Message-Id: <163313862169.2275998.5804867182938981158.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <1632997450-32293-1-git-send-email-rajpat@codeaurora.org>
References: <1632997450-32293-1-git-send-email-rajpat@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 30 Sep 2021 15:54:08 +0530, Rajesh Patil wrote:
>  - As per Doug's comments
>    1. Added device tree compatible in dt-bindings
>    2. Added "qcom,sc718-qspi" in qspi node
> 
> Rajesh Patil (2):
>   dt-bindings: spi: Add sc7180 support
>   arm64: dts: qcom: sc7180: Add qspi compatible
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] dt-bindings: spi: Add sc7180 support
      commit: acde408188491ab8965c10bf82bb06600599cdd4

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
