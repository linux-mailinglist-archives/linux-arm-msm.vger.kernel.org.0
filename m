Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EF31663E6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 11:41:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231558AbjAJKle (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 05:41:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238018AbjAJKlT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 05:41:19 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC278CE17
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 02:41:18 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id z5so10190525wrt.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 02:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pmMrDaRkKSnc1qhodDZOnxZ9tfc0loduFNccFsKTnYg=;
        b=Su1ZLTvGNvl9r12ssy25oZ59i8HIQ/nXC82zXIZtUj5BdcP2BmHJGZvWxonW6uzph1
         QmeYBo2eVTMv1ljxUuu7O2ZApvreSMVpZ1kpFhmd2qD/rH3EumihmJLtJ6X3feZqcD4h
         jW72O8vOudqRmZIoblg5745RteTgrMjga5W0OR6OWsEFbAUwqSwDxeyysMoEGEwHCYqG
         glHduXbKnPl2orYK4qNVWla7o5qhE6coc1gGvA8Pq1v6fsRmlMOKKWQ+j41mV9OzoDUz
         JiguqoJrCWpzr7rMVOLzhfTVY07SYmGmVl3HBvXnQQ+WbRbAnrGAkhLMomp1FSFduFEW
         5T2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pmMrDaRkKSnc1qhodDZOnxZ9tfc0loduFNccFsKTnYg=;
        b=qIvuWo1/+GKZ6DYgtIXF0Yxz6OOQ/Pj/g0W7BJe4D6TSMcNOEHfnLnMFdudHO26WES
         fLcnIexn0YDOKV5pm/2kDQVMfLONuPfO++FZewJW9uSjLexmSB5oo/m2BvsRivtiNImK
         vJ2xC9A9R8ub93jGBOP8S6ltxtQZaqbCHGeBKAQYwgZwVSu3pZrqdG++6w9Zj8UGmTl9
         Z5g0d3HL7MafKPNsDP0HNMYZeibYPG9mWlSCHe5VgWZHMEAwqVrNMObplgu3utD+Pwcy
         uLAa/agtMMXc4eiL9WwlzJx+AJEqalkVM/PpW9+8PXc5kjrqAwIT7UXyshu6tz8KZUDx
         IVcQ==
X-Gm-Message-State: AFqh2krDIRG3an9zx5Ko9ve6zZ8ggLt0Rjv3L3wEjIP4l8TO/wP2AlKZ
        lzuxSukKfOCQOJt9fH/hWx5+SA==
X-Google-Smtp-Source: AMrXdXun7Qhne8LN25fn0zhY7FXb8AtvrkTpOTnpXr+zlJTPyur3hYr37jfZFi/8pJEcK9WkHsT/Jw==
X-Received: by 2002:a05:6000:81:b0:2bc:1b58:8264 with SMTP id m1-20020a056000008100b002bc1b588264mr4869488wrx.49.1673347277313;
        Tue, 10 Jan 2023 02:41:17 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j17-20020adff011000000b002a64e575b4esm11017449wro.47.2023.01.10.02.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 02:41:16 -0800 (PST)
Message-ID: <a690de32-522f-c777-241b-907bda8a14ba@linaro.org>
Date:   Tue, 10 Jan 2023 11:41:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 01/10] dt-bindings: qcom,*-geni: move
 #{address,size}-cells on i2c/spi nodes
Content-Language: en-US
To:     Brian Masney <bmasney@redhat.com>, andersson@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     quic_shazhuss@quicinc.com, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, johan+linaro@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ahalaney@redhat.com,
        echanude@redhat.co
References: <20230103182229.37169-1-bmasney@redhat.com>
 <20230103182229.37169-2-bmasney@redhat.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230103182229.37169-2-bmasney@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/01/2023 19:22, Brian Masney wrote:
> Move the #address-cells and #size-cells properties on the existing
> i2c/spi example nodes below the reg property so that all of the
> address-related properties are grouped together.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Link: https://lore.kernel.org/lkml/Y6Wnh+tXPhF6aC1b@hovoldconsulting.com/

We do not have conclusion where these should be, so don't make any changes.

https://github.com/konradybcio-work/dt_review

Best regards,
Krzysztof

