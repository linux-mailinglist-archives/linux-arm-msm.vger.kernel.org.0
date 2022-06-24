Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49DE355A501
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jun 2022 01:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231781AbiFXXpp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 19:45:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231395AbiFXXpo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 19:45:44 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9FD88AC31
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 16:45:42 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-101ec2d6087so5816991fac.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 16:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=j+1eIf5O9WMahlJkl8hYNSnk/bm8biDohg259LJoO/g=;
        b=WjPp2QhLMxAzMvmNH6Bdyvi7wrjsIG/6SVnjeCIx33ZdnrT0FzloaiGfU0lA3CDeJb
         D7xY66ytKYA57XIKpfe59/dnVK12xL/fRml9igY3so3l01YCoor2ZFtI37sGeL7idQg1
         4VcAOUxad5AkwdS3gKl9l0rQuEiSBnIGTifw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=j+1eIf5O9WMahlJkl8hYNSnk/bm8biDohg259LJoO/g=;
        b=NP7uxApJSBACmzY6dp12B+Q6Yh7kaYRNmFTv+gqRY+eKjxkGung+VMAd6krZ0Rgph1
         juM9Tcfn4dgk+OJs4FzbIyx7WWSnRatKP0xBG6OXm9f4sJw4UoydHUfGMXQISI+lowls
         JZKMTP5Mbs6TG1YbP2eHYlXg2VIUMfboc3VNRaP3vhcMtDR9uLluMJlx/AtEy56ifw7Y
         Uq2rbDyfUl8ZB3zB8qx5Ez6IgUcaQlqoU1xO5MV6jkI1Fy59de6mXRguMbs2Vtv3xLZD
         9YcmYrr3HtkmYpz3FT38/nMataO/bjVRxrbM03SqDA4zVANpn4JRs42gJdkXEVWasLbC
         xP0Q==
X-Gm-Message-State: AJIora8IHsD92o28hh1nR4b52O25ntdYCnByzo1OCDnSIE4TcKI4NbGy
        1oa8lQiKcIbOXUeDPlPdSAfpp1+Uwqon1vChw2xbGQ==
X-Google-Smtp-Source: AGRyM1u4e57uuPYmBFxhp7AQ2EnNSWg/r4goHtlbSbtUqSiLnWrjbX1DesaUaEXpyg5Qm32+9mU8qIwp9idPpGqo2As=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr1007924oap.63.1656114342063; Fri, 24 Jun
 2022 16:45:42 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jun 2022 16:45:41 -0700
MIME-Version: 1.0
In-Reply-To: <0ff3d6a3-dc5c-7c77-f8a1-6c4f6c1a3215@quicinc.com>
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
 <1656090912-18074-3-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52RW+UFJ=hqMWjwR8qvEbww7QjzPW1nhL3Atd97QXAnYw@mail.gmail.com>
 <007ea4c9-9701-f4ab-3278-5d36bf2018c4@quicinc.com> <CAE-0n53kNCK0ajHfY2WQr5HEQZtZSBLnhfbTuZwaUNEOZhsKPg@mail.gmail.com>
 <fa7f8bf1-33cd-5515-0143-6596df2bd740@quicinc.com> <CAE-0n51g-EVsC-i9=sJV-ySa8VnE+yT7cg=b-TNMi9+3uBiOVA@mail.gmail.com>
 <326912ff-9771-0711-366d-79acd436908b@quicinc.com> <CAE-0n51qrdrFtSr0vRwgYkMgSZfnzQuinaUROQsp30QoDchWQA@mail.gmail.com>
 <0ff3d6a3-dc5c-7c77-f8a1-6c4f6c1a3215@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 24 Jun 2022 16:45:41 -0700
Message-ID: <CAE-0n515hMKqQ+Vj1Sg54PpwkbWMYJ77QN+y+KZNBWymjhpWKw@mail.gmail.com>
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

Quoting Kuogee Hsieh (2022-06-24 16:30:59)
>
> On 6/24/2022 4:12 PM, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2022-06-24 15:53:45)
> >> MSM_DP_CONTROLLER_1 need to match to the index =3D 1 of sc7280_dp_cfg[=
] <=3D=3D This is correct
> >>
> >> The problem is sc7280_dp_cfg[] have two entries since eDP place at ind=
ex
> >> of MSM_DP_CONTROLLER_1.
> >>
> >> but .num_desc =3D 1=C2=A0 <=3D=3D this said only have one entry at sc7=
280_dp_cfg[]
> >> table. Therefore eDP will never be found at for loop=C2=A0 at
> >> _dpu_kms_initialize_displayport().
> >>
> > Yes, but what else does the MSM_DP_CONTROLLER_1 need to match? Because
> > the intention of the previous commit was to make it so the order of
> > sc7280_dp_cfg couldn't be messed up and not match the
> > MSM_DP_CONTROLLER_1 value that lives in sc7280_intf[].
>
>
> at=C2=A0 _dpu_kms_initialize_displayport()
>
> > -             info.h_tile_instance[0] =3D i; <=3D=3D assign i to become=
 dp controller id, "i" is index of scxxxx_dp_cfg[]
>
> This what I mean MSM_DP_CONTROLLER_1 need to match to index =3D 1 of
> scxxxx_dp_cfg[].
>
> it it is not match, then MSM_DP_CONTROLLER_1 with match to different INTF=
.

I thought we matched the INTF instance by searching through
sc7280_intf[] for a matching MSM_DP_CONTROLLER_1 and then returning that
INTF number. See dpu_encoder_get_intf() and the caller.
