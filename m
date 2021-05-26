Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E588439206E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235190AbhEZTF4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:41174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235847AbhEZTFT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 85CC86162A;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055808;
        bh=HSMqAVurnTOr/efdlCGgMtXwz4Tl4SUUwwa66UgorhY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Lhr4bAm3YZ5iuH6a9K7XomeVCegSzq8HRiIJXW2jR7DmEgmz0m1LzT94rHUlG61/6
         K2qSuVIsfyNIOz3I/oFHVa135KkuOfkuebGdzDLW9dfLbWJT21Zue6MBEHEjlPaWLx
         HgHpxTo/J/UDUurnMw12EmmDDYu99yOooqdgyxDqwUrvslLqlLl2Rd6iPEsEkfPDQ7
         /h3GSPPiDP2o59qFMZugVc1mkN5fOPbyFM47g/7plX1laNG9zSXOKjIGO+2uA73LDx
         0w2NiyV5mxnWy638UtQCaEfRGsriFd1M/E0daTymFbLn1JFR3HpLQ73OqUZDhAS3Vf
         GVj4qFNEK6Tyw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 81315609B2;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH V2] driver core: Use unbound workqueue for deferred probes
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580852.26840.97701715194819727.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:28 +0000
References: <1616583698-6398-1-git-send-email-ylal@codeaurora.org>
In-Reply-To: <1616583698-6398-1-git-send-email-ylal@codeaurora.org>
To:     Yogesh Lal <ylal@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 24 Mar 2021 16:31:38 +0530 you wrote:
> Deferred probe usually runs only on pinned kworkers, which might take
> longer time if a device contains multiple sub-devices. One such case
> is of sound card on mobile devices, where we have good number of
> mixers and controls per mixer.
> 
> We observed boot up improvement - deferred probes take ~600ms when bound
> to little core kworker and ~200ms when deferred probe is queued on
> unbound wq. This is due to scheduler moving the worker running deferred
> probe work to big CPUs. Without this change, we see the worker is running
> on LITTLE CPU due to affinity.
> 
> [...]

Here is the summary with links:
  - [V2] driver core: Use unbound workqueue for deferred probes
    https://git.kernel.org/qcom/c/e611f8cd8717

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


