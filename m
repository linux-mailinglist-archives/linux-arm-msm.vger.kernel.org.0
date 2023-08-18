Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B02157805F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Aug 2023 08:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358061AbjHRGrs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Aug 2023 02:47:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358066AbjHRGr3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Aug 2023 02:47:29 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71DC410C8
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 23:47:28 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-44bf85e9b39so206195137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 23:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692341247; x=1692946047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsuQn1BxTC8Yj1I6NI1mDMJ9aPHe50M4YRpGUAh4E7A=;
        b=2lOK4wJZJPLwZ8kz2P9O3QHT7HcNS6UKUVtRKife3/nFLpq8tlLis+j54/E15SwPoI
         jl7qmqR9ZZxzv8HkttAP7sWoCfYhqLXqMRAGP67NnIxGjNrnBQ1elAmSgwCrpxwPLmYz
         bvW8trmaSQ1PCL4oIzXcHi3k85qTn4beWj2NudqUCPABZoVDPkZ3fBrVGtNb07LOb/M+
         Rh8ymQfkHsn9kK0SwxlaNqrv8kMwj1udnlVZVUtV4jo9CKCk8FfEFMh6o9G+Ka5PEpDk
         hyP8Q4bqADSsxTYsxUIAMHESX7rUqIHc1gNJIvxqnltT285HN9mG6mLomPv7uupK/EXI
         ++Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692341247; x=1692946047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsuQn1BxTC8Yj1I6NI1mDMJ9aPHe50M4YRpGUAh4E7A=;
        b=UYs6RM5LYA+MuA++EQ7+zsPRXlBxRCP3qLjT3xW7t6B8Vn2zsp0RDtn/U53gs3y0kz
         GqoU0d3pILUygoEavgMQX+6GdAYTl9q7CgCUAxzE+Og7Q+1HIEYTTo3OfSVW6opH2cuG
         CGxwM9hj9jSdNg0B3+gcMo3gLGbKoik32+QqQCYxgjO7oej39PbeEVcbCh0UZDKp/MHa
         joQ95xJUzTTd7faQc+0ppI+IO+gJfrhwZpBNnS76XJFd2WSOv8ceYGSxqDDZrvW1VpHf
         DIBkJZq+bpxPkcGwPxEMbui9SljM5w1ysqDn/cr9W/yzRpgNVGpyWDyelMtiWr8Jcv//
         1S6A==
X-Gm-Message-State: AOJu0YwXhbOmpg5zJKSVQHP2nYTk1gbi7aPBUPK/Jv9mTzT+4xbzeclZ
        PL/ZbHS2lu9OPWQV3y+WsD52CCHH+lBD/4gKRxkFlw==
X-Google-Smtp-Source: AGHT+IEtDT2/+FR+A97ceifdC7PqyHRqllmyGGmnrEAcdJw7eiDFdrPcJB9HZEAN6AFPZyBG7c6t3d6KdUqWM1Z2B48=
X-Received: by 2002:a05:6102:317a:b0:443:92dc:51ce with SMTP id
 l26-20020a056102317a00b0044392dc51cemr1350719vsm.35.1692341247562; Thu, 17
 Aug 2023 23:47:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230817213815.638189-1-ahalaney@redhat.com> <20230817213815.638189-3-ahalaney@redhat.com>
In-Reply-To: <20230817213815.638189-3-ahalaney@redhat.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 18 Aug 2023 08:47:16 +0200
Message-ID: <CAMRc=MfVe7W1Jj6UVJ==GWaP-eFeWRyfcHuuTFvc+bQEYcpV5Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sa8775p-ride: Describe sgmii_phy1 irq
To:     Andrew Halaney <ahalaney@redhat.com>
Cc:     andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 17, 2023 at 11:38=E2=80=AFPM Andrew Halaney <ahalaney@redhat.co=
m> wrote:
>
> There's an irq hooked up, so let's describe it.
>
> Prior to commit 9757300d2750
> ("pinctrl: qcom: Add intr_target_width field to support increased number =
of interrupt targets")
> one would not see the IRQ fire, despite some (invasive) debugging
> showing that the GPIO was in fact asserted, resulting in the interface
> staying down.
>
> Now that the IRQ is properly routed we can describe it.
>
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/=
dts/qcom/sa8775p-ride.dts
> index 8fde6935cd6e..9760bb4b468c 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> @@ -295,6 +295,7 @@ sgmii_phy1: phy@a {
>                         compatible =3D "ethernet-phy-id0141.0dd4";
>                         reg =3D <0xa>;
>                         device_type =3D "ethernet-phy";
> +                       interrupts-extended =3D <&tlmm 26 IRQ_TYPE_EDGE_F=
ALLING>;
>                         reset-gpios =3D <&pmm8654au_2_gpios 9 GPIO_ACTIVE=
_LOW>;
>                         reset-assert-us =3D <11000>;
>                         reset-deassert-us =3D <70000>;
> --
> 2.41.0
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
