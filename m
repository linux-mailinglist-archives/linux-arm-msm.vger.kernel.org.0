Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FFB87E2A68
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 17:54:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231785AbjKFQyS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 11:54:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjKFQyR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 11:54:17 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AF4BB8
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 08:54:14 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9c603e235d1so693502866b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 08:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699289652; x=1699894452; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONrkCNODdlggpLA5mWEcjOQapfgKfPxTrYxnVyq0KIA=;
        b=MCQxBL/EN3IS+EF86mvVEvo9OnIePmfZnJqHCax285mDB7olT0gUtV1EIEykkQexA2
         8yyaBi4DJ9aW0L5nmfovYYkbHENOlTXe9aB9V1NBfecF6iiDTOC7LDB/W1GBwC8oZO6F
         9ih8F6EmMgMGlyx4HxXkKpm52J5BZcLQvsqfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699289652; x=1699894452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONrkCNODdlggpLA5mWEcjOQapfgKfPxTrYxnVyq0KIA=;
        b=s3w4CcIFY/IcWlNI1aBq1hT8taWh3udbkXZUEvmsi0z32ydt0G9zIxJalqbGqcTHQD
         AQbhiZYuiCLqUT6gcQmE87Wf9xbVyETsI4or8hluJSknmMw7oG2X/2Ta6Rie5VvWavLx
         TKUIrohPxKt6s6/Tslwx8/2WiVarWi8yhgCo4EjCvgMosjhbMlkGIq8g+iF9gT+dXRx/
         pMXSZul91RQHsDfvW+MaXnKnIf2o+xix6AlHSRMQ09UHKU+yX7CU43NPYs7WnlBP+tjP
         Kz/CAsH4dJhk1IzOh31+kvvt9bEZKi/iWC7abr3dUU+7rFddspFozt1JG0C/macu/Mro
         Xbig==
X-Gm-Message-State: AOJu0Yx0ysSrAzr7xKvmQP//vX0Z1XugFkKHuj2xbBFwZ/tv+Wgy5udd
        2oXUAHcH7hSlrPb5IzGzZUXz5HV9ImEOTaymoIQOkg==
X-Google-Smtp-Source: AGHT+IE7kz1j9LWGwtrgsnY8wdRSORTJOhRncpNnCs+8JsfMcjWXYONoeOO3spv9M+RgqHCG3vpZKg==
X-Received: by 2002:a17:906:da8a:b0:9ae:46c7:90fe with SMTP id xh10-20020a170906da8a00b009ae46c790femr15521603ejb.72.1699289652017;
        Mon, 06 Nov 2023 08:54:12 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id n16-20020a170906379000b009c5c5c2c59csm28746ejc.149.2023.11.06.08.54.11
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 08:54:11 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40837124e1cso127555e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 08:54:11 -0800 (PST)
X-Received: by 2002:a05:600c:4c19:b0:3f6:f4b:d4a6 with SMTP id
 d25-20020a05600c4c1900b003f60f4bd4a6mr146334wmp.7.1699289651347; Mon, 06 Nov
 2023 08:54:11 -0800 (PST)
MIME-Version: 1.0
References: <20231103105440.23904-1-quic_anshar@quicinc.com>
In-Reply-To: <20231103105440.23904-1-quic_anshar@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 6 Nov 2023 08:53:59 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XOyHr9hNA0gEdssGz5qqyXHU75K9TUH3HSHK3+jpfswg@mail.gmail.com>
Message-ID: <CAD=FV=XOyHr9hNA0gEdssGz5qqyXHU75K9TUH3HSHK3+jpfswg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Add capacity and DPC properties
To:     Ankit Sharma <quic_anshar@quicinc.com>
Cc:     cros-qcom-dts-watchers@chromium.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_ashayj@quicinc.com,
        quic_atulpant@quicinc.com, quic_rgottimu@quicinc.com,
        quic_shashim@quicinc.com, quic_pkondeti@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Nov 3, 2023 at 3:54=E2=80=AFAM Ankit Sharma <quic_anshar@quicinc.co=
m> wrote:
>
> The "capacity-dmips-mhz" and "dynamic-power-coefficient" are
> used to build Energy Model which in turn is used by EAS to take
> placement decisions. So add it to SC7280 soc.
>
> Signed-off-by: Ankit Sharma <quic_anshar@quicinc.com>
> ---
> changes in v2: https://lore.kernel.org/all/20231103095358.29312-1-quic_an=
shar@quicinc.com/
>  - updated commit message and subject.
>
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/q=
com/sc7280.dtsi
> index 8601253aec70..b1890824188c 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -176,6 +176,8 @@
>                                            &CLUSTER_SLEEP_0>;
>                         next-level-cache =3D <&L2_0>;
>                         operating-points-v2 =3D <&cpu0_opp_table>;
> +                       capacity-dmips-mhz =3D <1024>;
> +                       dynamic-power-coefficient =3D <100>;
>                         interconnects =3D <&gem_noc MASTER_APPSS_PROC 3 &=
mc_virt SLAVE_EBI1 3>,
>                                         <&epss_l3 MASTER_EPSS_L3_APPS &ep=
ss_l3 SLAVE_EPSS_L3_SHARED>;
>                         qcom,freq-domain =3D <&cpufreq_hw 0>;
> @@ -204,6 +206,8 @@
>                                            &CLUSTER_SLEEP_0>;
>                         next-level-cache =3D <&L2_100>;
>                         operating-points-v2 =3D <&cpu0_opp_table>;
> +                       capacity-dmips-mhz =3D <1024>;
> +                       dynamic-power-coefficient =3D <100>;
>                         interconnects =3D <&gem_noc MASTER_APPSS_PROC 3 &=
mc_virt SLAVE_EBI1 3>,
>                                         <&epss_l3 MASTER_EPSS_L3_APPS &ep=
ss_l3 SLAVE_EPSS_L3_SHARED>;
>                         qcom,freq-domain =3D <&cpufreq_hw 0>;
> @@ -227,6 +231,8 @@
>                                            &CLUSTER_SLEEP_0>;
>                         next-level-cache =3D <&L2_200>;
>                         operating-points-v2 =3D <&cpu0_opp_table>;
> +                       capacity-dmips-mhz =3D <1024>;
> +                       dynamic-power-coefficient =3D <100>;
>                         interconnects =3D <&gem_noc MASTER_APPSS_PROC 3 &=
mc_virt SLAVE_EBI1 3>,
>                                         <&epss_l3 MASTER_EPSS_L3_APPS &ep=
ss_l3 SLAVE_EPSS_L3_SHARED>;
>                         qcom,freq-domain =3D <&cpufreq_hw 0>;
> @@ -250,6 +256,8 @@
>                                            &CLUSTER_SLEEP_0>;
>                         next-level-cache =3D <&L2_300>;
>                         operating-points-v2 =3D <&cpu0_opp_table>;
> +                       capacity-dmips-mhz =3D <1024>;
> +                       dynamic-power-coefficient =3D <100>;
>                         interconnects =3D <&gem_noc MASTER_APPSS_PROC 3 &=
mc_virt SLAVE_EBI1 3>,
>                                         <&epss_l3 MASTER_EPSS_L3_APPS &ep=
ss_l3 SLAVE_EPSS_L3_SHARED>;
>                         qcom,freq-domain =3D <&cpufreq_hw 0>;
> @@ -273,6 +281,8 @@
>                                            &CLUSTER_SLEEP_0>;
>                         next-level-cache =3D <&L2_400>;
>                         operating-points-v2 =3D <&cpu4_opp_table>;
> +                       capacity-dmips-mhz =3D <1946>;

Though I don't think it's technically required, in other systems
(including the examples in the documentation) the biggest CPU gets
1024 "capacity-dmips-mhz" and the other ones are scaled to that.


> +                       dynamic-power-coefficient =3D <520>;
>                         interconnects =3D <&gem_noc MASTER_APPSS_PROC 3 &=
mc_virt SLAVE_EBI1 3>,
>                                         <&epss_l3 MASTER_EPSS_L3_APPS &ep=
ss_l3 SLAVE_EPSS_L3_SHARED>;
>                         qcom,freq-domain =3D <&cpufreq_hw 1>;
> @@ -296,6 +306,8 @@
>                                            &CLUSTER_SLEEP_0>;
>                         next-level-cache =3D <&L2_500>;
>                         operating-points-v2 =3D <&cpu4_opp_table>;
> +                       capacity-dmips-mhz =3D <1946>;
> +                       dynamic-power-coefficient =3D <520>;
>                         interconnects =3D <&gem_noc MASTER_APPSS_PROC 3 &=
mc_virt SLAVE_EBI1 3>,
>                                         <&epss_l3 MASTER_EPSS_L3_APPS &ep=
ss_l3 SLAVE_EPSS_L3_SHARED>;
>                         qcom,freq-domain =3D <&cpufreq_hw 1>;
> @@ -319,6 +331,8 @@
>                                            &CLUSTER_SLEEP_0>;
>                         next-level-cache =3D <&L2_600>;
>                         operating-points-v2 =3D <&cpu4_opp_table>;
> +                       capacity-dmips-mhz =3D <1946>;
> +                       dynamic-power-coefficient =3D <520>;
>                         interconnects =3D <&gem_noc MASTER_APPSS_PROC 3 &=
mc_virt SLAVE_EBI1 3>,
>                                         <&epss_l3 MASTER_EPSS_L3_APPS &ep=
ss_l3 SLAVE_EPSS_L3_SHARED>;
>                         qcom,freq-domain =3D <&cpufreq_hw 1>;
> @@ -342,6 +356,8 @@
>                                            &CLUSTER_SLEEP_0>;
>                         next-level-cache =3D <&L2_700>;
>                         operating-points-v2 =3D <&cpu7_opp_table>;
> +                       capacity-dmips-mhz =3D <1985>;
> +                       dynamic-power-coefficient =3D <552>;

The fact that cpu7 has different values for capacity-dmips-mhz and
dynamic-power-coefficient is surprising to me. I think what this means
is that at the same MHz this core can process more instructions than
the other big CPUs but that (at the same MHz) it burns more power
doing so. Is that really true? I thought that this core was
essentially the same as the other big cores but was simply anointed to
be able to run a little faster.


-Doug
