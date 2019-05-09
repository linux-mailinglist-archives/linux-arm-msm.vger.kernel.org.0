Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41CEE18D1C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2019 17:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726779AbfEIPjX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 May 2019 11:39:23 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:33600 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbfEIPjX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 May 2019 11:39:23 -0400
Received: by mail-vs1-f66.google.com with SMTP id y6so1720828vsb.0;
        Thu, 09 May 2019 08:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yd8RkYcSwt5CH746lToN3J7dxLcl9P87HyYsL7ViWQY=;
        b=FCiSzQoJkd2cwXjtOL7ovFDazzwL9mHcuR2iZx/UnXJT9pvM3vefzQ7noANymRwlC1
         Bt3c7yLSzPVoq3t7tOroTOidR0w9JyCZqqU0HtMRFRu+ziouU9DQvJZ8QzEQIXgIpNPi
         L3DwfbQdAxh+boYjL57aB2PtN0foQz5Rl1NYT/ztQLhAM8rbpWoHgxeYfiCpNnMAD9U5
         u3XxCLfTy+FRxK+mk5bk0w90ELsQ+NVf4YfIPrr1O0KuBpt5PgZmE+PYoiDS9enSpS0y
         l+dmJAjNeXWXIkODKKjFCZpmwEaUym5zHcCVzPKRLad448LW35UqYbWHjYj3I5b2/A1f
         S1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yd8RkYcSwt5CH746lToN3J7dxLcl9P87HyYsL7ViWQY=;
        b=D1qxoX7IEZIUxqKg6sV3XhSuNZ7XJGDi0g1/yBHeqBzeSoAQAppt0PBg1P8Pz/bOAs
         V1utJ1lIaQsbQvLpLhkRdMgAKmmwd9/Uo2DjudqkKHEsf8y6bl1d065+TLnw+N0kNkX1
         Lor3/Wg44F9CpbwYN2vOnAWZTI3xfs8N7vruNLU2Js3tQ/wxt6zaZaI/2/dApIdik/8E
         HsWAOpN/0VxquNWpJfZmZMQl1rpkcrcW1zCTQP94hnD6n2n/eJNdiG7XZUf7h7q7jqTL
         vTw7FS/56l3leU5DbUjR7WjRV3fZ606Lx5oM964vFxx36s0j7ZCVC2zxnIKFCyrNaJsw
         s6rQ==
X-Gm-Message-State: APjAAAVKDZCv7dD7pNEuLuf+T0soGosfj7HSVETFkbCvOMHH8DpcfCak
        UAg4zVuK2XEl8PNWCjJZ7H7TkucX61dRH/90qUU=
X-Google-Smtp-Source: APXvYqwTohibUJuLYdL5JMayoegLe/NsHqe3cEirwttrcoCdPnewPhpehYhcNpc+Ijr0lSu8NCtkxTFBC/JKsFj+/lM=
X-Received: by 2002:a67:f153:: with SMTP id t19mr2504897vsm.148.1557416361757;
 Thu, 09 May 2019 08:39:21 -0700 (PDT)
MIME-Version: 1.0
References: <1557252127-11145-1-git-send-email-jcrouse@codeaurora.org> <1557252127-11145-3-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1557252127-11145-3-git-send-email-jcrouse@codeaurora.org>
From:   =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@gmail.com>
Date:   Thu, 9 May 2019 08:39:10 -0700
Message-ID: <CAOeoa-d4tC9VYR_O_Nfrx=hm1Xi4JpsLEDWCibv39CGxsSFt=Q@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v1 2/3] drm/msm: Print all 64 bits of the
 faulting IOMMU address
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 7, 2019 at 11:02 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> When we move to 64 bit addressing for a5xx and a6xx targets we will start
> seeing pagefaults at larger addresses so format them appropriately in the
> log message for easier debugging.

Yes please, this has confused me more than once.

Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>

> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>  drivers/gpu/drm/msm/msm_iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index 12bb54c..1926329 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -30,7 +30,7 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
>         struct msm_iommu *iommu = arg;
>         if (iommu->base.handler)
>                 return iommu->base.handler(iommu->base.arg, iova, flags);
> -       pr_warn_ratelimited("*** fault: iova=%08lx, flags=%d\n", iova, flags);
> +       pr_warn_ratelimited("*** fault: iova=%16lx, flags=%d\n", iova, flags);
>         return 0;
>  }
>
> --
> 2.7.4
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
