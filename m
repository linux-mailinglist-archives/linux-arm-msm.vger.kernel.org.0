Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6897071899B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 20:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbjEaSuK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 14:50:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjEaSuI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 14:50:08 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84C18126
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 11:50:07 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-96f99222e80so17045566b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 11:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685559006; x=1688151006;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MzXtOsQNua0oPm8ANON/o1SLuA+xD9SNd+elR8Mg0is=;
        b=RPTswnJVbl/iCLAr9QoCjD3E3mlJMeR1vsAMp41YrDXzGOekyttqFHn6gXMbzYP/ir
         Ufzu2HqzQ1rNLh5TUVVwOW0E714LZA8wZ9f0kQluvmp7znrULiXydEFtIusV36vG2+S3
         AlNPYYG7aNuBxME88LMaztSNJ1FHtJP+0vn3kblwCG+PQDCmUdguxM8VqgqVLqDPBnTQ
         5K76Nd8kCOWODc6wPbxnKtTECEL4r75rleSlMsnSP8HRKC4A2IW2vVk3hPNF2vd09nE+
         tnTfmQRxcPMw5j1zBPhH3UiRgHRqO6itFZ5ZqOl8wlSgWLG42ozZDqAzlnfOifCE693z
         w3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685559006; x=1688151006;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MzXtOsQNua0oPm8ANON/o1SLuA+xD9SNd+elR8Mg0is=;
        b=Wb8cpi0Yl8j8QU9g6txAriS41DX2GDhK+jA5qFCmLIzSe/ezyLscvPJAC2XWJLynt9
         CE6Tj58tLAw2+6FTUyZD9Zxhb/wPTDZjSq/qIoNYj4Y2e5qq2xRD378g7xoKQ/HO3N2c
         tJBoDO8eeoNRILzj5MaF9nUKfBZ9Vu/LTMBjrgLSCv1+n38fo4ib0LsbeP8b0ENrw6K7
         zPZsi0dGUZ5Q9h7jb/H5ejuX8o7EeEuOBs7dn2rWLKJRW8C2oOE+AanG+IEW/4NeeheI
         XrY5V2FkP0irMeKPJu4WD+OD0ChzBdgKORlKHzKpYSS2HDAW3aK4LdMXMrxPKi/LqJnm
         qGUw==
X-Gm-Message-State: AC+VfDydYmE7pnoHpxVgK4w5W8UNNUrAyvJYV05bn0ggTqviQUjlDuu5
        2VTIItBYiHDNSBB84mp5zu7Ivw==
X-Google-Smtp-Source: ACHHUZ6he2/E+Ufsv8kPm91xU9sE9H6pyYMKsIr43v0yxJ5M8hc64Qj9YUubRE4iX8cZBK55Myu9Cw==
X-Received: by 2002:a17:907:980c:b0:966:5fac:2e52 with SMTP id ji12-20020a170907980c00b009665fac2e52mr12497527ejc.9.1685559005990;
        Wed, 31 May 2023 11:50:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id y11-20020a1709060a8b00b00965bf86c00asm9560196ejf.143.2023.05.31.11.50.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 11:50:05 -0700 (PDT)
Message-ID: <2ec55d80-72b9-f1f1-faee-144c9815efb4@linaro.org>
Date:   Wed, 31 May 2023 20:50:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/4] dt-bindings: arm: qcom,ids: add SoC ID for IPQ5300
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230531135048.19164-1-quic_kathirav@quicinc.com>
 <20230531135048.19164-2-quic_kathirav@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230531135048.19164-2-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/05/2023 15:50, Kathiravan T wrote:
> Add the SoC ID for IPQ5300, which belong to the family of IPQ5332 SoC.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---
>  include/dt-bindings/arm/qcom,ids.h | 1 +


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

