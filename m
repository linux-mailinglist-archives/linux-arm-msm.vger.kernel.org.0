Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9583F64ACE7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 02:18:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234004AbiLMBSI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 20:18:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbiLMBSI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 20:18:08 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EA4BDEBC
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 17:18:07 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id j4so2560950lfk.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 17:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RfH8kkxJvYDkHZoR/+BVEo4zBkqyra3aG6rgjb414Ng=;
        b=L8/+nHhrB5o0UVC+DKEp6OeXAyYCcbQ1Gx+fHf44e2LTIul/4cVxGKqcx3N+vzNBuM
         D86JhEjjQbXnaeOn8Has1S8iUh5QKw8Z/GeDuUlA8yZzqFP4A/ojkv0L/gna0H99D6gb
         KQ+Gsm5idOZ4nS79g350yi8jbzLAF3h+yhkelLeM+Xfp1TuQzZycHizPtYE47i9ka8O+
         9BRgB8JyULLNxJHlReyXVL/98W3jnVOj8TQWwdDeBJNMbIOKlzCis0v5n8PmI1B4YDAm
         haVrOtxFuhKoh1wZ+7Vi0Ryy/9A4UgVDyfaIhkMXJKh7zigztGY7XQyC2OmzVTFIvXJE
         hmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RfH8kkxJvYDkHZoR/+BVEo4zBkqyra3aG6rgjb414Ng=;
        b=OwwsO9/vgWyC2KiEm8epTI8KN7kDa1WBPY5/LRat/OR7VNmeGHF7xME2g76vur5K4e
         7GE6y/B7MLqeiINPGGt0gY5gI6FrAF8B7kePwWTnV3h3JCU3ZysLPIat4b8/UPBzej0y
         gdG9/7RFcEMcZyrmGjElIWgIZ3NdlrA0saZimW/26xGBZO5IECEaTLump07W5hLHXa3a
         lg/pI4kuwEH7qDIdoLt0lJmmZW2Gt7Fh7gwpNAey42mDNFMgyuaA7PuD4p2EUmZGFJQx
         4uSAPnj0BnpHKL8/HU6gYAwaIzznZRdoyQwQk5+W0GJtFdauKRsqOVU2bHiLAd5hzb4K
         eWeQ==
X-Gm-Message-State: ANoB5pmcf70WpaOZH2PJbUwsYhZel1QSkQl9vo11On9xxrqQy3EYh/DW
        A5pP9aixUAhLKnBbvwEFbdLULA==
X-Google-Smtp-Source: AA0mqf4NCJGtrfXxBc+iPdhZjn5t+SS+bxDYJ+lmD2OeQt33SGuvuPsJ+J8h19c5b0KrraKt06Jjog==
X-Received: by 2002:ac2:4e4e:0:b0:4a4:68b9:608a with SMTP id f14-20020ac24e4e000000b004a468b9608amr3963518lfr.21.1670894285445;
        Mon, 12 Dec 2022 17:18:05 -0800 (PST)
Received: from [127.0.0.1] ([94.25.229.107])
        by smtp.gmail.com with ESMTPSA id t17-20020a195f11000000b004ac980a1ba1sm158445lfb.24.2022.12.12.17.18.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Dec 2022 17:18:05 -0800 (PST)
Date:   Tue, 13 Dec 2022 04:18:00 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Eric Chanudet <echanude@redhat.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andrew Halaney <ahalaney@redhat.com>,
        Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: pm8450a: add rtc node
User-Agent: K-9 Mail for Android
In-Reply-To: <20221213005539.1133443-1-echanude@redhat.com>
References: <20221213005539.1133443-1-echanude@redhat.com>
Message-ID: <219F5CF2-BA91-4749-A32C-84BCF541ECE0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13 December 2022 03:55:38 GMT+03:00, Eric Chanudet <echanude@redhat=2Ec=
om> wrote:
>Add the rtc block on pm8450a first pmic to enable the rtc for
>sa8540p-ride=2E
>
>Signed-off-by: Eric Chanudet <echanude@redhat=2Ecom>
>---
> arch/arm64/boot/dts/qcom/pm8450a=2Edtsi | 8 ++++++++
> 1 file changed, 8 insertions(+)
>
>diff --git a/arch/arm64/boot/dts/qcom/pm8450a=2Edtsi b/arch/arm64/boot/dt=
s/qcom/pm8450a=2Edtsi
>index 34fc72896761=2E=2Eaf761dbfbc66 100644
>--- a/arch/arm64/boot/dts/qcom/pm8450a=2Edtsi
>+++ b/arch/arm64/boot/dts/qcom/pm8450a=2Edtsi
>@@ -13,6 +13,14 @@ pm8450a: pmic@0 {
> 		#address-cells =3D <1>;
> 		#size-cells =3D <0>;
>=20
>+		rtc@6000 {
>+			compatible =3D "qcom,pm8941-rtc";
>+			reg =3D <0x6000>;
>+			reg-names =3D "rtc", "alarm";
>+			interrupts =3D <0x0 0x61 0x1 IRQ_TYPE_NONE>;


0x60?

>+			wakeup-source;
>+		};
>+
> 		pm8450a_gpios: gpio@c000 {
> 			compatible =3D "qcom,pm8150-gpio", "qcom,spmi-gpio";
> 			reg =3D <0xc000>;

--=20
With best wishes
Dmitry
