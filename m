Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0FB16F91D0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 May 2023 14:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231996AbjEFMD0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 May 2023 08:03:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbjEFMDZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 May 2023 08:03:25 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 417A811611
        for <linux-arm-msm@vger.kernel.org>; Sat,  6 May 2023 05:03:20 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f13ef4ad91so3184274e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 May 2023 05:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683374598; x=1685966598;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iDA1o5DOpOhngrWpyHFqKpT+FKuc32+BdG6EdkURD0I=;
        b=XzsoB368bAHnBWpU15NLULOnKVfBGXSJfEvW60ldEpQwUiYs0l6Bvd8VpTBDHnGF20
         bQQLcEtJLmrha2Tc9BwlkAC5lWVI4fY9CyGbrRWVFD6TsyJUUwZ0NOMpaz4ZF3jmTP2c
         LgFmeetudSh9VhiaWcwy2fXQGczMPPPMs1MtO8tb2Hz0u+mYuV2ociKPzAGarAC/xTNn
         g9Y00e5pjXMZzFnE9wz+LAbZs10L5EzOJUSLB7H3YgQivJb5H8C0JFFqtuVmqkTMqB0k
         plBOmAqf9cCTjOdbyGHEzJrzSoxfhCTQuLMzKuMfjYJgQt1HhwLJcerE6vcio/dYDrkR
         O2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683374598; x=1685966598;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iDA1o5DOpOhngrWpyHFqKpT+FKuc32+BdG6EdkURD0I=;
        b=aSbVMMt4RmfIIJ9AjJjmLDrJRTPQ5JHRbhXb4i+vyCL1YISaau5GOedcj1l3VF5Ono
         NQviDO/Lqu254kc80tjaDk3FZhmbLshQRz/4UezhWSfHtWV1Ydc+jPiEKGdqm+yH+qe5
         DS3igkndHL0LSYmO5V6ciiamxcU+86ymhKt5dvGfOQqc3jqpKyhDcnHY5ePLz9PJbQvi
         148mLT4HwZsT49adVZpsbHf4OQXZ9HbBO5JfaiQ6Tk7h/y440OOJOl7x0ZrM/Ph2qGYe
         OYm5+3u4J6UyGqmGcE4tGBUEAHnio1wakwFVczFeBs9E9Irkkp2kxuiG3fDaJy6dx45Y
         NSxg==
X-Gm-Message-State: AC+VfDyFhooPXLRxuhjDA/Rs5D2YiVNdxFQLkOjlfiR+k2o5TyabZWht
        fD6SG5hoSXNrwkjI2Atx3FvuuA==
X-Google-Smtp-Source: ACHHUZ657exLovcKVKLg88kAQmx0RX8h5aAvhO9CpNbhD2LkobNTGOHPK+ztRA1IPGF2OD+m5vgyww==
X-Received: by 2002:a05:6512:1026:b0:4eb:7e:1fa5 with SMTP id r6-20020a056512102600b004eb007e1fa5mr1102362lfr.8.1683374598443;
        Sat, 06 May 2023 05:03:18 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id o3-20020a056512050300b004efe9a169d2sm632963lfb.64.2023.05.06.05.03.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 May 2023 05:03:17 -0700 (PDT)
Message-ID: <ce925269-2cc1-c431-898a-fa53f2f48def@linaro.org>
Date:   Sat, 6 May 2023 15:03:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/8] PCI: qcom: Use DWC helpers for modifying the
 read-only DBI registers
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com
Cc:     robh@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, steev@kali.org,
        quic_srichara@quicinc.com
References: <20230506073139.8789-1-manivannan.sadhasivam@linaro.org>
 <20230506073139.8789-2-manivannan.sadhasivam@linaro.org>
 <81d5643b-3aec-a987-eaf4-e89b0887ce64@linaro.org>
In-Reply-To: <81d5643b-3aec-a987-eaf4-e89b0887ce64@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/05/2023 14:43, Dmitry Baryshkov wrote:
> On 06/05/2023 10:31, Manivannan Sadhasivam wrote:
>> DWC core already exposes dw_pcie_dbi_ro_wr_{en/dis} helper APIs for
>> enabling and disabling the write access to read only DBI registers. So
>> let's use them instead of doing it manually.
>>
>> Also, the existing code doesn't disable the write access when it's done.
>> This is also fixed now.
>>
>> Fixes: 5d76117f070d ("PCI: qcom: Add support for IPQ8074 PCIe 
>> controller")
>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> ---
>>   drivers/pci/controller/dwc/pcie-qcom.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@gmail.com>

Of course:
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

