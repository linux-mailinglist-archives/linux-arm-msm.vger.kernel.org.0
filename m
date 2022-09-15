Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 785395B9A22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Sep 2022 13:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbiIOLzg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Sep 2022 07:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230414AbiIOLzR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Sep 2022 07:55:17 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BD2E9F0D7
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 04:51:00 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id q21so30031239lfo.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 04:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=GYjBx+TTNXbw/WLp0Jvwj4Wv4yudD0lYMrMqLkpgpnU=;
        b=ebuQ4Xn1kBkl71fNdOvZVtbmfRD6z7c/EZwdTE5og57SWW4/19PtfEA5x58qmlgg3g
         m2HHetX2w6A0M1DXHxWyw8X/RNQpBuoppDDi34RCMccCKsMhJWPEgZ99kK0M4Y3lmx67
         v4ADObrCVBCzYC0fYEbzxH/OeQSfFSHO+jrM94PhsaGc7LM0ZJmfRyIo1QnnNPP7uCYO
         rMk0viXY6wb1+Ift33OggbOB0jZRTv5WYA/Hykbv+ZTEP+of8w3tPhwdqJVpu68eWBxH
         HE4DwLkbQjBzU/Czx7QUJyddvgyHQVN3/gLJxbzFj5WbZy3ufVvi/EjAiZ37L0vnCEkM
         7IXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=GYjBx+TTNXbw/WLp0Jvwj4Wv4yudD0lYMrMqLkpgpnU=;
        b=0WtH09sy4+CHVAe2xekVgCSs1F32+D5qDMZAoP19psuC6+8Lo5q6l74UlLa8xoWeKy
         0lOsInKclXkUms8s40tDtNyPqOLraYiqH3uEL1x3sNa4xACyliNIIwZeL7GsMs7M7xaT
         vh1tir3ozJZ1um07vw5+J0kQZePkIU40lWAm4Hnry8iB2MH7tD95ai9X6Ybejgq8hQr5
         TRyrPVrD1Avrx0O/TVbKotYS1aahW+v71uUDQPTfo0la/mncvGFZgkNUvBLHSrh3KkKr
         v8CY0U5r8Lf1XireCbi1yfAKcTViMiDCllyDeb9CWcc9IBzIhWpnMcBYKWVUbEQ82g0r
         yq8g==
X-Gm-Message-State: ACgBeo2YYHGV8oEbVPaM8txfE2Kv4yiL1t7+ZppzCE4n3U40J70K/ymI
        bS3lyZh+ewOwxMNMp70LFHEl1g==
X-Google-Smtp-Source: AA6agR6Iecb7F3OilQtwzLiSgm2kPoDjO5aeY1iSCleldjSxJuz5CzAhEa2YTlvqJOchX48KbZcQHg==
X-Received: by 2002:a05:6512:2521:b0:497:a6e4:4e1 with SMTP id be33-20020a056512252100b00497a6e404e1mr13672895lfb.320.1663242658090;
        Thu, 15 Sep 2022 04:50:58 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y18-20020a197512000000b00494a11c5f52sm2935386lfe.256.2022.09.15.04.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 04:50:57 -0700 (PDT)
Message-ID: <dafc0231-c578-07f1-1f4b-1cf819fa349a@linaro.org>
Date:   Thu, 15 Sep 2022 14:50:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v6 01/12] dt-bindings: display/msm: split qcom,mdss
 bindings
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
 <2b4ab827-28aa-5e3f-951a-0bf43d1eb7b9@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <2b4ab827-28aa-5e3f-951a-0bf43d1eb7b9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/09/2022 22:19, Krzysztof Kozlowski wrote:
> On 11/09/2022 20:36, Krzysztof Kozlowski wrote:
> 
>>> If your child schema fails, the referencing schema fails as well...
>>
>>
>> Although now with DSI-PHY I cannot reproduce it and I am pretty sure I
>> reproduced it with DPU controllers after modifying the DTS to lack a
>> property... Hmmm
> 
> https://github.com/devicetree-org/dt-schema/pull/82

Thanks for the quick fix!

However I think I'd still stick to the compatible binding for two reasons:
  - It doesn't evaluate schema twice for these nodes
  - It allows us to tightly link child nodes with the parent compatible, 
which I think, was one of the points raised several revisions ago.

-- 
With best wishes
Dmitry

