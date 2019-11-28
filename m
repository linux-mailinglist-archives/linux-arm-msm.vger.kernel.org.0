Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7896710CE21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2019 18:54:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbfK1Ryw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Nov 2019 12:54:52 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35449 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbfK1Ryw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Nov 2019 12:54:52 -0500
Received: by mail-pf1-f196.google.com with SMTP id q13so13450042pff.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2019 09:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1sBGIUbzoeKJkrzm3m7VWuMuV29EAqIZE/5yemUqtvo=;
        b=B4+afiQYU1sigPtm6HWzCGuBooz/0YNgmERpBu5QzklsEfw/R8KQ6+/8l4jLfXW/Oe
         OLK/rNwW8ne9UFhzuxbenjxNavoo6s5THMbL1Pm/KxyiuamH8rLMekiwEKAt6wGrvE4V
         T3ssk8Q1sBwzy2da3N9uaFf1RatawWPIRS1gsq+rG7cOROJ1rYWQJR0qODECLWNx9bER
         qQpEyj3RCCGELlXPQHkRsl8DXh7hr4KVYofQc+EmotsURbaQ2NMQzypOUbE1+cs0tNWW
         wVa+LxfEULOxOgKTsmRl7Jjf1IU/NDpbK0PBeT6278vByh7rUYrFFK8GJ4Hd7p6xcDeH
         u2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1sBGIUbzoeKJkrzm3m7VWuMuV29EAqIZE/5yemUqtvo=;
        b=exQgv/gabvzPZ2n2MeChOxskZCWo4MPVl3KKQw+1PghD1bkuTq1G300a80S3s+pWbN
         tWAI+1rXW2SPXivB2Hzb9+z5s9vA/p+yRNENnq5ASL22FJnrNn2pq0Q/msU8dyL4OfS3
         YRGR+Lfi4mwjY/1s4WveXx7KGv2sqPifvibkJae4NNVYjrQuVrs1QgQQTVqetBZ9QvjL
         jTn1wS6pRkMd4/GS/aXtjfkF86FmWIZERNJkz9WRli4Na7w6Yu0Iq1mp5fphnPKpk2z1
         01t56dzb/yl/4UjUxupsYySVHsZ+Vz8P5V2Pe5sBXX27XufPFaaMhJqbbhFMNgPreXa7
         gW4Q==
X-Gm-Message-State: APjAAAVREymaEsi+m9SVTngMHdOihQSXWSzrmNYOAW1nELaP8IM8F665
        m9LsrxMKWNCrZQPDfFjCNOeLg8cCHCc=
X-Google-Smtp-Source: APXvYqzQWoG06+sWKSohKNo8/+BMuX6fv46fcHj8Lbf0L/lZw4fDWg0YWirec2tVGz9ScmDiAnH2CQ==
X-Received: by 2002:a63:c802:: with SMTP id z2mr12274815pgg.158.1574963691668;
        Thu, 28 Nov 2019 09:54:51 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d85sm5267829pfd.146.2019.11.28.09.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 09:54:50 -0800 (PST)
Date:   Thu, 28 Nov 2019 09:54:46 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     linux-pm@vger.kernel.org, evgreen@chromium.org, agross@kernel.org,
        daidavid1@codeaurora.org, masneyb@onstation.org,
        sibis@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] interconnect: qcom: Use the standard aggregate
 function
Message-ID: <20191128175446.GE82109@yoga>
References: <20191128134839.27606-1-georgi.djakov@linaro.org>
 <20191128134839.27606-2-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191128134839.27606-2-georgi.djakov@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 28 Nov 05:48 PST 2019, Georgi Djakov wrote:

> Now we have a common function for standard aggregation, so let's use it,
> instead of duplicating the code.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/interconnect/qcom/msm8974.c | 15 +++------------
>  drivers/interconnect/qcom/qcs404.c  | 15 +++------------
>  2 files changed, 6 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/interconnect/qcom/msm8974.c b/drivers/interconnect/qcom/msm8974.c
> index 8823dce811c3..bf724c2ca02b 100644
> --- a/drivers/interconnect/qcom/msm8974.c
> +++ b/drivers/interconnect/qcom/msm8974.c
> @@ -550,15 +550,6 @@ static struct msm8974_icc_desc msm8974_snoc = {
>  	.num_nodes = ARRAY_SIZE(msm8974_snoc_nodes),
>  };
>  
> -static int msm8974_icc_aggregate(struct icc_node *node, u32 tag, u32 avg_bw,
> -				 u32 peak_bw, u32 *agg_avg, u32 *agg_peak)
> -{
> -	*agg_avg += avg_bw;
> -	*agg_peak = max(*agg_peak, peak_bw);
> -
> -	return 0;
> -}
> -
>  static void msm8974_icc_rpm_smd_send(struct device *dev, int rsc_type,
>  				     char *name, int id, u64 val)
>  {
> @@ -603,8 +594,8 @@ static int msm8974_icc_set(struct icc_node *src, struct icc_node *dst)
>  	qp = to_msm8974_icc_provider(provider);
>  
>  	list_for_each_entry(n, &provider->nodes, node_list)
> -		msm8974_icc_aggregate(n, 0, n->avg_bw, n->peak_bw,
> -				      &agg_avg, &agg_peak);
> +		provider->aggregate(n, 0, n->avg_bw, n->peak_bw,
> +				    &agg_avg, &agg_peak);
>  
>  	sum_bw = icc_units_to_bps(agg_avg);
>  	max_peak_bw = icc_units_to_bps(agg_peak);
> @@ -703,7 +694,7 @@ static int msm8974_icc_probe(struct platform_device *pdev)
>  	INIT_LIST_HEAD(&provider->nodes);
>  	provider->dev = dev;
>  	provider->set = msm8974_icc_set;
> -	provider->aggregate = msm8974_icc_aggregate;
> +	provider->aggregate = icc_std_aggregate;
>  	provider->xlate = of_icc_xlate_onecell;
>  	provider->data = data;
>  
> diff --git a/drivers/interconnect/qcom/qcs404.c b/drivers/interconnect/qcom/qcs404.c
> index a4c6ba715f61..ce2e6faa3a79 100644
> --- a/drivers/interconnect/qcom/qcs404.c
> +++ b/drivers/interconnect/qcom/qcs404.c
> @@ -327,15 +327,6 @@ static struct qcom_icc_desc qcs404_snoc = {
>  	.num_nodes = ARRAY_SIZE(qcs404_snoc_nodes),
>  };
>  
> -static int qcom_icc_aggregate(struct icc_node *node, u32 tag, u32 avg_bw,
> -			      u32 peak_bw, u32 *agg_avg, u32 *agg_peak)
> -{
> -	*agg_avg += avg_bw;
> -	*agg_peak = max(*agg_peak, peak_bw);
> -
> -	return 0;
> -}
> -
>  static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
>  {
>  	struct qcom_icc_provider *qp;
> @@ -354,8 +345,8 @@ static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
>  	qp = to_qcom_provider(provider);
>  
>  	list_for_each_entry(n, &provider->nodes, node_list)
> -		qcom_icc_aggregate(n, 0, n->avg_bw, n->peak_bw,
> -				   &agg_avg, &agg_peak);
> +		provider->aggregate(n, 0, n->avg_bw, n->peak_bw,
> +				    &agg_avg, &agg_peak);
>  
>  	sum_bw = icc_units_to_bps(agg_avg);
>  	max_peak_bw = icc_units_to_bps(agg_peak);
> @@ -465,7 +456,7 @@ static int qnoc_probe(struct platform_device *pdev)
>  	INIT_LIST_HEAD(&provider->nodes);
>  	provider->dev = dev;
>  	provider->set = qcom_icc_set;
> -	provider->aggregate = qcom_icc_aggregate;
> +	provider->aggregate = icc_std_aggregate;
>  	provider->xlate = of_icc_xlate_onecell;
>  	provider->data = data;
>  
