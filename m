Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9C57695BE7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 09:04:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231866AbjBNIEa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 03:04:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231756AbjBNIEI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 03:04:08 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8935B23304
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 00:03:43 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id f47-20020a05600c492f00b003dc584a7b7eso13024069wmp.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 00:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iGNWcmAM88M6KREf6/IAbDZQfYxLySeTC5zMfiqh/ws=;
        b=z8x2+hjMMR9HKtn7j7HYopRZn1jx6Ra8gZkekcLWCk6kO8AoIUCOeUKJjmvSiqdJgN
         ujFZRkhDNiiiessYpn5pWqRcsB/sQkVDFSMozmscs/jHpHkUZlnBSRb2YmTRxkc+1OGG
         Z7gLqbqi3kjhXbcLY9aJrmZvWFZ5t1/dzCr8vomreAJxXj/DHhbmQIq0iHxZoLr/fIPk
         cXdP1sbk0WuGwomGKddvF3F9j+4IV4AJNBTCoPYerewzjO7B0aulgmMuR65YxiwJMuBZ
         OKQDvaukIedAX0MhoVpJaEc/H9V5Ysjilnq7JZWy/jkQve4kW3DkgQ0COYj8LNEKgC6e
         aiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iGNWcmAM88M6KREf6/IAbDZQfYxLySeTC5zMfiqh/ws=;
        b=fUZRxT8c5Y08TqVq5osf/aCugV8vyK+YYi4G7Eyeul/RlU7oRG6msC/C+uTngxyxED
         hOzDsdvxgZ7WO2Nvs0R7gh2XrMveDt9z3RuKzCkLlNg9m6gX5s+/YHMSLBb9dsnyrFYk
         GMLxMp0H+E+vq68pJ/mgTvEQ0jUkuPgvOQmgK6Gj6K0jnHlmo/O65wkQavCRrR4XJFFj
         sdB1Q2hOJkrt0IUc6OmBxsjbfup/WHOrwiQRC9GB6429w/vT4vbWxFhfpaCKEQR5VAw0
         xd2il/DxeBcAsup2YY9Iz+ONtL4LtuSwdWwODvUfAgebESWv5BPm33oNfvNJi20adA7W
         xD8Q==
X-Gm-Message-State: AO0yUKW+UNFtObwRjEbyP1D6wUd4vNg/lGAEabiMiAR8iOTj+ug8YSDb
        r612nxVsR32TECLnhCVqoAQC7Q==
X-Google-Smtp-Source: AK7set8yPbvAjOPrn+mvoE+ucQsjRUHjnp1s/S0Hemf6uKWv+Ehiz+nfD1o/HyXbjbl76kzOEsPdog==
X-Received: by 2002:a05:600c:1616:b0:3dc:53a2:2690 with SMTP id m22-20020a05600c161600b003dc53a22690mr1225644wmn.7.1676361822167;
        Tue, 14 Feb 2023 00:03:42 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p21-20020a05600c359500b003db06224953sm17449455wmq.41.2023.02.14.00.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 00:03:41 -0800 (PST)
Message-ID: <ccf12f9e-e95b-c3c2-508c-bb7b9b3c1581@linaro.org>
Date:   Tue, 14 Feb 2023 09:03:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/4] dt-bindings: remoteproc: qcom,sm6375-pas: Document
 remoteprocs
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230109135647.339224-1-konrad.dybcio@linaro.org>
 <20230109135647.339224-2-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230109135647.339224-2-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/01/2023 14:56, Konrad Dybcio wrote:
> SM6375 hosts an ADSP, CDSP and modem as remote processors. Create
> related bindings.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

