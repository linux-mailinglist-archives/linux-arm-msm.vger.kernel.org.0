Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 131AA671EC7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 15:03:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230525AbjARODs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 09:03:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231128AbjARODb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 09:03:31 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58B114490
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 05:38:55 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id mg12so10964368ejc.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 05:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GMyicKAXsPcwp39xMdPMj84Z2tS6+fCOTx1iONHicI0=;
        b=JsoV4hzVvX4mrFwIeAqbBnVbKCZrrucJOK4/ocJ0+pi88UBO8GcF5rCxuenNHRt8rX
         7jDFwNP7Uo/RUjO7IkTQs4XYUYRQAzjWSUseH4MoHdkRCim1JQcmqiOcXWBDqLLftep7
         bTK52zEXB/ry47JA43nLcMn2rY+/HXy92mjtvTH1NxiFbGgE8sUWnJNPhWV8MXfVwfiF
         bqd1i4qJ7up6l7lg9wK1m9NjcRIQTgBzkcYWxCZ5pr/b3IixXSkTAByegcHYi0RuKPHo
         5TVZty/wO4ijF20XaUSUWUjM/8dA17gq3YNmQ+fkDGz0em9deeE9csduZG5rNHLuHuuS
         RoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GMyicKAXsPcwp39xMdPMj84Z2tS6+fCOTx1iONHicI0=;
        b=waWCHKNqSR1UWVJdCRIKPUUwDDXLcgHlC/E6IYKG/IHmPF5lBQee/bOUPmctsUFsRX
         FsPDRUYa+D8f+2RDQbmiQJCiqb36HQnhl2Ftxp03wiHTQNYp1ndRLfccrAYDh1ChXOQH
         dpW08LTjryCzOrxOjhP95PAbDwR9l4M/EqNHHx5d1Th5s5MmMVcUGYupYawrMV1lJKdN
         PZDhrtwOp4ZO5+1bcVkaABDFXUKCPFYCIA7pn9WQFTuayfKbfRkxjccV+B8LeJwDVFRq
         xEfPfD6G0jOUrBx9hZn3HM9tYOQVXUavC/YWjfZ3Lo6s8LjvX/Ihe+zpgBtxC2lX3+mS
         pWCQ==
X-Gm-Message-State: AFqh2ko9HYzAK3G0l+JWh0MeKMA9/hQmAtrDMlBPJVTCErd3tyLoSqg9
        gtni1t5jAUduzdD54IxLvxRATQ==
X-Google-Smtp-Source: AMrXdXtV+LW0G/9CEyBapA4IhWCgkDDoft46dvN11AFEl7XN+4Q2Ymee5eSr6qDBMFvjZxXUQwfd6g==
X-Received: by 2002:a17:907:a092:b0:86d:c466:6b16 with SMTP id hu18-20020a170907a09200b0086dc4666b16mr7142893ejc.7.1674049133929;
        Wed, 18 Jan 2023 05:38:53 -0800 (PST)
Received: from [192.168.1.101] (abxh252.neoplus.adsl.tpnet.pl. [83.9.1.252])
        by smtp.gmail.com with ESMTPSA id q14-20020a1709066b0e00b0074134543f82sm14966677ejr.90.2023.01.18.05.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 05:38:53 -0800 (PST)
Message-ID: <403c0a2a-735e-f893-741a-b742118c9ba6@linaro.org>
Date:   Wed, 18 Jan 2023 14:38:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/7] clk: qcom: smd-rpm: provide RPM_SMD_XO_CLK_SRC on
 MSM8996 platform
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230117225824.1552604-1-dmitry.baryshkov@linaro.org>
 <20230117225824.1552604-5-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230117225824.1552604-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.01.2023 23:58, Dmitry Baryshkov wrote:
> Extend the list of RPM clocks provided on MSM8996 platform to also
> include RPM_SMD_XO_CLK_SRC and RPM_SMD_XO_A_CLK_SRC.
> 
> Fixes: 7066fdd0d742 ("clk: qcom: clk-smd-rpm: add msm8996 rpmclks")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/clk-smd-rpm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 8f6e274c6030..b503be8b3a93 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -810,6 +810,8 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8994 = {
>  };
>  
>  static struct clk_smd_rpm *msm8996_clks[] = {
> +	[RPM_SMD_XO_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo,
> +	[RPM_SMD_XO_A_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo_a,
>  	[RPM_SMD_PCNOC_CLK] = &clk_smd_rpm_bus_0_pcnoc_clk,
>  	[RPM_SMD_PCNOC_A_CLK] = &clk_smd_rpm_bus_0_pcnoc_a_clk,
>  	[RPM_SMD_SNOC_CLK] = &clk_smd_rpm_bus_1_snoc_clk,
