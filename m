Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAA025A0067
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Aug 2022 19:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240159AbiHXRan (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Aug 2022 13:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239963AbiHXRam (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Aug 2022 13:30:42 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 936F47D1CC
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Aug 2022 10:30:40 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-11cab7d7e0fso20534703fac.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Aug 2022 10:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc;
        bh=d2910jvc1FYW2CzUzlDlHxLoXiZignwtt7dqFgJIrVI=;
        b=fcQ5BKX6CF1pB0Q5K+QtelbSTU2ihxqxPUnaPzIVR0MQ/vdL6bmvl5OMW4nPfeQxcI
         xjTPKRTjCubgelgY+XlCapqkiKrgDLZc9Iv5SNleO0KO7Xz048d0ap823yKYrg0UJOiT
         m2Rf5yz4zgPncnzKbEPPJipiprzWzx6yl5n2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
        bh=d2910jvc1FYW2CzUzlDlHxLoXiZignwtt7dqFgJIrVI=;
        b=i8XnGQZN7x9Xmihavi+cjMPTBsoYUAygdlpeDlf09Ax8hX4i5yxUwU+sYcGF93abFu
         pzOi0N1WiQQJ/oHoE9xfJE6JNsF33MD191EixgTA+JJ4EUaO5twsjGBlurgYoRNjDOHN
         WbyAoVS9vG/4UBz//oMKMnWzOL4+4srozE5YijEVSc653wgLTmQk9EHv86veMB8eNURi
         rzANRXXh0jN7CiORsDXCbpb/z9N5uyKvpagMv7ZxMXeTXjQ6bbazAuOHpMpmmKlbFjCU
         FO4p9GTvvlb4vm+HZew6OtJi7GFRij+MEoZ+UyDeKMSXLtOkrS7xDEkCIdASvMtkPO9k
         Dtyg==
X-Gm-Message-State: ACgBeo0IId2Lu4+cFbs7rYksYeU+TdznZNQVGUZDHGabYeGEavGiAmSZ
        eLMPpY/tM1UUZKctNDBjUKeUeHB9ajmrXdhrT1ylaQ==
X-Google-Smtp-Source: AA6agR7QDhwW4ErLZ7pKcygsrPIJ67UAWeCMGbJtFeUUkR9yxPnuX6YfLksltT67IRMFVnSMhpLZXdZbOmpszg5JuT8=
X-Received: by 2002:a05:6870:a99c:b0:11c:2c37:3d03 with SMTP id
 ep28-20020a056870a99c00b0011c2c373d03mr91633oab.0.1661362239159; Wed, 24 Aug
 2022 10:30:39 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Aug 2022 12:30:38 -0500
MIME-Version: 1.0
In-Reply-To: <1661361751-2173-1-git-send-email-quic_khsieh@quicinc.com>
References: <1661361751-2173-1-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 24 Aug 2022 12:30:38 -0500
Message-ID: <CAE-0n50wZkb5sYcZ2g+4L3S7OAYAti+5GEaBDZfANyOJCF3JzA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: correct 1.62G link rate at dp_catalog_ctrl_config_msa()
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

Quoting Kuogee Hsieh (2022-08-24 10:22:31)
> At current implementation there is an extra 0 at 1.62G link rate which cause
> no correct pixel_div selected for 1.62G link rate to calculate mvid and nvid.
> This patch delete the extra 0 to have mvid and nvid be calculated correctly.
>
> Changes in v2:
> -- fix Fixes tag's text
>
> Fixes: 937f941ca06f  ("drm/msm/dp: Use qmp phy for DP PLL and PHY")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> eviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Missing an R.

>
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 7257515..676279d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -431,7 +431,7 @@ void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
>
>         if (rate == link_rate_hbr3)
>                 pixel_div = 6;
> -       else if (rate == 1620000 || rate == 270000)
> +       else if (rate == 162000 || rate == 270000)

BTW

  $ git grep 162000 -- drivers/gpu/drm/msm/dp/
  drivers/gpu/drm/msm/dp/dp_catalog.c:    else if (rate == 1620000 ||
rate == 270000)
  drivers/gpu/drm/msm/dp/dp_ctrl.c:
ctrl->link->link_params.rate = 162000;
  drivers/gpu/drm/msm/dp/dp_ctrl.c:       case 162000:

We really should have a #define for these things. Can you send a
different followup patch that makes something like HBR3_KHZ, HBR2_KHZ,
etc. and then replaces these bare numbers throughout the driver? That
would prevent this from happening again. This one liner can and should
be backported to stable trees.
