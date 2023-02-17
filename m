Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CECA769B30B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Feb 2023 20:27:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbjBQT1f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Feb 2023 14:27:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbjBQT1e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Feb 2023 14:27:34 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45D3A54D07
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 11:27:31 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id u22so3002934lfu.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 11:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uz2NfAEd2XkSCNRQ0Cf2XIdNUS8EOfOGf8nMWffaQ6Q=;
        b=d8h28w+I6SaFghHGKq+rueegFnR+ak53o/B3WvB2zWmqlH5UWwKKSlZzEbB6UCC9Q8
         lrz6drQc/xqMILvPXvdkbhCsH/twBoIb+7fthXlkQ7Re+sLWeitp2ElSFBa2fiMMsY9v
         A/vAdjDrS/aFoMTSF1omukRYs6PzHa9JOyg/lcvNKVcN12Ut2Rnu5S/fIjdXVcn3nuMJ
         alkkS+dgib4dnF/StRXh0Ben1uhMsJfN/nTWAD7ySGTWRXM2qpiN467ogYm6DCqVC6gh
         sKA+m77UlB53UFOSHOELKKLZSAjpBANhMzeldJMiCI9Ue78LrH/ZJ5zRv3sGytmAzhHu
         OjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uz2NfAEd2XkSCNRQ0Cf2XIdNUS8EOfOGf8nMWffaQ6Q=;
        b=gty3dCADqDWQJDU69v6+hxDJECC60l4qJAl6oAEsy+fLGPTtusFwbVoFNzsbJH1Mv8
         ElhwzbFDRnz3FsyKnabyL6khGJmiz8iWwb+zbFyijBdiK/76yvn7EUqpTs2p+Qq3VMsJ
         1TU1nvWaFg1LRDfksazr1RelRaE3m2Fs0T+ItihTNUST9RFkG4yHtFeoO9YU5TJyByd0
         /8qYtKctK91R4KE8Ad+gtyIBN+n6//gBJTxcE+0+Vr9eYfXT8mAB+KuN3teN6F3x0vAh
         oneX6jg5JoexrhGnGEIHAInM0qQomfs2+kWhCkY5VKh42CiYf3jablqTxXNWLRVo0z0o
         mhUQ==
X-Gm-Message-State: AO0yUKUVk/JY/cQX9nt5uRW+RdvhvSHip4e69w69ecVsTpPbyz0zPjh5
        qpMLZz7Zd21yiGRXJgM1hnThrA==
X-Google-Smtp-Source: AK7set8po41TbrO5+K/Ju564LVcLTspHRQuEEAXux8d9kPVKEbPt65ERSGOUom1RfUxQDA62SFqMtw==
X-Received: by 2002:ac2:41ca:0:b0:4b4:89a9:6bfd with SMTP id d10-20020ac241ca000000b004b489a96bfdmr74067lfi.7.1676662049482;
        Fri, 17 Feb 2023 11:27:29 -0800 (PST)
Received: from [192.168.1.101] (abxh184.neoplus.adsl.tpnet.pl. [83.9.1.184])
        by smtp.gmail.com with ESMTPSA id q17-20020ac25151000000b004b57bbaef87sm759621lfd.224.2023.02.17.11.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 11:27:28 -0800 (PST)
Message-ID: <8c4f1cc8-c1f8-06b6-53fe-7507d74ca958@linaro.org>
Date:   Fri, 17 Feb 2023 20:27:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v5 08/10] interconnect: qcom: msm8996: Specify no bus
 clock scaling on A0NoC
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Jun Nie <jun.nie@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Brian Masney <masneyb@onstation.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230217-topic-icc-fixes-v5-v5-0-c9a550f9fdb9@linaro.org>
 <20230217-topic-icc-fixes-v5-v5-8-c9a550f9fdb9@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230217-topic-icc-fixes-v5-v5-8-c9a550f9fdb9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.02.2023 11:46, Konrad Dybcio wrote:
> A0NoC only does bus scaling through RPM votes and does not have any
> ICC clocks. Describe this.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
This is bad, as devm_clk_get_bulk{"", _optional} doesn't
check if num_clocks makes sense and passes "-1" down the
devres alloc chain..

I'll rework this for the next revision by simply assigning
the common "bus", "bus_a" set everywhere instead of relying
on it being there by default..

Konrad
>  drivers/interconnect/qcom/msm8996.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/interconnect/qcom/msm8996.c b/drivers/interconnect/qcom/msm8996.c
> index 1a5e0ad36cc4..45eb8675fb11 100644
> --- a/drivers/interconnect/qcom/msm8996.c
> +++ b/drivers/interconnect/qcom/msm8996.c
> @@ -1817,6 +1817,7 @@ static const struct qcom_icc_desc msm8996_a0noc = {
>  	.type = QCOM_ICC_NOC,
>  	.nodes = a0noc_nodes,
>  	.num_nodes = ARRAY_SIZE(a0noc_nodes),
> +	.num_bus_clocks = -1, /* No bus clock scaling */
>  	.intf_clocks = a0noc_intf_clocks,
>  	.num_intf_clocks = ARRAY_SIZE(a0noc_intf_clocks),
>  	.has_bus_pd = true,
> 
