Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72D8432925C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240321AbhCAUny (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:43:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:53176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237544AbhCAUkR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:40:17 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id D09CD64DF5;
        Mon,  1 Mar 2021 19:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628781;
        bh=D8fTOX7cRjo+8EBiMgTu5UTtf42Pax5Mly6IYupDa+o=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=N85DwzXZcseUiMmxmVW/GhHy743HuT1S2dXiDHHTOLAEAUM0sWs1tEa7ImRwJ0c9k
         yoV1CSveA/tTZ28XJlYyBeS+i3P5y/1U7lfBzwqo1YBpvVONWFT2+BM+Ia+UdP/+Ur
         53l6PIei2oUDXOgjrHZFf7bxjU6q9/dHRFiYMEroT7dsqYifl1UjDYrfzHnA1rish2
         wKfnauQQqtQ4ACTFuLFZeG7v/ATWj5Km9/YyiRe3krRxgwj3z3WvQT8eScwbxnb2Td
         kWYytbu2HPYdH3iMtOsoNRBr9ZHh3NLvTBTF+uZ7Jz6oBheXtTMpg59JYCseNFbbOx
         FegA+eAQd1Big==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id CA9FF60C27;
        Mon,  1 Mar 2021 19:59:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH V8 0/1] Implement Shutdown callback for geni-i2c
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878182.6187.15233200343392219449.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:41 +0000
References: <20210108150545.2018-1-rojay@codeaurora.org>
In-Reply-To: <20210108150545.2018-1-rojay@codeaurora.org>
To:     Roja Rani Yarubandi <rojay@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  8 Jan 2021 20:35:44 +0530 you wrote:
> Hi,
> 
> Other two patches of this series have been picked, posting this patch
> with fixing minor comments.
> 
> Roja Rani Yarubandi (1):
>   i2c: i2c-qcom-geni: Add shutdown callback for i2c
> 
> [...]

Here is the summary with links:
  - [V8,1/1] i2c: i2c-qcom-geni: Add shutdown callback for i2c
    https://git.kernel.org/qcom/c/e0371298ddc5

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


