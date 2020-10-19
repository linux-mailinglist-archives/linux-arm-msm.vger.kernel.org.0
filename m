Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D23E22930A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 23:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733258AbgJSVh6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 17:37:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729382AbgJSVh6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 17:37:58 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10CF7C0613CE
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2020 14:37:58 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id r9so320813uat.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2020 14:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yBOWxB2321K0nviHMosmjzEKA9rYfYXfMrodT0hpf7A=;
        b=DSvw3cb/VokO0aHUeNw3leP/1Ajp6UPkFWHOZmkt7PkJmlaOQq75XG0CmzehL7Ir3b
         3fnO9XoEQ/d5zVW+ucrBTZDBw0H6yoBqF08Lvheyk2VrUgvCWYj1EN+u0CUiP0rZ7NK7
         UJu1zuQy/Vixd+KRWgq3tnhuRv/QA1LAa5YFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yBOWxB2321K0nviHMosmjzEKA9rYfYXfMrodT0hpf7A=;
        b=jCirKyqiHSasnpUyc1HF6xgoHeKONry7s/jBjpoTlsIxgVUy+r5TdTGkwe6YCwMXfR
         mN4/hDBydXR4+Q+hOtl3zAgDaGLP76bp5pLQejqPGcePqLd0B0YL2OIA0t9uS2t4W5GS
         M6PlFn/4pQXQqdza/Ay7MsARzMtJvytn5Yr/raIE2nRhxcvCi/W9w4L89neX2tMawjSn
         rrZvk2KMmWQ4xGOR1X7yMyYjBm1M6fN2G+zD4AIonyATr01xsyRrm4bzNMlyj3NzrncN
         2EWu7HFZJ/l2OiMT+X58eDxkzOV6btbTsPLxWk6CzPSVg9Y/TWG3GwWdYS2CFapYjRBO
         UgoQ==
X-Gm-Message-State: AOAM533kfolBu2ZwsaXhfKb1MSpVgFlMl4uacMO8NxNRXne+Ld8hKsp3
        hSdXQDyIK9BUJhvAvQIYXpa3UlotpwoSCF5FYUm2Bg==
X-Google-Smtp-Source: ABdhPJxOSKFLv6FUdXvwo9Kzlug/3CyRyn12FMtJvyIOznMU9zUml0fNKS/R9+hCxpT/QIBkONVN6WCtnRSRfNkvGrg=
X-Received: by 2002:ab0:907:: with SMTP id w7mr967440uag.100.1603143476645;
 Mon, 19 Oct 2020 14:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <b74ea9cb201bb98691ecbfb3893d2a49@codeaurora.org>
In-Reply-To: <b74ea9cb201bb98691ecbfb3893d2a49@codeaurora.org>
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Mon, 19 Oct 2020 14:37:44 -0700
Message-ID: <CANFp7mXMfvHrAcaJhY7q2oZk3MtqOMxLGOEpNc-hnzVSyA+LZA@mail.gmail.com>
Subject: Re: Update WCN3991 FW file
To:     asitshah@codeaurora.org
Cc:     linux-firmware@kernel.org, jwboyer@kernel.org,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, Hemantg <hemantg@codeaurora.org>,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Nack.

This resulted in a boot loop on ChromeOS. It looks like only
'crbtfw32.tlv' was changed and not 'crnv32.bin'.

Abhishek

On Sat, Oct 17, 2020 at 8:33 AM <asitshah@codeaurora.org> wrote:
>
>
> Hi Team,
>
> Please include updated firmware bin for WCN3991.
>
> Snapshot of pull request is as below, let me know if anything is
> missing.
>
> >>>>>
>
> The following changes since commit
> 58d41d0facca2478d3e45f6321224361519aee96:
>
>    ice: Add comms package file for Intel E800 series driver (2020-10-05
> 08:09:03 -0400)
>
> are available in the git repository at:
>
>    https://github.com/shahasit/bt-linux-firmware/tree/master
>
> for you to fetch changes up to 8877322c1254f327f47c86ec02c46013b68b9a47:
>
>    QCA : Updated firmware file for WCN3991 (2020-10-17 20:53:36 +0530)
>
> ----------------------------------------------------------------
> Asit Shah (1):
>        QCA : Updated firmware file for WCN3991
>
>   qca/crbtfw32.tlv | Bin 126300 -> 126832 bytes
>   1 file changed, 0 insertions(+), 0 deletions(-)
>
> <<<<<<
>
> Regards,
> Asit
