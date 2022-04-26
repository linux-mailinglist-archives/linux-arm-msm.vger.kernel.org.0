Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BEC051049D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 18:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbiDZQyi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 12:54:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353452AbiDZQxk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 12:53:40 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79EB7483A1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 09:48:56 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-d6e29fb3d7so19966920fac.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 09:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=m0dX/1KkBnKssPmbdM8A9ciemnXAWPrdbbwKQbZ6324=;
        b=lbevqTbjrMzew+TvBUwm8ga5txWZPoMaMRCYck3EkDpZOmQVjZzWs1fkRugwMUs3Q4
         rSogqI5UhQVAGgfUnjFPMDg0I4SNojGEZpdedS3rgZnfwvGL9yIR0hKUGXNVN37AzPOn
         +Xmz/huEGxKXt0+gVSIQP44eFAsECuoqN4gV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=m0dX/1KkBnKssPmbdM8A9ciemnXAWPrdbbwKQbZ6324=;
        b=61JCFZSQqFjh9EMS2b9C12BH/uZESArTG0NZwLqRvRk+/B4nlZqslxTYWDavI48fZJ
         H4w1B5izFgrzinHnDUXZDLIeapOnQrzR0eYMRSA2gHoIdeC5qj7Td7uO+F6YnLebbcuP
         p3QqCYkJkq0kDt6JAdK9ozncm1Y+09Gax90LUq9DRkT1xIBF9AeUrakQyrxLDfSyadJ8
         agw2sTeAuAF4SSY6qbUK5M8DkxcIy5tiQRfsKw95WaJ5mj22diWSqAXpp6hon+zkHAlr
         3s5rZFnKCIXd9mPLQp4Wd0lCdQJzBg+F35Ezi52R35FZESwzf6olXJoXVWHUsanzOk2V
         uTTQ==
X-Gm-Message-State: AOAM531yssWjo1rfKdfwNphiEzdTmQSQvX3T/z5V7QIfdrlDFpBHwVOQ
        N2vWKN6DQvZBUBELEgpWJpXjP9seN3yYnOtfJwxEng==
X-Google-Smtp-Source: ABdhPJzJoj8RebjuyUxme6w64EO990J12PUN0kdxhOkG64VbiJmkbcwOUDHEsfvQOnjxeHd9GO22tLYxG/peHrubmCc=
X-Received: by 2002:a05:6870:15ca:b0:e9:551:6d1c with SMTP id
 k10-20020a05687015ca00b000e905516d1cmr8126116oad.193.1650991735808; Tue, 26
 Apr 2022 09:48:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 Apr 2022 09:48:55 -0700
MIME-Version: 1.0
In-Reply-To: <20220426004128.2832555-1-dmitry.baryshkov@linaro.org>
References: <20220426004128.2832555-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 26 Apr 2022 09:48:55 -0700
Message-ID: <CAE-0n539VhBtwH8wjZmkraZE08-ZY-Yjq3Po8eran7yE4q-20w@mail.gmail.com>
Subject: Re: [PATCH v1] drm/msm: select DRM_DP_AUX_BUS for the AUX bus support
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

Quoting Dmitry Baryshkov (2022-04-25 17:41:28)
> Add missing dependency on the AUX bus implementation.
>
> Fixes: 82c59ed16695 ("drm/msm/dp: Add eDP support via aux_bus")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
