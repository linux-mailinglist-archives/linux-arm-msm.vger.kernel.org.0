Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB49F50A53A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Apr 2022 18:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbiDUQ1Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Apr 2022 12:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232179AbiDUQKv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Apr 2022 12:10:51 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A8BC47541
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 09:08:01 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id p18so1958216edr.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 09:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r/PzIKSjMeAOGbI6c4RWxm0pVUCyssgrVjMCd8c5Dag=;
        b=nSF4LY4d2BN1+JKzCgg54cIZdi/67BsPH/yDBzQffgGlo9dfl+XlmWXoZzWzMAXnIp
         qdZnwGxZTweXi0UkZvcPT3csTHegVQ7l9Yr8NqemyuxGmINZvpE6WVK/kWcyEnj1B29C
         R+2ri3hviOx0Pn502v6FXWj/8GgnrITxJ4CN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r/PzIKSjMeAOGbI6c4RWxm0pVUCyssgrVjMCd8c5Dag=;
        b=SSpgqiRKdcs0NoHNnHmEHmBiKXuoAw4hI0aaRL/v0M9LWGJ/VN9C0osOfuySM/XfuP
         eXx6ACLpKn+72bI2zXtZg0WV3KsL6d0hcgfgud/nKkhGYwJyskDkylx3B1BdwYmczEIV
         Mzp6jmwx0JBzaPWqlNyaoO95A/HTtrC/ZsnPy5geelBtO87gR2D3eLLJbtSrpI7ABwR4
         JesCMm3R3rdRLaxHCxa8RzqUderJ1jN5UXW3Al7jfQk20Ytqq/aN2YOLKnTGkj7JkWAq
         L7KU/96Lu/DbyhQZTLWkOJPaCMUyEc1S97em4TexbkvfTMitVTePKgYSJX7XVx2Ah0Gg
         FNcw==
X-Gm-Message-State: AOAM533bRh8i+byyALqklkhpZWFjQG3yWRB9mXanKzN20NUN7SPgEs6k
        AQx2hVV0y7ZD5qscDw+hGxq8ym5M+1nQ3pXPLJo=
X-Google-Smtp-Source: ABdhPJxFaZh4WEunrjMrxhknAbqo+ydk7aH94E3qjFaPE2hap7VqFq1WuCn8DWjbvwSOveAgO+qajg==
X-Received: by 2002:a05:6402:2309:b0:41f:a5a9:fe13 with SMTP id l9-20020a056402230900b0041fa5a9fe13mr271983eda.123.1650557279849;
        Thu, 21 Apr 2022 09:07:59 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id x1-20020a170906148100b006efa8a81a52sm4683066ejc.120.2022.04.21.09.07.58
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 09:07:58 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id h25so1334625wrc.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 09:07:58 -0700 (PDT)
X-Received: by 2002:adf:a29c:0:b0:20a:a246:a826 with SMTP id
 s28-20020adfa29c000000b0020aa246a826mr355251wra.422.1650557277978; Thu, 21
 Apr 2022 09:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <1650551811-24319-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650551811-24319-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=Ug-ZRiMrVyVH+OT1fMhyUnAixP2FfWKTQpLZXka0U_=g@mail.gmail.com> <MW4PR02MB718603608E45FB53A8D942C7E1F49@MW4PR02MB7186.namprd02.prod.outlook.com>
In-Reply-To: <MW4PR02MB718603608E45FB53A8D942C7E1F49@MW4PR02MB7186.namprd02.prod.outlook.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 21 Apr 2022 09:07:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UOALugpmgJK8dHxK=b_GO+c12d3xmGE3HiqJK+yznViA@mail.gmail.com>
Message-ID: <CAD=FV=UOALugpmgJK8dHxK=b_GO+c12d3xmGE3HiqJK+yznViA@mail.gmail.com>
Subject: Re: [PATCH v8 1/4] drm/msm/dp: Add eDP support via aux_bus
To:     "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        quic_kalyant <quic_kalyant@quicinc.com>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
        quic_vproddut <quic_vproddut@quicinc.com>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 21, 2022 at 9:00 AM Sankeerth Billakanti (QUIC)
<quic_sbillaka@quicinc.com> wrote:
>
> >> +       }
> >> +
> >> +       /*
> >> +        * External bridges are mandatory for eDP interfaces: one has to
> >> +        * provide at least an eDP panel (which gets wrapped into panel-
> >bridge).
> >> +        *
> >> +        * For DisplayPort interfaces external bridges are optional, so
> >> +        * silently ignore an error if one is not present (-ENODEV).
> >> +        */
> >> +       rc = dp_parser_find_next_bridge(dp_priv->parser);
> >> +       if (rc && dp->is_edp) {
> >> +               DRM_ERROR("eDP: cannot find the next bridge, rc = %d\n", rc);
> >> +               goto edp_error;
> >> +       } else if (rc && rc != -ENODEV) {
> >> +               DRM_ERROR("DP: cannot find the next bridge, rc = %d\n", rc);
> >> +               goto error;
> >> +       }
> >
> >The above wouldn't be my favorite way of doing this. Instead, I would have
> >written:
> >
> >  if (rc) {
> >    DRM_ERROR("Cannot find the next bridge, rc = %d\n", rc);
> >    goto err;
> >  }
> >  ...
> >
> >err:
> >  if (dp->is_edp) {
> >    disable_irq(...);
> >    dp_display_host_phy_exit(...);
> >    dp_display_host_deinit(...);
> >  }
> >  return rc;
> >
>
> If rc is ENODEV for DP, then we need to return 0. Shall I add like below ?
>
> err:
>   if (dp->is_edp) {
>     disable_irq(...);
>     dp_display_host_phy_exit(...);
>     dp_display_host_deinit(...);
>   } else
>         If (rc == -ENODEV)
>             rc = 0;
>   return rc;

I wouldn't. Then you're essentially going to "err" for a case that you
don't consider an error. I would instead have just handled it right
away.

rc = dp_parser_find_next_bridge(dp_priv->parser);
if (!dp->is_edp && rc == -ENODEV)
  return 0;

This also is better IMO because it means you aren't assuming that
`dp_priv->parser->next_bridge` is "valid" (or at least NULL) after
dp_parser_find_next_bridge() returned an error.

-Doug
