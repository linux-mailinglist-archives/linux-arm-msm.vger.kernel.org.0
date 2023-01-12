Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5E216677CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 15:49:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238794AbjALOtK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 09:49:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239931AbjALOsE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 09:48:04 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 463B965367
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 06:35:38 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id b3so28714714lfv.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 06:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qmpKhjqqtS1pgiCFXGs+prg9A+4LCfLLpC0zwPF23d4=;
        b=Xvtz8r4TCefKclAc54Ox3/iSxocwqHIXSX3v2wD24spBma0Zs9DYMbCuhVqi2Iiy/4
         wy/E5i1/PFwqrXHQdGzZiOBPlW96//P1KQU23LC96Kz3yk3GvRKSOBLSlPlPMtEUPQNe
         vYDYwjfBOaiiK+rP4P/jYxe83sfu0+egWRhq8ZQCjnHhUXccjPbFOnrTqvv2PlnVHxPj
         yiHC3H6rKxQx1p9TVpYjmeAGj3fCS2bqM5TcUu1y+dpQz0ici8C+bMTu+ZPkwl/V9Pvb
         usmuObzqItUA8ZnyNoOFFCYjcrgPLokS/j5KzE/YgBRKZaBTUIlCG+FUz5Hncxl5ffMS
         mEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qmpKhjqqtS1pgiCFXGs+prg9A+4LCfLLpC0zwPF23d4=;
        b=mwuxI94IItSFriN/SZXzRW/cQwC5pzOksTzdFnRi0k6oB6HVtVN+4TyaPZU1MANxhL
         I/bcy8F0XfrG5w0ANoFPfHleV0h38uBQCSUGRJVj1KVoiaflHSUPFOn2qGkiMLIkhxoO
         NGSvIDH1qchIYAKxDk/I7TAoskrIkbhiteV/uYypD/xFwHiij9RHqIFwR7UdvUSRPdIS
         pvkPtesZGlr/hTq6isZs6cJJbrq/CoJ4uXalKV8E5SN46fY0+n0l1abojFUjs8MIiKd+
         YYfIShFJvIEbN/Of6jLrOreG2+gnelEi8+bC0/mD+C9TOkTYubyCuLN8BIRZeiPMTp6o
         lZ9w==
X-Gm-Message-State: AFqh2kqMtcL97eDFhHldh+AMn6tAGNM1wD9SqrEm9ETxdz1gbTOgyuTK
        uBhDuOhnt/ZUIK8ZFHKz1ZHs2w==
X-Google-Smtp-Source: AMrXdXucSA3/CBRX/V0pKHs+Te8d7J0clFlgYF13lHdhBD9nzVq5iea4cvNisPGGa1WUMfZgIk9/aw==
X-Received: by 2002:a05:6512:3d9e:b0:4b5:9b5b:ae92 with SMTP id k30-20020a0565123d9e00b004b59b5bae92mr27388143lfv.10.1673534136642;
        Thu, 12 Jan 2023 06:35:36 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id w20-20020a05651234d400b004cb8de497ffsm3298085lfr.154.2023.01.12.06.35.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 06:35:26 -0800 (PST)
Message-ID: <1c8d38e0-2f9d-9e89-5e21-e74ac7851727@linaro.org>
Date:   Thu, 12 Jan 2023 15:35:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 10/13] clk: qcom: cpu-8996: fix ACD initialization
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
References: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
 <20230111192004.2509750-11-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230111192004.2509750-11-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11.01.2023 20:20, Dmitry Baryshkov wrote:
> The vendor kernel applies different order while programming SSSCTL and
> L2ACDCR registers on power and performance clusters. However it was
> demonstrated that doing this upstream results in the board reset. Make
> both clusters use the same sequence, which fixes the reset.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
I think we should look for the source of why this doesn't work,
e.g. does downstream program it earlier somewhere? Are we
missing something else that may bite later?

Konrad
>  drivers/clk/qcom/clk-cpu-8996.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
> index 47c58bb5f21a..1c00eb629b61 100644
> --- a/drivers/clk/qcom/clk-cpu-8996.c
> +++ b/drivers/clk/qcom/clk-cpu-8996.c
> @@ -475,9 +475,9 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
>  	return ret;
>  }
>  
> -#define CPU_AFINITY_MASK 0xFFF
> -#define PWRCL_CPU_REG_MASK 0x3
> -#define PERFCL_CPU_REG_MASK 0x103
> +#define CPU_CLUSTER_AFFINITY_MASK 0xf00
> +#define PWRCL_AFFINITY_MASK 0x000
> +#define PERFCL_AFFINITY_MASK 0x100
>  
>  #define L2ACDCR_REG 0x580ULL
>  #define L2ACDTD_REG 0x581ULL
> @@ -498,21 +498,17 @@ static void qcom_cpu_clk_msm8996_acd_init(struct regmap *regmap)
>  	if (val == 0x00006a11)
>  		goto out;
>  
> -	hwid = read_cpuid_mpidr() & CPU_AFINITY_MASK;
> -
>  	kryo_l2_set_indirect_reg(L2ACDTD_REG, 0x00006a11);
>  	kryo_l2_set_indirect_reg(L2ACDDVMRC_REG, 0x000e0f0f);
>  	kryo_l2_set_indirect_reg(L2ACDSSCR_REG, 0x00000601);
>  
> -	if (PWRCL_CPU_REG_MASK == (hwid | PWRCL_CPU_REG_MASK)) {
> -		regmap_write(regmap, PWRCL_REG_OFFSET + SSSCTL_OFFSET, 0xf);
> -		kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002c5ffd);
> -	}
> +	kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002c5ffd);
>  
> -	if (PERFCL_CPU_REG_MASK == (hwid | PERFCL_CPU_REG_MASK)) {
> -		kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002c5ffd);
> +	hwid = read_cpuid_mpidr();
> +	if ((hwid & CPU_CLUSTER_AFFINITY_MASK) == PWRCL_AFFINITY_MASK)
> +		regmap_write(regmap, PWRCL_REG_OFFSET + SSSCTL_OFFSET, 0xf);
> +	else
>  		regmap_write(regmap, PERFCL_REG_OFFSET + SSSCTL_OFFSET, 0xf);
> -	}
>  
>  out:
>  	spin_unlock_irqrestore(&qcom_clk_acd_lock, flags);
