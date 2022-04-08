Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 883644F9704
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Apr 2022 15:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236431AbiDHNjq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Apr 2022 09:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236430AbiDHNjh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Apr 2022 09:39:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5753F23FF10
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Apr 2022 06:37:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4376B61551
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Apr 2022 13:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E5B1C385A3;
        Fri,  8 Apr 2022 13:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649425049;
        bh=ExhCSlOtQgX2Hy+r3X+eo+YpjxAZ/9q+s9MuXwJrT6g=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=XJdkuWugv7MDCoMYPYiQKGzLRBSSruJaOThlQ+jRZMnUnJRW56clCtPTe4+fgLBRI
         Ji8SK5r3CiBLKBdDSJG5pIFVgoVbqhioM/z5NhFJ/S/finRadQpL0wOIymmh77rWgW
         2qOKNcU7TY/FcEqcAwbSXNQgoYnSkHH0iOQK9gw8wf8PYkoxGwGLUBWNwSDaIkh5h7
         VBIREFH81U6J6lczDpsjQ+NPWP/4DnpR7mZA9rgdi3+QvCL/7MrgAdD4/xkIAvIW63
         FdCm5dc2WJEVEgg2owZnx+DM6JiwbHHYtXuGT5OHZVBWWMZVQ1f317XwDM4MPWCPdi
         qMjLgHcGEmVVg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 827A7E6D402;
        Fri,  8 Apr 2022 13:37:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 1/1] arm64: dts: qcom: sm8150: Add ufs power-domain entries
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164942504952.26125.15405459457429746154.git-patchwork-notify@kernel.org>
Date:   Fri, 08 Apr 2022 13:37:29 +0000
References: <20220323203052.1124683-1-bhupesh.sharma@linaro.org>
In-Reply-To: <20220323203052.1124683-1-bhupesh.sharma@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
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

On Thu, 24 Mar 2022 02:00:52 +0530 you wrote:
> Add power-domain entries for UFS phy node in sm8150 dts.
> 
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
> Changes since v3:
> 
> [...]

Here is the summary with links:
  - [v4,1/1] arm64: dts: qcom: sm8150: Add ufs power-domain entries
    https://git.kernel.org/qcom/c/a0fa9be9a735

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


