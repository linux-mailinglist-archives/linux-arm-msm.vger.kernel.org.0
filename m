Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A33CA514030
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 03:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346055AbiD2BXa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Apr 2022 21:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348211AbiD2BX1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Apr 2022 21:23:27 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6513DDA
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 18:20:10 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-e93ff05b23so6847876fac.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 18:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=R5FcMtHB95cGY7bqn/aaSoN9px3b2CiohH6o45BGCPc=;
        b=lZBTXOPrH/HQgFZDRSQ+AY62amn6CUuRdEyr0/a9qQawZ8dn6Y8nRvZzaR1iK2ozO7
         6mw9RcrYRHZ9w2BVpwK9G+Sj5UUYxHSHVOXXHhOKX8o+doQRJh5wqTflrmbRz4qbM6hE
         38duCGZLzGB7Qd7BtMXXTK5L2cdjP9J3cD6GQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=R5FcMtHB95cGY7bqn/aaSoN9px3b2CiohH6o45BGCPc=;
        b=q2wSFUFQOLIzZRRZ4a4hKPVDRYD6fGkIZP47pNNV3p31Kc5fjrGjvuawzqDzclDX4v
         1kWqLnetBtsdFhOranjwHH+/QYgiZAXhMc7LL234Jgloy2Z7GVawb60n67Eo3nyMYTAv
         IqzYBv/om1153XJH4q3Czep4jkXyLfV/d5BVi+USJwzK9QH1LCRcwu6iOY91gmd9o2oI
         VwiRTKn8Bi83YCxmHzTfBXWhM3Vg/j+yvDF/k9RGg0DqB4dpAUuNBemBXASy0kKWs6IX
         oDLYe/iGAKATGo3bT6JPXZJpRWAQpsRvj98qtJfjJ1+DFCVFnYYkj3GJRn1FZgG7o+eo
         nd6w==
X-Gm-Message-State: AOAM5327yOVibzkBpNCK5Jz7iUYklj3yhzIN5mGXn4Do6PgODREr9GU5
        zy5hExr0Wf9xAwPXjpXCYi/S/b8yUONmxTqnYU9N1g==
X-Google-Smtp-Source: ABdhPJyct3+Dz7vTxA3RPk3QX+auuKudDLIw7X3JH0Xeh4QWS37W/QrLu0SWV9IQXMUw1wOemKuBCG9GS9ciqmqkCmc=
X-Received: by 2002:a05:6870:15ca:b0:e9:551:6d1c with SMTP id
 k10-20020a05687015ca00b000e905516d1cmr371956oad.193.1651195210193; Thu, 28
 Apr 2022 18:20:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 Apr 2022 18:20:09 -0700
MIME-Version: 1.0
In-Reply-To: <20220217055529.499829-4-dmitry.baryshkov@linaro.org>
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org> <20220217055529.499829-4-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 28 Apr 2022 18:20:09 -0700
Message-ID: <CAE-0n53wAqV3ttugY+VR_zxdZGZGjbitWOppk1zF-Rp-buiNaA@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] drm/msm/dp: set stream_pixel rate directly
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-02-16 21:55:27)
> The only clock for which we set the rate is the "stream_pixel". Rather
> than storing the rate and then setting it by looping over all the
> clocks, set the clock rate directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
