Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 348B029CAE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 22:04:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1831901AbgJ0VEB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Oct 2020 17:04:01 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:35115 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1831899AbgJ0VEA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Oct 2020 17:04:00 -0400
Received: by mail-vs1-f66.google.com with SMTP id n18so1690165vsl.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2020 14:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vDNUWG0CCAnI3/on8IU6/S5zmNaXv0vHa0ORBBe1kWM=;
        b=KeWMd4gTFJ9eHYAhHVe2NPACQcU79GrdCOj9bGwxQdFtUHpDxd/oHItRsTJlHKmvCP
         ugKjI6QsWk21IfGnqh14LWbQMPwxNMVq2hMBEzagLTExqkAS85+NaIzzzpIWbX6RO61x
         A6zgzVYT0et+/OdflYTNsD4S36LLBzGuSKAfr/fWyeb445od6QNoaR4XapWqCI/2U18v
         Xtbl15GulaX/gZ1LpOzDqW20PU51XUzyxynnhYi+sHg//x3KIoaKhGa0I1RLwqVG6VCj
         yQgao27O5kJL7yy3bMrJB83ux7h/pGej/w8jTw9lpwIUgCtR8oq9aPz3HzDDBf2PQ1Pi
         CMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vDNUWG0CCAnI3/on8IU6/S5zmNaXv0vHa0ORBBe1kWM=;
        b=rhxCFe/mh6+4Ra/iRHaLPuJhMIax6oLn9GKr+lZpMdn41COrBmcRp9NlOAhd+UcUzu
         Szsn8c0+kDYlx0+K6DvDvf1MUCYB4dRbxnl96c8iqr0FEpMA87evSvHxnA50lXvdiE8a
         raY0qGXZgv/9Dijx/G93+GsXwrkHeag1Vp+frmqvwucrlXL71UKIxDQJTbvR5CKcw0O2
         vmnmGaLHVdT+XXJ+fkFu3qB+jZ3l6vU/nS+vtZSm4l+tvITtTaxbZcmBk4vJhVlBSot5
         VxUzQX3STM78eHrko9F3D+e0NFSJWaakA6LVS4YYKOQFIkra8rX9LI8QcXRChtLEo4Fe
         +uNQ==
X-Gm-Message-State: AOAM533dpDgF9DSf+U2jZuEltpQY7/SGwEOqVpzrpKnL+d4nZR6g/05W
        Y1Ucks/0ir5A/BLPErzla3EAdfABgE0=
X-Google-Smtp-Source: ABdhPJxj0azikMDGqdRODIJuYHBoICDLqEasu0cM0bjS66wrGJh3MgbTt0yJ1xX0M0d/hqq23JedJA==
X-Received: by 2002:a67:ecd8:: with SMTP id i24mr3481039vsp.17.1603832638335;
        Tue, 27 Oct 2020 14:03:58 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id l28sm312007vkm.0.2020.10.27.14.03.56
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2020 14:03:57 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id f15so899586uaq.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2020 14:03:56 -0700 (PDT)
X-Received: by 2002:ab0:5447:: with SMTP id o7mr2895661uaa.37.1603832635805;
 Tue, 27 Oct 2020 14:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <1603787977-6975-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1603787977-6975-1-git-send-email-loic.poulain@linaro.org>
From:   Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date:   Tue, 27 Oct 2020 17:03:18 -0400
X-Gmail-Original-Message-ID: <CA+FuTScQC_4Xnpv=_yTmDbwyEv-1Ao3hSX189+7QVPBNhv=A=A@mail.gmail.com>
Message-ID: <CA+FuTScQC_4Xnpv=_yTmDbwyEv-1Ao3hSX189+7QVPBNhv=A=A@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] bus: mhi: Add mhi_queue_is_full function
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        David Miller <davem@davemloft.net>,
        manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        Network Development <netdev@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 27, 2020 at 4:33 AM Loic Poulain <loic.poulain@linaro.org> wrote:
>
> This function can be used by client driver to determine whether it's
> possible to queue new elements in a channel ring.
>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  v1->v5: not part of the series
>  v6: Add this commit, used for stopping TX queue
>  v7: no change
>
>  drivers/bus/mhi/core/main.c | 15 +++++++++++++--
>  include/linux/mhi.h         |  7 +++++++
>  2 files changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index a588eac..44aa11f 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -943,8 +943,8 @@ void mhi_ctrl_ev_task(unsigned long data)
>         }
>  }
>
> -static bool mhi_is_ring_full(struct mhi_controller *mhi_cntrl,
> -                            struct mhi_ring *ring)
> +static inline bool mhi_is_ring_full(struct mhi_controller *mhi_cntrl,
> +                                   struct mhi_ring *ring)

The compiler can decide whether to inline or not.

>  {
>         void *tmp = ring->wp + ring->el_size;
>
> @@ -1173,6 +1173,17 @@ int mhi_queue_buf(struct mhi_device *mhi_dev, enum dma_data_direction dir,
>  }
>  EXPORT_SYM
