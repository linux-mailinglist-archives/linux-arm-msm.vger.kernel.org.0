Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3009F730CFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 04:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236418AbjFOCCY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 22:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjFOCCX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 22:02:23 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B9CD1BD4
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 19:02:22 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b1c30a1653so19702141fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 19:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686794539; x=1689386539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWURV6WhlNOJavnCVMftL3VNvBn19BVJFQP7jTmgUlQ=;
        b=JMCklErWka5dBfkShuFk3SteA7h8BDezzMqG4DKPiYW6AEzvGvVGrPYeJ9ty61p/v9
         1hv0x5dZ2PDng0EX7sq28Mo8H8sO4fn/8t0iCsiUEfBNnp652PrhVebG8O7TKRtqpvod
         jjNUrvZgbAWVhba2v+9SNzi09pb8ci5YmTxrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686794539; x=1689386539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yWURV6WhlNOJavnCVMftL3VNvBn19BVJFQP7jTmgUlQ=;
        b=JY6IKbrDDcaGaPp6GTLvC0G0gd2ItKJ8olcsNQEcy0FhRjMY26uyPI8vpV+om8Fhp0
         2IeSEQa2Hzz77ZlU4bqDGc34ux8UgWVvxIsaESJ9VxMIKGRiqyzpdbysiAvH2VHQ2/9u
         VhvLolIc9RDM0dCXzMuahRLWz7+fgc+73QSLGmvy2QbUiHBKqMigGpBGtjJEB136ssSa
         CuK7E4YzkVMlvT+QIneSyrsq1Sg1BieeGCPy2pROzHsR1rOD9KHea7Cei06q9+ye3ev3
         NXhOPxfll4t3Th6gV/fM3iXBO4mv6oyyc87OU0RS66Bf63QQRqLGBq8rUENZVCpHWenP
         0eHg==
X-Gm-Message-State: AC+VfDyII0Id6gP4Ff2qfERq9BI+gJ5QmOJaqeqX+HuaY+2WT4D1n5vC
        Kz6ouJB2p+pUyDGLHL9Kt+nkjbkjICtZsvZ5Djwt1Q8p
X-Google-Smtp-Source: ACHHUZ6A26DuZaU4kKIn956KFfBt2QnWgDaZ/90BPK6l3RnSdWBRR/D0zABl8yS+eYm6oZO97BlWKg==
X-Received: by 2002:a2e:9204:0:b0:2ac:8261:5f4b with SMTP id k4-20020a2e9204000000b002ac82615f4bmr7622450ljg.28.1686794539592;
        Wed, 14 Jun 2023 19:02:19 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id j14-20020a2e824e000000b002b1a4238c96sm2819875ljh.128.2023.06.14.19.02.18
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 19:02:18 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4f76386e0daso914e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 19:02:18 -0700 (PDT)
X-Received: by 2002:a05:6512:79:b0:4f7:5f7d:2f9b with SMTP id
 i25-20020a056512007900b004f75f7d2f9bmr35250lfo.1.1686794538084; Wed, 14 Jun
 2023 19:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230612182527.3345786-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230612182527.3345786-1-dmitry.baryshkov@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 14 Jun 2023 19:02:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VoF0TKnC5Yuwmt90UZORCZonO3mS74T3X50Oz22TwT2A@mail.gmail.com>
Message-ID: <CAD=FV=VoF0TKnC5Yuwmt90UZORCZonO3mS74T3X50Oz22TwT2A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: make adreno_is_a690()'s argument const
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jun 12, 2023 at 11:25=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Change adreno_is_a690() prototype to accept the const struct adreno_gpu
> pointer instead of a non-const one. This fixes the following warning:
>
> In file included from drivers/gpu/drm/msm/msm_drv.c:33:
> drivers/gpu/drm/msm/adreno/adreno_gpu.h: In function =E2=80=98adreno_is_a=
660_family=E2=80=99:
> drivers/gpu/drm/msm/adreno/adreno_gpu.h:303:54: warning: passing argument=
 1 of =E2=80=98adreno_is_a690=E2=80=99 discards =E2=80=98const=E2=80=99 qua=
lifier from pointer target type [-Wdiscarded-qualifiers]
>   303 |         return adreno_is_a660(gpu) || adreno_is_a690(gpu) || adre=
no_is_7c3(gpu);
>
> Fixes: 1b90e8f8879c ("drm/msm/adreno: change adreno_is_* functions to acc=
ept const argument")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
