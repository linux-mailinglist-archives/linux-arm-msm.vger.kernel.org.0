Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC2D2C1C84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 05:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728704AbgKXEKJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 23:10:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:46856 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728666AbgKXEKI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 23:10:08 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606191008;
        bh=XG7ploMMA4Wm0I6XZxU9YWfPwW9qEahQnItWIbKaKZk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=QmYI5EFLuyR+g0Ez1sLJ2BD+TqvlgRKlHeoLi/LO6qOCyYNECHLsGeXishj/MR9HE
         gaTRWNzPmS6RZx5r3cyFWkONm/U1WvTYV9a5eO8+dO9AUtt7JnsPpCFrE0dtHg50il
         hvtuIepjB0NFvH9NR/18KN0LBq4HBcz75K9Hk61M=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8250: Add support for SDC2
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160619100842.17117.1423756853985658700.git-patchwork-notify@kernel.org>
Date:   Tue, 24 Nov 2020 04:10:08 +0000
References: <20201028190955.1264526-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20201028190955.1264526-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 28 Oct 2020 22:09:54 +0300 you wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Add support for SDC2 which can be used to interface uSD card.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> [DB: minor fixes: clocks, iommus, opps]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> [...]

Here is the summary with links:
  - [1/2] arm64: dts: qcom: sm8250: Add support for SDC2
    https://git.kernel.org/qcom/c/c4cf0300be84
  - [2/2] arm64: dts: qcom: rb5: Add support for uSD card
    https://git.kernel.org/qcom/c/53a8ccf1c7e5

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


