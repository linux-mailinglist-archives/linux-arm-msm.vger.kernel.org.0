Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CABA72EE9B2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 00:21:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727913AbhAGXUt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jan 2021 18:20:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:54552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727858AbhAGXUt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jan 2021 18:20:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 6E88523603;
        Thu,  7 Jan 2021 23:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610061608;
        bh=Kis0jBCtFhWggFEToh5dqcL/e9nHHzQikLejmGTjPeY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=pvKGgVEr3ui8KzUrV7mBswtJSYBT5JqM+xsPyBwj4axFDXLC6ZCHM07T5nzFtH8uP
         3Gjqkv9qxgisKRCL6XMmT1EUqnbI3kebHyBU4rtUNBrJOn+O12zDKy+nanhb4708K9
         AaTORDBktzYBpWX6V2lsAj3AAHhOoIHD5CDu8xAaIghbJA2rPDmHV/jUcI7uPopaTH
         vukPI8QllJi0EsCHW9NCD+QDJzj6GJD8AbWxTGZZGNsc1xLoExvt6mnDxUa+0hqOZe
         7oN11s3/hYjAo7n4lO/UxzUFEGdj5NmgZv5s1wEap2svwb85U08F48zJaGPtNdIbrG
         OAh6h+h5VgqyQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 64B9F60508;
        Thu,  7 Jan 2021 23:20:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add "dp_hot_plug_det" pinconf for
 trogdor
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161006160840.28512.17332282430802736158.git-patchwork-notify@kernel.org>
Date:   Thu, 07 Jan 2021 23:20:08 +0000
References: <20210106152537.1.Ib4b5b0e88fdc825c0e2662bab982dda8af2297b2@changeid>
In-Reply-To: <20210106152537.1.Ib4b5b0e88fdc825c0e2662bab982dda8af2297b2@changeid>
To:     Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed,  6 Jan 2021 15:25:49 -0800 you wrote:
> We have an external pull on this line, so disable the internal pull.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)

Here is the summary with links:
  - arm64: dts: qcom: sc7180: Add "dp_hot_plug_det" pinconf for trogdor
    https://git.kernel.org/qcom/c/f772081f4883

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


