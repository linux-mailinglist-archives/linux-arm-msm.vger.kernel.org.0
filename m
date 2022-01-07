Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08BD1486E80
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 01:16:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343857AbiAGAQJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 19:16:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239735AbiAGAQJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 19:16:09 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EABA3C061245
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 16:16:08 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id q186so625974oih.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 16:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=mE1P4O+5lb7Aj+m/u0inLsIsF4f3Obpma9YFsBVI+mk=;
        b=R+c4v+KB6lM8fqhf7qCx4POmsHZ85uFetKficsf+q36Un+SUnj9mAYdkTsUDRSUEum
         3ileYQjfrtriixrocxGrjGqEiu4uGATHnNupNBiTJoL0O/xhscZlTHbAyUz5ryn23sC8
         TDxs9J8GCQtY1X4V4fVgCPSWDG3oMtNcHwmRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=mE1P4O+5lb7Aj+m/u0inLsIsF4f3Obpma9YFsBVI+mk=;
        b=Mj5OI94+7fkGZUFRHvGZ6JqSp1658+GB9FHgS7CWhIRDDIRB/pRGUSb2sENyu1NQPz
         j/bbefbz450uaP/arYUQOrhoaSYwys2iCFdkJgZE3p7WW3iSzzAyJ9Zk0kgS6++fhjw9
         mqFBFlM52HgXfMjeQzLuMZxTuDzqdmqb0Ejm/BRFMXqIlGyReV2tSkyHAgVRJln4b2Hb
         D8v4MbwZiPW8lnWiRnBiejL8YouyPdPgYIe8KXy7vqcnasb9cITQvPtbsYA7nX/0K70h
         ntik0u1DaGzwRSNpux7ZEFH1MKhhbGguvGc/XPyiz3vSZp8fF0jZcQ/8pxAnBSdB/VpY
         20Fw==
X-Gm-Message-State: AOAM531ps/9LsAHa6sXPLP1c2iqS688kPOy4n+Uico4QFm2rAlXhdF2p
        Z0ofSabHfwmm5OhwJMOdIPX+LCUQ5TDmC9Tl5i2lfw==
X-Google-Smtp-Source: ABdhPJxYOfr7WP2LZzJN/EUDtSmVISjJlgmRyG+L1riCyACt9jPXB4g4etKquIwp2+r5rnPWy0RDAAxc2R9ayyc2n28=
X-Received: by 2002:aca:4382:: with SMTP id q124mr8016650oia.64.1641514568306;
 Thu, 06 Jan 2022 16:16:08 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 16:16:07 -0800
MIME-Version: 1.0
In-Reply-To: <1641489296-16215-1-git-send-email-quic_khsieh@quicinc.com>
References: <1641489296-16215-1-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 6 Jan 2022 16:16:07 -0800
Message-ID: <CAE-0n52-SL6jPVtn_wEPtY1FQ4EUZ2PhiQ=agXcnA0AHPV9TQQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dp: add support of tps4 (training pattern 4)
 for HBR3
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, aravindh@codeaurora.org,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kuogee Hsieh <khsieh@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-01-06 09:14:56)
> @@ -1189,12 +1190,20 @@ static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
>
>         *training_step = DP_TRAINING_2;
>
> -       if (drm_dp_tps3_supported(ctrl->panel->dpcd))
> +       if (drm_dp_tps4_supported(ctrl->panel->dpcd)) {
> +               pattern = DP_TRAINING_PATTERN_4;
> +               state_ctrl_bit = 4;
> +       }
> +       else if (drm_dp_tps3_supported(ctrl->panel->dpcd)) {

also

	} else if (...) {
