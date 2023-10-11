Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB0FA7C5EEF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 23:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233481AbjJKVPW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 17:15:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231912AbjJKVPV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 17:15:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAB48A9
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 14:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697058877;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=q1KVk9ogiduHSj1YLdU62EA0hMWIK2Rnbi2BDgC0/6c=;
        b=XFHCOaoMIQ5Jkvacf8HgT6QymeYJUzce+6YhsKZfuumgugz/47OBTm95a37NdtEqJ1hcQC
        z/cS+GhHPP+pARK/DsHY+MRBYl9nuVqkWXjqKS6Nv1wnqRvFecDVW3eEHfYvydlK9CXJ7B
        qg2Q7b0l08kspcawptdaeM0Fny6Dk2s=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-uey-HQSoPhi-81u409BPbA-1; Wed, 11 Oct 2023 17:14:35 -0400
X-MC-Unique: uey-HQSoPhi-81u409BPbA-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-66cf38c6d97so2616296d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 14:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697058875; x=1697663675;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1KVk9ogiduHSj1YLdU62EA0hMWIK2Rnbi2BDgC0/6c=;
        b=JlA7Slze7KxC8YwIoohcyRXu5rLB/NIfDo8Z428CeERDOm1yAH1X5EjLLfJQh75TI+
         4C6vc1zKU1Ly4Yt/HXMCYfHBqswEv4naHBZBj950avaVsIN0nbSTJsFMYCNiy1KEKsTX
         xDwqOxJi8khl4xXyI3lVilfS9AuqH4L5IWUHiaovOMwjFrcA7JoQuFyLd5Q98MhGo1tZ
         IgH2CR34WXytlyUl9nNeLsPM2sekC69aoWBT4qJWoTlqSM7XqwOZBWsP8sehWPt4Jf1P
         Ym0MW8ocD/jLLkc5b5Rqoyrwpbp3R8cwI0F0RmN99yo9PkChbtrXxmML2bFTKUjphC+s
         cz1Q==
X-Gm-Message-State: AOJu0YxD70tce2Ew8hiOE4D9tKB302LVT5rF+2DSJC8VhIUP2Z2JB3rw
        TZ126DWlCRz+wBGOKFSX2vvtF6RSiX4ekljwI/65t8FOOobYYn9kNlZBpWAEY5ETzsgCy4ZbzTw
        cv8QAa2TelaHRU4YlEOCGdfiwFg6kR/bOJg==
X-Received: by 2002:a05:6214:29e5:b0:66d:132b:1c96 with SMTP id jv5-20020a05621429e500b0066d132b1c96mr259834qvb.28.1697058874930;
        Wed, 11 Oct 2023 14:14:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsnLbiaKP7Wfp/etk2peqwvyRGGC13O75tTXWZ2+u8ZqBEXIg/SzoYmUfjGWR7gq5YrQUrWQ==
X-Received: by 2002:a05:6214:29e5:b0:66d:132b:1c96 with SMTP id jv5-20020a05621429e500b0066d132b1c96mr259818qvb.28.1697058874644;
        Wed, 11 Oct 2023 14:14:34 -0700 (PDT)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id z14-20020a0cf24e000000b0064f4e0b2089sm5958669qvl.33.2023.10.11.14.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 14:14:34 -0700 (PDT)
Date:   Wed, 11 Oct 2023 16:14:32 -0500
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
Subject: Re: [PATCH v3 13/15] firmware: qcom: tzmem: enable SHM Bridge support
Message-ID: <fr4jwbacvcheqtxy6php2u6wr72mqm5hgat6xwmxhijee7j6sk@azlu42eod6b4>
References: <20231009153427.20951-1-brgl@bgdev.pl>
 <20231009153427.20951-14-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009153427.20951-14-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 09, 2023 at 05:34:25PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add a new Kconfig option for selecting the SHM Bridge mode of operation
> for the TrustZone memory allocator.
> 
> If enabled at build-time, it will still be checked for availability at
> run-time. If the architecture doesn't support SHM Bridge, the allocator
> will work just like in the default mode.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/firmware/qcom/Kconfig      | 10 +++++
>  drivers/firmware/qcom/qcom_tzmem.c | 67 +++++++++++++++++++++++++++++-
>  2 files changed, 76 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
> index 237da40de832..e01407e31ae4 100644
> --- a/drivers/firmware/qcom/Kconfig
> +++ b/drivers/firmware/qcom/Kconfig
> @@ -27,6 +27,16 @@ config QCOM_TZMEM_MODE_DEFAULT
>  	  Use the default allocator mode. The memory is page-aligned, non-cachable
>  	  and contiguous.
>  
> +config QCOM_TZMEM_MODE_SHMBRIDGE
> +	bool "SHM Bridge"
> +	help
> +	  Use Qualcomm Shared Memory Bridge. The memory has the same alignment as
> +	  in the 'Default' allocator but is also explicitly marked as an SHM Bridge
> +	  buffer.
> +
> +	  With this selected, all buffers passed to the TrustZone must be allocated
> +	  using the TZMem allocator or else the TrustZone will refuse to use them.
> +
>  endchoice
>  
>  config QCOM_SCM_DOWNLOAD_MODE_DEFAULT
> diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
> index eee51fed756e..b3137844fe43 100644
> --- a/drivers/firmware/qcom/qcom_tzmem.c
> +++ b/drivers/firmware/qcom/qcom_tzmem.c
> @@ -55,7 +55,72 @@ static void qcom_tzmem_cleanup_pool(struct qcom_tzmem_pool *pool)
>  
>  }
>  
> -#endif /* CONFIG_QCOM_TZMEM_MODE_DEFAULT */
> +#elif IS_ENABLED(CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE)
> +
> +#include <linux/firmware/qcom/qcom_scm.h>
> +
> +#define QCOM_SHM_BRIDGE_NUM_VM_SHIFT 9
> +
> +static bool qcom_tzmem_using_shm_bridge;
> +
> +static int qcom_tzmem_init(void)
> +{
> +	int ret;
> +
> +	ret = qcom_scm_shm_bridge_enable();
> +	if (ret == -EOPNOTSUPP) {
> +		dev_info(qcom_tzmem_dev, "SHM Bridge not supported\n");
> +		ret = 0;
> +	}
> +
> +	if (!ret)
> +		qcom_tzmem_using_shm_bridge = true;

Does the qcom_scm_shm_bridge_enable() returning -EOPNOTSUPP case make
sense? Setting ret to 0 and then claiming we're using shm_bridge seems
wrong to me.

> +
> +	return ret;
> +}
> +
> +static int qcom_tzmem_init_pool(struct qcom_tzmem_pool *pool)
> +{
> +	u64 pfn_and_ns_perm, ipfn_and_s_perm, size_and_flags, ns_perms, *handle;
> +	int ret;
> +
> +	if (!qcom_tzmem_using_shm_bridge)
> +		return 0;
> +
> +	ns_perms = (QCOM_SCM_PERM_WRITE | QCOM_SCM_PERM_READ);
> +	pfn_and_ns_perm = (u64)pool->pbase | ns_perms;
> +	ipfn_and_s_perm = (u64)pool->pbase | ns_perms;
> +	size_and_flags = pool->size | (1 << QCOM_SHM_BRIDGE_NUM_VM_SHIFT);

Is there any sanity checking that can be done here? I assume bits 0-11 are all
flag fields (or at least unrelated to size which I assume at a minimum
must be 4k aka bit 12).

> +
> +	handle = kzalloc(sizeof(*handle), GFP_KERNEL);

Consider __free(kfree) + return_ptr() usage?

> +	if (!handle)
> +		return -ENOMEM;
> +
> +	ret = qcom_scm_shm_bridge_create(qcom_tzmem_dev, pfn_and_ns_perm,
> +					 ipfn_and_s_perm, size_and_flags,
> +					 QCOM_SCM_VMID_HLOS, handle);
> +	if (ret) {
> +		kfree(handle);
> +		return ret;
> +	}
> +
> +	pool->priv = handle;
> +
> +	return 0;
> +}
> +
> +static void qcom_tzmem_cleanup_pool(struct qcom_tzmem_pool *pool)
> +{
> +	u64 *handle = pool->priv;
> +
> +	if (!qcom_tzmem_using_shm_bridge)
> +		return;
> +
> +	qcom_scm_shm_bridge_delete(qcom_tzmem_dev, *handle);
> +	kfree(handle);
> +}
> +
> +#endif /* CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE */
>  
>  /**
>   * qcom_tzmem_pool_new() - Create a new TZ memory pool.
> -- 
> 2.39.2
> 

