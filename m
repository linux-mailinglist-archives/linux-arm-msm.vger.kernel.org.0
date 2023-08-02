Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB22076D8FB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 22:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232911AbjHBUyA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 16:54:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232728AbjHBUxj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 16:53:39 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26D6E30CF
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 13:53:31 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99bcd6c0282so32280266b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Aug 2023 13:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691009608; x=1691614408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZHaSNcsoDssz3tlY4G2BdaDeYnMEGzSRbtap2UcKeQ=;
        b=Go5rtsqvfsRJ+rHFVJuTx4Uq8BpCaU54ukpRJ5KlbjUtuwAbGRY7NER2EBF3aeG6in
         p7ofRXYtTmwslLqDBMgnHWzQ0ZY6b6gkBoGYTpOniKpNIVVgSmYY8C9xgi/ehFT4GE3j
         D7vM6h9YXNfqGJuYxWaknJQpz3HCJw9LzqzZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691009608; x=1691614408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ZHaSNcsoDssz3tlY4G2BdaDeYnMEGzSRbtap2UcKeQ=;
        b=YucphbMnL9LLQfTgJktGfe+mo9g/vdTjytn9EKeyqcX5LtVXFPdacZ+zp6VS921tye
         quTIMnJx5NevmoWzwqwUOt5FeNbM6vOVOyXH/aCgs3lqkwXrsZl21+3oKeh0z1VpS1vm
         4G+PyRnkAdnArg8ZxN/KM/660lhQbI7MZE3Ggge58K7MtUBL4k4BvBiyC0CnRBubGcUr
         XzcBijVyC+sbU7VqIqWsD1Upkhlm08/0PxjAh9Lw0KRHhiS1dGfaiXkATROkk7VyFH5K
         dSOuOC/tbwU8FgdWqRTt4QoRIgC1fTwabUy5SG9WoSptZvNli9szWaDdK6P0QZvACnfv
         Uimg==
X-Gm-Message-State: ABy/qLaMUufIE9DRLnnESI1dJTowv7hO9iP84KSOjEo3U+tiN15xgiDP
        vrA/f1BV+6NCBQmYNUBljMw1OQNYYJooe3IsPJzxNS6n
X-Google-Smtp-Source: APBJJlEkSEh8S7sUNkhYUlz7pAZ4/z3zyXlhdEY2DLPa1+7wz5hKeVDgDwFjGV7B2xF0hjyNXWsAzw==
X-Received: by 2002:a17:907:2e0b:b0:99c:5710:674a with SMTP id ig11-20020a1709072e0b00b0099c5710674amr879207ejc.37.1691009608266;
        Wed, 02 Aug 2023 13:53:28 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id gy26-20020a170906f25a00b00993470682e5sm9546008ejb.32.2023.08.02.13.53.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 13:53:28 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5223910acf2so3817a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Aug 2023 13:53:27 -0700 (PDT)
X-Received: by 2002:a50:ab4a:0:b0:522:4741:d992 with SMTP id
 t10-20020a50ab4a000000b005224741d992mr546238edc.4.1691009607276; Wed, 02 Aug
 2023 13:53:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230802095753.13644-1-sheng-liang.pan@quanta.corp-partner.google.com>
 <20230802175628.2.Ia4e268a027980f00c8fb0451a29938d76b765487@changeid>
In-Reply-To: <20230802175628.2.Ia4e268a027980f00c8fb0451a29938d76b765487@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 2 Aug 2023 13:53:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VvzdgmMYjeg=RAu-4OEA9mkB7Xu_jjMF-LkBzCP=qQ1A@mail.gmail.com>
Message-ID: <CAD=FV=VvzdgmMYjeg=RAu-4OEA9mkB7Xu_jjMF-LkBzCP=qQ1A@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Add sku_id for lazor/limozeen
To:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Aug 2, 2023 at 2:58=E2=80=AFAM Sheng-Liang Pan
<sheng-liang.pan@quanta.corp-partner.google.com> wrote:
>
> SKU ID 10: Lazor LTE+Wifi, no-esim (Strapped 0 X 0)
> SKU ID 15: Limozeen LTE+Wifi, TS, no esim (Strapped 1 X 0)
> SKU ID 18: Limozeen LTE+Wifi, no TS, no esim (Strapped X 0 0)
>
> Even though the "no esim" boards are strapped differently than
> ones that have an esim, the esim isn't represented in the
> device tree so the same device tree can be used for LTE w/ esim
> and LTE w/out esim.
>
> Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.googl=
e.com>
> ---
>
>  .../boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dts     | 2 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dts   | 2 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts        | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Looks fine to me. One nit is that in the ${SUBJECT} you probably want
"sc7180", so:

arm64: dts: qcom: sc7180: Add sku_id for lazor/limozeen

Once that's fixed feel free to include:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
