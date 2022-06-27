Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4B8955DD7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235417AbiF0TTo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 15:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235186AbiF0TTo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 15:19:44 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 362F8A474
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 12:19:43 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-101d2e81bceso14268186fac.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 12:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Z4BLBohMulDpiQGQwkIAJHPx8Gj0+neiaxc8ZfUwbzs=;
        b=FhXMKjKCFkRUVtJCSpdI3CkMufY98kLhUCjtQ6qz3yaP1HUGK46079/aOcGvtf4Vu6
         s+pQpMUiYXG3dEKsuLAYzthsqRht99ySLWEHdqzPnD0iTujCoBzl/SnTPfo7/qLYLSk5
         xZMyfJQ/H7aeX1nrYRJtFpD46dqGo9Z/K8TJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Z4BLBohMulDpiQGQwkIAJHPx8Gj0+neiaxc8ZfUwbzs=;
        b=aFhvKRApHm246k8ZEXlGUhdGG8DkoZWu+VRsX1lTzxtG7oTV3c2oNHOpvtTE2rdHHa
         DgOj1EMhpcozcfZXCru4BRSGpL1h44j+7y/50RupiGkXKZj2McP187X/kXiMS6KDMShJ
         sLCkkO98cHDheZhitztuisyVm0Y9cGJMFnu0EqbPtf3qTdkER1C7FJ3Iurv3ZTMc2Pbp
         fqcJ1UZKOaMdyLoVFG59D78TT61lmaHlJwCwmhDUBabYf6nZ3cm+7t765GCJVVdjcFz1
         C0s2W+j4vzgOGRM8rmc0MInBElmjW5uB3hnbVWe4NLNZj6bfoSEOPPlFb7dh5RhgGnkG
         dulA==
X-Gm-Message-State: AJIora+CUN07jhcBtAXF7dJ7mkvnt5CWetwcP2K1mBFMPcC5G2vuouzL
        S6l8e6W9jYZ/jm+lvbe5HFbR74YpmfVdpTVtwjIH7g==
X-Google-Smtp-Source: AGRyM1tD+1otcDiEgbeGj10XjPtM+eHLnUuS+FgxcbXZDbTbvpy7V+WXNg3lEBi9QRly6nt/PZ2uBEKT7eNNpzkWjjo=
X-Received: by 2002:a05:6870:b627:b0:102:f25:a460 with SMTP id
 cm39-20020a056870b62700b001020f25a460mr8608960oab.193.1656357582537; Mon, 27
 Jun 2022 12:19:42 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 27 Jun 2022 12:19:41 -0700
MIME-Version: 1.0
In-Reply-To: <20220627165413.657142-1-dmitry.baryshkov@linaro.org>
References: <20220627165413.657142-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 27 Jun 2022 12:19:41 -0700
Message-ID: <CAE-0n52OA=qSOmez983_J0PCa4D5qte-1VWMZcAMqjpMytGgEQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: use ARRAY_SIZE for calculating num_descs
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-06-27 09:54:13)
> If for some reason the msm_dp_config::descs array starts from non-zero
> index or contains the hole, setting the msm_dp_config::num_descs might
> be not that obvious and error-prone. Use ARRAY_SIZE to set this field
> rather than encoding the value manually.
>
> Reported-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
