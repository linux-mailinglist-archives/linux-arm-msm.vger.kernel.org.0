Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35A7241E050
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 19:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352732AbhI3Rq4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 13:46:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352204AbhI3Rq4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 13:46:56 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54334C06176A
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 10:45:13 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id x33-20020a9d37a4000000b0054733a85462so8307683otb.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 10:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Cs2W9h3hBYop/3GQc4C0X6nOEtpDQMXydDsNQKIcRJQ=;
        b=UsUQa4Hhqjgma6kUCNAXEDc64/7d8jxg2XgwvFXSsc7pBkVArZEkFMTWXA7cF1XhUl
         OwRjAX0nYNyAWwf9olRco1EamvNYCATRjgvDXw2CanbwEhOFXuKnNzqRa7AUeiHlsSNQ
         3i4np2mdpa9aycImQ2mdlblxS2bAYpLqwHc6xPF1DcxBw4fgrUFm1LEjW6wm3jaQaTyx
         Zfr2K9s5yPco3RBvcd3OBsQKn50jmZa+mjXRZkM9jr7q1pX+p7rYL7GUve56ow8YhVaA
         yP7+cONNhY2FBsvWNyrf9UftT+KQsz2HtbRJh7k026W2oa5+IHDQcJheEOnlx3IDgzkV
         CUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Cs2W9h3hBYop/3GQc4C0X6nOEtpDQMXydDsNQKIcRJQ=;
        b=TYsJOJfTnEDD5NaqkaKZMctuZ5GENQ/3hWir0bgs4bQZul01yI/aP077ZINhXSqrfa
         ZRvVB2AEmWMes0/CmhBF6BteKflByWpErOPNeHDA/GidLhcj6z4wGm7M1fNfZsZmY9j/
         bEC81ZyQZCoyIwyDn0wm4CBt/VwIMViEjH/3mWH3p6LdCG2mA1NIeKxF09rQkIBcBoQg
         QEK8mR3AGlDBzbcw01Jod5c+wuFbl1XNvK8zc5YkAQypShuVW83VbF6/gyDCCrFppKLm
         6aELAYc7+eMgnnNWp5pc6t6++V0iV6g/lPmN/D3z6TPnCBoPJeZVM7DNHXLpwBM/1x4G
         VNrA==
X-Gm-Message-State: AOAM532GrPM4KHXMAX8nHefBXMqxUpQJpyd6zx5tPHuVSN8xVUW350rS
        soAFF7w8tRgdY+QLtAhONembpg==
X-Google-Smtp-Source: ABdhPJxMQROO539+5lzzQX5B0MF56oBcDKkY9BwGUuNQdDfX7q/6UHV6if7sDIGDZB1wZKBRyBazCw==
X-Received: by 2002:a9d:6a50:: with SMTP id h16mr6458448otn.314.1633023912686;
        Thu, 30 Sep 2021 10:45:12 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m26sm719325otk.49.2021.09.30.10.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 10:45:12 -0700 (PDT)
Date:   Thu, 30 Sep 2021 10:47:00 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Georgi Djakov <djakov@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] interconnect: qcom: Fix endianness in an intermediate
 storage
Message-ID: <YVX4FMMwLA/jdDPw@ripper>
References: <20210930122254.8899-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930122254.8899-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 30 Sep 05:22 PDT 2021, Vladimir Zapolskiy wrote:

> A minor issue is reported by sparse:
> 
> bcm-voter.c:72:77: warning: restricted __le16 degrades to integer
> bcm-voter.c:76:78: warning: restricted __le16 degrades to integer
> bcm-voter.c:82:66: warning: incorrect type in argument 2 (different base types)
> bcm-voter.c:82:66:    expected unsigned int [usertype] base
> bcm-voter.c:82:66:    got restricted __le32 [usertype] unit
> bcm-voter.c:85:66: warning: incorrect type in argument 2 (different base types)
> bcm-voter.c:85:66:    expected unsigned int [usertype] base
> bcm-voter.c:85:66:    got restricted __le32 [usertype] unit
> 
> icc-rpmh.c:165:28: warning: incorrect type in assignment (different base types)
> icc-rpmh.c:165:28:    expected restricted __le32 [usertype] unit
> icc-rpmh.c:165:28:    got unsigned int [usertype]
> icc-rpmh.c:166:29: warning: incorrect type in assignment (different base types)
> icc-rpmh.c:166:29:    expected restricted __le16 [usertype] width
> icc-rpmh.c:166:29:    got unsigned short [usertype]
> 
> The change is intended to be non-functional, only the stored data of
> 'struct bcm_db' is changed and build time warnings from above are gone.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/interconnect/qcom/bcm-voter.c | 8 ++++----
>  drivers/interconnect/qcom/icc-rpmh.c  | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/interconnect/qcom/bcm-voter.c b/drivers/interconnect/qcom/bcm-voter.c
> index 8f385f9c2dd3..976938a84bd1 100644
> --- a/drivers/interconnect/qcom/bcm-voter.c
> +++ b/drivers/interconnect/qcom/bcm-voter.c
> @@ -69,20 +69,20 @@ static void bcm_aggregate(struct qcom_icc_bcm *bcm)
>  	for (bucket = 0; bucket < QCOM_ICC_NUM_BUCKETS; bucket++) {
>  		for (i = 0; i < bcm->num_nodes; i++) {
>  			node = bcm->nodes[i];
> -			temp = bcm_div(node->sum_avg[bucket] * bcm->aux_data.width,
> +			temp = bcm_div(node->sum_avg[bucket] * le16_to_cpu(bcm->aux_data.width),
>  				       node->buswidth * node->channels);
>  			agg_avg[bucket] = max(agg_avg[bucket], temp);
>  
> -			temp = bcm_div(node->max_peak[bucket] * bcm->aux_data.width,
> +			temp = bcm_div(node->max_peak[bucket] * le16_to_cpu(bcm->aux_data.width),
>  				       node->buswidth);
>  			agg_peak[bucket] = max(agg_peak[bucket], temp);
>  		}
>  
>  		temp = agg_avg[bucket] * bcm->vote_scale;
> -		bcm->vote_x[bucket] = bcm_div(temp, bcm->aux_data.unit);
> +		bcm->vote_x[bucket] = bcm_div(temp, le32_to_cpu(bcm->aux_data.unit));
>  
>  		temp = agg_peak[bucket] * bcm->vote_scale;
> -		bcm->vote_y[bucket] = bcm_div(temp, bcm->aux_data.unit);
> +		bcm->vote_y[bucket] = bcm_div(temp, le32_to_cpu(bcm->aux_data.unit));
>  	}
>  
>  	if (bcm->keepalive && bcm->vote_x[QCOM_ICC_BUCKET_AMC] == 0 &&
> diff --git a/drivers/interconnect/qcom/icc-rpmh.c b/drivers/interconnect/qcom/icc-rpmh.c
> index 3eb7936d2cf6..e8533027ce38 100644
> --- a/drivers/interconnect/qcom/icc-rpmh.c
> +++ b/drivers/interconnect/qcom/icc-rpmh.c
> @@ -162,8 +162,8 @@ int qcom_icc_bcm_init(struct qcom_icc_bcm *bcm, struct device *dev)
>  		return -EINVAL;
>  	}
>  
> -	bcm->aux_data.unit = le32_to_cpu(data->unit);
> -	bcm->aux_data.width = le16_to_cpu(data->width);
> +	bcm->aux_data.unit = data->unit;
> +	bcm->aux_data.width = data->width;
>  	bcm->aux_data.vcd = data->vcd;
>  	bcm->aux_data.reserved = data->reserved;
>  	INIT_LIST_HEAD(&bcm->list);
> -- 
> 2.33.0
> 
