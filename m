Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7579F615F25
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 10:12:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231395AbiKBJMy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 05:12:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231420AbiKBJL7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 05:11:59 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA7B728719
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 02:11:19 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id d6so27174010lfs.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 02:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gKuPjdWLjmuOURV2Y/juGKCDch+E7gH5+a1ecFUi7wc=;
        b=yrRN4yGxnRVU/qumQdRHUjulC2bB243hbcXg92j0SvuzPfxsPUmMhIXJcSY6Qv7/Zr
         KrelyH+vCKrpgv+rnpMQbvkMorzgIvyv0eV8YT9tbx0G1MY4BO4hd9N+PslAlLa6MtCM
         9jJK+q9RcG8OXDaO4AgdU0dHI3MFNZEY/wfRXFileEDtOdpPb+b2U0nLBaAWs3jy4aHB
         Ko4zlZU+gaKQciYVTySKbwqY6rJQU9KH1uqVIXGAyfdI2eos/Uy32p8t4X30lG/jfKVQ
         ogz2UJ8pHjnbMKhsHcIGvU+qA5sC5W7PKGoGb+iuLUvLznhQRkR6GoG2vhISschcg4JZ
         vUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gKuPjdWLjmuOURV2Y/juGKCDch+E7gH5+a1ecFUi7wc=;
        b=NxHyaGMYEMIPr+uIU1sMsZnq6TgJ1WUNYuvB/jylKpRKpBBADjZ3tNWjp2umgxidsP
         Ler5XyGFg3hSTX/LouDnpxktVd64Gcsm5sdZsSqnaMxf5zWFv4IuRBFQAkF4aoT8xlLN
         8UUv1J86hNEC45NTyszrxI2oyiQ3TohMhoHAyhEsIWRFkscnbFjaNz9DrIWyvOLelW5s
         dD29UfeRCw2T5Unmy0RQLCZ1onffOAifQwr0hsWVPeDx+PmzsWvVpx0aumyGBvz+6f2q
         tDqoL3bI6JyhKxyKqu8LmeWYeej+CKx+nhh1d/+AHy1nLCAYyc6J3rvMAHlpz38mi/A9
         ldTA==
X-Gm-Message-State: ACrzQf1ZD3VyQ9is/98+s73oiUgMop0d4Pge3JrjcM/wH10TL47Svxeo
        D8k2KxD4jJBX0GkxQ7rPOa7d0A==
X-Google-Smtp-Source: AMsMyM7z+0HcM3cE/rFtdLEKXxPZLNKW1MeUqcGmFCzjRwS6uSNWuXjkEHKhQq6N6vSCBdDNaeNowg==
X-Received: by 2002:a05:6512:2350:b0:4a2:4523:cd08 with SMTP id p16-20020a056512235000b004a24523cd08mr9653986lfu.231.1667380278272;
        Wed, 02 Nov 2022 02:11:18 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id q17-20020ac25fd1000000b004a2ae643b99sm1924375lfg.170.2022.11.02.02.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 02:11:17 -0700 (PDT)
Message-ID: <6b0e9539-864e-77e0-0010-66d5053c9730@linaro.org>
Date:   Wed, 2 Nov 2022 12:11:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 4/5] clk: qcom: dispcc-sm8250: Add missing EDP clocks
 for sm8350
Content-Language: en-GB
To:     Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>
References: <20221102090140.965450-1-robert.foss@linaro.org>
 <20221102090140.965450-5-robert.foss@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221102090140.965450-5-robert.foss@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 02/11/2022 12:01, Robert Foss wrote:
> SM8350 supports embedded displayport, but the clocks for this
> were previously not accounted for.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   drivers/clk/qcom/dispcc-sm8250.c | 22 +++++++++++++++++++++-
>   1 file changed, 21 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

