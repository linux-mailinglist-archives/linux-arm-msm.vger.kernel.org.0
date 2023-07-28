Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 656CF766B62
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jul 2023 13:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235336AbjG1LJj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 07:09:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234770AbjG1LJi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 07:09:38 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A1D271D
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 04:09:37 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fc0aecf15bso22136195e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 04:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690542575; x=1691147375;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N97CKLpKQle5aHF+jRMwZEB+J33cTGVCbmmUv5JcbaE=;
        b=wwv2jPvSfBya6TF/eA6QDrJ6pLMvp8lGy8013pkZZHOphLJ54z20l5g/E6BuFsN5IK
         wH3zHo6qtnTvl4doh6IyaShDnXwfeQbGNXzfmriuA99NA+FHLSuVBKzpqHD9lIJmqhrt
         RfwfLcBN3SRy0EtC3yAYWl1pn4I+qJPH4rDEOl0cStJx3IF0QcavIcW0xqPNRL1rqRm+
         5Z9B2vq4Q9vNqP/3Qx7tD1A4bfUXKYWU2mv/4KYHsT+NCtlOh4sSx8J/m2+VyoNd5IfU
         EsUYiUKpsR3Y2hoR5aelH1AUO/8MjCyHPpRFmxFOo1mCmEZ05a7wPDYswY8Fioj45Uer
         /4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690542575; x=1691147375;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N97CKLpKQle5aHF+jRMwZEB+J33cTGVCbmmUv5JcbaE=;
        b=gP/OV9mYLSnK/IGbs97SiB7qo8qjAd0y3T867THggXXDkTlWLRKSrm66z/RF9xCbip
         xkyDLQxj73R94KfOQshlpskULk/LLBG0IMKiR5e/YRnWyY6owl3Y4eWNt83WV5JH9Hb9
         bBJyC4K2GFp2ulCSHTmt7hcs4QB4RgOHI3yGEyaKJ3GK5TSkf8UkfDpGi7+HAPCdcp7X
         OHYuMx9wHXSYDNVGrfpYHQdefUnPVou4SWEkdR6ywRTeyY4VEwTuT58MBDPNAdMDesSS
         dnew5XTRwequH9Tmz+XT5pgRTQxngcrif34swLKxZwchnlnswMCxqM1JpgB8HmJg77fk
         FSZg==
X-Gm-Message-State: ABy/qLaH5IePaHv9PdbOCdQoNAeR92VP2SrRB+RVCfLoFEKDbELaZVWd
        kq7e874Q+lGBLI6KpqBR3DtIog==
X-Google-Smtp-Source: APBJJlFzvc37pRRumAOmPKcUhlCCFYO0XhE1TyXk7nTkgfKGx6isQVWUmOwqf+ElnSxybBY7I54VxQ==
X-Received: by 2002:adf:fa12:0:b0:30f:d218:584a with SMTP id m18-20020adffa12000000b0030fd218584amr1638207wrr.23.1690542575680;
        Fri, 28 Jul 2023 04:09:35 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id x7-20020adff647000000b00317731a6e07sm4512868wrp.62.2023.07.28.04.09.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 04:09:34 -0700 (PDT)
Message-ID: <ae085a82-24d6-acdf-acad-81265aa75e6b@linaro.org>
Date:   Fri, 28 Jul 2023 12:09:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] misc: fastrpc: Fix remote heap allocation request
Content-Language: en-US
To:     Ekansh Gupta <quic_ekangupt@quicinc.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ekangupt@qti.qualcomm.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com,
        stable <stable@kernel.org>
References: <1687529062-25988-1-git-send-email-quic_ekangupt@quicinc.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <1687529062-25988-1-git-send-email-quic_ekangupt@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 23/06/2023 15:04, Ekansh Gupta wrote:
> Remote heap is used by DSP audioPD on need basis. This memory is
> allocated from reserved CMA memory region and is then shared with
> audioPD to use it for it's functionality.
> 
> Current implementation of remote heap is not allocating the memory
> from CMA region, instead it is allocating the memory from SMMU
> context bank. The arguments passed to scm call for the reassignment
> of ownership is also not correct. Added changes to allocate CMA
> memory and have a proper ownership reassignment.
> 
> Fixes: 532ad70c6d44 ("misc: fastrpc: Add mmap request assigning for static PD pool")
> Cc: stable <stable@kernel.org>
> Tested-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
> Changes in v2:
>    - Removed redundant code
> 
>   drivers/misc/fastrpc.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 30d4d04..87a9096 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1866,7 +1866,11 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>   		return -EINVAL;
>   	}
>   
> -	err = fastrpc_buf_alloc(fl, fl->sctx->dev, req.size, &buf);
> +	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR)
> +		err = fastrpc_remote_heap_alloc(fl, dev, req.size, &buf);
> +	else
> +		err = fastrpc_buf_alloc(fl, dev, req.size, &buf);
> +
>   	if (err) {
>   		dev_err(dev, "failed to allocate buffer\n");
>   		return err;
> @@ -1905,12 +1909,10 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>   
>   	/* Add memory to static PD pool, protection thru hypervisor */
>   	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR && fl->cctx->vmcount) {
> -		struct qcom_scm_vmperm perm;
> +		u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
>   
we do not need this,  channel context sets perms to this value at probe, 
you could just reuse it.


> -		perm.vmid = QCOM_SCM_VMID_HLOS;
> -		perm.perm = QCOM_SCM_PERM_RWX;
> -		err = qcom_scm_assign_mem(buf->phys, buf->size,
> -			&fl->cctx->perms, &perm, 1);
> +		err = qcom_scm_assign_mem(buf->phys, (u64)buf->size,
> +			&src_perms, fl->cctx->vmperms, fl->cctx->vmcount);
>   		if (err) {
>   			dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d",
>   					buf->phys, buf->size, err);
