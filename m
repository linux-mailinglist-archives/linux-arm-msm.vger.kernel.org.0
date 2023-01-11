Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64C08665FD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 16:58:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234896AbjAKP6u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 10:58:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234250AbjAKP6s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 10:58:48 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41AA4DF4E
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 07:58:46 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id d30so19312608lfv.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 07:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YUP9M1dJhtlso5U1m3Rwn8hS3yu3g/oQrTNH6scnNKs=;
        b=gBlyyO+oLZgO/cIzR0dG9h/JjwDJYaQDY7cpNfsHTef4Vji5lFZzN6uXQMV96U6/ne
         smjkLpdoZ6nhC1cTeQT2iFPIIyWnLsZ5P7MnuQs/hLj0XvphPWLw02vFCqT+KeqX6tLy
         WJyZGaSVLyQDjZyON5JUNA7lfCPsZvmyD+hz2T9KdWDEc5w6yOm9cfK7e2xrMXdFXZ+y
         SbezmzF36eQN+s1YVvjCeVlbsrMoQJKqjERElv3vR7KMyvpLoG3Rji5SgZUdHkHwTmCH
         WjjFrPBeOPYbr/a54JzKp52QKor/+peGSyP0xTkYF5kXFyOnziwAjn1EYMP2RzGsyt7j
         v/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YUP9M1dJhtlso5U1m3Rwn8hS3yu3g/oQrTNH6scnNKs=;
        b=gZjBz8jbFXLy0O7FZKCNLeE7xgmoFeXy6OBQJ/d7MWodQWIbItW+AiKduXUp0TIuWj
         QJ4Y8i7PZQYp0T2QjbBtfVt/O90wzxKtxaQ0CVzZXVGkr6TtY2jjnAFwGvfByfFToaWI
         RYFgAav+9/XcFHIZ3+I5O4IfcBCk5i+R82u5KarzG++Ga4bY43mo4m/eaPZDkoZbJK4t
         KvngwMJFB9sGv+iLjIBOQSknmLyiG65BH6XbBmQTRGLGZm3THlbQJuDzy1PCpZ1O/d5o
         ZuWje46vU7P58aMkoV7Yp9RvuZm25/mzw2zJtVtEXl1Q/AzAfS7Ocq2CxMA4IXqZsE0a
         DHeg==
X-Gm-Message-State: AFqh2kocdE54ObsQPw0h8RtFZQ2AE6LezBSQbLoM/mOzFPGRZ9gYw3wR
        Y9Gnj7XAfPLQNc+wziW+btnTrQ==
X-Google-Smtp-Source: AMrXdXtncrDESfrykRgJw7M5y/Nd4d6yktAIkabE6EvX+HCcoGfAvgiPKa6kREMy0dGBUCWSG0uH4A==
X-Received: by 2002:a05:6512:1687:b0:4cb:bf8:cf0e with SMTP id bu7-20020a056512168700b004cb0bf8cf0emr18440948lfb.19.1673452724550;
        Wed, 11 Jan 2023 07:58:44 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id l9-20020ac24a89000000b004cc99cd94basm329510lfp.113.2023.01.11.07.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 07:58:44 -0800 (PST)
Message-ID: <e21f8901-2574-a4ce-32df-54f3d93841ac@linaro.org>
Date:   Wed, 11 Jan 2023 17:58:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v8 1/5] dt-bindings: soc: qcom: cpr3: Add bindings for
 CPR3 driver
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        angelogioacchino.delregno@collabora.com,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230110175605.1240188-1-konrad.dybcio@linaro.org>
 <20230110175605.1240188-2-konrad.dybcio@linaro.org>
 <889c3bce-8b88-3a0d-5aa0-1000d3dd26cd@linaro.org>
 <eebc18be-5be7-4c1f-74dd-b1427d2c101f@linaro.org>
 <8463810e-a3bf-1303-6ca7-0945a5d6fc0d@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <8463810e-a3bf-1303-6ca7-0945a5d6fc0d@linaro.org>
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

On 11/01/2023 15:30, Konrad Dybcio wrote:
> 
> 
> On 11.01.2023 03:18, Dmitry Baryshkov wrote:
>> On 10/01/2023 20:54, Konrad Dybcio wrote:
>>>
>>>
>>> On 10.01.2023 18:56, Konrad Dybcio wrote:
>>>> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>>>>
>>>> Add the bindings for the CPR3 driver to the documentation.
>>>>
>>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>>>> [Konrad: Add type reference to acc-syscon; update AGdR's email]
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
>>> Need to add
>>>
>>> qcom,opp-oloop-vadj
>>> qcom,opp-cloop-vadj
>>
>> And note that at least for CPR3 they are different between fusing revisions. I see that for CPRh (esp. for 8998v2) they are the same, but this is not the case for 8996 (CPR3).
> If we both mean the "speed bin"-dependent values, the driver
> reads the fuse value but currently does nothing. My guess would
> be that Angelo omitted it, as - just like you pointed out - MSM8998
> (and SDM660 for that matter) don't really use it. I suppose I could
> take care of that in bindings by making this an array and handle it
> separately in a different patchset, as the per-revision values
> aren't *that much* different, and again aren't really of concern for
> the first round of supported SoCs.

No, there are two dimensions there: speed-bin and then cpr fusing_rev, see:

ret = nvmem_cell_read_variable_le_u32(dev, "cpr_fuse_revision", 
&drv->fusing_rev);

While the speed bin determines overall SoC performance characteristics, 
cpr_fuse_revision determines how we interpret the fuse values. E.g. on 
msm8996 some of loop adjustment values depend on fusing_rev. I 
interpreted this as 'the manufacturer could not decide on how to measure 
things'. May be we can support only the latest fusing rev (like we do 
for the SoC versions). But I can not guarantee that it would be enough.

-- 
With best wishes
Dmitry

