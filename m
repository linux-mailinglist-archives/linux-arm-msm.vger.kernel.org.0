Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A98DB7129F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 17:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244218AbjEZPxy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 11:53:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244219AbjEZPxw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 11:53:52 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E7D513D
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 08:53:50 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-51478f6106cso1095419a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 08:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685116428; x=1687708428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dn6aRVtsB7lJHlQ+n3cjJ7Hpri7VOVYN2SL9x9E1NRA=;
        b=Q3L0DQh3ZNrcNumkcoYeh19QFAYjP2+Wit2aWVCaU5p8BCmKAhQiz2Ys+9M+2Vr3ed
         xDgzXdBwjJkV/cVl7ep7MO5xfuAPkzwI3GGa/pSrrNUE9We2pPNvqY43SW+4SIZEa/M+
         VXSM00wfEujSPtaG2C/UXVAZPxzSUfCL1IKMczI9oPZILIhtO1eYmREN3GQ3U/CekD1i
         ri7XKn/wlQwqRyum3s5usItRE6zSo0mc7aJNe1GgqVB2P+9inzVUeinJzLRsT7tu5eEy
         PeNqOnskk9yc6pMDweKCN/Mx73jBDwxj3Z1mcy85T+GF8sZNmhu02JF8La/ow1sEL3Tm
         Oc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685116428; x=1687708428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dn6aRVtsB7lJHlQ+n3cjJ7Hpri7VOVYN2SL9x9E1NRA=;
        b=CKiCVDUQ6zqjrr6xQ1HbXBQmITm9AX+Pmc7CzZb38CR3hSoT1A/tsr1rRRypX1HMXJ
         mwiFzRs2yzs0WshdMYT3W7mSDC2sgmPYApJgMEU4UtV1btnMkUs87ExHIcsCI16HoPK/
         5RAS87xCAAzNEOvxeZ8cI3isMIQBYURo1m3QtzRbsyEjMSod0PTPz9AqLMW6LQO+u7I2
         1ysCXIjj6rVYbZHbiUjiPsnSbXZr2S244PxzbHErNBPvvL/Ac6vkfgdDv+t226tMKem6
         PinAXZfy4jVd6Y3PLxhR5VTuevV6ZLucDD98P3aymBqz4BvfYBJyg4T1wumoM3TCV+d5
         /T+Q==
X-Gm-Message-State: AC+VfDwRti9zTyF+0prgtfse8GlJ7a4SHGRhnv3Q6QmAG/6UyfakS2Pk
        2elXZE3UDMNayngAgFoKE+l4IbpI6bywK2OTvvg=
X-Google-Smtp-Source: ACHHUZ6VEuV8/df/LpPQcZFhpinqdGRwuetT29m9eh7mboiTxmRAM1CNcXRbK/iX7kdA2y4v/XUhTg==
X-Received: by 2002:aa7:d8d4:0:b0:514:25a4:3074 with SMTP id k20-20020aa7d8d4000000b0051425a43074mr1750283eds.3.1685116428674;
        Fri, 26 May 2023 08:53:48 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u14-20020aa7d88e000000b0050da1edb2e4sm85463edq.31.2023.05.26.08.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 08:53:48 -0700 (PDT)
Message-ID: <7074f718-a3d5-8a03-3830-77a5a0b15500@linaro.org>
Date:   Fri, 26 May 2023 18:53:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V2 3/6] clk: qcom: clk-alpha-pll: Remove explicit CAL_L
 configuration for EVO PLL
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20230525172142.9039-1-quic_jkona@quicinc.com>
 <20230525172142.9039-4-quic_jkona@quicinc.com>
 <6e1d098d-03b9-aa63-a0bf-6cf748a0db0d@linaro.org>
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <6e1d098d-03b9-aa63-a0bf-6cf748a0db0d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/05/2023 12:33, Konrad Dybcio wrote:
> 
> 
> On 25.05.2023 19:21, Jagadeesh Kona wrote:
>> In lucid evo pll, the CAL_L field is part of L value register itself, and
>> the l value configuration passed from clock controller driver includes
>> CAL_L and L values as well. Hence remove explicit configuration of CAL_L
>> for evo pll.
>>
>> Fixes: 260e36606a03 ("clk: qcom: clk-alpha-pll: add Lucid EVO PLL configuration interfaces")
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>> ---
> Oh that isn't obvious at first sight, nice find!
> 
> I'd suggest a different solution though:
> 
> #define LUCID_EVO_PLL_L_LVAL	GENMASK(..
> #define LUCID_EVO_PLL_L_CAL_L	GENMASK(..
> 
> lval = FIELD_PREP(LUCID_EVO_PLL_L_LVAL, config->l) |
>         FIELD_PREP(LUCID_EVO_PLL_L_CAL_L, config->cal_l);
> 
> This would make the separation between the two parts more explicit
> 
> however
> 
> config->l would then represent the L value and not the end value
> written to the L register

Yes. I think there should be separate config->l and config->cal_l values 
(and probably ringosc_cal_l, basing on the comment in the source).

Just a question: is camcc-sm8550 using the same PLL type or is it some 
kind of subtype of lucid_evo PLL?

-- 
With best wishes
Dmitry

