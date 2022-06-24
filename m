Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73A7755A4A6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jun 2022 01:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232006AbiFXXMu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 19:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232001AbiFXXMu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 19:12:50 -0400
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A086288B19
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 16:12:49 -0700 (PDT)
Received: by mail-oo1-xc2e.google.com with SMTP id i19-20020a4ad093000000b004256ad0893fso760012oor.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 16:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=yUaUlIMPAe3wvXnfRM5gi/o9kg0TXggL9B/IQ5XoR14=;
        b=KmbtAF/HUwJQPL9R+/SHHlpK6bf5UsbrnR8kNiAgyPnzFI/NFDn2EEmjfpO3ZaRR3h
         qbt49v0otRmZ6AbsFxHqo1zKUYVlJmKKByrLpQMbjyGDUlT/qdZKAqe2x8EawZN5IpYz
         CuOXJGVE0gUAfSJWMAdJHk8IwzujuKLd2ejTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=yUaUlIMPAe3wvXnfRM5gi/o9kg0TXggL9B/IQ5XoR14=;
        b=r/54p1t/sGK29ddFjXQhawnp5lUgfQ46KnADqPSj1tYscwQGRJB+zLl5Tb2A0DwoJu
         +rEftY2P0Iw5cj7mkACV6eCUL3UryKSiXDWooY8ABffhsyjNl6cP2Tle0mD7OZGodgLn
         8HDD8toC7mhXNaGf+ZBn0l/osiL6QzwaN44UZOqzUUpcKYmIaSEvi19aJuMJA8Z4o1uN
         L02DHL09EZqWTFcwdFaO8u8nlr355Ly26yIUnXQKC6qyKThrii/rgJcKoQAr1/Yi5ujt
         JlCY75qkQSjgLeoFDsMmbAYrb+S80+q7LFFZRSFWIRnn827DgAiy3TYXWUAF9poQA45q
         /VjQ==
X-Gm-Message-State: AJIora8a9KsC5OyJgqJUamGhC5D/G3GDkjNL3K+x3Sg2MsTVDskA0ryT
        g+44dLxge3ChGNRd4gk9HiWh0v+bU4t6tcjTxZKbmQ==
X-Google-Smtp-Source: AGRyM1u+zQwL2M2+LhjYYBJM+V6JwxPLfyNbwqTgSpF9LXZ+0EnlDVkdDj+tlkI7rGfOi4l5ouEEmbRFSndfkF/HJ3g=
X-Received: by 2002:a4a:98a6:0:b0:41b:e04e:70ce with SMTP id
 a35-20020a4a98a6000000b0041be04e70cemr683244ooj.25.1656112369023; Fri, 24 Jun
 2022 16:12:49 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jun 2022 16:12:48 -0700
MIME-Version: 1.0
In-Reply-To: <326912ff-9771-0711-366d-79acd436908b@quicinc.com>
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
 <1656090912-18074-3-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52RW+UFJ=hqMWjwR8qvEbww7QjzPW1nhL3Atd97QXAnYw@mail.gmail.com>
 <007ea4c9-9701-f4ab-3278-5d36bf2018c4@quicinc.com> <CAE-0n53kNCK0ajHfY2WQr5HEQZtZSBLnhfbTuZwaUNEOZhsKPg@mail.gmail.com>
 <fa7f8bf1-33cd-5515-0143-6596df2bd740@quicinc.com> <CAE-0n51g-EVsC-i9=sJV-ySa8VnE+yT7cg=b-TNMi9+3uBiOVA@mail.gmail.com>
 <326912ff-9771-0711-366d-79acd436908b@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 24 Jun 2022 16:12:48 -0700
Message-ID: <CAE-0n51qrdrFtSr0vRwgYkMgSZfnzQuinaUROQsp30QoDchWQA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/msm/dp: decoupling dp->id out of dp
 controller_id at scxxxx_dp_cfg table
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dianders@chromium.org, dmitry.baryshkov@linaro.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-06-24 15:53:45)
>
> MSM_DP_CONTROLLER_1 need to match to the index =3D 1 of sc7280_dp_cfg[] <=
=3D=3D This is correct
>
> The problem is sc7280_dp_cfg[] have two entries since eDP place at index
> of MSM_DP_CONTROLLER_1.
>
> but .num_desc =3D 1=C2=A0 <=3D=3D this said only have one entry at sc7280=
_dp_cfg[]
> table. Therefore eDP will never be found at for loop=C2=A0 at
> _dpu_kms_initialize_displayport().
>

Yes, but what else does the MSM_DP_CONTROLLER_1 need to match? Because
the intention of the previous commit was to make it so the order of
sc7280_dp_cfg couldn't be messed up and not match the
MSM_DP_CONTROLLER_1 value that lives in sc7280_intf[].

>
> Sorry, my mistake. it is not in drm_bridge_add.
>
> It should be in dpu_encoder_init() of _dpu_kms_initialize_displayport().
>
> can you make below changes (patch) to _dpu_kms_initialize_displayport().
>

Yes, I've made that change to try to understand the problem. I still
don't understand, sadly. Does flipping the order of iteration through
'priv->dp' somehow mean that the crtc that is assigned to the eDP
connector is left unchanged? Whereas without registering the eDP encoder
first means we have to change the crtc for the eDP encoder and that
can't be done atomically?
