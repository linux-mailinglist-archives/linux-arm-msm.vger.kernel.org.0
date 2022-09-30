Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44D4B5F136E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 22:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232693AbiI3UPn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 16:15:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232369AbiI3UPU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 16:15:20 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69CD93FD6C
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 13:14:27 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id s10so5912144ljp.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 13:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=2DKKLNWwI4YZ7zo849w1mJYMlwU+TjabYKTZOI7iub8=;
        b=Hmgudi73QiQo7WD7u7ujskGY5wXxVpWJ7QkGt2UwpHQj6Z1+LkavxAqx43wBF/nMRk
         SymsJjJA53m9IkUvgN/Nac2Mj6SMlzea72DNETgdNfCxfAlXWstoFbBgKTKeXTHMDu4o
         E+4pGK78H/g/RxmKHmQbaoik7gdrK3fJogX24Hxkq8eMlXysro3Nn7lClsFvLF8DPNn9
         QicXaDYfpm0yj6RhCUT+uG1QlpYky/QJa2LQIG+VxiEcd0PzXGYStG9V6+MoCiM4IyZh
         zYw0Y8R3G+3INKvQO0pUjWgbhZyI44UIrZWrAy+j5UA7g/4zGHuWRwySVTtHa62TnqzK
         sSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=2DKKLNWwI4YZ7zo849w1mJYMlwU+TjabYKTZOI7iub8=;
        b=RxSiLm0obSWBmwDgMcXM40XKJ+BRsM/uN4xCDYVtJayNjJCIs2oIgHO+lhOs8qj/ao
         I00DAlwqtmiEHtFuvUJOEmMmbsPA6yxnfkToYAIo2DKOh2LyjTKHozJ/lpdC44FTVeTG
         Cy7hzPX+fYvlzVwzXL+iljflQ0LkWifioaTxUAF+RaO0r4Gjtz6XlSXv/+Yqn07srZ6J
         C4eF7GM2wYn39bLyAG9fW98yUXOOgc8uVjsV+19QF7C71RdtiiaG6WvMMm2Z3y0ogoCl
         H5Ieh+8cuQ1gUVbhsUPpOxntRbVTHUw9/7JSo7WnRgx9NukkHGjUj7+Fq580g+DHvGzg
         OTGw==
X-Gm-Message-State: ACrzQf2RE0I3inv25qBQUCxJKEvdLb+xbCgxC2zrXnvL9kvO/DIgGxEI
        Wqr5iOFr9mFR/nviVX+W6QcuBg==
X-Google-Smtp-Source: AMsMyM6lKhuHtYk2HLOXyOJf5y/btqsSrOpUv3D/XNm7mfVr9XM+28jtC6pzsmyW5xthFg4Ff3omnQ==
X-Received: by 2002:a2e:22c6:0:b0:26d:94f3:1142 with SMTP id i189-20020a2e22c6000000b0026d94f31142mr3178569lji.101.1664568865543;
        Fri, 30 Sep 2022 13:14:25 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u1-20020a056512128100b0049ae3ed42e8sm408879lfs.180.2022.09.30.13.14.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 13:14:25 -0700 (PDT)
Message-ID: <674d8892-7a51-1104-d209-fada9c09da97@linaro.org>
Date:   Fri, 30 Sep 2022 22:14:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/8] arm64: dts: qcom: sdm845-tama: Add display nodes
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220930191049.123256-1-konrad.dybcio@somainline.org>
 <20220930191049.123256-2-konrad.dybcio@somainline.org>
 <2c1c5d8a-fb7f-bc98-ed6b-021eb00f990f@linaro.org>
 <baf046ab-eda2-e8ee-d87f-8d8340823f60@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <baf046ab-eda2-e8ee-d87f-8d8340823f60@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/09/2022 22:10, Konrad Dybcio wrote:
> 
> 
> On 30.09.2022 22:10, Krzysztof Kozlowski wrote:
>> On 30/09/2022 21:10, Konrad Dybcio wrote:
>>> Add required nodes to support display on XZ2/XZ2c. XZ3 has a
>>> different power rail setup and needs to be handled separately.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>>> ---
>>>  .../qcom/sdm845-sony-xperia-tama-akari.dts    |  4 +
>>>  .../qcom/sdm845-sony-xperia-tama-akatsuki.dts | 44 ++++++++-
>>>  .../qcom/sdm845-sony-xperia-tama-apollo.dts   |  6 ++
>>>  .../dts/qcom/sdm845-sony-xperia-tama.dtsi     | 96 +++++++++++++++++++
>>>  4 files changed, 149 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dts b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dts
>>> index 34f84f1f1eb4..d97b7f1e7140 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dts
>>> @@ -11,3 +11,7 @@ / {
>>>  	model = "Sony Xperia XZ2";
>>>  	compatible = "sony,akari-row", "qcom,sdm845";
>>>  };
>>> +
>>> +&panel {
>>> +	compatible = "sony,td4353-jdi-tama";
>>
>> git grep suggests it is not documented. Is it coming via different patchset?
> As mentioned in the cover letter, yes.

I didn't get it. Neither did lore:

https://lore.kernel.org/linux-devicetree/20220930191049.123256-1-konrad.dybcio@somainline.org/

"Message-ID <20220930191049.123256-1-konrad.dybcio@somainline.org>
not found"

Best regards,
Krzysztof

