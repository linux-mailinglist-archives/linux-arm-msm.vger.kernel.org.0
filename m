Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4832D4FC63E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 23:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349983AbiDKVCg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 17:02:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349986AbiDKVCd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 17:02:33 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72B032AC43
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 14:00:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 29085B818C4
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 21:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75806C385B0;
        Mon, 11 Apr 2022 21:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649710815;
        bh=rgyK4F+NfmgtyoEKczJiPuS2Ja/eg48xU3+TQq4Vi74=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=tM4T0pLEEk12kmktzDkIBCh4DkWtG8ifGex1WxRSJ2e8Pb4upFruLf+FxHOdEqzpj
         uRyttzbtRZsUatdFhKKAOSDzXvH8jga/bqoUfjLIV3yPJIdnbkS9N6gi/VraEo4HO5
         Z9sINjYIPBIHi7GgC2O6X3RlGpOZKjqd4256WFOVWRIiH1VNJkUaIpVtJD1rvxtU4+
         Xa2pXpQo5MwkUpYTmqvAfZjyQjCgQqPFguCj8pkBsKv+mZjSDXcOZr9vjcuVtHX0Ip
         5CKAg/52UY/mZSI+eGN0i4yXTbxxKK7qhfNzggu8aRip0bC083RnnEDkNaoUiAJddJ
         CUcsSRAFvAe7w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 59970E8DD64;
        Mon, 11 Apr 2022 21:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Delete herobrine-r0
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164971081536.4542.12387499962222054645.git-patchwork-notify@kernel.org>
Date:   Mon, 11 Apr 2022 21:00:15 +0000
References: <20220308125044.1.I3e4a1a9c102d194698b68661e69efebafec8af1c@changeid>
In-Reply-To: <20220308125044.1.I3e4a1a9c102d194698b68661e69efebafec8af1c@changeid>
To:     Doug Anderson <dianders@chromium.org>
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

This patch was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Tue,  8 Mar 2022 12:52:35 -0800 you wrote:
> As talked about in commit 61a6262f95e0 ("arm64: dts: qcom: sc7280:
> Move herobrine-r0 to its own dts"), herobrine evolved pretty
> significantly after -r0 and newer revisions are pretty
> different. Nobody needs the old boards to keep working, so let's
> delete to avoid the maintenance burden.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: sc7280: Delete herobrine-r0
    https://git.kernel.org/qcom/c/9464b00e6a11

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


