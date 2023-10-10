Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F27447C439E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 00:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbjJJWUL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 18:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjJJWUG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 18:20:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5980799
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 15:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696976353;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=460OD4B2O0RmiKOd3BNdzwTQ6xFcB587G5axsVGpZnA=;
        b=FEYXeVxoQw02SXPqtHlHYfolxexB3vzbJTmAQcMSyoEd2Ic56Z2+MjPeBI6+2uIbi9/rkn
        yEcip2B0aaRrKGBgsDQJQHtQGts1GTwpFV0U8LLAzRRNiCro7g2Uhpn7+ZjlP+5XgybDYu
        NL0ucnIYop8Ewf3QhJAEGnMuUQzXUHM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-11dKbf83OQSfxL22m0Sc6g-1; Tue, 10 Oct 2023 18:19:07 -0400
X-MC-Unique: 11dKbf83OQSfxL22m0Sc6g-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-77586b4ae08so51876285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 15:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696976347; x=1697581147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=460OD4B2O0RmiKOd3BNdzwTQ6xFcB587G5axsVGpZnA=;
        b=c2eN8dPBI4jCnAUCQbhXaVltPBRimxbmoW647DN8i5foDe4HFn3gYeqjgxurDASUZa
         B5a9UF3+3wYIMQHutIUKGeMerYUnLuAif6Y4NJm1mfnKcWZ0WOCzcd0ShTtBXCMuQM+9
         WOzy6LFsVIPiEKdEgpPrU5pZcQBVEszPdLnB2pwuqB2gZdnKhIVTrGYZrof4Blb9exBP
         q0h65RGVxhAdcKpfIgKwLaXlLOqV2QhesWfkm5jVXhLXt9V5ApPDuYv1meJN5w/PyX2G
         l6l0v7HpCjsPx5ASgLwapprD8CvJFVLjnnpjGl/kz/J34fhI1QFHww00YWMGtqhijASZ
         xJCA==
X-Gm-Message-State: AOJu0YzGYwRfWPaa8VTzx8Gx7Uw8kIFDxyEt6zJ+j7la+5W0q79+Ix32
        uPNiVUwodgRUdOrC3PXm9FeAEaTBY376Ka9TxbbSaBkbQlFwRbL8HqmBZ5W0PaiuBwAvAznQV+k
        HM0jDZQfske4utf4wmOaK3Q5D7A==
X-Received: by 2002:a05:620a:3725:b0:76c:a911:f74f with SMTP id de37-20020a05620a372500b0076ca911f74fmr26760445qkb.27.1696976346907;
        Tue, 10 Oct 2023 15:19:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHayoQd+ZrF/NydFXRzAdQ0YuxIeMteFiaa5sBwgKH6E89FbNb+Shv53kOBhKXdERwSzrzhBQ==
X-Received: by 2002:a05:620a:3725:b0:76c:a911:f74f with SMTP id de37-20020a05620a372500b0076ca911f74fmr26760424qkb.27.1696976346651;
        Tue, 10 Oct 2023 15:19:06 -0700 (PDT)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id k26-20020a05620a143a00b007758b25ac3bsm4699190qkj.82.2023.10.10.15.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 15:19:06 -0700 (PDT)
Date:   Tue, 10 Oct 2023 17:19:04 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@quicinc.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 07/15] firmware: qcom: scm: make qcom_scm_assign_mem()
 use the TZ allocator
Message-ID: <v5ty4xeshodjlpyatqlrjipqejazamuhqhauorujveyqzpikoq@rftlvk6354yx>
References: <20231009153427.20951-1-brgl@bgdev.pl>
 <20231009153427.20951-8-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009153427.20951-8-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 09, 2023 at 05:34:19PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Let's use the new TZ memory allocator to obtain a buffer for this call
> instead of using dma_alloc_coherent().
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 71e98b666391..754f6056b99f 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/arm-smccc.h>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/completion.h>
>  #include <linux/cpumask.h>
> @@ -998,14 +999,13 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
>  	struct qcom_scm_mem_map_info *mem_to_map;
>  	phys_addr_t mem_to_map_phys;
>  	phys_addr_t dest_phys;
> -	dma_addr_t ptr_phys;
> +	phys_addr_t ptr_phys;
>  	size_t mem_to_map_sz;
>  	size_t dest_sz;
>  	size_t src_sz;
>  	size_t ptr_sz;
>  	int next_vm;
>  	__le32 *src;
> -	void *ptr;

nit: couldn't you keep this up here?

Otherwise,

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

>  	int ret, i, b;
>  	u64 srcvm_bits = *srcvm;
>  
> @@ -1015,10 +1015,13 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
>  	ptr_sz = ALIGN(src_sz, SZ_64) + ALIGN(mem_to_map_sz, SZ_64) +
>  			ALIGN(dest_sz, SZ_64);
>  
> -	ptr = dma_alloc_coherent(__scm->dev, ptr_sz, &ptr_phys, GFP_KERNEL);
> +	void *ptr __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
> +							ptr_sz, GFP_KERNEL);
>  	if (!ptr)
>  		return -ENOMEM;
>  
> +	ptr_phys = qcom_tzmem_to_phys(ptr);
> +
>  	/* Fill source vmid detail */
>  	src = ptr;
>  	i = 0;
> @@ -1047,7 +1050,6 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
>  
>  	ret = __qcom_scm_assign_mem(__scm->dev, mem_to_map_phys, mem_to_map_sz,
>  				    ptr_phys, src_sz, dest_phys, dest_sz);
> -	dma_free_coherent(__scm->dev, ptr_sz, ptr, ptr_phys);
>  	if (ret) {
>  		dev_err(__scm->dev,
>  			"Assign memory protection call failed %d\n", ret);
> -- 
> 2.39.2
> 

