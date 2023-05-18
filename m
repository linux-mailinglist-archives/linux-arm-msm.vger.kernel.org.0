Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 941E3707B29
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 09:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbjERHiX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 03:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbjERHiW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 03:38:22 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5961211F
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 00:38:20 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f380cd1019so2085221e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 00:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684395498; x=1686987498;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hSdiOiuqJAHUPhwp+X6FRpLlph26hY6u/p4vVDWTCR8=;
        b=PRgiMbTjte5lz91ZaJWBDJ7UrV1Smn/rY9qdXJueUm8so7ZxISQl86vxplMfARZU/X
         ZlHvQFHOiEnVvLBZsrIi16I/QTP+9cWYDj63eBI2eqaQuQsQlfXg4MO5TJHpwroiDNtn
         NfwMLWIi9PyXVMk6XeC4n8Rmaoo/O3igmCu/ZF886raR4vOGzdlrZXUUp0GQ1i7CoyxN
         S8un+IwiT49u4phVZZ7A/6izyQkKtiKZT405r2BIqbssdGBTUJKGY+Nr1MK/Beg3aGFK
         MIwDMMDJcp/UEuSOZ/cj/A1doRuqK0X+D+rfCMZp3tjoy7WHDZyvy6hifVEvHWQuK1h+
         yrrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684395498; x=1686987498;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hSdiOiuqJAHUPhwp+X6FRpLlph26hY6u/p4vVDWTCR8=;
        b=EUdrVC0r+1ArEAZSmfmWD5FYLzWaVuW/m8IRO8D0QbFIuaSLXACkY1/jiV+54BX64Z
         VmkC6ZstZTVuMfUncECR/hoCtlvZvrlLdfb6oGDFw6UUeCrHdac48Dp4th70i9gNkKzd
         i8qZ57yzo40eOKl+WKjoTm8iM+VsynYjPsV3DElzUpR2XxwzdN2+m7cOh6P/0TI1yPdQ
         FAOC7vPSH9rQGa11i28jAga7w+w06uugSYRLlahqC3wyXr10I3H9uB07qioC6zQ1S/3G
         dUHZ6G+qYUXiL2cMlZBRrAO35A2dzPK8ikfF2kCE20Z+nyKieLX05FqMtb9U7ZyOPXWq
         7P2A==
X-Gm-Message-State: AC+VfDxitnTFBu7rSZ8kSAypHruUTC6G0faD1E7dij2W7/cAVYpklrCK
        qIHiObIlDYFEIamHMhPvAqFL6Q==
X-Google-Smtp-Source: ACHHUZ7+Z8uEZegmwf+DhedLMsy7AfPt0iUSmaMEJ01Ttpr/+H1IA+SXNLeefuGi8XN3jXgJU76W3w==
X-Received: by 2002:a19:7407:0:b0:4ee:d8f3:1390 with SMTP id v7-20020a197407000000b004eed8f31390mr916303lfe.53.1684395498627;
        Thu, 18 May 2023 00:38:18 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a2b:c408:5834:f48e? ([2a02:810d:15c0:828:a2b:c408:5834:f48e])
        by smtp.gmail.com with ESMTPSA id b17-20020ac25e91000000b004f272be230bsm149250lfq.230.2023.05.18.00.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 00:38:18 -0700 (PDT)
Message-ID: <872d0dbc-18d8-800b-4647-d362a678086d@linaro.org>
Date:   Thu, 18 May 2023 09:38:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 2/6] dt-bindings: soc: qcom: eud: Add SM6115 / SM4250
 support
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        quic_schowdhu@quicinc.com, gregkh@linuxfoundation.org
References: <20230517211756.2483552-1-bhupesh.sharma@linaro.org>
 <20230517211756.2483552-3-bhupesh.sharma@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230517211756.2483552-3-bhupesh.sharma@linaro.org>
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

On 17/05/2023 23:17, Bhupesh Sharma wrote:
> Add dt-bindings for EUD found on Qualcomm SM6115 / SM4250 SoC.
> 
> On this SoC (and derivatives) the enable bit inside 'tcsr_check_reg'
> needs to be set first to 'enable' the eud module.
> 
> So, update the dt-bindings to accommodate the third register
> property (TCSR Base) required by the driver on these SoCs.
> 
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.

Also - no improvements.

Best regards,
Krzysztof

