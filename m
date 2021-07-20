Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CABC63CF224
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jul 2021 04:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344652AbhGTCBd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jul 2021 22:01:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:34110 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238037AbhGTBuS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jul 2021 21:50:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8EEA561166;
        Tue, 20 Jul 2021 02:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626748250;
        bh=4y1NktRqA9aNSgJKxmhS9QZshOI1BhOPHGDk9RyojpU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ljeZ1nHTRLbbVuHM23uvPEn1XopXAFbK6dtiE0YLN1PeVafuLv8FBNwTfrho7rIVj
         HQlf0vl9XYJNiYXbo8PqpcdH7Ei75NJ+ICRAWX6JDZWUOPZTefYlN6k/SudER2FbmQ
         fFlQ4EoizsFjdWxV04NLQmF8IKjwVqRcBp/rI1T6cRspqlg1SSndzKuchP7sJcRNZD
         ImY5Nu6cb6pExo3FkSXoG7UuNi+OHpnv7GjnvPjj+n8insQg5gL4ZbOrm3/fuf/JVj
         q7TFi061vTygOlrVOtA2ZGazT3tAA4D4aHTVLhWC7b2xCPB/oy9NKewjil9qJdJTgD
         F+dAwjc0C7QBQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8511460CE0;
        Tue, 20 Jul 2021 02:30:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] bus: mhi: Wait for M2 state during system resume
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162674825054.10695.1840155897118929054.git-patchwork-notify@kernel.org>
Date:   Tue, 20 Jul 2021 02:30:50 +0000
References: <20210524040312.14409-1-bqiang@codeaurora.org>
In-Reply-To: <20210524040312.14409-1-bqiang@codeaurora.org>
To:     Baochen Qiang <bqiang@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 24 May 2021 12:03:12 +0800 you wrote:
> During system resume, MHI host triggers M3->M0 transition and then waits
> for target device to enter M0 state. Once done, the device queues a state
> change event into ctrl event ring and notifies MHI host by raising an
> interrupt, where a tasklet is scheduled to process this event. In most cases,
> the tasklet is served timely and wait operation succeeds.
> 
> However, there are cases where CPU is busy and cannot serve this tasklet
> for some time. Once delay goes long enough, the device moves itself to M1
> state and also interrupts MHI host after inserting a new state change
> event to ctrl ring. Later CPU finally has time to process the ring, however
> there are two events in it now:
> 	1. for M3->M0 event, which is processed first as queued first,
> 	   tasklet handler updates device state to M0 and wakes up the task,
> 	   i.e., the MHI host.
> 	2. for M0->M1 event, which is processed later, tasklet handler
> 	   triggers M1->M2 transition and updates device state to M2 directly,
> 	   then wakes up the MHI host(if still sleeping on this wait queue).
> Note that although MHI host has been woken up while processing the first
> event, it may still has no chance to run before the second event is processed.
> In other words, MHI host has to keep waiting till timeout cause the M0 state
> has been missed.
> 
> [...]

Here is the summary with links:
  - [v2] bus: mhi: Wait for M2 state during system resume
    https://git.kernel.org/qcom/c/02b49cd11745

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


