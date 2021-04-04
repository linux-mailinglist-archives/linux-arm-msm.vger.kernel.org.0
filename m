Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78EC9353954
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Apr 2021 20:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231150AbhDDSKR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Apr 2021 14:10:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:37280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230119AbhDDSKQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Apr 2021 14:10:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D93836135C;
        Sun,  4 Apr 2021 18:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617559811;
        bh=oxg5NgcflCOyYUMaWtMdd1c099by6eraEsK4hDgl9cI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=n8UOVC7tUg5mldm41uB6LR6M4Ppvjo1zznffMIQmKqZVnBcwwiKG94kKRk9tUE9Af
         NaUr9kx4hwmCQnbpboOAUo2J+jhckIjmW0YSl/pmVPuyBADvbqWG2Py+AcGHkYh8gx
         SLQ90+D2xV0CTBRmSvT2w1T0/E2F5OyO94LbwWorBr897WayLu8yTxeOzUk4+DaQLv
         gyg0nK+FqpW/Jl0/77iDh2CKiahB6Hy0bt2jREmxObeMfJd6exQ2UCaiBhM7UeT0Xu
         Sdq7ohbgq/pJVKL3DuMp8IA6A+mzIUy+BwHOBQgCIE8MEOBBiOyqTzd4Eqx+VM9Kfy
         +D+7c06KEpqaQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id CA30D60A0E;
        Sun,  4 Apr 2021 18:10:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/2] dts: qcom: sm8250: Enable venus related DT nodes 
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161755981182.6823.96273132423990339.git-patchwork-notify@kernel.org>
Date:   Sun, 04 Apr 2021 18:10:11 +0000
References: <20210401174256.1810044-1-bryan.odonoghue@linaro.org>
In-Reply-To: <20210401174256.1810044-1-bryan.odonoghue@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  1 Apr 2021 18:42:54 +0100 you wrote:
> V3:
> - Applies cleanly on top of robh/for-next relevant binding applied
> - Add Dmitry's Tested-by as indicated
> 
> V2:
> 
> I noticed this series doesn't apply/build against device-tree/dt/next
> 
> [...]

Here is the summary with links:
  - [v3,1/2] arm64: dts: qcom: sm8250: Add videocc DT node
    https://git.kernel.org/qcom/c/5b9ec225d4ed
  - [v3,2/2] arm64: dts: qcom: sm8250: Add venus DT node
    https://git.kernel.org/qcom/c/fa245b3f06cd

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


