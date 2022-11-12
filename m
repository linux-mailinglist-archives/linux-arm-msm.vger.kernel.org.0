Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78C2D6267AF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Nov 2022 08:38:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232759AbiKLHin (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Nov 2022 02:38:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbiKLHin (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Nov 2022 02:38:43 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A1954198E
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 23:38:42 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id t10so6875990ljj.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 23:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+OX/giQG0JpVo/NBsHgV87sgp361wbPnuLuWRkMeULs=;
        b=J3lsKMcD7uIsM0UFE0MSJQWf16+ukS9uM0wZM1DFKInoWE8WOV/SoNyfAO1y0zbhsM
         IxlyILDMtahH1jkjr9QjEEstFcG+NgbaSQ/hekIK0GwBes3Ox5T5reMcFlUT1DOee2SP
         fbIp/h2LBBr+UAWTxCu5FTcfuHiYpI599DpHn1yrDEnaHfgBoBjhwKBjpCwKVRQogqCk
         EAc1O965NYdNsXK88aI2GBLHWq6q/cE4S11aNny+wryoD8rSB4mKJeZgWbxKjI+ylLSn
         3/tZ763CzMMo628XPlmSbev1vj3tjPn5umBbC94nZRF/ecTLISQEhGTWc1l1F5IKusUq
         vE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+OX/giQG0JpVo/NBsHgV87sgp361wbPnuLuWRkMeULs=;
        b=1RLIgifGQQ9k4zuu2w8V/Av6utHtDHvAA6Phsal+EvooIynQejsHur5RpuaauxkSuU
         z51FYrSReXINNkQJJx7V07XpJJfS7hvjOYLTJQ59Eg20ToJim593jXEhbu07YrPZpvy8
         gBoiJPXdMRsksiyrnHVGBRm0E2X6LB7d5SkF7pdKomR8ohfZ2bU7Tcl9/aKJtRFnxudJ
         AcXzH0zpXOwkzg06gKoWSQvsV4mPoYh2kRPKOCegorAMt4iXloJj2O5K7fTaJnhljYK6
         l2QLbTMu/wBKgFt//fLX9YQoeLmbHdPmhTPG8mYJFeuN9Mz7uSw/lD+z8/WhDlQ49EGB
         uGSg==
X-Gm-Message-State: ANoB5pmd+LsHUMxGDPhEkPyty8n758mx44h8g447JdDy3E3EcqpPIk/v
        Shmh4BvqgPsWO1j8KACo0T0CuA==
X-Google-Smtp-Source: AA0mqf7JsNX4MDYLP3mvntvPXJaVl5ZVOr7fFyk+vkdPxd3zNoddNV6phcMz2o7yn2B91qjLeZWedg==
X-Received: by 2002:a2e:94d0:0:b0:26d:a666:6358 with SMTP id r16-20020a2e94d0000000b0026da6666358mr1535671ljh.148.1668238604360;
        Fri, 11 Nov 2022 23:36:44 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q6-20020ac25106000000b0049f53d53235sm740229lfb.50.2022.11.11.23.36.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 23:36:44 -0800 (PST)
Message-ID: <f60d616d-a729-8862-00b5-3a4a62f79f49@linaro.org>
Date:   Sat, 12 Nov 2022 10:36:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 13/22] phy: qcom-qmp-combo: add dedicated DP iomem
 pointers
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221111085643.9478-1-johan+linaro@kernel.org>
 <20221111085643.9478-14-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221111085643.9478-14-johan+linaro@kernel.org>
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
> In preparation for merging the driver data, add separate iomem pointers
> for the DP part of the PHY.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 246 +++++++++++-----------
>   1 file changed, 126 insertions(+), 120 deletions(-)
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

