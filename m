Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E88A510B1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 23:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354017AbiDZVVn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 17:21:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243374AbiDZVVm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 17:21:42 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ED50C8662
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 14:18:34 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-e93ff05b23so7632182fac.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 14:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=UQdTLiFS6s5lb76z4V/zrcCjKl7kNha5dSW7q7Ju4iw=;
        b=i4UpTC9epX2dJK4owogRVosBAzugi615/pZuFaNT0GMn/rXImP/Z1IkC2BP9L9m3KO
         mOisseWijdZbjf0asGuv7vhXCkSH5GH52OL4ryQ5V/9AvT8Iyl7NkSWHt+uM/IKxVuKp
         8mCGvnSETOUjT5zWn1gPpmQuBa/iZlytHc92U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=UQdTLiFS6s5lb76z4V/zrcCjKl7kNha5dSW7q7Ju4iw=;
        b=HrvaUnHavFc+1+RP9AAvq7mu3qxjNa0VgS0GGbt5O8+IDijCyo6FjrPP1EMI5Ezqcv
         YiJ10ohqQCQ8wPZR0HKKBAqrMl2odgqDx3scJb0EeYLZe6CwH65uuTs3kfgc7VCwWQ5+
         13MoJ6FHzI8/usn4ieOSAqAfAdwadDbPo7mOt6j3dD/A0L/3h4PUiKPVWv1LQSQ8mc0s
         MwV1LYxG/83b6Hc4KPZfpFPQisbo0yTqBrYeQqWxgFguPCmARkOOxlnKEhDVY2eW74iz
         gqEEIHaxkM7NMEqcz/RDS+KjzYEAOxUd7jqPwOrtY3mDr+c82GbslTv9FQo+U0bNqSVo
         EBrA==
X-Gm-Message-State: AOAM532b8gKK8fpdrFQu8AVMuPjBvQCEZdd+mpvLpGQ/kcfbfR+6+8i5
        lYOM8KGn6vyTzvgYr8aSADoNQbYjEh5NY8NrNxWJ4Q==
X-Google-Smtp-Source: ABdhPJyW17NjxF3rs/I0KgToaqsIbXY3bjCBx58ePbAI217dDz1IltjBckzBntvCJY0CiDdmMaXOV9ldviATzU4d0f8=
X-Received: by 2002:a05:6870:15ca:b0:e9:551:6d1c with SMTP id
 k10-20020a05687015ca00b000e905516d1cmr8599802oad.193.1651007913723; Tue, 26
 Apr 2022 14:18:33 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 Apr 2022 14:18:33 -0700
MIME-Version: 1.0
In-Reply-To: <1651007534-31842-1-git-send-email-quic_khsieh@quicinc.com>
References: <1651007534-31842-1-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 26 Apr 2022 14:18:33 -0700
Message-ID: <CAE-0n50Hpt92HAZH2JF88LfXzGEJ8sa4cy5RsnKpFmZ5fWSzAg@mail.gmail.com>
Subject: Re: [PATCH v6] drm/msm/dp: remove fail safe mode related code
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-04-26 14:12:14)
> Current DP driver implementation has adding safe mode done at
> dp_hpd_plug_handle() which is expected to be executed under event
> thread context.
>
[...]
>
> Changes in v6:
> --  fix Fixes commit ID
>
> Fixes: 8b2c181e3dcf ("drm/msm/dp: add fail safe mode outside of event_mutex context")
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
