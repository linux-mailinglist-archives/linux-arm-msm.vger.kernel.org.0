Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCBDD71724A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 02:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233724AbjEaAJZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 20:09:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231307AbjEaAJZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 20:09:25 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA0DB2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 17:09:23 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f6ef9a928fso34765105e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 17:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685491762; x=1688083762;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fILf0lGXqk7D6D5W4KRap636H/3RZiZfs7odQjNofUU=;
        b=hBukDZtDDgaJLsu3ZNud0gxPwQ8iKpR9rZcpqIPIzyWonhTvmuJtTtaHPF9HzqTuuY
         SG/XIcA1ksAG0h73RNXOil/QOH0VGA5gsk2YtYm5ixgEeQxIpIvEEDxD7Rud+hnS7diD
         eUKm0mer2J3QpWIDsrR7F7WXOFRR29noMdQPncQ1gvU9aeByGxenhGYhCdDyKIqEQCH7
         CYGswI11lGdwM+3lbaaHd1CUMvVyscCjAavgpwkRFpOA7lYQ19pGApLnZ/on2Pep8lqt
         Uu/GsEAXuZEUprs93XIvYXuEyxthU5bH6WCzHJf8Rzbf3rIiRTIzsI1rZJxEMUKba/qV
         Tsww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685491762; x=1688083762;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fILf0lGXqk7D6D5W4KRap636H/3RZiZfs7odQjNofUU=;
        b=LeKth2XQmLgjpUMhW9ChNE1XfXabn9/4kNt4VrkuRfA9aAjM6ieeW7pQGWBjTn4oAO
         wy+BhtIwBcQMY0QG1OZtLnF/Tqp4MOZ4M+Hl+ZUnf3H+iJzCxmRdonGO8LepLDn4LuZa
         yMJMj8ujgg8g+HsXXMtEkzuFZm54W9vhwDoQ/Ezx0iQ9RggjCEMw9da3QbeFwffF6r4k
         bwXOiTEh3IWwYYJLaUakAOkadUKxRc9YCS6ZJvr3NswwrN+D7VNsSmZXG1cY1MsF/oYe
         LdAAArUrpKgkAXPbaF8IoCcL7fSy99kzSlqFNfnKpuUm6BYcIEqQX+LERDKRPadQ83bm
         i1gA==
X-Gm-Message-State: AC+VfDzBnyJS9Yy6Jref4nPVkFQnE80Y9Y5cyYA52dKn0mZQ9y8CVMas
        QESwX0nG2OjY0EhYbVDmWVvFCA==
X-Google-Smtp-Source: ACHHUZ4w3XWTybqmRAYAel02Kl7cbbFvSfGlbpCi/XUTLGp96hOX/8AGDwbRLHr5qcGuB3m8owxX2g==
X-Received: by 2002:a1c:c902:0:b0:3f6:787:4a70 with SMTP id f2-20020a1cc902000000b003f607874a70mr2586124wmb.15.1685491762114;
        Tue, 30 May 2023 17:09:22 -0700 (PDT)
Received: from [192.168.0.84] (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id k10-20020a7bc40a000000b003f606869603sm22283888wmi.6.2023.05.30.17.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 17:09:21 -0700 (PDT)
Message-ID: <ba3e6235-3976-6a86-ec4c-62a8786a1707@linaro.org>
Date:   Wed, 31 May 2023 01:09:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/3] soc: qcom: rmtfs: Support discarding guard pages
Content-Language: en-US
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230530233643.4044823-1-quic_bjorande@quicinc.com>
 <20230530233643.4044823-3-quic_bjorande@quicinc.com>
 <e0d7021c-d6af-25df-5c90-3caec4bb83b7@linaro.org>
In-Reply-To: <e0d7021c-d6af-25df-5c90-3caec4bb83b7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 31/05/2023 01:08, Caleb Connolly wrote:
> 
> 
> On 31/05/2023 00:36, Bjorn Andersson wrote:
>> In some configurations, the exact placement of the rmtfs shared memory
>> region isn't so strict. The DeviceTree author can then choose to use the
>> "size" property and rely on the OS for placement (in combination with
>> "alloc-ranges", if desired).
>>
>> But on some platforms the rmtfs memory region may not be allocated
>> adjacent to regions allocated by other clients. Add support for
>> discarding the first and last 4k block in the region, if
>> qcom,use-guard-pages is specified in DeviceTree.
> 
> Oh nice!
... Bit eager on the enter key there
>>
>> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
>> ---
>>
>> Changes since v1:
>> - Drop the dma_alloc_coherent() based approach and just add support for
>>   the guard pages.
>>
>>  drivers/soc/qcom/rmtfs_mem.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/rmtfs_mem.c b/drivers/soc/qcom/rmtfs_mem.c
>> index f83811f51175..28238974d913 100644
>> --- a/drivers/soc/qcom/rmtfs_mem.c
>> +++ b/drivers/soc/qcom/rmtfs_mem.c
>> @@ -213,6 +213,16 @@ static int qcom_rmtfs_mem_probe(struct platform_device *pdev)
>>  		goto put_device;
>>  	}
>>  
>> +	/*
>> +	 * If requested, discard the first and last 4k block in order to ensure
>> +	 * that the rmtfs region isn't adjacent to other protected regions.
>> +	 */
>> +	if (of_property_present(node, "qcom,use-guard-pages")) {
>> +		rmtfs_mem->addr += SZ_4K;
>> +		rmtfs_mem->base += SZ_4K;
>> +		rmtfs_mem->size -= 2 * SZ_4K;
>> +	}
>> +
>>  	cdev_init(&rmtfs_mem->cdev, &qcom_rmtfs_mem_fops);
>>  	rmtfs_mem->cdev.owner = THIS_MODULE;
>>  
> 

-- 
// Caleb (they/them)
