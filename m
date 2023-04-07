Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD3A6DB079
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Apr 2023 18:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbjDGQXm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 12:23:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjDGQXm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 12:23:42 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 237BCC161
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 09:23:12 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id m16so29139887ybk.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 09:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680884590; x=1683476590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2H2XfjhTxx/3LOcVn91RL06GgnGtqmBp4UCllTp0bwk=;
        b=Vty6/A5BCYmn6IzXsGkAvwMD0CrjYs8Txe23IQm/BeQ6j1uhca/y7wBWHNPyo/M44B
         499zdwvwwxyj2MknOfbej5ardk3XYFhaKK3yIt9R7mP6g0ybekhSE/86//9Wn5zhqbJJ
         vw1pJrOQ6bYe5wqNDq8KBxpDK9Y6wATrWPEr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680884590; x=1683476590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2H2XfjhTxx/3LOcVn91RL06GgnGtqmBp4UCllTp0bwk=;
        b=Kv/NZbmsiix2pd8aL58Wxfu7MLZxrmas7lwvYPofecI97gEWNFM2FxlMWmdhDCP5Ds
         6NtbGPDRmO4hr3B+GPsGdwhF5DRJUKnMD4EAH7jxm6ZDWLuwaaDmMaJDXLQhLFhoHyWE
         QP+Z4YpV2M5IRx/kCfWVHsEZsuh4i84VTemv1xKwFmSa1kWs9/bSQ8JH+s1+gZgMj/eS
         5Kh+p4SbwuOs+k+odcL/q5OWGRhFwC/OmdDBOeFd/l/HLhFftKMqAsJPKZWp2kV+5+9/
         Vt+mgyIreUREppLv1ap0riu3NoF2Tk581CuzZOQQWnr3FYEFb01/K+CIyXxXkPHGRl6n
         QYSw==
X-Gm-Message-State: AAQBX9e+sUe6MhiPRwp+h1WXRpAEmD0jU/sTOIFGUF3a+MLk2v5gfO8O
        xTIVWzXWKfJ/DsGxyP9hglq4DTX8u2IwREu4CW4=
X-Google-Smtp-Source: AKy350bg+OAlDH/njvRBVHA+yjxtm8F28WTF/hgtd2b6iZW84BiDNr+J0uo3XECLqOqP8TcKqpTExQ==
X-Received: by 2002:a25:c584:0:b0:b80:ecb8:6556 with SMTP id v126-20020a25c584000000b00b80ecb86556mr3446792ybe.14.1680884590380;
        Fri, 07 Apr 2023 09:23:10 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id h188-20020a2553c5000000b00b7767ca74a4sm1159125ybb.65.2023.04.07.09.23.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 09:23:08 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id r187so49464517ybr.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 09:23:08 -0700 (PDT)
X-Received: by 2002:a25:6c07:0:b0:b8b:eea7:525b with SMTP id
 h7-20020a256c07000000b00b8beea7525bmr2048631ybc.7.1680884587994; Fri, 07 Apr
 2023 09:23:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230407151423.59993-1-nikita@trvn.ru> <20230407151423.59993-2-nikita@trvn.ru>
In-Reply-To: <20230407151423.59993-2-nikita@trvn.ru>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 7 Apr 2023 09:22:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uri8DUDCGL=X82pvX0xKFZyFuXkeK51L264fFZCB+7Cw@mail.gmail.com>
Message-ID: <CAD=FV=Uri8DUDCGL=X82pvX0xKFZyFuXkeK51L264fFZCB+7Cw@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] arm64: dts: qcom: sc7180: Don't enable lpass
 clocks by default
To:     Nikita Travkin <nikita@trvn.ru>
Cc:     agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@linaro.org,
        quic_srivasam@quicinc.com, judyhsiao@chromium.org,
        mka@chromium.org, cros-qcom-dts-watchers@chromium.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Apr 7, 2023 at 8:14=E2=80=AFAM Nikita Travkin <nikita@trvn.ru> wrot=
e:
>
> lpass clocks are usually blocked from HLOS by the firmware and
> instead are managed by the ADSP. Mark them as reserved and explicitly
> enable in the CrOS boards that have special, cooperative firmware.
>
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> v5: minor style changes (Konrad)
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 8 ++++++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi         | 4 ++++
>  2 files changed, 12 insertions(+)

I probably would have put a note in the commit message about why you
chose not to enable these for IDP (AKA summarize the results of the
conversation [1] in your v3 post). IMO not worth spinning a v6 just
for this, though.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

[1] https://lore.kernel.org/r/3557aa94-6a83-d054-a9d9-81751165eb8a@linaro.o=
rg
