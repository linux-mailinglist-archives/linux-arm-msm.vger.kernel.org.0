Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5486B5B50D6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Sep 2022 21:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbiIKTTk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 15:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbiIKTTj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 15:19:39 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13A6E2DF8
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 12:19:37 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id bt10so11581495lfb.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 12:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=apzG3xku8I3ZdvmAyq4e50tGVV+Ky/wz//4vHO1DJgc=;
        b=uHlWNh9ubEWHL2dHypDQKfqR1vRoY/u3L3VnE52MFf9bJn5LGd5ehhYXJt4m/PlbkA
         CtfIVcb3pu57WkiF8DjEesF+PUeUqeqypzKQv9x/xL0alQnOgPA6+9E6iMqbuzmIP/vR
         hpc0sh2T/OoVBKPl6RqUDE2cYXhJOVZ5Yl37F103A5WJxwE+lAY/EpDBLvt8uaHYVx4c
         ZBp4gmvoNaCkEVgaBlB3H1Om6APfYRccQwZvrjsdULChjMmqfF6ECNwGKTElkN0m3jbF
         XUx1Zth+D30LLZucO386T9b+3KJF6q1A5w7HnBpc39zXCVtUOu4NBN0ZeVCXnqoRWfj0
         UM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=apzG3xku8I3ZdvmAyq4e50tGVV+Ky/wz//4vHO1DJgc=;
        b=uXUKn8KQlMn2st9A9KS45Xg4si/FsNV52fBnWe64zYjjCXSaa+8dZEqEcW72mau1lZ
         Oh/K51US321WVwaT3LtviATXAgMuBYAn/1INgzWzpxQbZN8vWtBbKU5I9gtGvhKVUod7
         jWbxjgRX844BejR5yXuThV4l91x1DFitfaYpbqqDLUa79icYXQ09jL4uqyNMlXBhnsC9
         7nZ9Zlv5Th9bl0rMHkV82pD055R1lym0EqcRx+1MCP3fNgb/qnYOUOb54CQ+tk0kNwlq
         N1VOwqkTogOI+SJxM5aPVwYhZkbssNApbZsPfbZh6uYiYaT+yH701LTxhM2wiybUSOfy
         95vA==
X-Gm-Message-State: ACgBeo2aLoAYFW05kcBqgkKWVfcRXS4jG7m0dlxec3++tqJaXJdEZk2f
        DuI8wwhuxlcuUz8ohTJLn0B4Yg==
X-Google-Smtp-Source: AA6agR7HkDM6NL+ZQ3n6KFtN5GzDUUVIGgl3PFqUw1Fy7FX4FxHrVRhX6lvmxFhkZYmEKyoUD/zzow==
X-Received: by 2002:a05:6512:15a5:b0:49a:84f4:9284 with SMTP id bp37-20020a05651215a500b0049a84f49284mr1115466lfb.477.1662923975359;
        Sun, 11 Sep 2022 12:19:35 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h6-20020ac25966000000b004949ea5480fsm703756lfp.97.2022.09.11.12.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Sep 2022 12:19:34 -0700 (PDT)
Message-ID: <2b4ab827-28aa-5e3f-951a-0bf43d1eb7b9@linaro.org>
Date:   Sun, 11 Sep 2022 21:19:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v6 01/12] dt-bindings: display/msm: split qcom,mdss
 bindings
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-2-dmitry.baryshkov@linaro.org>
 <3e525135-d205-eddc-ff2d-98c8321386e3@linaro.org>
 <20220908193705.GA3002673-robh@kernel.org>
 <1ebe64a3-fab9-1dd7-517a-01001a176d9f@linaro.org>
 <CAL_JsqLkV_fnUnc4cS=cdTvP3rKYAS011_+KZYiBGhXDx-pHnA@mail.gmail.com>
 <2204eab4-b22d-8ee7-4595-49139cb387a8@linaro.org>
 <CAA8EJpqHL-gO=zSG6Ek=-y4njGF5R66z0MwLeKZ9U4Ag1j51Og@mail.gmail.com>
 <e7a132e7-a819-ebe2-e6e5-c01cbfacef15@linaro.org>
 <CAA8EJpoPPRAQPfVQmSfrrDrroMp0bzvJ=-vHMRx72aKTBgPOTA@mail.gmail.com>
 <f013accb-96f7-a025-1d41-e2e97f8b2aa8@linaro.org>
 <CAA8EJprnrKP9Ze__KTTNGDs8sj3QhqpiHnnhf1=ipq+CFCoXsQ@mail.gmail.com>
 <272413e3-73d4-8e0d-7b5d-93007e419f76@linaro.org>
 <6e3bca5a-8b01-af12-ae69-b0044a8790f6@linaro.org>
In-Reply-To: <6e3bca5a-8b01-af12-ae69-b0044a8790f6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/09/2022 20:36, Krzysztof Kozlowski wrote:

>> If your child schema fails, the referencing schema fails as well...
> 
> 
> Although now with DSI-PHY I cannot reproduce it and I am pretty sure I
> reproduced it with DPU controllers after modifying the DTS to lack a
> property... Hmmm

https://github.com/devicetree-org/dt-schema/pull/82


Best regards,
Krzysztof
