Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 489D92C1C8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 05:10:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728696AbgKXEKK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 23:10:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:46912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728714AbgKXEKJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 23:10:09 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606191008;
        bh=bdr0Rn4DNYGASePK7w2gEshkqn2vvLVCGWk0lJMXuGI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=STouNkxJqq4fTx80PYM0lzVfJMvf75fqU9p4/UkvDQtoGSEupqNYD5O2jBUB8Z9n0
         UKBRdwiuuUp8erWahMqsfDxBAOqSMD8DTFbTpSzW1OFjCy7duenpx7+WK7xKivhISM
         JGLwIb8BO6rrI8S5/nB39LVHdMcqbeq97lF7vVv0=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: fix serial output for sm8250-hdk
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160619100884.17117.13251263021246929019.git-patchwork-notify@kernel.org>
Date:   Tue, 24 Nov 2020 04:10:08 +0000
References: <20201123143538.14198-1-jonathan@marek.ca>
In-Reply-To: <20201123143538.14198-1-jonathan@marek.ca>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 23 Nov 2020 09:35:38 -0500 you wrote:
> The uart2 node has been renamed, apply the change to sm8250-hdk dts too so
> that serial output works.
> 
> Fixes: 91ed0e90fc49 ("arm64: dts: qcom: add sm8250 hdk dts")
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: fix serial output for sm8250-hdk
    https://git.kernel.org/qcom/c/2802821a66f9

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


