Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 113112C1C86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 05:10:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728669AbgKXEKK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 23:10:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:46878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728671AbgKXEKJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 23:10:09 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606191008;
        bh=wbw7RU/GrTrnhArVVT+ZvlQeZ5f4RaWBUr4dAxUfDIU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=P+Jcdbl46Sy1imlQ+W9y/C+SZAKPC1n80R5ynOODjItWY4Q2VkKVDewoVPkMBGSd6
         fX7csaHXzNuWMqWTNik9n1BNXAvAkeiIkgMA0Vcww25D0Jo3kfOPvLvQdrWEGc91Yl
         uuIK9TZshwz7f60AcE1penoSt/OT5ttEn5Ebyulw=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] soc: qcom: pdr: Constify static qmi structs
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160619100855.17117.9886693842567494132.git-patchwork-notify@kernel.org>
Date:   Tue, 24 Nov 2020 04:10:08 +0000
References: <20201122232818.32072-1-rikard.falkeborn@gmail.com>
In-Reply-To: <20201122232818.32072-1-rikard.falkeborn@gmail.com>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 23 Nov 2020 00:28:18 +0100 you wrote:
> Their only usage is to pass their address to qmi_handle_init() which
> accepts const pointers to both qmi_ops and qmi_msg_handler. Make them
> const to allow the compiler to put them in read-only memory.
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
> ---
>  drivers/soc/qcom/pdr_interface.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Here is the summary with links:
  - soc: qcom: pdr: Constify static qmi structs
    https://git.kernel.org/qcom/c/0af104d72961

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


