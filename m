Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01CC9372524
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 May 2021 06:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbhEDEgc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 May 2021 00:36:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbhEDEgb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 May 2021 00:36:31 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F73FC061574
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 May 2021 21:35:37 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id d3-20020a9d29030000b029027e8019067fso7120605otb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 May 2021 21:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=12EeYennVqX2P8FOG2dNNIcrhuVTc1/1jZXtCarHoKM=;
        b=MSPmW8/ZKloKD0QDPiin1h8IqReGKHeqHXMAsiYNU6k3yqy+Tyd86qOIUhBCloDcgQ
         /LA7Rs5mdwb+VyvpdAb25xBsIbQQ9JaXe/e9+dcE3b4+ZERwRX0oSSrK2EW67kWcAWKX
         VajqY9gCYR41BVR/gaGhPObohRvZkgAD8FUaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=12EeYennVqX2P8FOG2dNNIcrhuVTc1/1jZXtCarHoKM=;
        b=lF/ModRz1NzxYHXWWLM7PtY9l8A8mH8TRHgd8qNjAlPZMucuRbMdXRbvu08aRRhcw6
         pHX/Mgm5EHxb1a+n8HC+aeUHeAo2/t1c+E0+YhR+oDBFA+ahW0q2JQpETQm/Zwc5MEf+
         HjsOES4d5jUWDCxwkumFdytfEjwNsyf3IaaORziRUwkrKC0qfeX4hqnCQasmoDiAKNFb
         TjXvdnPPTdCXuc492WxjsPsGccQ9ATu70KawLvIZeD1vcEE67HETu9Z7lIVg/NicaVKN
         jT8/QD2jk9eMN0JKmmWO5t8r4O+5D799dPOOJaFLLVyqo/YOqpGJMmOZYThfaebXn1Nk
         WIeA==
X-Gm-Message-State: AOAM531WKSTsx9E67DZw8kh/uzsY0ekmxAoL8ZCG8/OQ4B4T/eFnHXVm
        GA282tmJD7GoXT8yC9E2PNQ1ObybCqp5IxkAM9yYNw==
X-Google-Smtp-Source: ABdhPJwjtAQf7I6rJSTL2NdHu7gm1KwLrNIZrA2fuZntbiIwPRA8HpdUJT6TpqFrmficTe1/yOI0+5z2M/cw+exheHY=
X-Received: by 2002:a9d:5e19:: with SMTP id d25mr17257855oti.308.1620102937013;
 Mon, 03 May 2021 21:35:37 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 3 May 2021 21:35:36 -0700
MIME-Version: 1.0
In-Reply-To: <1619048258-8717-5-git-send-email-khsieh@codeaurora.org>
References: <1619048258-8717-1-git-send-email-khsieh@codeaurora.org> <1619048258-8717-5-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 3 May 2021 21:35:36 -0700
Message-ID: <CAE-0n519sFBeLsNF8=Ci1y_xfY4dRuPRNHnJ++ZXHgj6Z6LhQA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] drm/msm/dp: dp_link_parse_sink_count() return
 immediately if aux read failed
To:     Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
        sean@poorly.run
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-04-21 16:37:38)
> Add checking aux read/write status at both dp_link_parse_sink_count()
> and dp_link_parse_sink_status_filed() to avoid long timeout delay if

s/filed/field/

> dp aux read/write failed at timeout due to cable unplugged.
>
> Changes in V4:
> -- split this patch as stand alone patch
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>

Can this patch come before the one previously? And then some fixes tag
be added? Otherwise looks good to me.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>
