Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B75F36C33E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 15:18:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230337AbjCUOR7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 10:17:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230141AbjCUOR6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 10:17:58 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6C6EB472
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 07:17:50 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id q14so1296591ljm.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 07:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679408269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMn7LHKKTu4Ns9vFmGoBtS8cTIhQAr15IAlChqCRIjg=;
        b=XNmIG6LCixSgb0IbQeT7vxzIHWMRiNclEzB7QBxzg+WYYt2jEZNuEIrOFo2bGCmdk2
         Sjbl+pBpHvovFPW7yF74xFa4B9WUOkxNhoOge0xavCIjfKbZm4JB+4EAhBPBlvwGZZcg
         xP05I38BIyJxDjUtlct1p3PRgWTylor6TbfUlQvxXA4gFsGMxyK2kNGgsMLi1ScKip7Q
         OXhhehwButp4x98UVyIvVYHQPAuP+8HzSjqvtI3KBwSA1HJG2tScxkEaca4/9cKGFdFg
         WsrKIgUgJ7Xi70lJPWPUs6V2WIBG/muqmycPiNNF3jnlNez3kTH45mqbrnPYvE2aRsOh
         utrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679408269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMn7LHKKTu4Ns9vFmGoBtS8cTIhQAr15IAlChqCRIjg=;
        b=ckWm+y63oFunb483fk16Ys40TpULaywlMKffy/vp6cPS9oP5cfE5NKVhlZU8gTDLT1
         GgjqBRHbfjUFQXkrzWfLk+4AWmM2OaGmlbC2VU+O0/YjjJ7sAptpjrEfAzXFT8OtmS8f
         F5cgzIzF2GczupN3axevNsSwrEQGKZtBtqqwb2YcbMRPI6SH/GXIX+LR8/uIduGj4+GN
         5Mp4IBer7fs2tqQ4lZLrvxnjJn6QNri4op9ODbxE+lCCQ1rxgjdhJ4SHTePNPVTXeyT3
         GAML9X5fpvGmlcRm9jR4B7wRxm49fIXm87KJnH0E2672FJ6OzOFoqcT/2+Y8X6Eo6mSM
         Bwpg==
X-Gm-Message-State: AO0yUKUHJkc9p0Qw2gCg5cDXWo6ZHNdAnCG30hZ760tyzdeHnmRCbEnO
        Y5JJM17vT9ShKeNwK4oPyWYzC5S/TScuDBB/e1wJbw==
X-Google-Smtp-Source: AK7set8b0x6Hc/6GcdfBaiyGfeNfULbWOK7+qOwTD2eBr42E8cIkkxgtVYted3CNCO2pKDyXkWKZbmkwrodDXaQN4ck=
X-Received: by 2002:a2e:901a:0:b0:299:aa7a:94c8 with SMTP id
 h26-20020a2e901a000000b00299aa7a94c8mr896022ljg.10.1679408269057; Tue, 21 Mar
 2023 07:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230320154841.327908-1-brgl@bgdev.pl> <20230320154841.327908-10-brgl@bgdev.pl>
 <65d15d82-c106-b0a7-11b4-703bf22c28b1@linaro.org> <c74e0683-304d-7571-1d22-c2c65d02dc6a@linaro.org>
In-Reply-To: <c74e0683-304d-7571-1d22-c2c65d02dc6a@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 21 Mar 2023 15:17:35 +0100
Message-ID: <CAMRc=McNAy_08es7CRwhyE+OGHM-+GSsd0xGJNAdNcOs9eNq7Q@mail.gmail.com>
Subject: Re: [PATCH v2 09/15] arm64: dts: qcom: sa8775p: add the Power On
 device node
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,T_SPF_TEMPERROR
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 20, 2023 at 6:25=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
>
>
> On 20.03.2023 18:23, Konrad Dybcio wrote:
> >
> >
> > On 20.03.2023 16:48, Bartosz Golaszewski wrote:
> >> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>
> >> Add the PON node to PMIC #0 for sa8775p platforms.
> >>
> >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >> ---
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >
> > Konrad
> Hold up, I am not sure if PBS is there on PMM8654AU. Check the
> -pmic-overlay.dtsi.
>

Yep, it's there alright.

Bartosz

> Konrad
> >>  arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/=
boot/dts/qcom/sa8775p-pmics.dtsi
> >> index afe220b374c2..dbc596e32253 100644
> >> --- a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> >> @@ -12,6 +12,14 @@ pmm8654au_0: pmic@0 {
> >>              reg =3D <0x0 SPMI_USID>;
> >>              #address-cells =3D <1>;
> >>              #size-cells =3D <0>;
> >> +
> >> +            pmm8654au_0_pon: pon@1200 {
> >> +                    compatible =3D "qcom,pmk8350-pon";
> >> +                    reg =3D <0x1200>, <0x800>;
> >> +                    reg-names =3D "hlos", "pbs";
> >> +                    mode-recovery =3D <0x1>;
> >> +                    mode-bootloader =3D <0x2>;
> >> +            };
> >>      };
> >>
> >>      pmm8654au_1: pmic@2 {
