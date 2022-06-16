Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1EA254EDF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 01:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378617AbiFPXjc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 19:39:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiFPXjb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 19:39:31 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F061C61637
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 16:39:30 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id h65so3174310oia.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 16:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=p6AMxpkA8TTGmEn1Bk60SJEuUpFSzeYyFwi5LwIblKY=;
        b=QoS7HSJcdZbZ6I1shW8c8Ggj/S/yYty4RWZXUUryK1d2L/wd7sLzx8TtlNWAr5tKPh
         AnyYnAmWsf3hi92uObQ0MmlBsoxc2/xtqjixO2sIOx+fxaF8R06D9WWa6K1q2kC9XnOW
         0eQNoUmCMLsWlyATgVG8WVyxWQX5zBwuwAGOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=p6AMxpkA8TTGmEn1Bk60SJEuUpFSzeYyFwi5LwIblKY=;
        b=oyPTqE7f1xTW7mqxdMbmtOgYcnwpW8Rq4BvXhzTpmEhbdCZX90oeOClgmGjESsjldd
         /whrAIIqFR2SXVqbtr9Y51HXoMC94qug30KKfJpX5nehRGw+ZRG392LVGkOoobe1cg2h
         5YGtiFdCWpB1tG69k0P+rEcUtdoaY5ckLqAmowPGzoD+Bj/wNH488INPCeuZQ5SsT5Yg
         JH/VBmZk4RU9DuJmr/KPyNZz4O9imzEbY6ebU0pKWCjF0b3M85vLHj75pLO3TTDW/JE1
         V1YJjs3JZfqUQGe09I5tXMxeat7oMh0JxH4Ks9CUqxnIiq4lDUCjtVd53O+JnkJq4I2e
         6/4Q==
X-Gm-Message-State: AJIora/Gm2Dy93CQprvSBF412ZtdEQVFVyZKyLNssMQv9pUB6Z54jKX3
        CAINKpx05IqyoD5b+h1eVeMZib6kNK/ER/z7xQmZqQ==
X-Google-Smtp-Source: AGRyM1tJkP1MW9aiih9SxFvzYQIAdzAgdaP270BY5q2s7l4Xb6sprjP3JR24sFt3jyoliB8V5lZ19MPRnckBuygfQro=
X-Received: by 2002:a05:6808:e87:b0:32e:4789:d2c with SMTP id
 k7-20020a0568080e8700b0032e47890d2cmr3721825oil.193.1655422770319; Thu, 16
 Jun 2022 16:39:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jun 2022 16:39:29 -0700
MIME-Version: 1.0
In-Reply-To: <1655411200-7255-1-git-send-email-quic_khsieh@quicinc.com>
References: <1655411200-7255-1-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 16 Jun 2022 16:39:29 -0700
Message-ID: <CAE-0n529kPSzweLuwq60b2d7Z49PZO+N_x3rxQW9iHKGgcqrjw@mail.gmail.com>
Subject: Re: [PATCH v9] drm/msm/dp: force link training for display resolution change
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dianders@chromium.org, dmitry.baryshkov@linaro.org,
        robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-06-16 13:26:40)
> Display resolution change is implemented through drm modeset. Older
> modeset (resolution) has to be disabled first before newer modeset
> (resolution) can be enabled. Display disable will turn off both
> pixel clock and main link clock so that main link have to be
> re-trained during display enable to have new video stream flow
> again. At current implementation, display enable function manually
> kicks up irq_hpd_handle which will read panel link status and start
> link training if link status is not in sync state.
>
> However, there is rare case that a particular panel links status keep
> staying in sync for some period of time after main link had been shut
> down previously at display disabled. In this case, main link retraining
> will not be executed by irq_hdp_handle(). Hence video stream of newer
> display resolution will fail to be transmitted to panel due to main
> link is not in sync between host and panel.
>
> This patch will bypass irq_hpd_handle() in favor of directly call
> dp_ctrl_on_stream() to always perform link training in regardless of
> main link status. So that no unexpected exception resolution change
> failure cases will happen. Also this implementation are more efficient
> than manual kicking off irq_hpd_handle function.
>
> Changes in v2:
> -- set force_link_train flag on DP only (is_edp == false)
>
> Changes in v3:
> -- revise commit  text
> -- add Fixes tag
>
> Changes in v4:
> -- revise commit  text
>
> Changes in v5:
> -- fix spelling at commit text
>
> Changes in v6:
> -- split dp_ctrl_on_stream() for phy test case
> -- revise commit text for modeset
>
> Changes in v7:
> -- drop 0 assignment at local variable (ret = 0)
>
> Changes in v8:
> -- add patch to remove pixel_rate from dp_ctrl
>
> Changes in v9:
> -- forward declare dp_ctrl_on_stream_phy_test_report()
>
> Fixes: 62671d2ef24b ("drm/msm/dp: fixes wrong connection state caused by failure of link train")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
