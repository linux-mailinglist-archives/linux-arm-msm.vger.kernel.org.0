Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B4C85B0B82
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 19:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbiIGRcn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 13:32:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbiIGRcn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 13:32:43 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 475AEA7AAA
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Sep 2022 10:32:42 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id o4so15227272pjp.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Sep 2022 10:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=PV80BfdzomPMJURi087Oy7m2sToiidrH8fxfw0BanCk=;
        b=WRRE6viD0EvhH9JvdnKy35PydpK4R3QCY/miuWOrErAWVcPaRy85VWJR0c678t9Ppl
         UJeDRqiNHEAe2812nwuVeiQxxbaF2Vp+J9CHb6Zx4SjHwcf1XHtK2bgHI6p85n9jk/4M
         mUBSZhxssIJrPWHUlG1Ie0s75g9vyAhz1qJaelALcMhfxDhL3lBpvZqutwAWU5dDFqtJ
         GhFRKKtxKttbyFedwpl+YK4U/MIidIGNTwjcLrzRbUwpVh3XoI9aOyN0TBAulIfDKo6l
         L7oaMvC6JgAZrFIDLTZrQHKo/3X/J1GyN7JPh54MqIKzf2dcmXjAWc42qTGhixSwoh8Y
         u6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=PV80BfdzomPMJURi087Oy7m2sToiidrH8fxfw0BanCk=;
        b=mMndDqeEa7LynJ9Vxp467H1rsz2dmraO/cMK3fm4eWBCam4UqsXteFRnLtycGO3/SP
         mTpL7tFBtbeU0xQJ2h03lbDSW3UG9KEqZAqPRJY9JqPXnc+7TrccJg6DqNHjczCEySRW
         p9/WQVNiD9MzyL7ayjGOgkcJQdBx9brmeOea57+PahPxhqITCBuyaOwUzkggRcobQwMc
         NJiPuZGNT5E8iaV6c6lf0n53Q7TSXPAywRf0hMV/yhU5GUXhTKzyJSGCEWI2P1z9GTOP
         ofhFyuoHBVT5Zzq/W9nSrWLPQkqdyxLHznplO2LtC+Xlp8rtmSHuYbsjWvdBnZoNdPlY
         eKag==
X-Gm-Message-State: ACgBeo3/F+NmvID8vDSlk/pTcZYyFgRL1WCxlKWe7CAcm5uYm7NNHTdp
        j/huWV3z3LW7lVgwcm+T7SMl
X-Google-Smtp-Source: AA6agR4UATw/VzqQynEchHeCQ6k+uSoa//y5hg8/e35Ta7K7Nfw3Mu88+Tq3J1V+IwbNulUfgaL6Mw==
X-Received: by 2002:a17:902:e811:b0:176:a865:8b31 with SMTP id u17-20020a170902e81100b00176a8658b31mr4905982plg.54.1662571961768;
        Wed, 07 Sep 2022 10:32:41 -0700 (PDT)
Received: from thinkpad ([117.217.178.248])
        by smtp.gmail.com with ESMTPSA id o7-20020a656a47000000b004308422060csm10562677pgu.69.2022.09.07.10.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 10:32:40 -0700 (PDT)
Date:   Wed, 7 Sep 2022 23:02:34 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Johan Hovold <johan@kernel.org>
Subject: Re: [RFC PATCH 0/3] drm/msm/dp: several fixes for the IRQ handling
Message-ID: <20220907173234.GA539582@thinkpad>
References: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 01, 2022 at 12:15:24PM +0300, Dmitry Baryshkov wrote:
> Johan Hovold has reported that returning a probe deferral from the
> msm_dp_modeset_init() can cause issues because the IRQ is not freed
> properly. This (compile-tested only) series tries to fix the issue by
> moving devm_request_irq() to the probe callback.
> 

This series fixes the probe deferral issue on Lenovo Thinkpad X13s. But I
didn't look close enough to verify if all other resource deallocation are just
fine.

Thanks for the quick series, Dmitry!

Regards,
Mani

> Dmitry Baryshkov (3):
>   drm/msm/dp: fold disable_irq into devm_request_irq
>   drm/msm/dp: switch to using platform_get_irq()
>   drm/msm/dp: move dp_request_irq() call to dp_display_probe()
> 
>  drivers/gpu/drm/msm/dp/dp_display.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> -- 
> 2.35.1
> 

-- 
மணிவண்ணன் சதாசிவம்
