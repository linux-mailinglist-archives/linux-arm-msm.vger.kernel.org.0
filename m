Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B24C1ACA61
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 17:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392190AbgDPPee (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 11:34:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:46502 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2634433AbgDPPeW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 11:34:22 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8132F22244;
        Thu, 16 Apr 2020 15:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587051262;
        bh=cm5eKnHDf7WtBLQg4e4NaXwt9ZqZ+pLml8cOimogapc=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=b4W9GgOXN/tS7grTIz9CDv4DUjSrIlCNQHob785c8VYERJqv1rOX4qR6zIw/deXRv
         n2hQyhWBnifk8HYUqbbUoVkxBYpVd4U4qgXO2JMRxoGuqYpuJXh16xzjvZ2iTrlWbS
         V/OOISaMNNInmoGKm9GsYAjr/rggvJeb0Z2B0B/8=
Date:   Thu, 16 Apr 2020 16:34:19 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc:     devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        alsa-devel@alsa-project.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20200415081159.1098-1-stephan@gerhold.net>
References: <20200415081159.1098-1-stephan@gerhold.net>
Subject: Re: [PATCH 1/2] dt-bindings: ASoC: qdsp6: Suggest more generic node names
Message-Id: <158705078452.48712.10956473806918313608.b4-ty@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 15 Apr 2020 10:11:58 +0200, Stephan Gerhold wrote:
> Change the listed examples to use more generic node names, representing
> the class of the device nodes:
> 
>   - apr-service@<id>
>   - dai@<id>
> 
> Both names are already in use in arch/arm64/boot/dts/qcom/sdm845.dtsi.
> 
> [...]

Applied, thanks!

[1/2] ASoC: qdsp6: Suggest more generic node names
      commit: 35c638d039bbabbca7affb52960d468951d811c1
[2/2] dt-bindings: soc: qcom: apr: Use generic node names for APR services
      (not applied)

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
