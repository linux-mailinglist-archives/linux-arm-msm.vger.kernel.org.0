Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7BF66A502
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 22:19:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjAMVTB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 16:19:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231245AbjAMVST (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 16:18:19 -0500
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20521892E8
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 13:16:42 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-4d4303c9de6so151728477b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 13:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tKjknO1S6jYWVxSGQFzTMNbopxapdQjsltHlJg7v1PU=;
        b=hkYPK9+j3r7+rTaq/4IW6XpKf+QsIeI+mRd9qZNFHqLCTqZ2NcwQfyzLwNanKbGsS5
         QyX3keDoEselbsPPQTsHPJdw8L3CFbhcGpVIPuOkiE/vv8Ypgwtk2wC08pdGBbWNSKTg
         7vYl0dZ6gWYasTQOLHf8RlcfD1ySCO/V1sOpTArGzgE9F0qB+RqaeCyv5FYkawKs3sjb
         lwhUmWfGcOCdAemX0+e5FjkAorRuQzR1k1f3F68uwcniz+sYhvLwcUDb+QcjCMWeWM+n
         QUmWdx8Sbx7sAUk/T9Qs5yYqlwd5sHt6pA+8jQbSJfgUcboJMiims2YAhUScRlFve7gS
         Ka/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tKjknO1S6jYWVxSGQFzTMNbopxapdQjsltHlJg7v1PU=;
        b=jYQZxonfxVJPAplth73z81PvmCRfSYbe3YE1mm2n5RiqySLtTzr847DX82QHfgPIVk
         AHC8JVASmp5Q9Q2jY0mxV5Y+Fg8EXPjB9p3DLkueFf3bNOqCsjdA7WYxbcF/i3h/+/IM
         L80uLi5ZYeUfFRb2UEJFWR4xQ9k++BT+WUbYPdsdr32ZytnB1IyHdmcedk+zOIibu3qU
         Jvk6xQ6Iw2e7gZkBSpW7qS2ReRtGzZS/bkJox5auXdU/dm5PAkjzKgqWhYcmiM3hD17C
         Brhrs6tIKl++YM03kM6b17czbUanGpfO9KRwY7Yfyb+5NrB7f0JSvYhXdHYxmpu2/5x3
         d53Q==
X-Gm-Message-State: AFqh2kq8WDbAlbkygMaNrxwbviPtz+goELUpE+r32AMLLLhh3dzfK1HO
        RrmlBT/nDq4NWOEqr5dJ31jbvFNwLPByzwtoKGhW4g==
X-Google-Smtp-Source: AMrXdXvsHEnIy6VGFnj70dZWryEQgbOdRjanNoPmgQkBINp89rrbnDHuGYzo6EqaHzcoIKAU676ZVQ9agsfIJ1YQD3s=
X-Received: by 2002:a81:f10e:0:b0:4c0:ab4f:6e2c with SMTP id
 h14-20020a81f10e000000b004c0ab4f6e2cmr4190616ywm.485.1673644601362; Fri, 13
 Jan 2023 13:16:41 -0800 (PST)
MIME-Version: 1.0
References: <20221208000850.312548-1-dmitry.baryshkov@linaro.org>
 <20221208000850.312548-3-dmitry.baryshkov@linaro.org> <eae9b5ee-3bf3-8fd4-6d8f-6ac265859ec6@quicinc.com>
In-Reply-To: <eae9b5ee-3bf3-8fd4-6d8f-6ac265859ec6@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 13 Jan 2023 23:16:30 +0200
Message-ID: <CAA8EJpopVvFfvrb0rPNhodichLSKsRWo=TOmfXLH38u32hYPoA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] drm/msm/mdss: correct the ubwc version for sm6115 platform
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 13 Jan 2023 at 21:47, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> On 12/7/2022 4:08 PM, Dmitry Baryshkov wrote:
> > According to the vendor DT, sm6115 has UBWC 1.0, not 2.0.
> >
>
> Can you please point me to which file you are referring to?
>
> The internal docs I have are still showing 2.0.

If I understood correctly sm6115 = bengal, thus:

https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/heads/android-msm-bramble-4.19-android11-qpr1/qcom/bengal-sde.dtsi#103

>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/msm_mdss.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > index 2219c1bd59a9..4401f945b966 100644
> > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > @@ -532,7 +532,7 @@ static const struct msm_mdss_data sm8150_data = {
> >   };
> >
> >   static const struct msm_mdss_data sm6115_data = {
> > -     .ubwc_version = UBWC_2_0,
> > +     .ubwc_version = UBWC_1_0,
> >       .ubwc_swizzle = 7,
> >       .ubwc_static = 0x11f,
> >   };



-- 
With best wishes
Dmitry
