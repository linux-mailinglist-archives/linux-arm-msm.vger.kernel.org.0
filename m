Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEED35B1158
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 02:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230446AbiIHAfF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 20:35:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbiIHAep (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 20:34:45 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A408DD291B
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Sep 2022 17:33:49 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-12ab0eaa366so839957fac.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Sep 2022 17:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date;
        bh=SFGgCNsVzP2hA8dRTmquL78fgGPuknySv3KSwNZNScI=;
        b=Q81Rgt/ogZrNSDyvddYfuQRSJ8jdaEmayIg48nQ+NGWpxOPy5bVQ9ah81XgTqkGOVt
         vvtqTSu1hPnXtNsXtdz4D9ZsmnuP7BNRLuvt4tPVIVe0t6uTOCq7mOFEC1plsBc4cXlz
         75x15C7WUmzCKp7LopN4O6EJ3tLRy6ex56pxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=SFGgCNsVzP2hA8dRTmquL78fgGPuknySv3KSwNZNScI=;
        b=li0otmb4UD7a4/H/1IDa1UohXVw2Qb9cky/9kuRY11Nc39eb2bJAi7K7lS8ydqnhW4
         EKkJj0htjDIDNNtL6ggy0/AVltgCWZctQsknhUONi4AsfECiqjL324Pp5QEe8gZD6QXw
         KUWH+ij/kq5Cz6aKDnolqe96YXPS2bmxdyfyunJDNS15bQlrfxZQwOZ8mx1aUohoP+KN
         ktr/AXgZrOvEb34QOnDGFFjaqTgx/maukJZRMhyn+V+b9dUeavEnlHAsqaDJLGSgzOQz
         Lg8TBYPsMGcucBdKh1eV0wnGLWPOY5f0jw9ARrwHOTMu1NkGCP17j03G4+RypWCZFcek
         FudA==
X-Gm-Message-State: ACgBeo149vmusk962oFl+e4+vWgi323eD9QqfZ7KRbuWNQhpOPDlJ497
        ePGVwoG5ixSqiwH+nzC/2V8Wth+4GPMcTyVWJX6a5g==
X-Google-Smtp-Source: AA6agR7dUC9ALQ+u12QBqrhvXOl+Y8+jQSSUkiS/zvQgXKCMc/haJFKwxJsnCL7AvxTgEh5+PbXshQcguphmlfr92QM=
X-Received: by 2002:a05:6808:bca:b0:344:ef42:930f with SMTP id
 o10-20020a0568080bca00b00344ef42930fmr424759oik.0.1662597220632; Wed, 07 Sep
 2022 17:33:40 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 7 Sep 2022 19:33:40 -0500
MIME-Version: 1.0
In-Reply-To: <20220901091527.1992208-2-dmitry.baryshkov@linaro.org>
References: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org> <20220901091527.1992208-2-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 7 Sep 2022 19:33:40 -0500
Message-ID: <CAE-0n52jqAR7cQmYygx5h=bO7kNt33F3BR2nyKWO5mTBtHH=iw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] drm/msm/dp: fold disable_irq into devm_request_irq
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Johan Hovold <johan@kernel.org>
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

Quoting Dmitry Baryshkov (2022-09-01 02:15:25)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index bfd0aeff3f0d..3173e6962a78 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1251,13 +1251,12 @@ int dp_display_request_irq(struct msm_dp *dp_display)
>
>         rc = devm_request_irq(&dp->pdev->dev, dp->irq,
>                         dp_display_irq_handler,
> -                       IRQF_TRIGGER_HIGH, "dp_display_isr", dp);
> +                       IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN, "dp_display_isr", dp);
>         if (rc < 0) {
>                 DRM_ERROR("failed to request IRQ%u: %d\n",
>                                 dp->irq, rc);
>                 return rc;
>         }
> -       disable_irq(dp->irq);

It would be better to not disable the irq at all and mask the irq in the
hardware before requesting the irq. Can you add at least add a TODO for
that?
