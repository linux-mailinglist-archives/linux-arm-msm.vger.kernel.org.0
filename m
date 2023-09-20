Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B62E7A73F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Sep 2023 09:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233728AbjITHYq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Sep 2023 03:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233720AbjITHYi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Sep 2023 03:24:38 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DA90CE
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Sep 2023 00:24:24 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9a9d82d73f9so820546166b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Sep 2023 00:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695194663; x=1695799463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gh6bN/XfsrzCsTKkHAHoaKxBwUi0FWCvO6Qlvt6FoGE=;
        b=FQ9t6WvxuVlk/47MWJ2FS+avZ3nndh95dLIb2rQCOsIdD0QUtf7Jl3uArODoSC1wCR
         VVXemckB7nu2KHJblXddSclH1SG0CL4Y3c4zOT6xYelrBgpISeocLhR2Y8W8qmYtl4n2
         1ztXuHxue9IvwXsQA5W2JoEsqWxYRHETkPpNmERwI8kMKuTXJB7OlGhSGB5Uk9k+n25O
         vh/DVj/V8UvGv772kiuSuQzSLnMdYutWBuLJiM8ObpMfiJME6H5KqL3syG+NkNxkuO1v
         EXNz8QGVK//8NLThj1C0UxuzZU6AYsbxT25c1lVljSiDlPjTYTjigCfSh/SzhKfBzhc/
         Uhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695194663; x=1695799463;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gh6bN/XfsrzCsTKkHAHoaKxBwUi0FWCvO6Qlvt6FoGE=;
        b=VKs8GIPemxmimUnmvMbXb/n6vKCiELgGDgyUrXppB6B1TjPOlaYT5EhEwViv7i1o6C
         Pk83qKn/F625lGaKflben+fFqj2hdPuT6HnVp1mX1dKmxUmUxZbivUD6nxYZ+E4c9pok
         l35UllCErSh2lXNkfHAF3cBfCivWBfA6WmumWj+PMDiuqanbNiVa72reAfldSAh4qewE
         F3eYk12VP8Zpbt2XJUIgFW+m4623YlspKq6AFsc40i9tQsXtFH0EsPCruYgg+PgiNRsw
         dG5C7F8GdxgCaxNKYP2x6hhQgQVPQvYR1CPuNMPZo7QA9V2xPU1eXohLmGqrQ4Y6a4RU
         C4oA==
X-Gm-Message-State: AOJu0YyJsQcyQqQldpXSmVWehpfBOuvScrkp3QS3aKYrEExd+EBdRhBW
        aIEV8jSgFfEPJrnzw497nPYqHg==
X-Google-Smtp-Source: AGHT+IGI6kJ9MIS9s0oujXu1c46uNGlXl85H+BimXj90vilN9IFdT+328TLODqgYWzrAcqqC1a0w1A==
X-Received: by 2002:a17:906:1053:b0:9ae:4d6d:ba4f with SMTP id j19-20020a170906105300b009ae4d6dba4fmr514445ejj.42.1695194662816;
        Wed, 20 Sep 2023 00:24:22 -0700 (PDT)
Received: from [172.20.63.174] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.googlemail.com with ESMTPSA id jx10-20020a170906ca4a00b009ae3e6c342asm1256419ejb.111.2023.09.20.00.24.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 00:24:22 -0700 (PDT)
Message-ID: <9575d7d8-83dc-5814-ced0-46d49eeded84@linaro.org>
Date:   Wed, 20 Sep 2023 09:24:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v8 3/6] nvmem: core: Add stub for nvmem_cell_read_u8
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>,
        Komal Bajaj <quic_kbajaj@quicinc.com>
Cc:     agross@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        bryan.odonoghue@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230830105654.28057-1-quic_kbajaj@quicinc.com>
 <20230830105654.28057-4-quic_kbajaj@quicinc.com>
 <pvif5decuie62pid3zjpsb2tp5hzndxvww7v3jdhl6jkymbpcn@bjhud2hevjm6>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <pvif5decuie62pid3zjpsb2tp5hzndxvww7v3jdhl6jkymbpcn@bjhud2hevjm6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13/09/2023 21:27, Bjorn Andersson wrote:
> On Wed, Aug 30, 2023 at 04:26:51PM +0530, Komal Bajaj wrote:
>> Add the stub nvmem_cell_read_u8() function for drivers running with
>> CONFIG_NVMEM disabled.
>>
>> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> 
> Srini, do you have any concerns with me taking this together with the
> remaining patches through my tree?

It works for me.

Acked-by: Srinivas Kandagatla <srinivas.kadnagatla@linaro.org>


--srin
> 
> Regards,
> Bjorn
> 
>> ---
>>   include/linux/nvmem-consumer.h | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/include/linux/nvmem-consumer.h b/include/linux/nvmem-consumer.h
>> index 4523e4e83319..6ec4b9743e25 100644
>> --- a/include/linux/nvmem-consumer.h
>> +++ b/include/linux/nvmem-consumer.h
>> @@ -127,6 +127,12 @@ static inline int nvmem_cell_write(struct nvmem_cell *cell,
>>   	return -EOPNOTSUPP;
>>   }
>>
>> +static inline int nvmem_cell_read_u8(struct device *dev,
>> +				     const char *cell_id, u8 *val)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +
>>   static inline int nvmem_cell_read_u16(struct device *dev,
>>   				      const char *cell_id, u16 *val)
>>   {
>> --
>> 2.41.0
>>
