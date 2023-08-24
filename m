Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF67786A3D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Aug 2023 10:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234731AbjHXIhE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Aug 2023 04:37:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235680AbjHXIgi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Aug 2023 04:36:38 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDA731727
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 01:36:36 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-319559fd67dso5835340f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 01:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692866195; x=1693470995;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SHxEoyZDajUwnsm1+wbfNgRkJ5XWJHvQCGDl4QYUCEA=;
        b=WB29lFlyjGZP7IwXHsVWdxFyZPaTP9laZIuUgrEhFXzv6o5A+5CS54CxMkB1eGCyeb
         JF3hmIZ9KGkmtaWidgt0m332zPZYJuLVIRWtwwvpPPOli7E7wFhBioBNlCH78Katxdrz
         dg3lgHL3aPcqn8guOFHsN4Z1M9lx30l1X1bKajEP7jh72XZLswJRuqgd06M6fOKunSo+
         u0hu2hkwcXormsWG06CVpPHl8wUWR86LSdVLdxR4vlOM6B1oMYxrtDtJaiM/aFY/xaQU
         iPc2NekP3bMCnLAGNrTypz3yZvSsHGW1mZz1c0f03HcxGjHLtaYa/zHf5OVRYswRmvCC
         JwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692866195; x=1693470995;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SHxEoyZDajUwnsm1+wbfNgRkJ5XWJHvQCGDl4QYUCEA=;
        b=hlRmjxi7kZo8ZvMm9W7+OfVNZqb70QVpyzcd+lnyyteq62CI3LuZhcAPR97kmyS7n/
         sMSG8LZT/16xFR8Mvyp4419JELFQikDizXKRZCELxFyO13j4kYJ5aOihARrpUjyRpN0/
         gu5sTPZXSoCUtNRKsi8EPzjnXiogmhxQ0Ykm+LwThAdrrLYRmeQtypWZsjK1T7uxhHCZ
         mBvBwdffMUVD+yuehTrshx7TQLJ7UAvKgm3Q1YhsJedmY5B+17eTq2Tr+gcJ1704eWbe
         Xa4q9rZKlfp0eRRNLnfT0J0zJKFAGsPazhe2YNmd4zHz3R2Rs9NJbJqSlZ3PVm/2ErN9
         khYw==
X-Gm-Message-State: AOJu0YwPjhq1KTY6d0+GaYPpi48oglKiLSo/3xucfmosKBMXeIJX2bqF
        94O0S2tesIicgASN/Cnfdwj0sQ==
X-Google-Smtp-Source: AGHT+IGaMSmoL4KmYGIVbVJPE3e5o7M3YUNOmo8RrlFx/fR/jEJcLj8o+9dKqceBYAbS28OAEIOiqw==
X-Received: by 2002:a5d:4d02:0:b0:317:5a9b:fcec with SMTP id z2-20020a5d4d02000000b003175a9bfcecmr10781698wrt.14.1692866195130;
        Thu, 24 Aug 2023 01:36:35 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id z1-20020adfd0c1000000b003143c9beeaesm21507548wrh.44.2023.08.24.01.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 01:36:34 -0700 (PDT)
Message-ID: <0ee712ae-4aa0-f083-55b1-73cb172a5cc9@linaro.org>
Date:   Thu, 24 Aug 2023 09:36:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] usb: typec: qcom: check regulator enable status before
 disabling it
Content-Language: en-US
To:     quic_huliu@quicinc.com, Guenter Roeck <linux@roeck-us.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_fenglinw@quicinc.com,
        subbaram@quicinc.com
References: <20230824-qcom-tcpc-v2-1-3dd8c3424564@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230824-qcom-tcpc-v2-1-3dd8c3424564@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/08/2023 03:32, Hui Liu via B4 Relay wrote:
> From: Hui Liu <quic_huliu@quicinc.com>
> 
> Check regulator enable status before disabling it to avoid
> unbalanced regulator disable warnings.
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hui Liu <quic_huliu@quicinc.com>
> ---
> Changes in v2:
> - Add Fixes tag
> - Link to v1: https://lore.kernel.org/r/20230823-qcom-tcpc-v1-1-fa81a09ca056@quicinc.com
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> index bb0b8479d80f..ca616b17b5b6 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> @@ -422,7 +422,8 @@ static int qcom_pmic_typec_pdphy_disable(struct pmic_typec_pdphy *pmic_typec_pdp
>   	ret = regmap_write(pmic_typec_pdphy->regmap,
>   			   pmic_typec_pdphy->base + USB_PDPHY_EN_CONTROL_REG, 0);
>   
> -	regulator_disable(pmic_typec_pdphy->vdd_pdphy);
> +	if (regulator_is_enabled(pmic_typec_pdphy->vdd_pdphy))
> +		regulator_disable(pmic_typec_pdphy->vdd_pdphy);
>   
>   	return ret;
>   }
> 
> ---
> base-commit: bbb9e06d2c6435af9c62074ad7048910eeb2e7bc
> change-id: 20230822-qcom-tcpc-d41954ac65fa
> 
> Best regards,
Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
