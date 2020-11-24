Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE02A2C1D16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 05:40:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbgKXEkF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 23:40:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:59766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725797AbgKXEkE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 23:40:04 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606192804;
        bh=r+qJCBuxoOKw9mNj7S9HQqnvNnsSvV+KZ6q3KJvoZsI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=dCPF+iFyLRywswEQOXLMM7JGaKXzKRzJI0EueF18niEUX5zUwrC35cOhEFZyw9gU1
         2adpCTTOZCtm1YqkBOXpOwrJHqO5J7rqV8qnwDLMPY611553OeQ7wpTliEt00SXt2g
         +L+cQkEJjj03qNJhSdTi2B4gJYbrknYRjEIEqykE=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sort sm8150 usb_2 node
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160619280440.31288.1373735157756295769.git-patchwork-notify@kernel.org>
Date:   Tue, 24 Nov 2020 04:40:04 +0000
References: <20201124041003.3600-1-jonathan@marek.ca>
In-Reply-To: <20201124041003.3600-1-jonathan@marek.ca>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 23 Nov 2020 23:10:03 -0500 you wrote:
> Fix an error introduced resolving conflicts with camnoc_virt node.
> 
> Fixes: 0c9dde0d2015 ("arm64: dts: qcom: sm8150: Add secondary USB and PHY nodes")
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Here is the summary with links:
  - arm64: dts: qcom: sort sm8150 usb_2 node
    https://git.kernel.org/qcom/c/872b41c9a255

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


