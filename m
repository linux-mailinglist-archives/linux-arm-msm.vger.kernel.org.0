Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44B296ABBB3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 11:20:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbjCFKUH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 05:20:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbjCFKTc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 05:19:32 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FDE725977
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 02:19:07 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id b13so9049678ljf.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 02:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678097946;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sBPw0rQ1KHnBVHCMwgN148s0j1A+T76NoGZG/pqJxXg=;
        b=mgUeRaZXfqos8jF+M8PG7iqQCB/QSoc4/PdekT8nfIRY3eB96bM+IVp5jFKYylP0KW
         oyBgYeCJ0rVuZfLOWSmSw78p5NHyICI25/njxNo8Jwm4+MgrXJz+tdtWSdJ/hmCKsdQK
         aq2YnSScpMbSankxblgDsLZZ9ojAQ5qEP21krONy1Ej0F4bSEvri47nxSrQHWq9U5xty
         Cg0dewqfRKpvKBnjUikbiaznfby4ejo7B8FZF827ivPGHV1puwqRDeg+n0Jgny3y73w8
         +be3FNFp83RUl8vGRLxoTCmcoUc8UoQLjk/qg3kUh5EJpadOc35dix5GdPeKiZDfJRh6
         YBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678097946;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sBPw0rQ1KHnBVHCMwgN148s0j1A+T76NoGZG/pqJxXg=;
        b=o8gYMHD8dONK14jsyprYUPgR0avhiW1pThWNsLDT2X3nSUGRgw4JLAMeI1UiFWkGAv
         ds24awb4JfM7IFQNvV9nW6hg+vCyqU2w6imINF/h40igyZU8E1kglQgiXTmuyjn2XTuS
         ReHI6U1wiaguiBOoUErsfvI7yBzlsLjbd7LMq8Lvpn1pvVj5S1EvTfGn2VF4J84DhnH5
         VtS6MwvLdNDcl5+fxeAxDOmDH1n61fnZeelVjLATc7Ko7fIFBdsgNbQT8T2DBOgBmS2l
         /Q/0TQHypX/uxvifVaM6DanCwUkAq1vv+RgPBGV1k0ghqRe+EIP6iO0LynaccLMpA25I
         6TMw==
X-Gm-Message-State: AO0yUKU7lurDxTNx+ENWWnTwYcEKClC+it4s29yrjfet2mv+gCBgUZ0w
        CLeD+1h2uHKBPmCaDZpoHPbPrg==
X-Google-Smtp-Source: AK7set8eQ42jEM8H4wun5gv6a2vRMqhWZNbcyF4RkJ4/shjL2KDi75U+oW+ealICR4rfD2HlXuRWAA==
X-Received: by 2002:a2e:91cf:0:b0:295:8c04:8205 with SMTP id u15-20020a2e91cf000000b002958c048205mr3229095ljg.41.1678097946259;
        Mon, 06 Mar 2023 02:19:06 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id u10-20020ac251ca000000b004b4b600c093sm1592568lfm.92.2023.03.06.02.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 02:19:05 -0800 (PST)
Message-ID: <069ef490-6d50-2e1a-ea01-3c40f829b7fe@linaro.org>
Date:   Mon, 6 Mar 2023 11:19:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] soc: qcom: rmtfs: handle optional qcom,vmid correctly
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230305-rmtfs-vmid-fix-v1-0-6a7206081602@z3ntu.xyz>
 <20230305-rmtfs-vmid-fix-v1-2-6a7206081602@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230305-rmtfs-vmid-fix-v1-2-6a7206081602@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5.03.2023 11:32, Luca Weiss wrote:
> Older platforms don't have qcom,vmid set
Ugh, "evolution" :P

, handle -EINVAL return value
> correctly. And since num_vmids is passed to of_property_read_u32_array
> later we should make sure it has a sane value before continuing.
> 
> Fixes: e656cd0bcf3d ("soc: qcom: rmtfs: Optionally map RMTFS to more VMs")
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
This needs to be sanctioned by bindings, (i.e. if !oldplatform
require qcom,vmid), as without this property new ones will simply
lock up..

But this change is correct on its own

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/soc/qcom/rmtfs_mem.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/rmtfs_mem.c b/drivers/soc/qcom/rmtfs_mem.c
> index 218397ab0c36f..fb6e4def8c78b 100644
> --- a/drivers/soc/qcom/rmtfs_mem.c
> +++ b/drivers/soc/qcom/rmtfs_mem.c
> @@ -229,7 +229,10 @@ static int qcom_rmtfs_mem_probe(struct platform_device *pdev)
>  	}
>  
>  	num_vmids = of_property_count_u32_elems(node, "qcom,vmid");
> -	if (num_vmids < 0) {
> +	if (num_vmids == -EINVAL) {
> +		/* qcom,vmid is optional */
> +		num_vmids = 0;
> +	} else if (num_vmids < 0) {
>  		dev_err(&pdev->dev, "failed to count qcom,vmid elements: %d\n", num_vmids);
>  		goto remove_cdev;
>  	} else if (num_vmids > NUM_MAX_VMIDS) {
> 
