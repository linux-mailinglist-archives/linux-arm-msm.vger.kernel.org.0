Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAB952B3C62
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 06:23:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgKPFWr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 00:22:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgKPFWr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 00:22:47 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 921C2C0613CF
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2020 21:22:47 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id j19so5409901pgg.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2020 21:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=65ZtLjNKljp57MVjDWI2IxTiUEH0znsjtdz/FyGC6oc=;
        b=pnTdVo7q4A3z5sEoS61WsW6iftjxoY9gSqrAa9PP/BzkLa/P8RhnG23q9nEbgEIGxq
         bo5bOgGVPfQqcVLN0pp88IonqB5iDUrMDBuhuA5NBPlSR07cUH7gL1cBEordPStNGWuu
         AEVkUBX3THBSLGcubwyLlkELknCCKU9D9ZFINd1wRALtGiLqLtGHnEFzxK5dC9OlnsIH
         y2mkeKpXK6ayVV19hGZwBPMGRNrGm5t68BtUVo61VDWLcLwR0EKAWXOdHsiLMHXEJ2bp
         R5LS2R3/+Khey5Q6PWVjE3pFiFsB7oG+4iP9ORjFgKBN60xBjTWp5VrkyFr/6zgnSTpi
         +pEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=65ZtLjNKljp57MVjDWI2IxTiUEH0znsjtdz/FyGC6oc=;
        b=Ady0E4vk9r4JR3zUG1B/OIBdrYwldh180YNaXXtzsZZgmg/7Fofu6IgBsX91rDgJ+h
         RiUS7CbTDZ5TolJhixCbGN55fk3wmsqEOZ+ix6hZqUQxRr0gylBgdc1iqLJGf14nYc2V
         0VY336eTaZGe5sZt8uOUgpWbgNhGWpbIcgLdROf/60/BVaPGPBq/XYLNeqMaS7ojZQh2
         GiYGYPLVQotbgH9Ot5E8kH8MV0Zj2ZtupoUJAgJUV4hBtBWCWVpMCTE3XjR6SnA1I8Iq
         dbaj5037WR7gEKzTN+J4VIMVmBCraMVLgitDfRJ3RMjwGS0W/qi31Pk/DDyMTq/I4jlX
         e6FA==
X-Gm-Message-State: AOAM53099/bBVdHr1e1RUUa2GvGZ6QVAjqHWR/VWfK06I0Re/rNj3M27
        AEhuX/Ukb/Rz3nlATSa8iabS
X-Google-Smtp-Source: ABdhPJxCXZl9Uynj+No9eVYR7wDDcpYNqL/0LatY3Ai2GloL+9JXn5CNmt6rogDfZOD+WMcjm4mVIQ==
X-Received: by 2002:a65:4302:: with SMTP id j2mr11521023pgq.177.1605504167070;
        Sun, 15 Nov 2020 21:22:47 -0800 (PST)
Received: from Mani-XPS-13-9360 ([2409:4072:618e:9b0a:75fd:1290:bf5c:a350])
        by smtp.gmail.com with ESMTPSA id j19sm18404171pfd.189.2020.11.15.21.22.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Nov 2020 21:22:46 -0800 (PST)
Date:   Mon, 16 Nov 2020 10:52:38 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, davem@davemloft.net,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v2 2/2] net: qrtr: Start MHI channels during init
Message-ID: <20201116052238.GB3926@Mani-XPS-13-9360>
References: <1600674184-3537-1-git-send-email-loic.poulain@linaro.org>
 <1600674184-3537-2-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600674184-3537-2-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ath11k list

On Mon, Sep 21, 2020 at 09:43:04AM +0200, Loic Poulain wrote:
> Start MHI device channels so that transfers can be performed.
> The MHI stack does not auto-start channels anymore.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Applied to mhi-ath11k-immutable branch! This branch will get merged into
mhi-next and ath-next.

Thanks,
Mani

> ---
>  v2: split MHI and qrtr changes in dedicated commits
> 
>  net/qrtr/mhi.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> index ff0c414..7100f0b 100644
> --- a/net/qrtr/mhi.c
> +++ b/net/qrtr/mhi.c
> @@ -76,6 +76,11 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
>  	struct qrtr_mhi_dev *qdev;
>  	int rc;
>  
> +	/* start channels */
> +	rc = mhi_prepare_for_transfer(mhi_dev);
> +	if (rc)
> +		return rc;
> +
>  	qdev = devm_kzalloc(&mhi_dev->dev, sizeof(*qdev), GFP_KERNEL);
>  	if (!qdev)
>  		return -ENOMEM;
> -- 
> 2.7.4
> 
