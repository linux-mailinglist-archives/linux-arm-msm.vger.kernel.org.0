Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9618C6D0DC7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 20:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231322AbjC3Sb4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 14:31:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230423AbjC3Sbz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 14:31:55 -0400
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A12E4681
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 11:31:54 -0700 (PDT)
Received: by mail-vs1-xe2c.google.com with SMTP id dg15so5413833vsb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 11:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680201111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bmgWM4VeyB5ih4GlZbThd/2eiyQX/X/Evx0/5WbwLA=;
        b=n7Fbcx5kLC5PQCrKOLLphRB+Qj+CJ1V2n+6VE2q9x8tgdTfNT/TvljT9Ud5D0Sev+I
         jSx0/mE5wPBJBUslQrVt+msUKR8oj3psvddiRCxHXDNcC7JwUdR4++FURzyQa2lH2oPP
         QrylpyoNqKGTbaDitz5XTgPk8P5ruj9xa1qC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680201111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6bmgWM4VeyB5ih4GlZbThd/2eiyQX/X/Evx0/5WbwLA=;
        b=5qHP6AgByxDs4qCkOTe48nNC9ky6x9+T9GY0Splg51gpJ46XoK6FYg1yTaKl5ubUM8
         xLKa04x0IKt9IcyXH8VcFnTFifLewXEz0ouN2IRkhBfM1R7OBw67KxxKhuemHsebobBi
         1PoUCHy4d+0F95g4DKDTYSXJF97KPpWST6KmD4p4QgfCImqUhiaDLJf4edav23suj/wU
         ch5Ht4RwKjqpA2+iagT9uoOCd3pRI4AZskFkcrI1Cs9iYdKzxfYUF3hPZ69ThI3aHxYk
         CcDhmrVi/terPcj/VqUsPx18QButMs+dyptOxOIs1TwYC2zZ8M0Jvsne6qasfAbNpVqe
         gI3g==
X-Gm-Message-State: AAQBX9dPpSix6qb4235lXpdRya4iO8dqx9S+DQfNHnLwfL2xWtTldN/l
        i1pQkYtLJWpG8gkAr9OdDRsI41S7HpoK21zOkVs=
X-Google-Smtp-Source: AKy350aWcqu3gCOXLEGIoXaPVRME1+fI8AfHGgtUhhlqb8+0AuuH4rJ0zh3ARE5LPi2VYmW53WBR+w==
X-Received: by 2002:a05:6102:da:b0:426:60b:34f2 with SMTP id u26-20020a05610200da00b00426060b34f2mr8393596vsp.30.1680201111169;
        Thu, 30 Mar 2023 11:31:51 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id j185-20020a676ec2000000b004122a65ee17sm4864384vsc.21.2023.03.30.11.31.50
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 11:31:50 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id d18so17037441vsv.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 11:31:50 -0700 (PDT)
X-Received: by 2002:a67:c18a:0:b0:425:cf00:e332 with SMTP id
 h10-20020a67c18a000000b00425cf00e332mr13402479vsj.7.1680201109830; Thu, 30
 Mar 2023 11:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230324195555.3921170-1-markyacoub@google.com> <20230324195555.3921170-10-markyacoub@google.com>
In-Reply-To: <20230324195555.3921170-10-markyacoub@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 30 Mar 2023 11:31:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xvu++Bvkkq+xORUB0OWq_49nupFgCqsbX0XJz8vgy0Zw@mail.gmail.com>
Message-ID: <CAD=FV=Xvu++Bvkkq+xORUB0OWq_49nupFgCqsbX0XJz8vgy0Zw@mail.gmail.com>
Subject: Re: [PATCH v7 09/10] arm64: dts: qcom: sc7180: Add support for HDCP
 in dp-controller
To:     Mark Yacoub <markyacoub@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        seanpaul@chromium.org, suraj.kandpal@intel.com,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Fri, Mar 24, 2023 at 12:56=E2=80=AFPM Mark Yacoub <markyacoub@chromium.o=
rg> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> Add the register ranges required for HDCP key injection and
> HDCP TrustZone interaction as described in the dt-bindings for the
> sc7180 dp controller.
>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
>
> ---
> Changes in v3:
> -Split off into a new patch containing just the dts change (Stephen)
> -Add hdcp compatible string (Stephen)
> Changes in v4:
> -Rebase on Bjorn's multi-dp patchset
> Changes in v5:
> -Put the tz register offsets in trogdor dtsi (Rob C)
> Changes in v6:
> -Rebased: Removed modifications in sc7180.dtsi as it's already upstream
> Changes in v7:
> -Change registers offset
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/bo=
ot/dts/qcom/sc7180-trogdor.dtsi
> index 47f39c547c41a..63183ac9c3c48 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -816,6 +816,14 @@ &mdss_dp {
>         status =3D "okay";
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&dp_hot_plug_det>;
> +
> +       reg =3D <0 0x0ae90000 0 0x200>,
> +             <0 0x0ae90200 0 0x200>,
> +             <0 0x0ae90400 0 0xc00>,
> +             <0 0x0ae91000 0 0x400>,
> +             <0 0x0ae91400 0 0x400>,
> +             <0 0x0aed1000 0 0x174>,
> +             <0 0x0aee1000 0 0x2c>;

Reviewed-by: Douglas Anderson <dianders@chromium.org>
