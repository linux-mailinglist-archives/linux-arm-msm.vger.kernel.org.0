Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE2093FAC0C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 15:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231620AbhH2Nt7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Aug 2021 09:49:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbhH2Nt6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Aug 2021 09:49:58 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12ED4C061575
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Aug 2021 06:49:07 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id y23so10764779pgi.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Aug 2021 06:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pU39ntma6piHWGZ2URADFIQ83rV3TBoNVUvbHvvIBME=;
        b=l21UcXp4dvhjZg8Mg+goDcJFV+l5MwunZMb+2rOAT56HsDQNjK25Rt5MOr52bjmi/L
         h/V6du2vQUU7Jd6GcBZaIG8eMgTap6pjYBD3uBswDRSL68RJgbWRd+YSNYhG34WfSG7P
         kGk6t7ol4Y/vbAfr0mw7gYEe4XFFc5Vt1atngqpTbeQRRhmxx6+J8dLsLk7wxp1oT5dO
         zc/hFh+eHztNlij7q20/bMwV7Y49HgOss/oDuld4f6Pm7kbEOhrsXLMNopSpD7Sf44mv
         lIofPi/iuSDgwIfyNP9ssXM0CSVAxxNJgLUkHjK4px0hiGcEGWzQmlSAwqwdk8w+g81H
         C0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pU39ntma6piHWGZ2URADFIQ83rV3TBoNVUvbHvvIBME=;
        b=adHB9D4toFsLE8ypuEOOMzq6GMnDRMAaZ63UsdjNka3sw/Mtyg1Cqi0O7s7Cr+s2cO
         l7NKUTQ3KzyQ4YRQEpyJ3bodvFrXv7BbWZAugf3n29TBIiVnxTaACq0F7UsAq9LYjmrx
         zhiEmKwZVkDfXQyr82FQUoSolvqj2S/OVuV0/svEQRz5hVNp3pJEv/EFpqbss+A556Dy
         2UM4SVqJVW6pu9nc70AExmMYB1d3Qn41hFiDHetkjnDQl8HMovuL18uZni1kJJHqZECF
         uHzRWdzMAh1CkxtEpankZBgejWQyhM3HzqMGiAfwGCWzBEyY0EblU+uePVOzJHQOLVfj
         2fEA==
X-Gm-Message-State: AOAM5302ZSTKB3MM1Ar+ktQWZIKyMVn6JSAVTTNiV4QKR2mWrPElTOEY
        nM3R1adyV5E8WdNwhp42IUG6
X-Google-Smtp-Source: ABdhPJwvHWQQtjwEPKuFfX+qUNq3Lg4CsOnLh85SZXkCldfSqdtyp28OPzlGWtVbQDoDgl88/q8tLQ==
X-Received: by 2002:a63:350:: with SMTP id 77mr17050462pgd.441.1630244946550;
        Sun, 29 Aug 2021 06:49:06 -0700 (PDT)
Received: from thinkpad ([120.138.13.162])
        by smtp.gmail.com with ESMTPSA id s192sm12427523pgc.23.2021.08.29.06.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 06:49:05 -0700 (PDT)
Date:   Sun, 29 Aug 2021 19:19:01 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH] net: qrtr: mhi: make it work again
Message-ID: <20210829134901.GA8243@thinkpad>
References: <20210829124528.507457-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210829124528.507457-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

On Sun, Aug 29, 2021 at 03:45:28PM +0300, Dmitry Baryshkov wrote:
> The commit ce78ffa3ef16 ("net: really fix the build...") introduced two
> issues into the mhi.c driver:
>  - use of initialized completion
>  - calling mhi_prepare_for_transfer twice
> 

ce78ffa3ef16 got reverted in net-next:
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/net/qrtr?id=9ebc2758d0bbed951511d1709be0717178ec2660

And you also need the below commit:
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git/commit/?h=char-misc-next&id=0dc3ad3f859d3a65b335c861ec342d31d91e8bc8

Both commits are in linux-next so the issue should be fixed there and also in
the mainline soon.

Thanks,
Mani

> While the first one is pretty obvious, the second one makes all devices
> using mhi.c to return -EINVAL during probe. Fist
> mhi_prepare_for_transfer() would change both channels state to ENABLED.
> Then when second mhi_prepare_for_transfer() would be called it would
> also try switching them to ENABLED again, which is forbidden by the
> state machine in the mhi_update_channel_state() function (see
> drivers/bus/mhi/core/main.c).
> These two issues make all drivers using qcom_mhi_qrtr (e.g. ath11k) to
> fail with -EINVAL.
> 
> Fix them by removing first mhi_prepare_for_transfer() call and by adding
> the init_completion() call.
> 
> Fixes: ce78ffa3ef16 ("net: really fix the build...")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  net/qrtr/mhi.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> index 1dc955ca57d3..f3f4a5fdeaf3 100644
> --- a/net/qrtr/mhi.c
> +++ b/net/qrtr/mhi.c
> @@ -83,15 +83,12 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
>  	struct qrtr_mhi_dev *qdev;
>  	int rc;
>  
> -	/* start channels */
> -	rc = mhi_prepare_for_transfer(mhi_dev, 0);
> -	if (rc)
> -		return rc;
> -
>  	qdev = devm_kzalloc(&mhi_dev->dev, sizeof(*qdev), GFP_KERNEL);
>  	if (!qdev)
>  		return -ENOMEM;
>  
> +	init_completion(&qdev->ready);
> +
>  	qdev->mhi_dev = mhi_dev;
>  	qdev->dev = &mhi_dev->dev;
>  	qdev->ep.xmit = qcom_mhi_qrtr_send;
> -- 
> 2.33.0
> 
