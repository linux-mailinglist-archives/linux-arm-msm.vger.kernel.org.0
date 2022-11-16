Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A293F62BFE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 14:46:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbiKPNqe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 08:46:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbiKPNqe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 08:46:34 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3250EDDC
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 05:46:33 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id z24so21901838ljn.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 05:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0GQzKSdbdY08aQnxjgmRAX9ISYKX+5S/k14tthAM/98=;
        b=xFMUIhvIFHg5Tn34kORJvbBfHtFyKxOAfWnGbAApobCKxddBhPvMwurHQEoSLsC7g4
         7MxKbu1KUaYFfxLMSxyqU1WlhE4MyEaAIrtHKJoFFoLbMGznMEyFhn54X6ZeVgIC98ae
         IV0Iv2LLoMvhGxl9E9kiG0e03ZJMO9X/d/2Q6BeKooXfInFn4M/OEk5ZXN7IZZ8Mn3G0
         2y3l3P8yNy3DvLgZXDQjeMWImGAqI50aJWS3d5fhG8pdSuFLSHaQP3znYP31Wzd4ZpmO
         GSP8liBdDoxlYoNe2sUJv/Rpit84bcBjLyThqrpMdjGXgbKWTC9+eX5huoCfD+rA+HsY
         y2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0GQzKSdbdY08aQnxjgmRAX9ISYKX+5S/k14tthAM/98=;
        b=br5A+ofVS3FhQeBDCofNi7059JX2eWhfP3HSPLcecZVRv4Os32t0nvT1UwUTbQpoFK
         P3pHunlEMVEKxjEhi6cxvK/qLbf84l0HhEndflkU5O+IUxLL6D3jZoTcMAxWiCCORNSw
         9AXRGDIziZ2nWyp4Y0lPGj491dSFjZXDT+VmcQW3ChCbDbum+8H4eUJNecoRC39tcrNR
         E3YlqABYfRk0SITuwAI2Bs9/jCW4oWDomMd8CvKAuTYt4eRiSeBqDiA/EXaOCtO85SCz
         OjtOWrd0uQXnJ0xYlD++57eFB0juzgFWcKxsD1IIUZMNAvQQFl0EVQYEyxY+RVNamp/v
         DRUw==
X-Gm-Message-State: ANoB5pkp3ZB/PIUn9m0CSav+w7FURRwC4Fj4P3Az+nLaigacXyKSKf1S
        6hYIg0Iba1HbnNKaPsg8EBFjow==
X-Google-Smtp-Source: AA0mqf40J9P2cpBUerrY741PqyhlkI8/X1XTnwuH9hqEvmuE3TEqJYGd0HnWI3XU7d6u2uADZngxEA==
X-Received: by 2002:a2e:5008:0:b0:278:f31b:2770 with SMTP id e8-20020a2e5008000000b00278f31b2770mr7092342ljb.310.1668606391566;
        Wed, 16 Nov 2022 05:46:31 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bs15-20020a05651c194f00b00277025ddc9esm3004691ljb.54.2022.11.16.05.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 05:46:31 -0800 (PST)
Message-ID: <555fbc95-c002-7705-0639-9deb701ad513@linaro.org>
Date:   Wed, 16 Nov 2022 16:46:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 2/2] soc: qcom: Add Qualcomm Ramp Controller driver
Content-Language: en-GB
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, agross@kernel.org
Cc:     andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
        kernel@collabora.com
References: <20221115154555.324437-1-angelogioacchino.delregno@collabora.com>
 <20221115154555.324437-3-angelogioacchino.delregno@collabora.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221115154555.324437-3-angelogioacchino.delregno@collabora.com>
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

On 15/11/2022 18:45, AngeloGioacchino Del Regno wrote:
> The Ramp Controller is used to program the sequence ID for pulse
> swallowing, enable sequence and linking sequence IDs for the CPU
> cores on some Qualcomm SoCs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/soc/qcom/Kconfig           |   9 +
>   drivers/soc/qcom/Makefile          |   1 +
>   drivers/soc/qcom/ramp_controller.c | 331 +++++++++++++++++++++++++++++
>   3 files changed, 341 insertions(+)
>   create mode 100644 drivers/soc/qcom/ramp_controller.c
> 

I'd allow myself to re-ask the same questions here:

Generic question. regarding this controller. If it is supposed to work
close to DVCS, etc. Does ramp controller need any programming when
changing speed and/or APC voltage?
Is it necessary to turn ramp on and off during the runtime?

-- 
With best wishes
Dmitry

