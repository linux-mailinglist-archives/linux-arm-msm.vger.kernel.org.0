Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F56D329254
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:43:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233023AbhCAUnQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:43:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:53216 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238859AbhCAUk3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:40:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 0838164E12;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628782;
        bh=oVs2HV+vtn0NNdKpxitRw0fxHy8s3erfHtTUyjgFW7U=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=VXEKoBmxnUbzCsnlG41aYMDclsqyksWRR50Q/eX1tgIFNwtpbwvxQYjH60c3cSEtO
         zqGmHmjN8ZO53/5Bz07bKOcAZnO7z2sFqit1a8Oiu6QQcKOzOvKz16A6puBoMLoXJF
         LETFCYlftR6FCl+Np11feZ0acYZFEZcRPN/yNceNaSeKPfaj6aWUrtoEJpaiIJgFTC
         KeWnny5tTd4vfB2i3ZgPp0irW6Lfmt+SO1oMcLJXd+hF9Q1slPh1GHoNsJ9XUTA1yp
         1tG64DpvmrbyGAkjFJi3C7s1S/ZreBbISq9YSDzx3iACp4RgvmFrqwATDJcimofsYU
         z6y3Y7BhCNz5A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 04C5E60A1B;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] usb: dwc3: qcom: add URS Host support for sdm845 ACPI boot
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878201.6187.15323987092983842156.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:42 +0000
References: <20210115035057.10994-1-shawn.guo@linaro.org>
In-Reply-To: <20210115035057.10994-1-shawn.guo@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 15 Jan 2021 11:50:57 +0800 you wrote:
> For sdm845 ACPI boot, the URS (USB Role Switch) node in ACPI DSDT table
> holds the memory resource, while interrupt resources reside in the child
> nodes USB0 and UFN0.  It adds USB0 host support by probing URS node,
> creating platform device for USB0 node, and then retrieve interrupt
> resources from USB0 platform device.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> 
> [...]

Here is the summary with links:
  - [v2] usb: dwc3: qcom: add URS Host support for sdm845 ACPI boot
    https://git.kernel.org/qcom/c/c25c210f590e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


