Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67DD01A071E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2020 08:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbgDGGPc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 02:15:32 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36230 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727125AbgDGGPa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 02:15:30 -0400
Received: by mail-pl1-f195.google.com with SMTP id g2so846243plo.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2020 23:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=fEIqeEmnHR4VL1Tnz06wxL1tDtYZh8O0YFMdittrvdc=;
        b=y1pqSFEkmWsND2TA4O92usByCfgNi9LYD8b5RYzM2l4cL2WXaBRJQV/2+uhmDB8Aq6
         yuEq/8npHPWpl5vGpknMxFP862x9r6JTehMqgpLw5iRpwi65aiU58j4a9pDG/WvhYPb7
         bvcPFkeav++vUe9tGu9OJ0bHDyPwUYcxoZPi5rHq1V9nHvwVSl3SBaZe9w4oOj0qw9Jo
         tZbK/kjQowFso4aSfNCfqNLRgmsAemcEiWrLNgCnNZCW6KCpj2M3Z6OEALkwO/9xEBLH
         z/DMxC4Jej3xO6BMLJ7LzhKkdU2kR5z0UKbdX4PVFGkMWLdv61JFAiduFGrMwkNXEu7U
         bazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=fEIqeEmnHR4VL1Tnz06wxL1tDtYZh8O0YFMdittrvdc=;
        b=cEl/Jsmg/bB50yJ/veRm0mWEVrBmIpra0v9cqFhaz4zc7JInliQJvmzVqWt24U1CwO
         3uXFjxSdWY53ftKvSvJnLZyG/yck9DzbT5Itv1gJ8szvDu5oxEnaFBgCp04XeS3E0w76
         O2c8KcbLpOBZwyLHAU9S0Pf6L8gGKAPIer3S3ELBtIAea/8E3QldKpqxOcZefIzpxMNO
         Cz8rtoGuHf5sRPXHWinlCjYq2Jm0uyosBXXfaa7daYxcKES8qNK4946twFnqxPHFG5pA
         Vm5+2YqP5nN4EjWAkZunAV5iXPavWw6dv8t7vpaQQpTRqbz1yQ6WOaUnwwlRjqVQ58Sm
         wkVQ==
X-Gm-Message-State: AGi0Puau7Zr1kCn/0WzaZ1mbaoKoi4F+K1jabOOxZQiv9PGbyjjdRCIa
        PNgeLVrtK9ONclRqy1pRqFuq/A==
X-Google-Smtp-Source: APiQypIku5Lm6YYYlW1dpEix4cJ2o/v/7l1PWYoX6qIkRNJjo8wpaP+/Kt4RgOl+bpzsQHMzs6HUVA==
X-Received: by 2002:a17:902:7c93:: with SMTP id y19mr961074pll.155.1586240128918;
        Mon, 06 Apr 2020 23:15:28 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id na18sm688432pjb.31.2020.04.06.23.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 23:15:28 -0700 (PDT)
Date:   Mon, 6 Apr 2020 23:15:33 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Tang Bin <tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] soc: qcom: smp2p: Delete an error message in
 qcom_smp2p_probe()
Message-ID: <20200407061533.GA576963@builder.lan>
References: <eb92fcfb-6181-1f9d-2601-61e5231bd892@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb92fcfb-6181-1f9d-2601-61e5231bd892@web.de>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 05 Apr 09:12 PDT 2020, Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 5 Apr 2020 18:08:13 +0200
> 
> The function “platform_get_irq” can log an error already.
> Thus omit a redundant message for the exception handling in the
> calling function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Thanks Markus, picked up for 5.8.

Regards,
Bjorn

> ---
>  drivers/soc/qcom/smp2p.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> index c7300d54e444..07183d731d74 100644
> --- a/drivers/soc/qcom/smp2p.c
> +++ b/drivers/soc/qcom/smp2p.c
> @@ -474,10 +474,8 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
>  		goto report_read_failure;
> 
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(&pdev->dev, "unable to acquire smp2p interrupt\n");
> +	if (irq < 0)
>  		return irq;
> -	}
> 
>  	smp2p->mbox_client.dev = &pdev->dev;
>  	smp2p->mbox_client.knows_txdone = true;
> --
> 2.26.0
> 
