Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A5C57871CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Aug 2023 16:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241432AbjHXOhb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Aug 2023 10:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241009AbjHXOh1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Aug 2023 10:37:27 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40C531BE
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 07:37:25 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40061928e5aso14301445e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 07:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692887844; x=1693492644;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hQuKsdXLbaauilsfKUsMg7WsVO/VKSU1VxyRk46IkT0=;
        b=bJDwysfdRjFTLaBLhfLk8D0yKyZ0D03dgCg7Acb5aFYBDIjREG7zibGUkgzgfhzABY
         A5c8EcxkRkljyueKctr0NXYRnzrsXBuJ+MTjJzFYdduR4384YpvJ+QN+N0W5/yf1naRX
         oy2o2CZv+qJVyX8OMdfNAsww11o4ZnsjPnWgOBDIUZCEVhCP8foiQCnck0O5qpc/D3dN
         MHOlBo4X3hUy6O4i+BMwKciEM5sMFl3cznZqVdfng3+Gi1qRDWObOsoRuvaYeoIgjxlU
         XAwWloEHv89so80l6UH2NS/ymsKh7R1JcLDYZuPo0nl/fjCVslo66kPw53giIkrc9Ke9
         2L7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692887844; x=1693492644;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hQuKsdXLbaauilsfKUsMg7WsVO/VKSU1VxyRk46IkT0=;
        b=VSM/qoSakjkIRv2z6TmcZe4WG0/N7g465Aprg2l7b5Bfdd+5sug+BmJhaBBDD8aSE/
         x8KZMLEodn7U38woVb5rsL6OGBA/fUuUip0l0JmC+/uo2BNglT9FspwIcJnXJyPy6KAD
         EXPMGCPYlGtnyfvIFZwnT0WtXdacrrb63sR7PFZWWhikpQ285XgXFbPZj07rDncxU850
         a3CI1imh5WAlTSjv3AkoOiY4xpgvrbu59Ci83GVw+oQ7Gs3W0tFjUIyqki3zPW0mkIUb
         XFQ1BL2PXyMOtTW3UxCMDXhOrE2i8oM0cK6he46WWqdq6IMfWohrYMYLwKvN/8qbUVy3
         ZUaQ==
X-Gm-Message-State: AOJu0YzBdUqvp9JbR9L/oXu6pWg/c2t2fd2cO0tSq5bnAcchACVVwQ9k
        d4cZN88osjp7CY4Gx31AsDW9HA==
X-Google-Smtp-Source: AGHT+IG1Zmy9FiD6EGuNshteebwkJiVqUA4EOgVYV3DKG8lcdZvZlKIsdhMl2a27os9ORZTF6RnlGQ==
X-Received: by 2002:a7b:c408:0:b0:401:aa8f:7565 with SMTP id k8-20020a7bc408000000b00401aa8f7565mr1238852wmi.34.1692887843655;
        Thu, 24 Aug 2023 07:37:23 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t15-20020a7bc3cf000000b004013797efb6sm2449378wmj.9.2023.08.24.07.37.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 07:37:23 -0700 (PDT)
Message-ID: <9574a219-3abf-b2c9-7d90-e79d364134bb@linaro.org>
Date:   Thu, 24 Aug 2023 15:37:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] usb: typec: qcom: check regulator enable status before
 disabling it
Content-Language: en-US
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        quic_huliu@quicinc.com
Cc:     Guenter Roeck <linux@roeck-us.net>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_fenglinw@quicinc.com,
        subbaram@quicinc.com
References: <20230824-qcom-tcpc-v2-1-3dd8c3424564@quicinc.com>
 <ZOdlOQ+N2J7jyIEZ@kuha.fi.intel.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ZOdlOQ+N2J7jyIEZ@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/08/2023 15:12, Heikki Krogerus wrote:
> On Thu, Aug 24, 2023 at 10:32:03AM +0800, Hui Liu via B4 Relay wrote:
>> From: Hui Liu <quic_huliu@quicinc.com>
>>
>> Check regulator enable status before disabling it to avoid
>> unbalanced regulator disable warnings.
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>> Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Hui Liu <quic_huliu@quicinc.com>
>> ---
>> Changes in v2:
>> - Add Fixes tag
>> - Link to v1: https://lore.kernel.org/r/20230823-qcom-tcpc-v1-1-fa81a09ca056@quicinc.com
>> ---
>>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
>> index bb0b8479d80f..ca616b17b5b6 100644
>> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
>> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
>> @@ -422,7 +422,8 @@ static int qcom_pmic_typec_pdphy_disable(struct pmic_typec_pdphy *pmic_typec_pdp
>>   	ret = regmap_write(pmic_typec_pdphy->regmap,
>>   			   pmic_typec_pdphy->base + USB_PDPHY_EN_CONTROL_REG, 0);
>>   
>> -	regulator_disable(pmic_typec_pdphy->vdd_pdphy);
>> +	if (regulator_is_enabled(pmic_typec_pdphy->vdd_pdphy))
>> +		regulator_disable(pmic_typec_pdphy->vdd_pdphy);
> 
> Would it be an option to just enable the regulator in
> qcom_pmic_typec_pdphy_start() and disable it in
> qcom_pmic_typec_pdphy_stop()?
> 
> Now the whole thing looks weird. That regulator is in practice
> only disabled and then enabled in one and the same place -
> pmic_typec_pdphy_reset(). It's not touched anywhere else. That makes
> the above condition confusing to me. I may be missing something.
> 
> At least more explanation is needed.
> 
> thanks,
> 

I don't see why not.

The code would look neater that way too.

Can you give it a try Hui ?

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c 
b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
index 4e1b846627d20..d29f9506e5f12 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
@@ -383,10 +383,6 @@ static int qcom_pmic_typec_pdphy_enable(struct 
pmic_typec_pdphy *pmic_typec_pdph
         struct device *dev = pmic_typec_pdphy->dev;
         int ret;

-       ret = regulator_enable(pmic_typec_pdphy->vdd_pdphy);
-       if (ret)
-               return ret;
-
         /* PD 2.0, DR=TYPEC_DEVICE, PR=TYPEC_SINK */
         ret = regmap_update_bits(pmic_typec_pdphy->regmap,
                                  pmic_typec_pdphy->base + 
USB_PDPHY_MSG_CONFIG_REG,
@@ -424,8 +420,6 @@ static int qcom_pmic_typec_pdphy_disable(struct 
pmic_typec_pdphy *pmic_typec_pdp
         ret = regmap_write(pmic_typec_pdphy->regmap,
                            pmic_typec_pdphy->base + 
USB_PDPHY_EN_CONTROL_REG, 0);

-       regulator_disable(pmic_typec_pdphy->vdd_pdphy);
-
         return ret;
  }

@@ -449,6 +443,10 @@ int qcom_pmic_typec_pdphy_start(struct 
pmic_typec_pdphy *pmic_typec_pdphy,
         int i;
         int ret;

+       ret = regulator_enable(pmic_typec_pdphy->vdd_pdphy);
+       if (ret)
+               return ret;
+
         pmic_typec_pdphy->tcpm_port = tcpm_port;

         ret = pmic_typec_pdphy_reset(pmic_typec_pdphy);
@@ -469,6 +467,8 @@ void qcom_pmic_typec_pdphy_stop(struct 
pmic_typec_pdphy *pmic_typec_pdphy)
                 disable_irq(pmic_typec_pdphy->irq_data[i].irq);

         qcom_pmic_typec_pdphy_reset_on(pmic_typec_pdphy);
+
+       regulator_disable(pmic_typec_pdphy->vdd_pdphy);
  }

---
bod
