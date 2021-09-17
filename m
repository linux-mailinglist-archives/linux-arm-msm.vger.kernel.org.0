Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2CA840F09C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 05:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244210AbhIQDz5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Sep 2021 23:55:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244166AbhIQDzx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Sep 2021 23:55:53 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09F99C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 20:54:31 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id p2so12203434oif.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 20:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Z2XZ+ejIq8gAO03IprEPqdCwXRdO4jg+APIYrokV1Ew=;
        b=Rp3rJu9n89T3K7fmu6SfCo1sN0C2kzBXotX3/AHB1rVwR61CApN5AJQnffzqEdrGZa
         QuNT6a3cQziXs7y6ZcFZciqSM5sr+buMhOIKWiDZF5/4+TnYqo4ChqsVNHYtTPrySMiN
         OQDxBfP2g600GDx4NeR9QHxbSAXLc+xB7qZ18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Z2XZ+ejIq8gAO03IprEPqdCwXRdO4jg+APIYrokV1Ew=;
        b=1dQlCIwIUhilgVqaCa8KwPoSmoIgXIQ4MeeZMkECAwa4c4oQknpbAdIzcIJnSKc3ob
         Y3v1jAuctN1ogI8fHFsuhPiAWzUAodhNX/B13cPgdf92wA0Z2M2VZLUiQ/5khT8VhnjQ
         hO6tP4Ue+HHWx4i+nUqpoIFCFwVHLsi10xTGsU7zCAITMlb7UrTgyJTBLBdS/j9DC3z8
         syTgd/KYXCU3xm/3oqpjkR5efMSUHqKrOiJ6xcBLfebAqSJSETtPMSC0OD0Lbu8FjUbm
         /INEiKE9tFKY5wpIDlJnXY1mt03gCxWI0/VDfJobhye8kHCsIi0swaf6Dkdm9MbEQvrT
         hZ5g==
X-Gm-Message-State: AOAM532cl6T8rpPAZuH/T6xRWBsyvKimjQAToqD2Wp5inIXkmJcZ4z79
        ExSHIfWbRuvoBHjyjl4fWEYmzVvMSXees3YaHPOyAQ==
X-Google-Smtp-Source: ABdhPJzIXD5SaZh+FXg6/yC/JnECSczMBKqtkOdgIhgZufWgdBqAqD2dAboj1EodrmE90IHtcOhantUU8qDNKURFel4=
X-Received: by 2002:aca:2310:: with SMTP id e16mr2471632oie.64.1631850870446;
 Thu, 16 Sep 2021 20:54:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Sep 2021 20:54:30 -0700
MIME-Version: 1.0
In-Reply-To: <20210915203834.1439-9-sean@poorly.run>
References: <20210915203834.1439-1-sean@poorly.run> <20210915203834.1439-9-sean@poorly.run>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 16 Sep 2021 20:54:30 -0700
Message-ID: <CAE-0n50Yh+e_jgZ=H=YFV--ojYqqoDJTeqv6iz6vdSWhx6JJLg@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] drm/msm/dpu_kms: Re-order dpu includes
To:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sean Paul (2021-09-15 13:38:27)
> From: Sean Paul <seanpaul@chromium.org>
>
> Make includes alphabetical in dpu_kms.c
>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-9-sean@poorly.run #v1
>
> Changes in v2:
> -None
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
