Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A111C54EA8B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 22:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378037AbiFPUIu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 16:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230517AbiFPUIs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 16:08:48 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE7034476A
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 13:08:47 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id u9so3093730oiv.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 13:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=g0MarIt5zRodY5q9IT6cX4QN+5PJlnj/cbQklvA9bo4=;
        b=oTc4txpVR+TRxDf03YAXJnd7w7kMIi15kQifCYdOP4xSViIWnr3t4XdzyNNG3rpIIL
         bNG9Eu5YKM3U3pgITzRQaAiAOJW8ZSgNfpq4DPWzIZP7TWcp/eKjqPTSGgRIqlkVwsr5
         l6AesSXhoR2lJujYbPylYoJ2fMKm6T7HXLxUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=g0MarIt5zRodY5q9IT6cX4QN+5PJlnj/cbQklvA9bo4=;
        b=qz5BtlwJ6vB5dB8edkhwqUXJEMRxjfnsa2dS4+t5pSmPBdYAtiWGTaEk5XrzV8tDIw
         1lBW6J/Czz7+xu8ybFHdxs72LCaZUG5TmT6BEs7tEnVELRgFQWf6k4DcDvlJDM+qgDsi
         Af8GXPiKN9VKlSVEUi8wJR0fwdUZZ6HF20ZxlxbPxnr7+OqUXtVXBQO94NfXtTM8F/Wy
         xvTuzTDbnTOBoRFX+d4yNWpupaP2xaMHiFTnvisM6nFx/QJDtUM0T9DwwRsUBV3ToZqh
         Hl0Kh60aGdxVw2368wrjccV3LA2CK3/SWl7WaxywsyHyi6sZdpuGwQCYZMavZ4xIm9so
         K4bg==
X-Gm-Message-State: AJIora+/p7CsXBEhpL5CKgWVA/Z8yiyRy46BApJTqLJK7xEpxCI9Asuy
        6vO1EauZV/eF+1n+ZoSGFuzoYf2/aBwyv+7Rg5qUAQ==
X-Google-Smtp-Source: AGRyM1sw7huEffOPIjsyUJ0iDsYukEI2Ma5CpHqS1GYaR2Fbt5m5eafAbo4hwgXr8lsWXVCfQrNZQeEDYyui4gfCEp0=
X-Received: by 2002:a05:6808:e87:b0:32e:4789:d2c with SMTP id
 k7-20020a0568080e8700b0032e47890d2cmr3354859oil.193.1655410127124; Thu, 16
 Jun 2022 13:08:47 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jun 2022 13:08:46 -0700
MIME-Version: 1.0
In-Reply-To: <1655399361-10842-2-git-send-email-quic_khsieh@quicinc.com>
References: <1655399361-10842-1-git-send-email-quic_khsieh@quicinc.com> <1655399361-10842-2-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 16 Jun 2022 13:08:46 -0700
Message-ID: <CAE-0n50GVKagM5Q0vZnMREesJqa99bEouiiB7PeG1nzix7EmdQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] drm/msm/dp: force link training for display
 resolution change
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dianders@chromium.org, dmitry.baryshkov@linaro.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

Quoting Kuogee Hsieh (2022-06-16 10:09:20)
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 0745fde..9a39b00 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -21,7 +21,8 @@ struct dp_ctrl {
>  };
>
>  int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
> -int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl);
> +int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train);
> +int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl);

Instead of declaring it here how about forward declaring it in the C
file and making it static?

>  int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
>  int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl);
>  int dp_ctrl_off(struct dp_ctrl *dp_ctrl);
