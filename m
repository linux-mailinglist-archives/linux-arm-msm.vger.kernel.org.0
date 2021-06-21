Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81FEA3AEFBC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 18:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232904AbhFUQlm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 12:41:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:33922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233297AbhFUQjm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 12:39:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B24726143C;
        Mon, 21 Jun 2021 16:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624293002;
        bh=EkiwXqfKR7xjSe1qcgFNCM6XTwJNCq9EJTYNEbgJQHw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ex5sKwZouow4XdxsALwfDnKoDEL5PHhJ8sT7L7kk7p7OoH+mtvD9ZIHsu/M/Uo4il
         NMTbSd4F9XlpsdsDn1J5Mw+VNUXodSZtImCqO+m8lvMQaJlLL9komosnvblyUqu2VJ
         erW26fuxRZXwC5nBUOCiy/nXdv7ApVWLSy0z1zCi2+pjN5KNWpf6gl7gTPK38nhKwf
         uphI58c4WP2rEXdpbszqxEi4kSARLg7sEX6Y6TvGWmYKi66JwzYxVqovCfGb4th/cl
         AeIsxSZ5HMW14DyUPrl+WKEhjdb0EbLSbbPEIbvAsWYFaeRNQF4YG604JKv0+C4OCG
         97FKxDnGULzDA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A1728609FF;
        Mon, 21 Jun 2021 16:30:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: ipq8074: Add QUP6 I2C node
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162429300265.14429.13746442104660992862.git-patchwork-notify@kernel.org>
Date:   Mon, 21 Jun 2021 16:30:02 +0000
References: <20210619162751.2336974-1-robimarko@gmail.com>
In-Reply-To: <20210619162751.2336974-1-robimarko@gmail.com>
To:     Robert Marko <robimarko@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sat, 19 Jun 2021 18:27:51 +0200 you wrote:
> Add node to support the QUP6 I2C controller inside
> of IPQ8074.
> It is exactly the same as QUP2 and QUP3 controllers.
> 
> Some routers like Xiaomi AX9000 and Netgear RBK850
> use this bus.
> 
> [...]

Here is the summary with links:
  - arm64: dts: ipq8074: Add QUP6 I2C node
    https://git.kernel.org/qcom/c/abe66bb7a2f6

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


