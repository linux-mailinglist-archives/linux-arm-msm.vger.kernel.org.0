Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5CFD546E8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 22:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348285AbiFJUlX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 16:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347415AbiFJUlX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 16:41:23 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F23673F319
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 13:41:21 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-fe023ab520so612843fac.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 13:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=1wOc0J4fYT2fujAD0N/SFPgzt/fgt6blJDB3o4DP2ak=;
        b=HJndNUV/RX85HGvljX/EtGuC32YxOaIkn0U7bRqjBppXY0Jjfc12XCvOOYrw6VTM1g
         9OpOq0EKOn5tD06F+MsK7nJMe8SORGdywqBhNc2BWf+v9TSFSoNO75b2jXiBnvpA+PYA
         kaUbt9thYk41DLzgsEZlgZpMmvd/4p2oTDqx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=1wOc0J4fYT2fujAD0N/SFPgzt/fgt6blJDB3o4DP2ak=;
        b=tmeZQbE7dvgegJozxBCbn/cj3rl6C8G0CN1YRNMt6h6nkN3hUFtdwoQn9/a4p3MFY7
         H4Pftv8h2M+SWNV9KXBvl0zivUI4w0EcFWJNIug0UbSczogDKIKQZXObTCTkduK47Ayw
         FjuppC71Yi38VwUiZCEyrcLgg/oQ8WwwFGfMBcLbYFpiZOvLv00Kizr7FdSR6e8td653
         z+kyS3NfI0YqSwy5KIFGdZaK8iaeFiKLO4MVCziagHXSrHBAGSKrmxoVAopPH+tM1Y4q
         UYkhNQy6LRWxyU8zdWWDnG30o68WAccSd3mV110dXX8DithtU4IjrOReILtJwLwE5Rg2
         Uosw==
X-Gm-Message-State: AOAM530N63z3h3bfyKPeCU6lNiZFeN0XXCiBkgAxU0Tb/SMlXQf1E4sZ
        TFcyk3cI4HqNqrSywmcZo3dxWZXJAAqmehGhoPKz6Q==
X-Google-Smtp-Source: ABdhPJy1FIFw0/ZajJ73h4iKWxSpPY7TneAyV/yA60TeLcm44Rt1c746tdIuod7oRox8ozRoNH+AI+oN7vt+zXmGddg=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr927327oap.63.1654893681353; Fri, 10 Jun
 2022 13:41:21 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 10 Jun 2022 13:41:20 -0700
MIME-Version: 1.0
In-Reply-To: <20220609113148.3149194-1-dmitry.baryshkov@linaro.org>
References: <20220609113148.3149194-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 10 Jun 2022 13:41:20 -0700
Message-ID: <CAE-0n502VOOw2bU7f+Qb4_JeH1WgWL49gxk12QNrGrxH-GFs7A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/hdmi: fill the pwr_regs bulk regulators
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-06-09 04:31:48)
> Conversion to use bulk regulator API omitted filling the pwr_regs with
> proper regulator IDs. This was left unnoticed, since none of my testing
> platforms has used the pwr_regs. Fix this by propagating regulator ids
> properly.
>
> Fixes: 31b3b1f5e352 ("drm/msm/hdmi: use bulk regulator API")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
