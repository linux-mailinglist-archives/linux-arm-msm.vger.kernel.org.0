Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96B7364360B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 21:51:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231851AbiLEUvS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 15:51:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbiLEUvR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 15:51:17 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F23E29359
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 12:51:16 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id l8so14925685ljh.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 12:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z2XpYiD/ntYKWMtGcoP22Vxvmru2pM1Nsi3jqANT0Rk=;
        b=cOSYWKjXUDbi5y3AIxWi01YF61DZ9ZNKMHn9yOgeHXmrxiv+s3K0CMfKoVSfUt3rjG
         0AKDtxond5QdIsglUBvFvFHjOjB80Bqhj86a+C74/tRnAF32bc4H0tVSW/C+G4XWtDyO
         PdooF6HHjlOX6eFwd4dLhkGgL3lDNIY6VhmmNhZDpP7mYuexMNzSnMmAtC4ebn/qjLK4
         WFqV5FcwvZMjuDJnj6Zw1HPacDdSDCCfB+/ALbU14rmAALSJfdjVBiZ4SVDfUKJd9jRm
         qG+f94wGkK/2KOc/SyqoEzG/2zt8ZSN/JgexZWos+WoO/YJjj3ss82+DHLsBMtbho7Sd
         0pzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z2XpYiD/ntYKWMtGcoP22Vxvmru2pM1Nsi3jqANT0Rk=;
        b=gm0rt2z1OzPQ2nvEE7ARLvysCFY2k8ZDNbg/xYuuslPWVSUFHarse1XmdXsWPvV3PW
         SOchSZZMd+35wT/uXBHnaBZwOQbP3azWgM6otpBdUTbJkv8TxXpdbWNOXEncBElwwWZK
         1WP1XvRhaSO86FzcO8kvEXh5MF3XkPfumlUGIJBKzosXv+VUZJIYzs80+dGyzVgGhaJK
         k1DOtPWdHylSAHBwEiLlgbvKVZVJTlquWdpxlmSb/lHuH3PgkBXZ0HOUGHzrNpXu2kYv
         aRzhkciJWllkaZ0hMO8VWp/+HR3ABt9oWkT1WSYk1ge36NVeQmCOVpR8Mv8q3p4HnPsf
         4zLw==
X-Gm-Message-State: ANoB5pkR3jmeqFtoW3Dkq8gMFT0CE5ig30KwaompnzdtxNc7cA09qCau
        T+D+Z/Dr2wupiD3/f1V2mdoD0A==
X-Google-Smtp-Source: AA0mqf7SyCarcsRC8IOaK+qAfXMjpkGjzn1YGRp10LvTsSAbg66dy+LzP+D/fg9rb7Tk/wTKQLbJCQ==
X-Received: by 2002:a2e:a37c:0:b0:26e:93:980d with SMTP id i28-20020a2ea37c000000b0026e0093980dmr28205439ljn.488.1670273474926;
        Mon, 05 Dec 2022 12:51:14 -0800 (PST)
Received: from [127.0.0.1] ([94.25.229.129])
        by smtp.gmail.com with ESMTPSA id q8-20020a19f208000000b0048b0696d0b1sm2217877lfh.90.2022.12.05.12.51.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Dec 2022 12:51:14 -0800 (PST)
Date:   Mon, 05 Dec 2022 23:49:08 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        airlied@gmail.com
CC:     quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v8_1/5=5D_arm64=3A_dts=3A_qcom=3A_add_data-?= =?US-ASCII?Q?lanes_and_link-freuencies_into_dp=5Fout_endpoint?=
User-Agent: K-9 Mail for Android
In-Reply-To: <1670267670-15832-2-git-send-email-quic_khsieh@quicinc.com>
References: <1670267670-15832-1-git-send-email-quic_khsieh@quicinc.com> <1670267670-15832-2-git-send-email-quic_khsieh@quicinc.com>
Message-ID: <0E711F23-A5C6-4AA1-A4EF-F6097ADA91AE@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5 December 2022 22:14:26 GMT+03:00, Kuogee Hsieh <quic_khsieh@quicinc=
=2Ecom> wrote:
>Move data-lanes property from mdss_dp node to dp_out endpoint=2E Also
>add link-frequencies property into dp_out endpoint as well=2E The last
>frequency specified at link-frequencies will be the max link rate
>supported by DP=2E
>
>Changes in v5:
>-- revert changes at sc7180=2Edtsi and sc7280=2Edtsi
>-- add &dp_out to sc7180-trogdor=2Edtsi and sc7280-herobrine=2Edtsi
>
>Changes in v6:
>-- add data-lanes and link-frequencies to yaml
>
>Changes in v7:
>-- change 160000000 to 1620000000
>-- separate yaml to different patch
>
>Changes in v8:
>-- correct Bjorn mail address to kernel=2Eorg
>
>Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc=2Ecom>
>---
> arch/arm64/boot/dts/qcom/sc7180-trogdor=2Edtsi   | 6 +++++-
> arch/arm64/boot/dts/qcom/sc7280-herobrine=2Edtsi | 6 +++++-
> 2 files changed, 10 insertions(+), 2 deletions(-)
>
>diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor=2Edtsi b/arch/arm64/=
boot/dts/qcom/sc7180-trogdor=2Edtsi
>index eae22e6=2E=2E0ad50e2 100644
>--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor=2Edtsi
>+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor=2Edtsi
>@@ -814,7 +814,11 @@ hp_i2c: &i2c9 {
> 	status =3D "okay";
> 	pinctrl-names =3D "default";
> 	pinctrl-0 =3D <&dp_hot_plug_det>;
>-	data-lanes =3D <0 1>;
>+};
>+
>+&dp_out {
>+    data-lanes =3D <0  1>;
>+    link-frequencies =3D /bits/ 64 <162000000 270000000 540000000>;

This property still uses old values, it was not updated to Hz=2E

> };
>=20
> &pm6150_adc {
>diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine=2Edtsi b/arch/arm6=
4/boot/dts/qcom/sc7280-herobrine=2Edtsi
>index c11e371=2E=2E3c7a9d8 100644
>--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine=2Edtsi
>+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine=2Edtsi
>@@ -442,7 +442,11 @@ ap_i2c_tpm: &i2c14 {
> 	status =3D "okay";
> 	pinctrl-names =3D "default";
> 	pinctrl-0 =3D <&dp_hot_plug_det>;
>-	data-lanes =3D <0 1>;
>+};
>+
>+&dp_out {
>+	data-lanes =3D <0  1>;
>+	link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000 810000=
0000>;
> };
>=20
> &mdss_mdp {

--=20
With best wishes
Dmitry
