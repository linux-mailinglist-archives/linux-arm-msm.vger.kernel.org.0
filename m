Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5FA6B7FF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 19:09:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbjCMSJQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 14:09:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbjCMSJO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 14:09:14 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CAFF67033
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 11:09:13 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id by8so13529198ljb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 11:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678730952;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W45pqh6rHZMV7er8r7vRNdyEclPygSssNBnV0UKAcog=;
        b=P7wrv3KvRaC17pYzb0LL9KrNeN1wOISkOn0ONw5JH+MfHJzptj48We01OEivPWRDYq
         yIcbtmyMI7yZUtFDqLa8hvWJ2ad1mF0O+SjoL8wyG9bEsF3Tq5aDapfD0uZLh8XW7ACO
         rcpAwSsBW5aQAqAiGgO4OllA6A8YuV3csbBog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678730952;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W45pqh6rHZMV7er8r7vRNdyEclPygSssNBnV0UKAcog=;
        b=kigeIQaR+ECHlanikJgmYzYFes0PLFtTYgUnUPQKtw4s/12m+GQ+JuDaHrkAbctUck
         UAjKql4KvsiL8W5xjC9kfMaqoRE/wWjzEg3YMtkicaY/cRcj3q/RYj6uM9KbK2PfHPtN
         96HyW2oCcQ+Q0CsqUYMhwIFHdhYoZPM2eVKDbVlr86MfxQRYIBh9dKtmzg61quONAs4A
         ihtECkgCK+VFz/fzUVdbAX4H2v4Vt83uR2rqdvoZBRoIeIm60VBhhJf5jT106x9kHbB4
         JzsR6QUoPq/vO/xWOYaQY4jB2iRH5gTPk2IJ9bwnnxuyFqscjxvqi7hW+SdeofY3YWhw
         /g6g==
X-Gm-Message-State: AO0yUKX3763zzpawlEXyJKu5bSxE5xn4TIIWKYumTa62XKinFzpwwipR
        TwJI3EbM8HTL6UL/F2hidtcsLWdczXMfD46bg1G4tg==
X-Google-Smtp-Source: AK7set+TULUjEPJaromYnsVyjCcrBsLrMwvvOBGHoxASe8ZB3nUXuTxG8NVF9NSiY36KNOKfHNjog05hR5+i7lwuvXQ=
X-Received: by 2002:a2e:a60c:0:b0:295:bb34:9c2 with SMTP id
 v12-20020a2ea60c000000b00295bb3409c2mr11000045ljp.10.1678730951736; Mon, 13
 Mar 2023 11:09:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Mar 2023 11:09:11 -0700
MIME-Version: 1.0
In-Reply-To: <20230312183622.460488-2-krzysztof.kozlowski@linaro.org>
References: <20230312183622.460488-1-krzysztof.kozlowski@linaro.org> <20230312183622.460488-2-krzysztof.kozlowski@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 13 Mar 2023 11:09:11 -0700
Message-ID: <CAE-0n52Si7XjHNJDrsO3zd2r72UsecorLxyfCGhnZH8pzrF3Sw@mail.gmail.com>
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sc7280-herobrine-villager: correct
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

Quoting Krzysztof Kozlowski (2023-03-12 11:36:16)
> The hid-over-i2c takes VDD, not VCC supply.  Fix copy-pasta from other
> Herobrine boards which use elan,ekth3000 with valid VCC:
>
>   sc7280-herobrine-villager-r1-lte.dtb: trackpad@2c: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
>
> Fixes: ee2a62116015 ("arm64: dts: qcom: sc7280: Add device tree for herobrine villager")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
