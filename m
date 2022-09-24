Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB9E5E8AAC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 11:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233469AbiIXJUe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 05:20:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233488AbiIXJUc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 05:20:32 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7F9A12C1E5
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:20:27 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id b6so2402002ljr.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=KwKiygJRfTorofnL1eRmybhvU/B8TBgGDBZcE2Kd2qI=;
        b=rVtcuLxH7HhgdMgin0oYUFOPi4fFSBqECan7mc8HIU8xVY9Q8yofftMMtz1YdSH1fX
         F8eVq2kMp/1bwCkxb4eTYhMhjuHDw3dMRU26qXt6wkN8XhyuWH1xpFvgEQ2IIR7eZ5qp
         RYWKXyizjvNVnmJv7fog2Lx+gsaYOm1xZd3Vf9drqOsOCnhIK1xdPLAh3ELwaz2hQT8O
         YeR8nQ7C2J66R73/6XxDBPpYXcVRzWqvnnCwlfMUMMpegytmM1co6EkZJH6hwcyMtzX1
         D+G4ezZqiaZWdZ37WlC3rNUlMxTJHR1jWbzQ/9CpEKBhRcfSieOImW5xPJwbfnr0xvL9
         vBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=KwKiygJRfTorofnL1eRmybhvU/B8TBgGDBZcE2Kd2qI=;
        b=yfo8QbQ+0Z3Z0ihQLJIPwqXpTkkaaSTBkzrYWHP48FjIurSswijrY+Vg2aLGVZQzJU
         CmWz3x//4Tx010h7PE5pYMgqxRGVbFBBvrE/uq4AwOLl4A4F2seqPGNJwbx9DW44uszp
         X5TMBuoAcdALs0JbW4tu/O8EKO0C606gR5IUhnQixPVxJKQjbXfr6ZpOgXRbhNHM58oB
         Ma/iboRTQaib3cJXmcPInbisXytr5D+Wh1ERix27ZrzcitV40qtG3kca5yApYp2O7zCn
         w3bVEYRl0UjqbygyxbmY6uHXAQWjJBd3j8WzXa08mqUSPPWb99vA/LpBXTQW0MOqrSRT
         e3sA==
X-Gm-Message-State: ACrzQf16iWSHJLqmadovm2Lst7pfaaM0lL3LeSTlRl+XGFN8MXi60Qna
        JHPIDFS/WCEJeOqhOIjW+SzAOA==
X-Google-Smtp-Source: AMsMyM4/jReK06gsjawmyIkRqro894CFuOhxayzhoLBmB32YizFJ+oaebPLlgl3+/QZNSY+lTXvwFg==
X-Received: by 2002:a2e:a785:0:b0:26c:4e8c:5e79 with SMTP id c5-20020a2ea785000000b0026c4e8c5e79mr4502641ljf.396.1664011226089;
        Sat, 24 Sep 2022 02:20:26 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v18-20020a2ea612000000b0026c4113c150sm1725592ljp.111.2022.09.24.02.20.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Sep 2022 02:20:25 -0700 (PDT)
Message-ID: <361ad59f-288f-beae-25c7-7acd42c2db94@linaro.org>
Date:   Sat, 24 Sep 2022 12:20:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 0/9] arm: dts: qcom: rename DSI PHY nodes
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
 <fd91077b-e4ff-0187-8424-0b83b96588ef@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <fd91077b-e4ff-0187-8424-0b83b96588ef@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/09/2022 12:11, Krzysztof Kozlowski wrote:
> On 24/09/2022 11:00, Dmitry Baryshkov wrote:
>> Historically DSI PHY device tree nodes used the dsi-phy@ names. Replace
>> them with generic phy@ names.
>>
>> Dmitry Baryshkov (9):
>>    ARM: dts: qcom-apq8064: change DSI PHY node name to generic one
> 
> dsi-phy is similar to other generic names (usb-phy, ethernet-phy) [1] so
> it could stay. Is there particular need for this, like coming from DT
> schema?

No, there is no requirement from the DT schema. However:
1) The resent qcom DT files already use just phy@ for most of PHY nodes
2) The recommended list mentions usb-phy/ethernet-phy, but not 
<anything>-phy, so I'd think that those two are mostly for backwards 
compatibility.
3) I liked the example of sc7280 which switched all MDSS PHYs to just 
phy@ (this includes DSI PHY, eDP PHY and, by extension, the HDMI PHY).

> 
> [1]
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 
> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry

