Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1E235E6A13
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 19:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbiIVR6R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 13:58:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232196AbiIVR6N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 13:58:13 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02C45106510
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 10:58:12 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id a14so11916270ljj.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 10:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Z6UDGtQQO72uytLS1mdZYY+ykMsfHmukT+V7PXKhUUU=;
        b=un5AMZnBGkspxOGTwcdqsEvtTbBaEz3uI0DPqrX+BMvoA3F7wZEHCZDqM2KoU+slCM
         51FNfhvfhDnvDC4zvRsJcGVkS88YpBsBMDEGuA7P8UGKnY5DKIdfkptH8n9RG8096czb
         UKEs3qoNijVsu7upNpU5YRrhGzIrgD/Ruzs8QfAPN7n5XHe/esmqkH0ouO7NMmELlL3g
         +ukcEn3i4irj3sGVd/eTVytl8J2IwRGnSimWv5AvUAdRQp1SEoql11cd2V/gbYqV9FIr
         5R8k0NCBQQTGX8mRiIpijb/sC3sjisMnJlfysoSCeL2reKz7T2nWY8zzbVXt0+kUvzfV
         2BNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Z6UDGtQQO72uytLS1mdZYY+ykMsfHmukT+V7PXKhUUU=;
        b=ln0rI70n15rMoGZ4HBSI1V5kvGmu1DRuC5IPFdRmO96NA3EDDKPnqu5YjRZVbXskP/
         aPwAjiWY+v+rRrPJUcjH8zRgAjQrRFNewnAIKWXo/Y/0v37bqFo7LiU80hNkJgn2+/lX
         1T3JXpLPbCBE0o8a0B2w/Ld7BbbGL8EKaoalKezSrT3v6+ePu3W2v+m3bMrilXBuPuvD
         iDdSKDhiWz4yyNLBTtUYE3KZ6tQR1Vgxd23NC2CRH1z3OxFLMZNIj7X4r6sjo5flEM1C
         yv3V+h3NrafNTtXqR+n2LwCsoP2z9zPVtB0a2SyxhIXpAbP3osefyieLdRagO0c/GoxJ
         9RGg==
X-Gm-Message-State: ACrzQf1Uv6TCkM5gNTkJ3dmzpOjfF6JCoDknmKci9xnqunthIsGEg/Hd
        09suOSWKJ4L3P7+pJ+Mzq9xWeTQKSmcAcA==
X-Google-Smtp-Source: AMsMyM6UtnpYXbDYK4AyIMwbvzo8vQzvR/vwrEkKLLaPXho/Im5vTne6648dSGqr1Mjfuokw86cntg==
X-Received: by 2002:a2e:818f:0:b0:26b:e97e:d830 with SMTP id e15-20020a2e818f000000b0026be97ed830mr1506351ljg.420.1663869490310;
        Thu, 22 Sep 2022 10:58:10 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b25-20020a2ebc19000000b0026c4e922fb2sm1013909ljf.48.2022.09.22.10.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 10:58:09 -0700 (PDT)
Message-ID: <cadde13d-0742-039d-6701-ae15460efb4a@linaro.org>
Date:   Thu, 22 Sep 2022 20:58:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 05/17] phy: qcom-qmp-pcie: drop init and exit wrappers
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20220920073826.20811-1-johan+linaro@kernel.org>
 <20220920073826.20811-6-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220920073826.20811-6-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/09/2022 10:38, Johan Hovold wrote:
> Drop the unnecessary PHY init and exit callback wrappers.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 29 ++++--------------------
>   1 file changed, 4 insertions(+), 25 deletions(-)
> 

Initially I thought that it might be possible to unify the 
com_init/com_exit functions, however it doesn't seem really possible. 
Let's clean this up.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

