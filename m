Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED59293CE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 15:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407072AbgJTNFP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 09:05:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:58512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406822AbgJTNFO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 09:05:14 -0400
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6AAF5224D3;
        Tue, 20 Oct 2020 13:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603199113;
        bh=P//lj6K311r5btfpqbVgclWKNTCDgXGdUzB0poiKCXU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qtgAvetdhVveUfEg8eEeh9mPtJdRz2ghfNFuYPMKICOIydgAhUUvCX6BWcyqH1VaT
         7bmhvK0xGZ/lvcTnCxI68tsHcuW1RoR26BXc24Jp+CDWKO0TloWdzuYbHT3UgumY5F
         5qFwu0pq8WGyINo84UnwZ2Eu7uj4XO3gQvsuGjBo=
Received: by mail-oi1-f172.google.com with SMTP id q136so2038338oic.8;
        Tue, 20 Oct 2020 06:05:13 -0700 (PDT)
X-Gm-Message-State: AOAM532KkwvwjhdzZ8BwJRgojHh9FjOHjXAyepn+OqSGU2iG6NS5OB8A
        U92X4PeJcHOkk8aTDjmwQXpsBcUkUm+36htKew==
X-Google-Smtp-Source: ABdhPJwur0VjhxUMPuAAjcuxZlUKJVKP6/t6vtVmHoBVVnFxoiwxggwm7mf0lmRtdVbJYrELUliXQF8km4rM70OwG8Q=
X-Received: by 2002:a05:6808:10e:: with SMTP id b14mr1794086oie.152.1603199112623;
 Tue, 20 Oct 2020 06:05:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1603148363.git.gurus@codeaurora.org> <7a89811f36fe858756daa62f1162d18da7e79a73.1603148363.git.gurus@codeaurora.org>
In-Reply-To: <7a89811f36fe858756daa62f1162d18da7e79a73.1603148363.git.gurus@codeaurora.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 20 Oct 2020 08:05:01 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+bfTxbgS0hBo4XeJfFFYK4mcaQ=LF7UE_S2W_Qbm3rtg@mail.gmail.com>
Message-ID: <CAL_Jsq+bfTxbgS0hBo4XeJfFFYK4mcaQ=LF7UE_S2W_Qbm3rtg@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND v1 2/3] dt-bindings: mfd: Add QCOM PM8008 MFD bindings
To:     Guru Das Srinagesh <gurus@codeaurora.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Markus Elfring <Markus.Elfring@web.de>,
        Lee Jones <lee.jones@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Joe Perches <joe@perches.com>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 19, 2020 at 6:17 PM Guru Das Srinagesh <gurus@codeaurora.org> wrote:
>
> Add device tree bindings for the driver for Qualcomm Technology Inc.'s
> PM8008 MFD PMIC.
>
> Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> ---
>  .../bindings/mfd/qcom,pm8008-irqchip.yaml          | 103 +++++++++++++++++++++
>  1 file changed, 103 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/qcom,pm8008-irqchip.yaml

Please resend to DT list if you want this reviewed.
