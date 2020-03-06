Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 772F217BA39
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2020 11:30:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbgCFKag (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Mar 2020 05:30:36 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:37546 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbgCFKaf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Mar 2020 05:30:35 -0500
Received: by mail-vk1-f194.google.com with SMTP id t192so463436vkb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2020 02:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CiEHFDX5XCyqxsRPXe0c69an10+KUtnxfdeFDLtN22M=;
        b=V2SwrQ6Q37K/It9fEqHQK6Y8UWzqPhz/RSVXNYUeuROPCNxIbb9/k4K6yvE4eVGDYW
         iV5qCHDlAmewh4x9xJbTaCqzzGFohDhizaCy3ObP5BKdc2Upw4tDFyK06gIPelY16BA/
         pCcRC0HOFVb4s+Mxl5/fqSGcObERGaK0Cde6iIlpL8Ptk4INIQVE6AHOfB7FpIKTwVXN
         KZOdzUeKKvgu7YvJdD2VXAvAo0AJSTytWC5FSP7m6jVQKw/n6OOu7nUSh5Jyy6Y7gCGy
         YMhm4rPm0cD974+PETJ2dT8uQZzjsAEiwHJpwNA+WOmlDkSXXMNDvJ2byLcd8jBCCwYn
         qhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CiEHFDX5XCyqxsRPXe0c69an10+KUtnxfdeFDLtN22M=;
        b=NnxzkzMjsKUCkb+iNGS8qzi3MFEiyKFlNSvL6YQv7u5HVUCioOz1U+FBMqe4SwjMxb
         xbRNQQ+H7w23AusBsorJMIYUs7eZJYfDUaMPpbSJHSVlhSK1kZWxmEaUYomSB7XulsDQ
         uY4J8t4lO4ekcVTgbGduI7Kykwlr2AzDyf5zq1ObUvVBfEKuW78WfBvDMlpXM9mCwtuE
         POnaCPehWijaPhtcSP3Psjrqvco37tmrMSYq9GOjea2pEr+QC2u3m5fPJ/BxhBn+ttAZ
         MF0LPMBGNy0pmFyGO5mSYShLb8KcRw78LAk+XRRwqWzol7Uvnt74JVM/WZ2OpjEwuNgJ
         j31Q==
X-Gm-Message-State: ANhLgQ1D7z+mTY+ziAgNSKLdNl+ujr1ARWRhBCT0dsRhzxDenV+UiIos
        Vr0Dw2crB2wyHNdw+Z2Z4gJ3h8V1aW3ufFWhqzSP2w==
X-Google-Smtp-Source: ADFU+vuyitkE8/2HLqkIC9+fIzBUR+dCUhlIHfF2nPz3wi79/VK4ACp9VkezVy4BksFiUyzlY1gvtv0RTfFZQrrn6qY=
X-Received: by 2002:a1f:434d:: with SMTP id q74mr1139900vka.59.1583490633314;
 Fri, 06 Mar 2020 02:30:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582839544.git.nguyenb@codeaurora.org> <b328b981a785525b8424b4ab2197dc1ec54417d1.1582839544.git.nguyenb@codeaurora.org>
 <CAPDyKFrGmXj8HWNz2irUd7i8Cb77U8rLM=V91vcrWE+r7Pqeyg@mail.gmail.com> <fd4bdb88d984a4095215347bc6e80afe@codeaurora.org>
In-Reply-To: <fd4bdb88d984a4095215347bc6e80afe@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 6 Mar 2020 11:29:55 +0100
Message-ID: <CAPDyKFq8MWW-3ys9OhQtFepohexD34e9_6X3suYPrAAKnATp6g@mail.gmail.com>
Subject: Re: [<PATCH v1> 1/4] mmc: core: Add check for NULL pointer access
To:     "Bao D. Nguyen" <nguyenb@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Asutosh Das <asutoshd@codeaurora.org>, cang@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 6 Mar 2020 at 04:38, <nguyenb@codeaurora.org> wrote:
>
> On 2020-02-27 22:46, Ulf Hansson wrote:
> > On Thu, 27 Feb 2020 at 23:06, Bao D. Nguyen <nguyenb@codeaurora.org>
> > wrote:
> >>
> >> If the SD card is removed, the mmc_card pointer can be set to NULL
> >> by the mmc_sd_remove() function. Check mmc_card pointer to avoid NULL
> >> pointer access.
> >>
> >> Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
> >> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> >> ---
> >>  drivers/mmc/core/bus.c  | 5 +++++
> >>  drivers/mmc/core/core.c | 3 +++
> >>  2 files changed, 8 insertions(+)
> >>
> >> diff --git a/drivers/mmc/core/bus.c b/drivers/mmc/core/bus.c
> >> index 74de3f2..4558f51 100644
> >> --- a/drivers/mmc/core/bus.c
> >> +++ b/drivers/mmc/core/bus.c
> >> @@ -131,6 +131,11 @@ static void mmc_bus_shutdown(struct device *dev)
> >>         struct mmc_host *host = card->host;
> >>         int ret;
> >
> > This obviously doesn't solve anything as we have already dereferenced
> > the card->host above. In other words we should hit a NULL pointer
> > dereference bug then.
> >
> > More exactly, how do you trigger this problem?
> I am porting this fix in the older kernel version 3.4. In that version
> 3.4, the pointer check was needed.
> Obviously, this NULL pointer check is not helping anything here as you
> pointed out. I will remove this check and resubmit.

Don't get me wrong, we have had serious errors in the mmc core before,
that we needed to fix. Perhaps, the series are addressing some issues
like this, I don't know.

The point is, either you need to provide a detailed theoretical proof,
or a description of how to reproduce the problem. If not, I don't see
how I can pick any of your patches, sorry.

[...]

Kind regards
Uffe
