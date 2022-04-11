Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 195334FC642
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 23:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349968AbiDKVCf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 17:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349982AbiDKVCd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 17:02:33 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 672B62AC42
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 14:00:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 26A62B818C2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 21:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D1CCC385AF;
        Mon, 11 Apr 2022 21:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649710815;
        bh=tTeJCb324w3sZDhCZLuhK8qOQFkmuI85RJD1QPoXikQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bP9FVg7u2vC/h26VYZN0IyX2nRHaIJxjeVhijw0X6ciS3DBu0cXYPGTwmD6ZmXCG3
         x1TVy3MS4IfwIyl6kwCtBF8rcA7UFF0O8vrorCCpQwKVZuuddHsGDSCrgJXxbTIoeZ
         VM+946aH8BbsdHMzduluEp8R4r1/QHYmBe3WC4Hc7cDUaeEhqKa4SyA59onspbz1vq
         TZAyZCVu/rz6e3vpnmCctI5lxY6Xt1PQ9FiS24B/+zWC44+AUucPnsx0PEO9lMJMKM
         nE20BFNi1fJ0qz6aLscbRbFf7kOoOLxCm0gZr+C/W5KrO26Yi6oxb2z7jR7IfDW8Z/
         cJYFCyBAqhTjw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 62F1BE85B76;
        Mon, 11 Apr 2022 21:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] Fix and update fingerprint flashing on herobrine
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164971081539.4542.965906109471665938.git-patchwork-notify@kernel.org>
Date:   Mon, 11 Apr 2022 21:00:15 +0000
References: <20220317010640.2498502-1-swboyd@chromium.org>
In-Reply-To: <20220317010640.2498502-1-swboyd@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Wed, 16 Mar 2022 18:06:38 -0700 you wrote:
> This series fixes fingerprint pins on herobrine so that the flashing
> code is more reliable. Right now it fails depending on timings. The
> second patch updates the node to be compliant with the new binding
> being proposed.
> 
> This technically depends on the binding series[1] but only the second
> patch. The first patch is a fix and should be merged at the earliest
> convenience. Even the second patch could be merged and it would probably
> be OK.
> 
> [...]

Here is the summary with links:
  - [1/2] arm64: dts: qcom: sc7280-herobrine: Drop outputs on fpmcu pins
    https://git.kernel.org/qcom/c/dbcbeed94f3b
  - [2/2] arm64: dts: qcom: Fully describe fingerprint node on Herobrine
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


