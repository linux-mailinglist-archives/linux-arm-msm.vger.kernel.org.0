Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF4A053E64A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jun 2022 19:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240373AbiFFPRx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jun 2022 11:17:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240366AbiFFPRw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jun 2022 11:17:52 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E63C89EB75
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jun 2022 08:17:50 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id y29so16123254ljd.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jun 2022 08:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=6dGnhyfvkzK2G3AKnKIG9qLpnVKb/X2XCqv6r06/e50=;
        b=AuPD/l8txGziI4B3IszBCzcXQFHItQ0mfIyB5eZs5fN0GS71Xwpu/HEOyKakUMUqoi
         +FiZkaXPVrtdn1yQy5xZ3wfria4hKFU6kX9iSN2EOmDablC3ExTp8xbRYkIYQ5KmTeUx
         3VAzNpYHefOGrTztVgNJq2X9/M5Pj8UJd8ccQnkXysFsne3SUrvUL1y89lr/tOLa+rc9
         4C70AZZBBuUmSKizETE2jRuc7E44xEqe7eguD3T1ot1/OSH1+wAqOeBGEOelwzqxSX0i
         8rjz0iTFvJ5VAb+jHnVB4z+hYzgCqmIt7pt782uNuPkeR3zjR5dqE7WJ75M9/pmg/pH0
         2Esw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=6dGnhyfvkzK2G3AKnKIG9qLpnVKb/X2XCqv6r06/e50=;
        b=u0BLKSdtZd4tQMti8pWttNQjpbpuvH7JfT/me44hX7/PiZ/5W5o5G79ujVh2v32s/A
         ydgO7hd18neVpIEiMciYYp/v6W3r+qcE9KSFAgytTebxqULNhwuV95IssTwYLZunqa+d
         N8IdV5QpqvftMq8w8itPNi45B5WsdRBj6+q5fmfL9fQdC5G5rsNPKvzRk4WMm9kbpX7I
         cHgaQK7SE0niUpeLsqgcBNHnPpqcMfIGL4XOwpd7/DqQuVb1vSB8e12e7NxorE/cwytZ
         xWXHezhw5iMBIdGuC1T6zttXLq4ndk9liDdFyZRkcrMdwj289p5nkLE+YAzlbRaEUr2J
         yJqw==
X-Gm-Message-State: AOAM532EoCZvATgQ60sEM96ZOTkaaiVTcnl014BRl9XayaIUmkgKgNKR
        k/7xPnwOQvjdcIDYQUu7CCdKyA==
X-Google-Smtp-Source: ABdhPJwB5o61WrMTz/g3icG6sPJzFEryUyWOZkxoVbJ9PGpXqwcyEGk4wOgFjsUkfdrf8sdk4TujPA==
X-Received: by 2002:a2e:9048:0:b0:255:758b:449b with SMTP id n8-20020a2e9048000000b00255758b449bmr11831032ljg.123.1654528669226;
        Mon, 06 Jun 2022 08:17:49 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f13-20020a19380d000000b0047255d2110fsm2906030lfa.62.2022.06.06.08.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 08:17:48 -0700 (PDT)
Message-ID: <f7b6d0e0-e2df-10c5-bf25-d8804b0c4bee@linaro.org>
Date:   Mon, 6 Jun 2022 18:17:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/2] remoteproc: qcom: q6v5-mss: add powerdomains to
 MSM8996 config
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Yassine Oudjana <y.oudjana@protonmail.com>
References: <20220403193911.1393920-1-dmitry.baryshkov@linaro.org>
 <20220403193911.1393920-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220403193911.1393920-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/04/2022 22:39, Dmitry Baryshkov wrote:
> MSM8996 follows the rest of MSS devices and requires a vote on MX and CX
> power domains. Add corresponding entry to the device data.
> 
> Fixes: 4760a896be88 ("remoteproc: q6v5-mss: Vote for rpmh power domains")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Gracious ping, this patch doesn't seem to be applied in 5.19-rc1. Can it 
be picked for 5.20?

> ---
>   drivers/remoteproc/qcom_q6v5_mss.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 43ea8455546c..3b391a196fb4 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -2176,6 +2176,11 @@ static const struct rproc_hexagon_res msm8996_mss = {
>   			"mnoc_axi",
>   			NULL
>   	},
> +	.proxy_pd_names = (char*[]){
> +			"mx",
> +			"cx",
> +			NULL
> +	},
>   	.need_mem_protection = true,
>   	.has_alt_reset = false,
>   	.has_mba_logs = false,


-- 
With best wishes
Dmitry
