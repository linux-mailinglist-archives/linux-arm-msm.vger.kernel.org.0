Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB44329256
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:43:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237399AbhCAUnV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:43:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:53288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241878AbhCAUko (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:40:44 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 1594064E22;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628782;
        bh=vQ2mGQMo+Zrmc5lpfitTPx3AOKTrQkcH4VRDhQkT410=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=akBuTlTUbhPyovFEkW8T+rIzvdfJ6QrPQLt9Yca7gcbroQHxjV8VFMHyu23nwNIRp
         c/dzYICNOyK3Vl1Q8pTomceTwwkLQurPSvAKk37quFztSV5m+TstIt0yZKpk0pQkwx
         DsEEMou3Y3dZbNkx9QSgf5dFPO5lJDirUPkVdDDKtGEntwHlgXO4YwHKYxkXXEzQ3V
         bxwrtkqNmct5g8k2/cRY/GfznpBIyl5o1a27JE3sNwvQ+GsnkbGetdsYryvvQEMsbb
         YwIKh+0t8SrzmqkYQBLQsv40fWG5SmtB5w6iZNOClZMePGWjLZbexyjIZdsXwei9zs
         Js1PBbNMXn5fA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1213060997;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/4] Add support for Qcom SMEM based NAND parser
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878207.6187.9141025376218818279.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:42 +0000
References: <20210104041137.113075-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20210104041137.113075-1-manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Mon,  4 Jan 2021 09:41:33 +0530 you wrote:
> Hello,
> 
> This series adds support for parsing the partitions defined in Shared
> Memory (SMEM) of the Qualcomm platforms supporting NAND interface.
> Current parser only supports V3 and V4 of the partition tables.
> 
> This series has been tested on SDX55 MTP board which has an onboard NAND
> device.
> 
> [...]

Here is the summary with links:
  - [v4,1/4] dt-bindings: mtd: partitions: Add binding for Qcom SMEM parser
    https://git.kernel.org/qcom/c/5f327f08192e
  - [v4,2/4] mtd: parsers: Add Qcom SMEM parser
    https://git.kernel.org/qcom/c/803eb124e1a6
  - [v4,3/4] mtd: rawnand: qcom: Add support for Qcom SMEM parser
    https://git.kernel.org/qcom/c/82bfd11f1b03
  - [v4,4/4] mtd: parsers: afs: Fix freeing the part name memory in failure
    https://git.kernel.org/qcom/c/7b844cf445f0

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


