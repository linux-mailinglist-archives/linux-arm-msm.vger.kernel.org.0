Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA444F96F6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Apr 2022 15:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236405AbiDHNjx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Apr 2022 09:39:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236439AbiDHNji (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Apr 2022 09:39:38 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 579742BA3FE
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Apr 2022 06:37:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1EADCB82B32
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Apr 2022 13:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C17D7C385B1;
        Fri,  8 Apr 2022 13:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649425049;
        bh=VXjB41nogUbNDeQpzblno0uEWC/kqgcFo6uz3g/n3gU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=PnYA1BTqZYW914VOvBCo9IjED/+AACtF72StIO337Al5cbdinDnt4webro5xvZCw+
         7eXMD18slFfXjfVHlDuTMz2DM+wVOYRM3Vt1vDp+CbZzp9v7uXYyaex0leR8Tixt2O
         LDC8VAmkaUmhqqee72RvLEIBJhlHnSRYAar8tVOnLega8LugaWMUxwbfeO34mHhWqa
         EPTDWBf//w2eqkX0ZM7o28h+SHmJ8DBBc89FchFAsjcRBbT/SULydvX1mR5+udK0ZD
         cWqDub3cJXsMqeucFSOugGfkt9z1fDIShihyzrl7/Y8Y4/qv6qZ57gbKbeIk6jh+iA
         D5R4gqWZf58Gw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 924FBE8DBDA;
        Fri,  8 Apr 2022 13:37:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH V0 0/2] DT changes for Embedded USB Debugger(EUD)
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164942504959.26125.2052959709381176286.git-patchwork-notify@kernel.org>
Date:   Fri, 08 Apr 2022 13:37:29 +0000
References: <cover.1649235218.git.quic_schowdhu@quicinc.com>
In-Reply-To: <cover.1649235218.git.quic_schowdhu@quicinc.com>
To:     Souradeep Chowdhury <quic_schowdhu@quicinc.com>
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
by Greg Kroah-Hartman <gregkh@linuxfoundation.org>:

On Wed, 6 Apr 2022 15:03:46 +0530 you wrote:
> This patch contains the DT changes for EUD from the QCOM tree.
> The DT changes have been reverted from USB tree to avoid
> conflicts. The DT changes for EUD should go through the QCOM
> tree.
> 
> Souradeep Chowdhury (2):
>   arm64: dts: qcom: sc7280: Add EUD dt node and dwc3 connector
>   arm64: dts: qcom: sc7280: Set the default dr_mode for usb2
> 
> [...]

Here is the summary with links:
  - [V0,1/2] arm64: dts: qcom: sc7280: Add EUD dt node and dwc3 connector
    https://git.kernel.org/qcom/c/a0c68e493007
  - [V0,2/2] arm64: dts: qcom: sc7280: Set the default dr_mode for usb2
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


