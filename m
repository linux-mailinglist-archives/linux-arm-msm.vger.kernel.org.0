Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD5F274825E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jul 2023 12:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231989AbjGEKn5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jul 2023 06:43:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231956AbjGEKnw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jul 2023 06:43:52 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 771D510E2
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jul 2023 03:43:51 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b702319893so2243851fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jul 2023 03:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688553830; x=1691145830;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vL0NwTFAhilMJKqfchX6qXfppuTsH4EmOpXXAXwvBs4=;
        b=Dkjm5JOnvrchnDPsARy2Rgiirqr99QygOSmQetupTzwu0qobEn1c6YdrFqwnROoq/Q
         6seZ2PaiX1S8fq8jFbrgl4hiZ9fA3JtyAldT45j7fZ+hCQVghdqYGJp/w58KryjNrj9r
         ppd4RDYlQacn50Mwxfma/YS2iSf48nJBijuRKzsUX7OkkLo4k8pejGzdb9cfP+Sgo33L
         jqa5NcUyAUM2MHPjhgTfsQljQM2MmT4bJihfKzzJ+qfii6fJgJ7TAqBxFBly/bIHZV4t
         74U914m59DCfKoZc3mIZkkVXz97YDHHNRAJDIZMzjonob76vkvXGHy/9P4dNQaHquU9H
         /ASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688553830; x=1691145830;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vL0NwTFAhilMJKqfchX6qXfppuTsH4EmOpXXAXwvBs4=;
        b=ieA7EIGuVJqsiF5oc1SVJCzkBmtTHFj0rudP9Z8mYP7qXlzXxP5C/RElokErdRZ7AV
         9fFt457YqAMLWqO6Kd7dqTw25Of9LYM7vFwfuwfCzibUHo4Sp5fYsMyLrU1ssP3j5hwr
         6XDGBSifwxSgsd966eYEk8tRQV5wtDmUjjWTX+CPjuMMxZf8Z/v4Ez9lFk86DkV81d2a
         xJHnul1nzbVHNg5UhxxLTRfH/NmkhLoU+SGNmqaz3kMwUxGdsUPilh8LbVFrx2lNwaho
         Jqme6kDp9glJe0Cs+9QK8jVtM6zvQX7lqrVYeIg5adn9B9Y0iYTUWUgg/crnzWsTlYd8
         cySw==
X-Gm-Message-State: ABy/qLbVX/gDnOEMHvlR8/C+tjGsflMISkMkLVOHbhAwP0nAYChHc/oX
        mS9NYsPjJsca+frD/+2uec++OA==
X-Google-Smtp-Source: APBJJlGE0Is80TTlovwbwQu++0yua7yxHiuftSTkLtJXeOLzAyzLs1tq6ZO2gzeJ/+L6uly0fPy9bw==
X-Received: by 2002:a05:651c:238:b0:2b6:99a3:c256 with SMTP id z24-20020a05651c023800b002b699a3c256mr10325718ljn.38.1688553829728;
        Wed, 05 Jul 2023 03:43:49 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id y23-20020a2e3217000000b002b6d507dc09sm3249797ljy.137.2023.07.05.03.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 03:43:49 -0700 (PDT)
Message-ID: <8a6e9ffd-f784-5ce9-2ea8-9c38762627c7@linaro.org>
Date:   Wed, 5 Jul 2023 12:43:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: qdu1000-idp: Add reserved gpio
 list
Content-Language: en-US
To:     Komal Bajaj <quic_kbajaj@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230705091730.32087-1-quic_kbajaj@quicinc.com>
 <20230705091730.32087-2-quic_kbajaj@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230705091730.32087-2-quic_kbajaj@quicinc.com>
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

On 5.07.2023 11:17, Komal Bajaj wrote:
> Add reserve gpios for QDU1000 IDP platform. These gpios are
> needed for modem subsystem.
> 
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/qdu1000-idp.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
> index 1d22f87fd238..0496e87ddfd5 100644
> --- a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
> @@ -471,6 +471,10 @@ &sdhc {
>  	status = "okay";
>  };
> 
> +&tlmm {
> +	gpio-reserved-ranges = <28 2>;
> +};
> +
>  &uart7 {
>  	status = "okay";
>  };
> --
> 2.40.1
> 
