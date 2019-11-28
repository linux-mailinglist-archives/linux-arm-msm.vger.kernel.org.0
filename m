Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1763510CE77
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2019 19:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbfK1SUJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Nov 2019 13:20:09 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:42772 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726622AbfK1SUI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Nov 2019 13:20:08 -0500
Received: by mail-pj1-f66.google.com with SMTP id y21so12188131pjn.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2019 10:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jAenmenrHTt9V810iAGKw5haSYY23tLCCDaq/fEikCk=;
        b=RAz5rR4PRI4EgaZBCbMkUtdR+UVJv9GVxwyZYYZMW5QcLilDZrHxWCKhxfOEDCIQ8e
         F3E0jz8dC+yAyBFyKMi6oXQ6gpVk7nEAiihE3WPl2TaL8/bV98q7FUqwszs89OgLEnna
         AWRAeRsmlmQspzaXuUgHiF3+YwWU/K+7eePOM8rKWz93rdacbn2rEqWcLxHhIRn4yb2F
         fVCow1ohFtnyjPhAxxEgU2FLK2ZG0cSsPAmOdJa57QHCGjBeqE5gJrKwUrsYA7A/yont
         GJ82F1Gl3ClfYuDB/7j8ktVpSpkulb+gXSEFkG5mPrv50ssSHV4d7eDdOlyzW12HGUCx
         26jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jAenmenrHTt9V810iAGKw5haSYY23tLCCDaq/fEikCk=;
        b=p+0lBt2NHycr7LFEJlJ/s9MWxr1gI8S7HA+TtW+okjUjISyuoGvoh4OL20Mc0SR1tm
         JXqdWUiDIeI1UEVvPjkanA8op+c2+uY9Ue2aw8JiBYksBFK+K8JRqaBNaO0K4pOR0poG
         9N4RatPmLBA6Q98nIbqprB5iUcIQUNx6tihu2lcJ6Esz+/1Gia5zLBqW/VaIx1LzNL4H
         enwriGaQrev/R5aveiWZkAFmthSaCA40SN8qDPOMFRys9vmKmsPMfq+bDCvlbdMfNOs7
         oCST3kz0SC+EN1r73HO36yYakypXpZ1P5kFbzOyzDs9J8t1MhewtD07pabFATY5NcRLz
         VX5w==
X-Gm-Message-State: APjAAAWNdakBcyPCmMAKu5u7++MVOVFj27kgI8Yai6mrggjZEzeuEEC/
        WBDjAQedFUI4uvJCUiZAbK8T8w==
X-Google-Smtp-Source: APXvYqxWG/WPs6VxZM3vPGSV/CyOAEHAuCFp2hEsXVro/tC2Gaj9FDbNfNm/+en6Cko9tPEHXCUKEw==
X-Received: by 2002:a17:902:7b88:: with SMTP id w8mr10746205pll.205.1574965207520;
        Thu, 28 Nov 2019 10:20:07 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x7sm21355802pfa.107.2019.11.28.10.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 10:20:06 -0800 (PST)
Date:   Thu, 28 Nov 2019 10:20:04 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     linux-pm@vger.kernel.org, agross@kernel.org, digetx@gmail.com,
        evgreen@chromium.org, daidavid1@codeaurora.org,
        masneyb@onstation.org, sibis@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/5] interconnect: Add a common helper for removing all
 nodes
Message-ID: <20191128182004.GJ82109@yoga>
References: <20191128133435.25667-1-georgi.djakov@linaro.org>
 <20191128133435.25667-4-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191128133435.25667-4-georgi.djakov@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 28 Nov 05:34 PST 2019, Georgi Djakov wrote:

> The removal of all nodes from a provider seem to be a common functionality
> for all existing users and it would make sense to factor out this into a
> a common helper function.
> 
> Suggested-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/interconnect/core.c           | 22 ++++++++++++++++++++++
>  include/linux/interconnect-provider.h |  6 ++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
> index 467c539310f3..0e4852feb395 100644
> --- a/drivers/interconnect/core.c
> +++ b/drivers/interconnect/core.c
> @@ -735,6 +735,28 @@ void icc_node_del(struct icc_node *node)
>  }
>  EXPORT_SYMBOL_GPL(icc_node_del);
>  
> +/**
> + * icc_nodes_remove() - remove all previously added nodes from provider
> + * @provider: the interconnect provider we are removing nodes from
> + *
> + * Return: 0 on success, or an error code otherwise
> + */
> +int icc_nodes_remove(struct icc_provider *provider)
> +{
> +	struct icc_node *n, *tmp;
> +
> +	if (WARN_ON(IS_ERR_OR_NULL(provider)))
> +		return -EINVAL;
> +
> +	list_for_each_entry_safe_reverse(n, tmp, &provider->nodes, node_list) {
> +		icc_node_del(n);
> +		icc_node_destroy(n->id);
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(icc_nodes_remove);
> +
>  /**
>   * icc_provider_add() - add a new interconnect provider
>   * @provider: the interconnect provider that will be added into topology
> diff --git a/include/linux/interconnect-provider.h b/include/linux/interconnect-provider.h
> index b16f9effa555..31440c921216 100644
> --- a/include/linux/interconnect-provider.h
> +++ b/include/linux/interconnect-provider.h
> @@ -98,6 +98,7 @@ int icc_link_create(struct icc_node *node, const int dst_id);
>  int icc_link_destroy(struct icc_node *src, struct icc_node *dst);
>  void icc_node_add(struct icc_node *node, struct icc_provider *provider);
>  void icc_node_del(struct icc_node *node);
> +int icc_nodes_remove(struct icc_provider *provider);
>  int icc_provider_add(struct icc_provider *provider);
>  int icc_provider_del(struct icc_provider *provider);
>  
> @@ -130,6 +131,11 @@ void icc_node_del(struct icc_node *node)
>  {
>  }
>  
> +static inline int icc_nodes_remove(struct icc_provider *provider)
> +{
> +	return -ENOTSUPP;
> +}
> +
>  static inline int icc_provider_add(struct icc_provider *provider)
>  {
>  	return -ENOTSUPP;
