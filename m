Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24B2E67ED50
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 19:19:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235262AbjA0STl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 13:19:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235363AbjA0ST1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 13:19:27 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44BD57C327
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 10:19:07 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id d30so9416690lfv.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 10:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AUaKiLXkBTVTN6xzUIH+1Wou99sq5rEjXu7LjVpS3hY=;
        b=eEgKjHr2GuAG2bxqoFSDusbK3Pkd5EQdFPAtOj6nMCQX2iJMi+70TGOds6dCklO2Gr
         xWyX8QhO2yo31VqQP5hRHpxAPyjHzWlxxMNaZWH4ozpllZ7Qy8NG+ZVxGwoqVYaXB8ow
         XupcuHsuwYxNPlWwws+kr07KITGYO6C60dl4l/W1uUwtKegtplTusU6v8uV8rjRZXA14
         c1kaxUxkOunw/5R6X51prM4k3nJTu5a0+wCOzsUNrQCfeS0I8gdX1iU+DUPX5hZV0ROi
         Mph6Z75xlRuc14PCchLnXfR9YKpddZHF01LhIhCq9NqY49GOW4wddVOrTV6J4VF2Zkk5
         Ex2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AUaKiLXkBTVTN6xzUIH+1Wou99sq5rEjXu7LjVpS3hY=;
        b=Tut/InbwqfOvVunMXNmlH+hYbPJpCDhtfTsos/EYmMgkz06/9/CkLVXJwt+86MWf/G
         qcxKTxnijSTyVtK2QyJJWDFMeGdLoYGs6BSb+xqVMMIxIg6gsVjHM87KPHG1Ztu+SpmO
         TJdXch7um6nXPfzzWZ2qqaqVFb8IyY3UJQY24Rg7T7EqfT4s0duVg5KfNGHhUbBXYgjz
         I3L5HeRPKVTzDKEoZKnA32VNDAAZhaJVMmJakpA2Ig2GZ78SH6JA18QckMIbrgHHAfbB
         G0vFHLWPQL6QbfI79UQ2wVDRd/a48NMNnSTdodwH4Ylw/nzL0EgteYg4/CEu2lCYnTPv
         6MSg==
X-Gm-Message-State: AFqh2kqaDSbR2qzAdFCrZ9ULcvTWtLg5YVv8Ye0FlKWLEs9eHQ2xr8ku
        f+i4BI0LFCgmKCkUCwkcWUJGMsgLxZ6NDUVVv2c35Q==
X-Google-Smtp-Source: AMrXdXvXuRF3ZtGn76AVL0uRnkNQJ72scg7giBslgTue4sZWP7HgeOdPtHUCSnNiW/hwzdW+EwZ9gg==
X-Received: by 2002:ac2:5699:0:b0:4cb:2b23:9965 with SMTP id 25-20020ac25699000000b004cb2b239965mr9928150lfr.63.1674843545439;
        Fri, 27 Jan 2023 10:19:05 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v17-20020a056512349100b004cc590975f7sm324824lfr.183.2023.01.27.10.19.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 10:19:04 -0800 (PST)
Message-ID: <9314a5f4-32a0-b71a-62cc-b338ccdcff07@linaro.org>
Date:   Fri, 27 Jan 2023 20:19:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 4/8] clk: qcom: cbf-msm8996: scale CBF clock according
 to the CPUfreq
Content-Language: en-GB
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230120061417.2623751-1-dmitry.baryshkov@linaro.org>
 <20230120061417.2623751-5-dmitry.baryshkov@linaro.org>
 <078c5a8254ac006b65fc5fa81dfbc515.sboyd@kernel.org>
 <3a355075-cc29-957a-678b-2a05aed25587@linaro.org>
 <b4dd052421f926b60728f1578e4922e0.sboyd@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <b4dd052421f926b60728f1578e4922e0.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/01/2023 23:40, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2023-01-20 14:53:21)
>> On 21/01/2023 00:11, Stephen Boyd wrote:
>>> Quoting Dmitry Baryshkov (2023-01-19 22:14:13)
>>>> diff --git a/drivers/clk/qcom/clk-cbf-8996.c b/drivers/clk/qcom/clk-cbf-8996.c
>>>> index 9cde0e660228..b049b4f7b270 100644
>>>> --- a/drivers/clk/qcom/clk-cbf-8996.c
>>>> +++ b/drivers/clk/qcom/clk-cbf-8996.c
>>>> @@ -225,6 +228,133 @@ static const struct regmap_config cbf_msm8996_regmap_config = {
>>>>           .val_format_endian      = REGMAP_ENDIAN_LITTLE,
>>>>    };
>>>>    
>>>> +#ifdef CONFIG_INTERCONNECT
>>>
>>> Can you move this driver to drivers/interconnect/ ?
>>
>> Only the interconnect part? At some point I considered dropping the
> 
> Yes only the interconnect part. Use auxiliary bus.

Stephen, Bjorn, since the interconnect parts are already separated (to 
patches 2, 4, 8, would it be possible to merge the rest into 6.3?

Just having the CBF enabled and set to maximum frequency helps to boot 
msm8996 performance cluster. Without this patchset, it is kind of a 
lottery, with stable kernel boot achievable only with 'maxcpus=2'.

-- 
With best wishes
Dmitry

