Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD0C7CFA56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Oct 2023 15:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345722AbjJSNFR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Oct 2023 09:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345737AbjJSNFQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Oct 2023 09:05:16 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 276FF12A
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Oct 2023 06:05:14 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5a7cc03dee5so97407667b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Oct 2023 06:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697720713; x=1698325513; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rbM+qQUNE2weQ5cnzFLT1Qc6XFwhF5OSMBSFH1UxmMI=;
        b=PQ4XSRENbm302E+qf5d6u7v4NIyEPbG5dfCNoebBw8T9WyLBaBGGJJCwAMOX2fITud
         L2fVQQoreV6LDENuA99lfBy1gBksllc/ApX/gI9lIQvqPu+rK5ObnVCV8ySRU8hlqvwX
         ozN+x8QwlWZO4DAswxW8fdzUfyBeKMSBSJl46AOob3/rNdCjTVeqS7s+iQtbxzd4mX/9
         PZMwfmv5fEdQq2889vUrBl50J6nv7HlhNORX8u6Z7y4ZtkLfnzvQ7bi1I1u3OPGAf5Dt
         G4v/EiKkgCKi23xQQmPZVIVdZWJkzZ97S7dnf0lhfhExUAb7ZcAjBTnewk5R2ScU+csy
         1gAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697720713; x=1698325513;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rbM+qQUNE2weQ5cnzFLT1Qc6XFwhF5OSMBSFH1UxmMI=;
        b=nPV/Yc9gY6d0ebYNE98fXCq7I4FkExAowmIuSS3MA85pel9CNMuR/MssJhG2gZtjj7
         lJKjgXFnvkCwtMstxPZoYr1ZpfL1FeI6aRwReoqHkkewEWSpE1h6j29Od+JEJmCoSFIV
         sy5SSZOArCJl1184+qcCQ5hFoS0PkqxbDEZTJ/3SWmhA0wnoRTDclghFXY0eeEBY0tUa
         9WIGD1TGTOFzmciAqhIB/KNDF74N0lphDqXeE1lVLAwP9DaICmymRnhw+fiVv8/Zxim+
         zC5zm+0N0JwX7O6YpWHMkxAfVdVDF8AYUC75HQmM3N7syhX6rj59xz1buSpKeZkvsGWx
         RibA==
X-Gm-Message-State: AOJu0Yx+Y6SEwHrpQJ5AHzF/NETuDOHKjc+MbVeAlbxFsnU/Ph9KvIIx
        Bd4o13UDnm5So+f6KqbEXIMFAErz6xHTOZ64S/oDQw==
X-Google-Smtp-Source: AGHT+IFdSX1HpPsh0RDrBsVBXf68icjGXwoNe/l4tlQ0yV1+tnNZAErnPCdVrGpNL24iHTDqyWLASjGL0KKSf4YU4UQ=
X-Received: by 2002:a05:690c:f01:b0:5a7:f002:4fe4 with SMTP id
 dc1-20020a05690c0f0100b005a7f0024fe4mr2703160ywb.23.1697720713175; Thu, 19
 Oct 2023 06:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231019104419.1032329-1-dmitry.baryshkov@linaro.org> <1ca930a4-60fe-a867-f676-0b79682982c2@quicinc.com>
In-Reply-To: <1ca930a4-60fe-a867-f676-0b79682982c2@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 19 Oct 2023 16:05:02 +0300
Message-ID: <CAA8EJpqE6b4qi0vaV-gypCwyVHwDibC+rVB5SgBvK58cyU9uzw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: cleanup debugfs handling
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 19 Oct 2023 at 15:33, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 10/19/2023 3:44 AM, Dmitry Baryshkov wrote:
> > Currently there are two subdirs for DP debugfs files, e.g. DP-1, created
> > by the drm core for the connector, and the msm_dp-DP-1, created by the
> > DP driver itself. Merge those two, so that there are no extraneous
> > connector-related subdirs.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
>
> One concern with this is, we are migrating from one debugfs per
> dp_display to one debugfs per bridge.
>
> Today we create one bridge per dp_display so its fine.
>
> With MST, I am unsure if there will be changes needed.

For MST the add_connector callback creates a new connector with its
own implementation of  drm_connector_funcs. So if necessary we can
create debugfs files for this new connector.

> But, we will figure that out once we add that support,
>
> Hence,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

-- 
With best wishes
Dmitry
