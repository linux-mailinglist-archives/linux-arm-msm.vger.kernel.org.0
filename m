Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2238D6125B8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 23:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbiJ2V4Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Oct 2022 17:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbiJ2V4T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Oct 2022 17:56:19 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9C9C255B2
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 14:56:18 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id be13so13699068lfb.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 14:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cZpw4f7LAUGvF4cSAbPz5CyMSMlcyLXGFUZk34oAqwk=;
        b=e3gHyWh79z0KE5mRU/J/MMBAmTjW8qWmUrc2++BjK4YxMq4J8S64pZFPL6Po2IR6Pp
         VT2hrOHKcu4Pn/jYo4Jotb0roRp0orFbcVErMa5hph1ZeGed2CUVzG4FyqeOtzvzCwCq
         jnpp7jrqEHpWNGcAb/jn0pG6vn2rYNOmHg/EScAm9VMAEQjRpQPdkYMO+rnnMZCbDo9r
         mBaNvA2sn9AaP9J40dXrI9YOzinvXWooAocFXvMVmLZ5lnvNwd5zE65fy5niewhS7riH
         15veiAGwLSIWaL3NnWlpBSi3CDelcpfd5OHeQsAWFC309+rAbC4mKHMVSi+YrybO8d++
         D0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cZpw4f7LAUGvF4cSAbPz5CyMSMlcyLXGFUZk34oAqwk=;
        b=P9wlnF9ZkskAh7L90l7wDR2wjcqKY45otAWyMd/gkF53JMVaomEzuxt2t8wiIHKTKp
         IWPeRRYjs98qGTvZn12y9+3bwIO9Av5iZzxaOmnSZrjiHWskcxCU0BA4X2aD0NlXz93+
         n8h++I5b7GeoBN+8CAYQ4hx5t2HHRGlJj0bVh0ycLzJlk0NKxGRNQ+Z8fRjNWTayYZGs
         MQSBg9EPSvWKHOxMVIfn/ukGf10SW3hd0F05I6cIiBIl3kh8weHaOrIHSTO3C92AWK9T
         cJ0nmw18POhegxh2HTnOTBAlPk8gDP4+r5UbUPdrQIaOotDuk+ZvimXmFervhnpVnBms
         0L8g==
X-Gm-Message-State: ACrzQf1HAp/Tk1FJ0hJxNfjOdjLupWcmunB9DYX/5zjUgT4opsp3a30L
        cJUmtVsPieONzaXwUsGNpNvsKQ==
X-Google-Smtp-Source: AMsMyM50A4M6LSsxWacFB2rvuxaNawYjAGDccOogtj9cOVnciCpBaYi/aDIG05dElT3EALIbP3fkTg==
X-Received: by 2002:a05:6512:2c88:b0:4a9:4051:79a1 with SMTP id dw8-20020a0565122c8800b004a9405179a1mr2131082lfb.331.1667080577306;
        Sat, 29 Oct 2022 14:56:17 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id 5-20020ac25f45000000b004a03fd4476esm443654lfz.287.2022.10.29.14.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Oct 2022 14:56:17 -0700 (PDT)
Message-ID: <5d846ed8-e1c3-701f-6b92-a0bd2a9670cb@linaro.org>
Date:   Sun, 30 Oct 2022 00:56:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 08/15] scsi: ufs: ufs-qcom: Remove un-necessary goto
 statements
Content-Language: en-GB
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        martin.petersen@oracle.com, jejb@linux.ibm.com,
        andersson@kernel.org, vkoul@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        quic_cang@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org
References: <20221029141633.295650-1-manivannan.sadhasivam@linaro.org>
 <20221029141633.295650-9-manivannan.sadhasivam@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221029141633.295650-9-manivannan.sadhasivam@linaro.org>
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

On 29/10/2022 17:16, Manivannan Sadhasivam wrote:
> goto in error path is useful if the function needs to do cleanup other
> than returning the error code. But in this driver, goto statements are
> used for just returning the error code in many places. This really
> makes it hard to read the code.
> 
> So let's get rid of those goto statements and just return the error code
> directly.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   drivers/ufs/host/ufs-qcom.c | 100 +++++++++++++++---------------------
>   1 file changed, 41 insertions(+), 59 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

