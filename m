Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12B235B3459
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 11:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbiIIJqx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 05:46:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231626AbiIIJqt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 05:46:49 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85219F22DE
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 02:46:48 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id l12so1155988ljg.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 02:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=DGDMMFlp2cXLA+6nvav0juDIw0VAWWIPkxGgMWkhrs8=;
        b=U9D/tyGHFhYKOQqllYgDxD/cPmNI97KD/1FGnGghOupZUyFm22lgo6ysS9Whl/cIAB
         vvx6ZPSGGsf49EOR+I/jGX98JAPh5LJ35kf3M5rJtil7oa1DR3zBtLE0jKeR1o9gvyw1
         eedXwlZJpI6/yYJ2m4dVrPr24EikhlDP3IGH1TINrB6sGzd9gDLNz/T5IBRruzAcN2EY
         Hl2LvkI2cUSUHfccqQ3ND3O+yqWVCqkWq4NmX938TseYDILQdW1CreQZSYwDGHWdEDxX
         w66Q7IciiFN3luCp8J43xBb/cS//CTi9MAwYNIQ2zcFMO0KO8V+Nylr6bQn6sg0TNDF2
         DhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=DGDMMFlp2cXLA+6nvav0juDIw0VAWWIPkxGgMWkhrs8=;
        b=BH8/hIhYpTy1+LXuawspfPPrCeNZJ71+fSWtJh89HfIXswXRW0yWjcIER+AhFIfN0q
         cwz30jErt45z1kdX2llHHTpA6T6IiGycnD+jg8UpGOyZpSdXm+lBvgqX/DUI+BPedXYi
         YvNgTindKKvUAQj1qz0ChqQV7JudAnRLLaT/DSD30XvqthsxWKmPhbYM2E8+KMc9KlaA
         yAmQF4iBgiJHCIS8UmUZcJYLOyvcS3IU6K15qtVw3WyUR7i+9Ao76ql+3F9KuX+VOOcc
         SN/4Pqz7evgig1KEQGIgyDZA/tCBR9HraOtwAaZJUjaSzUq9xdcLlED/+LEdA1ex64Mn
         g01A==
X-Gm-Message-State: ACgBeo3mbkSZ4sGTSls8OgTIKLonHwcszB/47nVgbjv9GXXDhWy7ZP2N
        5GCk8cjdSzUkYd7nuUayQuqmxg==
X-Google-Smtp-Source: AA6agR4ZjSP7DOSDvfGaGz4vhadgQmK8cLl2/wG9Yp+AQXtpDwTl67X4TaUAhluqM198azW5oPpwkQ==
X-Received: by 2002:a2e:834b:0:b0:261:df5d:fd8b with SMTP id l11-20020a2e834b000000b00261df5dfd8bmr4049784ljh.110.1662716806857;
        Fri, 09 Sep 2022 02:46:46 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o13-20020ac25e2d000000b0048cf43c3a85sm7483lfg.238.2022.09.09.02.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 02:46:46 -0700 (PDT)
Message-ID: <cf61b495-a5fd-db22-5cd9-1bfea7eb0f39@linaro.org>
Date:   Fri, 9 Sep 2022 12:46:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 12/16] phy: qcom-qmp-combo: shorten function prefixes
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20220907110728.19092-1-johan+linaro@kernel.org>
 <20220907110728.19092-13-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220907110728.19092-13-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/09/2022 14:07, Johan Hovold wrote:
> The driver function prefix has gotten unnecessarily long and hurts
> readability.
> 
> Shorten "qcom_qmp_phy_" to "qmp_" (which likely stands for "Qualcomm
> Multi PHY" or similar anyway).
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 165 +++++++++++-----------
>   1 file changed, 79 insertions(+), 86 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

