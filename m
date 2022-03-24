Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB4B04E69A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Mar 2022 21:08:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241546AbiCXUJS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Mar 2022 16:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346425AbiCXUJR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Mar 2022 16:09:17 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D783B245E
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Mar 2022 13:07:44 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id k10so6073206oia.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Mar 2022 13:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Cg3NylWZJ/PElbZt4b99/mDNvvoDZp7ffKlCSxaDUYg=;
        b=chW8YydqlNUXwkhifh8g9HI1cQG2scXiQLAtd/9C96Ro0YahW6RUj3JdB3ortjEQ5D
         XYIEzngiMK0LVLardc9TBW9wmke8bxwDrQw81faArJaoCdNc5/aXcNZO7YTasnEXsj1d
         rNu4CXlzwVi1omwO68IOCQInfhnTIfAIjPtgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Cg3NylWZJ/PElbZt4b99/mDNvvoDZp7ffKlCSxaDUYg=;
        b=VlwsO/NuJEi1/c//FJToMCePheXqwDxQQEK98CddpRaCiccW1LNB5UGrrhSn4TbtDT
         BpkzCjzrSNaj1O67ERldFURV96Of+Janr3vfzlLkwHweoQbtaRfvfu9rKhYrFajbymQu
         bACYL3HsZFR0CAM5q65dAh3W8LkqusC4wYHDGPEpNRytCWzqR7qkrZMh7a1yZnqAaccj
         SxshArb3YeSnEKSjU2UfJBOxjPm6evNoVJgGYXGDAQ8vLSbZc9a+8UpTgrZVmZ2pHLkz
         A58Q2SzgJEFTV3U0zYD6cGIupUY0d6bPl+hjAZkGrHgH1gbLkSIvwCYqU8q/INYI/Y0G
         25lA==
X-Gm-Message-State: AOAM5325TIyDvix0rfb+3x0S2O8+lWNi3s6Tomwye7MmAa3GXeAmaXFa
        1+jY2lKr0JqQmZqAe76L/U5+vUERPSP2wvo7xcd8rA==
X-Google-Smtp-Source: ABdhPJxLd9283LWH/H+RVJS+GlWfRyT8dqeb5nlwjkad7sBHwIlXo5+tm7x05Z6jNmDfcbRKWPNOiVp0XJG/1vESqBQ=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr3297126oie.193.1648152463729; Thu, 24
 Mar 2022 13:07:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Mar 2022 15:07:43 -0500
MIME-Version: 1.0
In-Reply-To: <20220323103546.1772673-2-dmitry.baryshkov@linaro.org>
References: <20220323103546.1772673-1-dmitry.baryshkov@linaro.org> <20220323103546.1772673-2-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 24 Mar 2022 15:07:43 -0500
Message-ID: <CAE-0n52bf2VHfC+a58+P88bG2WiwDZrFd0hzAPcSFDNC_RYW8Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm/dp: drop dp_mode argument from dp_panel_get_modes()
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-03-23 03:35:44)
> Since the commit ab205927592b ("drm/msm/dp: remove mode hard-coding in
> case of DP CTS") the function dp_panel_get_modes() doesn't use (or fill)
> the dp_mode argument. Drop it completely.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
