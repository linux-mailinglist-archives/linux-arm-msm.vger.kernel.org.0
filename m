Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D4686F9981
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 May 2023 17:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231654AbjEGPsN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 May 2023 11:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbjEGPsM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 May 2023 11:48:12 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93E053C03
        for <linux-arm-msm@vger.kernel.org>; Sun,  7 May 2023 08:48:10 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f139de8cefso23745449e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 May 2023 08:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683474489; x=1686066489;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dvd1wcddDnuI8xDMHy/JBREKoiCmgw2+qPFLe3kD+Sg=;
        b=kPqgPO0uNRT4ln/P6yjXt/YWIChqAu/dBpyVcn9fV1c3TZDmGMfXsJ1G1Y/95+CIkN
         8JaB6Ipky4BWZrsTGvdotbye3LnqrBX0BDzSFMXNl0UEg41EFtkxY65qA4waV8r9YzrN
         ja+NnGW2j1K0OCne9r5fPNqqOBmkfIP4jyz05bW6SV/rGrbagGKuQd/YB5Q7b9DkUrTM
         ICcsEtGBmNIlLIuw5RuOd3+hgmDdBI8gfl8XW5/RrmsEpbdTOS9CBozFpcgXrzhbpOPU
         EquZCNJuBI7kvLafbx5RfZtvgaIVpdn9rj7kNyXUHXs2AUN3MtpKtKHQ28K6pw2unpd5
         I6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683474489; x=1686066489;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dvd1wcddDnuI8xDMHy/JBREKoiCmgw2+qPFLe3kD+Sg=;
        b=f1ezaArX8IYxjJiltKijbv6Q5Sx6UHCnzUsTiNs+VGpYVOvNlF5tOIUIYZkGSNDsp6
         UpvN7caq4+Z/ozpa372tQaXCXtpEPuhqxV8vZeYVjpkheyPB/CY2ipKK69HlUm385vpK
         0wMj/8ZGkE/VU8x6LmFvJ64M+4lra3Ar8EUK75HvW4ell0cYriqzDv0DceopLKfygL7I
         b4bQQpF2Mb4CO+RkJzR2zc1bhe+P0wDtQR6GATond6xfloS/kCYUeE0cvnB70CyX8Lm5
         76LANCVXigkYfTX1xIRZ/SPTbKuHwHdTwwLkaoHwuX2zoM+CKMNgHJerqWCPLPOpZ8si
         xWJw==
X-Gm-Message-State: AC+VfDwFhE1CNkRZDhUz+JRBKVYIS0PieIwhBFfDzh8dHBFweLIt0jmk
        eSOUzoJHbEq9ZtTssNewfbMJ94bJqHOrp41bUHI=
X-Google-Smtp-Source: ACHHUZ5OQ5tsRZMNgmjb1yUX5x0EN64JfrmwXl9OXuRV+QiEwE1vlP14Rp4K5Z2azPwAMwTiWuLYig==
X-Received: by 2002:ac2:5215:0:b0:4ef:d567:4854 with SMTP id a21-20020ac25215000000b004efd5674854mr1811635lfl.11.1683474488883;
        Sun, 07 May 2023 08:48:08 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id u17-20020ac243d1000000b004b40c1f1c70sm1014163lfl.212.2023.05.07.08.48.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 May 2023 08:48:08 -0700 (PDT)
Message-ID: <de242c1a-9717-ad79-2ed5-7b73cf66f5e2@linaro.org>
Date:   Sun, 7 May 2023 18:48:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH RESEND v3 4/5] iio: adc: qcom-spmi-adc5: Remove
 unnecessary datasheet_name NULL check
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230502-iio-adc-propagate-fw-node-label-v3-0-6be5db6e6b5a@somainline.org>
 <20230502-iio-adc-propagate-fw-node-label-v3-4-6be5db6e6b5a@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230502-iio-adc-propagate-fw-node-label-v3-4-6be5db6e6b5a@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/05/2023 02:17, Marijn Suijten wrote:
> datasheet_name is statically filled by a macro for every channel, and is
> nor should ever be set to NULL.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/iio/adc/qcom-spmi-adc5.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

