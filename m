Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0016268BB44
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 12:22:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbjBFLWC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 06:22:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbjBFLWB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 06:22:01 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A72F81E1D0
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 03:21:59 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id fi26so11266294edb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 03:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZK68PbjBgg4M4gPDk5TqCOuYlcFHTmMeQziL+2MsNis=;
        b=h2975W79UPeeiMEZ9AHtojxXjXqOEhIDNnOz1yRgLa3z3fTqwO5ib5AUvbn9kl8Xus
         eI8miGLIVwq79HupZGifhB8PqSOJOrF3JDBYP9XNQu6f96B9HxrjXCkpZnSvKxzx3/2M
         ULpkreJdUypaoZ4c537hHg2Mc8bA3z7ON/M2VvT/4XImGF+E34CktBe/FPDQi92zzIzu
         Dv0whz5pE5h+HT/IjJWz9A/ZKv6/8yQWVSpYxMnOpxzV8RqxdMraMlxriEBf42SlCKQ1
         mHjsp0TkTypKa8fR7mjQEXGmXuRe4rni2pR3H3xMhNAKgnTn0n9siJbq78W6jHRBRfEs
         Z26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZK68PbjBgg4M4gPDk5TqCOuYlcFHTmMeQziL+2MsNis=;
        b=FLy7WVBdxWYKlcOrbFAtE2tK6mpw5bSSb46qPiRi3oZ8XHoXdPdCo3V67P2SwmNLB8
         ZQTaM1EtO77/G6pm1qTEtazNoyL5+vDgLX4bwANhpxNysPRtvkY2rweyDIYLXZpMfXoj
         e25/R0ZqoM+RB+w9j4X5yiiyqmGN09/bSxCGxR2zCzySdXtMIAus0sAoayfPi8XLLvbq
         iaGecIbyk/J0vGta39czcGSl70v64HeVC2Vtz0Hwyi5UULDRZQjyP0xsRGjUjxAyC2hn
         zejL0TBQ2+08jcx8c+B/+UXi+OXHHs1Yb4W7Mxk86smO/edUOkSgshLfceFyoEioc3PV
         Gf5A==
X-Gm-Message-State: AO0yUKUoz5BhvT29DuygjVBB950vz5N2C5eBWSBw/CGupnpb9TsYPJUs
        efm6lSKZqa2VrGahU1AmHWrGcA==
X-Google-Smtp-Source: AK7set9MAC+HCPhW7u6DHBaY5VdUEuLOfkagFMD0u5hl4QeVmrZYor/UME665PgvQT+hcODcQdZlcA==
X-Received: by 2002:a50:fe86:0:b0:4a0:e415:d39f with SMTP id d6-20020a50fe86000000b004a0e415d39fmr17308791edt.41.1675682518249;
        Mon, 06 Feb 2023 03:21:58 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id h23-20020aa7c957000000b00487fc51c532sm4971343edt.33.2023.02.06.03.21.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 03:21:57 -0800 (PST)
Message-ID: <5c2df97d-43a3-ccdb-267e-4dc5485dbeb2@linaro.org>
Date:   Mon, 6 Feb 2023 13:21:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sm8450: add
 RPMH_REGULATOR_LEVEL_LOW_SVS_L1
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
References: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
 <20230206002735.2736935-4-dmitry.baryshkov@linaro.org>
 <a38a7ba4-a336-3ad2-7dcd-4eb2195eb0ef@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <a38a7ba4-a336-3ad2-7dcd-4eb2195eb0ef@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/02/2023 12:44, Konrad Dybcio wrote:
> 
> 
> On 6.02.2023 01:27, Dmitry Baryshkov wrote:
>> Add another power saving state used on SM8350.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   include/dt-bindings/power/qcom-rpmpd.h | 1 +
> Wrong patch once more?

This patch is wrong and was sent by mistake

> 
> Konrad
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
>> index 4a30d10e6b7d..1bf8e87ecd7e 100644
>> --- a/include/dt-bindings/power/qcom-rpmpd.h
>> +++ b/include/dt-bindings/power/qcom-rpmpd.h
>> @@ -211,6 +211,7 @@
>>   #define RPMH_REGULATOR_LEVEL_MIN_SVS	48
>>   #define RPMH_REGULATOR_LEVEL_LOW_SVS_D1	56
>>   #define RPMH_REGULATOR_LEVEL_LOW_SVS	64
>> +#define RPMH_REGULATOR_LEVEL_LOW_SVS_L1	80
>>   #define RPMH_REGULATOR_LEVEL_SVS	128
>>   #define RPMH_REGULATOR_LEVEL_SVS_L0	144
>>   #define RPMH_REGULATOR_LEVEL_SVS_L1	192

-- 
With best wishes
Dmitry

