Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B41BA50B848
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Apr 2022 15:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234102AbiDVNX2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 09:23:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234144AbiDVNX0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 09:23:26 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4700E57B27
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 06:20:33 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id i27so16332975ejd.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 06:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZydoTw4mzwMScLgM9P3CZWDQFTuiETQUDxvT9OfBlMQ=;
        b=PU9bDqmz9ld9PMvW3oMEIEtZLnZQ6yQnz+QRBQd2Xv5sbFT1dL1KEnCjaY+qF8tGRU
         A84q8yQz/+CZoZskM+CRtbdNqJ+7Yr5Trc4oO3o0SXsyOov957se2W27FkGgsr3Ldpdw
         rwF9TV2rAcS72mjqy463StssqyHfEYHvrmpVq4S95yleCFluzvnExiLbXPCXMU4sU+Vd
         zFOJr4i9lh22efm4Mj6cgDVEWgucUtWvxbEi3uRBYcm+J66/iUHajQ9ZXf7pbkc0EbMw
         bjyQ6tcMFiYrN+d6sCWjdoYE972bOGrRva0VH3v1dEm0jqwyIWEkYzrwZ8/49azhlP+R
         T7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZydoTw4mzwMScLgM9P3CZWDQFTuiETQUDxvT9OfBlMQ=;
        b=X4Wl1bvSeTEiWWhV1979yQpn2bzwSOf6tjolLE3Nlc9Dm3KMA9JrsbihcjXXZuda4Q
         mhQgyEFp06GoKhVpvlhZkdVg1T9YY2R8/AXl/agxeyIouzSnQEHEUCBoAPxs7w/lPmSI
         3HIsJ+uewmSAq9i3w9eijOs7qk/KMzZW/PG7+rEzi1sWbNKHe2NlHuvpgiN6qRjX/lOQ
         6VAr2l6pmQJ1DDxdalzdsjeSHTIon/v/ea2KMrfGiJsPiaed2QS27891NDsHtEVPpnWk
         DAInxl8m1Y9jPs0lsf4gkx5FZ6IIufhhxnQSPBXbHFaGEsSqoJOstm150lKWc5VAQmFF
         wYJg==
X-Gm-Message-State: AOAM530AR3PL17PeecaP8LpCZuHHSoi9vQmPN8u0u4+wffOfbsu37fmS
        GZ4Fv2/hvcFD/ysxnAPhyfJUZw==
X-Google-Smtp-Source: ABdhPJxBg6BT8rjPBDIiVtDEFoZGtHhGa256rmzmn9SueVEyXZnbXafDagCdRy/6vVh+o+rqLIgkmg==
X-Received: by 2002:a17:906:9c84:b0:6e0:7c75:6f01 with SMTP id fj4-20020a1709069c8400b006e07c756f01mr4100078ejc.103.1650633631882;
        Fri, 22 Apr 2022 06:20:31 -0700 (PDT)
Received: from [192.168.0.232] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id p17-20020a17090635d100b006efcc06218dsm771025ejb.18.2022.04.22.06.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 06:20:31 -0700 (PDT)
Message-ID: <c24e3a22-6ffa-f566-ee05-3aac030de8ff@linaro.org>
Date:   Fri, 22 Apr 2022 15:20:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 5/6] arm64: dts: qcom: stop using snps,dw-pcie falback
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>
Cc:     Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220422114841.1854138-1-dmitry.baryshkov@linaro.org>
 <20220422114841.1854138-6-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422114841.1854138-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/04/2022 13:48, Dmitry Baryshkov wrote:
> Qualcomm PCIe devices are not really compatible with the snps,dw-pcie.
> Unlike the generic IP core, they have special requirements regarding
> enabling clocks, toggling resets, using the PHY, etc.
> 
> This is not to mention that platform snps-dw-pcie driver expects to find
> two IRQs declared, while Qualcomm platforms use just one.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 6 +++---
>  arch/arm64/boot/dts/qcom/qcs404.dtsi  | 2 +-
>  arch/arm64/boot/dts/qcom/sdm845.dtsi  | 4 ++--
>  arch/arm64/boot/dts/qcom/sm8250.dtsi  | 6 +++---
>  4 files changed, 9 insertions(+), 9 deletions(-)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
