Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 515C57250D5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jun 2023 01:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233747AbjFFXeb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jun 2023 19:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234125AbjFFXea (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jun 2023 19:34:30 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED89E170D
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jun 2023 16:34:28 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-3f6a494810fso58520651cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jun 2023 16:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686094466; x=1688686466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGFunOEezrTgCZyEfU8nDw4x9+xyVAO+9lV0ZlJ/tsM=;
        b=laZFZ4ATTRuY1Sb0zf69tfd/kW0R3ojrHzbDo/x9VN7ppMXSDPmUUVbMPmqZwQj9bd
         XZO22K0NJnvi4ZVe2bYaFDtXG4zYSfoARVtAkWS3zIaUS6VGC+aq2h+nZrH65knE4GI+
         VJlMxBCMQCOaDS52XgG1kUpixuWd34xzLWv3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686094466; x=1688686466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGFunOEezrTgCZyEfU8nDw4x9+xyVAO+9lV0ZlJ/tsM=;
        b=FtnEV0NzfhAFO8c19JzyOU71nCuUm2IwblXGqHWkiYc2fqGzNE6GLa0QQ4NvnsV+Op
         40pCPHJR6xKLkwR9qJ5QEarMep2XDpwey6aMnHKWyyCrSrrEFtaK1hR/OTipAPa0pQHh
         K8T0pNd6ahOXEkb5CABGKkDHRnWgjqBNZH0sR9r4PquPyshOba17OFWcEvGRo0/lT9jU
         AgPSvZJ7uud5s8kFv5zBWF/L7dHQ6wSS2fKxOGFQ+kWJolsBGmvNY0C7/X6RFs6kaZ6w
         PVd5ptre9JQMAWEFGxyxgAJQzLJQ8zLd/DKA9oRZIe2FZwrUNradlEnI8SCc7b6uAoAr
         Kf9w==
X-Gm-Message-State: AC+VfDwAI9tMaNoPIzFXHnXBl2OC+hb62ZhzgdhGzWZ9rLQUucXc5vCp
        zngEn3MZGWfYhaLA3PHK4sHag4j+35pe6Vafzbs=
X-Google-Smtp-Source: ACHHUZ5vL5XkUXIOZMSjtZy3Ju7wJF8i3u/UNq4oTvDRc2ZTyWvgQmS+CimHCCTF+wSkPKgVNkpEkQ==
X-Received: by 2002:a05:622a:1812:b0:3f6:9ca4:8a27 with SMTP id t18-20020a05622a181200b003f69ca48a27mr1816814qtc.8.1686094466109;
        Tue, 06 Jun 2023 16:34:26 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com. [209.85.160.170])
        by smtp.gmail.com with ESMTPSA id t9-20020a05622a01c900b003f4e18bfa06sm5907951qtw.60.2023.06.06.16.34.24
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 16:34:25 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-3f6c6320d4eso46841cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jun 2023 16:34:24 -0700 (PDT)
X-Received: by 2002:a05:622a:547:b0:3f8:1a01:e933 with SMTP id
 m7-20020a05622a054700b003f81a01e933mr67672qtx.24.1686094464496; Tue, 06 Jun
 2023 16:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230602161246.1855448-1-amit.pundir@linaro.org>
In-Reply-To: <20230602161246.1855448-1-amit.pundir@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 6 Jun 2023 16:34:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U9xwxC4+wDYFMSoLWaj8vaLH_jettZ=nxEZP+1tNk=oA@mail.gmail.com>
Message-ID: <CAD=FV=U9xwxC4+wDYFMSoLWaj8vaLH_jettZ=nxEZP+1tNk=oA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-db845c: Move LVS regulator nodes up
To:     Amit Pundir <amit.pundir@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        regressions <regressions@lists.linux.dev>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jun 2, 2023 at 9:12=E2=80=AFAM Amit Pundir <amit.pundir@linaro.org>=
 wrote:
>
> Move lvs1 and lvs2 regulator nodes up in the rpmh-regulators
> list to workaround a boot regression uncovered by the upstream
> commit ad44ac082fdf ("regulator: qcom-rpmh: Revert "regulator:
> qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS"").
>
> Without this fix DB845c fail to boot at times because one of the
> lvs1 or lvs2 regulators fail to turn ON in time.
>
> Link: https://lore.kernel.org/all/CAMi1Hd1avQDcDQf137m2auz2znov4XL8YGrLZs=
w5edb-NtRJRw@mail.gmail.com/
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 24 +++++++++++-----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot=
/dts/qcom/sdm845-db845c.dts
> index e14fe9bbb386..df2fde9063dc 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -301,6 +301,18 @@ regulators-0 {
>                 vdd-l26-supply =3D <&vreg_s3a_1p35>;
>                 vin-lvs-1-2-supply =3D <&vreg_s4a_1p8>;
>
> +               vreg_lvs1a_1p8: lvs1 {
> +                       regulator-min-microvolt =3D <1800000>;
> +                       regulator-max-microvolt =3D <1800000>;
> +                       regulator-always-on;
> +               };
> +
> +               vreg_lvs2a_1p8: lvs2 {
> +                       regulator-min-microvolt =3D <1800000>;
> +                       regulator-max-microvolt =3D <1800000>;
> +                       regulator-always-on;
> +               };
> +
>                 vreg_s3a_1p35: smps3 {
>                         regulator-min-microvolt =3D <1352000>;
>                         regulator-max-microvolt =3D <1352000>;
> @@ -381,18 +393,6 @@ vreg_l26a_1p2: ldo26 {
>                         regulator-max-microvolt =3D <1200000>;
>                         regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
>                 };
> -
> -               vreg_lvs1a_1p8: lvs1 {
> -                       regulator-min-microvolt =3D <1800000>;
> -                       regulator-max-microvolt =3D <1800000>;
> -                       regulator-always-on;
> -               };
> -
> -               vreg_lvs2a_1p8: lvs2 {
> -                       regulator-min-microvolt =3D <1800000>;
> -                       regulator-max-microvolt =3D <1800000>;
> -                       regulator-always-on;
> -               };

This is a hack, but it at least feels less bad than reverting the
async probe patch. I'll leave it to Bjorn to decide if he's OK with
it. Personally, it feels like this would deserve a comment in the dts
to document that these regulators need to be listed first.

Ideally, we could still work towards a root cause. I added a few more
ideas to help with root causing in reply to the original thread about
this.

https://lore.kernel.org/r/CAD=3DFV=3DUKyjRNZG-ED2meUAR9aXdco+AbUTHiKixTzjCk=
aJbjTg@mail.gmail.com/

-Doug
