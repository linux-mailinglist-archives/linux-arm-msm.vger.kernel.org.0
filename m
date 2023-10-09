Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D01E7BE65C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 18:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376962AbjJIQ3S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 12:29:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376275AbjJIQ3S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 12:29:18 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C126792
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 09:29:16 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-533e7d127d4so8065611a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 09:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696868955; x=1697473755; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UBOzhrKG0D5wh3WUocJj1AFT0B8v/jEsd27mVVQJ+2Y=;
        b=aXxIu2Z3Mt7bmayVVThFmPM1K/xUeMbMbXU3eNWgDYM73EL/aDPogcycMSdpAs/6lK
         AsM3FtwYN+GnkXaa2ftomiLfManWryIanQZ8702vtzxC4QiIXnk1QJp3GcDr8OQG4+d6
         zUWiT4xAmoXkyxa7XV4QMgO0M61w7zFhiazs1g4Gsmwj0wg6XTQ2xagwKY8agSAmtCcU
         a/ar26zKINDFcX2KMRAGrlPujFN2ZvcK0pmiCZW1AvpIgu/1BCU8cU5k/h1qiNA7pdW2
         oOlewAyIOQd06nNepra1I1hrTS6y06P4aUMMvHqQf5vd9zL3MTD7s1qZj6t0Qb5GVesb
         v35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696868955; x=1697473755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UBOzhrKG0D5wh3WUocJj1AFT0B8v/jEsd27mVVQJ+2Y=;
        b=GtEk8ynpOZ1NWMqIFxdu2tmkLWUm/Rg9AoYMFUF4xVf5Jk3WQ8LxIW9J5xVE++A7ut
         q/pOrOViTx5EfOTAKfseJv1KaLBhwW3vyUjqlLAWOoNOptM8f19Lus4nLhLsUWEYtQTR
         /bEtwxHBvlsdujpkEHFdd79d8+Pb7mr8jHbm+zeFu42gsXesdKqdvI0w2yvosPMWSBcz
         ocMlMBEvj01LWnyfF/GfsPQ0OXqD9G3Y1qpXE1KhfnkZFFcZDxBYjjwoXSeFfvLax4Ku
         4LJ0NovRJSYfbQ0s0Y6Oc7aH5AMOr1DxavdqM+GUw0EvZVRLIFikqxcmUU05iQDHE34N
         JjTw==
X-Gm-Message-State: AOJu0YxDoJb+D2cF3UDeU+T2fpfun2jYQ4CwBclS2KSikbIanTX2lDyb
        mg8IBoSu/63c0MWNS+3TTTuH/upA9vxTI/S/zvQ=
X-Google-Smtp-Source: AGHT+IEVsgs8Kr7kEZog8a7vGbHydDipO7g7T9pXn0lpmLf84elk6W5IYOijwNe6SG6c/majohm0Rloiu8H1R3AlXFI=
X-Received: by 2002:aa7:c246:0:b0:533:4f9b:67c8 with SMTP id
 y6-20020aa7c246000000b005334f9b67c8mr14880831edo.16.1696868954823; Mon, 09
 Oct 2023 09:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230704174553.216248-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230704174553.216248-1-dmitry.baryshkov@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 9 Oct 2023 09:29:02 -0700
Message-ID: <CAF6AEGtZ=MMf5=aCZFzi56UQiip5paRHH81Pk5fX2Tr_N4=UDA@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] drm/msm: move resource allocation to the _probe function
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Sean Paul <sean@poorly.run>,
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
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 4, 2023 at 10:45=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> This patchset was left untouched for almost a year. Let's reiterate it
> in attempt to solve the long-standing issue.
>
> As discussed several times on IRC, move display subdriver resource
> allocation from kms_init to probe time to let it bail early.
>
> Changes since v3:
> - Fixed MMIO unmaping in the DPU case.
>
> Changes since v2:
> - Move even more resource allocation in the DPU init path.
>
> Changes since v1:
> - Dropped the applied patch
> - Picked in the patch to pass msm_kms pointer via msm_drv_probe()
>
> Dmitry Baryshkov (4):
>   drm/msm: allow passing struct msm_kms to msm_drv_probe()
>   drm/msm/dpu: move resource allocation to the _probe function
>   drm/msm/mdp4: move resource allocation to the _probe function
>   drm/msm/mdp5: move resource allocation to the _probe function

for the series,

Reviewed-by: Rob Clark <robdclark@gmail.com>

>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 133 +++++++++++------------
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 107 +++++++++---------
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 100 ++++++++---------
>  drivers/gpu/drm/msm/msm_drv.c            |   6 +-
>  drivers/gpu/drm/msm/msm_drv.h            |   3 +-
>  5 files changed, 162 insertions(+), 187 deletions(-)
>
> --
> 2.39.2
>
