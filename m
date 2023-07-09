Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E5AC74C212
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Jul 2023 13:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbjGILPu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 Jul 2023 07:15:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjGILPt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 Jul 2023 07:15:49 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5BF13D
        for <linux-arm-msm@vger.kernel.org>; Sun,  9 Jul 2023 04:15:47 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3143b88faebso4047364f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Jul 2023 04:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688901345; x=1691493345;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Il29rBLTt1Qhw65X/LNh/gF1cvYaTsOodblaaUGqSUo=;
        b=GU7lmrJfsIzBYLr36sJlinNbAwYP+huiDBtVIF80yAp67SGYI7Eb3JwS3ghqlkHzzH
         3zXAmRTc2A8FDY2Oif+xCA6C40Rf1sjZggRwNWHVPoAGGtZQuQgLTa5y/SiZI8L2u7nf
         2DS/k81m+vNnUaj31/3dybWzVIflFWkD3DECnqzC+2YbIQzPtB2a0hHLFQfqC+8srlOK
         Fmtz2DmMwzehcgMocGq7HbaM7WAN1KjvBpx2YuEynAi4mTqcZyyGgnqbNwjNuovcgVTa
         VrntDUxGYxZdoFcDv3KUJskvjaYo8g8mqCKqOFeWM3bYqBXOL0bTqHgOdQAg+ThmG7kB
         O9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688901345; x=1691493345;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Il29rBLTt1Qhw65X/LNh/gF1cvYaTsOodblaaUGqSUo=;
        b=dWwZwpVua+PyRTfh1vHMmCidJo47zsR2bcfp8knTXZUNguTMON3eYfVcj6YMkrVdRL
         fwATi08TyyDSm7rZ49kt3MDjuHYfIP5QXG52JPw36UQrhnry50pIjnfB4A3wkGO88fAf
         DCH+vCUEro80UsA1xTVmRi/4heH4hniPTJOQFrSRguKHWOIdhG1zEDRhq7CkStGbQkw3
         XrlSTsXg6hFfODWknWIyQZ0GC6X8c0Jzoc+IyrtrKzLU/Ndq7t8GAL4eCjVpYKc9yEbJ
         VX294cu8lo5QCbh/OypSvd2sJEGH2iqaRm1+mvFXr7nBZ7nSuEmkTjNyCd/tk4ZVlUvh
         mddA==
X-Gm-Message-State: ABy/qLa6qOnhsWXTXh7fij+cpKE6HZ3ve16UgMegZBIYqlu1YbpSUEEa
        W7thXh7bKwR/APEou9Uud9mjzA==
X-Google-Smtp-Source: APBJJlHR7YzvS1K1DjTTGLScnZ+CXYLU8LYA7MBdNFhCv5oZHBfVwrbwArXGjwUWZwVhbfnEsxyzpQ==
X-Received: by 2002:a5d:49cb:0:b0:313:ef24:6feb with SMTP id t11-20020a5d49cb000000b00313ef246febmr9581970wrs.3.1688901345527;
        Sun, 09 Jul 2023 04:15:45 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l11-20020a5d668b000000b003063db8f45bsm8933294wru.23.2023.07.09.04.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Jul 2023 04:15:45 -0700 (PDT)
Message-ID: <e912c595-11a1-d062-d169-f76d6258200d@linaro.org>
Date:   Sun, 9 Jul 2023 12:15:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] usb: typc: qcom: properly report Audio Accessory mode
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
References: <20230708213617.3759954-1-dmitry.baryshkov@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230708213617.3759954-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/07/2023 22:36, Dmitry Baryshkov wrote:
> Detect and report the if the Audio Accessory device has been attached to
> the corresponding USB-C port.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index 94285f64b67d..56df04af2d2b 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -214,6 +214,11 @@ int qcom_pmic_typec_port_get_cc(struct pmic_typec_port *pmic_typec_port,
>   		if (ret)
>   			goto done;
>   		switch (val & DETECTED_SRC_TYPE_MASK) {
> +		case AUDIO_ACCESS_RA_RA:
> +			val = TYPEC_CC_RA;
> +			*cc1 = TYPEC_CC_RA;
> +			*cc2 = TYPEC_CC_RA;
> +			break;
>   		case SRC_RD_OPEN:
>   			val = TYPEC_CC_RD;
>   			break;

With the spelling fixedup per Bjorn and Sergi

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
