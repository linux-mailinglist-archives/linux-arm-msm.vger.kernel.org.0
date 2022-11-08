Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 340BB621190
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 13:57:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233382AbiKHM5E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Nov 2022 07:57:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233313AbiKHM5E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Nov 2022 07:57:04 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A31F38A8
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 04:57:02 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id b9so20962064ljr.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Nov 2022 04:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZZM+AXKZa9P5kZBhUpX/qsSZtQourse7WrI4yR53t0=;
        b=xrRLs2s1Nd5+E9KNHyojSdhH71Z1gwTSLWEEZ+IiO1ig3rWFkFgWyfQHEGxqEiC4fv
         CbQZSCFiZqFJwazqrZhTAvFfJoI3afy8vFRH45cqCtGhcyJmnqp/oIpR6+Ei/2Mw30D1
         MpZZkUdvQ+H4kWZB2inTVaXrZMs7mdGrcaU84iN3GL8WW5UwO7cZPzTju/i3hymf4pUK
         w8RGAYGpbFGKqRnYAaEHX2fG7oKbmMcMD53QPv3aYkzmL9vY2CKiMxjR5JJCJnsXZz/W
         Eks0TYEGNRl3ScStkhJqj19yRzZpLTe1fjhWvhhwEtw3jE09Dlbrd+CR+mm4fkBjN/RS
         Ickw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UZZM+AXKZa9P5kZBhUpX/qsSZtQourse7WrI4yR53t0=;
        b=YmdGQK9hXGBPTlAiJePbmX2D9KDuykUsq+M67U/NPFUWcCFX+H87fDwRtdpQsJ/MSO
         l4qew7r5uzbMeKzywIFZTPfGPTefFS28FJarwZnueSXyhQ79ZAh1cx707aZqKbAAuuu2
         BHiBhEA5d2lFmc/mEArFhgtxT2w5tn7XlClE1RHNglEMyuImb3Uu+/FCvr8qnA3Bk8D2
         veImOZf0RBxJDmz18e664W2l3iRsskM0JjLowFtC8EwJ6OkT3WDVfhlilXfu7x8+sjCd
         QV2/lx2bsADbY49TiKUuVyihZVW2fR3eOO97esgd8aYiBg4kPg8vcsGZDWeQ6F7oyvt8
         JFvA==
X-Gm-Message-State: ACrzQf0KJ+J+SYTlCKHv8cX3gGCdP2jsYCcTbauAwFNo4WINKb2Q4q6W
        QQ9D8oEB3tS9vdlD1muPLy+JlA==
X-Google-Smtp-Source: AMsMyM5XVDJwjxaTFP1mQpLt9zz47xEeNFQkMZ1qaN5PGvt4Icm5awpwoUsMXHHa34b1iEtHq39TQw==
X-Received: by 2002:a2e:9b11:0:b0:277:6fea:ac19 with SMTP id u17-20020a2e9b11000000b002776feaac19mr6291994lji.83.1667912220685;
        Tue, 08 Nov 2022 04:57:00 -0800 (PST)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id e23-20020a196917000000b004979df1c1fasm1792884lfc.61.2022.11.08.04.56.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 04:57:00 -0800 (PST)
Message-ID: <eb80681f-2e0b-605f-0444-ec65562f74b8@linaro.org>
Date:   Tue, 8 Nov 2022 15:56:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 00/18] mdss-dsi-ctrl binding and dts fixes
Content-Language: en-GB
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, quic_mkrishn@quicinc.com,
        linux-arm-msm@vger.kernel.org
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 08/11/2022 02:56, Bryan O'Donoghue wrote:
> V2:
> https://www.spinics.net/lists/linux-arm-msm/msg116326.html

Please send the whole series to both linux-arm-msm and freedreno MLs. 
And to all maintainers (I think it is more useful to get the whole set 
rather than being puzzled what happens in the rest of the patches). This 
would allow you to drop the Cc lists from the patches and pass the whole 
list to git-send-email.

> 
> - Moves the DSI PHY changes to a different later series.
>    There are enough dsi-controller-main changes to justify its own
>    standalone series.
> 
> - The original phy-name binding change given discussion with Rob and
>    Krzysztof became its own standalone series that has since been merged.
>    https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg403214.html
> 
> - Retains the drop of power-domain from yaml as a required property.
>    I dug into the available dtsi. The apq8064 doesn't appear to have any
>    GDSC which can be attached as a power-domain, which means the
>    power-domain requirement is not universal across the various silicon
>    versions.

I don't think 8x60/8960/8064 had GDSCs. At least msm-3.4 adds them only 
to msm8974.

> 
> - Adds Dmitry's RB to power-domain drop
> 
> - For the clock declarations I've
>    * I noticed that the simple change I had worked for msm8939 but
>      subsquently broke other dtsi which drove a bigger change to document
>      the clocks on a per compatible basis.
>    * Added compat strings in yaml.
>    * Moved the allOf down later in the file to acomodate the if/then.
>    * Number of clocks validated on a per compatible basis
>    * The driver code which doesn't care about the number of clocks
>      can still operate on the mdss-dsi-ctrl compat but the dts checks will
>      validate against the compat string and yaml.
> 
> - vdd descriptions
>    Took the previous text I missed from the .txt file - Krzysztof, Dmitry
>    Adds vdd, vdda and vddio to the required list. This exposes warnings in
>    existing dtsi but the previous .txt declared these regulators as
>    required. - Krzysztof
>   
> V1:
> This series fixes up a number of dtbs checks which are being flagged adding
> in the msm8939 dtsi.
> 
> 
> When converting from .txt to .yaml a number of the parameters for the older
> msm8916 silicon were not transmitted into the yaml.
> 
> Adding in the msm8939 which is a near 1:1 copy of the msm8916 in terms of
> dtsi triggers a rake of dtbs checks as a result.
> 
> https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg403211.html
> 
> Bryan O'Donoghue (18):
>    dt-bindings: msm: dsi-controller-main: Fix operating-points-v2
>      constraint
>    dt-bindings: msm: dsi-controller-main: Fix power-domain constraint
>    dt-bindings: msm: dsi-controller-main: Add vdd* descriptions back in
>    dt-bindings: msm: dsi-controller-main: Fix clock declarations
>    dt-bindings: msm: dsi-controller-main: Fix description of core clock
>    dt-bindings: msm: dsi-controller-main: Alphanumerically sort
>      compatible enum
>    dt-bindings: msm: dsi-controller-main: Add compatible strings for
>      every current SoC
>    dt-bindings: msm: dsi-controller-main: Document clocks on a per
>      compatible basis
>    ARM: dts: qcom: apq8064: add compat qcom,mdss-dsi-ctrl-apq8064
>    ARM: dts: qcom: msm8974: Add compat qcom,mdss-dsi-ctrl-msm8974
>    arm64: dts: qcom: msm8916: Add compat qcom,mdss-dsi-ctrl-msm8916
>    arm64: dts: qcom: msm8996: Add compat qcom,mdss-dsi-ctrl-msm8996
>    arm64: dts: qcom: sc7180: Add compat qcom,mdss-dsi-ctrl-sc7180
>    arm64: dts: qcom: sc7280: Add compat qcom,mdss-dsi-ctrl-sc7280
>    arm64: dts: qcom: sdm630: Add compat qcom,mdss-dsi-ctrl-sdm630
>    arm64: dts: qcom: sdm660: Add compat qcom,mdss-dsi-ctrl-sdm660
>    arm64: dts: qcom: sdm845: Add compat qcom,mdss-dsi-ctrl-sdm845
>    arm64: dts: qcom: sm8250: Add compat qcom,mdss-dsi-ctrl-sm8250
> 
>   .../display/msm/dsi-controller-main.yaml      | 185 ++++++++++++++++--
>   arch/arm/boot/dts/qcom-apq8064.dtsi           |   3 +-
>   arch/arm/boot/dts/qcom-msm8974.dtsi           |   3 +-
>   arch/arm64/boot/dts/qcom/msm8916.dtsi         |   3 +-
>   arch/arm64/boot/dts/qcom/msm8996.dtsi         |   6 +-
>   arch/arm64/boot/dts/qcom/sc7180.dtsi          |   3 +-
>   arch/arm64/boot/dts/qcom/sc7280.dtsi          |   3 +-
>   arch/arm64/boot/dts/qcom/sdm630.dtsi          |   3 +-
>   arch/arm64/boot/dts/qcom/sdm660.dtsi          |   3 +-
>   arch/arm64/boot/dts/qcom/sdm845.dtsi          |   6 +-
>   arch/arm64/boot/dts/qcom/sm8250.dtsi          |   6 +-
>   11 files changed, 194 insertions(+), 30 deletions(-)
> 

-- 
With best wishes
Dmitry

