Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D63024CC7D3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 22:17:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233417AbiCCVSd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 16:18:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231368AbiCCVSc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 16:18:32 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E97813F84
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 13:17:46 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id y7so6014474oih.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 13:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=e2GwE/etBc8Erbx+qDPyfK2b6bnQoQKlh2QZmZkCGw0=;
        b=IqNBWgHpJBN9OIsvdvC320YGgb7owQkrWetdfLWuoM7P4UlGQdbLJKpof83f9h1pZE
         eScsziKsjuxEjZIiufVnBNwkQEXjjo5Qd9MUy/LeikzbE57826NmsyOpYeA75WBxH4l0
         qPDwDywb807AeIC7YeJwMwMnEm5tlkLpeBQoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=e2GwE/etBc8Erbx+qDPyfK2b6bnQoQKlh2QZmZkCGw0=;
        b=8LxzExeaFyAKAnd8KkvVD56Dahbb5gknaE4ssV0G8zc9BpBM7Frb+IyXJY3uF3JGAW
         5AVX+G/DSiObdG5dKkZOEm1+QjVLer46IxNFr1g+rCctAxd5rz3CWCWSGlzlElJPWJuT
         ZN3Jcm8iazGUkfmkUVz9kRqeJcUFvhq1Bro/vyA8bb8jx+9MxmU6UVMkskhlbLL8CFV2
         9TND38douL2mgkwTMVmMWV+6RRKoTxcamtECltKyef2atHrLnVotZ/vfzvvjTEUeXoGI
         6ajav1ypPSkYA69bLGYvPE7FeeWr0d3c/qodZH6ki8bSTzaH/JWKvUQrd9/hKATm7Gyx
         OieA==
X-Gm-Message-State: AOAM530qzA7nMUhj8Jlbkh3NMNpLxung9zQMDX/iwYazyrwBmiDeBw6F
        TbtcJXjONyeLPjBGHq9C/zI7kgHkebUwYkzVt+QuQQ==
X-Google-Smtp-Source: ABdhPJy2OaJ7nt/oAxQEwMPJPSU7tb3bmd7tpnufgN1Oxgb2jMr1nMe0XjmXO/BnyT9pVQtNgRdAzGzdxiSdKJs2gkc=
X-Received: by 2002:a05:6808:20a7:b0:2d4:d2f1:9edc with SMTP id
 s39-20020a05680820a700b002d4d2f19edcmr6391521oiw.64.1646342265870; Thu, 03
 Mar 2022 13:17:45 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 13:17:45 -0800
MIME-Version: 1.0
In-Reply-To: <20220222062246.242577-5-dmitry.baryshkov@linaro.org>
References: <20220222062246.242577-1-dmitry.baryshkov@linaro.org> <20220222062246.242577-5-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Mar 2022 13:17:45 -0800
Message-ID: <CAE-0n53D_UwHZ8zCiLdK3dH+1JjdP0XrXVPMFjKpUMt1OReDdw@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/msm/dpu: drop INTF_EDP from interface type conditions
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-02-21 22:22:46)
> To remove possible confusion between (old) INTF_EDP and newer INTF_DP,
> stop using INTF_EDP in DPU's code. Until the 8x74/8x84 SoCs are
> supported by DPU driver, there is no point in using INTF_EDP.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
