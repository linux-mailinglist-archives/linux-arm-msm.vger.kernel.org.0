Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57D93640126
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 08:40:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232406AbiLBHkg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 02:40:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbiLBHke (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 02:40:34 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C7DAB0B61
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Dec 2022 23:40:34 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id w129so4180429pfb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Dec 2022 23:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nDu6wdj2BavaJhgV2+IGABHC/KEWWb+4yyQcwbwd+rA=;
        b=vGIxaz68/q/F+Cc79hSj1Yrfct0QR+YaiyK5BQ4C6hiZyHx/8iu6y8E1PtRzXKEnzd
         s9nXKon0twvku4AZQbm055w40EBHnDL6JPYOlxUbIjUIXCKtG+4oo18baBM7adk7YXDd
         bAjOjJkst88dSaFg7cIdCItKVRFr1McJ6Q7rPs/U6W7ROvkGJ7oQyoGeQlWnH0dEDMn5
         2/OzC6HJQ47VwY9YtMb46EGL7qkqD8qEEMtUroNW33oXC1dZotRDcZJ+sQi0+ERv9Noz
         OL/BwIz8fRqvvb11QAIxCyGvhfs53+UOdgk0e3LxwwIEytbmELTBaAgUACZH2kBEQqbd
         HOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nDu6wdj2BavaJhgV2+IGABHC/KEWWb+4yyQcwbwd+rA=;
        b=XoIipsR7R9Q+iO1X62KvPkwJ0p+8ZPgFh3ljqGUnXPeqZKClWJxygvkjVBWbe8ntEL
         QhykdE9IIKQJIiP1RRoU9A+yBiVAKqlkPtxBOLJxur2D+Op2mfipclaPew4OVEHO6fZh
         T4Thq/JaNx5GMoVJ03q+bRIXwPTydVDZ1PNqAh5w9QWuc4bHsK7IbQy4HUQpaweoeVg5
         kIYooVBZeRUdXfUW+JOCruEzEWAZZ5oR9D+YzxzEZmCzUXjJDfrHVFRSsCwc8jUWeGl8
         z1WeM8IABjTANIv6le7tdcL5Jb9ybFeWLDaJBgddfNMfsGnSJrPpA1uZ9fQvZgO3DdCW
         tXiQ==
X-Gm-Message-State: ANoB5pma0QSRk8CzkUioCaTC0eWqRVEwMWeHv1F6iBc2jnWi8V1O0TOA
        9cWMSVfsV9mCUcex3JwXoYqE
X-Google-Smtp-Source: AA0mqf5Ag5+BnQmSsuOlhiMDTVxXCd5381jopnyR1FNdrsNyFJE6Wo2Z9eXE7MXXIb3+AkYNm36GHw==
X-Received: by 2002:a63:ec07:0:b0:470:90f1:6216 with SMTP id j7-20020a63ec07000000b0047090f16216mr62174034pgh.42.1669966833731;
        Thu, 01 Dec 2022 23:40:33 -0800 (PST)
Received: from thinkpad ([27.111.75.154])
        by smtp.gmail.com with ESMTPSA id z15-20020a655a4f000000b0046faefad8a1sm3630828pgs.79.2022.12.01.23.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 23:40:32 -0800 (PST)
Date:   Fri, 2 Dec 2022 13:10:25 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Andrew Halaney <ahalaney@redhat.com>
Cc:     andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org,
        jejb@linux.ibm.com, martin.petersen@oracle.com,
        p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] scsi: ufs: ufs-qcom: Use dev_err() where possible
Message-ID: <20221202074025.GE5356@thinkpad>
References: <20221201230810.1019834-1-ahalaney@redhat.com>
 <20221201230810.1019834-5-ahalaney@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221201230810.1019834-5-ahalaney@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 01, 2022 at 05:08:10PM -0600, Andrew Halaney wrote:
> dev_err() statements are better to use than pr_err(), so switch to
> those.
> 
> In a similar vein, the check on the dev_req_params pointer here is
> not needed, the two places this function is called never pass in a
> NULL pointer, so instead of using dev_err() there just remove it.
> 
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/ufs/host/ufs-qcom.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index b1fcff1fad0c..4350c44a6fc7 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -680,12 +680,6 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
>  	struct ufs_dev_params ufs_qcom_cap;
>  	int ret = 0;
>  
> -	if (!dev_req_params) {
> -		pr_err("%s: incoming dev_req_params is NULL\n", __func__);
> -		ret = -EINVAL;
> -		goto out;
> -	}
> -
>  	switch (status) {
>  	case PRE_CHANGE:
>  		ufshcd_init_pwr_dev_param(&ufs_qcom_cap);
> @@ -709,7 +703,7 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
>  					       dev_max_params,
>  					       dev_req_params);
>  		if (ret) {
> -			pr_err("%s: failed to determine capabilities\n",
> +			dev_err(hba->dev, "%s: failed to determine capabilities\n",
>  					__func__);
>  			goto out;
>  		}
> -- 
> 2.38.1
> 

-- 
மணிவண்ணன் சதாசிவம்
