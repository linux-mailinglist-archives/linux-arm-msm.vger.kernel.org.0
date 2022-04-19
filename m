Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46070507C57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Apr 2022 00:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355098AbiDSWER (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 18:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343494AbiDSWEQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 18:04:16 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F2EC3E5E6
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 15:01:32 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id g18so24182155wrb.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 15:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/kdwNE7DG0fa7lXe0tL3VOnDNUPISlQiOCjGKMZPfRM=;
        b=Uiw+45WOM+x5+nFNSf5TGYcDv1+RNJJGLePJsEhL8v91gsFXHogqfoLbMGFTFYmXW9
         tZQrsMGYwm/aClx80DT9A9qC7zsvHq//DyDWmAYiESCh2F+oGRVOh8Z7Uvy0zBQJffx2
         xxyRfEkwxQ7EDhBwCISG82nPUSubAYMEzVSaBQsZBix6qiYl7+0oRh6+pLbjkplonloC
         HRV9/Ud1w95zg+embzWkC4W9JGKaV2NMPfhbS9hG+htkilaDuNpgadBtr/6dLk9k2qYu
         adQaa4hRplTLZG0osEcSsqmXIET/oEUEU/Nh/lfeBj6XyrvBTP5wnFfnR+1m2d5RoDr/
         0NNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/kdwNE7DG0fa7lXe0tL3VOnDNUPISlQiOCjGKMZPfRM=;
        b=5RJEgFJ7Q3FS3724lFXLR7QQFaPF76aNBtkKpvJV9hkRmS4vPvFf/EY683/rrzHBHd
         mh03wzB9gSPtwn9o5CpqxCWutCcnwEP6N/pB6Nv5Oi0tQ4ZQ0/GJzZe9Z4cNQ1A/w0W9
         rxcV/NdoF6hLnNmftKOelSADYYUmpYlg8pylSIQWXNqCpDeOAiP37ekAp2mNdM/Jbq3l
         3LSVBkmLNVaEogLcTx7qedUG0TTRh0FZb7DcLC2ZTS+WzavZduKgNMsb7UXYCqqKFigB
         mWspc8C774g4soQiLU1E15VPGlzTggCNEFN2GaUlFieQLZ2bPmbehhpenXXv2uPJKM1e
         taNQ==
X-Gm-Message-State: AOAM533x2INUHKv33BRo82LmJIMW/0dzcAM/lXtn15/kF0SazkpVr6/J
        CN0UpggPaNOPQzi9mfinlmx6jw==
X-Google-Smtp-Source: ABdhPJzayLIUOCsmgTSsf5EVWxTpJGSBstr1EkbRFLrqO7+CgVtznXZkoTOE9+PGskRAc9juSdrSMQ==
X-Received: by 2002:a05:6000:1d9c:b0:20a:ab4a:7247 with SMTP id bk28-20020a0560001d9c00b0020aab4a7247mr2112329wrb.704.1650405690585;
        Tue, 19 Apr 2022 15:01:30 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id u16-20020a05600c441000b0038ebcbadcedsm28938425wmn.2.2022.04.19.15.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 15:01:29 -0700 (PDT)
Message-ID: <29571e9f-f706-715b-5bf9-877e029a1ebe@linaro.org>
Date:   Tue, 19 Apr 2022 23:01:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 2/4] arm64: dts: Add msm8939 SoC
Content-Language: en-US
To:     Vincent Knecht <vincent.knecht@mailoo.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     shawn.guo@linaro.org, jun.nie@linaro.org, benl@squareup.com,
        jwillcox@squareup.com, jgates@squareup.com, mchen@squareup.com,
        zac@squareup.com, Leo Yan <leo.yan@linaro.org>
References: <20220419010903.3109514-1-bryan.odonoghue@linaro.org>
 <20220419010903.3109514-3-bryan.odonoghue@linaro.org>
 <bc6ce23672c52b1f2593fcac720edf9ca9e9fdaa.camel@mailoo.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <bc6ce23672c52b1f2593fcac720edf9ca9e9fdaa.camel@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/04/2022 18:21, Vincent Knecht wrote:
> Hi Bryan, thanks for this much awaited dtsi :-)
> Some comments below, maybe more once I get around to testing it...
> 
> Le mardi 19 avril 2022 à 02:09 +0100, Bryan O'Donoghue a écrit :
>> +       cpr_opp_table: cpr-opp-table {
>> +               compatible = "operating-points-v2-qcom-level";
> 
> Just curious : am I missing something, that I don't see this compatible
> defined anywhere outside binding docs and qcs404.dtsi ?

Not yet but, we do reuse that in 8939 and will be necessary for any 
other SoC with CPR we do.


>> +               apcs1_mbox: mailbox@b011000 {
>> +                       compatible = "qcom,msm8916-apcs-kpss-global";
>> +                       reg = <0xb011000 0x1000>;
>> +                       #mbox-cells = <1>;
>> +                       clocks = <&a53pll_c1>, <&gcc GPLL0_VOTE>, <&xo_board>;
>> +                       clock-names = "pll", "aux", "ref";
>> +                       #clock-cells = <0>;
>> +                       clock-output-names = "a53mux_c1";
>> +                       /* Set a nominal frequency on a53mux_cci */
>> +                       assigned-clocks = <&apcs2>;
>> +                       assigned-clock-rates = <297600000>;
>> +               };
>> +
>> +               apcs1: syscon@b111000 {
>> +                       compatible = "syscon";
>> +                       reg = <0xb011000 0x1000>;
>> +               };
>> +
> 
> Is it okay that unit and reg addresses don't match ?

Prima face, not in the slightest typo/bug.

Thanks for the pointers on the lk2nd matching.

---
bod
