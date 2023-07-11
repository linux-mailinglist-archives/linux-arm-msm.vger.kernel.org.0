Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26B3574EEBA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 14:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232254AbjGKMYE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 08:24:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232671AbjGKMXu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 08:23:50 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE6622D52
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:22:38 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fc0aecf107so28651975e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689078068; x=1691670068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vlaWs/VoeKCWx+SmDLbjeED6rzJyyUDZEcL2R9O3D1A=;
        b=p0YbH3ka199DRHd8bRbqZXxzWmsFF5DdJQpx4fjx3aTeXOezDvUdaWOu4IZ/8daNbT
         6mSo0yUKSq10Vc4VMw6feovId06/LsTuKRDTOaaSfbxFjYiO5cbYPECwFtNnOkTg0Z+z
         MA5+/lAqi8EoUVMOJivfKrEwImgpBw9GrUBPcWqQlUjrxlyY+SuuN4hMsavFieMp9eU0
         1vvBMRbk7wz/VHtFt0vmjOlZMYwy7OiJUkLP3BKVDFYlAz2PEUfAasHav8Gp5ZBdk57C
         RML8MBfrBKqkt0Fbe7fWsRQ8j9MgwoM3A7jRhwinSOjHQNrqzl+nPtzkDecfviKtzgiD
         TJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689078068; x=1691670068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vlaWs/VoeKCWx+SmDLbjeED6rzJyyUDZEcL2R9O3D1A=;
        b=bdV6O+w+saMIlZrEGvkSVMkdWQdMTTZRpHOjeaCkCfG2ZW5vdHjSozy0O14f2fLlu7
         W5upYAsTyliR9AwIotTGHlzGUIo9+Ewmq3xWm+WOOGMutua9FPG8BZxhYkD1wECACxJI
         vGjONJ/w1AP1/Kd5Ws12lyDeaGis+oOrqOPOpIi8yn+MRWiRE4imQ5DMZRwxV5nR/EWZ
         jBYHu7FkB3DZayR5crq0NfOZypT0tqY12csfbuEbQLnBZGjEIaWR9iXFgOh7MocPlfo2
         8OVuABOZrJdEYhTuMwUBpzUkdfTznMufJCFaVfR007YYUFgWIWGfFaCKTMzfAAKQW4zx
         IdxA==
X-Gm-Message-State: ABy/qLYE+iKEvoBeUn0vYIezuRtwy4aFNaFx4fqljOBEkdzaeXBDIHmg
        jtekdxg0Tq8jlZEq6Szw67r4Lg==
X-Google-Smtp-Source: APBJJlEGDbWcxO6jozCkMC+3E0q9tenuEF5tD7/MQuFcXLgThgae5F4/yAv+P29CubNLbhq+2XB7HA==
X-Received: by 2002:a7b:cb97:0:b0:3fa:93b0:a69c with SMTP id m23-20020a7bcb97000000b003fa93b0a69cmr13115388wmi.24.1689078068555;
        Tue, 11 Jul 2023 05:21:08 -0700 (PDT)
Received: from [192.168.1.82] (host-92-17-99-126.as13285.net. [92.17.99.126])
        by smtp.gmail.com with ESMTPSA id p6-20020a7bcc86000000b003fa95890484sm2397985wma.20.2023.07.11.05.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 05:21:08 -0700 (PDT)
Message-ID: <c926b135-80ad-fbac-d0d5-594e66dc5913@linaro.org>
Date:   Tue, 11 Jul 2023 13:21:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] usb: typec: qcom: properly detect Audio Accessory mode
 peripherals
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
References: <20230709200235.265674-1-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20230709200235.265674-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 09/07/2023 21:02, Dmitry Baryshkov wrote:
> Detect and report if the Audio Accessory device has been attached to the
> corresponding USB-C port.
> 
> Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
> 
> Changes since v1:
> - Fixed typo in commit subject (Bjorn)
> - Removed 'the' in the commit message (Sergei)
> 
> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index 94285f64b67d..56df04af2d2b 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -214,6 +214,11 @@ int qcom_pmic_typec_port_get_cc(struct pmic_typec_port *pmic_typec_port,
>  		if (ret)
>  			goto done;
>  		switch (val & DETECTED_SRC_TYPE_MASK) {
> +		case AUDIO_ACCESS_RA_RA:
> +			val = TYPEC_CC_RA;
> +			*cc1 = TYPEC_CC_RA;
> +			*cc2 = TYPEC_CC_RA;
> +			break;
>  		case SRC_RD_OPEN:
>  			val = TYPEC_CC_RD;
>  			break;

-- 
// Caleb (they/them)
