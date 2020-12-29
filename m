Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7916C2E73E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:19:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgL2USn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:60044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726600AbgL2USl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 45043230FD;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272936;
        bh=3d763+6a6IdovvIYeAtCelpfd0uTHLUsOflENBtQO4g=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=VCa8VT33HPULC04jztsSw3gCRFe6g3jpCSSCthLDngVe0Xq/yNuNWr6VNtYYNYadB
         MIJFMbr1jAXQ4qGmKyMLnZnS2wvQcvJdUg7M6YbehEFoAI/SNsxm+YWaZLoNUX0qJT
         pmXpbRg7Ni0Jt8D5dGoCJoiPEwwsnZGo0IApirFubU358FUU/fgaiH2hCo6dV+050X
         bNLSU07u8gP2JmQHl5HnLIZouqHEW0/1uDQ80yh1laENsnuPsvxPWBRJzmBCYKLDk8
         p0P+tC/P6YQzAZtCpdXtoLIEl+0Lom/ap9nfLLwKLH4Jjy3f7mn6MimvtM7iB01P9B
         CKaX0badHU6fg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 41522600D9;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] interconnect: qcom: qcs404: Remove GPU and display RPM IDs
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293626.13751.18256371235076266604.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:36 +0000
References: <20201118111044.26056-1-georgi.djakov@linaro.org>
In-Reply-To: <20201118111044.26056-1-georgi.djakov@linaro.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 18 Nov 2020 13:10:44 +0200 you wrote:
> The following errors are noticed during boot on a QCS404 board:
> [    2.926647] qcom_icc_rpm_smd_send mas 6 error -6
> [    2.934573] qcom_icc_rpm_smd_send mas 8 error -6
> 
> These errors show when we try to configure the GPU and display nodes.
> Since these particular nodes aren't supported on RPM and are purely
> local, we should just change their mas_rpm_id to -1 to avoid any
> requests being sent for these master IDs.
> 
> [...]

Here is the summary with links:
  - [v2] interconnect: qcom: qcs404: Remove GPU and display RPM IDs
    https://git.kernel.org/qcom/c/7ab1e9117607

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


