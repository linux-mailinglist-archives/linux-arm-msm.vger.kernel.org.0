Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03A898539E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2019 21:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730601AbfHGTbB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Aug 2019 15:31:01 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59080 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730363AbfHGTbB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Aug 2019 15:31:01 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x77JUwMv112817;
        Wed, 7 Aug 2019 14:30:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565206258;
        bh=elEHc2fGQlFO5WBakgNaDmLiEc3eMutzgkw76itkzKQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=oETy+CwdGtIa0knYIdVi9eM6SQ5d7AYWFZc7X1fh92APizCqva6r+e2gvy33hnh/e
         tHdCY9sgidoO3p65/toPOnEneRbuLmG9cABmVdkSftzzhpiFKGNCf1X+QOt+vBoZa7
         M1vY4XlGNf71nyn5QT22LgiLzNZunJBgpeIFBa0E=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x77JUwE7023953
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Aug 2019 14:30:58 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 14:30:57 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 7 Aug 2019 14:30:57 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x77JUvkS084298;
        Wed, 7 Aug 2019 14:30:57 -0500
Subject: Re: [PATCH 7/9] remoteproc: Introduce "panic" callback in ops
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
CC:     Andy Gross <agross@kernel.org>, Sibi Sankar <sibis@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>
References: <20190807053942.9836-1-bjorn.andersson@linaro.org>
 <20190807053942.9836-8-bjorn.andersson@linaro.org>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <52517bd4-288b-7df6-9b7f-b1d26474d13f@ti.com>
Date:   Wed, 7 Aug 2019 14:30:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190807053942.9836-8-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/7/19 12:39 AM, Bjorn Andersson wrote:
> Introduce a "panic" function in the remoteproc ops table, to allow
> remoteproc instances to perform operations needed in order to aid in
> post mortem system debugging, such as flushing caches etc, when the
> kernel panics.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 16 ++++++++++++++++
>  include/linux/remoteproc.h           |  3 +++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 3c5fbbbfb0f1..cc47797c6496 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1833,6 +1833,16 @@ void rproc_shutdown(struct rproc *rproc)
>  }
>  EXPORT_SYMBOL(rproc_shutdown);
>  
> +static int rproc_panic_handler(struct notifier_block *nb, unsigned long event,
> +			       void *ptr)
> +{
> +	struct rproc *rproc = container_of(nb, struct rproc, panic_nb);
> +
> +	rproc->ops->panic(rproc);
> +
> +	return NOTIFY_DONE;
> +}
> +
>  /**
>   * rproc_get_by_phandle() - find a remote processor by phandle
>   * @phandle: phandle to the rproc
> @@ -2058,6 +2068,12 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  		rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
>  	}
>  
> +	/* Register panic notifier for remoteprocs with "panic" callback */
> +	if (rproc->ops->panic) {
> +		rproc->panic_nb.notifier_call = rproc_panic_handler;
> +		atomic_notifier_chain_register(&panic_notifier_list, &rproc->panic_nb);
> +	}
> +
>  	mutex_init(&rproc->lock);
>  
>  	idr_init(&rproc->notifyids);
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 16ad66683ad0..33553f6d8ff0 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -383,6 +383,7 @@ struct rproc_ops {
>  	int (*load)(struct rproc *rproc, const struct firmware *fw);
>  	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
>  	u32 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
> +	void (*panic)(struct rproc *rproc);

Do add the kernel doc comment for the new callback op.

regards
Suman

>  };
>  
>  /**
> @@ -481,6 +482,7 @@ struct rproc_dump_segment {
>   * @auto_boot: flag to indicate if remote processor should be auto-started
>   * @dump_segments: list of segments in the firmware
>   * @nb_vdev: number of vdev currently handled by rproc
> + * @panic_nb: notifier_block for remoteproc's panic handler
>   */
>  struct rproc {
>  	struct list_head node;
> @@ -514,6 +516,7 @@ struct rproc {
>  	bool auto_boot;
>  	struct list_head dump_segments;
>  	int nb_vdev;
> +	struct notifier_block panic_nb;
>  };
>  
>  /**
> 

