Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02E3C73F5B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 09:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbjF0Had (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jun 2023 03:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231705AbjF0HaB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jun 2023 03:30:01 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE78E116
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 00:29:58 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f9bdb01ec0so50434955e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 00:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687850997; x=1690442997;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qjboc+xRA+5/Im3aAxTzJEYSFeQipRxlSvx/9SK3lrU=;
        b=oi3ilyANNmTm2Aaqmp0ktOiRHJLm2A6c62aNuawNccYP71KS5yUdkwgjTCLXl9aZ4+
         IIlXa1NJ6sTz1fNMpZvL/wJpTnfkm3RIWhcgJd3k9rxLeLrhxPwZJ0tuLPD6MeFyuLkS
         +iQ7218KUpqhm/9gowun6cVYQuo/cUaDCn2vWfU1QDT3MQ8yTCfj0o1DEUwTlWS8YqtY
         zj5cY+RonNHvDloEOkZ/2zphBYbDH34dkDJPz+qnJwVVu8lFp1AUkI9/5HER1vtGIbSe
         gWHNAQzy65uG4+HLgv62CJ+lf39DqieRY5/BBAXtFMbJ99NnlOwbRzhvyrKpbT8oH270
         xzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687850997; x=1690442997;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qjboc+xRA+5/Im3aAxTzJEYSFeQipRxlSvx/9SK3lrU=;
        b=gLdVOpRv8stvyBcjyVFoeODM0vy1L5uHSYXrRA+kAlvrRTnbkzmNvRsJFJhXvpML1n
         chpUUE6JP3Ip6LYRA2VBDx6lqceicUbOLnRex9uWD4NQDkfCXgpoUNeeWv8STf+iF8nT
         t0Y8GY410gn8sjcxBXJvc3Gy+2zrwYOYB06YQf1drCWi3KKTLfNJBimjAgx9ZDlMPbNP
         33vOapRg0rTI1u7zqnivVmOq29KB3VNi1ta/qe3+ElFPfwjGIREv5qGYkm16Trqw4d3g
         NP5vPos07ADdEW8VVNW+iK/IKJtToftEIuJMzi1XW3vpi1MnM+PWCpTVawJ+R2ziPRS6
         d/YQ==
X-Gm-Message-State: AC+VfDyNE6evSvqNzHHRhMUwkt6TE/WEbh/C+mRVFwITFFt25MmCFoTE
        EhZaHDEPla98pQQFGBSna6JjaA==
X-Google-Smtp-Source: ACHHUZ51W0XH+MCfGadI2HPaObAXxQwBLGQlelvw5W3jHORJ6RAko8vEzlCs6yHDqMqGAAsQ8Ej2ag==
X-Received: by 2002:a1c:7419:0:b0:3f9:b79d:a5fa with SMTP id p25-20020a1c7419000000b003f9b79da5famr16403219wmc.16.1687850997154;
        Tue, 27 Jun 2023 00:29:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id h10-20020a5d504a000000b00313e8dc7facsm7714556wrt.116.2023.06.27.00.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 00:29:56 -0700 (PDT)
Message-ID: <683a6f7e-bf1a-aff2-070b-472fb14e0353@linaro.org>
Date:   Tue, 27 Jun 2023 09:29:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 03/15] dt-bindings: clock: qcom,dispcc-sm6125: Require GCC
 PLL0 DIV clock
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Lux Aliaga <they@mint.lgbt>
References: <20230624-sm6125-dpu-v1-3-1d5a638cebf2@somainline.org>
 <c9681bce-efa8-9b79-4bf6-837dd6a2dc12@linaro.org>
 <55b0ca89-8f2e-5383-59d4-6809e813abf8@linaro.org>
 <vnp263d43flny2ibt3n7fbloyi26enqrejnobogplfu5fcj6l3@s7zkxrsi2rde>
 <52c57cab-10cf-2e7e-2c1d-fa6506786d45@linaro.org>
 <jmtjuya4c423rmdlo4ubvvqndbxvgapal5otjqnejdpdd25izp@kewbjmqdu2xs>
 <6311f26f-79ee-c471-649f-5e0b4629cfcc@linaro.org>
 <uuy5prkjhhs66te7h6z3pu4lzj2cfbiqk6ftjijwoeqpw573av@ogs6cboanvzc>
 <ziykmixskqkgheigefvyo4q3katbc4uix6jtcg7mncs25z4tj5@5gykrfgns4bm>
 <16731023-7dc7-d43d-1b16-fda44c0948ed@linaro.org>
 <yofju7jp7vmv33x7dzvzoelpumfsz3fjqy2ozakfphsuysunon@pglt2wzlsjex>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <yofju7jp7vmv33x7dzvzoelpumfsz3fjqy2ozakfphsuysunon@pglt2wzlsjex>
Content-Type: text/plain; charset=UTF-8
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

On 27/06/2023 08:54, Marijn Suijten wrote:
> On 2023-06-27 08:24:41, Krzysztof Kozlowski wrote:
>> On 26/06/2023 20:53, Marijn Suijten wrote:
>>> On 2023-06-26 20:51:38, Marijn Suijten wrote:
>>> <snip>
>>>>> Not really, binding also defines the list of clocks - their order and
>>>>> specific entries. This changes.
>>>>
>>>> And so it does in "dt-bindings: clock: qcom,dispcc-sm6125: Remove unused
>>>> GCC_DISP_AHB_CLK"?
>>>
>>> Never mind: it is the last item so the order of the other items doesn't
>>> change.  The total number of items decreases though, which sounds like
>>> an ABI-break too?
>>
>> How does it break? Old DTS works exactly the same, doesn't it?
> 
> So deleting a new item at the end does not matter.  But what if I respin
> this patch to add the new clock _at the end_, which will then be at the
> same index as the previous GCC_DISP_AHB_CLK?

I think you know the answer, right? What do you want to prove? That two
independent changes can have together negative effect? We know this.

Best regards,
Krzysztof

