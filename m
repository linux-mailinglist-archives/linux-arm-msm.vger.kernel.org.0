Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FBFF6F86A0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 May 2023 18:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232698AbjEEQY5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 May 2023 12:24:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232778AbjEEQYz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 May 2023 12:24:55 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88FA718153
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 May 2023 09:24:53 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9659e9bbff5so349320866b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 May 2023 09:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683303893; x=1685895893;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=24rov95Pw/D/6yd2vrKv3pCCwoezwm9EvOcBB2jFiWI=;
        b=Y8bPuB6jeBeeJ0ZIc6dQeJojVRVIMY3urzuCtW1P8SwCbZ/BNYWjCpuo8vvngV1sWP
         87UA567X3w8JGdtb2MGJYpTvCXqII6Eb0nseGy7z5Mi3WEjVGMP7VmNNhH/EAJK3Fuk0
         vz5EZ1ycPRC148kT4SdHZ634sGyxb3HTvG26YIoPyUSUJeFRKpq9lyjv6jjSwAqObP9U
         e1aavA1wD3D46RfgY3Uy7sDcOt4uXeNAePGcEBSZbTKIx9eLVXHDjtQYCrKGwd5buMVO
         ip9g6NhbSoXOW8RK+zb4w8HqVJ94Qa1hUFWomSx5T3hzRszjVl1vx2hrnI3mcdOm0pj5
         gXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683303893; x=1685895893;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=24rov95Pw/D/6yd2vrKv3pCCwoezwm9EvOcBB2jFiWI=;
        b=cPUuRZpQONgWRnxqh6V2/u0x2YnC7S4liEBhSKp+9zbuNQ5cMs51QP3LLama1REzkI
         7jy/CHu3A3CZYZtpTXkndrqhetIg7Cd5YNCRdv3/Fo2kM6t/VUj1VDjpkhVnonurQW5v
         i9jlL+ODLC5G9Srgt1MRmzbkl5IymqnP5t1V49PCMwNhBl1xaISKmQyEiUM5m9KAOher
         oUsqjx3iwGufQLw1qagyfTfDh8GrOkkcUI6G6aYc2dc5LRm82N0rOPfQR9V9a9KKfVQz
         MKRgL6SHdbNhCG2UuDcxClSgkD1ldsyCY/fzyb+9K/ccqw3BC/J6SVprNP0JzX0++Gkn
         DHlQ==
X-Gm-Message-State: AC+VfDxZu6WvehEKPHsFB40NWYvwRDdGgjWE9BeE+6Yd0QcJiMkp+gSQ
        wOjJvKvhTLHbneLWx3XC06A8OQ==
X-Google-Smtp-Source: ACHHUZ7zWKBsjditqoR/jFKEfhg/MLDNa158jOKYXrrHb0DqUjCOFB2dSVmIiXybd/Aucda7GXJdkA==
X-Received: by 2002:a17:907:9405:b0:93b:5f2:36c with SMTP id dk5-20020a170907940500b0093b05f2036cmr1902294ejc.61.1683303893026;
        Fri, 05 May 2023 09:24:53 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:52e:24ce:bbc1:127d? ([2a02:810d:15c0:828:52e:24ce:bbc1:127d])
        by smtp.gmail.com with ESMTPSA id qn10-20020a170907210a00b0094f432f2429sm1130455ejb.109.2023.05.05.09.24.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 09:24:52 -0700 (PDT)
Message-ID: <1374d7ea-94a3-60b0-f9db-7528aae22a34@linaro.org>
Date:   Fri, 5 May 2023 18:24:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v4 2/5] dt-bindings: soc: qcom: eud: Add SM6115 / SM4250
 support
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20230505064039.1630025-1-bhupesh.sharma@linaro.org>
 <20230505064039.1630025-3-bhupesh.sharma@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230505064039.1630025-3-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/05/2023 08:40, Bhupesh Sharma wrote:
> Add dt-bindings for EUD found on Qualcomm SM6115 / SM4250 SoC.
> 
> On this SoC (and derivatives) the enable bit inside 'tcsr_check_reg'
> needs to be set first to 'enable' the eud module.
> 
> So, update the dt-bindings to accommodate the third register
> property (TCSR Base) required by the driver on these SoCs.
> 
> Also for these SoCs, introduce a new bool property
> 'qcom,secure-mode-enable', which indicates that the mode manager
> needs to be accessed only via the secure world.

Cannot it be implied by compatible?

Best regards,
Krzysztof

