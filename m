Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13F84486FA7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 02:21:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344352AbiAGBVQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 20:21:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344075AbiAGBVQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 20:21:16 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 847F8C061245
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 17:21:15 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id i9so6224288oih.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 17:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=/9SlotMENCux44wQbAsfKzhy+Cu/ZqcUuwyf9fYDVkE=;
        b=UjvIM9QYo+bY3BEpxncpQS7NXTJ9Y+lJTVCkI1V89b/w+7SFs8f2s8I25f2i7Q/6zx
         n5x07iBtgeEolKmAml2Ia5epbuu468orBW8naOxwe+LQ9hsKk+BWR6O4XEq+tv1uK6Dh
         +qDn8fbsX25q2JYWLk8SdEFxx6MZgHBnVXJjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=/9SlotMENCux44wQbAsfKzhy+Cu/ZqcUuwyf9fYDVkE=;
        b=ER5NAjviJRIMLkNTBVs6vDljO+w3FiMzWW/QB3PM+W9I+lowSSs+K2ttLWNkN3ym+j
         xyhEYYgJi+ID0BIXXb/Fn0qlNEJKS5aX0UhCxOPN9b3yiOceX0xRg6xaAGwhFned45jG
         LtCEeMU34QqJh5iUcXjd3MYmEWRTqqvOLYws5ZfHIec9Yyy92IQPH3JyVdbrNzrCAqoG
         iYJQ/X6EtxSZIsQZ80WI82M2du6S4vzP/OVF7ccjm3XqeFoDlhgKhLeK96qeZJbBcpWF
         LpORJbplJIWyYsdfSFxovTjxicwXR1se7o78hcmz4UfEv5nziiuYz/KosGnqiIqZqUUp
         saSg==
X-Gm-Message-State: AOAM532L3uc+ina9yyIO1uOj67o/T8vnbcIqEyZbh5wrYLECkEm57Rbv
        NSRRwbn1Om8meHoZiJtYLSv5PhB10g8K7Ux0Vfml/A==
X-Google-Smtp-Source: ABdhPJyvya1hnP9xuBJucbgcNWItbLuNz5uYbCgMd74jX/VjprlkduKp3+30krJxD2G1v8kziq3fNXKT/i3DTelj134=
X-Received: by 2002:aca:a953:: with SMTP id s80mr8300111oie.164.1641518474906;
 Thu, 06 Jan 2022 17:21:14 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 17:21:14 -0800
MIME-Version: 1.0
In-Reply-To: <20220105231031.436020-5-dmitry.baryshkov@linaro.org>
References: <20220105231031.436020-1-dmitry.baryshkov@linaro.org> <20220105231031.436020-5-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 6 Jan 2022 17:21:14 -0800
Message-ID: <CAE-0n53V9UZ6+dF9JXdFKP7P7tLoQV=rDcuraEmen9t3EUHinA@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] drm/msm/dpu: stop embedding dpu_hw_blk into dpu_hw_intf
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-01-05 15:10:30)
> Now as dpu_hw_intf is not hanled by dpu_rm_get_assigned_resources, there

s/hanled/handled/

> is no point in embedding the (empty) struct dpu_hw_blk into dpu_hw_intf
> (and using typecasts between dpu_hw_blk and dpu_hw_intf). Drop it and
> use dpu_hw_intf directly.
>
