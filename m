Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E58A2C1C8D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 05:10:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728712AbgKXEKL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 23:10:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:46914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728666AbgKXEKJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 23:10:09 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606191008;
        bh=jbf4jpxXiUDgmOvHvOiTxZQorwvHYXCH/Kvl4of182E=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=xvbfoi9+vycN0/8uhOL5Si61GGpgItTJqnLsTiHcXqrG7JVSCy0bzQ4EA6G2qls1l
         WZD0B+gV0cr4R7ZgUgBJf9klPQr48+VYha5EZtEmRlg+fJyn74WK8Xu9tbJjHoPWy7
         iKbLFdMwxHJhcUVS6dPlTuO6MQg7uNd0VfPLdkx0=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-samsung-a3u: add nodes for
 touchscreen
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160619100888.17117.12400668780510513529.git-patchwork-notify@kernel.org>
Date:   Tue, 24 Nov 2020 04:10:08 +0000
References: <20201115195058.27097-1-michael.srba@seznam.cz>
In-Reply-To: <20201115195058.27097-1-michael.srba@seznam.cz>
To:     Michael Srba <michael.srba@seznam.cz>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sun, 15 Nov 2020 20:50:58 +0100 you wrote:
> From: Michael Srba <Michael.Srba@seznam.cz>
> 
> This patch wires up touchscreen support on Samsung Galaxy A3 2015.
> 
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> ---
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: msm8916-samsung-a3u: add nodes for touchscreen
    https://git.kernel.org/qcom/c/e76be113d4a7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


