Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C58F26D032B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 13:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbjC3LaU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 07:30:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbjC3LaT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 07:30:19 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C8A4128
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 04:30:18 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5463fa0c2bfso17744607b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 04:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680175817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Z6cuQ9hIHTdbnLN1pgaiYFS8g/uB5WtYlD8bXBl8g8=;
        b=UBthkx5ykPrfy0hajs5iWpqWsQfl+OQJsVnlphXPHX8w3694JndAEVdJBTuXCnc0Kq
         nP1uCUpMIZVQ0PYDdXXonkcnS0LWTZDFbNjD1hpeV5OlzzurRUqGkHLQYVUAXAsfpra4
         OkVwXU9xu33KbjC1lM3OX5+XLsohPAIbpLm4+O39CY1x3xHXUoMypSjyuhU2yNCS2U+6
         8i+YvIx3WGbfRuscgl6JPs0FfwBIGZRdg6bOtKlLkNxe0Vk8gCyUwBkmWhSoyh2DJfUM
         cDiRQ0xR6vyKwvN2zJFEKewLJDr8i8KE/xFEwe7Pkc9s1XtMwyHEe9pCd6Pfi7GHw5d/
         4vPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680175817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Z6cuQ9hIHTdbnLN1pgaiYFS8g/uB5WtYlD8bXBl8g8=;
        b=roappUSKt7fSoeo1E5hs5NqU8VY0vklWU6X90DrxVnyf7SQqtQMSMoXoa5/LMZlQ1g
         N3cEzoJnO7BhI4tosXomu3R2yq2tycv2KCtKBY2Xt3yBnkP89P4++Vft09SAfywJ69Ag
         jkJvWGMmhD2E7a9zGX/lHBcTkS+fZp6YhZAlzs1R2jCc3K8Ye9/MEj01+aM2zHIxHLU7
         jZmHKbCiVzHR2Fty7OTe+hLsCfJQpScGlJI/kWRnlVBPkvXJ99Usj99Pr0TmN8zaxzOq
         HidCOH2qtaq9c8eLOX0ihgzOystOVckwLRsmaH+YhnWc41bCGSD0AlQ02/5jHwUx+t3F
         4B4A==
X-Gm-Message-State: AAQBX9fV6U9Te689Ji4o83f1UdZwRTaU7Z214Q4cRG6gyHNkGVgRSOGp
        Lw3UjjeHqxDOfZ76rA8AQ8JssXYOe+Eec5pg3qQBnA==
X-Google-Smtp-Source: AKy350YGt/VZZjwJ8RcTGwckSwP2VskFLeTRHe+v6OIVJWT/tuEh4q+I+f8Xbf2gB3tFVnOxTRlce+Uag4DqyXPeuCI=
X-Received: by 2002:a81:b617:0:b0:541:7f69:aa8b with SMTP id
 u23-20020a81b617000000b005417f69aa8bmr10804632ywh.5.1680175817633; Thu, 30
 Mar 2023 04:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230329222500.1131836-1-dmitry.baryshkov@linaro.org>
 <34470797-493c-d99b-4d0c-0f9381c5b7c1@linaro.org> <b9b1ae11-d9cf-0139-41d0-5af4ff2c8e6b@linaro.org>
 <9ff4fc88-f4bc-3e05-cad9-176449d7258d@linaro.org>
In-Reply-To: <9ff4fc88-f4bc-3e05-cad9-176449d7258d@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 30 Mar 2023 14:30:06 +0300
Message-ID: <CAA8EJprwyxOqM6OpgTALgP1phduamETpGFEnwFuVSXX=HgG4AA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] drm/msm/a5xx: scale MX following the frequency changes
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 30 Mar 2023 at 14:16, Konrad Dybcio <konrad.dybcio@linaro.org> wrot=
e:
>
>
>
> On 30.03.2023 13:15, Dmitry Baryshkov wrote:
> > On 30/03/2023 14:06, Konrad Dybcio wrote:
> >>
> >>
> >> On 30.03.2023 00:24, Dmitry Baryshkov wrote:
> >>> Konrad brought up the topic of scaling the MX domain according to the
> >>> OPP changes. Here is my RFC for this functionality. I post it as an R=
FC
> >>> for two reasons:
> >>>
> >>> 1) I'm not sure that we should scale MX if we are not scaling main
> >>> voltage following the CPR3
> >> It should be ok, however..
> >>>
> >> [...]
> >>
> >>> Dmitry Baryshkov (3):
> >>>    dt-bindings: display/msm/gpu: allow specifying MX domain A5xx
> >>>    drm/msm/a5xx: scale MX domain following the frequncy changes
> >> This is a stopgap solution, CPR is a child of MX.
> >
> > Not so sure here. Vendor kernel scales voltages and MX levels separatel=
y. Moreover, please correct me if I'm wrong here, the kernel doesn't scale =
VDD_GFX directly. It programs GPMU's voltage table and then GPMU handles vo=
ltage scaling according to performance levels being set. MX is handled in p=
arallel to switching GPMU's level.
> >
> > I have implemented this voltage scaling locally, just need to run more =
tests before posting (and unfortunately it depends either on CPR3+GFX or on=
 programming the voltages manually).
> Oh no.. I forgot about the ugly goblin that we call GPMU.. I'll have
> to dig into it further. Thanks for reminding me..

Let me send the fixed voltage table programming (probably on Friday).

>
> Konrad
> >
> >>
> >> Konrad
> >>>    arm64: dts: qcom: specify power domains for the GPU
> >>>
> >>>   .../devicetree/bindings/display/msm/gpu.yaml  |  9 +++-
> >>>   arch/arm64/boot/dts/qcom/msm8996.dtsi         | 14 ++++-
> >>>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c         | 52 ++++++++++++++++=
+++
> >>>   drivers/gpu/drm/msm/adreno/a5xx_gpu.h         |  3 ++
> >>>   4 files changed, 76 insertions(+), 2 deletions(-)
> >>>
> >



--=20
With best wishes
Dmitry
