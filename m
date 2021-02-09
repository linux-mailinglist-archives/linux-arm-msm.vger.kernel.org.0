Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAA4531534F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 17:00:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232635AbhBIP7e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 10:59:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232690AbhBIP71 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 10:59:27 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D013C061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 07:58:47 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id l25so15183347eja.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 07:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qh55NKfhq80q01uNpPHo4JCkopn3QSRivu9D9OJow8g=;
        b=tRGbVcAGcjR15ZUnCytRAVXYVONJlbgkQArdQpLU64TjuYNeRAtkxZGa+RDpckJZs1
         sGb8aFFboldfOY5Hjo2K6jahC7ddTTCzOkXUewxm4zRqveuyThuYOYQHyiOxGKSzM4UH
         //agjiz745VAF4pYJ2ELwSx0ipMaX6wA6w2otit6iuqOG+kKnOqJFI0i+h2FaME5mVp3
         CG35SW859yYNWaaFG2644Psruvh4k8OeskMAvjOYI6A/tgzOhd8KLgEri3OeNSvJz743
         cUngWFzLso2wOQUiosuzUB7agZhS9ytBgw1RdZg6qJVISzi9jJoejFYsRUAZ3IpLoXWT
         nXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qh55NKfhq80q01uNpPHo4JCkopn3QSRivu9D9OJow8g=;
        b=jnfLhkVklvV3iLR5O/3Z9maWwV5IUmJzTSdUMISipYD6Uvqq7Y0j69ZGgQAP6ETLtk
         GlaZTqc/jw+88G34S5SxRvsO5OcLf1jsZoLmdhd9Ve4V+r3b+75+hch+qqp3v2edVjZ7
         gXKHVC24llswHGwPCntthvxHAb7us3JVYrkxpWfzMk9DX4lTbxbLZVWCPYrx9HED2Ns0
         koQPEDOTE07QoiEvoTnstDhafdW5fouUawO3selbnavMg7VunufXP8v959QU7SmvvTg3
         xkqZy0ZQoyLkyNRg8F4PySTX8HK3WkaIrC6xztk9IqsoDY9MaN/vye5II1Z5Vzz+QmtA
         wQ9Q==
X-Gm-Message-State: AOAM530jBBW16g+mvgo4ZeZHzIZU851PMgSIVpelOeUJG2s0b9EBS/E+
        squAjVuIu8bNzz/2238+3dbCs5fGki4N6pBjuFmG8w==
X-Google-Smtp-Source: ABdhPJw9dBw0rrXRcTT4Czb1YFxVlezJUv2BSyx871/MBghWGsN7aYY+lj/CwyfogVUt3bE2OnccGy47zcVA1kCk9Qc=
X-Received: by 2002:a17:906:f8d4:: with SMTP id lh20mr8224050ejb.466.1612886325979;
 Tue, 09 Feb 2021 07:58:45 -0800 (PST)
MIME-Version: 1.0
References: <1612885989-12288-1-git-send-email-loic.poulain@linaro.org> <f2612a01-2c10-9735-d4ba-46ea87c70379@codeaurora.org>
In-Reply-To: <f2612a01-2c10-9735-d4ba-46ea87c70379@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Tue, 9 Feb 2021 17:06:16 +0100
Message-ID: <CAMZdPi_16SfDoYC0vqqhRfEOqn3SHc6EUmfpVz0RRLaGek7_PQ@mail.gmail.com>
Subject: Re: [PATCH] mhi: Fix double dma free
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 9 Feb 2021 at 16:55, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>
> On 2/9/2021 8:53 AM, Loic Poulain wrote:
> > mhi_deinit_chan_ctxt functionthat takes care of unitializing channel
> > resources, including unmapping coherent MHI areas, can be called
> > from different path in case of controller unregistering/removal:
> >   - From a client driver remove callback, via mhi_unprepare_channel
> >   - From mhi_driver_remove that unitialize all channels
> >
> > mhi_driver_remove()
> > |-> driver->remove()
> > |    |-> mhi_unprepare_channel()
> > |        |-> mhi_deinit_chan_ctxt()
> > |...
> > |-> mhi_deinit_chan_ctxt()
> >
> > This leads to double dma freeing...
> >
> > Fix that by preventing deinit for already uninitialized channel.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > Reported-by: Kalle Valo <kvalo@codeaurora.org>
> > ---
>
> Seems like this should have a Fixes: tag, no?

Right, thanks, i'll add it in V2 once I get feedback.
