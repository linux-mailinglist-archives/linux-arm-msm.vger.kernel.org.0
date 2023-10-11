Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2227C5EF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 23:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233428AbjJKVUG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 17:20:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233410AbjJKVUF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 17:20:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA2749E
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 14:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697059158;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9ARFU5ehJ77LMWQGx5SDRsMXLUYL9Q8sCSHPYnJI9hQ=;
        b=Tu5F9AFse6q6vN12roDHoLPCYg1yhZQspVoURn5TNJlN5RFDS8IFb+244AL/QzK9wCuVmH
        /jPG92cuf8SsMVie4DehD4vTE8gPXfVYMY732WIL/BHqnweIw8htr7d3jk14axk1h94uN6
        7h2Zt7xdLwsUL8QJa4ayFdRx3TH0Joc=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-WroYPN1MPp6pNGQ6pmTdGg-1; Wed, 11 Oct 2023 17:19:12 -0400
X-MC-Unique: WroYPN1MPp6pNGQ6pmTdGg-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-774335cb98cso31643185a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 14:19:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697059151; x=1697663951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ARFU5ehJ77LMWQGx5SDRsMXLUYL9Q8sCSHPYnJI9hQ=;
        b=WZxBMrGNEild34hkke8pBHCxEDElmvWKz71mbJvq3pJrxQ66qKu5SXpGSRaxH75Hpy
         CoWqq+hIWsdL4TCgomgdrI6diDDdXA8jAyOXs0H8NRoTFBuF8BtAx8/cPNOd0iySbylw
         IWQHRkAMofCCzOUNWw2vqLJ6bexAWhcQYTyC3ZXTCBMVfR16BOnE6zbnfqpFNh3sfNBP
         yooJHpwHpE/Tux/wy0ePEFfDGC3pdL8vEaHg/GxEeTfiI//PFA1x7cYhO+o2CSe1vwTX
         +apwygBTnBz4naUO58udcx5HwPfKgZdga2raCVGmA+lXVc8cAUAxUWgXpkIRCUYc2osC
         4QRw==
X-Gm-Message-State: AOJu0YyIlyJd5UkOsQmLAXjTKRt8eUwkqbxg2mb4hYmJ3I3N34+K37OE
        +LD7C4iG/8Tic8GVSevTEEMPYZjamk5yNgsnnoTHP43aNW5TUQuZ5/4MN7liZdeogMeLuRPByns
        Lxe7bnvajwEKV/ENpik3HfjfpBLklgHM0ow==
X-Received: by 2002:a05:620a:24c8:b0:775:9025:c18a with SMTP id m8-20020a05620a24c800b007759025c18amr25845158qkn.35.1697059151244;
        Wed, 11 Oct 2023 14:19:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYryp37Si/mOVFiRWp6KQ4xbl+Cq9cO+Og0eIcqwKiNzWhUHZVCxvChfEaZVnlkhQdnFD5mQ==
X-Received: by 2002:a05:620a:24c8:b0:775:9025:c18a with SMTP id m8-20020a05620a24c800b007759025c18amr25845136qkn.35.1697059150956;
        Wed, 11 Oct 2023 14:19:10 -0700 (PDT)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id y23-20020a37e317000000b00767da9b6ae9sm5493487qki.11.2023.10.11.14.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 14:19:10 -0700 (PDT)
Date:   Wed, 11 Oct 2023 16:19:08 -0500
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
Subject: Re: [PATCH v3 14/15] firmware: qcom: scm: clarify the comment in
 qcom_scm_pas_init_image()
Message-ID: <gnwwzwtxwsvetldugl4h6muoki7gleqbyfrx7jve7lx52p7xde@5kfhsgrbnynn>
References: <20231009153427.20951-1-brgl@bgdev.pl>
 <20231009153427.20951-15-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009153427.20951-15-brgl@bgdev.pl>
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 09, 2023 at 05:34:26PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The "memory protection" mechanism mentioned in the comment is the SHM
> Bridge. This is also the reason why we do not convert this call to using
> the TM mem allocator.

s/TM/TZ/ ?

> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 839773270a21..8a2475ced10a 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -563,9 +563,13 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>  	struct qcom_scm_res res;
>  
>  	/*
> -	 * During the scm call memory protection will be enabled for the meta
> -	 * data blob, so make sure it's physically contiguous, 4K aligned and
> -	 * non-cachable to avoid XPU violations.
> +	 * During the SCM call the TrustZone will make the buffer containing
> +	 * the program data into an SHM Bridge. This is why we exceptionally
> +	 * must not use the TrustZone memory allocator here as - depending on
> +	 * Kconfig - it may already use the SHM Bridge mechanism internally.
> +	 *
> +	 * If we pass a buffer that is already part of an SHM Bridge to this
> +	 * call, it will fail.

I can at least confirm this matches my testing results in v2, fwiw.

I guess you could use the Kconfig and conditionally use the TZ mem
allocator if !SHMBridge, but I don't know if its worth the if statements
or not.

Bummer, I can't think of a beautiful way to unify this outside of a
dedicated non SHM bridge pool for this...

>  	 */
>  	mdata_buf = dma_alloc_coherent(__scm->dev, size, &mdata_phys,
>  				       GFP_KERNEL);
> -- 
> 2.39.2
> 

