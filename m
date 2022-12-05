Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA3C764277B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 12:28:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbiLEL2r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 06:28:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbiLEL2q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 06:28:46 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C27F61056A
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 03:28:44 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id c17so6768742edj.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 03:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0n4abDsS1NlYUs44CJ3ksfnZAK91W8FD06QzCcB8iZY=;
        b=VP/x+dvehUY+sPKX8c3evf6+EwUie1UmcFysLpmnm4GX2NhFtRlarWshQE93yo3e/Q
         6XQn/zxCJAAP/dKVFayRpiMPsX8TfSM7XzXFrPIhXERDP0YCqVhuWQ969596QJLl1KSb
         7cP3JEbXX0y+NbbWPRjfOQ9sHd7D1ZgmAKRIlihbKthyp5qVOjjfhjd4Gbwh9eY4ZFUX
         Bcl3JlA5Hbw3wgyrgbhR9L0tMdHdKLfwp2DCNb345+e2QwCu0RnqjpXqDIit88Pwrmt6
         jHZOdMgFatHGMmPDqNrJpu2JTAx+GudYIrkXAAWZq3lSAJ+Kksh0mhdzZHFmpAlWzPBY
         Sukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0n4abDsS1NlYUs44CJ3ksfnZAK91W8FD06QzCcB8iZY=;
        b=hW5sp0rd1CRWKBdSOcfJ0+jds1rbCzxFo1XF39guV+OXjCisRVcd8rSVgGAL9m9XX+
         6toHlc/P8lFq5hdPDLojSciA4taQy2LnVUTxtXXyScgBn0dQWnCidk2X3TXSUZqgkjwD
         MhLgdcwtg7s4zeDdBRGP7XZcdbl88IVqnb28xWGe5tZZfsDmJ4ASoNE7JKkqyo4/T4QR
         0zLjEkfRR/63iiVL1rkf63hLEsytY1Fm5xTbLVkrhMp5hDC7FVkzi5DvomWD1qOpicIK
         WLSIj8qUY2WtOjbM0UZVDcAp/IRNg3GCgSWyJy/PSDb1tgGGPLV3/oJCBuwwkMVLPAuY
         VReA==
X-Gm-Message-State: ANoB5pn9tVG6b+sG7iv5+wxrBlc98QhhHNPYlSRIc4A2r/qNm49T8w35
        IiR72n2dfjSrTqey5K05cO5d/g==
X-Google-Smtp-Source: AA0mqf6p3le0OSDK1Jut2k2nZ+HevGPuMRkrd98/CflbsBhteLfH9OTUFfe5ClSAnE22fuxjUzSwXQ==
X-Received: by 2002:aa7:c754:0:b0:46b:6096:a884 with SMTP id c20-20020aa7c754000000b0046b6096a884mr26966458eds.152.1670239723326;
        Mon, 05 Dec 2022 03:28:43 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id n8-20020a1709067b4800b007aed2057eacsm6071948ejo.221.2022.12.05.03.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 03:28:41 -0800 (PST)
Message-ID: <7c70c266-1682-b435-d825-21e7a3f6fe29@linaro.org>
Date:   Mon, 5 Dec 2022 12:28:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 12/16] clk: qcom: smd-rpm: simplify SMD_RPM/_BRANCH/_QDSS
 clock definitions
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
 <20221203175808.859067-13-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221203175808.859067-13-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75 autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 03/12/2022 18:58, Dmitry Baryshkov wrote:
> Remove the duplication between the names of the normal and active-only
> clocks by moving common sufixes to the clock definition macros. This
> simplifies adding new clock definitions and reviewing existing defs.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   drivers/clk/qcom/clk-smd-rpm.c | 90 ++++++++++++++++++----------------
>   1 file changed, 49 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 9f33dbd60e96..59abc6bf475d 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -62,7 +62,7 @@
>   	}
>   
>   #define __DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type, r_id,    \
> -				    r, key)			      \
> +				    r, key)				      \
>   	static struct clk_smd_rpm _platform##_##_active;		      \
>   	static struct clk_smd_rpm _platform##_##_name = {		      \
>   		.rpm_res_type = (type),					      \
> @@ -100,16 +100,24 @@
>   		},							      \
>   	}
>   
> -#define DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id)	      \
> -		__DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id,   \
> +#define DEFINE_CLK_SMD_RPM(_platform, _name, type, r_id)		      \
> +		__DEFINE_CLK_SMD_RPM(_platform, _name##_clk, _name##_a_clk, type, r_id,   \
>   		QCOM_RPM_SMD_KEY_RATE)
>   
> -#define DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type, r_id, r)   \
> -		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type,  \
> +#define DEFINE_CLK_SMD_RPM_CLK_SRC(_platform, _name, type, r_id)	      \
> +		__DEFINE_CLK_SMD_RPM(_platform, _name##_clk_src, _name##_a_clk_src, type, r_id,   \
> +		QCOM_RPM_SMD_KEY_RATE)
> +
> +#define DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, type, r_id, r)	      \
> +		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name##_clk, _name##_a_clk, type,  \
> +		r_id, r, QCOM_RPM_SMD_KEY_ENABLE)
> +
> +#define DEFINE_CLK_SMD_RPM_BRANCH_A(_platform, _name, type, r_id, r)	      \
> +		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _name##_a, type,\
>   		r_id, r, QCOM_RPM_SMD_KEY_ENABLE)
>   
> -#define DEFINE_CLK_SMD_RPM_QDSS(_platform, _name, _active, type, r_id)	      \
> -		__DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id,   \
> +#define DEFINE_CLK_SMD_RPM_QDSS(_platform, _name, type, r_id)		      \
> +		__DEFINE_CLK_SMD_RPM(_platform, _name##_clk, _name##_a_clk, type, r_id,   \
>   		QCOM_RPM_SMD_KEY_STATE)
>   
>   #define DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, r_id, r)		      \
> @@ -410,51 +418,51 @@ static const struct clk_ops clk_smd_rpm_branch_ops = {
>   	.recalc_rate	= clk_smd_rpm_recalc_rate,
>   };
>   
> -DEFINE_CLK_SMD_RPM_BRANCH(sdm660, bi_tcxo, bi_tcxo_a, QCOM_SMD_RPM_MISC_CLK, 0, 19200000);
> -DEFINE_CLK_SMD_RPM_BRANCH(sm6125, qdss_clk, qdss_a_clk, QCOM_SMD_RPM_MISC_CLK, 1, 19200000);
> -DEFINE_CLK_SMD_RPM_QDSS(msm8916, qdss_clk, qdss_a_clk, QCOM_SMD_RPM_MISC_CLK, 1);
> -DEFINE_CLK_SMD_RPM_BRANCH(sm6375, bimc_freq_log, bimc_freq_log_a, QCOM_SMD_RPM_MISC_CLK, 4, 1);
> +DEFINE_CLK_SMD_RPM_BRANCH_A(sdm660, bi_tcxo, QCOM_SMD_RPM_MISC_CLK, 0, 19200000);
> +DEFINE_CLK_SMD_RPM_BRANCH(sm6125, qdss, QCOM_SMD_RPM_MISC_CLK, 1, 19200000);
> +DEFINE_CLK_SMD_RPM_QDSS(msm8916, qdss, QCOM_SMD_RPM_MISC_CLK, 1);
> +DEFINE_CLK_SMD_RPM_BRANCH_A(sm6375, bimc_freq_log, QCOM_SMD_RPM_MISC_CLK, 4, 1);
>   
> -DEFINE_CLK_SMD_RPM_BRANCH(msm8992, mss_cfg_ahb_clk, mss_cfg_ahb_a_clk, QCOM_SMD_RPM_MCFG_CLK, 0, 19200000);
> +DEFINE_CLK_SMD_RPM_BRANCH(msm8992, mss_cfg_ahb, QCOM_SMD_RPM_MCFG_CLK, 0, 19200000);
>   
> -DEFINE_CLK_SMD_RPM_BRANCH(msm8996, aggre1_noc_clk, aggre1_noc_a_clk, QCOM_SMD_RPM_AGGR_CLK, 1, 1000);
> -DEFINE_CLK_SMD_RPM_BRANCH(msm8996, aggre2_noc_clk, aggre2_noc_a_clk, QCOM_SMD_RPM_AGGR_CLK, 2, 1000);
> -DEFINE_CLK_SMD_RPM(msm8998, aggre1_noc_clk, aggre1_noc_a_clk, QCOM_SMD_RPM_AGGR_CLK, 1);
> -DEFINE_CLK_SMD_RPM(msm8998, aggre2_noc_clk, aggre2_noc_a_clk, QCOM_SMD_RPM_AGGR_CLK, 2);
> +DEFINE_CLK_SMD_RPM_BRANCH(msm8996, aggre1_noc, QCOM_SMD_RPM_AGGR_CLK, 1, 1000);
> +DEFINE_CLK_SMD_RPM_BRANCH(msm8996, aggre2_noc, QCOM_SMD_RPM_AGGR_CLK, 2, 1000);
> +DEFINE_CLK_SMD_RPM(msm8998, aggre1_noc, QCOM_SMD_RPM_AGGR_CLK, 1);
> +DEFINE_CLK_SMD_RPM(msm8998, aggre2_noc, QCOM_SMD_RPM_AGGR_CLK, 2);
>   
> -DEFINE_CLK_SMD_RPM(msm8916, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
> -DEFINE_CLK_SMD_RPM(msm8916, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
> -DEFINE_CLK_SMD_RPM(msm8936, sysmmnoc_clk, sysmmnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
> -DEFINE_CLK_SMD_RPM(msm8974, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
> -DEFINE_CLK_SMD_RPM(msm8974, mmssnoc_ahb_clk, mmssnoc_ahb_a_clk, QCOM_SMD_RPM_BUS_CLK, 3);
> -DEFINE_CLK_SMD_RPM(sm6125, snoc_periph_clk, snoc_periph_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
> -DEFINE_CLK_SMD_RPM(sm6125, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
> -DEFINE_CLK_SMD_RPM(sm6125, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
> -DEFINE_CLK_SMD_RPM(sm6125, snoc_lpass_clk, snoc_lpass_a_clk, QCOM_SMD_RPM_BUS_CLK, 5);
> +DEFINE_CLK_SMD_RPM(msm8916, pcnoc, QCOM_SMD_RPM_BUS_CLK, 0);
> +DEFINE_CLK_SMD_RPM(msm8916, snoc, QCOM_SMD_RPM_BUS_CLK, 1);
> +DEFINE_CLK_SMD_RPM(msm8936, sysmmnoc, QCOM_SMD_RPM_BUS_CLK, 2);
> +DEFINE_CLK_SMD_RPM(msm8974, cnoc, QCOM_SMD_RPM_BUS_CLK, 2);
> +DEFINE_CLK_SMD_RPM(msm8974, mmssnoc_ahb, QCOM_SMD_RPM_BUS_CLK, 3);
> +DEFINE_CLK_SMD_RPM(sm6125, snoc_periph, QCOM_SMD_RPM_BUS_CLK, 0);
> +DEFINE_CLK_SMD_RPM(sm6125, cnoc, QCOM_SMD_RPM_BUS_CLK, 1);
> +DEFINE_CLK_SMD_RPM(sm6125, snoc, QCOM_SMD_RPM_BUS_CLK, 2);
> +DEFINE_CLK_SMD_RPM(sm6125, snoc_lpass, QCOM_SMD_RPM_BUS_CLK, 5);
>   
> -DEFINE_CLK_SMD_RPM(msm8916, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
> -DEFINE_CLK_SMD_RPM(qcm2290, cpuss_gnoc_clk, cpuss_gnoc_a_clk, QCOM_SMD_RPM_MEM_CLK, 1);
> -DEFINE_CLK_SMD_RPM(msm8974, gfx3d_clk_src, gfx3d_a_clk_src, QCOM_SMD_RPM_MEM_CLK, 1);
> -DEFINE_CLK_SMD_RPM(msm8974, ocmemgx_clk, ocmemgx_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
> -DEFINE_CLK_SMD_RPM(qcs404, bimc_gpu_clk, bimc_gpu_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
> +DEFINE_CLK_SMD_RPM(msm8916, bimc, QCOM_SMD_RPM_MEM_CLK, 0);
> +DEFINE_CLK_SMD_RPM(qcm2290, cpuss_gnoc, QCOM_SMD_RPM_MEM_CLK, 1);
> +DEFINE_CLK_SMD_RPM_CLK_SRC(msm8974, gfx3d, QCOM_SMD_RPM_MEM_CLK, 1);
> +DEFINE_CLK_SMD_RPM(msm8974, ocmemgx, QCOM_SMD_RPM_MEM_CLK, 2);
> +DEFINE_CLK_SMD_RPM(qcs404, bimc_gpu, QCOM_SMD_RPM_MEM_CLK, 2);
>   
> -DEFINE_CLK_SMD_RPM(msm8992, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
> -DEFINE_CLK_SMD_RPM(msm8992, ce2_clk, ce2_a_clk, QCOM_SMD_RPM_CE_CLK, 1);
> -DEFINE_CLK_SMD_RPM(msm8994, ce3_clk, ce3_a_clk, QCOM_SMD_RPM_CE_CLK, 2);
> +DEFINE_CLK_SMD_RPM(msm8992, ce1, QCOM_SMD_RPM_CE_CLK, 0);
> +DEFINE_CLK_SMD_RPM(msm8992, ce2, QCOM_SMD_RPM_CE_CLK, 1);
> +DEFINE_CLK_SMD_RPM(msm8994, ce3, QCOM_SMD_RPM_CE_CLK, 2);
>   
> -DEFINE_CLK_SMD_RPM(msm8976, ipa_clk, ipa_a_clk, QCOM_SMD_RPM_IPA_CLK, 0);
> +DEFINE_CLK_SMD_RPM(msm8976, ipa, QCOM_SMD_RPM_IPA_CLK, 0);
>   
> -DEFINE_CLK_SMD_RPM(qcm2290, hwkm_clk, hwkm_a_clk, QCOM_SMD_RPM_HWKM_CLK, 0);
> +DEFINE_CLK_SMD_RPM(qcm2290, hwkm, QCOM_SMD_RPM_HWKM_CLK, 0);
>   
> -DEFINE_CLK_SMD_RPM(msm8996, mmssnoc_axi_rpm_clk, mmssnoc_axi_rpm_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 0);
> -DEFINE_CLK_SMD_RPM(sm6125, mmnrt_clk, mmnrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 0);
> -DEFINE_CLK_SMD_RPM(sm6125, mmrt_clk, mmrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 1);
> +DEFINE_CLK_SMD_RPM(msm8996, mmssnoc_axi_rpm, QCOM_SMD_RPM_MMAXI_CLK, 0);
> +DEFINE_CLK_SMD_RPM(sm6125, mmnrt, QCOM_SMD_RPM_MMAXI_CLK, 0);
> +DEFINE_CLK_SMD_RPM(sm6125, mmrt, QCOM_SMD_RPM_MMAXI_CLK, 1);
>   
> -DEFINE_CLK_SMD_RPM(qcm2290, pka_clk, pka_a_clk, QCOM_SMD_RPM_PKA_CLK, 0);
> +DEFINE_CLK_SMD_RPM(qcm2290, pka, QCOM_SMD_RPM_PKA_CLK, 0);
>   
> -DEFINE_CLK_SMD_RPM(qcs404, qpic_clk, qpic_a_clk, QCOM_SMD_RPM_QPIC_CLK, 0);
> +DEFINE_CLK_SMD_RPM(qcs404, qpic, QCOM_SMD_RPM_QPIC_CLK, 0);
>   
> -DEFINE_CLK_SMD_RPM(sm6125, qup_clk, qup_a_clk, QCOM_SMD_RPM_QUP_CLK, 0);
> +DEFINE_CLK_SMD_RPM(sm6125, qup, QCOM_SMD_RPM_QUP_CLK, 0);
>   
>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk1, 1, 19200000);
>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk2, 2, 19200000);
