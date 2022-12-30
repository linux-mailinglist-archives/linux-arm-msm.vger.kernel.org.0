Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF12659EA3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Dec 2022 00:45:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235707AbiL3XpR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Dec 2022 18:45:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235849AbiL3XpN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Dec 2022 18:45:13 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 395101E3CA
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 15:45:08 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bt23so16898914lfb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 15:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TSXcQh5yj6pe+URG/mEbeGX1ocxI1UpYdSqZASqwkHM=;
        b=E/pjItyzKuV5hJl98mTuZh8hnFdghki0VAvBSzlNyRukhqwCt3rzD+TOuFeUugTmYu
         BJVGD4zGxeIOm9+jxMsGuKUa4VptqlqCFSuZCBfD1atE1gaCGien2iF3hi56xpPePaXL
         xMIxIQVuxEf+3KcF27lK4BFqAVn3lqwtRExgSRArAih729kh1n05B0ZBzg8DAMcFSOi/
         UH+tFQKg++nNZC3cr5nccUf9/qOBdboQPDTLli0ds9eGZFqna3Ywf6syGK1ZGh/yHP4f
         XT7f6wgzCCCM2h09Oc79sQbmz/zEZ0mrq/wh22IiMT1iPfdO1x9h0KQpXreUuEXMzybz
         JaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TSXcQh5yj6pe+URG/mEbeGX1ocxI1UpYdSqZASqwkHM=;
        b=FG4gunRx1iLdUKiXrKr3AbQ4E14grUYtZHCvK0nAR1MbRxKTm77JubyXgAlwIWuZMM
         Xs9z872o+TLWr2LZdgyEdekNWUGwFx+MsU9sLwTNeCtqhsT42TFr6xlY+7fMf4cRByPl
         qigjb+9fL31QMyeSrdjl1gbv4f8CpesBCfCYMWanPOP03kCqXXmUZoPnizX/msjuIXwU
         n9itQF4UV6kFUg1xxoO+5EFnpE0c3CAyz4ubnzZrijqQa6VZCeg6yNpeNkEnrKl3Bywp
         HNwXnj9EL9g3utAm9RUDpyXZoZXh/SgJWneqsXoglu+GtMKVxRolTGsV/MQ06+Z16xeE
         PyEQ==
X-Gm-Message-State: AFqh2kr7dm44nLXUfTVuywQJ4YRXmksDWtDHY+DZixnhvtOhAdq93563
        48zx9nvmk0AbfMbz1j/ryPYWQbhfSy+HCRVB
X-Google-Smtp-Source: AMrXdXsjjEfAKXNASXjhI5LYsxl2MFfVl5qUEbuX/kbsaA4+OiVC9IKtc611iia7ja0Zh9LN22qEXQ==
X-Received: by 2002:a05:6512:10c3:b0:4ca:dee9:543a with SMTP id k3-20020a05651210c300b004cadee9543amr11890887lfg.32.1672443906592;
        Fri, 30 Dec 2022 15:45:06 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id t22-20020a056512209600b004b575d239besm3656408lfr.237.2022.12.30.15.45.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Dec 2022 15:45:05 -0800 (PST)
Message-ID: <f21704f2-b835-012f-c018-690d954e90d5@linaro.org>
Date:   Sat, 31 Dec 2022 00:45:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8250: Touch up audio hw nodes
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221230135044.287874-1-konrad.dybcio@linaro.org>
 <20221230135044.287874-2-konrad.dybcio@linaro.org>
 <4d847dbf-c417-eb82-9ae7-53c52844270d@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <4d847dbf-c417-eb82-9ae7-53c52844270d@linaro.org>
Content-Type: text/plain; charset=UTF-8
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



On 30.12.2022 17:08, Krzysztof Kozlowski wrote:
> On 30/12/2022 14:50, Konrad Dybcio wrote:
>> - Expand long clock-names into vertical lists
>> - Shuffle properties around:
>>   - Make sure compatible goes first and status goes last
>>   - Make property order consistent between similar nodes
>> - Fix up indentation
>> - Remove stray newlines
>> - Remove a redundant comment about swr2 being associated with TX macro
>>   (it's obvious by looking at the label property 10 lines below)
>> - Change unnecessary interrupts-extended to interrupts
>> - Disable SWR0 and WSA macro by default and enable them on SM8250 MTP and
>>   RB5, which were the only users
>> - Remove stray #address/size-cells from txmacro, as it's not even
>>   supposed to have children
> 
> You duplicate here some work:
> https://lore.kernel.org/all/20221225115844.55126-4-krzysztof.kozlowski@linaro.org/
> 
> and maybe:
> https://lore.kernel.org/all/167233461775.1099840.3444272939352778399.b4-ty@kernel.org/
> 
> If you wish to avoid trivial cleanup conflicts, feel free to poke to my
> pending branch:
> https://github.com/krzk/linux/commits/pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
> 
> Also, this is a mixture of non-functional changes (re-ordering,
> whitespace) with something close to functional (interrupts-extended ->
> interrupts, disabling nodes in DTSI). These should be split.
Thanks for pointing this out, I'll resubmit these soon!

Konrad
> 
> 
> 
> Best regards,
> Krzysztof
> 
