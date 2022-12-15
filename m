Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED9A64D80C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Dec 2022 09:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbiLOIvd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Dec 2022 03:51:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiLOIvc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Dec 2022 03:51:32 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52A4D26483
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Dec 2022 00:51:31 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id s25so9266770lji.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Dec 2022 00:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pecYI2Wxf2sv6LmohLERH3VYYJ/4cVx07ayYX6z9h/s=;
        b=L7lt4ZkLZifQmwNbt0yl+olfrtq7W/yIU4r3g0cNYk70fS0VGDDSTZ1Y8FYs87fp4T
         4FnLrkcWp3nbFvYwlRDfJTm9wjqhkZW+TAZsTyHPgAlVmqGfQCfEC/zXZp8gGWZBN7ZM
         4Mj7CplmPstozha7jDhHDiG57D/MiZwLdT5TBu9d5EjCJIGts8M/9i9CNR19qiZEQBj4
         Nipcs59d4TJ3IvZM8EBAHOAIHi8LUhZelxErM3u9KR6zu0FrtyAek1anaGyW+g0rI6/8
         E57PSWjC0/rnAQC/5w04EqrubtkhOlb1bcvDeVjkNo8dVf6SqPRiSu0in3f3/Nf42weW
         VN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pecYI2Wxf2sv6LmohLERH3VYYJ/4cVx07ayYX6z9h/s=;
        b=2eLLka+sV4MdVaq3lgqvd5FMmqMLwyqHQSB1vgaFODiCaPt06ImRXJyl18yy/szWmo
         H/YnKo8wlulPJvZxYlHFw1nIm8RhDLlrUW4krpMT8jjiULODzACkqfnT8x2tagkIQ3lT
         TLR+qZ09YP419payFLCqmVcukl2VvU20PGfHxtSa9izXtC5hQUnXZwNUdLQt34/5l5eP
         ql9FS2MFTxY+t749BaP5LMr1tMzjoaF/J46Po5ZOn8qh19YXkD1LjVLZtLc59zJ+qo+R
         B6J+Ol6DY2PlHDbMYyDTd9K4Su/PJKTMWm5XPMj/0erI04aQyp0TScWmmKZH8dlM3mnW
         l8yQ==
X-Gm-Message-State: ANoB5plY+x4Q24OrxyBeYPeHi+D+iyLolgFhkCPGriuHuSsFZGwB1PWe
        SMvj0FtsxlRTRboN5CP8os/U4Q==
X-Google-Smtp-Source: AA0mqf7RQnZt8Jg4Jb4ob2J4Gkt1xR+Q6+E7uufexHrEt78eEsXBCQJCD4+fbwAu/psxmpKrl0L9NQ==
X-Received: by 2002:a2e:9582:0:b0:27b:4e29:1073 with SMTP id w2-20020a2e9582000000b0027b4e291073mr4346367ljh.29.1671094289694;
        Thu, 15 Dec 2022 00:51:29 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b20-20020a2eb914000000b002797892025csm789133ljb.137.2022.12.15.00.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 00:51:29 -0800 (PST)
Message-ID: <66fa228f-d35d-6e03-0ef3-09c6aa0bb66d@linaro.org>
Date:   Thu, 15 Dec 2022 09:51:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 4/4] remoteproc: qcom_q6v5_mss: Use a carveout to
 authenticate modem headers
Content-Language: en-US
To:     Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        manivannan.sadhasivam@linaro.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, amit.pundir@linaro.org,
        regressions@leemhuis.info, sumit.semwal@linaro.org,
        will@kernel.org, catalin.marinas@arm.com, robin.murphy@arm.com
References: <20221213140724.8612-1-quic_sibis@quicinc.com>
 <20221213140724.8612-5-quic_sibis@quicinc.com>
 <8739f59b-c551-2da4-5523-a89f960bd402@linaro.org>
 <f4595a18-23bd-d54f-4e50-c0ed63008225@quicinc.com>
 <1d3c7d01-bfa9-6654-28d9-b9f4964a88a4@linaro.org>
 <e4bef035-c448-7c75-13a6-d9c61aa8cde7@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e4bef035-c448-7c75-13a6-d9c61aa8cde7@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/12/2022 12:51, Sibi Sankar wrote:
> 
> 
> On 12/14/22 16:58, Krzysztof Kozlowski wrote:
>> On 14/12/2022 11:33, Sibi Sankar wrote:
>>>
>>>
>>> On 12/14/22 01:17, Krzysztof Kozlowski wrote:
>>>> On 13/12/2022 15:07, Sibi Sankar wrote:
>>>>> The memory region allocated using dma_alloc_attr with no kernel mapping
>>>>> attribute set would still be a part of the linear kernel map. Any access
>>>>> to this region by the application processor after assigning it to the
>>>>> remote Q6 will result in a XPU violation. Fix this by replacing the
>>>>> dynamically allocated memory region with a no-map carveout and unmap the
>>>>> modem metadata memory region before passing control to the remote Q6.
>>>>>
>>>>> Reported-by: Amit Pundir <amit.pundir@linaro.org>
>>>>> Fixes: 6c5a9dc2481b ("remoteproc: qcom: Make secure world call for mem ownership switch")
>>>>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>>>>> ---
>>>>
>>>> Thank you for your patch. There is something to discuss/improve.
>>>>>    
>>>>>    	return ret < 0 ? ret : 0;
>>>>> @@ -1882,6 +1899,26 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
>>>>>    	qproc->mpss_phys = qproc->mpss_reloc = r.start;
>>>>>    	qproc->mpss_size = resource_size(&r);
>>>>>    
>>>>> +	if (!child) {
>>>>> +		node = of_parse_phandle(qproc->dev->of_node, "memory-region", 2);
>>>>> +	} else {
>>>>> +		child = of_get_child_by_name(qproc->dev->of_node, "metadata");
>>>>
>>>> Bindings do not allow to have child "metadata", do they?
>>>
>>> memory-region property was used to specify mba/mpss region in a phandle
>>> array only from SC7180 SoC. All the older dtbs in the wild/upstream
>>> still had sub-nodes to achieve the same. Patch 3 allows for a sub-set
>>> of the SoCs (MSM8996/MSM8998/SDM845) to use metadata as a sub-node so
>>> as to not break bindings when newer kernel uses a older dtb.
>>
>> This does not explain why you extend the driver without extending the
>> bindings. You do not do it for legacy stuff but for SC7180. But even for
>> legacy devices you cannot add new properties without having it in some
>> legacy bindings.
> 
> https://patchwork.kernel.org/project/linux-arm-msm/patch/20221213140724.8612-4-quic_sibis@quicinc.com/
> 
> The legacy bindings are a part of patch 3 ^^.

Ah, ok.

Best regards,
Krzysztof

