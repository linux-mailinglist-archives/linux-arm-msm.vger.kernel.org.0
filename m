Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F4851B518C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 02:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbgDWAyW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 20:54:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726050AbgDWAyV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 20:54:21 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63B3AC03C1AD
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 17:54:21 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id d17so2024041pgo.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 17:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JE6oe6+FjyPpD6b7n/9jEP7EO44SjCw/ANTgeIyfdbY=;
        b=f9fD5qDZqzQntcq3cunw40sGeOnYhRZwuOYSZU9eAfnkrWzSHJwwyOdiMKCzz6mAmz
         YeTAKrcPmJwh30QSShuQ/ixpOXqQrCyNzO0CH/pBn/+KQV6iGdMvtRDZnK0qcnfTpU8q
         9cRTgijwpN+krvCuy3P6p/sfZTK4qLvq5EhVrw7S3YWTo/jsXGiCubMb5N4uxrXk49eE
         2TtncsCXFkv6MaH5dC2pnTboQHddPnu7ZTR47q7IzzOReJoeY7hzf7wDWfOjResBAdyl
         TMSr7qGclw49xvEtAgNqFqiVMSgsam9O/UpmNDBLnke4CwMByRbOkJYf94nKhyX2ISE5
         NU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JE6oe6+FjyPpD6b7n/9jEP7EO44SjCw/ANTgeIyfdbY=;
        b=HBc+DRSbE2IJkoWzAzcfNAKM2QNi663g520dJ0TeB0duI+byeFi2abYuhGRkSVteTk
         ZPNZYoa9MU00XOvu8NO6vpSXM3mdX5Khz5ehztrQYjyxLYpOcEQsRXV8R6D7kzoc6+8N
         9swazy59XyEMCcFO8AOZJMDqk1s63MzTLvhXUO1UHPPwbbiQKb77vaBdAMfVhjVjdYHe
         IBhQJurz3OoaFE1G8h1MIMVtM3jvpOESYOi+z5j7fXykKG9OFZET30ls0LIxlEEnRNDM
         1GuQHj5sM+rmSjcnwDYarSuSt9No2uu6Mm7qICLsHNnPQCcIQP5hi6qFntoi8boUMX+h
         X1ZA==
X-Gm-Message-State: AGi0PubfZ15lc6KJ0ZQQCrqfXkFKeVLhLYii4Ij0UyJpS+qZNbj87MGN
        RDRepHipEhcn9NupTqp9XQbrDQ==
X-Google-Smtp-Source: APiQypLZ//tdUMggVbUWBbANGF4BxMMvcCwHBTx5jEXUWU97jlHYEDGls/VqjKQRsQUH8uPFIVuiCA==
X-Received: by 2002:a62:144c:: with SMTP id 73mr1296022pfu.37.1587603260848;
        Wed, 22 Apr 2020 17:54:20 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y71sm712012pfb.179.2020.04.22.17.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 17:54:20 -0700 (PDT)
Date:   Wed, 22 Apr 2020 17:54:47 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     agross@kernel.org, ohad@wizery.com,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org
Subject: Re: [PATCH v2 4/6] remoteproc: qcom: Add name field for every
 subdevice
Message-ID: <20200423005447.GM1868936@builder.lan>
References: <1586389003-26675-1-git-send-email-sidgup@codeaurora.org>
 <1586389003-26675-5-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586389003-26675-5-git-send-email-sidgup@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 08 Apr 16:36 PDT 2020, Siddharth Gupta wrote:

> From: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> 
> When a client driver wishes to utilize functionality from a particular
> subdevice of a remoteproc, it cannot differentiate between the subdevices
> that have been added. This patch allows the client driver to distinguish
> between subdevices and thus utilize their functionality.
> 

As noted in patch 5, this invites driver authors to traverse the rproc
subdev list outside the remoteproc core. So I would like to avoid this.

Regards,
Bjorn

> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_common.c | 6 ++++++
>  include/linux/remoteproc.h       | 2 ++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> index 60650bc..1d2351b 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -56,6 +56,7 @@ void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink)
>  		return;
>  
>  	glink->dev = dev;
> +	glink->subdev.name = kstrdup("glink", GFP_KERNEL);
>  	glink->subdev.start = glink_subdev_start;
>  	glink->subdev.stop = glink_subdev_stop;
>  
> @@ -73,6 +74,7 @@ void qcom_remove_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glin
>  	if (!glink->node)
>  		return;
>  
> +	kfree(glink->subdev.name);
>  	rproc_remove_subdev(rproc, &glink->subdev);
>  	of_node_put(glink->node);
>  }
> @@ -152,6 +154,7 @@ void qcom_add_smd_subdev(struct rproc *rproc, struct qcom_rproc_subdev *smd)
>  		return;
>  
>  	smd->dev = dev;
> +	smd->subdev.name = kstrdup("smd", GFP_KERNEL);
>  	smd->subdev.start = smd_subdev_start;
>  	smd->subdev.stop = smd_subdev_stop;
>  
> @@ -169,6 +172,7 @@ void qcom_remove_smd_subdev(struct rproc *rproc, struct qcom_rproc_subdev *smd)
>  	if (!smd->node)
>  		return;
>  
> +	kfree(smd->subdev.name);
>  	rproc_remove_subdev(rproc, &smd->subdev);
>  	of_node_put(smd->node);
>  }
> @@ -220,6 +224,7 @@ void qcom_add_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr,
>  			 const char *ssr_name)
>  {
>  	ssr->name = ssr_name;
> +	ssr->subdev.name = kstrdup("ssr_notifs", GFP_KERNEL);
>  	ssr->subdev.unprepare = ssr_notify_unprepare;
>  
>  	rproc_add_subdev(rproc, &ssr->subdev);
> @@ -233,6 +238,7 @@ EXPORT_SYMBOL_GPL(qcom_add_ssr_subdev);
>   */
>  void qcom_remove_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr)
>  {
> +	kfree(ssr->subdev.name);
>  	rproc_remove_subdev(rproc, &ssr->subdev);
>  }
>  EXPORT_SYMBOL_GPL(qcom_remove_ssr_subdev);
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index c5d36e6..687e1eb 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -523,6 +523,7 @@ struct rproc {
>  /**
>   * struct rproc_subdev - subdevice tied to a remoteproc
>   * @node: list node related to the rproc subdevs list
> + * @name: name of the subdevice
>   * @prepare: prepare function, called before the rproc is started
>   * @start: start function, called after the rproc has been started
>   * @stop: stop function, called before the rproc is stopped; the @crashed
> @@ -531,6 +532,7 @@ struct rproc {
>   */
>  struct rproc_subdev {
>  	struct list_head node;
> +	char *name;
>  
>  	int (*prepare)(struct rproc_subdev *subdev);
>  	int (*start)(struct rproc_subdev *subdev);
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
