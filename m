Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B72596F2EFD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 09:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbjEAHIz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 03:08:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbjEAHIy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 03:08:54 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 373961B7
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 00:08:52 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-94ef0a8546fso356999366b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 00:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682924930; x=1685516930;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hTCEEp5r9lz82B746XWoBnF+wzEumW3jKh7+5tusF+U=;
        b=dVvycKBDbPmu8lYpLc296BaCBQtwS3QGWGE9t6/ZRGNfvWl4QBGgkXmVHUbeI6G5vP
         XQWX9KydbYcwrO+neZMHRcV7LIyQsdhDJyix/cGrFP5ps39GguAJV/wxfZmiwCQ2pM9x
         qrXK7GUY0mwBtApZ4Cmh2QUowJjD7NtorU0tGg+T50cxLX3Gdti3pfNQP47FvNZl4Li6
         Zkt1Xnl3HVxlMGk0CF/kP2DpFOzlh7FqYZQ7UTpYXiKm/wA9JSBdj3FPjqVcYLFxHO90
         oNx3L17vDv6+r9m6+g/p8xWEH+8B3xdwROW7iCXhWFMeF415XtpdTus99Pv2IqRBq8FR
         VM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682924930; x=1685516930;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hTCEEp5r9lz82B746XWoBnF+wzEumW3jKh7+5tusF+U=;
        b=EXx72srq3SYNlcfSInkly5J46VJfKhQpkLWyNuUwwxUKgLQc3CPz1qgUyi0+9XaHrl
         GXkLzWphxq5DuGcLvqsxBR9pxRCIjbX4GPpNGH600uSz7h5Rvy3QPDYqw3LlEzToT0wy
         OV3/uu24GAHdSsAXKOrDMN3zqppaoDiHwfY7qFMeE6/dx+NFlUJ89O0LU55840Nonu3U
         Ldi8LVqQ8bvVaPMvSwKKrh5PNfjdK3aFGwHn/2nxbnI3lgIRLGvax2OuyHMzOGILRQ35
         t+ij8to57TPWzMJf1J+xMFqvHXm3aT4pbDmdsp3IPzC0S4P7Bz6M1RwAzBEje1PtqGep
         x4OA==
X-Gm-Message-State: AC+VfDw46njQruH5fhI9LOkBeROE2mjRMG1r14egJBfXY0ZuGkawQt/t
        UP2mAfXuyVjQcqwaMBGzhPFR9g==
X-Google-Smtp-Source: ACHHUZ7MBE3Il16K08bHkeFocwOR5tln4L95ahu7REn8FNWvl+repSpoEj+YVI+b8ZmMMzKSI/T/YQ==
X-Received: by 2002:a17:907:36c4:b0:94a:93f4:711d with SMTP id bj4-20020a17090736c400b0094a93f4711dmr11148477ejc.4.1682924930597;
        Mon, 01 May 2023 00:08:50 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:637a:fd0c:58fd:9f00? ([2a02:810d:15c0:828:637a:fd0c:58fd:9f00])
        by smtp.gmail.com with ESMTPSA id w27-20020a17090633db00b0094ed0370f8fsm14619241eja.147.2023.05.01.00.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 00:08:50 -0700 (PDT)
Message-ID: <16443d11-7948-d224-cfef-b6c1b5c3d60d@linaro.org>
Date:   Mon, 1 May 2023 09:08:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/4] dt-bindings: thermal: tsens: Add ipq9574 compatible
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, amitk@kernel.org,
        thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Praveenkumar I <quic_ipkumar@quicinc.com>
References: <cover.1682682753.git.quic_varada@quicinc.com>
 <3c6f7510d175ba5a3c81730b010f6c421b2fbf2d.1682682753.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3c6f7510d175ba5a3c81730b010f6c421b2fbf2d.1682682753.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/04/2023 16:52, Varadarajan Narayanan wrote:
> From: Praveenkumar I <quic_ipkumar@quicinc.com>
> 
> Qualcomm IPQ9574 has tsens v2.3.1 block, which is similar to IPQ8074 tsens.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index d1ec963..8e2208c 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -66,6 +66,7 @@ properties:
>        - description: v2 of TSENS with combined interrupt
>          enum:
>            - qcom,ipq8074-tsens
> +          - qcom,ipq9574-tsens

Your drive change indicates they are compatible, so make them
compatible. 9574 followed by 8074.

Best regards,
Krzysztof

