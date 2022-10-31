Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7509613DC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 19:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbiJaSwl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 14:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiJaSwk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 14:52:40 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA1671276C
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 11:52:38 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id f37so20629567lfv.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 11:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2m+IiXrsLStNouFmhecgJA2gSt8vjAtj7/teiT7CjBk=;
        b=hdIf0eTW0S87ia9RbcQzP4ZT3P6rvadiOZG25jVkki0QnvwfSj0RRW/Gb6sJG3yYEU
         9AZ7Z4nVmyYicjp7/LPMJDb5ILz+7+R+6T0paAgeMknQ4gBYf3fUIC2L21DZllRR2n1h
         dLbPIodLPxuZ5ypSwBawN42zYR16siA+aj9pyOvPYKHd87ShCHhFAxZnzghkTMlSy9r+
         v15m7A0HX8cNJPvR/fZyFbo8kl+1UXWRiCEWm0iuqFMIqCjso7/747ukUo9aEmGwMGML
         C0UwPJIJs7S56ONV+Uop4COrz8s6hgqnX4qh0U0frInJYMQN+dFi+Y1f1C6C3D9PTkUr
         MJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2m+IiXrsLStNouFmhecgJA2gSt8vjAtj7/teiT7CjBk=;
        b=gKlJPmNzES9THqJCTI/RJIBxBMBdtv9CgoTd8079RaW5QTVW7F1jnOZqmRU01QXfK0
         lnjCl6/QqDgRmYbsniHAv31YDHVUS/9KXqOLJ94g/SKH/MExFWcab/7GTcJFKaWZmTse
         Ez7iPSi8tdrEMV2ECZOzdiJj0Z9bojqLESgNIwRFvrznFRYJA2CgqW0FdAb8j26O6i6s
         1wD/GoKhr9/SszqyAikM2KZhqvi+2VDjA9yAn43Pqas8e59BLiNrutfHgV+Skl/klCT8
         BL6wQHezaTIgJ8X7F2bIr3j/pDEMz4Te+GiHJwMGwV/vKPqA67mCw2YXnhlcfx5vZG73
         1LDA==
X-Gm-Message-State: ACrzQf3MY6nVn/6A+VIfPEAadoEUqFFouA98v3cBDIIEgav2P1XbI0Gr
        EDmsnnjn/w+8YVQ9M952wp42ZQ==
X-Google-Smtp-Source: AMsMyM4Q5b7LpNXMLeLpnI7m/hdrZ5ObVjNpLE+Jh9k7S1IeKWaR1G+TBQ4xfp8Zl8sY/DYXeqg87g==
X-Received: by 2002:ac2:5922:0:b0:4af:d4e:de3f with SMTP id v2-20020ac25922000000b004af0d4ede3fmr5679455lfi.528.1667242357077;
        Mon, 31 Oct 2022 11:52:37 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q3-20020a2eb4a3000000b0026fb5525ee4sm1454768ljm.116.2022.10.31.11.52.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 11:52:36 -0700 (PDT)
Message-ID: <282de1ee-f1c5-39cf-90d7-8a10fc27c171@linaro.org>
Date:   Mon, 31 Oct 2022 21:52:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 14/15] scsi: ufs: ufs-qcom: Add support for finding HS
 gear on new UFS versions
Content-Language: en-GB
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     martin.petersen@oracle.com, jejb@linux.ibm.com,
        andersson@kernel.org, vkoul@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org
References: <20221029141633.295650-1-manivannan.sadhasivam@linaro.org>
 <20221029141633.295650-15-manivannan.sadhasivam@linaro.org>
 <cf8dcf53-f131-68f4-c6aa-d41e02ac6d5c@linaro.org>
 <20221031145647.GC10515@thinkpad>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221031145647.GC10515@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/10/2022 17:56, Manivannan Sadhasivam wrote:
> On Sun, Oct 30, 2022 at 12:48:21AM +0300, Dmitry Baryshkov wrote:
>> On 29/10/2022 17:16, Manivannan Sadhasivam wrote:
>>> Starting from UFS controller v4, Qcom supports dual gear mode (i.e., the
>>> controller/PHY can be configured to run in two gear speeds). But that
>>> requires an agreement between the UFS controller and the UFS device.
>>> This commit finds the max gear supported by both controller and device
>>> then decides which one to use.
>>>
>>> UFS controller's max gear can be read from the REG_UFS_PARAM0 register and
>>> UFS device's max gear can be read from the "max-gear" devicetree property.
>>>
>>> The UFS PHY also needs to be configured with the decided gear using the
>>> phy_set_mode_ext() API.
>>>
>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>> ---
>>>    drivers/ufs/host/ufs-qcom.c | 35 ++++++++++++++++++++++++++++++++---
>>>    drivers/ufs/host/ufs-qcom.h |  4 ++++
>>>    2 files changed, 36 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>>> index f952cc76919f..268463e92d67 100644
>>> --- a/drivers/ufs/host/ufs-qcom.c
>>> +++ b/drivers/ufs/host/ufs-qcom.c
>>> @@ -281,6 +281,9 @@ static int ufs_qcom_host_reset(struct ufs_hba *hba)
>>>    static u32 ufs_qcom_get_hs_gear(struct ufs_hba *hba, u32 hs_gear)
>>>    {
>>>    	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>>> +	struct device *dev = hba->dev;
>>> +	u32 max_gear, hcd_max_gear, reg;
>>> +	int ret;
>>>    	if (host->hw_ver.major == 0x1) {
>>>    		/*
>>> @@ -292,8 +295,33 @@ static u32 ufs_qcom_get_hs_gear(struct ufs_hba *hba, u32 hs_gear)
>>>    		 */
>>>    		if (hs_gear > UFS_HS_G2)
>>>    			return UFS_HS_G2;
>>> +	} else if (host->hw_ver.major > 0x3) {
>>> +		/*
>>> +		 * Starting from UFS controller v4, Qcom supports dual gear mode (i.e., the
>>> +		 * controller/PHY can be configured to run in two gear speeds). But that
>>> +		 * requires an agreement between the UFS controller and the device. Below
>>> +		 * code tries to find the max gear of both and decides which gear to use.
>>> +		 *
>>> +		 * First get the max gear supported by the UFS device if available.
>>> +		 * If the property is not defined in devicetree, then use the default gear.
>>> +		 */
>>> +		ret = of_property_read_u32(dev->of_node, "max-gear", &max_gear);
>>> +		if (ret)
>>> +			goto err_out;
>>
>> Can we detect the UFS device's max gear somehow? If not, the 'max-gear'
>> property name doesn't sound good. Maybe calling it 'device-gear' would be
>> better.
>>
> 
> UFS device probing depends on PHY init sequence. So technically we cannot know
> the max gear of the device without using an init sequence, but this information
> is static and should be known to a board manufacturer. That's why I decided to
> use this property. Another option is to use a fixed init sequence for probing
> the device and do a re-init after knowing it's max gear but that is not
> recommended.
> 
> We need "max" keyword because this property specifies the maximum gear at which
> the device could operate and not necessarily the gear at which it operates.
> Maybe, "max-device-gear" would make it clear.

Ack, thank you for the explanation. Yes, from my opinion max-device-gear 
is better. Let's see what Rob and Krzysztof would say.


-- 
With best wishes
Dmitry

