Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0615B4C788B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Feb 2022 20:15:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbiB1TQc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 14:16:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbiB1TQb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 14:16:31 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45ECFE4498;
        Mon, 28 Feb 2022 11:15:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D7325B8162F;
        Mon, 28 Feb 2022 19:15:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5070DC340F2;
        Mon, 28 Feb 2022 19:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646075742;
        bh=rKHN0tABQaAaxZGmbVUu6SNde2wmYhf2Ll+XbGWr9NE=;
        h=From:To:In-Reply-To:References:Subject:Date:From;
        b=shfwThSZNZuNKWBahhXUVqLxgnTEBvDCLAQzOUP7VoE3++J+qzsfTO3zIGbZ2gOqw
         XVj73sMm7GIyEsO2+UniOaqzJawRCvIe9W8hKY4Gy30j6oBTFsMTSkc0ejSyuGp1nH
         kzriIYWpT43tEQU2/bMWYKURtvz96CfwCPmdiiv99AexI2jL8KRHhB4W4eXh0uuyrw
         g1HT35Q5KapaUD0LNz8by0H2QxxY/7NW5qmBwx9EDdZ2L3A1paO+f8L4pupnVAeI34
         l3jC7dEDQGlrSqGxBVI9tIREPPTI7X4cKh30iwYcqhPbmiHJUP9snNnM5y3HmlnkaV
         YYWvwb9aZWpwQ==
From:   Mark Brown <broonie@kernel.org>
To:     linux-arm-msm@vger.kernel.org, perex@perex.cz,
        linux-kernel@vger.kernel.org, bgoswami@codeaurora.org,
        tiwai@suse.com, lgirdwood@gmail.com, swboyd@chromium.org,
        agross@kernel.org, judyhsiao@chromium.org,
        alsa-devel@alsa-project.org, bjorn.andersson@linaro.org,
        srinivas.kandagatla@linaro.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        rohitkr@codeaurora.org, quic_plai@quicinc.com
In-Reply-To: <1645786624-12311-1-git-send-email-quic_srivasam@quicinc.com>
References: <1645786624-12311-1-git-send-email-quic_srivasam@quicinc.com>
Subject: Re: [PATCH v4 0/2] Add power domains support for digital macro codecs
Message-Id: <164607573904.3538791.16540077443386812939.b4-ty@kernel.org>
Date:   Mon, 28 Feb 2022 19:15:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 25 Feb 2022 16:27:02 +0530, Srinivasa Rao Mandadapu wrote:
> This patch set is to add power domains support for RX, TX and VA macros.
> 
> Changes since v3:
>     -- Add dt-bindings support.
> Changes since v2:
>     -- Remove redundant local variable.
>     -- Update pds error handling sequence.
>     -- Update module description.
>     -- Clean up pds init function.
>     -- Remove redundant arguments.
> Changes since v1:
>     -- Add missing macros in Kconfig.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: Add power domains support in digital macro codecs
      commit: 9e3d83c52844f955aa2975f78cee48bf9f72f5e1
[2/2] ASoC: qcom: dt-bindings: Add bindings for power domains in lpass digital codecs
      commit: 6619c7d4379aca716a90f7581be2853071c086f6

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
