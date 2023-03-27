Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7020B6CAEE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 21:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230206AbjC0Thg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 15:37:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjC0The (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 15:37:34 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 476311BF6
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 12:37:33 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id cn12so40754341edb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 12:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679945852;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5JJ7LXbaUX6853rxjRHoR3OHV+5RIGJd/hzf7VT5wf0=;
        b=pJnHAIFlPO/xy3A4QyoOFOVZGK6QzP6Om7T+Ch2UgXziPmPHzZArjbJ6MdU6fREDMq
         6dGYjbHOpNFgTJ5Gj2xCUy6yKFP3TXcN8a0ftB3eJbvUm0jgeBfDqeFx205BEbY+Jl+9
         HtfOzn0jlza5hrCF8cTQNqip0ncx3h1W6E0uXXxINn5jLl3Hpt4qmZHIUxn+SMhuuIIc
         7Lo+DF5BoZqyBHLRAaokcjaHewVF5H414hqCsuOOVW5BIPamEUpCXKoQvMz0zYQkRsA4
         L282XzArmkcHmNks+DqncftjJ/0DfQrIaJNuBWksvwTGOII8wPoXRQOCh++6h8uXz+Mm
         Kw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679945852;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5JJ7LXbaUX6853rxjRHoR3OHV+5RIGJd/hzf7VT5wf0=;
        b=RTd/pdHsKHfws1YN6v8MKizcD1LCWPGfs86If/tJrelFXQOJFxZkNacddKR/Id+imi
         94dV3MDDUtrILvh8iDeBUhSCQYuzrmu73zjmxP7AxLvbodcrYF/kKxJNEOveQju0DuP7
         s6NmInCDZiXU0vU71dz2QT4tj0Qxx7adutQh6PL+uYMbpiSCEBDqkNbBhO07KqD6tv3U
         RDRDsxV1B9zGF9pAi5IquHmouFBoxlcJS3woW/Df2YSDYmG6lOLzWV6wIj+gfl6Cqwgn
         GSZkKl4g0vIO35sUI6yUB5XJtbdvTbx5wfCPza4WB+Y4Q6AapitCSKWP7/1hVuVwlref
         z75Q==
X-Gm-Message-State: AO0yUKVpPYNKA4k3kvXX5Mk7WItr8+7KOn393egHgzBuvHg8pccJ7Iqf
        QRlkJWtYQfMBYmzPOkVPKM/14A==
X-Google-Smtp-Source: AK7set9/YBBXgA4Qup/GeCArJMz3WRFH0DD+vbjARDPKcAgz7XIWQIuoebMYzTel+vb2ChBQ9IwZNw==
X-Received: by 2002:a05:6402:1c95:b0:4af:7bdc:188e with SMTP id cy21-20020a0564021c9500b004af7bdc188emr21245031edb.16.1679945851798;
        Mon, 27 Mar 2023 12:37:31 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9314:a4b3:ce49:2c6b? ([2a02:810d:15c0:828:9314:a4b3:ce49:2c6b])
        by smtp.gmail.com with ESMTPSA id o12-20020a170906358c00b0093b6d1db84asm7962429ejb.120.2023.03.27.12.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 12:37:31 -0700 (PDT)
Message-ID: <c25d29f8-3b91-97b7-639b-e58d0b97b0e5@linaro.org>
Date:   Mon, 27 Mar 2023 21:37:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/5] dts: arm64: qcom: sdm845: add SLPI remoteproc
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Dylan Van Assche <me@dylanvanassche.be>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230327184811.499553-1-me@dylanvanassche.be>
 <20230327184811.499553-2-me@dylanvanassche.be>
 <5c8a7fbe-ce15-0918-7f82-a8058cdf15cb@linaro.org>
In-Reply-To: <5c8a7fbe-ce15-0918-7f82-a8058cdf15cb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/03/2023 21:36, Krzysztof Kozlowski wrote:
> On 27/03/2023 20:48, Dylan Van Assche wrote:
>> Add the SLPI remoteproc to the SDM845 Qualcomm SoC which is responsible
>> for exposing the sensors connected to the SoC. The SLPI communicates
>> over GLink edge 'dsps' and is similar to other DSPs e.g. ADSP or CDSP.
>> This patch allows the SLPI to boot and expose itself over QRTR as
>> service 400.
>>
>> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
>> ---
>>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 36 ++++++++++++++++++++++++++++
>>  1 file changed, 36 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> index 2f32179c7d1b..3b547cb7aeb8 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> @@ -3311,6 +3311,42 @@ glink-edge {
>>  			};
>>  		};
>>  
>> +		slpi_pas: remoteproc@5c00000 {
>> +			compatible = "qcom,sdm845-slpi-pas";
> 
> Undocumented compatible.

Ah, no, I see you linked bindings in separate patches.

Best regards,
Krzysztof

