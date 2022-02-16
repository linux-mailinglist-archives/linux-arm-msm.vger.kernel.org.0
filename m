Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCD7A4B7D25
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 03:20:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239532AbiBPB62 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 20:58:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233285AbiBPB61 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 20:58:27 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82A2F9A4F5
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 17:58:16 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id 4so954766oil.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 17:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=IcgOPc0rJp8sHtsVDdpyt4dUu2ENA7U3FqQVPYdmEn0=;
        b=Gnq6jup1l6drogXm5zLIW7T4+UgswiqhIR3xlYF0j4UoHds31D2nKD2iK/rNbQWLs+
         VMtu3Whx3R3PQFSy8kiwNe4oKUR6dYnbXMewIueKhaPmQWYTjvNQVwqbzpKskAseBzij
         uu1rcEj64gkWdlmyr3K8YZGkJ+oXJ8WUZbvOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=IcgOPc0rJp8sHtsVDdpyt4dUu2ENA7U3FqQVPYdmEn0=;
        b=m5+uYCRpd0p6pyr36uAHIkEiPHpZ/uBw9dz3qFx3PmtfpWQqT2M03oVgmKdp8NJVHU
         FRR8/52AG3x3moWmBb8sV3eyFbf78ng7OOIGMPNGn5dGRuQZCYoGLpHLoMKkrXLSlVRN
         RPV5cBALaqPJTG2SktMfQaS+fNgsRht7cAiyL+vG3Odoqku8R6k2/R/qZxAcfpXsKOV4
         RWjTm3FANGWIEM4S/wcgucNwcrmutuTQmLHSsj+zT6fIMEkJFOTo0aGbz59Jit6g8a1s
         p9DwwLG3q1HG51gV4BuSaTzXHBpqWyuP9F73v6UUL7Daygl315B0YVNHYo9a8TWivQQt
         PjFw==
X-Gm-Message-State: AOAM530NsdDJ5y2yRHcG1I/KG/mpQSOKr1mzPoWPL2WSc5AYraPUtmJJ
        uwflQcEnUDx+X8wrVHYibBZ9UCLGs02nUyHYMXT/sw==
X-Google-Smtp-Source: ABdhPJxcoqJNO+Lsx3UUyC+cNI2rE61Ob18NoOX/UKotu6xvKZnjc0qxwowSFVTdTsRRILeuqwVIjl3tDr7oVqHqtyU=
X-Received: by 2002:aca:df44:0:b0:2ce:285f:cb99 with SMTP id
 w65-20020acadf44000000b002ce285fcb99mr2950770oig.40.1644976695886; Tue, 15
 Feb 2022 17:58:15 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 17:58:15 -0800
MIME-Version: 1.0
In-Reply-To: <20220215141643.3444941-6-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org> <20220215141643.3444941-6-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 15 Feb 2022 17:58:15 -0800
Message-ID: <CAE-0n53VOf=X9-81TUJ_xWVNmz+RPsURXWNBhXLpPpHKZbMnOg@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] drm/msm/dpu: encoder: drop unused mode_fixup callback
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-02-15 06:16:40)
> Both cmd and vid backends provide useless mode_fixup() callback. Drop
> it.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
