Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 014A454FF0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 23:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238497AbiFQUtQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 16:49:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237678AbiFQUtP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 16:49:15 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E8815DA6E
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:49:15 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id y16-20020a9d5190000000b0060c1292a5b9so3928385otg.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=ncffjMc6pHw+1TPZJcdmZRbDOOjSZwLTD4p2la+PTH8=;
        b=cXyQwuNm1l97LCMQPezs5DpJvLDKFJzjiMFByco8CrTW/jzSpYa0/rV/YQpbg3pZYb
         vtN81MpEtREytzC6e3+GGQR+cO+soSsil9doGetmYfLBZR3kuWBOgHF9vHUe+F82jV6G
         Eea0+GAe8yUqj84/f6ya8kLfVNs2g2hjf65so=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=ncffjMc6pHw+1TPZJcdmZRbDOOjSZwLTD4p2la+PTH8=;
        b=YdHsDBTh++GxtDd/E5WdnFmdxK/7fvYzs1np7uFVWaaWVdWCJAt2VUPOv0pd7fM8tL
         xZrU3xg9FZ7spPs/LldzL/9CRWmsYX5aV/mD8/ii7EzBLh3NpHWEp6cdrZL6gyxkMJI0
         cwTjiqOblAS1wUX0oE+wJq9t70YaxYv7oOs3iwCjcGIZDrgnAuDgX28Zimnklmdr8mUi
         d4dEAoZa41lKeLcZCglBGaSM+z6R6JsjRM5QvNT4PnvJJRFf0nKlVt1+SVqX2ZRMOZi1
         TzLIFciA3jv9dWesBL/F/1U3jikOOyBKC+WsdG/NX7bVQ9PoxjR4+71gBg13F+ohwPbp
         XaXQ==
X-Gm-Message-State: AJIora+BCESIBv3f0yiK8G9cKwE6yqVocvO5zIlER7hSeG+MM4tCEYAB
        mhOqyWchcYz2TUWzedaf2GH5U2tCdnGbM03hogHO3A==
X-Google-Smtp-Source: AGRyM1sDSnZUoLLGbHCAG3IXX1ilQUucxGfAWqMdpU5HLS7fZO3FziKUMpoNMk+vpIK9DLsLFLCnmcinX7IgEZO7Wus=
X-Received: by 2002:a9d:6484:0:b0:60b:eb0b:4054 with SMTP id
 g4-20020a9d6484000000b0060beb0b4054mr4750400otl.159.1655498954413; Fri, 17
 Jun 2022 13:49:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jun 2022 13:49:14 -0700
MIME-Version: 1.0
In-Reply-To: <20220617191429.1087634-3-dmitry.baryshkov@linaro.org>
References: <20220617191429.1087634-1-dmitry.baryshkov@linaro.org> <20220617191429.1087634-3-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 17 Jun 2022 13:49:13 -0700
Message-ID: <CAE-0n51yaN=CfveKwFcqv7bgBBzU1fTcDWMcvUYJJgZ=Z3cXdw@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] drm/msm/mdp5: convert to drm_crtc_handle_vblank()
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-06-17 12:14:28)
> Stop using deprecated drm_handle_vblank(), use drm_crtc_handle_vblank()
> instead.
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
