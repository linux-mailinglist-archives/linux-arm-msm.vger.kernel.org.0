Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEA5667800B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 16:38:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232754AbjAWPin (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 10:38:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232752AbjAWPim (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 10:38:42 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DA265FCC
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 07:38:41 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id s26so5718936ioa.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 07:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GTMdUYoB31JTLCUSgm3VtLqQhozltwVtxsd9chRjQsA=;
        b=Q3dQNfOIsBKbEssAr8S/0j2BHEXhzLeK6qqTwjbGFlMNtkbm96lJaHLBbeZdqOLHIN
         jqv9DLB/SnYamc6sLj/eI0xT3q+9bPStpYW/Xa0XZzY6uaYxxy8c+5ohJwrCBHoi8K2/
         mNe/DClGW0oO4B+xbmmD3rwMhPieMBk9avVZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GTMdUYoB31JTLCUSgm3VtLqQhozltwVtxsd9chRjQsA=;
        b=TZLC1MQbgHj4xad9AaCrZOFFk6atxlaN3Vryyaymxnbqv7mdsxdD+WJxvOKjNL4UBv
         UC/JDHuyDgzDRIgJKz963U1Uuac5JjFxbW7WG4aS4e9IrQWurE87L0zuHiycxZmDVZml
         b7lhKvyNlO6LSiJ2eNnAKNypZ05epRVTF7/BF99bkN0cPCb7QE33RO54ODDeLmqtkZn1
         v62VW2mRwPIV73eUachVRAGdLiwTDfHJv3gITy+tEOec4WjggwLzVlq9zBhwpa0cAxBY
         bT8K9Shi80L/FjWIHHVi9C7Ju3Z7NGJLN9o14Hyqp3tmNucJIiudfHw4VnEePwBTS00n
         kBpg==
X-Gm-Message-State: AFqh2kpJKwm6a0qQxapj2o5uzpDrBlxctds3OHsvZ6Alvl0zV0VQLMVW
        BWF8eU2CqfSRA/7hluNAUJfRXgJRcBSujgeu0YUvTQ==
X-Google-Smtp-Source: AMrXdXuXxev/GY8Oy07lOGET6d1ZUhWZ1e8eg082MJK3Aqa3PS4fKCI4WfECJhpMfT04OzR0UvCeatClLncLpOlbbd0=
X-Received: by 2002:a05:6602:1782:b0:6e3:134:3a97 with SMTP id
 y2-20020a056602178200b006e301343a97mr1998187iox.64.1674488320775; Mon, 23 Jan
 2023 07:38:40 -0800 (PST)
MIME-Version: 1.0
References: <20230110231447.1939101-1-robdclark@gmail.com> <20230110231447.1939101-2-robdclark@gmail.com>
 <2d5f0bc3-620a-1fd8-061f-92f16efd3c5e@kernel.org>
In-Reply-To: <2d5f0bc3-620a-1fd8-061f-92f16efd3c5e@kernel.org>
From:   Rob Clark <robdclark@chromium.org>
Date:   Mon, 23 Jan 2023 07:38:38 -0800
Message-ID: <CAJs_Fx5Wjnxw3rOtu6ye493SO-K+b3WLECYGBSCDUsyQhTjdiA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/msm/gpu: Add devfreq tuning debugfs
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Chia-I Wu <olvaffe@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        open list <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 23, 2023 at 4:38 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 11/01/2023 00:14, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Make the handful of tuning knobs available visible via debugfs.
> >
> > v2: select DEVFREQ_GOV_SIMPLE_ONDEMAND because for some reason
> >     struct devfreq_simple_ondemand_data depends on this
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
>
> For some reason this was merged even though earlier kbuild reported
> build failure. This breaks linux next and qcom defconfig. Please drop
> the patch from the linux next.
>
> See earlier build issues reported:
> https://lore.kernel.org/all/202301130108.fslQjvJ8-lkp@intel.com/
>

This will fix it:  https://patchwork.freedesktop.org/series/113232/

BR,
-R
