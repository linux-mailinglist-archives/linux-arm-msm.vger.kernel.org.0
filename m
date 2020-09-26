Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7AFF2797AC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 09:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729021AbgIZH5D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 03:57:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728736AbgIZH5D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 03:57:03 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 968EAC0613D3
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2020 00:57:03 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id d19so534203pld.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2020 00:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rtFXkRfgZbEQcfpdeuiy3DzD4aySSj2Q6F3pQx5z5GU=;
        b=uufmRRKwAdo9BkQf+3mIFDizTkh9NuB4GlBMpOdCuWczQrzyQAD/FK5atBw6s54bcV
         BZsoU6GjagogIZ89z3YvlZhq1EPAY9dAe8499fYZIuwUihFOjpE/Yi1QbaAQK+7J7vrJ
         Y9N91NvDhnuyaqqzYN3NEmO+Yz8cSfWuB1yEybXoCpbkOr+bC461wrDNuZKZcWjIEiwU
         5zKgOk7IyxFVET7+z5wljLaFUK7L2oDVoGFJ+J1Gu/406GSH7fFC2OotjNdu5sc94708
         MLNm4qvxLhLKzgAkAWN6WgVwoNlZY5ctOGDJHCyrq2wurYk6gjSIp30+JEAHNVwfq0kW
         ffZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rtFXkRfgZbEQcfpdeuiy3DzD4aySSj2Q6F3pQx5z5GU=;
        b=GIBJj1UyzsfgaWsZ3oHWZ5Of0fdK/s8NWPjgxwP/sbjrzp7pZtkeFQIP5V1y6TYacB
         7msGSEp7az6eQ1Hj1tjTVBOkH+0oOZDqXKTDpiq6o6vKtyirlUUaM3qDTRfQiSxDqhZX
         LtMT9cqgT2wyXIj3Dk3Se5H6w0Gh5kmiHLsqlPDwL5t9qalrctXDp8gnrT03S2bCduSO
         I8t2Xtk3z32dwWoG8DkZIOHioWz016UNUctKtss4YbMgz2WPdQv1DW7e/n1L/9x3FSk8
         et/183U7Q93fKURZVP6Gh1LmzSm43fNAjBnpBvxMyk6pBXBEtY4qOHbo5FdP72Qwvkr+
         Z1Nw==
X-Gm-Message-State: AOAM532xC7LOMrJXfTQOxk7wFJe1rWSv48hXWGo+IduFYRaU+U8MNLEu
        X0lg6I6Xtsdg1vHir83tK4uV
X-Google-Smtp-Source: ABdhPJwX1Kf654Q2Pko7pZA4nEWKlT1e+Qf7WrdGtwjQBnD4W5BWZUSG4DwBX7ToZ1FfULBt/D0ZUA==
X-Received: by 2002:a17:90a:ca09:: with SMTP id x9mr1170437pjt.89.1601107023117;
        Sat, 26 Sep 2020 00:57:03 -0700 (PDT)
Received: from linux ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id q18sm4873241pfg.158.2020.09.26.00.57.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 26 Sep 2020 00:57:02 -0700 (PDT)
Date:   Sat, 26 Sep 2020 13:26:56 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, davem@davemloft.net,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH v2 2/2] net: qrtr: Start MHI channels during init
Message-ID: <20200926075656.GE9302@linux>
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

On Mon, Sep 21, 2020 at 09:43:04AM +0200, Loic Poulain wrote:
> Start MHI device channels so that transfers can be performed.
> The MHI stack does not auto-start channels anymore.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Dave: I'd like to queue this patch through MHI tree because there is a dependent
change in MHI bus. So, can you please provide your Ack?

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
