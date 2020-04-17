Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B02E1AE246
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 18:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbgDQQ2n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Apr 2020 12:28:43 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:40448 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgDQQ2n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Apr 2020 12:28:43 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03HGSfU3065131;
        Fri, 17 Apr 2020 11:28:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587140921;
        bh=2z3mooA7/6Ocg3+WvkJvbFNngZHx4PdkcY5PQ8E+L84=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=wRo+tMLZHdlqPLNZIeRd/l5snCcojXUO4Dk815QnJFKe+m7FunSDmHTHKsi1TBkFV
         JIMfTe3fIqRsOYNXwxBxto0TFkHfYDIXYlsATkg75J7owczFcdFYm4EW45vJ4Y1z2U
         gq1cG0gmVVzm7VavbKmCFlH+BiL5KYmxc9wvNjMw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03HGSeAA015583;
        Fri, 17 Apr 2020 11:28:40 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 17
 Apr 2020 11:28:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 17 Apr 2020 11:28:40 -0500
Received: from [10.250.48.148] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03HGSe1s073086;
        Fri, 17 Apr 2020 11:28:40 -0500
Subject: Re: [PATCH 3/3] remoteproc: qcom_q6v5_mss: fix q6v5_probe() error
 paths
To:     Alex Elder <elder@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200403175005.17130-1-elder@linaro.org>
 <20200403175005.17130-4-elder@linaro.org>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <0f0a9d92-bcd9-0fd0-8003-b93ae4d230b4@ti.com>
Date:   Fri, 17 Apr 2020 11:28:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200403175005.17130-4-elder@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/3/20 12:50 PM, Alex Elder wrote:
> If an error occurs in q6v5_probe() after the proxy power domains
> are attached, but before qcom_add_ipa_notify_subdev() is called,
> qcom_remove_ipa_notify_subdev() is called in the error path, which
> is a bug.  Fix this by having that call be reached through a
> different label.
> 
> Additionally, if qcom_add_sysmon_subdev() returns an error, the
> subdevs that had already been added will not be properly removed.
> Fix this by having the added subdevs (including the IPA notify one)
> be removed in this case.
> 
> Finally, arrange for the sysmon subdev to be removed before the rest
> in the event rproc_add() returns an error.
> 
> Have cleanup activity done in q6v5_remove() be done in the reverse
> order they are set up in q6v5_probe() (the same order they're done
> in the q6v5_probe() error path).  Use a local variable for the
> remoteproc pointer, which is used repeatedly.
> 
> Remove errant semicolons at the end of two function blocks.
> 

Same as Patch 2, Fixes: line would be good.

regards
Suman

> Signed-off-by: Alex Elder <elder@linaro.org>
> ---
>   drivers/remoteproc/qcom_q6v5_mss.c | 31 ++++++++++++++++++------------
>   1 file changed, 19 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 60cdf699ea80..5475d4f808a8 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -367,7 +367,7 @@ static int q6v5_pds_enable(struct q6v5 *qproc, struct device **pds,
>   	}
>   
>   	return ret;
> -};
> +}
>   
>   static void q6v5_pds_disable(struct q6v5 *qproc, struct device **pds,
>   			     size_t pd_count)
> @@ -1527,7 +1527,7 @@ static int q6v5_pds_attach(struct device *dev, struct device **devs,
>   		dev_pm_domain_detach(devs[i], false);
>   
>   	return ret;
> -};
> +}
>   
>   static void q6v5_pds_detach(struct q6v5 *qproc, struct device **pds,
>   			    size_t pd_count)
> @@ -1766,17 +1766,23 @@ static int q6v5_probe(struct platform_device *pdev)
>   	qproc->sysmon = qcom_add_sysmon_subdev(rproc, "modem", 0x12);
>   	if (IS_ERR(qproc->sysmon)) {
>   		ret = PTR_ERR(qproc->sysmon);
> -		goto detach_proxy_pds;
> +		goto remove_subdevs;
>   	}
>   
>   	ret = rproc_add(rproc);
>   	if (ret)
> -		goto detach_proxy_pds;
> +		goto remove_sysmon_subdev;
>   
>   	return 0;
>   
> +remove_sysmon_subdev:
> +	qcom_remove_sysmon_subdev(qproc->sysmon);
> +remove_subdevs:
> +	qcom_remove_ipa_notify_subdev(qproc->rproc, &qproc->ipa_notify_subdev);
> +	qcom_remove_ssr_subdev(rproc, &qproc->ssr_subdev);
> +	qcom_remove_smd_subdev(rproc, &qproc->smd_subdev);
> +	qcom_remove_glink_subdev(rproc, &qproc->glink_subdev);
>   detach_proxy_pds:
> -	qcom_remove_ipa_notify_subdev(qproc->rproc, &qproc->ipa_notify_subdev);
>   	q6v5_pds_detach(qproc, qproc->proxy_pds, qproc->proxy_pd_count);
>   detach_active_pds:
>   	q6v5_pds_detach(qproc, qproc->active_pds, qproc->active_pd_count);
> @@ -1789,19 +1795,20 @@ static int q6v5_probe(struct platform_device *pdev)
>   static int q6v5_remove(struct platform_device *pdev)
>   {
>   	struct q6v5 *qproc = platform_get_drvdata(pdev);
> +	struct rproc *rproc = qproc->rproc;
>   
> -	rproc_del(qproc->rproc);
> +	rproc_del(rproc);
>   
>   	qcom_remove_sysmon_subdev(qproc->sysmon);
> -	qcom_remove_ipa_notify_subdev(qproc->rproc, &qproc->ipa_notify_subdev);
> -	qcom_remove_glink_subdev(qproc->rproc, &qproc->glink_subdev);
> -	qcom_remove_smd_subdev(qproc->rproc, &qproc->smd_subdev);
> -	qcom_remove_ssr_subdev(qproc->rproc, &qproc->ssr_subdev);
> +	qcom_remove_ipa_notify_subdev(rproc, &qproc->ipa_notify_subdev);
> +	qcom_remove_ssr_subdev(rproc, &qproc->ssr_subdev);
> +	qcom_remove_smd_subdev(rproc, &qproc->smd_subdev);
> +	qcom_remove_glink_subdev(rproc, &qproc->glink_subdev);
>   
> -	q6v5_pds_detach(qproc, qproc->active_pds, qproc->active_pd_count);
>   	q6v5_pds_detach(qproc, qproc->proxy_pds, qproc->proxy_pd_count);
> +	q6v5_pds_detach(qproc, qproc->active_pds, qproc->active_pd_count);
>   
> -	rproc_free(qproc->rproc);
> +	rproc_free(rproc);
>   
>   	return 0;
>   }
> 

