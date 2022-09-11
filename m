Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 767225B50BF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Sep 2022 20:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbiIKS4G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 14:56:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbiIKS4F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 14:56:05 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A621A046
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 11:56:00 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id z23so8215869ljk.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 11:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=RPQy1aNVD24fj2brehWpaN5iIeVrcdsDrdD2wAGWJbw=;
        b=c75Vojp6jAAIpodeHlqPi0GJc4HMYQ5s4cTSvzo5PjQO2eaDN+Y8J294PC1o/W1Mh1
         7rJkE/pTpxM+OVoq/75nokUTo+OB5oPdKt0pd+v6NKiNM+aiHrN+0QPW7Nocpvt7Ns+X
         dixVgW8RsCGSdey2Ot5IOqy1BVePjs0mufrNarMJch+192iMV44lLqUEvsCfnKr+P8O9
         YchsFXgqg9leGJO+/nfFqxOD01IZpocXxcRjBt+TrAJ4SC7ZnnimbF3kdLHtgqVXVRtM
         LkI4b+oWGMzBUaDArYKQud1rHpXu5yk80gIVS8LklPOaGdWE/0e0Et0uD4u8r0xrt2md
         Hz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=RPQy1aNVD24fj2brehWpaN5iIeVrcdsDrdD2wAGWJbw=;
        b=RtOOr25zNeFeEKbOCHQ2QMSUrGT4k40ZqkbWckxXR4KCD52tEtOnsWRzEWxG/p0I7h
         8hnKDVV+MKdCRUll7nkYNX59UQIwLASn/lsoYDwjLX/NcrRDd19AXOifUXcxqfT8ib/G
         LEr+ocOcoD2gfu78adBxMxShNTVHn2VJnaCXuTGjq8LpMdi8QaEVoz9tGQKA8QuUny3l
         3BcUjK+buvNwD2tz57x6cfn71wSZpfszNlZqfcy/eJBBpgTRo8yAn3knU3/vafu1ocjJ
         olgpMt4feTd08+MVUdpjorVVUbxoHtUnsRO/Zkflo2E7MjOvS56fLXpio9vWk+u5vM9t
         i6/w==
X-Gm-Message-State: ACgBeo3IlSvEHV5Uiv+hg7zK1hi1DrJHVsNBewsuXAH7qVdLyoC1kky1
        btTO23b00RCyLM335fYeTJKgtA==
X-Google-Smtp-Source: AA6agR5kw9mbNFc8XSl/zb4xnABTaoglXNP4qJenxxMNT/Dy+78GH+uJdblCn8w8V3fRV1ow1HficA==
X-Received: by 2002:a2e:be28:0:b0:25f:d901:16ef with SMTP id z40-20020a2ebe28000000b0025fd90116efmr7159410ljq.126.1662922558995;
        Sun, 11 Sep 2022 11:55:58 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id w1-20020ac25d41000000b004991437990esm704068lfd.11.2022.09.11.11.55.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Sep 2022 11:55:58 -0700 (PDT)
Message-ID: <7cf581a6-0602-7d6d-1518-7ae62a89031e@linaro.org>
Date:   Sun, 11 Sep 2022 20:55:46 +0200
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

>> /home/krzk/dev/linux/linux/out/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb:
>> dsi@c994000: 'vdda-supply' does not match any of the regexes:
>> 'pinctrl-[0-9]+'
>>
>>
>>
>> If your child schema fails, the referencing schema fails as well...
> 
> 
> Although now with DSI-PHY I cannot reproduce it and I am pretty sure I
> reproduced it with DPU controllers after modifying the DTS to lack a
> property... Hmmm
> 
I think I have a fix for this in DT schema.

Best regards,
Krzysztof
