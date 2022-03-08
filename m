Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 661B04D2288
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Mar 2022 21:26:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349931AbiCHU11 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Mar 2022 15:27:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242196AbiCHU10 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Mar 2022 15:27:26 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4550E50E1D
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Mar 2022 12:26:29 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id q189so467055oia.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Mar 2022 12:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=8SYSMYpMF1JLUrGJB3nmVLCJBpd8wl7WznHJ+HFs9K4=;
        b=koKeM8A9VVDPFv1jvcqwyWztjsWRaPM9RHLQWPbtyPj2BvTe7AJnmIlwxvcZ0OY/Hj
         yY7V7M4fq6YS/XvNRBGaJeKEohKUlddhSPQYaJ5+CEvtxiGZ9LNaDSO1/eApKyGMOKmk
         Xg2bU2rviiONnXHI+phTVUVWUXL7J6EZGY+WY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=8SYSMYpMF1JLUrGJB3nmVLCJBpd8wl7WznHJ+HFs9K4=;
        b=ukyIL5+dMQkkWE/5h3u4edFVvuqz+ebeFr1MkoC5KjE6IjpsEU7uV8roI6xCKivrf3
         myXDhtQ4Mm7it7a+nmi/sSGR6xl37Cy8sCAMzxb+FukA7JNUL2sMAT5MC6IgIDeTgQ1E
         OuNwF1MCk8izt/ZKAXtv9RlRlFin+3J9QaqyGUSnm4CvbNCpvc7GpHrzrugQAByphglK
         FsT+hWNlz+668r027k40dmT1HsvhtEpwGOiR4PMxdqM6Y2Y5aYFDccROlVv3rvPDhPzy
         Ly/+tPa1EU7n+CCP3CJXzmrYxW/k0RYNyUHrK9wVdquTJkbOJHyB5xBfJjj0I5jCJqM3
         T5QA==
X-Gm-Message-State: AOAM530CVI+mr33a1x/PVovaGlbjW+ljQBB637NVhhHTryzyDZqsMUJH
        Ejvs9IZxz2qI9ZB18LiHIL7ffPSHsv5tHhgW/zC7Ug==
X-Google-Smtp-Source: ABdhPJxLhnbKfyfH6BsLllQaul5SJ9MYV0lbMZKb+ak0yvA5zeaYuVULnVx7opW3jo+sQRk8z4+n9XteWweQvTP69oo=
X-Received: by 2002:a05:6808:1391:b0:2d9:a01a:4b9a with SMTP id
 c17-20020a056808139100b002d9a01a4b9amr3785266oiw.193.1646771188650; Tue, 08
 Mar 2022 12:26:28 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Mar 2022 12:26:28 -0800
MIME-Version: 1.0
In-Reply-To: <20220304032106.2866043-3-dmitry.baryshkov@linaro.org>
References: <20220304032106.2866043-1-dmitry.baryshkov@linaro.org> <20220304032106.2866043-3-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 8 Mar 2022 12:26:28 -0800
Message-ID: <CAE-0n53X2QzWw5mDqsw-Z79WuK75874B9pZtw2vQoC5hJMXj_Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] drm/msm: remove extra indirection for msm_mdss
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-03-03 19:21:03)
> Since now there is just one mdss subdriver, drop all the indirection,
> make msm_mdss struct completely opaque (and defined inside msm_mdss.c)
> and call mdss functions directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
