Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26E216BA059
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 21:03:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbjCNUDW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 16:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbjCNUDV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 16:03:21 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C3F0231E1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 13:02:51 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id r11so15204973edd.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 13:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678824169;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ceqzvVuV5DaVylEFBwsWPJUb36nmhAcuIXlLKhTkgas=;
        b=Fkd4+X2M9RfX7mLOGCIsQP4KIBhLoH8Y76nAzu5zcPvWhJ3jEoeq/iCE+RFSsWQtk6
         SIXkjZ0Sf/+HewcbQu1uKMNz/es2MBw9HJmIyFqfYN2MyEa3+Prc9d1oF3zdFQs6SMmA
         Q8qJFKJBgXbPzd3OE0slZ8WZK+/uSSrlDjdio5fcoKuN4BwFwWAS+PkgTrEVFPqhOuj8
         uhtjBlgSyEknt6tTH/Crel/2QBcCsLFN4dBpNP9vGtgVxR0441DbYdy8CI/Ph2INjDzs
         C0xhwXgj5LTE5/yx9Z5YtHt+AycQTg+qie77LB+fttYfuLy8i4DXbcjIU1qt6DvyHueC
         I95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678824169;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ceqzvVuV5DaVylEFBwsWPJUb36nmhAcuIXlLKhTkgas=;
        b=WLCMRn4Ml+hj1fyKyzfZgKaN3HsNwcEgzet0vsSeTe+J+c79E/Y8i/BEISWmr9noDZ
         Sjjd5e4CpcKSA/92gpoYtSWtQsW5Niiv5d+/88Fj4sP4kWbO4MvEZEYEVNFkW8FE+xeq
         QkeV2syiCoN/AqbkjRLfeTdevmId0Cq3ixPCNu9j8aRXZCAycKRNVj7pt/vFGsNWGhnV
         aq3y8HhI1YWrN5oXJqDX2xxKxyl9+cQwOkogSEyRQre2A6r3ILkoB/k+sRAmIsqRGYb0
         MS6QgHuE9jmxU9FSg4loS3eN4v7HuynB/dYpTTGTGR5kV+tyPV17tqGXEc7IdMlMEpoU
         cNJg==
X-Gm-Message-State: AO0yUKVpaAeReYo8QpGUgGB0AVUKGXfCiJLGcYsixHQwLiTgS1wQFR2C
        dhZfCOQD7Rm2fCPDBtW1lCIxNg==
X-Google-Smtp-Source: AK7set/G8YIwte1YxHLMkA3tDk6D5i7xL/Vr8DoDWd16CHvdqbokPW1LOaHLisgcSy5j3Nynb4SGZA==
X-Received: by 2002:a05:6402:1383:b0:4fa:c9ea:b691 with SMTP id b3-20020a056402138300b004fac9eab691mr341010edv.6.1678824169409;
        Tue, 14 Mar 2023 13:02:49 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:642b:87c2:1efc:c8af? ([2a02:810d:15c0:828:642b:87c2:1efc:c8af])
        by smtp.gmail.com with ESMTPSA id v10-20020a50a44a000000b004fd204d180dsm1495551edb.64.2023.03.14.13.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 13:02:48 -0700 (PDT)
Message-ID: <812dba6c-3028-1c20-bc9d-636462346174@linaro.org>
Date:   Tue, 14 Mar 2023 21:02:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 01/13] dt-bindings: arm: msm: Update the maintainers
 for LLCC
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, james.morse@arm.com,
        mchehab@kernel.org, rric@kernel.org, linux-edac@vger.kernel.org,
        quic_ppareek@quicinc.com, luca.weiss@fairphone.com,
        ahalaney@redhat.com, steev@kali.org
References: <20230314053725.13623-1-manivannan.sadhasivam@linaro.org>
 <20230314053725.13623-2-manivannan.sadhasivam@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230314053725.13623-2-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/03/2023 06:37, Manivannan Sadhasivam wrote:
> Both Rishabh and Sai have left Qualcomm, and there is no evidence of them
> maintaining with a new identity. So their entry needs to be removed.
> 
> Listed Bjorn as the interim maintainer until someone volunteers to maintain
> this binding.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

