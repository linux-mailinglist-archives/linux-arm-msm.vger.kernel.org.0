Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B047271359C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 May 2023 18:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231637AbjE0QLX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 May 2023 12:11:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231535AbjE0QLW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 May 2023 12:11:22 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11964C9
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 May 2023 09:11:20 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f4b256a0c9so1928096e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 May 2023 09:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685203878; x=1687795878;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkvrHNpBMUTnaYMgMUQv6qZfUHsxfknPU0klRB3RUA8=;
        b=bv2y3zkD2Vg19TXG+MM+TJxYh10uHuqosbx5ULLaPP8gaj/vEI2VX5ur/iBfHJU9e4
         NWMrpwFfdn7uZ0EK5QnupBWU2NqdEo56Bb8bPaLVkkAHXu1IlakP1alO56JZDQvM7ZMr
         rE3k+xLX00Fd1q1w6ps27Z/bl0/B8V44QIMlMNDPm54RoMcWjlDnhLudjTqyEqgEHpTV
         +b/6qvfEUSTo5t4zn+6aodUqnXQ2w4iazc0JbKItLFdQNDuurQfmLTx2SwyXwIcJjdAE
         4tlDGjV5LZzFHMzXmLxtsXY0Md7OpwcREygYdoOjvCP0aKSj7Zd///5Fh29yMn0aoyuv
         BuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685203878; x=1687795878;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kkvrHNpBMUTnaYMgMUQv6qZfUHsxfknPU0klRB3RUA8=;
        b=dYyMcGGDNc9RsB5X+nDAXPvh+QubUZmkRehlyv8Ff7qcmjMjrZdnOfdG5Lacc0dECU
         R89Yp8IKpdx0PhW8n601YAQIQDbNwCW0oNsG1gwhY9K58Uo7nqy8vLJC7zg+9SmXQ7b0
         0FQ/tuNQM47yht96tRKEVkpLB540PFJTpNgVMggQB9KQcwn7dM4uO4qjScy3kY3yNMOO
         Pb46DaJAWrVs/W8IurHP+bREoNE5Qc75pq2My6dYpczeI51mOPQXqadjrz/xog306pWe
         ysSluniW4Yy3M/mXMKwYl1wJx8ZGGcfayFJ9RP+ZpjBj2JaF4ljDB9J+70qQAX3xK6tN
         Ycyg==
X-Gm-Message-State: AC+VfDw1riYEKRXm3IuUXBFp794eIJmwzXWTAgoucYOXz4iGaNITa/JA
        m6XKq6SEynJK5k7Gp0ApnTjvBjzvXH48AGo/nSU=
X-Google-Smtp-Source: ACHHUZ46pmSZAsVWYmsgETygRY9QIHvAgFhFuQWZm8gR5dMFg8PAyLdloNZWcS1ljwmx00gropxqJA==
X-Received: by 2002:ac2:43bb:0:b0:4f3:ab4b:4d99 with SMTP id t27-20020ac243bb000000b004f3ab4b4d99mr1525664lfl.19.1685203878252;
        Sat, 27 May 2023 09:11:18 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id n17-20020a2eb791000000b002ad8bccceb2sm1467502ljo.57.2023.05.27.09.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 May 2023 09:11:17 -0700 (PDT)
Message-ID: <82072c2b-8483-6fb6-a9d1-c9882825c9cb@linaro.org>
Date:   Sat, 27 May 2023 18:11:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To:     Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230427150717.20860-1-ansuelsmth@gmail.com>
 <20230427150717.20860-3-ansuelsmth@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v4 2/3] clk: qcom: clk-rcg2: add support for rcg2 freq
 multi ops
In-Reply-To: <20230427150717.20860-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
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



On 27.04.2023 17:07, Christian Marangi wrote:
> Some RCG frequency can be reached by multiple configuration.
> 
> Add clk_rcg2_fm_ops ops to support these special RCG configurations.
> 
> These alternative ops will select the frequency using a CEIL policy.
> 
> When the correct frequency is found, the correct config is selected by
> calculating the final rate (by checking the defined parent and values
> in the config that is being checked) and deciding based on the one that
> is less different than the requested one.
> 
> These check are skipped if there is just on config for the requested
> freq.
> 
> qcom_find_freq_multi is added to search the freq with the new struct
> freq_multi_tbl.
> __clk_rcg2_select_conf is used to select the correct conf by simulating
> the final clock.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/clk/qcom/clk-rcg.h  |   1 +
>  drivers/clk/qcom/clk-rcg2.c | 152 ++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/common.c   |  18 +++++
>  drivers/clk/qcom/common.h   |   2 +
>  4 files changed, 173 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> index dc85b46b0d79..f8ec989ed3d9 100644
> --- a/drivers/clk/qcom/clk-rcg.h
> +++ b/drivers/clk/qcom/clk-rcg.h
> @@ -188,6 +188,7 @@ struct clk_rcg2_gfx3d {
>  
>  extern const struct clk_ops clk_rcg2_ops;
>  extern const struct clk_ops clk_rcg2_floor_ops;
> +extern const struct clk_ops clk_rcg2_fm_ops;
>  extern const struct clk_ops clk_rcg2_mux_closest_ops;
>  extern const struct clk_ops clk_edp_pixel_ops;
>  extern const struct clk_ops clk_byte_ops;
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index 76551534f10d..4f2fe012ef5f 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -266,6 +266,104 @@ static int _freq_tbl_determine_rate(struct clk_hw *hw, const struct freq_tbl *f,
>  	return 0;
>  }
>  
> +static const struct freq_conf *
> +__clk_rcg2_select_conf(struct clk_hw *hw, const struct freq_multi_tbl *f,
> +		       unsigned long req_rate)
> +{
> +	unsigned long best_rate = 0, parent_rate, rate;
> +	const struct freq_conf *conf, *best_conf;
> +	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
> +	struct clk_hw *p;
> +	int index, i;
> +
> +	/* Exit early if only one config is defined */
> +	if (f->num_confs == 1)
> +		return f->confs;
> +
> +	/* Search in each provided config the one that is near the wanted rate */
> +	for (i = 0, conf = f->confs; i < f->num_confs; i++, conf++) {
> +		index = qcom_find_src_index(hw, rcg->parent_map, conf->src);
> +		if (index < 0)
> +			continue;
> +
> +		p = clk_hw_get_parent_by_index(hw, index);
> +		if (!p)
> +			continue;
> +
> +		parent_rate =  clk_hw_get_rate(p);
> +		rate = calc_rate(parent_rate, conf->n, conf->m, conf->n, conf->pre_div);
> +
> +		if (rate == req_rate) {
> +			best_conf = conf;
> +			break;
> +		}
> +
> +		if (abs(req_rate - rate) < abs(best_rate - rate)) {
Shouldn't this be:

if (abs(req_rate - rate) < abs(best_rate - req_rate)

?

this way it'd say

"if this iteration's rate is closer to the requested one than the
best one we've found yet, it's better"

> +			best_rate = rate;
> +			best_conf = conf;
> +		}
> +	}
> +
> +	/*
> +	 * Very unlikely.
> +	 * Force the first conf if we can't find a correct config.
> +	 */
> +	if (unlikely(i == f->num_confs))
> +		best_conf = f->confs;
Is that a supported scenario or would it be a device driver / clock
driver error?

> +
> +	return best_conf;
> +}
> +
> +static int _freq_tbl_fm_determine_rate(struct clk_hw *hw, const struct freq_multi_tbl *f,
> +				       struct clk_rate_request *req)
> +{
> +	unsigned long clk_flags, rate = req->rate;
> +	const struct freq_conf *conf;
> +	struct clk_hw *p;
> +	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
swap lines 2, 3, 4 to 4, 2, 3 and you'll get a revers-Christmas-tree!

Konrad

