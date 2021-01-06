Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72DF82EB8AA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 04:51:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725813AbhAFDus (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 22:50:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:46908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725808AbhAFDus (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 22:50:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 9621922D04;
        Wed,  6 Jan 2021 03:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609905007;
        bh=rqQWbfdAfKxBg/8yoWit569NiDqTZ5aY0xUErLm7PXQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=btgazgZXLF1vEylvLMtyMmet9whq4Uzh/aEsLpHnFxnCTwaQTSfyBJA4oqyL4/P7q
         TKVWOgaTsV59yZaFqJ14c9kAj/di7oHDWrJD7fkR3QdohmglrAWkEK1sgs1l88K08P
         Ob99xKTx9Davx5OCUDfcKEji91TtsgXV1IivQI2XCpX6nYrQKkMIDSnaPmC+N4+ohn
         TujS/S/1ze5ldtixeK4WzT9CIaAS5foQZteLkMZkigoIY9vtJUThbe/9VwN9MMM01a
         6w/HVtVI/8NNM97rv41kVAU1HdPAhKuMG44dphnL33apwzhBCvPpFi3q2V/EwczgGt
         nlf+S2vjL/kwA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 83D0960385;
        Wed,  6 Jan 2021 03:50:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/3] CPU power management for SM8150
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160990500753.17330.13439754642510472376.git-patchwork-notify@kernel.org>
Date:   Wed, 06 Jan 2021 03:50:07 +0000
References: <20201221002907.2870059-1-danny@kdrag0n.dev>
In-Reply-To: <20201221002907.2870059-1-danny@kdrag0n.dev>
To:     Danny Lin <danny@kdrag0n.dev>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Sun, 20 Dec 2020 16:29:04 -0800 you wrote:
> These patches add support for high-level CPU power management on the
> SM8150 platform. cpuidle and energy-aware scheduling are now working
> with the new idle states and CPU energy model.
> 
> Danny Lin (3):
>   arm64: dts: qcom: sm8150: Define CPU topology
>   arm64: dts: qcom: sm8150: Add PSCI idle states
>   arm64: dts: qcom: sm8150: Add CPU capacities and energy model
> 
> [...]

Here is the summary with links:
  - [1/3] arm64: dts: qcom: sm8150: Define CPU topology
    https://git.kernel.org/qcom/c/066d21bcf605
  - [2/3] arm64: dts: qcom: sm8150: Add PSCI idle states
    https://git.kernel.org/qcom/c/81188f585d02
  - [3/3] arm64: dts: qcom: sm8150: Add CPU capacities and energy model
    https://git.kernel.org/qcom/c/5b2dae72187d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


