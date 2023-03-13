Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAF106B7FFE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 19:10:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbjCMSKY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 14:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230199AbjCMSKO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 14:10:14 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8423476F61
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 11:10:13 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id s22so16824036lfi.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 11:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678731012;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/UmHmPBg3/KI8KvoUSeeIp1LmuluBX0Sv6TgjKs3d9E=;
        b=mxXEcHfqp01IK15NmgnwBXXKUc4nQvrXWX21tuzlRrDbwI3AahzL2snAI3dkTc47Hb
         1isieLtMMUSc6VccPO4Xej39klM4R700IdP2q1ECUf2NqBX7Bu9C2cCilW3xo6MX+NHF
         gC8cxqBYzc9D2c0RoQ0rBoKPV3ZKfQ9joxva8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678731012;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/UmHmPBg3/KI8KvoUSeeIp1LmuluBX0Sv6TgjKs3d9E=;
        b=tLZ6IHVCS9ZHK5QHvm/tEKRLQMjNWKGS9LQNTlhbZtvFqJMS3qcfekYTfrjxCa7bXg
         NWwKDhlUM27zjd0WnPzpWGIDTeAmSYT4JnfTuRI+WmQmSu32JitHQf/Z4325fkrX4S/Z
         8ZUOU0+gGoUm+MXRpKON7P1xNYR/tbZ3oqoCCyTpQ2Pdjn3LU7I9idxBu6HSgFPPaEyo
         a1j0UtKgr4wkkVpw+y1nNGaIH7HilZRkxKUvIqcys5wqRIiFG3SCWRao1ZepbjVwmQY0
         m39Kr/Fpcdps7Aaesry/3AvpNeit1IDKXKj2WSkSCWrI82pTwrPwc9jGbTlEoAAe12aA
         t59Q==
X-Gm-Message-State: AO0yUKX/vuCLBIusPDMQI9/UHNb+r2sNqzQeNAGcFisjl1phvO2UqMyA
        HmDgfR1HW2wZDQJuiPaC+doVUariNb5/JYx3kfMFwg==
X-Google-Smtp-Source: AK7set+f6kjqU/JYMNhvXXZiogIza/ykidaSJZkuSbt2NvCqe/3opxyPqZXqakkXk/QAvNMFkDSKtY+k9GQb21x6vvA=
X-Received: by 2002:ac2:5312:0:b0:4e1:dbbb:493b with SMTP id
 c18-20020ac25312000000b004e1dbbb493bmr11186617lfh.4.1678731011790; Mon, 13
 Mar 2023 11:10:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Mar 2023 11:10:11 -0700
MIME-Version: 1.0
In-Reply-To: <20230312183622.460488-4-krzysztof.kozlowski@linaro.org>
References: <20230312183622.460488-1-krzysztof.kozlowski@linaro.org> <20230312183622.460488-4-krzysztof.kozlowski@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 13 Mar 2023 11:10:11 -0700
Message-ID: <CAE-0n50=pjP4Quu0grdb12wbetm-gRdxJq_CVEn8Ky=exNYKKw@mail.gmail.com>
Subject: Re: [PATCH 4/8] arm64: dts: qcom: sc7180-trogdor-pazquel: correct
 trackpad supply
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Gustave Monce <gustave.monce@outlook.com>,
        "Joseph S. Barrera III" <joebar@chromium.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krzysztof Kozlowski (2023-03-12 11:36:18)
> The hid-over-i2c takes VDD, not VCC supply.  Fix copy-pasta from other
> boards which use elan,ekth3000 with valid VCC:
>
>   sc7180-trogdor-pazquel360-lte.dtb: trackpad@15: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
>
> Fixes: fb69f6adaf88 ("arm64: dts: qcom: sc7180: Add pazquel dts files")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
