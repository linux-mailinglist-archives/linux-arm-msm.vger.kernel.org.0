Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B379F672771
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 19:48:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbjARSsB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 13:48:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjARSsA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 13:48:00 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C497765BC
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 10:47:58 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id v13so16809350eda.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 10:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nt8IHofNDa8Mu8tT1igfMGgh2uyandrXwyOL8Q0fB1c=;
        b=ue4sHDOMNYi0CyHRFgoNJ4AKTkG1czfNAytCUSTOpXV9ZhyPhVD8Y12ZFlgwnCKQWS
         E4kJBtzwxYHJqMoi2G1wtcND3qS0tUjnZVCQl2mOE5XdGTmpho1Iwe30Naua3oXsUcmP
         3ajuMNajb5kZtygddZ2sqG2nRSDMZ4GhBgXAgv1lqW3EpaymoRXXKId79nsDM3jHf3Ew
         xbWemNZKXFTRgEdI+y3ztjGvdnu9hGHQgvIcVCWSfkYPl7jrzfn8F/iVLe7hye6pUbN3
         r5i4i9F+66gaSOfd4oj4agEpSiQM7+uFI7s8x4vDC4xTbhtZ+92UYG6RQQQ19htJc7AX
         61cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nt8IHofNDa8Mu8tT1igfMGgh2uyandrXwyOL8Q0fB1c=;
        b=cez5QyasCvlde55GsCKC4z2UYWrQsd3zNvAiA8gJlHVT/PP2mRA9cTwYKfyx6hiTgv
         KdHkbHPtBRsRWPud3h0oibl5OVgtBDGPUcQ/q43qpvu12QSefJVkQPyQyHObZ+CdVBaS
         kLlIkdywP8LTBIdYruLV5XUETM1khbcuj14cWr5NgKqj6EJTrDhZEaObtyxOmCO9BPtl
         i0JA1UMmWzfi49u7UnHJ1OMmZDsrpkw1QS2RtjcpcP7F8z65MbNpkQsxqj08m2ewyi+U
         +5L30TsnHRXG8/GqLaLYjJpnKhWV1XmDsxwUbCTWhph+R121MHn7+Ezt6/OHE5allKLc
         jrLg==
X-Gm-Message-State: AFqh2kovYG4bmVjh9Qrhytw5VtD9B5WGPfKf3uON9Po4yBkWeD13Ml6O
        zJWsRvBxyYhPIoWMJlBDmGlJqw==
X-Google-Smtp-Source: AMrXdXuYTCnoM2KlVPwNpadyDQHasWZlB7NOsoaQkROQWKm2SsJH81KvYQmvDehk+vT/R11vTktCpw==
X-Received: by 2002:aa7:c994:0:b0:499:bf81:be6 with SMTP id c20-20020aa7c994000000b00499bf810be6mr8436270edt.37.1674067677395;
        Wed, 18 Jan 2023 10:47:57 -0800 (PST)
Received: from [127.0.0.1] (85-76-70-3-nat.elisa-mobile.fi. [85.76.70.3])
        by smtp.gmail.com with ESMTPSA id d2-20020a056402000200b0049e09105705sm4840800edu.62.2023.01.18.10.47.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 10:47:57 -0800 (PST)
Date:   Wed, 18 Jan 2023 20:47:53 +0200
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>
CC:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH=5D_arm64=3A_dts=3A_qcom=3A_add_devi?= =?US-ASCII?Q?ce_tree_for_DB845c_working_in_dual_DSI_mode?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20230118173242.cjh5izohjros6wxd@builder.lan>
References: <20230118082048.2198715-1-dmitry.baryshkov@linaro.org> <20230118173242.cjh5izohjros6wxd@builder.lan>
Message-ID: <DFBA966D-3AAF-4E6D-880C-897CB901AEE1@linaro.org>
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

18 =D1=8F=D0=BD=D0=B2=D0=B0=D1=80=D1=8F 2023 =D0=B3=2E 19:32:42 GMT+02:00, =
Bjorn Andersson <andersson@kernel=2Eorg> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>On Wed, Jan 18, 2023 at 10:20:48AM +0200, Dmitry Baryshkov wrote:
>> While we are testing the DB845c working in dual DSI mode (which is
>> required for the 4k support), create a separate device tree using this
>> configuration=2E
>>=20
>
>I don't think it's right to change the DTB on your device depending on
>your TV's ability to do 4k or not=2E=2E=2E
>
>I ran into this problem when playing around with 4k-support on the RB3
>as well a while back=2E I was not able to figure out a way to run the
>lt9611 off two inputs for the lower resolutions and ended never posted
>anything because I couldn't come up with any good solution=2E


This is implemented with the latest lt9611 patchset, referenced in the pat=
ch annotation=2E

I posted this as an RFC with the separate dts to let people test dual DSI,=
 DPU wide planes, etc=2E and to compare that with plain old single link DSI=
/lt9611=2E=20

>
>
>Would it be possible somehow to describe the two ports in DT, but have
>the display driver use one or both depending on the number of inputs
>needed by the lt9611?

This would be very problemsome=2E Even switching the number of lanes goes =
against the standard and is not supported by Linux kernel=2E Supporting swi=
tching the host off and on would be a real troublle=2E

Hopefully, this is is not necessary=2E

>
>Regards,
>Bjorn
>
>> Signed-off-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>> ---
>>=20
>> Dependencies to be able to verify the 4k@30 mode:
>> [1] https://lore=2Ekernel=2Eorg/linux-arm-msm/20221229191856=2E3508092-=
1-dmitry=2Ebaryshkov@linaro=2Eorg/
>> [2] https://lore=2Ekernel=2Eorg/dri-devel/20230118081658=2E2198520-1-dm=
itry=2Ebaryshkov@linaro=2Eorg/
>>=20
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile             |  1 +
>>  =2E=2E=2E/boot/dts/qcom/sdm845-db845c-dual-dsi=2Edts  | 48 +++++++++++=
++++++++
>>  2 files changed, 49 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/sdm845-db845c-dual-dsi=2Ed=
ts
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qc=
om/Makefile
>> index 3e79496292e7=2E=2Edc55c3b989a4 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -139,6 +139,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+=3D sdm845-cheza-r1=2Edtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+=3D sdm845-cheza-r2=2Edtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+=3D sdm845-cheza-r3=2Edtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+=3D sdm845-db845c=2Edtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+=3D sdm845-db845c-dual-dsi=2Edtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+=3D sdm845-db845c-navigation-mezzanine=2Edtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+=3D sdm845-lg-judyln=2Edtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+=3D sdm845-lg-judyp=2Edtb
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-dual-dsi=2Edts b/ar=
ch/arm64/boot/dts/qcom/sdm845-db845c-dual-dsi=2Edts
>> new file mode 100644
>> index 000000000000=2E=2E4a366dedc841
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-dual-dsi=2Edts
>> @@ -0,0 +1,48 @@
>> +// SPDX-License-Identifier: GPL-2=2E0
>> +/*
>> + * Copyright (c) 2023, Linaro Ltd=2E
>> + */
>> +
>> +#include "sdm845-db845c=2Edts"
>> +
>> +&dsi0 {
>> +	qcom,dual-dsi-mode;
>> +	qcom,master-dsi;
>> +};
>> +
>> +&dsi1 {
>> +	vdda-supply =3D <&vreg_l26a_1p2>;
>> +
>> +	qcom,dual-dsi-mode;
>> +
>> +	/* DSI1 is slave, so use DSI0 clocks */
>> +	assigned-clock-parents =3D <&dsi0_phy 0>, <&dsi0_phy 1>;
>> +
>> +	status =3D "okay";
>> +
>> +	ports {
>> +		port@1 {
>> +			endpoint {
>> +				remote-endpoint =3D <&lt9611_b>;
>> +				data-lanes =3D <0 1 2 3>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&dsi1_phy {
>> +	vdds-supply =3D <&vreg_l1a_0p875>;
>> +	status =3D "okay";
>> +};
>> +
>> +&lt9611_codec {
>> +	ports {
>> +		port@1 {
>> +			reg =3D <1>;
>> +
>> +			lt9611_b: endpoint {
>> +				remote-endpoint =3D <&dsi1_out>;
>> +			};
>> +		};
>> +	};
>> +};
>> --=20
>> 2=2E39=2E0
>>=20

