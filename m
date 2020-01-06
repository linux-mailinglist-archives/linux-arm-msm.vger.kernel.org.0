Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8D41131A71
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 22:31:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgAFVbc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 16:31:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:45188 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726739AbgAFVbc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 16:31:32 -0500
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C4CAE2146E
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2020 21:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578346291;
        bh=u/K/CvhbIvCmpp8TNIBjsqm0nrF4iQWTvvtkVb8/zpk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HkMlbrffMnn18Ot01Tr1yS+c0tmL7e5JTWiELOux2weexX6De9s+Ma44A+1BTuJ5W
         2CrIg5+dTlLGP7NXXpnHvC4/sSkLE6cfZoV6JWbQO+O9fxqRflSmEdejjNSIShOEiR
         5WEMXpYpvsYSXxULCHhyCEn4LVSueMLfZ2LKxUJo=
Received: by mail-qv1-f44.google.com with SMTP id x1so19668193qvr.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2020 13:31:31 -0800 (PST)
X-Gm-Message-State: APjAAAUXhDRUOI0LjBFqte1vnWNuNLQAya9acuV7IB5OKfdkNyEyxsYN
        8EXkJRMoNKHALGXg12tcsoiOyCyezsVhnaiT/Ls=
X-Google-Smtp-Source: APXvYqxgu8M2LWBFC2yNxt+nyKaZ1RSLWWW+G4W+1q9ldAek3IOvjQgdVA5AFBFxwMIo4diaxzzrBwnj5kVG5xQipHE=
X-Received: by 2002:a0c:9023:: with SMTP id o32mr65746702qvo.110.1578346290945;
 Mon, 06 Jan 2020 13:31:30 -0800 (PST)
MIME-Version: 1.0
References: <20200103063522.GA4002960@builder>
In-Reply-To: <20200103063522.GA4002960@builder>
From:   Josh Boyer <jwboyer@kernel.org>
Date:   Mon, 6 Jan 2020 16:31:08 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5AhWMKQN_6_e-cPogqR6z8spY=ep8QGqyfv=t35QZh2g@mail.gmail.com>
Message-ID: <CA+5PVA5AhWMKQN_6_e-cPogqR6z8spY=ep8QGqyfv=t35QZh2g@mail.gmail.com>
Subject: Re: [GIT PULL v2] qcom: Switch SDM845 WLAN firmware
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

On Fri, Jan 3, 2020 at 1:35 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Hi,
>
> The recently committed wlan firmware found under ath10k/WCN3990 shows
> better stability under load than the one present for SDM845. So this
> replaces the current firmware with a symlink to the newly contributed
> one.
>
> Change since v1:
> - Properly use Link: in WHENCE
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
>   https://github.com/andersson/linux-firmware.git RB3-wlan-firmware-1387-v2
>
> for you to fetch changes up to d6219ab5b49816cbe9de9b2af1e3c8cd26a3d05b:
>
>   qcom: Switch SDM845 WLAN firmware (2020-01-02 22:25:39 -0800)
>
> ----------------------------------------------------------------
> Bjorn Andersson (1):
>       qcom: Switch SDM845 WLAN firmware
>
>  WHENCE                   |   2 +-
>  qcom/sdm845/wlanmdsp.mbn | Bin 3311964 -> 0 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  delete mode 100644 qcom/sdm845/wlanmdsp.mbn

Pulled and pushed out.

josh
