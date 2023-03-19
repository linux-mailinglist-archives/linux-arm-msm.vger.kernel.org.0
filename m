Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB0C56C01BB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Mar 2023 13:46:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbjCSMqm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Mar 2023 08:46:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbjCSMqk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Mar 2023 08:46:40 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D486712046
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 05:46:38 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id y4so37050161edo.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 05:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679229997;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aX/YeQGgHd0456a6H5fsx+RISKk9ZZ2G4hOQPozPTkI=;
        b=Te59JibYL/qoQDCIkmW2t8pe1bQlMbhzl6Xoms/H+ogiJy6JDjXn8YmCWxi8sf0nGB
         FOt/JXWFJmeNdfxNlqjYkj+sicr1aSLrGrEokEAybpf6wb1xHm7BZt+97xUrpNXf9M43
         hmTGrIHeXxQwlXzZyVu1P+v/0Qs2+KeQWh+6Dtr6Mu1UOuh155JuN1/pJi7X6RAyiZQ0
         eUSJmNn0iW3gWMu+xiEotQ3beFO3HhvZ+o+haPa6KmfWm3DfwTNkPs7d7XZ+ybGWh0Rm
         9bo40vtpk2mCXIpvs5Az5pYm/2nTfm4fcoZCBTlElM1imrG8ItbSeyOv+gzCdjh8UbV+
         y8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679229997;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aX/YeQGgHd0456a6H5fsx+RISKk9ZZ2G4hOQPozPTkI=;
        b=2i/IPkzSV1sjQiFwaTqZF/LjkWIuTd2hCuFtJhxjtV7A/zMqubJ4Ut7cQugRZIvZL6
         K/UBJumo19r7DqA7eUuIsm0jpRIy3PMteBsIcy4HVBQ6OB/jJnPQlaTmwiBEakUoje4U
         7fS0S+m8LW3O1fZIGvg0+Rv1ls7B9npr7emUHQehucIWNN9Z4z4RVf4k4MApgdHAlC48
         kyimC0/py616RfhgLB40O7C1XRlgMQ8TySE6znWo/7CyWvFjD0a1oby7xC1BDCRlFumF
         ODZPeAPDetuBVDMpDfqWR0y7/oaY27dBO24RCPwHvX/GJSFyMv3cWgMEM+S3x8e6SJx6
         Jg8g==
X-Gm-Message-State: AO0yUKXvyLm7XLSnA93Uu4pblFkTsYqA0KFFBLx3O7lnQHQ7AiNrkl1l
        wEEDOePud60XC8u70GxyLnLZvA==
X-Google-Smtp-Source: AK7set8ApphT38usrEVGYXhPZOu3dlpfU3bXpQy6stxSX7OCaWycVBm6wf6OkEStwf++Bb7ofY4DLg==
X-Received: by 2002:a17:906:e52:b0:930:8714:6739 with SMTP id q18-20020a1709060e5200b0093087146739mr6284227eji.30.1679229997278;
        Sun, 19 Mar 2023 05:46:37 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id s26-20020a170906169a00b009200601ea12sm3167403ejd.208.2023.03.19.05.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 05:46:36 -0700 (PDT)
Message-ID: <253d874f-3949-bc94-e97a-69ed8fc929f4@linaro.org>
Date:   Sun, 19 Mar 2023 13:46:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v8 01/14] dt-bindings: arm: msm: Update the maintainers
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
References: <20230314080443.64635-1-manivannan.sadhasivam@linaro.org>
 <20230314080443.64635-2-manivannan.sadhasivam@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230314080443.64635-2-manivannan.sadhasivam@linaro.org>
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

On 14/03/2023 09:04, Manivannan Sadhasivam wrote:
> Both Rishabh and Sai have left Qualcomm, and there is no evidence of them
> maintaining with a new identity. So their entry needs to be removed.
> 
> Listed Bjorn as the interim maintainer until someone volunteers to maintain
> this binding.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

