Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 389095E8CA7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 14:38:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbiIXMi1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 08:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbiIXMiY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 08:38:24 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 919CEF370C
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 05:38:23 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id s6so4133783lfo.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 05:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=UOPfolxOIZ12CQXsf68Fo4WzsyOri0BWmpnt6BnO0Ow=;
        b=cX7t//F3kSLyor1gvEfsfeHBhBowAS4uSSLVqTm6qEPoB5XWUliaOcRhIRFfO8aUz7
         DdNoalQzEU0xu5QZ2rGZenhYadJDWtwBu28UPuw65635czBeAEBihIQvXpNSw7lxv4+3
         lIM9B8mJhd1Zp5ZG8HiAprDuGYLzm2F5EL/B1H2e+I01M2TcWI/gPp3mVD0yNRYnLxPB
         KxyYQVvtapmR80WiG6YnO2c9nA4zmYLPUnAKGkm2ikj57KRQb75Sw2xRSscpJ5cx8qK0
         matFHjmnUrD8SDqBraMiIwnPIH0/incZ2QuYumeK9C20HhLieXry4iNGV7YlLg0R3JbU
         atMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=UOPfolxOIZ12CQXsf68Fo4WzsyOri0BWmpnt6BnO0Ow=;
        b=yEsPjJZxcpiUS0oSs4UdJSBGMtjprNYk3+rGKhxHk0sqwEGjkSHci5rLlcBBWHd9bi
         bCDl9cy/1zOgCfe5zuE8mmuvA8BySRz3B1sDYfkCh2tlpUiMJ8m6SXR8BcqAfsu3vSwE
         WhS5QJ5ApZ7p2k4lRuY8wRdMFRhFJHPCLS1gERkJ8x9whTn4jYNKTH/QB2byf4zgr7cz
         qvUmJBmOOBosB96fvZU8bZrwIJReW4Ui97A1qmJYchBPXykp/4+eRMjyZPjYIj48xBXY
         g4atIA31mExTUMMoCkccVLnaIKprKQZpbkDfvdXQIx3NWmVNHExKEs1jictLx+Y49s4S
         lsIw==
X-Gm-Message-State: ACrzQf2eEFeNpb8t1plnrC8tpKvAQSu7o+88QqtF2ZE7Uew8vPj5W5Ak
        qp/UKB2VFardThD6hy7Go9VDkA==
X-Google-Smtp-Source: AMsMyM5l1YVddhO3ezSgzoWafIh6OyvozrYGj4Ma6FMICHHIgqvDYN6Ft2bN3dHhYEQ7lhx435RL2w==
X-Received: by 2002:ac2:4e07:0:b0:49c:6212:c459 with SMTP id e7-20020ac24e07000000b0049c6212c459mr5466448lfr.614.1664023101989;
        Sat, 24 Sep 2022 05:38:21 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u6-20020a05651220c600b0049771081b10sm1890477lfr.31.2022.09.24.05.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Sep 2022 05:38:21 -0700 (PDT)
Message-ID: <64f7c603-173a-93a3-8878-60dd2a8974f9@linaro.org>
Date:   Sat, 24 Sep 2022 15:38:20 +0300
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
 <361ad59f-288f-beae-25c7-7acd42c2db94@linaro.org>
 <5ea1e309-6ea8-f6c1-dc53-471d858ff60d@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <5ea1e309-6ea8-f6c1-dc53-471d858ff60d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/09/2022 12:29, Krzysztof Kozlowski wrote:
> On 24/09/2022 11:20, Dmitry Baryshkov wrote:
>> On 24/09/2022 12:11, Krzysztof Kozlowski wrote:
>>> On 24/09/2022 11:00, Dmitry Baryshkov wrote:
>>>> Historically DSI PHY device tree nodes used the dsi-phy@ names. Replace
>>>> them with generic phy@ names.
>>>>
>>>> Dmitry Baryshkov (9):
>>>>     ARM: dts: qcom-apq8064: change DSI PHY node name to generic one
>>>
>>> dsi-phy is similar to other generic names (usb-phy, ethernet-phy) [1] so
>>> it could stay. Is there particular need for this, like coming from DT
>>> schema?
>>
>> No, there is no requirement from the DT schema. However:
>> 1) The resent qcom DT files already use just phy@ for most of PHY nodes
>> 2) The recommended list mentions usb-phy/ethernet-phy, but not
>> <anything>-phy, so I'd think that those two are mostly for backwards
>> compatibility.
>> 3) I liked the example of sc7280 which switched all MDSS PHYs to just
>> phy@ (this includes DSI PHY, eDP PHY and, by extension, the HDMI PHY).
> 
> Good explanation. If there is going to be resent/submit, please add it
> to cover letter. :)

I hope, there will be no v2. For now I have included this explanation 
into the HDMI PHY counterpart.

-- 
With best wishes
Dmitry

