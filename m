Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0814A5A0033
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Aug 2022 19:17:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239701AbiHXRRy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Aug 2022 13:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234401AbiHXRRx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Aug 2022 13:17:53 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38F177C1FB
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Aug 2022 10:17:49 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id r1-20020a056830418100b0063938f634feso5021940otu.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Aug 2022 10:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc;
        bh=MHYuEVNrNq6xOFLpayXIejomNu0GT0DBxEs7vGrd158=;
        b=WZmQ7PLNtEHmn6SJrYb0tXJV3lUfaM74pbLSdSKR9LMnaK5kGCvh1f3QY7J38pSoIB
         ik74LCQK95MUwF5xTdiHJ3JJ/wd36IqnmQneCLEzyFZ4ghGmFUX4vvXUG+dSM9XM77Nv
         lk/NSNsGdkxOFaxjdiv4zfitg8B6AUUzfSsrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
        bh=MHYuEVNrNq6xOFLpayXIejomNu0GT0DBxEs7vGrd158=;
        b=bKTChD9FnidBA5SyS80QFjde/CaPB7YKaQ882wd5BY01eibBJC/wFYg6H6s8zIUd66
         3/7nGATGLa3N1j+yPk8QxhYc+fBAVijM2H5ja+lvStSZQiuvpKal5mD8d5V+1/z+ab8T
         AWnruaylOeEZKhcqFNC1lL06nKc9vpJW96t4z1UI21UZH0+SeOf6QJtmNBjCfQyKZ1y7
         ursY7SlFkkmZZ9degdgPbFiv11zYETCBPShIrbkbZXDDr8WqVSIXdHLCTbgzAHEHPaA8
         2omUvn+DJdTmU9nqORAZsh/ZBDbA4HyFnYVyjiGBnT8BdV1hWua+Fb9eKTttQSmb30Tz
         mGbA==
X-Gm-Message-State: ACgBeo2fPEcz3B7KPdqBb7GEaoSYD7Lr8+Y7qHBBq3DteBpe6ZlVGTQr
        sYLggidOMy8Z0f7DcIi/SN3HTugEBps3ZF+iPJQxWA==
X-Google-Smtp-Source: AA6agR4zBshr+gUc3WgavtY1TB1LNAO6aNOk9NTWdc2ol+fbKgwzW7gL98pe4oEy1a7xXcIHJjx4KwfdSoBCPBzli14=
X-Received: by 2002:a9d:738c:0:b0:638:9962:8cb6 with SMTP id
 j12-20020a9d738c000000b0063899628cb6mr11204441otk.73.1661361468554; Wed, 24
 Aug 2022 10:17:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Aug 2022 12:17:47 -0500
MIME-Version: 1.0
In-Reply-To: <1661360356-21948-1-git-send-email-quic_khsieh@quicinc.com>
References: <1661360356-21948-1-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 24 Aug 2022 12:17:47 -0500
Message-ID: <CAE-0n52Mqv-qqb4n_Q4iO-reSncNikWd-2xNVG7pgwvx2ThTHw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: correct 1.62G link rate at dp_catalog_ctrl_config_msa()
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dianders@chromium.org, dmitry.baryshkov@linaro.org,
        robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-08-24 09:59:16)
> At current implementation there is an extra 0 at 1.62G link rate which cause
> no correct pixel_div selected for 1.62G link rate to calculate mvid and nvid.
> This patch delete the extra 0 to have mvid and nvid be calculated correctly.
>
> Fixes: 937f941ca06f  "drm/msm/dp: Use qmp phy for DP PLL and PHY"

Should be

Fixes: 937f941ca06f ("drm/msm/dp: Use qmp phy for DP PLL and PHY")

> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Good catch! Thanks for fixing it.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
