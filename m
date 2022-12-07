Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0402C645B4C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 14:48:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbiLGNs4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 08:48:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230041AbiLGNsx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 08:48:53 -0500
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AD785B842
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 05:48:47 -0800 (PST)
Received: by mail-qv1-xf2f.google.com with SMTP id i12so12648484qvs.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Dec 2022 05:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ZzHuTL0EtZeh+R7IjGoXDKYn6dvXXdudUC+a1HhvBE=;
        b=GfykaJyevKLiyqHvJkYZJJbKPKIYQfD6u2LqTx1zaWr1xPUJjoTsI+8n2NPk2xjx92
         bYoTNQIPGmlaWUuFIxWNtftlfpGrUytEK8qAkb4U2hMXhY1+AiQ8pBbxuXNE+fIl8bLz
         c+HeYa5Uve2cszqvhi8db3G2nxnlED13fKPq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZzHuTL0EtZeh+R7IjGoXDKYn6dvXXdudUC+a1HhvBE=;
        b=Rgs4KkdQJ7fptHDH5VVokJqJwPMZpYQgKKsYatE7i9tA19y+T/NCx4dmKFm2PLDam5
         +PznRU2VwV7CCtSRwbJi7w4zWn/sTYAIF14WMmDI2PGUdpcGq41Zl5jYXk7Gxt8P3eqR
         JGgNU0/vMMIt3NwpwEHKppzm5Rv1FEgowFoX7yg+CmGXKiyvW13WmGnmxs732h8Dj47v
         iVRAapkiPRGeWlpaaq8QHAI/N8ePsnbX1suMCtb/q4nqi38feTTXrU2Vyq+uX4pihnLj
         6EtlYl9YbnXf7bL7sgq4g/mRR0e2PXwtBsrclBevyk6eCRny30ZfNYBOF/Tf/EyuOpvf
         B52A==
X-Gm-Message-State: ANoB5pnele8vAxB/XckgO77sfkcq8IajMgga1uze5j3Ow5bN760FOYB0
        U8JIA5uqYuMeiHecZRmaQzpiKQ==
X-Google-Smtp-Source: AA0mqf6Lgah4XZve+qCLwWCJxlzcmmgX5suo5xvm6rn8bqNaXZxkQTub0t0JbyWXQYucMCm3Jrucbg==
X-Received: by 2002:a0c:9c47:0:b0:4b7:5b6f:2b7a with SMTP id w7-20020a0c9c47000000b004b75b6f2b7amr64855921qve.26.1670420926322;
        Wed, 07 Dec 2022 05:48:46 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id w7-20020ac843c7000000b003a7e2aea23esm6227379qtn.86.2022.12.07.05.48.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 05:48:45 -0800 (PST)
Message-ID: <b0b209e5-0440-fa40-adbb-e0fa4ec08e91@ieee.org>
Date:   Wed, 7 Dec 2022 07:48:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 03/18] clk: qcom: smd-rpm: remove duplication between
 qcs404 and qcm2290 clocks
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
 <20221207001503.93790-4-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@ieee.org>
In-Reply-To: <20221207001503.93790-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/6/22 6:14 PM, Dmitry Baryshkov wrote:
> Reuse qcs404's QPIC and BIMC_GPU clock for qcm2290.
> 
> Fixes: 78b727d02815 ("clk: qcom: smd-rpm: Add QCM2290 RPM clock support")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index ccc54913eca5..31ef6345ff01 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -1168,11 +1168,8 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6375 = {
>   DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, ln_bb_clk2, ln_bb_clk2_a, 0x2, 19200000);
>   DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, rf_clk3, rf_clk3_a, 6, 38400000);
>   
> -DEFINE_CLK_SMD_RPM(qcm2290, qpic_clk, qpic_a_clk, QCOM_SMD_RPM_QPIC_CLK, 0);
>   DEFINE_CLK_SMD_RPM(qcm2290, cpuss_gnoc_clk, cpuss_gnoc_a_clk,
>   		   QCOM_SMD_RPM_MEM_CLK, 1);
> -DEFINE_CLK_SMD_RPM(qcm2290, bimc_gpu_clk, bimc_gpu_a_clk,
> -		   QCOM_SMD_RPM_MEM_CLK, 2);
>   
>   static struct clk_smd_rpm *qcm2290_clks[] = {
>   	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
> @@ -1203,14 +1200,14 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
>   	[RPM_SMD_SNOC_LPASS_A_CLK] = &sm6125_snoc_lpass_a_clk,
>   	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
>   	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
> -	[RPM_SMD_QPIC_CLK] = &qcm2290_qpic_clk,
> -	[RPM_SMD_QPIC_CLK_A] = &qcm2290_qpic_a_clk,
> +	[RPM_SMD_QPIC_CLK] = &qcs404_qpic_clk,
> +	[RPM_SMD_QPIC_CLK_A] = &qcs404_qpic_a_clk,
>   	[RPM_SMD_HWKM_CLK] = &qcm2290_hwkm_clk,
>   	[RPM_SMD_HWKM_A_CLK] = &qcm2290_hwkm_a_clk,
>   	[RPM_SMD_PKA_CLK] = &qcm2290_pka_clk,
>   	[RPM_SMD_PKA_A_CLK] = &qcm2290_pka_a_clk,
> -	[RPM_SMD_BIMC_GPU_CLK] = &qcm2290_bimc_gpu_clk,
> -	[RPM_SMD_BIMC_GPU_A_CLK] = &qcm2290_bimc_gpu_a_clk,
> +	[RPM_SMD_BIMC_GPU_CLK] = &qcs404_bimc_gpu_clk,
> +	[RPM_SMD_BIMC_GPU_A_CLK] = &qcs404_bimc_gpu_a_clk,
>   	[RPM_SMD_CPUSS_GNOC_CLK] = &qcm2290_cpuss_gnoc_clk,
>   	[RPM_SMD_CPUSS_GNOC_A_CLK] = &qcm2290_cpuss_gnoc_a_clk,
>   };

