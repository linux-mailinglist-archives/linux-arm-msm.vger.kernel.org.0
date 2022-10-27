Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA63460F9AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 15:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236118AbiJ0NvC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 09:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235865AbiJ0NvB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 09:51:01 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09980158D72
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 06:51:00 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id f8so907122qkg.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 06:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PYl2yGA33sxqPBp36UKuhRgJm4+UsQlZQY/PlMOZfAs=;
        b=VsSyf+7ggXF+d56cf9MVg7Kej8FyImK3jRTbVkF5ghZVXLLsZJzgg7fDCJ7GnPMBYg
         mwnOtN3H4+wXahhrv5qRo8yjFzcaRB6yE/0wWRp/k2ryv9U3dS3XziILbFdQZaGgUwxF
         mTR7WBGRSjVy6ToTLkl6C/vVk8DI9DbnbmJSzwxcfIaI73LOQQBOK+zxhfpViUw+941g
         9tLKdjIWs2DiZMUIvXbnWOR+i+Rt8XDrI7OQVg37eKEMFNOcRZMq2Gu6Z9K1G++bnjJ6
         9xnqCmPWXo5lMr04gCh/G0/q2YwN0q/FsFfR75rjM61cn8TQAKmSNsQ/k3KSlT2CvtBY
         io/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PYl2yGA33sxqPBp36UKuhRgJm4+UsQlZQY/PlMOZfAs=;
        b=Bk1g6B7BXt+mv9v3E9kXVZZ+15dhBcip+mUyMnKCFiENrKJP2vLPksKJKbKyZQd096
         R4s5yAQAu17vNgcdYUy6j8tJxY++8HGVthKZ7HNHbfi85R4OEJ0TO0Q+/V1PrpV27UrC
         /Ti/Q+i5hMo2Vcki66RGsCbfuX0ELgTyIyFJAbqg/ehSFU9Vr03aPhgfAjrnNzUo2ryt
         FuMwwkhorAvIieFIlKSe/UoEaKu8pDmy2PBi9s29yOn3yXwzWNNgOzeGdkuJvTFzdsTd
         chdAbdtu3Di+7px3edR/6VTsLsLN8Jgh2OMHLojAlHy5yurIlPJyG6blgsYNvunvNpq5
         /NQA==
X-Gm-Message-State: ACrzQf3KqmjqGOYLGccoV0QBWsVBi/lEMailZa7lO67V6K+GyyOFUGs6
        he2oGPjSYdkUDvjfl03SSceTaw==
X-Google-Smtp-Source: AMsMyM57q0PhQ/FemEuSVx7TXUHEOjywCo4JB6pcsPk8GIs9IHvQQ6JKK0QTIEqb7oU5nMU2ABmg3Q==
X-Received: by 2002:a05:620a:4005:b0:6ee:d836:9ed4 with SMTP id h5-20020a05620a400500b006eed8369ed4mr34604633qko.352.1666878659218;
        Thu, 27 Oct 2022 06:50:59 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id u10-20020a05620a430a00b006eeb51bb33dsm1001445qko.78.2022.10.27.06.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 06:50:58 -0700 (PDT)
Message-ID: <3950f020-9e5d-3736-8764-548e3a57152b@linaro.org>
Date:   Thu, 27 Oct 2022 09:50:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 04/11] arm64: dts: qcom: sc8280xp-pmics: Add support for
 PMK8280 RESIN input
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221027063006.9056-1-manivannan.sadhasivam@linaro.org>
 <20221027063006.9056-5-manivannan.sadhasivam@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221027063006.9056-5-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8
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

On 27/10/2022 02:29, Manivannan Sadhasivam wrote:
> The RESIN input can be used to reset the PMK8280 PMIC. Enabling the
> RESIN block allows the PMK8280 to detect reset input via RESIN_N pin.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

