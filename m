Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3ABF6267A7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Nov 2022 08:32:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234542AbiKLHcz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Nov 2022 02:32:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233739AbiKLHcx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Nov 2022 02:32:53 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3705303C5
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 23:32:52 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id u11so6843368ljk.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 23:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZeeRPkiWJ6dgVYLmrtRGsjTc/jG/dNAJ9wPW3QYFgpU=;
        b=tiYHbvZJnvWktz9Q2secp6W0miGCQWW6dBdJfSLlBajb8I7oy4ca6HMy+fv3ptMOk7
         tltt+7dsvMllR0DMVVlwdiC2nRi71/46qXPlgtMLW+B1YFqCueTDWHq/zOjIvszAQAaP
         bHOG0+yQtCO/d8iCQs8xdYIjPaOra4mdHaCotYeCIcUqYeIiy9aGhDVHK9fKeMKYu9xo
         ouGqw0oRoO9tyz9Pm2w7XR3SD/9zVVRHum3VJVwif6yhMvgpla9uMBUuHqsw0sZux9KV
         wgfYYE+QlIrIIOBqAdz9WEyA4VOeXRC50xk/ENTEeFEIrqp/0KIMzmhlRD406nJNZrjA
         pJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZeeRPkiWJ6dgVYLmrtRGsjTc/jG/dNAJ9wPW3QYFgpU=;
        b=EdW0mtZ8lxtv38VKko6ZjbgP6+5UiXQ1Tu0GjXoVVgPQOlLpd+reIyfxCr2FtFCYu5
         iWQPAJoyZv4p2LUs+OG8sTQJcYAqlgVzrD5+ubm7FFh3eh5Ab/tzz4eK7lXuWDGFSWT7
         R6k7Pm1GwJQ5ZAsdTg+0GTcjgOaSojTPV+i5dbfFSqSlRsBpTSS4dW93UbAvl9iUP6sS
         GpY6jnEnBIBQDycHaHX0Ur4oJ9ZImsqvflXf2hNI/dyCzcUypZpxLDO6Fkw+nHvaf7CG
         mfS7ns+98d2oT15vQcYRIkTsRJlvqJih8hfhCbpgl9+Ty1eF8uj2wRrf02+b3KfMCP4c
         JxpA==
X-Gm-Message-State: ANoB5pkIx0d02UKvPb9c4t7Chg5hPtGUe8gED5Fn5DqWj9t+i5YhydHs
        g+YWoRWzEOHz707m4llKvNgVRw==
X-Google-Smtp-Source: AA0mqf53TKyvPCvEUZkaKsGEYJe0Siut9CWzlvX53yz43w45aFfp8j2EoBX2TEZ3s8BtbCSHF2ZYUg==
X-Received: by 2002:a2e:9982:0:b0:277:2b10:bf69 with SMTP id w2-20020a2e9982000000b002772b10bf69mr1763963lji.392.1668238371299;
        Fri, 11 Nov 2022 23:32:51 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t12-20020a05651c204c00b00277041268absm783886ljo.78.2022.11.11.23.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 23:32:51 -0800 (PST)
Message-ID: <a889bb3a-cedf-4be8-158e-fc6f202fb7c0@linaro.org>
Date:   Sat, 12 Nov 2022 10:32:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 14/22] phy: qcom-qmp-combo: clean up DP configurations
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221111085643.9478-1-johan+linaro@kernel.org>
 <20221111085643.9478-15-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221111085643.9478-15-johan+linaro@kernel.org>
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

On 11/11/2022 11:56, Johan Hovold wrote:
> In preparation for merging the USB and DP configurations, align the
> initialisations of the DP function pointers.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 40 +++++++++++------------
>   1 file changed, 20 insertions(+), 20 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

