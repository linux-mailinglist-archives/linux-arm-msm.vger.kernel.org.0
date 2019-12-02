Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5E3C10EE92
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2019 18:38:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbfLBRh5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Dec 2019 12:37:57 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34551 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727888AbfLBRh5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Dec 2019 12:37:57 -0500
Received: by mail-pg1-f193.google.com with SMTP id r11so8158pgf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2019 09:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1q+zRIk1qdyWm+7FQyvly7Xqy3e/4MC/bLSxNFOiMME=;
        b=beRF/nSGuydifmE0KQdDYpSd0ZSWupanKZuPT0FRTtPwbM4u+pjW/RIakuW4cTjkxK
         aOuQMLByZNVZF5/3Y7a59qldEmbbsasdkG5MjE9ZlAw5/xJBoDwfPsoWCbmDCPnCqmcX
         xbGmtj4m4SKVf2lqV3hdH4xnE5KzhjS9jGwzMiiP0msvUscIdtr1Soguu/mE07BTvwM/
         XXidEqSyuUEZM9MIaZ9vFnhdrovs5vSeW4xagcP1D59nuR0v9YJ7MpoOPKPELD7k9JOz
         +OXLVlWZoKEdsemAgDWLadIBppExvWYNXKXcRMU3ELPjX198VdG2zTg/eLeZDNpBAVYS
         tjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1q+zRIk1qdyWm+7FQyvly7Xqy3e/4MC/bLSxNFOiMME=;
        b=VRqgJCtViPjGQUxdf3KsMlNYNknxPX8mi8j0DVmKklwfOlsCmxzTC2dcO0pHSZD0/A
         xTMnC+Qdl+fkbN+oFKDgTlU+i7YGDZ4gcirB9jUvmptO04nlvrbjo65B8RArqBREOodm
         sAAfQj5dUBe7QOhXtvoggxlJdaPHXSGjJt9lYckBtv/scyrenbyiliRsACRuY6Gqxxlh
         7T4D6csJg27H4Z2edHm6d0vddXDaHgeF51Vq1dS9SnztO2TlF4wneMDllji0+qtDJN2f
         kUC/kPm14XdrhK/tIZtEEv1kdDZuDKU+oakqagMbBDw3/Yd7WM/iigbXYg4RzUcDJJnu
         ylew==
X-Gm-Message-State: APjAAAVi1gTBb1YZjmv2crkvS/+Pny3XrvhW5vtmgf0pMv9LyXTVxP8Y
        hpIfXiQ//Im8FcBIwXY41iXc7Q==
X-Google-Smtp-Source: APXvYqzOMuWAh1BvjAR+MnfuM9eAwE5qaIdShXC2OWVdIxebAEDPqvJ9qtU4UWsw0qRIpxVS2lpMbw==
X-Received: by 2002:a63:584:: with SMTP id 126mr217482pgf.100.1575308275835;
        Mon, 02 Dec 2019 09:37:55 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 20sm182504pgw.71.2019.12.02.09.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 09:37:55 -0800 (PST)
Date:   Mon, 2 Dec 2019 09:37:52 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     linux-pm@vger.kernel.org, agross@kernel.org, digetx@gmail.com,
        evgreen@chromium.org, daidavid1@codeaurora.org,
        masneyb@onstation.org, sibis@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/5] interconnect: qcom: msm8974: Walk the list safely
 on node removal
Message-ID: <20191202173752.GD133384@yoga>
References: <20191202162133.7089-1-georgi.djakov@linaro.org>
 <20191202162133.7089-3-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191202162133.7089-3-georgi.djakov@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 02 Dec 08:21 PST 2019, Georgi Djakov wrote:

> As we will remove items off the list using list_del(), we need to use the
> safe version of list_for_each_entry().
> 
> Fixes: 4e60a9568dc6 ("interconnect: qcom: add msm8974 driver")
> Reported-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/interconnect/qcom/msm8974.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/interconnect/qcom/msm8974.c b/drivers/interconnect/qcom/msm8974.c
> index f29974ea9671..ca25f31e5f0b 100644
> --- a/drivers/interconnect/qcom/msm8974.c
> +++ b/drivers/interconnect/qcom/msm8974.c
> @@ -643,7 +643,7 @@ static int msm8974_icc_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct icc_onecell_data *data;
>  	struct icc_provider *provider;
> -	struct icc_node *node;
> +	struct icc_node *node, *tmp;
>  	size_t num_nodes, i;
>  	int ret;
>  
> @@ -723,7 +723,7 @@ static int msm8974_icc_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_del_icc:
> -	list_for_each_entry(node, &provider->nodes, node_list) {
> +	list_for_each_entry_safe(node, tmp, &provider->nodes, node_list) {
>  		icc_node_del(node);
>  		icc_node_destroy(node->id);
>  	}
> @@ -739,9 +739,9 @@ static int msm8974_icc_remove(struct platform_device *pdev)
>  {
>  	struct msm8974_icc_provider *qp = platform_get_drvdata(pdev);
>  	struct icc_provider *provider = &qp->provider;
> -	struct icc_node *n;
> +	struct icc_node *n, *tmp;
>  
> -	list_for_each_entry(n, &provider->nodes, node_list) {
> +	list_for_each_entry_safe(n, tmp, &provider->nodes, node_list) {
>  		icc_node_del(n);
>  		icc_node_destroy(n->id);
>  	}
