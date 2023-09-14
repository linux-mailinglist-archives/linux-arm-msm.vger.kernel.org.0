Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9702779FB8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Sep 2023 08:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234907AbjINGEB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Sep 2023 02:04:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230259AbjINGEB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Sep 2023 02:04:01 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DC11F3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 23:03:57 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-401ec23be82so5952615e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 23:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694671435; x=1695276235; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wJrl1gf/KgIL72MKV3GsbSVepIuZ30o12UlDdGV1sJI=;
        b=k14rQHBIGnztU1L5LBd4Fgzd2zLSk3gWWSK/MAsqxSRlvE2pt/UoL/8dkaiLhdlnN7
         UfekMtc42QaMae6PqJss0L2LFlii60ZhZg2Dev3VzIVtsMZnRilNZnwM7Q5WP35ugn+0
         kF1r57EwulUuvbVyoKk71NUR2hSpXLtm81r2VCIN9zLpUambgpFetoGyvAFUZW5mudiI
         YQjCWdNqkunJRZcMa/erKlzbzJAx5m/Ma+6M9cYQUz7AHe7egVlp75mFq3l6Ipytjfgo
         uwGtSExKTSkAQFOl7b+ahcfLXRMvtELCZVtNylNB03SKF+2BuhVxybHWRU0eSAEJlCaQ
         WrcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694671435; x=1695276235;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wJrl1gf/KgIL72MKV3GsbSVepIuZ30o12UlDdGV1sJI=;
        b=AdszLOJkJXyGjsHtItWVuhl7oAHks8ZtL8kpxf7q2k6A+nM0SD8+9qtk0PVR9W3btL
         RiCNy9nEnWFgr+4XEy2IJMxX3Sk2CKANg9bqbWjtDVEO0SODbEAK2BcCDmQQgRxOSS7W
         nn+zAS0Dgv4KH3+uyUS3GLBGrdEtFy66GOBcFWo/ua5SrC8uWCyRJUkFouChCWkTfcMX
         cM56AjW+uvTxHN185H0RqG6t5vu7hYSCFPE+zXMLKjz5LTRRYoT7KhsGduLtpkicwh3w
         kW+o2IOftMwoy8VTlLD46SaCMEyZ8H5Em6rDSYMHsypMqMai90kijO6O/UjZLitys9Zw
         vtUA==
X-Gm-Message-State: AOJu0Yw0ur0q93Lj8Us8tLM6fFDhP4QtmV2m7C2sPTAAYIv9pyP8lode
        RNJZs7PqOtKRlCkCzTgOKrOIMQ==
X-Google-Smtp-Source: AGHT+IHcGwQRogpWWtp7Paz0eXwAfZRpttx5AEZ+wm18CWR/bLpMdyGvknlYqkTXte6C48a1sbwfVw==
X-Received: by 2002:a05:600c:3657:b0:3fe:1871:1826 with SMTP id y23-20020a05600c365700b003fe18711826mr3809097wmq.27.1694671435549;
        Wed, 13 Sep 2023 23:03:55 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003feee8d8011sm3849122wmj.41.2023.09.13.23.03.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 23:03:55 -0700 (PDT)
Message-ID: <73a52175-73bd-1b1b-9592-4d8bd0ab2874@linaro.org>
Date:   Thu, 14 Sep 2023 08:03:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] dt-bindings: firmware: document Qualcomm SM7150 SCM
Content-Language: en-US
To:     Danila Tikhonov <danila@jiaxyga.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        robimarko@gmail.com, quic_gurus@quicinc.com
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230913194418.30272-1-danila@jiaxyga.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230913194418.30272-1-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/09/2023 21:44, Danila Tikhonov wrote:
> Document the compatible for Qualcomm SM7150 SCM.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> index 4233ea839bfc..0c073335f8ff 100644
> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> @@ -56,6 +56,7 @@ properties:
>            - qcom,scm-sm6125
>            - qcom,scm-sm6350
>            - qcom,scm-sm6375
> +          - qcom,scm-sm7150

Where is the user of this binding? Please provide a link in any future
submission without obvious user.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

