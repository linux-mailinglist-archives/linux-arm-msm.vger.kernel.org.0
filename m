Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7FAE70B0FD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 23:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbjEUVvJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 17:51:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbjEUVvJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 17:51:09 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19B4BDB
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 14:51:04 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-510eb3dbaaeso6951124a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 14:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1684705862; x=1687297862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wYWgt0VqCtWdLOPpm6CHjxKMZf+d9teDj5vjcml/jo=;
        b=bwoD8k0kF8udgKhccj2w69B2h9ks7l4IMcGTKw+Q5aZDVnlm42MZZw3H+WjlM+G4Wj
         HfsL2xBY4yCQrR/8htbxscMyq2V8o7zUxHztYdOKEYSZxT9Cvh4Z1AL9pnDmQ+7pn3GS
         P8z5pyHwCbkpBDksuuQFXr5mspF/e97YEEpxlka3aiFhso0mogB2wRaGEiR8l7B4WoTN
         RpZUJc3nXyJDSqZpE3ow8WyKVDnhSrzq2JdQJjFM4hB0W5dUmEcEBL1cIcS8CbH/AtlV
         IJVCY6dv3dJd28ay4C3tGZ1gks7taEpqVViOAD3xe/uoIo8Vsr/Yr90NmK7gPzIo9SDA
         un/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684705862; x=1687297862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1wYWgt0VqCtWdLOPpm6CHjxKMZf+d9teDj5vjcml/jo=;
        b=cEcaO2Ul6+uoQD6MDUp5WQFuG0wDNgf6BI8wbmOvPPV2VAAKEkIQ/Q0QvfCbj5z3V+
         rvBBKX0Ch30d7SJjbCExwKw1VsZnsc+8Vu0D2BTMWmq/dUdwjKin3kE5C92opY2RXOk0
         zWPZWeZjnC4LQGxx4MDHiPqcc/i8sz+Vd7tNl7S47tNT6Rj11zVxzC8iB+8xYs9YW5yx
         T+AWZQcOAx495C1GvkxSCBEvWZewI0iLiJUkPLwJwC7byvc+Dfw31qT/HAWVRmQvKFNE
         HdJtken9jtOFKspIEGskk/yHBtSXXMojl0s8KrypMe+VGVAxYeatkmnF43sk8DEJA6Zc
         SAOA==
X-Gm-Message-State: AC+VfDzKsXCGPgcixS0ODNjFDfMPyt9zNkkRU4vu4OygW1LFpsyQqNg2
        sCvRD+87u/lLSwn02w1cBtzf1Inur79Y8O3dRZIITQ==
X-Google-Smtp-Source: ACHHUZ47pnTttIYz7YAlKv4jIg6XlsnfovO8JpNyIhcN+wF0NakvkgxzQ0HecWS8msW6nxnGLJeKMrbf5XL0H7Jewyo=
X-Received: by 2002:a05:6402:8d0:b0:50d:9b59:4336 with SMTP id
 d16-20020a05640208d000b0050d9b594336mr6885049edz.37.1684705862525; Sun, 21
 May 2023 14:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
Date:   Sun, 21 May 2023 16:50:51 -0500
Message-ID: <CAKXuJqgf-MeQe8kwmBaz7DBP9sxsWHr=AZmsbRfQgVKGg=6iUQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] drm/msm/dpu: use UBWC data from MDSS driver
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry

On Sun, May 21, 2023 at 12:28=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Both DPU and MDSS programming requires knowledge of some of UBWC
> parameters. This results in duplication of UBWC data between MDSS and
> DPU drivers. To remove such duplication and make the driver more
> error-prone, export respective configuration from the MDSS driver and
> make DPU use it, instead of bundling a copy of such data.
>

Surely you mean less error prone?

> Dmitry Baryshkov (6):
>   drm/msm/mdss: correct UBWC programming for SM8550
>   drm/msm/mdss: rename ubwc_version to ubwc_enc_version
>   drm/msm/mdss: export UBWC data
>   drm/msm/mdss: populate missing data
>   drm/msm/dpu: use MDSS data for programming SSPP
>   drm/msm/dpu: drop UBWC configuration
>
>  .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  6 --
>  .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  6 --
>  .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  6 --
>  .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  6 --
>  .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  7 --
>  .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  6 --
>  .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  7 --
>  .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  5 --
>  .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  6 --
>  .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  7 --
>  .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  7 --
>  .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  7 --
>  .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  6 --
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 15 ----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 18 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  7 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 16 +++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  2 +
>  drivers/gpu/drm/msm/msm_mdss.c                | 90 ++++++++++++-------
>  drivers/gpu/drm/msm/msm_mdss.h                | 27 ++++++
>  22 files changed, 122 insertions(+), 139 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/msm_mdss.h
>
> --
> 2.39.2
>
