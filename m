Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65CFA645B53
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 14:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbiLGNtH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 08:49:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbiLGNs7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 08:48:59 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4D535B5B3
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 05:48:57 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id y15so16137850qtv.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Dec 2022 05:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1m6QhBfItvzCyf6N0lXKPxnJF2cCk3WTq5AdAaVm4Dw=;
        b=dZ+//nSa0gxrqTc5cCbT9fAIMhABBb7i9UroMGsb5F+QLbmKfJfGk1Uf/HP4oFopRn
         rSyR49n/bqtV+cqmHu58anci2UQ51RMn/nlajBcitKGgGDky+qGoWS9jOnLtrpAJuz/K
         YL9uSv/We0PMgiEkTX/Ygrba9wlV7WsZU0kiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1m6QhBfItvzCyf6N0lXKPxnJF2cCk3WTq5AdAaVm4Dw=;
        b=aEpXP1f1O2ZAEkBOinM7xfEPCyGaJmrpmvDTClBFwjnce48TNPyAy/cMv0cL6AeD28
         m1+2Sf7bQHjTWQj/2YKRTClGLRJy5bPxTKcCZ7NQlGLadSs8qJZ6eazYNYkoNLwa8cK9
         SIxfhd+rxfI0FmW8E+hHwh5WxH0HFiH+1eoBcOAJ9IGnzh+/PWic45ZCbqnfLeFu4ZEG
         FLgtUfvDbO/0FWjkZ2H8xLgUhRGyLvfcfSMnMD9obt0CY/NGIcq7xdyqU9coJwQnX5BZ
         fWfKGzC/i7pBlQ6k0xG/llxOkB98Aze04SJ6KmyLPnec/GrOO+6gawAk72WAo5GkTend
         26ng==
X-Gm-Message-State: ANoB5plYkl/rgDCYHLmBaE0ylhNQ+ZNzQbHnfC6smvam9d5jlheDDFzc
        b795BmhNRnjuqWpdO91ctu0QFg==
X-Google-Smtp-Source: AA0mqf4SDn1IptPJc5cgdJVFmgIWEB/fuNFvb3O8UHTJtIqqmlptsq2R1OVzB21NpcL8vpbKhMpTow==
X-Received: by 2002:a05:622a:1f8b:b0:3a5:1fa1:4b7e with SMTP id cb11-20020a05622a1f8b00b003a51fa14b7emr83787363qtb.161.1670420937259;
        Wed, 07 Dec 2022 05:48:57 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id v15-20020a05620a440f00b006fc2b672950sm17906166qkp.37.2022.12.07.05.48.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 05:48:56 -0800 (PST)
Message-ID: <115194d9-5bfb-486d-71d4-05fb9212627c@ieee.org>
Date:   Wed, 7 Dec 2022 07:48:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 10/18] clk: qcom: smd-rpm: fix alignment of line
 breaking backslashes
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
 <20221207001503.93790-11-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@ieee.org>
In-Reply-To: <20221207001503.93790-11-dmitry.baryshkov@linaro.org>
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
> The commit 52a436e0b7fe ("clk: qcom: smd-rpm: Switch to parent_data")
> introduced ragged right alignment for the line breaking backslash. Fix
> it to make the code look consistently.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Very pretty.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 32 ++++++++++++++++----------------
>   1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 2075cfd34f99..7e43ecdda763 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -36,10 +36,10 @@
>   		.hw.init = &(struct clk_init_data){			      \
>   			.ops = &clk_smd_rpm_ops,			      \
>   			.name = #_name,					      \
> -			.parent_data =  &(const struct clk_parent_data){ \
> -					.fw_name = "xo",		\
> -					.name = "xo_board",		\
> -			},						\
> +			.parent_data =  &(const struct clk_parent_data){      \
> +					.fw_name = "xo",		      \
> +					.name = "xo_board",		      \
> +			},						      \
>   			.num_parents = 1,				      \
>   		},							      \
>   	};								      \
> @@ -53,10 +53,10 @@
>   		.hw.init = &(struct clk_init_data){			      \
>   			.ops = &clk_smd_rpm_ops,			      \
>   			.name = #_active,				      \
> -			.parent_data =  &(const struct clk_parent_data){ \
> -					.fw_name = "xo",		\
> -					.name = "xo_board",		\
> -			},						\
> +			.parent_data =  &(const struct clk_parent_data){      \
> +					.fw_name = "xo",		      \
> +					.name = "xo_board",		      \
> +			},						      \
>   			.num_parents = 1,				      \
>   		},							      \
>   	}
> @@ -74,10 +74,10 @@
>   		.hw.init = &(struct clk_init_data){			      \
>   			.ops = &clk_smd_rpm_branch_ops,			      \
>   			.name = #_name,					      \
> -			.parent_data =  &(const struct clk_parent_data){ \
> -					.fw_name = "xo",		\
> -					.name = "xo_board",		\
> -			},						\
> +			.parent_data =  &(const struct clk_parent_data){      \
> +					.fw_name = "xo",		      \
> +					.name = "xo_board",		      \
> +			},						      \
>   			.num_parents = 1,				      \
>   		},							      \
>   	};								      \
> @@ -92,10 +92,10 @@
>   		.hw.init = &(struct clk_init_data){			      \
>   			.ops = &clk_smd_rpm_branch_ops,			      \
>   			.name = #_active,				      \
> -			.parent_data =  &(const struct clk_parent_data){ \
> -					.fw_name = "xo",		\
> -					.name = "xo_board",		\
> -			},						\
> +			.parent_data =  &(const struct clk_parent_data){      \
> +					.fw_name = "xo",		      \
> +					.name = "xo_board",		      \
> +			},						      \
>   			.num_parents = 1,				      \
>   		},							      \
>   	}

