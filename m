Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9D53520B1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 22:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234594AbhDAUnc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 16:43:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:34038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234276AbhDAUnb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 16:43:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57CFD610D0;
        Thu,  1 Apr 2021 20:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617309811;
        bh=VlhQGoUOqdCIYNUihDA2mj8pdQI3cX+qCuRPl+Gh2eI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ExaDY6ycp4e5cUynKGmfkCpPML+X4JyMjj2woGnGRXhutch5+k5qBd5Y0tWO+OpO+
         /B8MvQ9u2z9F8tt/1oBjKV2LX43DjQXdhL9L15aF1Go5r6S6HERvAUMcjJLK0zK3YP
         JGkN7Hqs3Mf5Lgvs3pNsPs9eUmhQnPKh8Q7KBoaulOvUTrg3fTs5f6Mtxc2fLxRk5g
         9RuEFOIGqnPymaF+boMWNtUdV9EgvAPe64II9Y41NfHmhMNAmt7QV2kyObNRdtxCGl
         rSQtdH0QfdFjUZWGS9cfykfyIjhRk6swxt44kiMSBchWQsy0z2ZvCuJ3b+7x9Fwc0a
         qki+hn5DCkIzw==
From:   Mark Brown <broonie@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        satya priya <skakit@codeaurora.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        rnayak@codeaurora.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org
Subject: Re: [PATCH V3 0/5] Add PM7325/PM8350C/PMR735A regulator support
Date:   Thu,  1 Apr 2021 21:43:17 +0100
Message-Id: <161730974895.25526.12885475666064429104.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1617192339-3760-1-git-send-email-skakit@codeaurora.org>
References: <1617192339-3760-1-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 31 Mar 2021 17:35:34 +0530, satya priya wrote:
> This series is dependent on below series which adds DT files for SC7280 SoC
> https://lore.kernel.org/patchwork/project/lkml/list/?series=488871
> 
> satya priya (5):
>   regulator: qcom-rpmh: Add pmic5_ftsmps520 buck
>   regulator: qcom-rpmh: Add PM7325/PMR735A regulator support
>   arm64: dts: qcom: sc7280: Add RPMh regulators for sc7280-idp
>   dt-bindings: regulator: Convert RPMh regulator bindings to YAML
>   dt-bindings: regulator: Add compatibles for PM7325/PMR735A
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/5] regulator: qcom-rpmh: Add pmic5_ftsmps520 buck
      commit: 9405b4f7fa78b55fc83e5b5258f00e651aed5734
[2/5] regulator: qcom-rpmh: Add PM7325/PMR735A regulator support
      commit: c4e5aa3dbee56bde70dfa03debc49bf9494fb3d9
[3/5] arm64: dts: qcom: sc7280: Add RPMh regulators for sc7280-idp
      (no commit info)
[4/5] dt-bindings: regulator: Convert RPMh regulator bindings to YAML
      commit: 7255f98d08c73f0bcf1397d3060fdb776d7aa147
[5/5] dt-bindings: regulator: Add compatibles for PM7325/PMR735A
      commit: be724fd5b60dd083c8e39a4a2652e5017d2f7a20

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
