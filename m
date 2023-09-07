Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2432A797E11
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 23:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235903AbjIGVqa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Sep 2023 17:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232467AbjIGVq3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Sep 2023 17:46:29 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C86FBE4
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Sep 2023 14:46:25 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-502984f5018so985732e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Sep 2023 14:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694123184; x=1694727984; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0aJKWXfzmj6u8YEdkpXnNHt6AfonPZoyqL0Kn8VibLM=;
        b=ZcmGslqmqlDSa5eGDBLqcrPv/KtlEfAAgSKrlx0EGsB9Ybih7fzH/uflIkqVwckNnn
         dvrY8AWyoW0tc0u8nJfXSLWebuFcE3aKir8nTuw5LiFSQ2fcHqjfQgsm+bP3vxvsSQ6g
         zwPmKjKq8dbTmFZWc1qyzhdVY6Kk/kbMb4iz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694123184; x=1694727984;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0aJKWXfzmj6u8YEdkpXnNHt6AfonPZoyqL0Kn8VibLM=;
        b=Nou0wIwBpKNaazSvFtAoCxBKQE+Krz+unZ/lvRr/3/u1cDe5I2rqsv7GnzkEHE2fAb
         P0ArJsb24EzlswGmxz/ATpZ870ogDEXYSpKyiOXEE1bvwEcrVR0RcB/onxoVGElV7c9k
         /+hoE5KZD+7xKejnyDtQ6HgVqZqLUWT9RX1YFnGpSqiZ7OJCPM7shMQvKGdNJ7zBPAcB
         OeeddNrgLdaRQ3QN2C24bmxWjVx9h8SYuv2IFUeDfq5arjaQWvAk0ccsMnH+8NbLnDKu
         V9mcEEdaM3SRJsQkPMHX28DHkYEM5r/6wigmEh3zBroBBBkkJHrNkiHeiwD0o2s8Aoin
         nzow==
X-Gm-Message-State: AOJu0YzeuS0A3g/u5E3+wxV7RUcLz/d4ZguAAAHh+/Jwarbw3kG74Ym+
        4KSEzYV1nbkBTaTOY+OyCffz+xM4+qAbj0+KYdVB5YzMWDOeHN+f
X-Google-Smtp-Source: AGHT+IHCYUG2aXeuH8XR1/58/wZYVhoOZXlsf/DM1LN42R4sD0m7j2f7XInEKVsOAn44UvBmdusGotPNNdkAxrXQ784=
X-Received: by 2002:a19:500f:0:b0:4ff:a02e:a53f with SMTP id
 e15-20020a19500f000000b004ffa02ea53fmr435355lfb.52.1694123184093; Thu, 07 Sep
 2023 14:46:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Sep 2023 14:46:23 -0700
MIME-Version: 1.0
In-Reply-To: <20230901142034.580802-1-jani.nikula@intel.com>
References: <20230901142034.580802-1-jani.nikula@intel.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 7 Sep 2023 14:46:23 -0700
Message-ID: <CAE-0n52T4VGVVKqZCJwhpxe=vLUb7WNi=J0hdsHFOqA95u-Ymg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: skip validity check for DP CTS EDID checksum
To:     Jani Nikula <jani.nikula@intel.com>,
        dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jani Nikula (2023-09-01 07:20:34)
> The DP CTS test for EDID last block checksum expects the checksum for
> the last block, invalid or not. Skip the validity check.
>
> For the most part (*), the EDIDs returned by drm_get_edid() will be
> valid anyway, and there's the CTS workaround to get the checksum for
> completely invalid EDIDs. See commit 7948fe12d47a ("drm/msm/dp: return
> correct edid checksum after corrupted edid checksum read").
>
> This lets us remove one user of drm_edid_block_valid() with hopes the
> function can be removed altogether in the future.
>
> (*) drm_get_edid() ignores checksum errors on CTA extensions.
>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Kuogee Hsieh <khsieh@codeaurora.org>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

>
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 42d52510ffd4..86a8e06c7a60 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -289,26 +289,9 @@ int dp_panel_get_modes(struct dp_panel *dp_panel,
>
>  static u8 dp_panel_get_edid_checksum(struct edid *edid)

It would be nice to make 'edid' const here in another patch.
