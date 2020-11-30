Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D02502C8D90
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 20:00:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728727AbgK3TAw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 14:00:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:42426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728764AbgK3TAr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 14:00:47 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606762807;
        bh=LxdN9U7+jVOaO9qDKFt31gDUeI/6yQ4CaQHrQxTKw1c=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=mm311FEDCNjTdQkAISk3obm7rwvAxqLTnrBINT4sAGWy7N+Hf2DlJRFEwj7+OpNTR
         jPIYxqDnhYkNZtt9VIj5xEhNAJQCpR8DdKwBeQF+1aR06JSGVcIsdqqnns4GTf04F0
         EC9bPFuxh3k9wT8SqqPMmv2QToqAfT4qn027AXRc=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: c630: Polish i2c-hid devices
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160676280705.32741.12775802126954710781.git-patchwork-notify@kernel.org>
Date:   Mon, 30 Nov 2020 19:00:07 +0000
References: <20201130165924.319708-1-bjorn.andersson@linaro.org>
In-Reply-To: <20201130165924.319708-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 30 Nov 2020 10:59:24 -0600 you wrote:
> The numbering of the i2c busses differs from ACPI and a number of typos
> was made in the original patch. Further more the irq flags for the
> various resources was not correct and i2c3 only has one of the two
> client devices active in any one device.
> 
> Also label the various devices, for easier comparison with the ACPI
> tables.
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: c630: Polish i2c-hid devices
    https://git.kernel.org/qcom/c/11d0e4f28156

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


