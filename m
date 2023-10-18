Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C15B07CD63A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Oct 2023 10:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbjJRIUW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Oct 2023 04:20:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbjJRIUV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Oct 2023 04:20:21 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F61BC6
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Oct 2023 01:20:19 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-d9ac9573274so7274376276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Oct 2023 01:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697617218; x=1698222018; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x3vk9WdgsgALGZ8oIqyx1M2Q98eDsGMriT18jqbbO68=;
        b=Kh9p3022epOHgToQOIrhINz5Qp2Ls+7ptw7q3tZ6/DDnzeTdPTTDyPqucNDkQTe6+F
         NeauNQWm8KGN437QkgXUXG2aS2yh+BdPPs4uIlSDvAHDvpYxZMX3dU6S/JeqmiIOSc/6
         utCaGhxIbcTNNSEqkH+C1HfiB25u3dbWH2AM9HFpJl+mL+k4AsqrZnTqC/9SjeJCEl0X
         SO4y64MauX85UID8Sacc+CMIQRoJ5w+cNetOkZq6gRCsZGZHFF7hVxcBtlGuxS0RBFoC
         Ms4dF/G7bCChEIznfXFBCBSGOw8UGHvLIp8xQ0s5njBnne8lOgVu17mLckhu00BTJ1xR
         aH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697617218; x=1698222018;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x3vk9WdgsgALGZ8oIqyx1M2Q98eDsGMriT18jqbbO68=;
        b=hlvSLz2umP4MC5VgwndwZVS4pucrJQgiluER0zuG63mbCK4TIeh8jHIVSKgA4mJANX
         FwclcEkhAA6CZZ5VR/WCbSnXUIkPbaUqHTakfNXeSv9u6vCohqAhbBGedAM91+AofQGx
         zF/9v8OB2dI6bzf6QoEYO1z4yVheFX5RkfEswenJSJ+5QURJZC74RDUyvWzszXaBTddL
         jR6TxCcjhpCtrdtqYyzdUiKcTVSKSaN2MayBlokvWD4jvZfkIHq/COKUBANOZpoJlx0J
         NaoltOWXdF7zN79T6GvTcFJ+RYJ6++5DgCntDkVw1CLm6vFdvzIEzQayfR1lV8iylgQY
         ltaQ==
X-Gm-Message-State: AOJu0YzooTGhI+3WvNj3VvpV4bdGIVCwcNAflUoDHta3SoxdVz/dAvNC
        Pf6GHZfdi3Zpjj8bakgwl9OZP7pS3G0sPsI07nEg+w==
X-Google-Smtp-Source: AGHT+IHggL2ml69cTNJWS6QIps9q5qyFOKcfc/dxJ4/BM2XmWD+4v6A6o1A5nTOANs51qAxT9nbcCCKDJ7tLeD7rao8=
X-Received: by 2002:a25:aab3:0:b0:d9a:e397:3b4 with SMTP id
 t48-20020a25aab3000000b00d9ae39703b4mr4208649ybi.46.1697617218711; Wed, 18
 Oct 2023 01:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20231017021805.1083350-9-mailingradian@gmail.com> <20231017021805.1083350-14-mailingradian@gmail.com>
In-Reply-To: <20231017021805.1083350-14-mailingradian@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 18 Oct 2023 11:20:07 +0300
Message-ID: <CAA8EJppTrH0DG_i+hUeagsXodt88TG6vD3W-y9gKmxevWZbJig@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] drm/msm/dpu: Add hw revision 4.1 (SDM670)
To:     Richard Acayan <mailingradian@gmail.com>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Ryan McCann <quic_rmccann@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Liu Shixin <liushixin2@huawei.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 17 Oct 2023 at 05:18, Richard Acayan <mailingradian@gmail.com> wrote:
>
> The Snapdragon 670 uses similar clocks (with one frequency added) to the
> Snapdragon 845 but reports DPU revision 4.1. Add support for this DPU
> with configuration from the Pixel 3a downstream kernel.
>
> Since revision 4.0 is SDM845, reuse some configuration from its catalog
> entry.
>
> Link: https://android.googlesource.com/kernel/msm/+/368478b0ae76566927a2769a2bf24dfe7f38bb78/arch/arm64/boot/dts/qcom/sdm670-sde.dtsi
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  .../msm/disp/dpu1/catalog/dpu_4_1_sdm670.h    | 104 ++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   1 +
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>  4 files changed, 107 insertions(+)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h

-- 
With best wishes
Dmitry
