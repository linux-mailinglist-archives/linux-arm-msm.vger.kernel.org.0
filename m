Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4580D6C0137
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Mar 2023 12:59:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbjCSL7a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Mar 2023 07:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbjCSL73 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Mar 2023 07:59:29 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5D78113F3
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 04:59:26 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id fd5so36704602edb.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 04:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679227164;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JANaCxIBV3MOyuFRgagS9zmLRxuF4zSgC3mPu6zsJWM=;
        b=iZG6PkHJJrEuQrP+NRY5F3nU126sJQJ2ge3esmVks9yNUukTuI3Gatmgvh4zDzDONb
         Ss0oi0goZwvGGN0rRz+qeD6SFRR+Rg2037QSAuYuNGOH2ukw2IXyL8/KHSYIzzzDjoEd
         060IDL8IN9u1TTXaTSmY7X8IEguKv55AotzhIeF/Ux4FP2TuBFbAhESo62Hx+f4LKrx6
         ytFexBtBvTZHIuJql5+7My3kN56gtjQ4DGWe9VK6tQRD7DT02JZorNCFG0DCJf5ge93d
         9Yi6t874oyzbSToMDvr7unAV9RoB9gHOsFzTP2Wzz7YFPct/qgc6idmxw3Jl7mArkAkz
         rMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679227164;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JANaCxIBV3MOyuFRgagS9zmLRxuF4zSgC3mPu6zsJWM=;
        b=Ui/TyisZB1M8kpo8zef7RQNaqjZ7J76BJHRUSxVt00f/cc/nYByHqwE70EcF4q5EE8
         hnCgdsohQyCiknQ0Zta4pWAyz7J6rriJnHSbkd86EUH0TnJJoAcOJwC85EPiFX3CLZLg
         jLg85ScscjXajgaPAUJNShPvTMTzKQIvhzlX0eiUC7tEJtExWBVQeUv77YbxSrw/MJa1
         ZZqPYxVfUmXm4c0zjx1xy4If/zdlU+C8IEiQ2UOcIR/yj8tx9uIXAqriRYhChKA8SyCy
         XUO3HYkvS3DuVVMkDDMgxsmlYmgKtWZNHIY0Iprefcttb/92ttOTyWrROeOTfjBcbvHh
         f52A==
X-Gm-Message-State: AO0yUKU2WgK0U3xVP1pK6EyX/xZNs+rxfco7D908a9Hl+0iiULzzFygg
        TwN+JxjSZYPN3fS94YVEjfWFSg==
X-Google-Smtp-Source: AK7set+Qol/e+O1y3D/oVLE8G+Bm5bwNX8BRdeVhzbi4EaLVjm/puMiSgr8H+tzeORfv/x2mUS9ZiQ==
X-Received: by 2002:aa7:d744:0:b0:4fd:2b05:aa2 with SMTP id a4-20020aa7d744000000b004fd2b050aa2mr9628658eds.42.1679227164659;
        Sun, 19 Mar 2023 04:59:24 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id m23-20020a509317000000b004fb95f51f54sm3402849eda.12.2023.03.19.04.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 04:59:24 -0700 (PDT)
Message-ID: <79e48499-37ac-90c0-820e-5cceab453868@linaro.org>
Date:   Sun, 19 Mar 2023 12:59:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 11/18] dt-bindings: mfd: qcom,spmi-pmic: Add typec to
 SPMI device types
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-12-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230318121828.739424-12-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/03/2023 13:18, Bryan O'Donoghue wrote:> Add the PMIC Type-C port
driver to the list of devices.

Either drop driver everywhere or drop the patches. We do not add drivers
to the bindings.


Best regards,
Krzysztof

