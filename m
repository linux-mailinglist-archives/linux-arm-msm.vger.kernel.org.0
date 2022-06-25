Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76A2555A570
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jun 2022 02:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230388AbiFYAV2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 20:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbiFYAV2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 20:21:28 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 229D04EA21
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 17:21:27 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id c1so6851927qvi.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 17:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WGrGp+UecLKKWdPmyonOqcgYxL0sqMxoEZLDjJ+Oefg=;
        b=x5FN+3eTosqOW/qHB/F6zX1XOc50YXWWP8BmXs6nv9KnUxfGxIsLKGwutP+WTkOPKv
         J6yBuqAFT2eYUcRt1Bomsia8NM7XwaIs9qJy+CpemtXmInCHnuOivfqE0u44O5uHdrpY
         Dpbr+D8MYFM6/XJtQ7lPyf4QxQrEUV/UTaDNxjH/2EV/1tn5U8let8ftptVhzgHzm2B0
         ZUj4wuQaLenwNO3+dDIWE80Wdu2fJRy6QpA4GmHnQHHZldDF2kF65Ok8rmcU6M+VpG82
         XCCXbOQJqMzFK3kdD6LeBa9LfIkU1e+NaZbFEJsgQY3QBO4mKDqb7AtHiEWt2IuaquPN
         Fq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WGrGp+UecLKKWdPmyonOqcgYxL0sqMxoEZLDjJ+Oefg=;
        b=kspNsAk3dCPi6ORIiASMTXlBmih5jLVYipFW1BMr4uDOpMH8tpCSyBJwKlMVQyn13X
         AKNyC4lxELJts8KVMAj3Gv73wIfvJOElzYrPEdXxtWdhyj2PX/lo8zkf6JS5ux4l4bWV
         H3BHL8I5hFs2aa3hX046D0TiBDRJiw3m7jXYgcHQKkXf4RGPxO6xHQxvwSuDTDN6ATQS
         jhKTnADclRUq0f4PPCGqjdnPTkZWHG89plCGdlq1Kr3AxgQYjhg+N+faPuXRC0kaLr1M
         yAwKVlxq1VPnVVd2Yd2w4+DmB4z9o0Zd/U8i4XjYwW5a0Qc142jqlDDOODFl1VHR2bTq
         WumQ==
X-Gm-Message-State: AJIora/ClIjhAA4Pq6pWaRs/I7/X7JVqo3jZPweLzSnORxkHgPAaCx2G
        ZX/HxYoMtjLv7owcvMBVrz9J6+UcOh+Zu2DvSm/y1Q==
X-Google-Smtp-Source: AGRyM1vLRVkO8hwg9Pz2Kx66cfUOsgnFZyC6GhDiNwy0itWwawuXgNNjMw68k8UNLgwOJaiaS88/ZcshKQ0pVth62Y4=
X-Received: by 2002:ac8:5983:0:b0:317:c3a3:be6b with SMTP id
 e3-20020ac85983000000b00317c3a3be6bmr1470756qte.370.1656116486303; Fri, 24
 Jun 2022 17:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
 <1656090912-18074-3-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52RW+UFJ=hqMWjwR8qvEbww7QjzPW1nhL3Atd97QXAnYw@mail.gmail.com>
 <007ea4c9-9701-f4ab-3278-5d36bf2018c4@quicinc.com> <CAE-0n53kNCK0ajHfY2WQr5HEQZtZSBLnhfbTuZwaUNEOZhsKPg@mail.gmail.com>
 <fa7f8bf1-33cd-5515-0143-6596df2bd740@quicinc.com> <CAE-0n51g-EVsC-i9=sJV-ySa8VnE+yT7cg=b-TNMi9+3uBiOVA@mail.gmail.com>
 <326912ff-9771-0711-366d-79acd436908b@quicinc.com> <CAE-0n51qrdrFtSr0vRwgYkMgSZfnzQuinaUROQsp30QoDchWQA@mail.gmail.com>
 <0ff3d6a3-dc5c-7c77-f8a1-6c4f6c1a3215@quicinc.com> <CAE-0n515hMKqQ+Vj1Sg54PpwkbWMYJ77QN+y+KZNBWymjhpWKw@mail.gmail.com>
 <66ff4642-f268-f5b0-7e28-b196368c508a@quicinc.com> <5cf094cf-343a-82d7-91c4-1284683f9748@quicinc.com>
 <CAA8EJprqq=vxXT2DmEWii_Ajx2UbkHRexPTT58xFcWkBa_D5hA@mail.gmail.com> <26263c16-8cbc-ccca-6081-7eba14635d73@quicinc.com>
In-Reply-To: <26263c16-8cbc-ccca-6081-7eba14635d73@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 25 Jun 2022 03:21:15 +0300
Message-ID: <CAA8EJpqEoXXA=eKGHRGuQ3VOHnmEShY8u_SMZ6WFWORCFhFcrw@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/msm/dp: decoupling dp->id out of dp
 controller_id at scxxxx_dp_cfg table
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dianders@chromium.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org,
        quic_aravindh@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 25 Jun 2022 at 03:19, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> How can I have eDP call dpu_encoder_init() before DP calls with
> _dpu_kms_initialize_displayport()?

Why do you want to do it? They are two different encoders.

-- 
With best wishes
Dmitry
