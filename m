Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 026B7392015
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235757AbhEZTFW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:41022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235759AbhEZTE6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 59EB6613F5;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055805;
        bh=RRkuESIAMjxY+It/Z4tSdfZJVUe77U0+5Y2Pn1fJGqw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=dbG/dHYU6ur8fhrkZao29uBwAzfsclp5nqsLRNo57WcY4Ytpu2ElzLunR88nzDBZd
         Vuq2Z0JhsMZ4gQRgEKO9lkoxXuz8HFXUbO+pN+3mwLclMsxc8FcizjDzy6niVM17x9
         4emKHkUzBN6Zod/I31Q92S7SnTJmxQ1kWQghrdYnQe0gVvLW4n2IkAwaBl3NE3zJBu
         HXnkNyUVyN3oNDoCdC8poFgdi0XMCsatHc9pdrZKHXuPE/s8QY8Crd3N2egu+t7NMB
         rxU+YQB2H5EYN7QSVbGGx6fUqgCSxl9tHwSOEqZHh+hKnxqU0oEUqyMQdHg/XA0JvF
         Bi5Z+kKJxlavA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 54FEF609ED;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm: Fix removal of valid error case when checking
 speed_bin
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580534.26840.7737872105486338304.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:25 +0000
References: <20210330013408.2532048-1-john.stultz@linaro.org>
In-Reply-To: <20210330013408.2532048-1-john.stultz@linaro.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 30 Mar 2021 01:34:08 +0000 you wrote:
> Commit 7bf168c8fe8c  ("drm/msm: Fix speed-bin support not to
> access outside valid memory"), reworked the nvmem reading of
> "speed_bin", but in doing so dropped handling of the -ENOENT
> case which was previously documented as "fine".
> 
> That change resulted in the db845c board display to fail to
> start, with the following error:
> 
> [...]

Here is the summary with links:
  - drm/msm: Fix removal of valid error case when checking speed_bin
    https://git.kernel.org/qcom/c/2b0b219e5ff8

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


