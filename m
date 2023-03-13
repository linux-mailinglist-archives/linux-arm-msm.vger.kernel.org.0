Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8CD6B7A7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 15:37:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbjCMOhr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 10:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjCMOhq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 10:37:46 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 224953A82
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 07:37:45 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id s12so13262660qtq.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 07:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678718264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9wviaciFaFNhJ1J1XpkBbRHYzGEiVtgdsNXSIrpY6o=;
        b=MH6i5Wk+imvpXlQBGvEB6W4YTIwbAliNkmbnpXDqS4v4hxrKYZQy3OFEBr4QZOul57
         eSk4TW5rDdAyIpYTDQH3qC/w8thoevxSYwlcuLNimnneclHM1RW4cUa1y0e5loWqI/Ku
         okYUYE0r4d3eFhiM5i1N3PdOeeZWEIIIAtk6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678718264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9wviaciFaFNhJ1J1XpkBbRHYzGEiVtgdsNXSIrpY6o=;
        b=DtQxodhSUHJQu9nfEnk/qquWtliUJCzq3v6DeF4zL2udT0hzztoCXk6ISZieLTLtFo
         crPcV61O1o/lMXcKE6mhhpECUb9pkIUDqPPdn3WJICxgwKPMyYHcby67AnMYfWsSBVGe
         rqDcy/TPb4xcWAGo5fwQUZxVG2NSrS8d/V26yW7gDmdSbHMC8g17flSB5776xRPmaQJg
         YNCpzc9zFK6p7vPHyI4qa6Qb8fsATDm8+fumxyvim1WUu+ImuSKPj803bUG3T0p6vDZ9
         R9RBGTIReyrxe6BDIp85/lz/B1ZKzfRXoSYmFp8oFUqj0tFLFhKuiVWn291Qtv+1MieQ
         ux6w==
X-Gm-Message-State: AO0yUKXD4eNm1L5veGVslFzvKZ4CrJIl7qIh1JCFZbXD4vrYyPUOQ7QM
        6jlunvDbWJlH06ZDfrD21/5ZedKPx8F3jSS7OWg=
X-Google-Smtp-Source: AK7set+XelfcjATxeWZx2vXew+YtnKp/InEL+AW/d9Ti5fen/Iy+hIcp73KXfhVRHwqbEy0xB37SQw==
X-Received: by 2002:ac8:5bc5:0:b0:3bf:e034:5f5e with SMTP id b5-20020ac85bc5000000b003bfe0345f5emr55475649qtb.52.1678718264115;
        Mon, 13 Mar 2023 07:37:44 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id s20-20020a37a914000000b00741a984943fsm5497206qke.40.2023.03.13.07.37.43
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 07:37:44 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-54184571389so96511337b3.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 07:37:43 -0700 (PDT)
X-Received: by 2002:a81:af4f:0:b0:541:8ce6:b9ad with SMTP id
 x15-20020a81af4f000000b005418ce6b9admr3376649ywj.2.1678718263282; Mon, 13 Mar
 2023 07:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230312183622.460488-1-krzysztof.kozlowski@linaro.org> <20230312183622.460488-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230312183622.460488-2-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 13 Mar 2023 07:37:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Va7M=9LzPumUrk-U-XrN1va0Afnib5X-Bt8cfkU6SyNA@mail.gmail.com>
Message-ID: <CAD=FV=Va7M=9LzPumUrk-U-XrN1va0Afnib5X-Bt8cfkU6SyNA@mail.gmail.com>
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sc7280-herobrine-villager: correct
 trackpad supply
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        "Joseph S. Barrera III" <joebar@chromium.org>,
        Gustave Monce <gustave.monce@outlook.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,


On Sun, Mar 12, 2023 at 11:36=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The hid-over-i2c takes VDD, not VCC supply.  Fix copy-pasta from other
> Herobrine boards which use elan,ekth3000 with valid VCC:
>
>   sc7280-herobrine-villager-r1-lte.dtb: trackpad@2c: 'vcc-supply' does no=
t match any of the regexes: 'pinctrl-[0-9]+'
>
> Fixes: ee2a62116015 ("arm64: dts: qcom: sc7280: Add device tree for herob=
rine villager")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-herobrine-villager.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Luckily it didn't matter since this regulator is always on, but good
to have things described properly.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
