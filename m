Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE024F65BE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 18:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237484AbiDFQgC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 12:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237716AbiDFQfv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Apr 2022 12:35:51 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C67EA36B038
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Apr 2022 08:09:47 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-de3eda6b5dso3271004fac.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Apr 2022 08:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=W+SggYf9ZzUodZE2aDeDsbfyv++1hsGS8AoCuhA4ZeY=;
        b=TABFHoDlD/pgPUkRr6Aj4RRrjDFDoyvY0P1V47KSIdKeldIqaeYv98NU2YIRxtdyXW
         ze/Dug8d8CJPMjX5RsVxT5gY81U0sQiwOb/E6NSCYeq1AIgO6w7SJ1zp+JUUeiPsKno/
         xxlsN2DRS4pK3QoqoH+UD9z91re79FgU/vmSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=W+SggYf9ZzUodZE2aDeDsbfyv++1hsGS8AoCuhA4ZeY=;
        b=vbJGS40FEyysvjA8pJi2txTaBdKTTONpSr8S4XaVfp5/dhI68c7enxiNRvqiL31lEe
         JlrK/7+W4nDjx5HHO+3khYX8g1+36H69VARUUGJgJoUEuhMo5xjuyGhTFhlAyN55dGh4
         drawS7/7P6iVEYVs9cZvB6U/XVdVPR9+l69iYV00rt2WJIZb22buKmLWHK3jgZeq2OHw
         1OYJD0ej+CiS61ODtcDn1qC0z/CkS4wzkC047Mr5FLP8+O2guTB8gBbJojM+GpxuaMjx
         645DaACpxS/Rwh6FwWyamHJfXTAL6E3zUVDMI4bA1qfI5A1bxAj9V43Q871Zr8s9Cbiz
         UoOQ==
X-Gm-Message-State: AOAM531fFs4FkuAFMJAj19QHS5PF81hYmql8bER1pUXZQlKiwxa+DIVC
        +r00HCLwhsO72e29TXPAbJaJZ+/mIYTahfDZHbFJug==
X-Google-Smtp-Source: ABdhPJyiriWb9lM7r6nEGyokGF5E6v8arQe+jgv787NGJAGxQR/U6cRpfcBrI1g3T3RShG5DwchbWml9Jseu+Ya+YfA=
X-Received: by 2002:a05:6870:558e:b0:e1:db7c:26aa with SMTP id
 n14-20020a056870558e00b000e1db7c26aamr4119396oao.63.1649257785731; Wed, 06
 Apr 2022 08:09:45 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Apr 2022 08:09:45 -0700
MIME-Version: 1.0
In-Reply-To: <20220406100556.479706-1-dmitry.baryshkov@linaro.org>
References: <20220406100556.479706-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 6 Apr 2022 08:09:45 -0700
Message-ID: <CAE-0n52jMGWFFv3pRE2ZvY_+s1xGk09WXsqJsc1uR2buRZ0s3A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: remove unused plane_property field from msm_drm_private
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-04-06 03:05:56)
> Remove unused field plane_property from struct msm_drm_private. Also
> drop the enum msm_mdp_plane_property which also becomes unused.
>
> Fixes: 7d36db0be3b9 ("drm/msm/mdp5: switch to standard zpos property")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
