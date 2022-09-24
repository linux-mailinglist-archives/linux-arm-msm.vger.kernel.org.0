Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7F595E8D79
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 16:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbiIXOrW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 10:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiIXOrV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 10:47:21 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C127D69CB;
        Sat, 24 Sep 2022 07:47:20 -0700 (PDT)
Received: from [192.168.1.101] (95.49.29.188.neoplus.adsl.tpnet.pl [95.49.29.188])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 5178A1F8F0;
        Sat, 24 Sep 2022 16:47:17 +0200 (CEST)
Message-ID: <83658ff9-5fc1-c9bc-9c21-98d7e08d534c@somainline.org>
Date:   Sat, 24 Sep 2022 16:47:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 0/9] arm: dts: qcom: rename DSI PHY nodes
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
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
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 24.09.2022 11:00, Dmitry Baryshkov wrote:
> Historically DSI PHY device tree nodes used the dsi-phy@ names. Replace
> them with generic phy@ names.
> 
> Dmitry Baryshkov (9):
>   ARM: dts: qcom-apq8064: change DSI PHY node name to generic one
>   ARM: dts: qcom-msm8974: change DSI PHY node name to generic one
>   arm64: dts: qcom: msm8916: change DSI PHY node name to generic one
>   arm64: dts: qcom: msm8996: change DSI PHY node name to generic one
>   arm64: dts: qcom: sc7180: change DSI PHY node name to generic one
>   arm64: dts: qcom: sdm630: change DSI PHY node name to generic one
>   arm64: dts: qcom: sdm660: change DSI PHY node name to generic one
>   arm64: dts: qcom: sdm845: change DSI PHY node name to generic one
>   arm64: dts: qcom: sm8250: change DSI PHY node name to generic one
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

for the entire series

Konrad
> 
>  arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts | 2 +-
>  arch/arm/boot/dts/qcom-apq8064.dtsi                | 2 +-
>  arch/arm/boot/dts/qcom-msm8974.dtsi                | 2 +-
>  arch/arm64/boot/dts/qcom/msm8916.dtsi              | 2 +-
>  arch/arm64/boot/dts/qcom/msm8996.dtsi              | 4 ++--
>  arch/arm64/boot/dts/qcom/sc7180.dtsi               | 2 +-
>  arch/arm64/boot/dts/qcom/sdm630.dtsi               | 2 +-
>  arch/arm64/boot/dts/qcom/sdm660.dtsi               | 2 +-
>  arch/arm64/boot/dts/qcom/sdm845.dtsi               | 4 ++--
>  arch/arm64/boot/dts/qcom/sm8250.dtsi               | 4 ++--
>  10 files changed, 13 insertions(+), 13 deletions(-)
> 
