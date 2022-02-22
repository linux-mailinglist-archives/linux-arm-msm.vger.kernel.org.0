Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CBEB4C01FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 20:25:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235067AbiBVT0U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Feb 2022 14:26:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231186AbiBVT0U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Feb 2022 14:26:20 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D953674D0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 11:25:54 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id p9so46014149ejd.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 11:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sxPYkxQ6mY3MfEsJx+8iE64/URTY/HAr2HMcmjeViMQ=;
        b=V83V6RXAXvourhNVZvf2jgxzgWgbvwcqNI4r4pat82eR93ldTr1f7UnyLwwf2qycr7
         a0xsJu4B7LJ0a8fb9YtI8NKspnKLSg3ZkC5edbZCl0z9GiEPzizCh1VTsL6b55uhFAT8
         5XLvUxqQKyaIUvk9UTZ0CbvKc9mBw+5pp329s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sxPYkxQ6mY3MfEsJx+8iE64/URTY/HAr2HMcmjeViMQ=;
        b=7dtGLmQT7XewxhMJqxt2xrrBfUzqB/pL9ioBFjjJgEA/l7DcwKm9UBIQezd7jySJqJ
         uOpH9oM7eLfOkxp8ob/+6KXDVks4sNw7b3lCIIyBq7rcRt9qanfp1QdJ9x+30cxommPk
         xZ9t65AX/bOmJXkLcEiPY5iqiTsebBwK1xV5uS/Vp1rxezNE8s5QqiuvzR6EIxJNyrtt
         9sXSICTD87xFMnbveT7sacXZAsgeEgwXol2yWX82MKPr/ympwEo2r18TUqMmsHiUj6Ga
         us+MjHnb/4M9WSgd++MAl2xj3tHB/xsXv4nW+splB5jiO96J4nMXNlAtxCOmwuFeO/EW
         n2hA==
X-Gm-Message-State: AOAM533xx9bqY7bzyQw8jRjQIaUPVbiNcl7KUF3ReryCrfgI4i5VdR/j
        iAT329dX2o4jK4QqpLSHHbH3lEqlqlJx+wsm
X-Google-Smtp-Source: ABdhPJwtl5kE0ow+nXXq97eTB8aAvfuBoIXwZMeyTig80gZ4+26EYvF8YTnECxB3WcIxAZP5sN+rnQ==
X-Received: by 2002:a17:906:16cc:b0:6ce:e607:ff02 with SMTP id t12-20020a17090616cc00b006cee607ff02mr19696323ejd.418.1645557952566;
        Tue, 22 Feb 2022 11:25:52 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id 5sm6606995eji.192.2022.02.22.11.25.51
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 11:25:51 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id u1so35331453wrg.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 11:25:51 -0800 (PST)
X-Received: by 2002:adf:e4c2:0:b0:1e3:3e5d:bd65 with SMTP id
 v2-20020adfe4c2000000b001e33e5dbd65mr21065461wrm.422.1645557950867; Tue, 22
 Feb 2022 11:25:50 -0800 (PST)
MIME-Version: 1.0
References: <1645455086-9359-1-git-send-email-quic_vpolimer@quicinc.com>
 <1645455086-9359-2-git-send-email-quic_vpolimer@quicinc.com> <CAA8EJppRUZ5OHSMS1NdFXDDvRXJFNsdoJDWgU7ZPUoAW9OD+eQ@mail.gmail.com>
In-Reply-To: <CAA8EJppRUZ5OHSMS1NdFXDDvRXJFNsdoJDWgU7ZPUoAW9OD+eQ@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 22 Feb 2022 11:25:37 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W2wi47egKmWDS+BZGSy85K+A8jX0gvi6CYhmFgoBBRmw@mail.gmail.com>
Message-ID: <CAD=FV=W2wi47egKmWDS+BZGSy85K+A8jX0gvi6CYhmFgoBBRmw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/msm/dp: Add basic PSR support for eDP
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Vinod Polimera <quic_vpolimer@quicinc.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, quic_kalyant@quicinc.com,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        quic_vproddut@quicinc.com
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

Hi,

On Mon, Feb 21, 2022 at 7:12 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> > +static int dp_link_psr_status(struct dp_link_private *link)
> > +{
> > +       u8 status[2];
> > +
> > +       drm_dp_dpcd_read(link->aux, DP_PSR_ERROR_STATUS, status, 2);
> > +
> > +       if (status[0] & DP_PSR_LINK_CRC_ERROR)
> > +               DRM_ERROR("PSR LINK CRC ERROR\n");
> > +       else if (status[0] & DP_PSR_RFB_STORAGE_ERROR)
> > +               DRM_ERROR("PSR RFB STORAGE ERROR\n");
> > +       else if (status[0] & DP_PSR_VSC_SDP_UNCORRECTABLE_ERROR)
> > +               DRM_ERROR("PSR VSC SDP UNCORRECTABLE ERROR\n");
> > +       else if (status[1] & DP_PSR_CAPS_CHANGE)
> > +               DRM_INFO("PSR Capability Change\n");
>
> DRM_DEBUG_DP

Not sure I'll have time to go back and review the series, but one
thing that caught my eye as this flashed through my inbox is that I
think all of these "shouting" are deprecated. It's even officially
documented now as of commit d2f0a8afc1be ("UPSTREAM: drm/print: Add
deprecation notes to DRM_...() functions").

-Doug
