Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1EF92C5CBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 20:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728731AbgKZTuH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 14:50:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:38240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729352AbgKZTuG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 14:50:06 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606420206;
        bh=0Rxl2nBTH+SNXXrKTpBdM8Sv+GqG/9Icyi+eqxax40Q=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=TSwiPncJOzTZytAKbEa5s8sOcwY5Y8O/iAPl3bEf8leLq+hSbWHT41GJn+xydrJRX
         lGI+H4cRG5XAasf4L1s6uccjPMC+c/uedoNvHNobF0843U0HJey77vZhrCnHk19XRC
         48RObEdnUdMfdosMQgu0+QNjos1z7dRCGcDceReA=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv2] arm64: dts: qcom: sm8150: Add Coresight support
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160642020629.4652.7941348555309644834.git-patchwork-notify@kernel.org>
Date:   Thu, 26 Nov 2020 19:50:06 +0000
References: <20201126052422.24869-1-saiprakash.ranjan@codeaurora.org>
In-Reply-To: <20201126052422.24869-1-saiprakash.ranjan@codeaurora.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 26 Nov 2020 10:54:22 +0530 you wrote:
> Add coresight components found on Qualcomm Technologies,
> Inc. SM8150 SoC.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
> 
> [...]

Here is the summary with links:
  - [PATCHv2] arm64: dts: qcom: sm8150: Add Coresight support
    https://git.kernel.org/qcom/c/24244cefedde

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


