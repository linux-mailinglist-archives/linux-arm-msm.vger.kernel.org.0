Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2754E6FB6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2019 10:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbfGVIi6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jul 2019 04:38:58 -0400
Received: from ns.iliad.fr ([212.27.33.1]:48734 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725989AbfGVIi6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jul 2019 04:38:58 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 3001C20598;
        Mon, 22 Jul 2019 10:38:56 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 188EA200A6;
        Mon, 22 Jul 2019 10:38:56 +0200 (CEST)
Subject: Re: [PATCH] firmware: qcom_scm: fix error for incompatible pointer
To:     Minwoo Im <minwoo.im.dev@gmail.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>, Christoph Hellwig <hch@lst.de>
References: <20190719134303.7617-1-minwoo.im.dev@gmail.com>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <7ea51e42-ab8a-e4e2-1833-651e2dabca3c@free.fr>
Date:   Mon, 22 Jul 2019 10:38:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190719134303.7617-1-minwoo.im.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Mon Jul 22 10:38:56 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adding people who have worked on drivers/firmware/qcom_scm.c or DMA

On 19/07/2019 15:43, Minwoo Im wrote:

> The following error can happen when trying to build it:
> 
> ```
> drivers/firmware/qcom_scm.c: In function ‘qcom_scm_assign_mem’:
> drivers/firmware/qcom_scm.c:460:47: error: passing argument 3 of ‘dma_alloc_coherent’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>   ptr = dma_alloc_coherent(__scm->dev, ptr_sz, &ptr_phys, GFP_KERNEL);
>                                                ^
> In file included from drivers/firmware/qcom_scm.c:12:0:
> ./include/linux/dma-mapping.h:636:21: note: expected ‘dma_addr_t * {aka long long unsigned int *}’ but argument is of type ‘phys_addr_t * {aka unsigned int *}’
>  static inline void *dma_alloc_coherent(struct device *dev, size_t size,
>                      ^~~~~~~~~~~~~~~~~~
> ```
> 
> We just can cast phys_addr_t to dma_addr_t here.

IME, casting is rarely a proper solution.


> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index 2ddc118dba1b..7f6c841fa200 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -457,7 +457,8 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
>  	ptr_sz = ALIGN(src_sz, SZ_64) + ALIGN(mem_to_map_sz, SZ_64) +
>  			ALIGN(dest_sz, SZ_64);
>  
> -	ptr = dma_alloc_coherent(__scm->dev, ptr_sz, &ptr_phys, GFP_KERNEL);
> +	ptr = dma_alloc_coherent(__scm->dev, ptr_sz, (dma_addr_t *) &ptr_phys,
> +					GFP_KERNEL);
>  	if (!ptr)
>  		return -ENOMEM;
>  

