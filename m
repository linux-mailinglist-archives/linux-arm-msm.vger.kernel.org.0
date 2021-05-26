Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06AE1392024
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235332AbhEZTF0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:40990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233459AbhEZTFD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E178361452;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055805;
        bh=M7UBlQi4P5rwmjcw+XnVyhapvjaR5x99tmKBza/UNbM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=cHwDVDvmSC3Rv+PMTVI0lF+nMeMAuvcDWOWAI8sGN4WG6q55eyIVhr6yjP6rcKiR6
         vyFzNJ15dWeTv5Yz1jgynxKQR2TSbP6HjHiyuGqitzBiBtKK/87zoNw3VXaE/BAcuL
         IYNy7xBTFGzI0SurQe18t4YTBCyrfQjOEjvMPDa3dii2ntUmD36BU0jAnQpbe/Z+0v
         zleYfLvX1OQ5z/Svm/eGbwbNrdB145bb/Ks0+vMarigho5l/AlHNEZNWKWPhoV1TO9
         RJ3fVh01Nau23HDRW3WtFjOnBNzGiZowBtR7upKN5bOEPhBuVZ0Lf2I95pdmju1wqf
         dP9AsBCeVC7ug==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D924260CE1;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [pull] drm/msm: drm-msm-fixes-2021-02-25 for v5.12-rc5
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580588.26840.18330391114939618900.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:25 +0000
References: <CAF6AEGvmiMKRms_NVavD=NA_jbuexZUcqqL35ke7umqpp-TxMw@mail.gmail.com>
In-Reply-To: <CAF6AEGvmiMKRms_NVavD=NA_jbuexZUcqqL35ke7umqpp-TxMw@mail.gmail.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This pull request was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 25 Mar 2021 17:57:56 -0700 you wrote:
> Hi Dave & Daniel,
> 
> (resending one more time without git tag copy/paste fail)
> 
> A few fixes for v5.12
> 
> The following changes since commit 182b4a2d251305201b6f9cae29067f7112f05835:
> 
> [...]

Here is the summary with links:
  - [pull] drm/msm: drm-msm-fixes-2021-02-25 for v5.12-rc5
    https://git.kernel.org/qcom/c/09d78dde88ef

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


