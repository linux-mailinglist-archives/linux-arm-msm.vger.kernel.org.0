Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B136A43DB2F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 08:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbhJ1Gg7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 02:36:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbhJ1Gg7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 02:36:59 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C31B0C061570
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 23:34:32 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id 107-20020a9d0a74000000b00553bfb53348so7285188otg.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 23:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=PRgWCRCX7AtwJtD++BtDcASmdtlLCky0vNsp17MLlCo=;
        b=em7rMEP++cDD6gn1cQ27hJKr0PZKndl+gMTj5cIe4wcUsLq1UdZ258NJ827zstWX79
         EmDvUqjsQQT7BlzCpY13u6u29OM3jwkeYBAvmvdv1rvMxknpaUWbppiNXIueAmOAvjPz
         LhbvwuU3B7empW598hrp22LTfyfUFg6buyuU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=PRgWCRCX7AtwJtD++BtDcASmdtlLCky0vNsp17MLlCo=;
        b=CbZr8/SECe0sLI59XC0cdTrwVfSeG6oB8OX7DUpvOiiKbblu3+MXIEtxR4toozWpc+
         QZtr+7PMMBfxZlVK/P+MV4XV7Xe9CWDG+cIDtEJfsG3JcrfODqkZMphhifwKM17LYvzT
         Rp9sbHqTAJN1T3oksLWs1UOmRvSB9FLFry/klMMehXOeEM9OvdRGah06VuQQWa8DyX3E
         vlFFLrfoLyeUfW/B/RvM/Ug0UX5i+3NNS55wHUR6F74oVyF5e0k2YffNLvFM7IAcwDPf
         GgfZdo5DGMjKNTTHOZr1G9CWjMTeLPPXDw1RxKB5fICS0+Csm3C5kJqtDWRnYC7sF1Vy
         QZVg==
X-Gm-Message-State: AOAM530QdhqGDnMBdkQSceSptGMVyvwcCOV6ZChId7hewYOnxjPS9SfU
        /XGUnsu1X8AnTjcP7fAlAG1P93CD+PyJrVIoCVRoKg==
X-Google-Smtp-Source: ABdhPJxWcOa3Xkk6Hw5Lr0txJqbDDMJPmnfEf8oGlsnZUqb3TVVAZTrS+4RFqV0jimxB4yUnK+VWxsK2/WZ+xbzr3qU=
X-Received: by 2002:a9d:6e16:: with SMTP id e22mr1863400otr.77.1635402872221;
 Wed, 27 Oct 2021 23:34:32 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 Oct 2021 23:34:31 -0700
MIME-Version: 1.0
In-Reply-To: <1635386088-18089-6-git-send-email-quic_sbillaka@quicinc.com>
References: <1635386088-18089-1-git-send-email-quic_sbillaka@quicinc.com> <1635386088-18089-6-git-send-email-quic_sbillaka@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 27 Oct 2021 23:34:31 -0700
Message-ID: <CAE-0n53U0JARXjzt=Hr5kfEdEHJR5AFKYx796V7LGbn6CVnVig@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] drm/msm/dp: Enable ASSR for supported DP sinks
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     robdclark@gmail.com, seanpaul@chromium.org,
        kalyan_t@codeaurora.org, abhinavk@codeaurora.org,
        dianders@chromium.org, khsieh@codeaurora.org,
        mkrishn@codeaurora.org, sbillaka@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sankeerth Billakanti (2021-10-27 18:54:47)
> The eDP sink on sc7280 supports ASSR and dp driver will
> enable ASSR in the source hardware. The driver needs to
> enable the ASSR field in the DPCD configuration register
> to avoid screen corruption. This change will enable ASSR
> if supported in the sink device.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
