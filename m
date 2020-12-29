Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C13C2E73E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:19:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgL2USl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:60042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726597AbgL2USk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 1E9F422EBE;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272936;
        bh=hZ5cz47Tw0m04pkcVXTJWYxir7E1Y/sl01kH58gWmIE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=EhLfmNCaXB/ZhMueWO/qCNgikCnAmsiuILQYB4XbagaQYiHUfY880gvHUJu/41oWk
         jm39iqjRBJlmKxkQP2yvpBIxpx74l75FTZIz7K+EvyzQKhywy02m9mEveRiruHkBMe
         imjwh2dAU3Y/BfHVneEL7s9QoPy4I+kUFvgCWbNp2gLDZouZDoFWvcrpnxD5bk23So
         67DPAn9D8pkNP5a6u+RLyYZfGtFDtVWahwSvJ0iwfZDeiHuOAz0kX0R55wY0y8kg+o
         JiBTE8nxlcttDmiFhOTrxxldP4SObLF/ABeH+QdiT6ipt/fkCCJ6QSpgPWQz3G5uei
         jblJLqLuv2Bag==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 168E66063B;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: Constify static structs
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293608.13751.17588486886122671380.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:36 +0000
References: <20201122234253.34047-1-rikard.falkeborn@gmail.com>
In-Reply-To: <20201122234253.34047-1-rikard.falkeborn@gmail.com>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 23 Nov 2020 00:42:53 +0100 you wrote:
> qcom_slim_qmi_msg_handlers[] and qcom_slim_ngd_qmi_svc_event_ops are
> only used as input arguments to qmi_handle_init() which accepts const
> pointers to both qmi_ops and qmi_msg_handler. Make them const to allow
> the compiler to put them in read-only memory.
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
> 
> [...]

Here is the summary with links:
  - slimbus: qcom-ngd-ctrl: Constify static structs
    https://git.kernel.org/qcom/c/a35c6e18abae

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


