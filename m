Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B0D02C1C8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 05:10:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728711AbgKXEKL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 23:10:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:46902 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728687AbgKXEKJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 23:10:09 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606191008;
        bh=bLiCt9P4I7qGtE8LHbslMqQ1YZwk7IPeYGl30mOsgZM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ISAw+KChnLofdjOoakLrzSc0t/0YaPWOoFL8xtyxDf6fIICDbb67+OUn4871jt35W
         eSHrCznEUJsDKwA+6bQUI1zJyC6riU18TVi1FzP1vnE7aA1v7bvMTaTOmEnJ4z5ohi
         27KtZSG4lShc3bdxwk7oVIfSnlYC2F6VZba9X2JA=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] arm64: dts: qcom: add sm8250 fastrpc nodes
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160619100863.17117.5406369770433216945.git-patchwork-notify@kernel.org>
Date:   Tue, 24 Nov 2020 04:10:08 +0000
References: <20200908131500.19891-1-jonathan@marek.ca>
In-Reply-To: <20200908131500.19891-1-jonathan@marek.ca>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  8 Sep 2020 09:15:00 -0400 you wrote:
> Add fastrpc nodes for sDSP, cDSP, and aDSP.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
> v2: rebase without audio dts nodes, changed "dsps" to "sdsp"
> 
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 115 ++++++++++++++++++++++++++-
>  1 file changed, 113 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [v2] arm64: dts: qcom: add sm8250 fastrpc nodes
    https://git.kernel.org/qcom/c/256958086de9

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


