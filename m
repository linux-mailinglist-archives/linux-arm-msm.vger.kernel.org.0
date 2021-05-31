Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EAFF39696E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 23:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231690AbhEaVvu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 17:51:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:39230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231678AbhEaVvq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 17:51:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 371CD61364;
        Mon, 31 May 2021 21:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622497806;
        bh=Ub8nzzGP4mXfeMG9XwZNIi3VpKbaQWZ0nslSTKC58qc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=KQf7saeDoxrmE21Pvmcru+V+jJWMypr+xjwUb8os39TFPkDvjI3QQo9CjvmDRZXfE
         RqiMRA6Kbf9vXX3JF0oiAJ8IaHSam++LwR7qRDjf0ljdZwKQCv4istZAqDrrbd5UaY
         OttAvSGY8OlbFORGwCuH0NuwlMEROVbA1SNqQ5bA+83PoPyqo61t5KH9kMMY5AE7n/
         Ugxbou7Y2Iyde69vOFa6QsU8Bqgxba1VuOEb6GjHb4T+gdW29gNdSIIhT93Z7FjI+q
         jSJPcjoADYe4ir2z3XGuU6sbpHVoROUtZJFaFzjwxkFG80PPT922vK0nE4wtCoUjMl
         /g5xO2wou1xMg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 30BE5609D9;
        Mon, 31 May 2021 21:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8350: fix the node unit addresses
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162249780619.3521.2095625731154923837.git-patchwork-notify@kernel.org>
Date:   Mon, 31 May 2021 21:50:06 +0000
References: <20210513060733.382420-1-vkoul@kernel.org>
In-Reply-To: <20210513060733.382420-1-vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 13 May 2021 11:37:33 +0530 you wrote:
> Some node unit addresses were put wrongly in the dts, resulting in
> below warning when run with W=1
> 
> arch/arm64/boot/dts/qcom/sm8350.dtsi:693.34-702.5: Warning (simple_bus_reg): /soc@0/thermal-sensor@c222000: simple-bus unit address format error, expected "c263000"
> arch/arm64/boot/dts/qcom/sm8350.dtsi:704.34-713.5: Warning (simple_bus_reg): /soc@0/thermal-sensor@c223000: simple-bus unit address format error, expected "c265000"
> arch/arm64/boot/dts/qcom/sm8350.dtsi:1180.32-1185.5: Warning (simple_bus_reg): /soc@0/interconnect@90e0000: simple-bus unit address format error, expected "90c0000"
> 
> [...]

Here is the summary with links:
  - [v2] arm64: dts: qcom: sm8350: fix the node unit addresses
    https://git.kernel.org/qcom/c/1dee9e3b0997

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


