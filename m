Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60A723DDC02
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Aug 2021 17:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234460AbhHBPMn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 11:12:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234401AbhHBPMm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 11:12:42 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A697FC061760
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Aug 2021 08:12:32 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id g23-20020a17090a5797b02901765d605e14so397087pji.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Aug 2021 08:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cNS0nMoOIxtF+scD/hVy7IURVD+zBFxHal42ZjZhFLw=;
        b=uh2Ch9vfv/fCloU/e0cEq/4xIwbY5xjdPdyzrphKWfuvDXSDA35sO5Z2L+mtsQm7zf
         G7y0N7g8WsYxSVX5IzJC7aEOJM9+ZQCACHaMyDXp2eFrdkRCOXC9s/IB7jHujsZnYob0
         v9cEs9d8SUiWeCPvrNax1kAMkYQ6tINgogNDYsU2zA0aMfq6CrFFoSUxhnkYlfLYANjO
         5IegpocVs5Xmcm5+mzGEnfo8E3nCP856RdE+6DyJ6rrCqjjp34xTEswARIwX+Cv0NLHP
         ZEaIDr8KbpG7f+UApCE9OISyeOlGheqe8/wMAYVxLQwnKFwV6tWS2hbi1zoMDG1/lzpk
         60/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cNS0nMoOIxtF+scD/hVy7IURVD+zBFxHal42ZjZhFLw=;
        b=abdD2HNVOBJdiEYHY4CNwo5WPfSnwCx4IkvdJNjJ1IuGaxOe9zMjfGRClezTFZPhx6
         6koJy2iskFcQu5Su/OGv9JF9PjqLX/9zYhiVCvYyeYxLIGyIm2ngH13MTtVE8t4+UAom
         zhOVeIm4bkO38sSc1YC3E+tsLTP26Krd2KTC+49zbMGEcfQvKoBG3oetyRjvGc1Ng8gL
         5ua604bHL45S6tWKJJm9zCa8RA5GAz3VX1PhuJZhi034ifw2VGvBceYG+CGSZkVLfdAN
         4+OofFz52+4AZ9ED9OEjaeTXIuOQPBrHY8hxhC7RD34wATXCm0YJzal9z/sjf1NUuSBP
         8j+g==
X-Gm-Message-State: AOAM532S6ACdCdgTyKi44eVehHeix9S9WNeXyqEeJPnOrMNq4YbhZ4Wa
        DqVuhwf8C0oWUaq3ViEm7Vp6KaZRdIBiBtkx2hU9EYshBTp5gF6z
X-Google-Smtp-Source: ABdhPJxdi6k7YJUhieQC/k5+dRPC24O7roq88pZ6hAPe4g+x1O3YXuungbUS4BC+9zcqqC18oYJLDDuWKS6Y6n+wqgU=
X-Received: by 2002:a17:90a:a896:: with SMTP id h22mr18222855pjq.231.1627917152099;
 Mon, 02 Aug 2021 08:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <1e288e5bee3f2a18e0ddb8b7a50158ecb793822d.camel@bootlin.com>
In-Reply-To: <1e288e5bee3f2a18e0ddb8b7a50158ecb793822d.camel@bootlin.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 2 Aug 2021 17:22:17 +0200
Message-ID: <CAMZdPi-qydatnYYLPY9pZ_4XNZOKB+GBVw2M5rqD1WuVEQLwOg@mail.gmail.com>
Subject: Re: MHI driver issue with Sierra Wireless AirPrime EM919X
To:     Thomas Perrot <thomas.perrot@bootlin.com>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Thomas,

On Fri, 30 Jul 2021 at 19:52, Thomas Perrot <thomas.perrot@bootlin.com> wro=
te:
>
> Hello,
>
> I=E2=80=99m trying to use the MHI driver with a Sierra Wireless AirPrime =
EM919X
> connected to an NXP i.MX6DL through a PCIe gen2 bus, on 5.13.6, but the
> device initialisation fails, as follows:
>
> [    3.029401] mhi-pci-generic 0000:01:00.0: BAR 0: assigned [mem
> 0x01100000-0x01100fff 64bit]
> [    3.041095] mhi-pci-generic 0000:01:00.0: enabling device (0140 ->
> 0142)
> [    3.118299] mhi mhi0: Requested to power ON
> [   11.370361] mhi mhi0: Power on setup success
> [   11.372503] mhi mhi0: Wait for device to enter SBL or Mission mode
> [   15.664068] mhi-pci-generic 0000:01:00.0: failed to suspend device:
> -16
> [   22.619948] mhi-pci-generic 0000:01:00.0: refused to change power
> state from D3hot to D0
> [   57.289998] mhi-pci-generic 0000:01:00.0: can't change power state
> from D3hot to D0 (config space inaccessible)
> [   73.769675] mhi-pci-generic 0000:01:00.0: can't change power state
> from D3cold to D0 (config space inaccessible)
> [   73.780188] mhi-pci-generic 0000:01:00.0: can't change power state
> from D3hot to D0 (config space inaccessible)
> [   73.836150] PC is at mhi_pci_read_reg+0xc/0x14
> [   73.840642] LR is at mhi_get_mhi_state+0x2c/0x5c
> [   74.121120] [<c05dcaf4>] (mhi_pci_read_reg) from [<c05d754c>]
> (mhi_get_mhi_state+0x2c/0x5c)
> [   74.129529] [<c05d754c>] (mhi_get_mhi_state) from [<c05da440>]
> (mhi_pm_resume+0x38/0x298)
> [   74.137754] [<c05da440>] (mhi_pm_resume) from [<c05dcbd0>]
> (mhi_pci_runtime_resume+0x70/0xe0)
> [   74.146326] [<c05dcbd0>] (mhi_pci_runtime_resume) from [<c0604da0>]
> (pci_pm_runtime_resume+0x84/0xa0)
>
> Do you have any idea where the issue might come from?
>
> MHI seems to enter in READY state and waiting to enter in SBL or
> Mission mode when the issue occurs, the host can start MHI
> initialization by programming MMIO registers and sets the device into
> MHI_M0 state.

runtime-pm is only enabled when the device is in mission mode, so the
device has likely been successfully initialized, It is just that there
is no info message indicating initialization completion and we should
probably add that. I think maybe about some PCIe suspend/resume
issues, could you try disabling runtime-pm for that device? or simply
comment `pm_runtime_allow` call?

Regards,
Loic
