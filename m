Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 204C710EE9C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2019 18:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727898AbfLBRk3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Dec 2019 12:40:29 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44039 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727721AbfLBRk0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Dec 2019 12:40:26 -0500
Received: by mail-pf1-f193.google.com with SMTP id d199so14143334pfd.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2019 09:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hyAeLi8mzrAljg+oqlKweKC1x2LO84uDajOvbhKEc6o=;
        b=cwIOVoNj8BFAQnp6JkEeOfVeTVfoNVLdKQ1CTI59N9fU7j9SrPSvsQG2dmS6Roklsz
         zDHKDfgCImDnFN8XF0fkzU8+2ywFUDS8CDovjbvr4t+bacSts/Xzwi+F4oamgJFsK05d
         Hx/sF+MYP+1HUDj8YPmprAZNVaqQs3pffPlMLnh9K9Ggv+1iuxk8I0vNNADr1GDgZGEf
         QDi+vTkHKWfaNIWfuZwOBN0EC5gRzdCyBzNiNiJmvP0vcFhejyLTQDNxvoS8veZNVeL3
         QwIkbCcyqF3tGSS4RE26mEuMLwcvH5bxkhzyWl8Nx6ZF6pTSrhbViAq/+TIlt1Q4lxQ7
         vTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hyAeLi8mzrAljg+oqlKweKC1x2LO84uDajOvbhKEc6o=;
        b=Pp+teT8O67VsLhxXH30EGJI6fYLv2UoTM0sMfJiXJj72y894itWzM6JjRoLytKh4KJ
         t5O39hkboQXuX9YGTI3eFAWmD0zd2LFs5rhK2G3kFBm3BrjiZSZw3NUmvLyCqse63C8S
         BjfQAylnSYl/vOP+qy4HmKCNVbpGrQqvIHMKeaCFZaqurg/kcz5eQ70A2vhbNpi1OB0+
         x2wiMIGNstUiVpHrorW9mbiVM4Uc7iotTiCPvHGUwJj9p7QD14oOUqOEsf6tkAp5ekFG
         Upvilq+LBQsWVpznGR6aN0kdYpeEf7WKV/C+9YW9MdBGKY6BW2vHfOqfdW13ZN2qPEYx
         rwrg==
X-Gm-Message-State: APjAAAU/IFGSm5GCIVME5CVvmviayvQxJ9eV6qhLFT1x+DC5r4RMuJDV
        1Xjj67HvoYOhRwLNRRG5jUZyATUydV8=
X-Google-Smtp-Source: APXvYqw/2Be/C4XxVxo1CEdS6TiMz6AGfb519d+Ziji+JEmMMF5nHQW9dkec9gBcbb6VDLK7vvR1gg==
X-Received: by 2002:aa7:91d2:: with SMTP id z18mr48739048pfa.97.1575308423712;
        Mon, 02 Dec 2019 09:40:23 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w6sm180989pge.92.2019.12.02.09.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 09:40:22 -0800 (PST)
Date:   Mon, 2 Dec 2019 09:40:20 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     linux-pm@vger.kernel.org, agross@kernel.org, digetx@gmail.com,
        evgreen@chromium.org, daidavid1@codeaurora.org,
        masneyb@onstation.org, sibis@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 5/5] interconnect: qcom: Use the new common helper for
 node removal
Message-ID: <20191202174020.GE133384@yoga>
References: <20191202162133.7089-1-georgi.djakov@linaro.org>
 <20191202162133.7089-5-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191202162133.7089-5-georgi.djakov@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 02 Dec 08:21 PST 2019, Georgi Djakov wrote:

> There is a new helper function for removing all nodes. Let's use it instead
> of duplicating the code.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
> v2:
> - Don't call qnoc_remove() directly from probe. (Dmitry)
> 
>  drivers/interconnect/qcom/msm8974.c | 17 ++++-------------
>  drivers/interconnect/qcom/qcs404.c  | 17 ++++-------------
>  drivers/interconnect/qcom/sdm845.c  | 16 +++-------------
>  3 files changed, 11 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/interconnect/qcom/msm8974.c b/drivers/interconnect/qcom/msm8974.c
> index ca25f31e5f0b..3a313e11e73d 100644
> --- a/drivers/interconnect/qcom/msm8974.c
> +++ b/drivers/interconnect/qcom/msm8974.c
> @@ -643,7 +643,7 @@ static int msm8974_icc_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct icc_onecell_data *data;
>  	struct icc_provider *provider;
> -	struct icc_node *node, *tmp;
> +	struct icc_node *node;
>  	size_t num_nodes, i;
>  	int ret;
>  
> @@ -723,10 +723,7 @@ static int msm8974_icc_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_del_icc:
> -	list_for_each_entry_safe(node, tmp, &provider->nodes, node_list) {
> -		icc_node_del(node);
> -		icc_node_destroy(node->id);
> -	}
> +	icc_nodes_remove(provider);
>  	icc_provider_del(provider);
>  
>  err_disable_clks:
> @@ -738,16 +735,10 @@ static int msm8974_icc_probe(struct platform_device *pdev)
>  static int msm8974_icc_remove(struct platform_device *pdev)
>  {
>  	struct msm8974_icc_provider *qp = platform_get_drvdata(pdev);
> -	struct icc_provider *provider = &qp->provider;
> -	struct icc_node *n, *tmp;
>  
> -	list_for_each_entry_safe(n, tmp, &provider->nodes, node_list) {
> -		icc_node_del(n);
> -		icc_node_destroy(n->id);
> -	}
> +	icc_nodes_remove(&qp->provider);
>  	clk_bulk_disable_unprepare(qp->num_clks, qp->bus_clks);
> -
> -	return icc_provider_del(provider);
> +	return icc_provider_del(&qp->provider);
>  }
>  
>  static const struct of_device_id msm8974_noc_of_match[] = {
> diff --git a/drivers/interconnect/qcom/qcs404.c b/drivers/interconnect/qcom/qcs404.c
> index 9064f6bdaa69..d4769a5ea182 100644
> --- a/drivers/interconnect/qcom/qcs404.c
> +++ b/drivers/interconnect/qcom/qcs404.c
> @@ -405,7 +405,7 @@ static int qnoc_probe(struct platform_device *pdev)
>  	struct icc_provider *provider;
>  	struct qcom_icc_node **qnodes;
>  	struct qcom_icc_provider *qp;
> -	struct icc_node *node, *tmp;
> +	struct icc_node *node;
>  	size_t num_nodes, i;
>  	int ret;
>  
> @@ -485,10 +485,7 @@ static int qnoc_probe(struct platform_device *pdev)
>  
>  	return 0;
>  err:
> -	list_for_each_entry_safe(node, tmp, &provider->nodes, node_list) {
> -		icc_node_del(node);
> -		icc_node_destroy(node->id);
> -	}
> +	icc_nodes_remove(provider);
>  	clk_bulk_disable_unprepare(qp->num_clks, qp->bus_clks);
>  	icc_provider_del(provider);
>  
> @@ -498,16 +495,10 @@ static int qnoc_probe(struct platform_device *pdev)
>  static int qnoc_remove(struct platform_device *pdev)
>  {
>  	struct qcom_icc_provider *qp = platform_get_drvdata(pdev);
> -	struct icc_provider *provider = &qp->provider;
> -	struct icc_node *n, *tmp;
>  
> -	list_for_each_entry_safe(n, tmp, &provider->nodes, node_list) {
> -		icc_node_del(n);
> -		icc_node_destroy(n->id);
> -	}
> +	icc_nodes_remove(&qp->provider);
>  	clk_bulk_disable_unprepare(qp->num_clks, qp->bus_clks);
> -
> -	return icc_provider_del(provider);
> +	return icc_provider_del(&qp->provider);
>  }
>  
>  static const struct of_device_id qcs404_noc_of_match[] = {
> diff --git a/drivers/interconnect/qcom/sdm845.c b/drivers/interconnect/qcom/sdm845.c
> index 387267ee9648..f078cf0fce56 100644
> --- a/drivers/interconnect/qcom/sdm845.c
> +++ b/drivers/interconnect/qcom/sdm845.c
> @@ -855,11 +855,7 @@ static int qnoc_probe(struct platform_device *pdev)
>  
>  	return ret;
>  err:
> -	list_for_each_entry(node, &provider->nodes, node_list) {
> -		icc_node_del(node);
> -		icc_node_destroy(node->id);
> -	}
> -
> +	icc_nodes_remove(provider);
>  	icc_provider_del(provider);
>  	return ret;
>  }
> @@ -867,15 +863,9 @@ static int qnoc_probe(struct platform_device *pdev)
>  static int qnoc_remove(struct platform_device *pdev)
>  {
>  	struct qcom_icc_provider *qp = platform_get_drvdata(pdev);
> -	struct icc_provider *provider = &qp->provider;
> -	struct icc_node *n, *tmp;
> -
> -	list_for_each_entry_safe(n, tmp, &provider->nodes, node_list) {
> -		icc_node_del(n);
> -		icc_node_destroy(n->id);
> -	}
>  
> -	return icc_provider_del(provider);
> +	icc_nodes_remove(&qp->provider);
> +	return icc_provider_del(&qp->provider);
>  }
>  
>  static const struct of_device_id qnoc_of_match[] = {
