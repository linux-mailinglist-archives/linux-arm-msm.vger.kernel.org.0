Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E51FD7C8793
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Oct 2023 16:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbjJMON6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Oct 2023 10:13:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232098AbjJMONy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Oct 2023 10:13:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23B78BE
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Oct 2023 07:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697206384;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kKNl2Sg2UX0CqarnGytCYre/GJvG3BPZJr1PClqG+q8=;
        b=Dop6Za+NFPF6Ia1wW+OdP8O/RBEmhiewnLeUD8XvauYXAQNaQOB8Kd3xuljQVslV8XkKsr
        QmJ2AjFS98JSGwR50u90BcKXaDMP5zJtIud9pnBmlLcWwgEU2uzsdSMa4eWSvwMnCk0JOQ
        Xss5Y7y9FZ5C7wKOJ962rfP5tU4a0+g=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-aSVK8pJ3MxKxu9T0RGxFwA-1; Fri, 13 Oct 2023 10:13:03 -0400
X-MC-Unique: aSVK8pJ3MxKxu9T0RGxFwA-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-77410b85b63so248662885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Oct 2023 07:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697206381; x=1697811181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKNl2Sg2UX0CqarnGytCYre/GJvG3BPZJr1PClqG+q8=;
        b=ClJMByQDkQKk3JuUPGNBaBFrmsq5xf5enb8lUJrc+C5231x0mc+Kn5NMpfGIclPtsR
         Rl9BV5xzxl3SKDQ8e84VFM6yht0Mx2iBSnuMyyadKEhz52JFiTU6mL7y7wHH9JTki82f
         s0BLVmtqEVT7a2Q1qEeQh7cqQLmIt4bp8YPmmkxzOIS/dCXWAiX3TcXDbiyF5FXq164r
         EqkTNeDnueCgLZCq/i8Tb25D6HBPDZV2/l8gDfHQv4w4zZYFqS+RyDlmfHPVWA+vOSo9
         xs9fXQxyvXRlZEczJenN/l5QBHMWNHbGX7Lh3Gd3I+/oNJkZ7rDaQpWU+Uax6dTBxIp5
         ljNQ==
X-Gm-Message-State: AOJu0YzGhWEvRDRKA5qQ/3M6GcxSw0hHvZQxJbLXt/p4G9VRAGyb0jUX
        s7EyPIm0l1+wMeo6tEteRQhlWnfygNueXEQJrhF6elIyLgjJqxNOqlyh+pRZHRN4CoSFMhBRzbA
        UNtT/snb01mcnsPSayvSgdzAxeFlISFpeQA==
X-Received: by 2002:a05:620a:678:b0:775:446b:860c with SMTP id a24-20020a05620a067800b00775446b860cmr24362153qkh.70.1697206381092;
        Fri, 13 Oct 2023 07:13:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqkGP62nYlBuY9GJD/TlSdNVRzWia8Fmh8r5TKl8mwE54TuKEbSE0dwsTqU6pAhQhwqm3L+w==
X-Received: by 2002:a05:620a:678:b0:775:446b:860c with SMTP id a24-20020a05620a067800b00775446b860cmr24362136qkh.70.1697206380802;
        Fri, 13 Oct 2023 07:13:00 -0700 (PDT)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id y10-20020a37e30a000000b0076dae4753efsm662404qki.14.2023.10.13.07.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 07:13:00 -0700 (PDT)
Date:   Fri, 13 Oct 2023 09:12:58 -0500
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
Subject: Re: [PATCH v4 13/15] firmware: qcom: tzmem: enable SHM Bridge support
Message-ID: <ny6snvytcdycxsqhtodbped3xgwfasjp6cubbpmgfa6uxrqmp4@lbmc3i2pgmvl>
References: <20231013114843.63205-1-brgl@bgdev.pl>
 <20231013114843.63205-14-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013114843.63205-14-brgl@bgdev.pl>
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

On Fri, Oct 13, 2023 at 01:48:41PM +0200, Bartosz Golaszewski wrote:
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
>  drivers/firmware/qcom/qcom_tzmem.c | 65 +++++++++++++++++++++++++++++-
>  2 files changed, 74 insertions(+), 1 deletion(-)
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
> index 68ca59c5598e..6c4f29a00f26 100644
> --- a/drivers/firmware/qcom/qcom_tzmem.c
> +++ b/drivers/firmware/qcom/qcom_tzmem.c
> @@ -55,7 +55,70 @@ static void qcom_tzmem_cleanup_pool(struct qcom_tzmem_pool *pool)
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
> +
> +	return ret;
> +}

Restating the comment we just concluded on in v3 (just to make it
obvious for other reviewers), the -EOPNOTSUPP
case here should probably return 0, not ret = 0, otherwise we'll try to
use SHM bridge on memory later even though it is not supported:

https://lore.kernel.org/linux-arm-msm/20231009153427.20951-1-brgl@bgdev.pl/T/#m175bd35782cb5824820977bb3f799b32e32fb2d7

> +
> +static int qcom_tzmem_init_pool(struct qcom_tzmem_pool *pool)
> +{
> +	u64 pfn_and_ns_perm, ipfn_and_s_perm, size_and_flags, ns_perms;
> +	int ret;
> +
> +	if (!qcom_tzmem_using_shm_bridge)
> +		return 0;
> +
> +	ns_perms = (QCOM_SCM_PERM_WRITE | QCOM_SCM_PERM_READ);
> +	pfn_and_ns_perm = (u64)pool->pbase | ns_perms;
> +	ipfn_and_s_perm = (u64)pool->pbase | ns_perms;
> +	size_and_flags = pool->size | (1 << QCOM_SHM_BRIDGE_NUM_VM_SHIFT);
> +
> +	u64 *handle __free(kfree) = kzalloc(sizeof(*handle), GFP_KERNEL);
> +	if (!handle)
> +		return -ENOMEM;
> +
> +	ret = qcom_scm_shm_bridge_create(qcom_tzmem_dev, pfn_and_ns_perm,
> +					 ipfn_and_s_perm, size_and_flags,
> +					 QCOM_SCM_VMID_HLOS, handle);
> +	if (ret)
> +		return ret;
> +
> +	pool->priv = no_free_ptr(handle);
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

