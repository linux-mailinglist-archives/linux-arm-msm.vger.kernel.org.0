Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C61817B151
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2020 23:20:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbgCEWUw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 17:20:52 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:35036 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbgCEWUw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 17:20:52 -0500
Received: by mail-vs1-f68.google.com with SMTP id u26so289892vsg.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2020 14:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LrmCjw7xyG8fg4C1dKjDiV0Q8S1LhYkzPOfDEOi+i6c=;
        b=JhxBDlNuZ+wqBBfKTq7jRiznrdUS2hRiPAoff37XUBYnwD4QbFPjdEWWg8BXQeu3HA
         sP5144hQmSd5qudCwUvdsz2OpsStzWufw3hsrRFRRi55g6skgNorWbKv7cJP1B6ltpMy
         Bze/Tte7ajsI4RYzI2m66PsE3nztR+E+istJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LrmCjw7xyG8fg4C1dKjDiV0Q8S1LhYkzPOfDEOi+i6c=;
        b=d8dHMcpHETMoOv6dQcBtGC5jWArOYYlDPxTFAbmjsrPh5iuihZOu58pxgp6+55f+4a
         p3zd0EnWga4y20UAZIom+eOQeKtuqQRbevj8Oh146O1DNW+IDiKww871EOEtjD4cgW1s
         5HltfQQsowBfh+LTI7p7u3N5rFLIKqcOtVNpkUER7DXOWp1EDqRGi61Pe2DE/ctGaDZ+
         h4u1CWBGQQi18SJRv1LtbzcLk4b77QpNeNN3sMDRDtY7zURCJSDQBMXcOaoow6Pf+DMF
         nZVXluQW++6g9BliBqAB3bUmTCRy4Hh+t9bB1r+9ZhtnVDk6LF8c+5oz1hs2IuQoRBat
         edyg==
X-Gm-Message-State: ANhLgQ29g+Rij8FvdeA2t58iZek05hv0IFLfSDOrau+7dn+gTOTih0mh
        BTl+5+aDWTMErN4lrfENqiAvYp5zHRc=
X-Google-Smtp-Source: ADFU+vuzTh2dAsp/RS1ITY0eLMAZ5F4nWhzpHgHYEBmgnQbV98Jboq3+jotlEeGvdv8sDJNmHYWUtw==
X-Received: by 2002:a67:e99a:: with SMTP id b26mr352527vso.27.1583446850737;
        Thu, 05 Mar 2020 14:20:50 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id f10sm3959203vkf.37.2020.03.05.14.20.50
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2020 14:20:50 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id k188so266136vsc.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2020 14:20:49 -0800 (PST)
X-Received: by 2002:a05:6102:101d:: with SMTP id q29mr385638vsp.73.1583446849518;
 Thu, 05 Mar 2020 14:20:49 -0800 (PST)
MIME-Version: 1.0
References: <1583428023-19559-1-git-send-email-mkshah@codeaurora.org> <1583428023-19559-5-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1583428023-19559-5-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 5 Mar 2020 14:20:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U8zaZCTrZvtipSmaQL8NGg+4aNpyP=KhQ5EYioKovnYA@mail.gmail.com>
Message-ID: <CAD=FV=U8zaZCTrZvtipSmaQL8NGg+4aNpyP=KhQ5EYioKovnYA@mail.gmail.com>
Subject: Re: [PATCH v12 4/4] soc: qcom: rpmh: Invalidate SLEEP and WAKE TCSes
 before flushing new data
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Mar 5, 2020 at 9:07 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> TCSes have previously programmed data when rpmh_flush is called.
> This can cause old data to trigger along with newly flushed.
>
> Fix this by cleaning SLEEP and WAKE TCSes before new data is flushed.
>
> Fixes: 600513dfeef3 ("drivers: qcom: rpmh: cache sleep/wake state requests")
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/soc/qcom/rpmh.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> index 1951f6a..63364ce 100644
> --- a/drivers/soc/qcom/rpmh.c
> +++ b/drivers/soc/qcom/rpmh.c
> @@ -472,6 +472,11 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>                 return 0;
>         }
>
> +       /* Invalidate the TCSes first to avoid stale data */
> +       do {
> +               ret = rpmh_rsc_invalidate(ctrlr_to_drv(ctrlr));
> +       } while (ret == -EAGAIN);
> +
>         /* First flush the cached batch requests */
>         ret = flush_batch(ctrlr);
>         if (ret)

I think you should make this patch 3/4 instead of 4/4, and then:

1. In this patch remove the call to rpmh_rsc_invalidate() in
rpmh_invalidate().  You've already marked things "dirty" in
invalidate_batch() so no need to actually program the hardware--it'll
happen in the flush.

2. In patch 4/4 (the flushing patch) add a call to rpmh_flush() to
rpmh_invalidate() if you're in non-OSI mode.  Presumably you'll need a
spinlock around the rpmh_flush() call?


The end result of that will be that rpmh_invalidate() will properly
leave the non-batch sleep/wake sets programmed.


-Doug
