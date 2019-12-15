Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE4B11F7B0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2019 13:29:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbfLOM3l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Dec 2019 07:29:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:54296 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726101AbfLOM3l (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Dec 2019 07:29:41 -0500
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 437B2205C9
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Dec 2019 12:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576412980;
        bh=sjzJMccn0a5Yd2bZTTdlqOV8QR2fYI7yYQFIu392A4I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WqdIDiHZblhBUz8m9pRhX+PsNWXWWsvcjFvS3R8kMyzZunlqv3h/11sL0yl6I+ORn
         /f5DY8NQ/JQlMZaTfIHBkAF9JXVyuF7SevVEHLXQUGxVWiCvw8N9pp5G93mlGGmkdD
         aGgPXFD27akmRCQ+J9mkALgKRD3iAmjg048ynxTw=
Received: by mail-qk1-f169.google.com with SMTP id c17so2193328qkg.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Dec 2019 04:29:40 -0800 (PST)
X-Gm-Message-State: APjAAAWTk1AYgWJU0uDUiiA4OXjUmU+vg/teE6M8QbSwSCVyFf+y7bqV
        DkzQzrm2/4q2pdF3n2CV9QCwRkAI9KwkDFbuoWY=
X-Google-Smtp-Source: APXvYqw9DX7KgTbYnYmxZ2caM4roaLuK25aOK+go4n6uTmSkzQxJq2/SmA+L7J5p2+ybD6V4tTMeAxIFon6dve/Sg0M=
X-Received: by 2002:a05:620a:1358:: with SMTP id c24mr23198180qkl.285.1576412979437;
 Sun, 15 Dec 2019 04:29:39 -0800 (PST)
MIME-Version: 1.0
References: <20191121002252.GA844457@builder>
In-Reply-To: <20191121002252.GA844457@builder>
From:   Josh Boyer <jwboyer@kernel.org>
Date:   Sun, 15 Dec 2019 07:29:28 -0500
X-Gmail-Original-Message-ID: <CA+5PVA79vCkFettUWAnHOaBYJFzsU7fXCM=p6X+dg8aKH22RSg@mail.gmail.com>
Message-ID: <CA+5PVA79vCkFettUWAnHOaBYJFzsU7fXCM=p6X+dg8aKH22RSg@mail.gmail.com>
Subject: Re: qcom: Add SDM845 remoteproc firmware files
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linux Firmware <linux-firmware@kernel.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        Linux-arm Msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 20, 2019 at 7:22 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Hi
>
> This adds the necessary firmware to boot the Audio DSP, Compute DSP and
> Modem DSP, as well as the dynamically loaded WiFi firmware for the
> Qualcomm RB3/Dragonboard845c.
>
> Regards,
> Bjorn
>
> The following changes since commit e8a0f4c9314754d8b2cbe9840357d88a861c438a:
>
>   rtl_nic: add firmware rtl8168fp-3 (2019-11-18 16:16:01 -0500)
>
> are available in the Git repository at:
>
>   https://github.com/andersson/linux-firmware.git RB3-adsp-cdsp-mss-v4
>
> for you to fetch changes up to 212e44122e71fe76e1e6a495739413597ea66a6e:
>
>   qcom: Add SDM845 Compute DSP firmware (2019-11-20 16:08:30 -0800)
>
> ----------------------------------------------------------------
> Bjorn Andersson (3):
>       qcom: Add SDM845 modem firmware
>       qcom: Add SDM845 Audio DSP firmware
>       qcom: Add SDM845 Compute DSP firmware
>
>  WHENCE                   |  38 ++++++++++++++++++++++++++++++++++++++
>  qcom/sdm845/adsp.mbn     | Bin 0 -> 10420560 bytes
>  qcom/sdm845/adspr.jsn    |  21 +++++++++++++++++++++
>  qcom/sdm845/adspua.jsn   |  27 +++++++++++++++++++++++++++
>  qcom/sdm845/cdsp.mbn     | Bin 0 -> 2704916 bytes
>  qcom/sdm845/cdspr.jsn    |  21 +++++++++++++++++++++
>  qcom/sdm845/mba.mbn      | Bin 0 -> 242400 bytes
>  qcom/sdm845/modem.mbn    | Bin 0 -> 5652688 bytes
>  qcom/sdm845/modemuw.jsn  |  33 +++++++++++++++++++++++++++++++++
>  qcom/sdm845/wlanmdsp.mbn | Bin 0 -> 3311964 bytes
>  10 files changed, 140 insertions(+)
>  create mode 100644 qcom/sdm845/adsp.mbn
>  create mode 100644 qcom/sdm845/adspr.jsn
>  create mode 100644 qcom/sdm845/adspua.jsn
>  create mode 100644 qcom/sdm845/cdsp.mbn
>  create mode 100644 qcom/sdm845/cdspr.jsn
>  create mode 100644 qcom/sdm845/mba.mbn
>  create mode 100644 qcom/sdm845/modem.mbn
>  create mode 100644 qcom/sdm845/modemuw.jsn
>  create mode 100644 qcom/sdm845/wlanmdsp.mbn

Pulled and pushed out.

josh
