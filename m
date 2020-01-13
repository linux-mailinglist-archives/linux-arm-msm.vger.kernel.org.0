Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80D58139799
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 18:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728733AbgAMRY6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 12:24:58 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46755 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728646AbgAMRY5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 12:24:57 -0500
Received: by mail-pf1-f194.google.com with SMTP id n9so5160544pff.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2020 09:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=U2PWwEEnO5+ksSRfTkvVAkgMJvekPPQPvk+J1MXkAKA=;
        b=fIDSBdAgWDIiMm+DJrGSk8SNVlkqqoJ/XOYER2KVMmFc85XBWE4fErM4MFi85PEx2h
         2Igm5N9Sw8crh8PmobTPG1r0fpWIz9heb2tmNk/Svm2Hxp7Nb47ZngRKZ0JeD+DCJpYe
         WIFC61PxN+EIo3zyUbdFykkit80459ecCP/nPUpBTdSqPxMwyduO8/ncgNndqrYsbPC1
         NoLgWSqo7mDBTDKENNorvGv4h6vVDgJzKAoIMXvIQgn83zmsnj5pMW78uCuKA/TW3tI6
         vhcDzEa+PHR4GKZ+CfD6TDAsfauhcAox/mVJ9fH0mfHAYHRllagoSZJb+h8uqcj5WtVS
         7f6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=U2PWwEEnO5+ksSRfTkvVAkgMJvekPPQPvk+J1MXkAKA=;
        b=gL/sHTB8mWB16wNFN0asIX6pc9cZEpThPYQC81N3o+Ql+BgZ1tzyebEArwzkSIw7Bh
         aeQRZdD4KY0GXAZRHmVaU0+YzRavHj7XTNCNFOIXAc80VTIW/Yc1gVoq7x5wAV7sn6vG
         WUlVLCxGBZQi+oktJfjpraN8mFWKtgevKE6ONZpi3cp5Li47SqzHXtYWl6OsOcvLTqoT
         W2/RVA2l+JgErR6IWehPhk4umZCXTLvcunSWJlllrCVfgqze+YpqCYnSbzy9g98Yh2fN
         AeoDMbvGMqIm7oAL28NpyA1aaaIf7aaprtbiaCYOBnGJO0/1nj5P1LQUpm4Am0SlQZn2
         CnzQ==
X-Gm-Message-State: APjAAAVfqkudkRh1AqYO3LOD9NRek5flMcFfNqO4UX1RRvAseu3gRbUn
        pC3oy7NUtLCSKF57Qf0RWp9mHFs+JTc=
X-Google-Smtp-Source: APXvYqw80f6wRiRP9Dwvx/NTeGY9Bf9oleVCbpo6cpd3kqWBdbqpjm+tTzcPB06sPHd1+r+7vplIzg==
X-Received: by 2002:aa7:8b17:: with SMTP id f23mr20824919pfd.197.1578936297041;
        Mon, 13 Jan 2020 09:24:57 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d26sm13917312pgv.66.2020.01.13.09.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 09:24:56 -0800 (PST)
Date:   Mon, 13 Jan 2020 09:24:53 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Suman Anna <s-anna@ti.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2] rpmsg: core: add API to get MTU
Message-ID: <20200113172453.GQ738324@yoga>
References: <20191113172249.32412-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191113172249.32412-1-arnaud.pouliquen@st.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 13 Nov 09:22 PST 2019, Arnaud Pouliquen wrote:

> Return the rpmsg buffer MTU for sending message, so rpmsg users
> can split a long message in several sub rpmsg buffers.
> 

I won't merge this new api without a client, and I'm still concerned
about the details.

> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  V1 to V2
> 
>   V1 patch:https://lore.kernel.org/patchwork/patch/1124684/
>   - Change patch title,
>   - as not solution today to support MTU on GLINK make ops optional,
>     RPMsg client API returns -ENOTSUPP in this case,
>   - suppress smd and glink patches.

That's ok.

> ---
>  drivers/rpmsg/rpmsg_core.c       | 21 +++++++++++++++++++++
>  drivers/rpmsg/rpmsg_internal.h   |  2 ++
>  drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++++
>  include/linux/rpmsg.h            | 10 ++++++++++
>  4 files changed, 43 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index e330ec4dfc33..a6ef54c4779a 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -283,6 +283,27 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>  }
>  EXPORT_SYMBOL(rpmsg_trysend_offchannel);
>  
> +/**
> + * rpmsg_get_mtu() - get maximum transmission buffer size for sending message.
> + * @ept: the rpmsg endpoint
> + *
> + * This function returns maximum buffer size available for a single message.
> + *
> + * Return: the maximum transmission size on success and an appropriate error
> + * value on failure.

Is the expectation that a call to rpmsg_send() with this size will
eventually succeed?

> + */
[..]
> +static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
> +{
> +	struct rpmsg_device *rpdev = ept->rpdev;
> +	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
> +
> +	return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);

I'm still under the impression that the rpmsg protocol doesn't have to
operate on fixed size messages. Would this then return vrp->num_bufs *
vrp->buf_size / 2 - sizeof(rpmsg_hdr)?

> +}
> +

Regards,
Bjorn
