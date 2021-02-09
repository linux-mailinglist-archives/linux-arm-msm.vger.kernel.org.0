Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74B2B315324
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 16:48:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231952AbhBIPsS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 10:48:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231920AbhBIPsR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 10:48:17 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 330BAC061788
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 07:47:36 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id w2so32340208ejk.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 07:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Acf2K9MJFm9+/DbR58JnF+x6zKf80KHV0nvkVqkhbcw=;
        b=V6owVQaDSHL/U71WtbWMVpQlVyxAZJe6unKUfw69bHODlFZmjsTwbprYFbFShn+KWT
         HB0ghqrJezp2jjRsGGCslNNPIGWSD8xFU57fzmPZKmJBV+laQ1uxWDtn/vw7AgEnXrys
         WVL9B8v8lbcNHkeOMshQwZX50HpoRjXkJSQkVx00bHjZEz7rXtbDL8P+/c+j+s0YlbmC
         IP8P0CWXXnMSXmKOygQMLgP4jJWiSeb/gKfmEX5FmOQ4VpGKB79nlZtKnHQZpc6+g2K5
         qCgj9frvppuBC8PTsKpikmfE1e3Oy4rT1lZUY6cQVZXzrB5U1BwipBKwkkyIR0wEcz3h
         MG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Acf2K9MJFm9+/DbR58JnF+x6zKf80KHV0nvkVqkhbcw=;
        b=JrrxBTr18dUau/18N+zHv/KM23yh8QZDB7uboSvJ3VlIB1Qm/+IvZP68pLz8BeziHO
         n5uRFa88ixgquI0QC/xKrBHupPnZF1wLwEFdcmTWSim0+f7UX75SkWT67YFywfJQpf0a
         EJWNA0NNI6yJX7hwaLkr0cdvx+WoMk3gdDTR3dDVzDz1B8dPbWqA4DkVGeHQ6E5hV4gp
         LtBJA8HNBrf9URWOx1G3s+vwLxPjRzYQc++yroy+5FORnXpyOnuL2hnLeQIPdNA7HBz2
         APKAF8ZJ4kIibHTrGb8YFQMn5AKnvCvTEOATYfo+3iw+BvGhk24YN2WwF2siHmNBVCsq
         pQEw==
X-Gm-Message-State: AOAM5315lyCJYLGxNilxA5FNH/ot99TsEmr9jk4mHxPQGk0LUhR7HjoS
        w0DCdYZWzo7NKzCmupCzErls0Kjbl4gQ8dDW5QO18Q==
X-Google-Smtp-Source: ABdhPJycitPdCjp7dOAhfhc9jMhZ1cGI8l/zcBO3dAQCHHkFrpsoQ9Ypr9YPZklCNt0sQ2zSA/IOCKrITbTNMzrFiTE=
X-Received: by 2002:a17:906:2851:: with SMTP id s17mr23247061ejc.510.1612885654880;
 Tue, 09 Feb 2021 07:47:34 -0800 (PST)
MIME-Version: 1.0
References: <1612885989-12288-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1612885989-12288-1-git-send-email-loic.poulain@linaro.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Tue, 9 Feb 2021 16:55:04 +0100
Message-ID: <CAMZdPi9xRTrhkZ+q4db0GKZb+AcJ9YXY_-_wTO6KNROCxipj0g@mail.gmail.com>
Subject: Re: [PATCH] mhi: Fix double dma free
To:     Kalle Valo <kvalo@codeaurora.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Kalle,

On Tue, 9 Feb 2021 at 16:45, Loic Poulain <loic.poulain@linaro.org> wrote:
>
> mhi_deinit_chan_ctxt functionthat takes care of unitializing channel
> resources, including unmapping coherent MHI areas, can be called
> from different path in case of controller unregistering/removal:
>  - From a client driver remove callback, via mhi_unprepare_channel
>  - From mhi_driver_remove that unitialize all channels
>
> mhi_driver_remove()
> |-> driver->remove()
> |    |-> mhi_unprepare_channel()
> |        |-> mhi_deinit_chan_ctxt()
> |...
> |-> mhi_deinit_chan_ctxt()
>
> This leads to double dma freeing...
>
> Fix that by preventing deinit for already uninitialized channel.
>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reported-by: Kalle Valo <kvalo@codeaurora.org>

This is a 'blind' fix tentative, can you please check if it resolves
the issue on your side?

Thanks,
Loic
