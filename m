Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADE81507B1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 22:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238611AbiDSUnC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 16:43:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346381AbiDSUnA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 16:43:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51803192A6
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 13:40:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DE5E761684
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 20:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44E1CC385A5;
        Tue, 19 Apr 2022 20:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650400815;
        bh=xUvxYuBbXpWzma2uKyfhR9VRnt0r4U6JMhFigSMovMo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bUGNAWIx/BhlkvNktlZWBcke/mOkLp9jFLjaNYv4oXwVNUKUpfLgX9gVaSqYnLOgj
         Wh/pFcEliqtPUEPEL73smRj6lWQUo3glHFmyct1kPPtKM40pERPMMYklRDzXHK+ao2
         jQUomBA9c+WBl9VCGLvoWoBDVXHnZic29q/eWeJrCqjTpNLd72pxv9Q19tF+sjCMmw
         UWG9TjuPxbCNpXDabbdiRhjpOvkuPJAIkqR1CbpvTVFFEn1gE1VP0c6NBMFzDrmV63
         IDygt+KpsiJbTWcRxKCBgrC5nJLV8dAhUnCUVBDJ1QJq9KATXYksTHQ5DcMwkwV+Kj
         3O1R2YMl22l1g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 26678E8DD61;
        Tue, 19 Apr 2022 20:40:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v14 0/7] USB DWC3 host wake up support from system suspend
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <165040081515.22799.4337799175831545587.git-patchwork-notify@kernel.org>
Date:   Tue, 19 Apr 2022 20:40:15 +0000
References: <1650395470-31333-1-git-send-email-quic_c_sanm@quicinc.com>
In-Reply-To: <1650395470-31333-1-git-send-email-quic_c_sanm@quicinc.com>
To:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

On Wed, 20 Apr 2022 00:41:03 +0530 you wrote:
> Avoiding phy powerdown in host mode when wakeup capable devices are
> connected, so that it can be wake up by devices.
> Keep usb30_prim gdsc active to retain controller status
> during suspend/resume.
> 
> Changes in v14:
> Added patch for device_children_wakeup_capable.
> Used device_children_wakeup_capable instead of usb_wakeup_enabled_descendants.
> Fixed minor nit picks in v13 reported by Matthias.
> 
> [...]

Here is the summary with links:
  - [v14,1/7] dt-bindings: usb: dwc3: Add wakeup-source property support
    (no matching commit)
  - [v14,2/7] PM / wakeup: Add device_children_wakeup_capable()
    (no matching commit)
  - [v14,3/7] usb: dwc3: core: Host wake up support from system suspend
    (no matching commit)
  - [v14,4/7] usb: dwc3: qcom: Add helper functions to enable,disable wake irqs
    (no matching commit)
  - [v14,5/7] usb: dwc3: qcom: Configure wakeup interrupts during suspend
    (no matching commit)
  - [v14,6/7] usb: dwc3: qcom: Keep power domain on to retain controller status
    (no matching commit)
  - [v14,7/7] arm64: dts: qcom: sc7280: Add wakeup-source property for USB node
    https://git.kernel.org/qcom/c/97276cbfb4fb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


