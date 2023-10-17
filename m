Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38B1C7CBC4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Oct 2023 09:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234503AbjJQHeA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Oct 2023 03:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234451AbjJQHd7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Oct 2023 03:33:59 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5906A93
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 00:33:57 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-7a2a9e5451bso206064639f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 00:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697528036; x=1698132836; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ApyDiANstYTWyWFRnukDgHnJl3tUXr1U5Y0xyV6mrc=;
        b=UP1qyIM/5i3QaiC2OvN6xita6W2B7BoicollJXeex3cyiJwRu4auCzJNBJTP35HVMq
         810C24YlJqSXU+q3D0xOVlFdNwOmakHDyQzku38N6Jm/wCWWH1yXPHHVuoVl1nG+1pxT
         0Ru4LpPobj/TLicrmYvXKHhPgcU4okw+FFBU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697528036; x=1698132836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ApyDiANstYTWyWFRnukDgHnJl3tUXr1U5Y0xyV6mrc=;
        b=YEqOOlf0Fdu5CYqKYsjFuQaf7fQZEHpsF/6/xWh1FG7y/Y0/uewWFmnkBSZ8g4zXlP
         baGf54glYGJ7SEvfwgPN87tttvGauwYDEi5umW2udF/1mD/ZUlffhfebDFYBqBksyCYr
         Da7Rqj7HupiSoRd2wCxH8StMdI+SHoKUt+PI2HNcDyYkL9O7NpGC+w+RDgWtitn+qqyg
         rvo7tfOOStNf91VFjJm1i48ishxzuqKgB377yNa2iIVXXUgMJhz4oGbL9dhixyCmgisl
         Pmc+EBrYDNh/HRPTMr459r+CxkXvizU8LpOn8uEwS6tOE+njKAhXBV5szhjCXiBE015A
         q9og==
X-Gm-Message-State: AOJu0YxGeVLai7RclOVZYoHTo9I7WKM3flz3FMI1N0qOSWrb7nlXc9Yl
        s2zqSGfpWlR7Ta1+Y1j4JgdtOPQRNtf9Td/ie1nRXg==
X-Google-Smtp-Source: AGHT+IEAYKQ8Ud2dDCTFrFxk0sv/MWGDyTH5PUc94osy1+AGiIS89dM943n8PAfXr7KHqvHMo1X6R6r3/dT57OJulPY=
X-Received: by 2002:a05:6602:1689:b0:790:f733:2f9e with SMTP id
 s9-20020a056602168900b00790f7332f9emr1564343iow.13.1697528036747; Tue, 17 Oct
 2023 00:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230926-topic-a643-v1-0-7af6937ac0a3@linaro.org>
 <20230926-topic-a643-v1-2-7af6937ac0a3@linaro.org> <43q6mui3lofa4rqh667o54b2qcbqn5fg34ss5o7y7k7uxbxsro@dxgovofsrvqx>
In-Reply-To: <43q6mui3lofa4rqh667o54b2qcbqn5fg34ss5o7y7k7uxbxsro@dxgovofsrvqx>
From:   Rob Clark <robdclark@chromium.org>
Date:   Tue, 17 Oct 2023 00:33:45 -0700
Message-ID: <CAJs_Fx7WkdhY31aP_buZP+b7ihOOmE8zBZFOLZ8z9uqcNmEhVw@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/msm/adreno: Add ZAP firmware name to A635
To:     Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 16, 2023 at 1:12=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On Tue, Sep 26, 2023 at 08:24:37PM +0200, Konrad Dybcio wrote:
> >
> > Some (many?) devices with A635 expect a ZAP shader to be loaded.
> >
> > Set the file name to allow for that.
> >
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/d=
rm/msm/adreno/adreno_device.c
> > index fa527935ffd4..16527fe8584d 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -454,6 +454,7 @@ static const struct adreno_info gpulist[] =3D {
> >               .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> >                       ADRENO_QUIRK_HAS_HW_APRIV,
> >               .init =3D a6xx_gpu_init,
> > +             .zapfw =3D "a660_zap.mbn",
>
> sc7280 doesn't have a TZ and so no zap shader support. Can we handle
> this using "firmware-name" property in your top level platform dt? Zap
> firmwares are signed with different keys for each OEMs. So there is
> cross-compatibility anyway.

I think this ends up working out because the version of sc7280 that
doesn't have TZ also doesn't have the associated mem-region/etc..  but
maybe we should deprecate the zapfw field as in practice it isn't
useful (ie. always overriden by firmware-name).

Fwiw there are windows laptops with sc7180/sc7280 which do use zap fw.

BR,
-R

>
> -Ahil.
>
> >               .hwcg =3D a660_hwcg,
> >               .address_space_size =3D SZ_16G,
> >               .speedbins =3D ADRENO_SPEEDBINS(
> >
> > --
> > 2.42.0
> >
