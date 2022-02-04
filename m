Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E34C84A9F50
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 19:40:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236726AbiBDSkP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 13:40:15 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:55568 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbiBDSkN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 13:40:13 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 91CEC61C0A
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 18:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0102C004E1;
        Fri,  4 Feb 2022 18:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644000013;
        bh=RrIK0bBBtUtCiJNmlhOlPz1B8+SNF5bplO6x045mJPs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=lx97YULa7GL3JqoQ28DVpQoW5BFC0Vx5xWsj7o1N7AqvfP51/Xvq36FKS6n3DAK/1
         zyblG//QFRLo46R84e8wX/s5nwXVB3lsPV9/45Fp2U/E4EbQIK7UNu6/8Tt0Y9+blZ
         h1UhLj+3EvaODogB1pg7+85U+7FRakER9sW6vzFIur6pXgYea8SfaNM6Z9T464qnQf
         b+hArqhD7bRq4KokhhSkDIBwGPLqQNpa+pvvjHSKPyvQl4JLE9fKE5uije1DipNyQj
         rdOHTZd41vrzRRrHlq/GjkcM5Wgmd8eh8Tj2zGNlU2RnzLNP1BZHFZBx9zHpHW9ACy
         4JgLYSPcRW2yg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D8383E6BBD2;
        Fri,  4 Feb 2022 18:40:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/13] soc: qcom: mdt_loader: Support Qualcomm SM8450
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164400001287.8570.2826947792878545555.git-patchwork-notify@kernel.org>
Date:   Fri, 04 Feb 2022 18:40:12 +0000
References: <20220128025513.97188-1-bjorn.andersson@linaro.org>
In-Reply-To: <20220128025513.97188-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Thu, 27 Jan 2022 18:55:00 -0800 you wrote:
> The Qualcomm SM8450 platform comes with both some smaller changes in the
> firmware packaging and a new requirement to hold onto the metadata buffer until
> PAS auth_and_reset has been completed.
> 
> Extend the PAS api and rework the mdt_loader to meet these new requirements,
> then wire this up with the PAS remoteproc driver and finally add the SM8450
> remoteproc instances.
> 
> [...]

Here is the summary with links:
  - [01/13] firmware: qcom: scm: Introduce pas_metadata context
    https://git.kernel.org/qcom/c/3a99f121fe0b
  - [02/13] soc: qcom: mdt_loader: Split out split-file-loader
    https://git.kernel.org/qcom/c/26c1f17013a8
  - [03/13] soc: qcom: mdt_loader: Allow hash segment to be split out
    https://git.kernel.org/qcom/c/8bd42e2341a7
  - [04/13] soc: qcom: mdt_loader: Allow hash to reside in any segment
    https://git.kernel.org/qcom/c/64fb5eb87d58
  - [05/13] soc: qcom: mdt_loader: Extend check for split firmware
    https://git.kernel.org/qcom/c/ea90330fa329
  - [06/13] soc: qcom: mdt_loader: Reorder parts of __qcom_mdt_load()
    https://git.kernel.org/qcom/c/75d7213ce191
  - [07/13] soc: qcom: mdt_loader: Always invoke PAS mem_setup
    https://git.kernel.org/qcom/c/ebeb20a9cd3f
  - [08/13] soc: qcom: mdt_loader: Extract PAS operations
    https://git.kernel.org/qcom/c/f4e526ff7e38
  - [09/13] remoteproc: qcom: pas: Carry PAS metadata context
    (no matching commit)
  - [10/13] dt-bindings: remoteproc: qcom: pas: Add SM8450 PAS compatibles
    (no matching commit)
  - [11/13] remoteproc: qcom: pas: Add SM8450 remoteproc support
    (no matching commit)
  - [12/13] arm64: dts: qcom: sm8450: Add remoteproc enablers and instances
    https://git.kernel.org/qcom/c/e57f31b02784
  - [13/13] arm64: dts: qcom: sm8450-qrd: Enable remoteproc instances
    https://git.kernel.org/qcom/c/b48007d6d098

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


