Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3C27C43D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 00:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231496AbjJJW0E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 18:26:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbjJJW0C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 18:26:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFD4098
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 15:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696976717;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=S425dUFU+lNt5RhPxUUHdrBo8GRV+oDgKvT6OmMk34I=;
        b=UzZ/2bCwvMmA66clcLee5yS/UMuZz0mxqdP7ntHV5h7LLMF0qyJ895TeymMAK94LcBZdfu
        zvubE2doNKH47LlqOqSXXzqA7s2espSpJ/uAq1+l6pqekzVrdAo/yDZ7mN/5gmgFmMVdEs
        +fyoqDRrEVefczWI9neqbrDyzKFGErM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-fZBQckbVNZCDowQEHGhCyQ-1; Tue, 10 Oct 2023 18:25:15 -0400
X-MC-Unique: fZBQckbVNZCDowQEHGhCyQ-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-774292d71e3so706620085a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 15:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696976715; x=1697581515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S425dUFU+lNt5RhPxUUHdrBo8GRV+oDgKvT6OmMk34I=;
        b=jHjDqX9UJPKFhYJ04PgEIu1XGQU9Ceggm+8VAOox4WWCjNYrzxlQUc4sL8/6Q1T1FE
         Zy4BqW7hfsVcQgGbrLPKWW6u2VedDBa7gNFWAw8SLg+ppmNMBHBAJCc1LucIwb2sgsSb
         zT/ILipqn7+ZjBJVLyev3SvwZLSj9htS9wdb5O6bl+vAmlxYqnFoIdRySlZwnXQwlXxE
         f74OrYrV8SPnLMp/JJsmXBnjdy+ma52gsnV/zQ3DxugR3SiRf4eoJ3cahJLXTOikxs//
         HB9xK9akp4dR0r/blMzs7vFXquCd19N5jxQviL3M7yjKSq6Ip/vHMBbAfdVOz4MuoNNU
         vxew==
X-Gm-Message-State: AOJu0YxzQIiGfnAjf3JDD7KoZOQS5LEXQsjpfp4tvNWEyBNmZakpDXGd
        pibJk+pyVYd+/5jhyGTvZNTFBfQqfIFkzd62yjWOokjN1dgVpIH9J2wmAWtWRyfDT0EaQHOssDn
        60VE1TL4OkIizoiKH1DE8hpO9zQ==
X-Received: by 2002:a05:620a:44cb:b0:775:6dfb:874b with SMTP id y11-20020a05620a44cb00b007756dfb874bmr25482813qkp.51.1696976715114;
        Tue, 10 Oct 2023 15:25:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHI2h5JSeTuSkej2aFal1eyjZSAByC9WQ/SOyg9W3nCMiojVwl/alCxSWV1QIPawodHclsh1A==
X-Received: by 2002:a05:620a:44cb:b0:775:6dfb:874b with SMTP id y11-20020a05620a44cb00b007756dfb874bmr25482790qkp.51.1696976714835;
        Tue, 10 Oct 2023 15:25:14 -0700 (PDT)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id z4-20020a05620a100400b007726002d69esm4703643qkj.10.2023.10.10.15.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 15:25:14 -0700 (PDT)
Date:   Tue, 10 Oct 2023 17:25:12 -0500
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
Subject: Re: [PATCH v3 08/15] firmware: qcom: scm: make
 qcom_scm_ice_set_key() use the TZ allocator
Message-ID: <25rend34es2ayrgbyawoz6tfpweba3drvdrwgiflxhkd7lipma@lj6xolgwwjpt>
References: <20231009153427.20951-1-brgl@bgdev.pl>
 <20231009153427.20951-9-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009153427.20951-9-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 09, 2023 at 05:34:20PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Let's use the new TZ memory allocator to obtain a buffer for this call
> instead of using dma_alloc_coherent().
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 21 +++++----------------
>  1 file changed, 5 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 754f6056b99f..31071a714cf1 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -1197,32 +1197,21 @@ int qcom_scm_ice_set_key(u32 index, const u8 *key, u32 key_size,
>  		.args[4] = data_unit_size,
>  		.owner = ARM_SMCCC_OWNER_SIP,
>  	};
> -	void *keybuf;
> -	dma_addr_t key_phys;
> +
>  	int ret;
>  
> -	/*
> -	 * 'key' may point to vmalloc()'ed memory, but we need to pass a
> -	 * physical address that's been properly flushed.  The sanctioned way to
> -	 * do this is by using the DMA API.  But as is best practice for crypto
> -	 * keys, we also must wipe the key after use.  This makes kmemdup() +
> -	 * dma_map_single() not clearly correct, since the DMA API can use
> -	 * bounce buffers.  Instead, just use dma_alloc_coherent().  Programming
> -	 * keys is normally rare and thus not performance-critical.
> -	 */
> -
> -	keybuf = dma_alloc_coherent(__scm->dev, key_size, &key_phys,
> -				    GFP_KERNEL);
> +	void *keybuf __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
> +							   key_size,
> +							   GFP_KERNEL);

At the risk of sounding like a broken record, the same nit about
declaration being moved, I'll just mention that one last time here in
the series and then accept the outcome of that discussion across the
series :) Also a bummer to lose that comment, but I guess oh well.

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

>  	if (!keybuf)
>  		return -ENOMEM;
>  	memcpy(keybuf, key, key_size);
> -	desc.args[1] = key_phys;
> +	desc.args[1] = qcom_tzmem_to_phys(keybuf);
>  
>  	ret = qcom_scm_call(__scm->dev, &desc, NULL);
>  
>  	memzero_explicit(keybuf, key_size);
>  
> -	dma_free_coherent(__scm->dev, key_size, keybuf, key_phys);
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_ice_set_key);
> -- 
> 2.39.2
> 

