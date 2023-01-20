Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 837A76760CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 23:55:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbjATWzB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 17:55:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbjATWzA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 17:55:00 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D99D129E1E
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 14:54:29 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id j17so10212235lfr.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 14:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hbm1EsGZAeT2mHTFiqh0Dx28LeC9mCKTbUcH0BzL/No=;
        b=mpB0UJHp3a+W4Up5ODk4M/2agnrtRI29W7jdtrMM7sUitAEWVM0wn5iQVGuvoaEGgE
         6KIO6Ww3/MGhL0X73TxjqOkp2UgPHhe9QOq9A4V2txjt4REmD0oVtS2bnaGUs/bTC4iR
         f8JvVwXUcyCMkDyR+av/kZ639ZXYLPvgRG02Fp4L834KU7JkUDuCueeJZQoTsaUNXmRF
         UDSLjXx/p3BG8KUFVISw/lGWZoY9W+ZD6VI+T39nbT8GmxB2iskrWQJ/i3+VhkzIDT1f
         k5cR3I6m4xyyvgwmCG9G0h3v8v2lLkiogUo83rSf9sg5zmvxe4DB0bAM7OtIaA1ClEye
         BJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hbm1EsGZAeT2mHTFiqh0Dx28LeC9mCKTbUcH0BzL/No=;
        b=HkGWCPpSR/y38Fk7UsMuYuZmkfR4fTfCeCxZRqZPhBhCwUTo/2TXeJy1tJIWfRBeQY
         nNYo5gg5ckkVdSBGd7KesmyFDu8B5Erx2NAxZNPpk85Ue8ZYupaP8PiJfihCYFr968Z3
         Ntk73cwQlxrTtulzCeu/7xNYJvfOwo9nYeN+vggYfpGcEjeaGQ54p/nZtc65QXBr+S39
         7nRn8W4Y3DzVvjftB/s/TYlyP6vVH/vweJDdiXkimbhFn/TgAVPthwhrtocfaN6S3bb2
         VwbLe7VZt0+fl/liIOkujOmGS+s1UyqoVKAiwllfMbo2FQXdbk0wTvYG20vBH/GMHysd
         3JKQ==
X-Gm-Message-State: AFqh2koGGw0UsgEvLvSPyoXROx8Luk/8mSeGGz1hcnR/CFnziyFSrLFy
        35X8YG0ZgW2NM67JcuBc139pTw==
X-Google-Smtp-Source: AMrXdXu7FVclTVblU/bHESbrokULCekzEfzB978ZHJVMnBBS6ReI9nV7Te2jsL6OuDizMc61dMzDpg==
X-Received: by 2002:a05:6512:143:b0:4cc:a1a1:9aaf with SMTP id m3-20020a056512014300b004cca1a19aafmr3834418lfo.23.1674255203191;
        Fri, 20 Jan 2023 14:53:23 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j5-20020a05651231c500b004b5480edf67sm6197207lfe.36.2023.01.20.14.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 14:53:22 -0800 (PST)
Message-ID: <3a355075-cc29-957a-678b-2a05aed25587@linaro.org>
Date:   Sat, 21 Jan 2023 00:53:21 +0200
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
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <078c5a8254ac006b65fc5fa81dfbc515.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/01/2023 00:11, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2023-01-19 22:14:13)
>> Turn CBF into the interconnect provider. Scale CBF frequency (bandwidth)
>> according to CPU frequencies.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/clk/qcom/clk-cbf-8996.c | 143 +++++++++++++++++++++++++++++++-
>>   1 file changed, 142 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/clk-cbf-8996.c b/drivers/clk/qcom/clk-cbf-8996.c
>> index 9cde0e660228..b049b4f7b270 100644
>> --- a/drivers/clk/qcom/clk-cbf-8996.c
>> +++ b/drivers/clk/qcom/clk-cbf-8996.c
>> @@ -5,11 +5,14 @@
>>   #include <linux/bitfield.h>
>>   #include <linux/clk.h>
>>   #include <linux/clk-provider.h>
>> +#include <linux/interconnect-provider.h>
>>   #include <linux/of.h>
>>   #include <linux/module.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/regmap.h>
>>   
>> +#include <dt-bindings/interconnect/qcom,msm8996-cbf.h>
>> +
>>   #include "clk-alpha-pll.h"
>>   #include "clk-regmap.h"
>>   
>> @@ -225,6 +228,133 @@ static const struct regmap_config cbf_msm8996_regmap_config = {
>>          .val_format_endian      = REGMAP_ENDIAN_LITTLE,
>>   };
>>   
>> +#ifdef CONFIG_INTERCONNECT
> 
> Can you move this driver to drivers/interconnect/ ?

Only the interconnect part? At some point I considered dropping the 
whole CBF mux support and moving the whole driver to 
drivers/interconnect, but I could not find a good way to use alpha-pll 
from the interconnect driver. Would you recommend one?

> 
>> +struct qcom_msm8996_cbf_icc_provider {
>> +       struct icc_provider provider;
>> +       struct clk *clk;
>> +};
>> +
>> +#define to_qcom_cbf_provider(_provider) \
>> +       container_of(_provider, struct qcom_msm8996_cbf_icc_provider, provider)
>> +
>> +enum {
>> +       CBF_MASTER_NODE = 2000,
> [...]
>> +static int qcom_msm8996_cbf_icc_remove(struct platform_device *pdev)
>> +{
>> +       struct icc_provider *provider = platform_get_drvdata(pdev);
>> +
>> +       icc_nodes_remove(provider);
>> +       icc_provider_del(provider);
>> +
>> +       return 0;
>> +}
>> +#else
>> +static int qcom_msm8996_cbf_icc_register(struct platform_device *pdev)
>> +{
>> +       dev_warn(&pdev->dev, "interconnects support is disabled, CBF clock is fixed\n");
>> +
>> +       return 0;
>> +}
>> +#define qcom_msm8996_cbf_icc_remove(pdev) (0)
> 
> It's like two drivers in one.
> 
>> +#endif
>> +
>>   static int qcom_msm8996_cbf_probe(struct platform_device *pdev)
>>   {
>>          void __iomem *base;

-- 
With best wishes
Dmitry

