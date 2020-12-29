Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5FAE2E73B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726529AbgL2USL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:60058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726536AbgL2USK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 976CF22D01;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272934;
        bh=cLBqINxly/N+lnoxe2Nh7VZMeFFxiE7tXS0jegthYhk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=FoPuDEbeUPNaZgb3oDyWQR7uy1szIlo30mQZNSMbiHpxpsLwJ4ix4WAo+bkpXIMSF
         HlfZaDJzzeVq0YCRQiOyAavtiy1kvJqfHI94BWWxhHCQ1yc0bJs60MqKtgVj9+JSOF
         qT1vO5lObrqvFK/q5EhKfgFOXC0hsAzE1oXrGpVelj7EccbnC5XsaZ6Zq48/xSBzo2
         ePQuobpsnCKy8cQf5TJFxgmYSNNQ1Vat8TOemtQiz44p/nncL6ir5f2MXt7cznv69M
         cof6eVJ71EszwxZdh0ZNw9vBEnkGiQMocsqA9H3kFEiG7+v0iOG4fOekK8r22aE+6s
         BPSVbunaHhmVA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 93CCB60626;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] drm/msm/dpu: update the qos remap only if the client type
 changes
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293460.13751.5592326037811381918.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:34 +0000
References: <20201201233855.13624-1-abhinavk@codeaurora.org>
In-Reply-To: <20201201233855.13624-1-abhinavk@codeaurora.org>
To:     Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  1 Dec 2020 15:38:55 -0800 you wrote:
> Update the qos remap only if the client type changes for the plane.
> This will avoid unnecessary register programming and also avoid log
> spam from the dpu_vbif_set_qos_remap() function.
> 
> changes in v2:
>  - get rid of the dirty flag and simplify the logic to call
>    _dpu_plane_set_qos_remap()
> 
> [...]

Here is the summary with links:
  - [v2] drm/msm/dpu: update the qos remap only if the client type changes
    https://git.kernel.org/qcom/c/854f6f1c653b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


