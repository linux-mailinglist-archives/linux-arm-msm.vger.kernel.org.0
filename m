Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9C67511E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jul 2023 22:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231359AbjGLUkD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 16:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjGLUkC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 16:40:02 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4CFF1FF5
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 13:39:59 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99384a80af7so6037766b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 13:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689194398; x=1691786398;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qz4ToCmXdGy6EFf4pje8ZW0I5OMeUMjD61j/N7GvqZg=;
        b=CaEDs0aCkHLRHqomI8ZWgQ9D5tueGB2f5wx/7D+Xq0qUtpCvVYOzHEdx2KfWE+4A/O
         wyG1Y/5j5kspW+HePPI137Qrrbo4UIGRJRjjj9kMXS/SiP7mGMGnNeRzHp6RZGxDaLwT
         Wj4yaDvktBkjVDu40fVojjC/OM+Uyw76jji/E9SPJ9FUB8tfJXAwzZ1UIqmZIKlvhhzG
         Y37ApdXOasBxfbIKB6eRLud1X86IomA2P5LQSOPTFAC2NV8sLEpsylMraMbYKtbjN6Vo
         pV5wDpVf2r/YGpAiu+4RKLFU2q+f51G3a0mreKNoHisrr+tHJs1dp74jOQ2a2TWpUywk
         k9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689194398; x=1691786398;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qz4ToCmXdGy6EFf4pje8ZW0I5OMeUMjD61j/N7GvqZg=;
        b=TqHAaN3g85eiVorgjo9POC3cHwTpyrYNtpzGZLM/flQdYRJPRes+0NnEpqDUMYspfl
         MSrL0V0TQTiDjka9jUhX7wQGztR0kr6l5LzBvkJMpTljrYmKTmKP4tGGX2Hh6EN2zUVD
         bEkPU/pE5WaEcK2o6hPLzB0+zGg/BGyEns9iRGwPpRhZisvXynXXu6Om9AL0blEDmRW5
         H+aPIwUCOcJvjZVgnL1joitlByvBwiJGROcyf2JlUXlwjOfwmQK1NSIoHbXMLzgPtl2X
         zFhy9Mdagl+KlSSxQkR8bW8GcwHbJkwJR+P4UfF+L2uR/M1TpD2oKGtbPg8A6fqM5u1N
         Yzeg==
X-Gm-Message-State: ABy/qLbGHjumDS++Dl+ykVtTI9IZ2iI78OzWPAmfvlBYSA+DrA8zz9JM
        HZrH+gLsd2RHLhxu+cYuxQ1yNQ==
X-Google-Smtp-Source: APBJJlGU9//m8M1Ae9Q5dga1tL9ZcYRoNFsxLts17JPBzFocKxi+fKx1E4/gw1Z7SqsJrzNODCffnA==
X-Received: by 2002:a17:906:194:b0:993:e752:1a71 with SMTP id 20-20020a170906019400b00993e7521a71mr14142804ejb.9.1689194398389;
        Wed, 12 Jul 2023 13:39:58 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id gg21-20020a170906e29500b0099207b3bc49sm2990057ejb.30.2023.07.12.13.39.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 13:39:57 -0700 (PDT)
Message-ID: <3b733848-2745-e6ef-f517-039712bbe7af@linaro.org>
Date:   Wed, 12 Jul 2023 22:39:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 01/53] dt-bindings: interconnect: qcom,icc: Introduce
 fixed BCM voter indices
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230708-topic-rpmh_icc_rsc-v1-0-b223bd2ac8dd@linaro.org>
 <20230708-topic-rpmh_icc_rsc-v1-1-b223bd2ac8dd@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230708-topic-rpmh_icc_rsc-v1-1-b223bd2ac8dd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/07/2023 14:18, Konrad Dybcio wrote:
> It makes zero (or less) sense to consume BCM voters per interconnect
> provider. They are shared throughout the entire system and it's enough
> to keep a single reference to each of them.
> 
> Storing them in a shared array at fixed indices will let us improve both
> the representation of the RPMh architecture (every RSC can hold a resource
> vote on any bus, they're not limited in that regard) and save as much as
> kilobytes worth of RAM.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  include/dt-bindings/interconnect/qcom,icc.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/dt-bindings/interconnect/qcom,icc.h b/include/dt-bindings/interconnect/qcom,icc.h
> index cd34f36daaaa..9c13ef8a044e 100644
> --- a/include/dt-bindings/interconnect/qcom,icc.h
> +++ b/include/dt-bindings/interconnect/qcom,icc.h
> @@ -23,4 +23,12 @@
>  #define QCOM_ICC_TAG_ALWAYS		(QCOM_ICC_TAG_AMC | QCOM_ICC_TAG_WAKE |\
>  					 QCOM_ICC_TAG_SLEEP)
>  
> +#define ICC_BCM_VOTER_APPS		0
> +#define ICC_BCM_VOTER_DISP		1
> +#define ICC_BCM_VOTER_CAM0		2
> +#define ICC_BCM_VOTER_CAM1		3
> +#define ICC_BCM_VOTER_CAM2		4
> +
> +#define ICC_BCM_VOTER_MAX		64

I proposed to skip the max. If you actually use it, you won't be able to
change it ever.


Best regards,
Krzysztof

