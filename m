Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF6F2E736D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:17:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgL2URH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:60042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726278AbgL2URH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 1FA13223E0;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272931;
        bh=kWWI3V0TPsNn/KrhM7beMTEoGMMnGpkGjkaYh80BpUY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=LcNU5rrQaBpUAOYNQYVrFagpF5NO5zzeIrSkIVYHmQH9ei5ZVoKPw2OsD7IratJm2
         wtm/gxW4NuHsh9DhgR6xR2gw2OuGl3yusLcEAqXU564J2Jci6TjkPDEl7RUDWCXDqL
         Hzo6DV/yxUnl3tIyvWGqElxQkyni0fjYCvd59g+cBPNJR+q7rYhH8IWNbII9igdZAi
         8e+JhQNGmIRf9+tST9O+RoiJ8KTLgsTw6kV8M99ptJeAsgVPGWPmJ3E88oXOpbj5Hc
         CU/1+ngmoMNJL8f82wepe7zYWx8x7hQ1klBl1vZasMYYaiAvSHN5XrXjk/o6FzDXXq
         KAUl2PkNXcHGA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 17DBD604D7;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 1/3] pinctrl: qcom: Kconfig: Rework PINCTRL_MSM to be a
 depenency rather then a selected config
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293109.13751.538044877321880477.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:31 +0000
References: <20201106042710.55979-1-john.stultz@linaro.org>
In-Reply-To: <20201106042710.55979-1-john.stultz@linaro.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  6 Nov 2020 04:27:08 +0000 you wrote:
> This patch reworks PINCTRL_MSM to be a visible option, and
> instead of having the various SoC specific drivers select
> PINCTRL_MSM, this switches those configs to depend on
> PINCTRL_MSM.
> 
> This is useful, as it will be needed in order to cleanly support
> having the qcom-scm driver, which pinctrl-msm calls into,
> configured as a module. Without this change, we would eventually
> have to add dependency lines to every config that selects
> PINCTRL_MSM, and that would becomes a maintenance headache.
> 
> [...]

Here is the summary with links:
  - [v6,1/3] pinctrl: qcom: Kconfig: Rework PINCTRL_MSM to be a depenency rather then a selected config
    https://git.kernel.org/qcom/c/be117ca32261
  - [v6,2/3] pinctrl: qcom: Allow pinctrl-msm code to be loadable as a module
    https://git.kernel.org/qcom/c/38e86f5c2645
  - [v6,3/3] firmware: QCOM_SCM: Allow qcom_scm driver to be loadable as a permenent module
    https://git.kernel.org/qcom/c/d0511b5496c0

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


