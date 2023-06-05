Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6415572305E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jun 2023 21:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236159AbjFETvX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Jun 2023 15:51:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236058AbjFETvK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Jun 2023 15:51:10 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9C29E44
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jun 2023 12:50:38 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-33b4552e55cso16138645ab.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jun 2023 12:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685994624; x=1688586624;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GpRhe2R0Es6IO0/dJ+FMneELYVcoyyiGXEcYyqBR1zU=;
        b=lxFaxaUW7Xtd/PdVCMFNnCcKWynLo7WvMj+7E+5Uwcr17Lq1HnUZwAsVch1NnmEobZ
         UkCEDe8ZKe+jmc9vpPb/AtaE6hoREmpr9fghJoLUyZW5vwiInanWyp6nigFGd7p6gQHr
         8qL55KpcEh7YhXBMIzCa0sPSgbkclWTzO+vOXMfdJ3O9rq/HUIwyGdJGiXuHV2I27MR/
         GL24iPlzvO4amOJXaErmeuUcPKezOIcKPAAC18Tas2V70q9GDUFEYIzEob7dViJMnon2
         og9KJMcklsG0WV68R5n2SoNPOV8a5ZCDzD/zJjpfde+5fsRNTDMXz8vhqCmqRZ0McTTW
         1bmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685994624; x=1688586624;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GpRhe2R0Es6IO0/dJ+FMneELYVcoyyiGXEcYyqBR1zU=;
        b=NLA5mcNbP2+7Y5HUE3RTmSp8XT5ZwEhIOr1CG5zDWDKyyMhAa7NOCNuC6KvYTenBJ0
         /urk+s2DnY0MnVqEQD0j7x0K8W4A38jwHoYBeSA0P7rPcmrabZE8BjeDCnlqYjuK84Fc
         dQu6VtDa8ocs5izvfeGxC3CJDC4L5kBaf6PODFKSPC8VwzTU1ncTT1feMMfwnUnJVxXU
         NbFxptWGPYacR7PaLdeMhdtq+BucEcPeT90nS3Qu0XUFAknNar3qG6cHPyMQK/NlMw2F
         /DX3fnVqdRBWofoVGP4IT5ptV9sYst+eShOOFhPMiwBhQMlX0YkZeF+/7B7MWVDeZWQp
         AW6Q==
X-Gm-Message-State: AC+VfDywgYCLy9d8wvqQybbjGvZVZGMWlfJiui3l8TYQgW+470EvoJxI
        KwVx/Umgt3Er6WjdjphnSB33DQ==
X-Google-Smtp-Source: ACHHUZ7n6MVykFwFl4isVQ33tqsrNUEVf4D707qBep/3JqJhjnxPuhPyFAXg1/aDmVtrF3jwk3jcZA==
X-Received: by 2002:a05:6e02:1152:b0:338:1382:ad12 with SMTP id o18-20020a056e02115200b003381382ad12mr340250ill.11.1685994624495;
        Mon, 05 Jun 2023 12:50:24 -0700 (PDT)
Received: from [172.22.22.28] ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id f19-20020a056638119300b0040fad79ac08sm2382351jas.89.2023.06.05.12.50.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 12:50:24 -0700 (PDT)
Message-ID: <c34b96cb-efc9-c6aa-78bf-4b1adc407254@linaro.org>
Date:   Mon, 5 Jun 2023 14:50:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From:   Alex Elder <elder@linaro.org>
Subject: Re: [PATCH v13 21/24] virt: gunyah: Add hypercalls for sending
 doorbell
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230509204801.2824351-1-quic_eberman@quicinc.com>
 <20230509204801.2824351-22-quic_eberman@quicinc.com>
Content-Language: en-US
In-Reply-To: <20230509204801.2824351-22-quic_eberman@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/9/23 3:47 PM, Elliot Berman wrote:
> Gunyah doorbells allow two virtual machines to signal each other using
> interrupts. Add the hypercalls needed to assert the interrupt.
> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>

Looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   arch/arm64/gunyah/gunyah_hypercall.c | 25 +++++++++++++++++++++++++
>   include/linux/gunyah.h               |  3 +++
>   2 files changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/gunyah/gunyah_hypercall.c b/arch/arm64/gunyah/gunyah_hypercall.c
> index 5f33f53e05a9..3d48c8650851 100644
> --- a/arch/arm64/gunyah/gunyah_hypercall.c
> +++ b/arch/arm64/gunyah/gunyah_hypercall.c
> @@ -33,6 +33,8 @@ EXPORT_SYMBOL_GPL(arch_is_gh_guest);
>   						   fn)
>   
>   #define GH_HYPERCALL_HYP_IDENTIFY		GH_HYPERCALL(0x8000)
> +#define GH_HYPERCALL_BELL_SEND			GH_HYPERCALL(0x8012)
> +#define GH_HYPERCALL_BELL_SET_MASK		GH_HYPERCALL(0x8015)
>   #define GH_HYPERCALL_MSGQ_SEND			GH_HYPERCALL(0x801B)
>   #define GH_HYPERCALL_MSGQ_RECV			GH_HYPERCALL(0x801C)
>   #define GH_HYPERCALL_VCPU_RUN			GH_HYPERCALL(0x8065)
> @@ -55,6 +57,29 @@ void gh_hypercall_hyp_identify(struct gh_hypercall_hyp_identify_resp *hyp_identi
>   }
>   EXPORT_SYMBOL_GPL(gh_hypercall_hyp_identify);
>   
> +enum gh_error gh_hypercall_bell_send(u64 capid, u64 new_flags, u64 *old_flags)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_1_1_hvc(GH_HYPERCALL_BELL_SEND, capid, new_flags, 0, &res);
> +
> +	if (res.a0 == GH_ERROR_OK && old_flags)
> +		*old_flags = res.a1;
> +
> +	return res.a0;
> +}
> +EXPORT_SYMBOL_GPL(gh_hypercall_bell_send);
> +
> +enum gh_error gh_hypercall_bell_set_mask(u64 capid, u64 enable_mask, u64 ack_mask)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_1_1_hvc(GH_HYPERCALL_BELL_SET_MASK, capid, enable_mask, ack_mask, 0, &res);
> +
> +	return res.a0;
> +}
> +EXPORT_SYMBOL_GPL(gh_hypercall_bell_set_mask);
> +
>   enum gh_error gh_hypercall_msgq_send(u64 capid, size_t size, void *buff, u64 tx_flags, bool *ready)
>   {
>   	struct arm_smccc_res res;
> diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
> index cd5704a82c6a..1f1685518bf3 100644
> --- a/include/linux/gunyah.h
> +++ b/include/linux/gunyah.h
> @@ -171,6 +171,9 @@ static inline u16 gh_api_version(const struct gh_hypercall_hyp_identify_resp *gh
>   
>   void gh_hypercall_hyp_identify(struct gh_hypercall_hyp_identify_resp *hyp_identity);
>   
> +enum gh_error gh_hypercall_bell_send(u64 capid, u64 new_flags, u64 *old_flags);
> +enum gh_error gh_hypercall_bell_set_mask(u64 capid, u64 enable_mask, u64 ack_mask);
> +
>   #define GH_HYPERCALL_MSGQ_TX_FLAGS_PUSH		BIT(0)
>   
>   enum gh_error gh_hypercall_msgq_send(u64 capid, size_t size, void *buff, u64 tx_flags, bool *ready);

