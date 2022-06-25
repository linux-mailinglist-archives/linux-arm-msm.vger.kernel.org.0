Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49F7D55A582
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jun 2022 02:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbiFYA3L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 20:29:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbiFYA3K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 20:29:10 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B989F69FBD
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 17:29:09 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id cb12-20020a056830618c00b00616b871cef3so773847otb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 17:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=LXmmRy87+sIBg3s1n6Pu6xPGWPwzc/E6GViq/zkd0us=;
        b=lXiOewqLDrZ9GvGJYWdlSf++vARR/9prI+nGhrawfJvUGCRagH6zpWOZQkVuBgt42+
         LH6QSY/05hmKOTYL4T5t1df0moaO/A4SykIbgn3s9Qn6bht+RMblaqER4lR1B9IjboPD
         JFi2pCRcPMWEhuT0igcBzJI5u0p44xnq8kpC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=LXmmRy87+sIBg3s1n6Pu6xPGWPwzc/E6GViq/zkd0us=;
        b=k4JFeCbuprjBL8slc+hsKIF/nLHsMolo/WheFT1LgyXTtU7vC5Vey4PpPGTR9WdOtr
         6YZ1MEaNcWljlOz9mwkcV0z4650n3hkhuziTzQjROFLOjTNQk2ScmjMKvJ31q8ZO7ndC
         K4KnCEYh1+ixffZbjwyvur1IiIWOl8KXBNmL0oCRV+RLrVltdc/EyQSoz/Z1I4lTi1AR
         YfQMc28Cd89sFWK4O4N0ZnDKh2CRL7n8RYxupi5CP8Yw54khsmE4ZUmLP8VNZQmiKIZL
         bo4pUoZfV+c6dUJynKZK/mr69xJZeYhGVWOBLgQtaq4i4ClRYr0XfHXpTmF93GQKcRg/
         R8xQ==
X-Gm-Message-State: AJIora+4hfb1i7K9z4vWPl+4vaSlujHftsEHtvzzijtz9sKYOKSIg0IE
        OlXsdwNT+YIeOE52pltVoJjk97vfYHUt1+bVgA3Gn1mUaPQ=
X-Google-Smtp-Source: AGRyM1tT6h5FoFSS2Otm0Dnj/Vb+Oi1EmolLE+5U5um27K2zbfA3c1mSSY/+m9Ri/fOZLT6kHhTxLr+H+FGNwDVJDsk=
X-Received: by 2002:a9d:729b:0:b0:60c:21bd:97c0 with SMTP id
 t27-20020a9d729b000000b0060c21bd97c0mr721652otj.77.1656116949136; Fri, 24 Jun
 2022 17:29:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jun 2022 17:29:08 -0700
MIME-Version: 1.0
In-Reply-To: <20220624235120.376293-1-dmitry.baryshkov@linaro.org>
References: <20220624235120.376293-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 24 Jun 2022 17:29:08 -0700
Message-ID: <CAE-0n530WzC1eAbHdtFn6jgXm71ujy+ENi4Q7pvhN8zd0UpSSA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: simplify and unify dpu_encoder_get_intf and dpu_encoder_get_wb
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

Quoting Dmitry Baryshkov (2022-06-24 16:51:20)
> Remove extra nexting level from the dpu_encoder_get_intf(), replacing it

s/nexting/nesting/

> with the explicit return in case the INTF_WB was passed to the function.
>
> While we are at it, also change dpu_encoder_get_wb() to also use
> explicit return rather than the goto.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
