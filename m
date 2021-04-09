Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B95C43596F4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 09:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232452AbhDIH43 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 03:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232395AbhDIH42 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 03:56:28 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C2B7C061760
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Apr 2021 00:56:12 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id m11so3700376pfc.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Apr 2021 00:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/psdJdZhtQxPRqP2rSeIFW0LQiIDDkbIGdh0cvYadBU=;
        b=L8z3g7hZW84h5nM/ti6IxvrqYNRpURr0QjluQ7kN299h4kGodN+i2ZqlpfZjmV2DcV
         NJdHifRZQwCvGkuyszr116EZoWi70uHJWd65wtEWaWArXY1Rp4ZzN/9ZnXegyO3vKwFY
         8NO2xJo3GGqSN9wCk+iD4DUDoM9a/YwA66QN74YGY2H1cW7vZrL5l7MdjKeR/QAsuZU2
         Ucz/7XTFcdQzbM6d/fkAnUHCM65vVA1TvrS1EIy6gM9onyU/qKkNAl3l+WgxxEO0aPig
         bhcP59/Ksf4qh7I609Y+3kN93l9mNb9wKPVKERjl2R9u6Ll9R8qVQKHkghUDQWZCnxm2
         BPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/psdJdZhtQxPRqP2rSeIFW0LQiIDDkbIGdh0cvYadBU=;
        b=efpeGK3BhxKGjAm4m4vnRLVqpZtWBM0oOMHWO5LnORWB2KyHukR986jYpob3UuCP5u
         TmBjW9U+gH8KvGdfLwi92VXWROVAm3YeW7PjFSgt07NFE9Xasamekoi0MLMUl6O0btv1
         peqnB5wIJHre08YEVgas9nYKu9ImbpO85n+5/o2POppcsfzIE9B11Ji7sxQMfOY8uPeT
         xyKfd/v78zZ3wm3ac6uwQaaAXzkoPYOLi1b3x95qnoPMh3rOi8rqdJU+iV+fMSt2slRC
         ObE6noltn5qJHd2YmZ7vosYhauOec0SmuGwiuknsHXcI6oGAPoaVTEoE1L1iDjHAPV0J
         k/HQ==
X-Gm-Message-State: AOAM530iWWsl1zImDG1Wtzbyw1ABA3hVvOpHjHnXQpkEhxoTjDFP5nyE
        xJ81P+lBttTtlncWCARq47rE
X-Google-Smtp-Source: ABdhPJw4y19qgIEed/3idRuicEXOdgw7PNQxmYE3f4snxddrL+3JBiwUbHv6mAxOeiF2tFwRzk92Iw==
X-Received: by 2002:a63:5458:: with SMTP id e24mr11921129pgm.170.1617954971782;
        Fri, 09 Apr 2021 00:56:11 -0700 (PDT)
Received: from work ([103.77.37.131])
        by smtp.gmail.com with ESMTPSA id k17sm1475219pfa.68.2021.04.09.00.56.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Apr 2021 00:56:11 -0700 (PDT)
Date:   Fri, 9 Apr 2021 13:26:07 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Ye Bin <yebin10@huawei.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] scsi: ufs-qcom: Remove redundant dev_err call in
 ufs_qcom_init()
Message-ID: <20210409075607.GF4376@work>
References: <20210409075522.2111083-1-yebin10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409075522.2111083-1-yebin10@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 09, 2021 at 03:55:22PM +0800, Ye Bin wrote:
> There is a error message within devm_ioremap_resource
> 
> already, so remove the dev_err call to avoid redundant
> 
> error message.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Ye Bin <yebin10@huawei.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/scsi/ufs/ufs-qcom.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index 9b711d6aac54..2a3dd21da6a6 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -1071,13 +1071,8 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>  		if (res) {
>  			host->dev_ref_clk_ctrl_mmio =
>  					devm_ioremap_resource(dev, res);
> -			if (IS_ERR(host->dev_ref_clk_ctrl_mmio)) {
> -				dev_warn(dev,
> -					"%s: could not map dev_ref_clk_ctrl_mmio, err %ld\n",
> -					__func__,
> -					PTR_ERR(host->dev_ref_clk_ctrl_mmio));
> +			if (IS_ERR(host->dev_ref_clk_ctrl_mmio))
>  				host->dev_ref_clk_ctrl_mmio = NULL;
> -			}
>  			host->dev_ref_clk_en_mask = BIT(5);
>  		}
>  	}
> 
