Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2AD04FC63B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 23:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349980AbiDKVCd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 17:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349975AbiDKVCc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 17:02:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BDD92AC49
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 14:00:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B6076616AB
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 21:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C690C385B2;
        Mon, 11 Apr 2022 21:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649710815;
        bh=/a32jV5kJLGBCVgqaEI80CEroSrJzAlW4SS9+lafwCw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bSFNKFeDbfasVPXJCZuq/CIGFV1CV/JaFNmGzyApzZX6bCR6HyZZNacpHsj5uJBw4
         QBYCaUlApTpvbxTMpoXlQmb30/OVEZ4ZLFo1VLVgr9mnvWQaEApJ0dv5+YwN6X7b5A
         pQ6PbmmW4B4K8O0llSHljJhpoYBBOlyObtsmsV1VmY6pGy+6euJ9dk0iE1bxOS7HzP
         7QTcq1rpVFgkirIBLlEYzkTmPwiIocy506qZiOXoBM+ADuND625wNnfaPMPkIKUZBt
         BPh8WSGKKET++CQh8kTIYh4glGNts3kOYtc38TBXQkCpIA28YmVvnMbfkXClLA6r7J
         fFKc6JCB3IS7Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 758A6E73CC8;
        Mon, 11 Apr 2022 21:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/7] Add PCIe support for SM8150 SoC
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164971081547.4542.6044325752051731270.git-patchwork-notify@kernel.org>
Date:   Mon, 11 Apr 2022 21:00:15 +0000
References: <20220302203045.184500-1-bhupesh.sharma@linaro.org>
In-Reply-To: <20220302203045.184500-1-bhupesh.sharma@linaro.org>
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

This series was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Thu,  3 Mar 2022 02:00:38 +0530 you wrote:
> Changes since v2:
> -----------------
> - v2 can be found here: https://lore.kernel.org/linux-arm-msm/20220301072511.117818-1-bhupesh.sharma@linaro.org/T/
> - Fixed review comments from Dmitry and Bjorn.
> - Modified [PATCH 3/7] from v1 to include gdsc driver structs and
>   support code for PCIe0 and PCIe1 (in addition to defines for the
>   same).
> 
> [...]

Here is the summary with links:
  - [v3,1/7] dt-bindings: pci: qcom: Document PCIe bindings for SM8150 SoC
    (no matching commit)
  - [v3,2/7] dt-bindings: phy: qcom,qmp: Add SM8150 PCIe PHY bindings
    (no matching commit)
  - [v3,3/7] clk: qcom: gcc: Add PCIe0 and PCIe1 GDSC for SM8150
    (no matching commit)
  - [v3,4/7] phy: qcom-qmp: Add SM8150 PCIe QMP PHYs
    (no matching commit)
  - [v3,5/7] PCI: qcom: Add SM8150 SoC support
    (no matching commit)
  - [v3,6/7] arm64: dts: qcom: sm8150: Add PCIe nodes
    https://git.kernel.org/qcom/c/a1c86c680533
  - [v3,7/7] arm64: dts: qcom: sa8155: Enable PCIe nodes
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


