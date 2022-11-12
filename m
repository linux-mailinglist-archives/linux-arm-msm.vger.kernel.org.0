Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87EBC626768
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Nov 2022 07:18:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234480AbiKLGSs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Nov 2022 01:18:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234387AbiKLGSr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Nov 2022 01:18:47 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1700018353
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 22:18:45 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id be13so11300388lfb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 22:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ogXWCN0t521Ij0otOt/tVRnA4R2z6ldRz1ScJkRGGsQ=;
        b=pFT3u4kkDpRU+DOFPlY00vYx7zDAsAf5Hz69EDbHIamIMwyYw9sO8Gn42amkS9xP8h
         MJXAUwpo1Gv3rj/ukO6Kl+8HG88SXxSyQh5uJcAa6MbFCV4+Xd1XaFqqRa3NdS2iEc1E
         UfCu4pgYBDWshP/2At0ZSkuewtJe2TA9yZGIGRv9nkNJB5loK4Y4B4d2MorT8U699+aX
         A9UusTIt8MW9gpmnDxG2LCrzxDM2/9yM5mtomR9+jbioqQd1I+AP2+gYbowWGK8cSKNI
         OZU79cZBGs0tcek97oUhm+WDpcT6X6i6G35Mu/WJ9jqQdZWnKjkIMcfz0YUgi1PQPb8r
         dzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ogXWCN0t521Ij0otOt/tVRnA4R2z6ldRz1ScJkRGGsQ=;
        b=Atln+WXa8pT3em6C025IHnL9erU/VFqToso2DAkaz1KP+ug9jfgHx5IZjBOryXL1a2
         9/AIJW0he+RKL5RGxEJi+9LRaNSNlStm557GKTunr00noP51L3clTKPFciGZ3M14Habx
         K2hpcDeAahPET9e20PCYIWGYkB9bpyQpIJXYSPInZ8Gj3suv9xzpQCjbuoIFoSNVUmoI
         QECpulJwpC1geIj2ncszjYcW8hKAebxWiMNvRcdA3GHEDH/L/sTQwLZIZZaCkMQ1MtUb
         6VicLCiKSafP0bbtDHiHGviqLdLBs5WSJaoTnu35LbN8cf4+JUedp41baOxQMpAHi7Za
         D8lg==
X-Gm-Message-State: ANoB5pkTKI6nV8tNQHZjfxm9K69XyHynaM5ijsnrXGFThobz7oZ4OoT+
        CiHl56+KCpaVdajb6CTr/8vWdw==
X-Google-Smtp-Source: AA0mqf5iqNcTbJWktJtWcItFCGC6wMLmJGYOBeuUpXoRTiDNhdQZXobUNi1w+oeH59dOfm4TzNztZg==
X-Received: by 2002:a05:6512:20c8:b0:4ab:6c73:28cb with SMTP id u8-20020a05651220c800b004ab6c7328cbmr1575082lfr.504.1668233924236;
        Fri, 11 Nov 2022 22:18:44 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e10-20020a05651236ca00b00497ab34bf5asm716043lfs.20.2022.11.11.22.18.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 22:18:43 -0800 (PST)
Message-ID: <3e28efa7-3629-740a-4901-57d5e5c298f5@linaro.org>
Date:   Sat, 12 Nov 2022 09:18:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 01/22] phy: qcom-qmp-combo: sort device-id table
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221111085643.9478-1-johan+linaro@kernel.org>
 <20221111085643.9478-2-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221111085643.9478-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/11/2022 11:56, Johan Hovold wrote:
> Sort the device-id table by compatible string to make it easier to find
> and add new entries.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

