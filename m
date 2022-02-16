Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A9804B7D66
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 03:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245739AbiBPB5f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 20:57:35 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235112AbiBPB5d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 20:57:33 -0500
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 322817F6D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 17:57:22 -0800 (PST)
Received: by mail-oo1-xc29.google.com with SMTP id u47-20020a4a9732000000b00316d0257de0so844751ooi.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 17:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=yf7K0uG0GDfWyq/No5Sw4cB3nhUdbA5wJESpoT/OmDo=;
        b=XG3bMqg+15oGPBOvIW+H08FKDWnUCCndmCg/ckMoT3QhbZK4foOtLBnqnRGbtAak0h
         uLwV2vVu9waUtgPXuo2Xp0ur4QFbhaMu5uGo9nlT55ySvaX0iix70v5J7E4Ot6/aO6qI
         D8MwGf2+55KDBOy0k8fc3GZGSy9Y6NGS6BFao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=yf7K0uG0GDfWyq/No5Sw4cB3nhUdbA5wJESpoT/OmDo=;
        b=zRfOPUtMIHZCha+2UabOrXh4LFkI5G1Mf2kzXSyjCo0V0QGpH4XMzNtE6d8tS0mAqV
         ZIv3XNz+blDxq2fSKDa8fwig5pGRy0Mrw0jPq5FhY9varpblgPEwqXTsYy4WJPkwGiO0
         M6X6G4QLs8wrJl0iqmuiYwOY6d5xfOQJANUFonhd/ekO1ejZgTMoluP9plk5+m24N1+t
         eSofCOJmCTEEwGQlPxkrIXQoT6dlNRrUk7F61kSFUnn/J9JIo4LiTYzfohlvwt8uTcFF
         DmgGaZULoyhCS4bemK0cnw1WtIk+7QfFlKFzuhealRpmLBfzxDKiX6S75IpQUdOXr9rj
         zLQA==
X-Gm-Message-State: AOAM530it4k3f/hfY60+KOl/9FUEv9vhe4eLFnjTRtDuYhNhC8WZjl/f
        Ncj+uh9skIp4W2aczJiviDSv1GI3zO8NmYaYihTVUw==
X-Google-Smtp-Source: ABdhPJzxTL1aErorPNW6lKasnfASBJkXb0+zszIc2QCakyQmG7qkoIxuFZLAI+15rKnfF+/PiyZKCXL+k67kvlOM4o8=
X-Received: by 2002:a05:6870:5829:b0:c8:9f42:f919 with SMTP id
 r41-20020a056870582900b000c89f42f919mr277746oap.54.1644976641436; Tue, 15 Feb
 2022 17:57:21 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 17:57:21 -0800
MIME-Version: 1.0
In-Reply-To: <20220215141643.3444941-4-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org> <20220215141643.3444941-4-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 15 Feb 2022 17:57:21 -0800
Message-ID: <CAE-0n53kJqudjzbHumrOMzXgK_2m8AdFohE645keYgD=HEyHOg@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] drm/msm/dpu: remove msm_dp cached in dpu_encoder_virt
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-02-15 06:16:38)
> Stop caching msm_dp instance in dpu_encoder_virt since it's not used
> now.
>
> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
