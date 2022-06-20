Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B03645523FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 20:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245539AbiFTSfy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 14:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243929AbiFTSfy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 14:35:54 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5511EED3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 11:35:53 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id g26so1411278ejb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 11:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DyuNPVuSNowzrm63j1zsZJOThbj5GObu7cLWAKANMVc=;
        b=pbdIFkiuQqNLXWDkXm0ZZlPgMwWln0kuPO3GqebuD6FpRbecakmMC9pmVmX9e7g/gr
         z7rxpqJjJePcy5F/YNjdX0w4ynSTIr61n7l+DWPCwX20nXn05QyvSI4lQZMjE0wazSPb
         EZ3+oHePxJcAmU2lNDmbGpO4zaQqKLwrobBerU4FQeUOWcEKVZMeXbk0eHXJi0xXQpds
         JBd23DA5ctC/COOo3SEX4YDX1Dupd7P8rehz+AuWb+/w1L+pigbtyqwDxD58dfEFWV9N
         C94bWle+erS3g6LzNvYpcpeVVEz/jNhBW/26pIOGT7xnqcGWrjvLUBGB5aa85vAgmZU2
         FXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DyuNPVuSNowzrm63j1zsZJOThbj5GObu7cLWAKANMVc=;
        b=RwNSEb/tN0nhnL5qHm5UwF+lZ+Baj79iW0bvqGaZJ1PH0LHFWbXl2xzsYvbbJULZMe
         uZTA2fp6LfKcnP19hZKyKjs4U2BMHBJyCL3CCpuoEjwTeEMHgzdc2684zlPU+3xfWYBR
         Tkh1y/6QXtwc2wA4kj0B8bWMYIMUqw5EcwdQEaJ6SH6KHQ8HWHTUHXQV2SQiGGoz3/e5
         2DdeF7VDRyVtVIJDulEdbnXHtiZHPD/E8pYSs3xhiezvnZ0/YxHm8a9OdhizjhksMLHl
         7RAgSs5TrbRo34tbDGaG4YF6PRFTUVvXX5iNwu6zuVW15hwp2/YGW3P9X+0RIXkYVkMR
         fvQA==
X-Gm-Message-State: AJIora/xoCrISMDXZSbfHSfvFZPxlALHmYAcPqN9q0v5Dbtb/6N7iBR3
        X0iYy0B8PZIwRp49kBZ/zcVjUw==
X-Google-Smtp-Source: AGRyM1vRDkQYO1pg9ZiRuIjA3okLtAlzs+qA/W4WQkKiGYLXITM9Otidvg2yY0cS5IPwrALT6s/X3g==
X-Received: by 2002:a17:906:221b:b0:708:a007:5a77 with SMTP id s27-20020a170906221b00b00708a0075a77mr22461190ejs.566.1655750151701;
        Mon, 20 Jun 2022 11:35:51 -0700 (PDT)
Received: from [192.168.0.211] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id e19-20020a170906315300b00704cf66d415sm6481779eje.13.2022.06.20.11.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 11:35:50 -0700 (PDT)
Message-ID: <c92b0b51-0e59-72ab-5306-ccec92b0cb94@linaro.org>
Date:   Mon, 20 Jun 2022 20:35:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] remoteproc: qcom: correct kerneldoc
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>
References: <20220519073349.7270-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220519073349.7270-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/05/2022 09:33, Krzysztof Kozlowski wrote:
> Correct kerneldoc warnings like:
> 
>   drivers/remoteproc/qcom_common.c:68:
>     warning: expecting prototype for struct minidump_subsystem_toc. Prototype was for struct minidump_subsystem instead
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> 

Although these warnings are not that important, they are still warnings
we want to fix to be able to compile with W=1.

Is there anyone willing to pick it up? Any other comments?


Best regards,
Krzysztof
