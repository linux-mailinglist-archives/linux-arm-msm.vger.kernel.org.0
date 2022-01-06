Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A080148694F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 19:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241789AbiAFSA2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 13:00:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242493AbiAFSAV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 13:00:21 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57A17C061201
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 10:00:21 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id k18so6323103wrg.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 10:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=EantZKntQcyCaBAX6MUZbLwTgreUhKCVjAV2mbTHCy0=;
        b=Cy9KwmjSk1kTuSIJM32qD5tWEPx39OYjEseTKLMOIyWtD1epX1uKogRRhdxTRbgQPp
         uJjNfzc3py1UeP3TfQeU9HXmMKPSE2YfP8cicLkW8XoB8QOghmCu/CzV5MTFSb/8ViRL
         7qf4Y6QRtQ0sC5UqqostWVZcf3i15LtHCgjyPj1WOgs8o1BbeCSsp1Jilbf7Ma8MpUjG
         NHqkFwV8IGt4eqEVBm5r26lASJM1N7A7Gf1eLwSIzVvEnt7j0LDSk8tsAL9Y5rM4SF20
         bAXMpKybku3qI0wrfK88hrnujijnc3XUz1YzV5RMhuLG8olWwmeQQScX4YTCyVYCHr4p
         LC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EantZKntQcyCaBAX6MUZbLwTgreUhKCVjAV2mbTHCy0=;
        b=I5iJPPYNlhg9LQ80R42tGM9DVlqEbRRKqiH+ypVYCRewvv7yMNcrXY4glP6aMzp4Q/
         mWCr56hxHCQ/zFoh5bHxMItUbAEAXi7Ob1+KmUJ5AfqnkiTjUXBmFYB4m52097K3XAAZ
         0SwsNGaSIP0tEh20S6kNNe61EV1NU6cZw13irMQj5PcKZpOXrkwadi8+o0LOdyx7tkQE
         21OknvNzeZ1djUSijzDcckD9AmjlvSML7wxEy1/zzX6qocdhqACW4fVETMExFhPxlpHo
         4ryHJFPRJcFziQy6KUstyFD/JTfjYUqqqnb+l0YH63MQTg/TSeJmUritaFV+yZ4kOiH8
         8aVw==
X-Gm-Message-State: AOAM531bi6W8L/YtrPgfP4Z5XagsYySaeGKmO2LnWECjppBr82wDYmAP
        82QHJnJuVh9p40aPYaOQHFcc8Q==
X-Google-Smtp-Source: ABdhPJxCXbdR+6O/ldOIS0HKDjz+7yekArJpeIugf862bSIlJeEfRG/78DyY+PxxzodsqQP4B0HJKg==
X-Received: by 2002:a5d:6d8a:: with SMTP id l10mr52565981wrs.270.1641492019928;
        Thu, 06 Jan 2022 10:00:19 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c2sm3027218wri.50.2022.01.06.10.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jan 2022 10:00:19 -0800 (PST)
Message-ID: <c0751352-3f92-0c5a-a15e-938dad5afab3@linaro.org>
Date:   Thu, 6 Jan 2022 18:02:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v2 1/2] mtd: rawnand: qcom: Fix clock sequencing in
 qcom_nandc_probe()
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
        miquel.raynal@bootlin.com, architt@codeaurora.org,
        bbrezillon@kernel.org, absahu@codeaurora.org, baruch@tkos.co.il,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20220103030316.58301-1-bryan.odonoghue@linaro.org>
 <20220103030316.58301-2-bryan.odonoghue@linaro.org>
 <20220103055152.GA3581@thinkpad>
 <edcd752d-37a5-2004-3508-01efcfa571ba@linaro.org>
 <Ydcqb5k8EcDqPJLD@kroah.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <Ydcqb5k8EcDqPJLD@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/01/2022 17:44, Greg KH wrote:
> On Thu, Jan 06, 2022 at 05:24:27PM +0000, Bryan O'Donoghue wrote:
>> On 03/01/2022 05:51, Manivannan Sadhasivam wrote:
>>> On Mon, Jan 03, 2022 at 03:03:15AM +0000, Bryan O'Donoghue wrote:
>>>> Interacting with a NAND chip on an IPQ6018 I found that the qcomsmem NAND
>>>> partition parser was returning -EPROBE_DEFER waiting for the main smem
>>>> driver to load.
>>>>
>>>> This caused the board to reset. Playing about with the probe() function
>>>> shows that the problem lies in the core clock being switched off before the
>>>> nandc_unalloc() routine has completed.
>>>>
>>>> If we look at how qcom_nandc_remove() tears down allocated resources we see
>>>> the expected order is
>>>>
>>>> qcom_nandc_unalloc(nandc);
>>>>
>>>> clk_disable_unprepare(nandc->aon_clk);
>>>> clk_disable_unprepare(nandc->core_clk);
>>>>
>>>> dma_unmap_resource(&pdev->dev, nandc->base_dma, resource_size(res),
>>>> 		   DMA_BIDIRECTIONAL, 0);
>>>>
>>>> Tweaking probe() to both bring up and tear-down in that order removes the
>>>> reset if we end up deferring elsewhere.
>>>>
>>>> Fixes: c76b78d8ec05 ("mtd: nand: Qualcomm NAND controller driver")
>>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>
>>> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
>>>
>>> Can you please CC stable list for backporting?
>>>
>>> Thanks,
>>> Mani
>>>
>>
>> NP.
>>
>> + cc stable
>>
>> FWIW I believe Greg's scripts will pick up on Fixes: tags automatically
> 
> No, that is NOT the way to ensure that a patch will get picked up, that
> is a "this might eventually get there".
> 
> Please read:
>      https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> for how to do this properly.
> 
> thanks,
> 
> greg k-h
> 

Good to know

I've just been using Fixes: for the most part

Thanks

---
bod
