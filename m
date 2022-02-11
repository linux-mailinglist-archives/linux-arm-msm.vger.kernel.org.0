Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA3DF4B2B60
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Feb 2022 18:10:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232591AbiBKRKW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Feb 2022 12:10:22 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234388AbiBKRKV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Feb 2022 12:10:21 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE7F021F
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 09:10:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5C5F661ABA
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 17:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF648C340F1;
        Fri, 11 Feb 2022 17:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644599418;
        bh=oKJAyO2YAGvFfujx9mCMG8nPxP/1NsHJ1Rvid2RWWgk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Er+vo3B2MSrrP+NqF0ZspWLr8rydH9WhD5Bw8eBXg3ebG3+L+FdFZpSi8lbm7PQCe
         Hp9KmZ8BYZhimZ4Yoa6g8yDuHYc8LjBPcQePD7YK8EV9b8ozKUYzn4J17vrBXkwRs1
         9mG97tFd4kYH+rbmnicQP40KHtauyk+we4vAU7mXtTf+BWHBjOzCRmaISem1XM7h98
         rP+DMEqfTnjJC0fJlqJ2l68Hv8gAq3cAaXr1CqARLh6M1FQEkiuKz+NJqsW5IuRcRm
         WQ6P9/JSaHDJ9tKsTuXmWAwrTJWgJ/LA+oEZhxVXKds5A60HXyIeKAc9uGqMK+BMU5
         bPvYSm0iVFraA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A7A08E6D45A;
        Fri, 11 Feb 2022 17:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv2 0/9] soc: qcom: llcc: Add LLCC support for SM8450 SoC
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164459941868.13057.17422878968199883193.git-patchwork-notify@kernel.org>
Date:   Fri, 11 Feb 2022 17:10:18 +0000
References: <cover.1643355594.git.quic_saipraka@quicinc.com>
In-Reply-To: <cover.1643355594.git.quic_saipraka@quicinc.com>
To:     Sai Prakash Ranjan <quic_saipraka@quicinc.com>
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

On Fri, 28 Jan 2022 13:17:07 +0530 you wrote:
> This patch series adds support for LLCC on SM8450 SoC. It mainly
> consists of LLCC driver changes to incorporate newer LLCC HW found
> on SM8450 SoC and the corresponding DT bits to enable LLCC.
> Based on qcom/for-next branch.
> 
> Changes in v2:
>  * Fix version assignment to drv_data.
> 
> [...]

Here is the summary with links:
  - [PATCHv2,1/9] soc: qcom: llcc: Add support for 16 ways of allocation
    https://git.kernel.org/qcom/c/06b24ab36440
  - [PATCHv2,2/9] soc: qcom: llcc: Update the logic for version info extraction
    https://git.kernel.org/qcom/c/8008e7902f28
  - [PATCHv2,3/9] soc: qcom: llcc: Add write-cache cacheable support
    https://git.kernel.org/qcom/c/2b8175a1f108
  - [PATCHv2,4/9] soc: qcom: llcc: Add missing llcc configuration data
    https://git.kernel.org/qcom/c/bc88a42075cd
  - [PATCHv2,5/9] soc: qcom: llcc: Update register offsets for newer LLCC HW
    https://git.kernel.org/qcom/c/424ad93c23e2
  - [PATCHv2,6/9] soc: qcom: llcc: Add configuration data for SM8450 SoC
    https://git.kernel.org/qcom/c/a6e9d7ef252c
  - [PATCHv2,7/9] dt-bindings: arm: msm: Add LLCC compatible for SM8350
    https://git.kernel.org/qcom/c/c4bfcb73b609
  - [PATCHv2,8/9] dt-bindings: arm: msm: Add LLCC compatible for SM8450
    https://git.kernel.org/qcom/c/c9413e3e1e59
  - [PATCHv2,9/9] arm64: dts: qcom: sm8450: Add LLCC/system-cache-controller node
    https://git.kernel.org/qcom/c/1dc3e50eb680

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


