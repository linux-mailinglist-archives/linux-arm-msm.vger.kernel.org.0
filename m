Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEA9B5BA02F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Sep 2022 19:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbiIORBZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Sep 2022 13:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229869AbiIORBX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Sep 2022 13:01:23 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44E245F107
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 10:01:22 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id f9so30652767lfr.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 10:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=HemRH6FXyEMReEGA4gG5S0D7Mh5v3eIWKFlwYllIjsE=;
        b=XCoMssTreOlAx9p5XjWOv1J/8edxMx8QtVhXsoxiMvd9eqPs3dst4+MdQUYk5+wRQd
         LyLC+msHSmKK1ogRc7ev46ISNgHsLgimy3g0Csdf2Y4fJZR8SmaL+oqFGyL4RUxBqD9u
         3lVwU7hmJksRpujfTXYXtRoO/n9LH5pSm8J3hHzkmlIQrDT+/GZDZw9IRx7nXs0Z9zBV
         es4TLDsHmsAnX9ARCw0PnjLcdMnFme9bGV2K9MQ/sfANK/Gw12GVsZScJBSkdxYgasue
         lDl8B/mbtpwYsYbAqnrc0gGBC2JBfAmG/uRawxCDGlDvEE+k/3aAkMwOeS+1ENRaHx3h
         HsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=HemRH6FXyEMReEGA4gG5S0D7Mh5v3eIWKFlwYllIjsE=;
        b=BWdJGcD7znRkLG4tBDJrTljkv9dJRtPTYAhCIqRjF+Cr1Rgq2q21hULbQbCDa0YzTw
         zc5dBBBmrzGkJtaJM7PCT7Ck+J1lk9iJQZcCsMbDEWrA5DGv1acEiu1NcRDfU5GmhP2b
         ZjNOJpjusivE4QfSLC0PPcO7AVKB9Q0EY6VGbtxRNOSd4Jjvm1iVR+ICGsry8QXgnUGn
         qhhZhTDNbifV8BCRKFd3V1wGce1fw2wdLhcD7aliuR20vvXQQ9SUwSs6oAeh7m1JPd86
         0Ufs/POs+cAjZbhQWfTW27ezvZyue2Cu8A0lRgKYHLFBaauBRzOuiCQIqnqGvnZi9oem
         pz+g==
X-Gm-Message-State: ACrzQf1DrBAkSt+GernHt0egrhL1A7KVEnDyZ4E/FtwLhEdrQIAxPVyT
        v69Efr7qD9E2DMHcyjXiWomhrg==
X-Google-Smtp-Source: AMsMyM6Q97H5vBINpC9jMr0i1EF0iLlDm2HA3qIx173ZB+GQcUADB1sCV6WqA7a4C/dAO0lesptagg==
X-Received: by 2002:a05:6512:3d8c:b0:49a:4872:858 with SMTP id k12-20020a0565123d8c00b0049a48720858mr263481lfv.145.1663261280500;
        Thu, 15 Sep 2022 10:01:20 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a10-20020ac25e6a000000b0047f7722b73csm3055296lfr.142.2022.09.15.10.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 10:01:20 -0700 (PDT)
Message-ID: <b0c7e6c8-a2f4-b5e7-89a2-a3a25b0d9874@linaro.org>
Date:   Thu, 15 Sep 2022 20:01:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 0/6] clk: qcom: cpu-8996: additional cleanup for the
 driver
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Yassine Oudjana <yassine.oudjana@gmail.com>
References: <20220714100351.1834711-1-dmitry.baryshkov@linaro.org>
 <013f2dd7-c15f-5b0e-c98a-595dd4d5a2c5@linaro.org>
 <20220914031928.i6x6gumzcvdilgh3@builder.lan>
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220914031928.i6x6gumzcvdilgh3@builder.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/09/2022 06:19, Bjorn Andersson wrote:
> On Fri, Sep 09, 2022 at 01:22:40PM +0300, Dmitry Baryshkov wrote:
>> On 14/07/2022 13:03, Dmitry Baryshkov wrote:
>>> This patch series depends on patches 1-5 from [1].
>>>
>>> Path 1 is slightly fixed version of patch 6 from the mentioned
>>> patch series (fixed to use parent_hws where applicable). The rest is
>>> minor cleanup of the driver.
>>>
>>> [1] https://lore.kernel.org/linux-arm-msm/20220621160621.24415-1-y.oudjana@protonmail.com/
>>>
>>
>> Gracious ping. Yassing, Bjorn, Konrad?
>>
> 
> As I haven't heard anything from Yassine or Konrad I went ahead and
> tried to pick this, unfortunately [1] doesn't apply.
> 
> Could you please rebase the patches from [1] that you want applied and
> resubmit that?

I just checked, patches from [1] apply cleanly on your for-next tree. 
Could you please doublecheck?



> 
> Thanks,
> Bjorn
> 
>>>
>>> Dmitry Baryshkov (5):
>>>     clk: qcom: cpu-8996: switch to devm_clk_notifier_register
>>>     clk: qcom: cpu-8996: declare ACD clocks
>>>     clk: qcom: cpu-8996: move ACD logic to
>>>       clk_cpu_8996_pmux_determine_rate
>>>     clk: qcom: cpu-8996: don't store parents in clk_cpu_8996_pmux
>>>     clk: qcom: cpu-8996: use constant mask for pmux
>>>
>>> Yassine Oudjana (1):
>>>     clk: qcom: msm8996-cpu: Use parent_data/_hws for all clocks
>>>
>>>    drivers/clk/qcom/clk-cpu-8996.c | 191 +++++++++++++++++---------------
>>>    1 file changed, 100 insertions(+), 91 deletions(-)
>>>
>>>
>>> base-commit: ca48adcc40b09d7f26a7754d4d54cfc4bd611f38
>>> prerequisite-patch-id: ff67ff7bea1aef8e367a2589c46cf2c9ebb48664
>>> prerequisite-patch-id: 1fdf02d8161689f3e571816d73ec94b115f51c34
>>> prerequisite-patch-id: 837945fbb40427dac2e95a58b7660a3cf26d7d53
>>> prerequisite-patch-id: df10945929f6f558c1363a23e2993d748a40236f
>>> prerequisite-patch-id: a657a27256ef4be0cb932cb0ca7b3e4768e466f9
>>
>> -- 
>> With best wishes
>> Dmitry
>>

-- 
With best wishes
Dmitry

