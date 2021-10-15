Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9076D42F62F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 16:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240826AbhJOOt7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Oct 2021 10:49:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240848AbhJOOty (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Oct 2021 10:49:54 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 927BCC061772
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 07:47:47 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 62-20020a9d0a44000000b00552a6f8b804so12545370otg.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 07:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=++7yTK3eP5/FAO2Z0iSkv+MDdc9B89z1wkbeU182Ikg=;
        b=XbPtXBIpqXS+4GqKUpLKnV/TL+EYThYjN2Cv59T7YtpgcFk7nvnfhURMU1P6igmu5n
         Lg6HiV8Ul7ZsJoL8tsChafYC1KPwjh4CPHQgWqUcfMMZ4I3THsL0kRAW1fwdw41G/UMm
         ZVGxLF4qC7/KEI2KjTsNcGz9Qm1iMwIbxEpbuMmI2Hog8TvbIEUEZV8qstnjyh6Z7zvO
         XeJ7b3qWz84ZOkiZyQ9qPacf+Ggxhub1DzfDOtcRRGB9HhmYgu62GN1axwEtZGVAHxdz
         rlUJvUyO/cT1FsdwGLG7YybpFRdZpNhoqntShLvILJcFWXJkmTLcsU6+wX9GRW87RiWb
         MzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=++7yTK3eP5/FAO2Z0iSkv+MDdc9B89z1wkbeU182Ikg=;
        b=d9TOAR9ImLYdilYq5NmEh4HICwRBhjFm3KRQer5OBoCORh85oat0shlpbZoLKzCuAb
         WTcBiqhPAWwZH1KMQRV2oHUDTEF8YL6Qd8P8LzWFhP8OV61Q6za9mUtxqZjGfnSy+GOY
         eSCEqpUTBl2BYnVJHudtjAttDDD8RHtuKznobAVuQ6bImtQsgkoNNg9dyGI4aOp4BFn4
         obbMMmotERqYSBnurSePN9ZjznPeLqs7KFr0Zq3CF6MqEflxQ2Am2/pydD4tz4YScMNQ
         ODwuCUPeuGsdmt2lOvX13HcrTfc21v1HRk0tvlYEHswew2p7b3dez1Dkl/VFVEEvQNdE
         Kg+Q==
X-Gm-Message-State: AOAM5305eeK+SJXDsWSqVnHdIKYMgKlbfiOWKWM9U1/paCe3ZHbyVbEu
        lE57zzEzd1Pl8jvNUJGfXVjKDQ==
X-Google-Smtp-Source: ABdhPJyGAZ75fYt5dPrlwAFKkMmfgKxwkXWHpeKEeQM39FmqX5zKruHfjOM0yMa3O+bAFrGIsmDFBg==
X-Received: by 2002:a05:6830:214c:: with SMTP id r12mr8343587otd.200.1634309266857;
        Fri, 15 Oct 2021 07:47:46 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id bf3sm1193006oib.34.2021.10.15.07.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 07:47:46 -0700 (PDT)
Date:   Fri, 15 Oct 2021 09:47:44 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Deepak Kumar Singh <deesin@codeaurora.org>
Cc:     clew@codeaurora.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konstantin Dorfman <kdorfman@codeaurora.org>
Subject: Re: [PATCH V1 1/6] rpmsg: glink: fix destroy channel endpoint logic
Message-ID: <YWmUkD0ABryJEsU8@builder.lan>
References: <1596086296-28529-1-git-send-email-deesin@codeaurora.org>
 <1596086296-28529-2-git-send-email-deesin@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596086296-28529-2-git-send-email-deesin@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 30 Jul 00:18 CDT 2020, Deepak Kumar Singh wrote:

> From: Konstantin Dorfman <kdorfman@codeaurora.org>
> 
> When rpmsg client driver destroys last channel endpoint, remove rpmsg
> device is triggered. In both cases (destroy endpoint and remove device)
> a glink close command sent to the remote peer.
> 
> This change, when for removing rpmsg device endpoint already destroyed
> will avoid sending second glink close command.
> 

Should it really be considered valid to rpmsg_destroy_ept() the
rpmsg_device's primary endpoint?

Do you have a use case where this makes sense?


Also, I think this has a potential to hide a problems of clients doing a
"double free" on the ept.

Regards,
Bjorn

> Signed-off-by: Konstantin Dorfman <kdorfman@codeaurora.org>
> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> ---
>  drivers/rpmsg/qcom_glink_native.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 1995f5b..2668c66 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1210,6 +1210,10 @@ static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&channel->recv_lock, flags);
> +	if (!channel->ept.cb) {
> +		spin_unlock_irqrestore(&channel->recv_lock, flags);
> +		return;
> +	}
>  	channel->ept.cb = NULL;
>  	spin_unlock_irqrestore(&channel->recv_lock, flags);
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
