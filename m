Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 554C612CFF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2019 13:27:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727404AbfL3M1r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Dec 2019 07:27:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:44994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727376AbfL3M1r (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Dec 2019 07:27:47 -0500
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8EB9820722
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2019 12:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577708866;
        bh=z3eGzhNUYJnWiQy0VfHvxcaxl40ywCeMjB0jJeOmu4I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RLpliRz92NoR567oCWcgX9U5trefYn2L+MxK4UrDI/yn4Ccp4gvKj0nTOk8kpU18k
         7oX9OdFt7f58Mz3/cJgf5XH3ABeDrTMrGoqoJRWQR7OBiDdAIOAKzmovAbRiG/HnzA
         T7DzjDUJXbSz7ClOZIVV3gQ3VoWNhB7bdIsRkDBg=
Received: by mail-qk1-f172.google.com with SMTP id d71so18289141qkc.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2019 04:27:46 -0800 (PST)
X-Gm-Message-State: APjAAAWhDM3oGIcYu9gkT2h9GS+0hNx1nNtA9ieo6r1nn/qWbWjPm6EB
        usK5R2Mw23kUR53f5PAfdckpaGwD6qemLfklzQ4=
X-Google-Smtp-Source: APXvYqzTa71J0XJ+/ulF7lA7fIGj3LCsVQmW67yPQzrlvhMRVYpQH4kKUWUTc6xtlvifhj2p5hpvJf3qlI8yHbjFfkk=
X-Received: by 2002:a05:620a:1358:: with SMTP id c24mr55845257qkl.285.1577708865692;
 Mon, 30 Dec 2019 04:27:45 -0800 (PST)
MIME-Version: 1.0
References: <20191227015530.GA3828441@builder>
In-Reply-To: <20191227015530.GA3828441@builder>
From:   Josh Boyer <jwboyer@kernel.org>
Date:   Mon, 30 Dec 2019 07:27:32 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5tSbbVkrV8h35c50O5YO+LgUdqTdE=T-qU8JKs1-a06Q@mail.gmail.com>
Message-ID: <CA+5PVA5tSbbVkrV8h35c50O5YO+LgUdqTdE=T-qU8JKs1-a06Q@mail.gmail.com>
Subject: Re: qcom: Switch SDM845 WLAN firmware
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linux Firmware <linux-firmware@kernel.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        Linux-arm Msm <linux-arm-msm@vger.kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 26, 2019 at 8:55 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Hi,
>
> The recently committed wlan firmware found under ath10k/WCN3990 shows
> better stability under load than the one present for SDM845. So this
> replaces the current firmware with a symlink to the newly contributed
> one.
>
> Regards,
> Bjorn
>
> The following changes since commit 6871bffa79ed240696986837cfb17b272ff57466:
>
>   Merge branch 'ath10k-20191220' of git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware (2019-12-20 08:41:19 -0500)
>
> are available in the Git repository at:
>
>   https://github.com/andersson/linux-firmware.git RB3-wlan-firmware-1387
>
> for you to fetch changes up to 4570585aad1009b84fe0d4d0677dd8d4c9956b42:
>
>   qcom: Switch SDM845 WLAN firmware (2019-12-26 17:47:56 -0800)
>
> ----------------------------------------------------------------
> Bjorn Andersson (1):
>       qcom: Switch SDM845 WLAN firmware
>
>  WHENCE                   |   1 -
>  qcom/sdm845/wlanmdsp.mbn | Bin 3311964 -> 39 bytes
>  2 files changed, 1 deletion(-)
>  mode change 100644 => 120000 qcom/sdm845/wlanmdsp.mbn

This messes up WHENCE.  Either you want to use the Link: statement in
WHENCE, or keep the File line if you're going to create a symlink
manually.  The Link statement is preferred.  Can you redo?

josh
