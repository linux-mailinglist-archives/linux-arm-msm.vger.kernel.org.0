Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 530122E73D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:19:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbgL2USi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:60238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726575AbgL2USh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id C8AEC22DD3;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272935;
        bh=7fPMMONCQwv6nBa2MKTiV7pfD49nnCQQy52AUsLM/04=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=RMrqQxJ9v23Z+/cXqdOY0+qT2tf25boE6wk9mf11Ai70duQftjV/xlQFwlh5XOdoI
         fymcHHTD1SQmb8YGaJeHD775Ni7ed+Jy1iuM9YVhj5knxojAYQpFY3CrwmULFsOM7j
         IzL2W3gTCAbE1k/cXAA/S5hH257b3279sXWgADZOv03MlUHJS59o4OBzzlt5idpKRX
         e3ln7IojhjBB9aS2lAlXyu6kkREq0aIb1cGaHfT1ZeafJ8Vxar21gSj48Nfg8iun8p
         h4rHmWP+L3yShdtCbeFTYUgOURpff+0qZxFL+Ed+wfZrI8TDiltMn1mkJ6166fSmIP
         K8cUSwx52jZ+Q==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id C47FF60626;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: qcom: Fix potential NULL dereference in
 adsp_init_mmio()
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293580.13751.10380042713825620008.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:35 +0000
References: <1607392460-20516-1-git-send-email-zhangchangzhong@huawei.com>
In-Reply-To: <1607392460-20516-1-git-send-email-zhangchangzhong@huawei.com>
To:     Zhang Changzhong <zhangchangzhong@huawei.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 8 Dec 2020 09:54:20 +0800 you wrote:
> platform_get_resource() may fail and in this case a NULL dereference
> will occur.
> 
> Fix it to use devm_platform_ioremap_resource() instead of calling
> platform_get_resource() and devm_ioremap().
> 
> This is detected by Coccinelle semantic patch.
> 
> [...]

Here is the summary with links:
  - remoteproc: qcom: Fix potential NULL dereference in adsp_init_mmio()
    https://git.kernel.org/qcom/c/c3d4e5b12672

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


