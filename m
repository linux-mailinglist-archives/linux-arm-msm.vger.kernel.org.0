Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 953857B3A7B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Sep 2023 21:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233578AbjI2TRr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Sep 2023 15:17:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233498AbjI2TRq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Sep 2023 15:17:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F3B91A4
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 12:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696015016;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0rlgMKtkiGg5SDKAWUTyNK5aI897JBF4TZ7jGdexrfM=;
        b=B/YxTMcXUtrzPYaOl9GiRiwPwjCXhZoaiGkc+gcyec5INaT2HhXf6Ly/T7yL8VGXGUS8a3
        ecn+5FF+s+BWhdEb9QHMl+dsFzMO7NFrO3TK35mX+m00bVpJDal8OWv1y1HmaibU9KTzC+
        6BhlLJdqq/i5aBAajlIQcmefV6OBhrY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-Y-TvTUUCP9iityDFrO3gAg-1; Fri, 29 Sep 2023 15:16:55 -0400
X-MC-Unique: Y-TvTUUCP9iityDFrO3gAg-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-77574c5f713so734815085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 12:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696015014; x=1696619814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rlgMKtkiGg5SDKAWUTyNK5aI897JBF4TZ7jGdexrfM=;
        b=cfzDVGabJkCb7W7gceGjrmatR3K0npOUrwgWKNg/MufLtmu8X0MA0smkXXaKXllr1b
         bcboPU4NmfQw6C+YyX3rJA8H3FroQ3YRw6MmgFd4ySnPeRW4KPeltsYV7dqAG66dBpeq
         6xcXrIKt+qTjo16UjDt+PpaEMZmgut5vFz3EoQACeB9FplnZTngIU27jdTRWNQBER3wf
         HR7hcDThH7jjDjUiCkIJyPmLnj57foaBBBdbQJJFrX7UcBLAmXahJG8IBUtk/aMEI7vQ
         SCPltxb8CAskV3H7TOU3tgrO7FGAV/HGi82VZJEZcNPyed9OrPxjclqFPqXyuJFUxORK
         HK4A==
X-Gm-Message-State: AOJu0YzR+8lLYmgD7Vrd28VzhquHZSERNXx0csSkMsuP5eyVxk4RJTDb
        2RRVtPIyKTBlB5m+dzPhrLuT6+R1IsoQhHOe1tJ0UssmTMV6pmN/U0FGRlTwgG52Fw8VZOO+hSz
        9PA7r5qxr2ucUSRt4y8mBJBhEtA==
X-Received: by 2002:a05:620a:288c:b0:774:33ce:cfb6 with SMTP id j12-20020a05620a288c00b0077433cecfb6mr5670967qkp.30.1696015014543;
        Fri, 29 Sep 2023 12:16:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErAwYvSgMzhl4l4ZRNLz6jr80n1PMtVq2N38jVeuKB+G64KJ3kdBO/8sz+yfQrvs9if1MW8w==
X-Received: by 2002:a05:620a:288c:b0:774:33ce:cfb6 with SMTP id j12-20020a05620a288c00b0077433cecfb6mr5670947qkp.30.1696015014159;
        Fri, 29 Sep 2023 12:16:54 -0700 (PDT)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id j3-20020a05620a146300b007676f3859fasm3484197qkl.30.2023.09.29.12.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 12:16:53 -0700 (PDT)
Date:   Fri, 29 Sep 2023 14:16:51 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel@quicinc.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 06/11] firmware: qcom: scm: make
 qcom_scm_pas_init_image() use the SCM allocator
Message-ID: <gwflmag5pq7osprj25l7i4tgyln2nauuqcwdhth2eomareooag@4dw4lwk4vr36>
References: <20230928092040.9420-1-brgl@bgdev.pl>
 <20230928092040.9420-7-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928092040.9420-7-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 28, 2023 at 11:20:35AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Let's use the new SCM memory allocator to obtain a buffer for this call
> instead of using dma_alloc_coherent().
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 02a773ba1383..c0eb81069847 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -532,7 +532,7 @@ static void qcom_scm_set_download_mode(bool enable)
>  int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>  			    struct qcom_scm_pas_metadata *ctx)
>  {
> -	dma_addr_t mdata_phys;
> +	phys_addr_t mdata_phys;

>  	void *mdata_buf;
>  	int ret;
>  	struct qcom_scm_desc desc = {
> @@ -544,13 +544,7 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>  	};
>  	struct qcom_scm_res res;
>  
> -	/*
> -	 * During the scm call memory protection will be enabled for the meta
> -	 * data blob, so make sure it's physically contiguous, 4K aligned and
> -	 * non-cachable to avoid XPU violations.
> -	 */
> -	mdata_buf = dma_alloc_coherent(__scm->dev, size, &mdata_phys,
> -				       GFP_KERNEL);
> +	mdata_buf = qcom_scm_mem_alloc(size, GFP_KERNEL);

mdata_phys is never initialized now, and its what's being shoved into
desc.args[1] later, which I believe is what triggered the -EINVAL
with qcom_scm_call() that I reported in my cover letter reply this
morning.

Prior with the DMA API that would have been the device view of the buffer.

>  	if (!mdata_buf) {
>  		dev_err(__scm->dev, "Allocation of metadata buffer failed.\n");
>  		return -ENOMEM;
> @@ -574,10 +568,10 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>  
>  out:
>  	if (ret < 0 || !ctx) {
> -		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
> +		qcom_scm_mem_free(mdata_buf);
>  	} else if (ctx) {
>  		ctx->ptr = mdata_buf;
> -		ctx->phys = mdata_phys;
> +		ctx->phys = qcom_scm_mem_to_phys(mdata_buf);
>  		ctx->size = size;
>  	}
>  
> @@ -594,7 +588,7 @@ void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
>  	if (!ctx->ptr)
>  		return;
>  
> -	dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
> +	qcom_scm_mem_free(ctx->ptr);
>  
>  	ctx->ptr = NULL;
>  	ctx->phys = 0;
> -- 
> 2.39.2
> 

