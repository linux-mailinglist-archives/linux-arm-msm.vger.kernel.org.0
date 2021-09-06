Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0230401DF7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Sep 2021 18:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243365AbhIFQCV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Sep 2021 12:02:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232130AbhIFQCV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Sep 2021 12:02:21 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42202C061575;
        Mon,  6 Sep 2021 09:01:16 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id w17so5743833qta.9;
        Mon, 06 Sep 2021 09:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FJK6YbomEqVIzVAq7qIFz1k3r2WLUCQ5EW1kmXxNyhY=;
        b=b4e8KIupGJBoafsdONoRw3AbfV0IK9zuf68bRZaVXJBsbn+XA/Kx8RGujLj1RHA/eF
         +t1B8WopoLqoBO9EYHV74bqhpZavUVCnAS6kH7AKjm2Bxv9YlI4h76jkMIV7d6C3L6xD
         SW/pqiWrTq3cI4aU0ZydcK9pGv2ja1lSNHQeEh5sGbSeoBBwxMy3lBuin6u+MFo1g4Y5
         JcWq7ja06MwwhtfUVZX+e0KpF0aaIZNA5fe88weLOgqTf+cjVmkoK7TpH4yLlvNILnbf
         xaBVpXkC0nPE/4yd6thQunH2CkKujHVPI5uGkvnhDPHjr8dzBZxUER0Kn9kF2m3koWqR
         nzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FJK6YbomEqVIzVAq7qIFz1k3r2WLUCQ5EW1kmXxNyhY=;
        b=MgYgqsVaUx/hZ7OhVqkdPUyuKIuLme5WmX8UaUJnax0rTOsCS8B5NWO/GXYTJigoLj
         Y0op0PacOkdAlza0QILcOYb2d/luzW03JukInPUfUTRt7zJTA+AaXvclFzxO8v7ZQUxS
         JkZqJtPOg3LuU8/HPIUPFdqegXcNB+zhaHbaYZw31+EA6gUSzys/smhf3DRrDSQEBmTB
         80zzi5/D+z0JXY+Ns4P4QaSV3Q1zJtzaV+faRf3ujr9nGKQjGvf7sYnbPgT4AZuWXGGL
         4Z2ro88+yoKBXS92AVjVsz8jbXX2GTXdOwMb959SORQRixrYcDDAWEZD1kuExCjon6jj
         8g0g==
X-Gm-Message-State: AOAM532ghs1kExEV37znvQ/dTmJS5BPYUqGK1XbXoNPeXIW2nmU7OHwF
        JHy2HJsYBacmtwL5/JoYmfIqATTmiAOeLGSd2yM=
X-Google-Smtp-Source: ABdhPJwgSTP8vJkZbV42sYvXOUcaMlRZXD34GUZUjXOhCF0PUOgdRb1gipQs7vFP6iajgjPhmCSiBBeYZ7u6hL8Zte8=
X-Received: by 2002:ac8:57c7:: with SMTP id w7mr11338439qta.53.1630944075365;
 Mon, 06 Sep 2021 09:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210905171131.660885-1-robimarko@gmail.com> <2c26a5c1302813f5343cb0fd5c192267@codeaurora.org>
In-Reply-To: <2c26a5c1302813f5343cb0fd5c192267@codeaurora.org>
From:   Robert Marko <robimarko@gmail.com>
Date:   Mon, 6 Sep 2021 18:01:04 +0200
Message-ID: <CAOX2RU7TnVK420tTkTB=jVHHvHwtYWVKhpat1nc_7LLBoG8XSg@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: socinfo: Add IPQ8074 family ID-s
To:     Kathiravan T <kathirav@codeaurora.org>
Cc:     agross@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 6 Sept 2021 at 17:50, Kathiravan T <kathirav@codeaurora.org> wrote:
>
> On 2021-09-05 22:41, Robert Marko wrote:
> > IPQ8074 family SoC ID-s are missing, so lets add them based on
> > the downstream driver.
> >
>
> Did you intentionally left out the IDs for below variants?
>
> IPQ8172 - 397
> IPQ8173 - 398
> IPQ8174 - 399

Yes, I wasn't really sure what to do with those.

Regards,
Robert
>
> Reviewed-by: Kathiravan T <kathirav@codeaurora.org>
>
> > Signed-off-by: Robert Marko <robimarko@gmail.com>
> > ---
> >  drivers/soc/qcom/socinfo.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> > index 9faf48302f4b..288897868435 100644
> > --- a/drivers/soc/qcom/socinfo.c
> > +++ b/drivers/soc/qcom/socinfo.c
> > @@ -281,19 +281,31 @@ static const struct soc_id soc_id[] = {
> >       { 319, "APQ8098" },
> >       { 321, "SDM845" },
> >       { 322, "MDM9206" },
> > +     { 323, "IPQ8074" },
> >       { 324, "SDA660" },
> >       { 325, "SDM658" },
> >       { 326, "SDA658" },
> >       { 327, "SDA630" },
> >       { 338, "SDM450" },
> >       { 341, "SDA845" },
> > +     { 342, "IPQ8072" },
> > +     { 343, "IPQ8076" },
> > +     { 344, "IPQ8078" },
> >       { 345, "SDM636" },
> >       { 346, "SDA636" },
> >       { 349, "SDM632" },
> >       { 350, "SDA632" },
> >       { 351, "SDA450" },
> >       { 356, "SM8250" },
> > +     { 375, "IPQ8070" },
> > +     { 376, "IPQ8071" },
> > +     { 389, "IPQ8072A" },
> > +     { 390, "IPQ8074A" },
> > +     { 391, "IPQ8076A" },
> > +     { 392, "IPQ8078A" },
> >       { 394, "SM6125" },
> > +     { 395, "IPQ8070A" },
> > +     { 396, "IPQ8071A" },
> >       { 402, "IPQ6018" },
> >       { 403, "IPQ6028" },
> >       { 421, "IPQ6000" },
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> member of Code Aurora Forum, hosted by The Linux Foundation
