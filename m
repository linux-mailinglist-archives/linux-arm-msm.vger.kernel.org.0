Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 530F71D428A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 02:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728509AbgEOA6V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 20:58:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728500AbgEOA6T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 20:58:19 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4F8DC05BD09
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 17:58:19 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id q9so234402pjm.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 17:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PYudng5R/wrTc6vNtO9kYwTzA6rGU6HzaC8pWT1Yijs=;
        b=im5Kif4hQbjYjGoKpn59HdHsewBmXMA5l9xRvjBaBG8IMXIe228lODRusVefCZp+wB
         lMMb74JQf1vcjIYjoRXUJ9onY/hyUMpdJ0LaVDqcXRyhyQyiVyU5lzHm1RH8l3/gpQCX
         FAoLbHI0FEMXWhjTR5xznZStgNuNZ0Hc5G628=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PYudng5R/wrTc6vNtO9kYwTzA6rGU6HzaC8pWT1Yijs=;
        b=srXLObM/hJh+GObc0eaaHdNi60w5YZJXkbEMV291ZONYev+sDM8Bb0EP+YS9/+j3NZ
         2DthHmusyK1nuZbHgQN58XyqMOlDuJ2chFS0zLaUewqQHsUKq2tds1asawUby4nmShKt
         zXjclXQQ21tbKk9d93iRcNKtBa8mPcO6YSSxI8jRwAPlCgc15e67mmoebqXMoXN6Vsww
         bIwenXyCCN/YmyhalDQoHbQMdIOxXImy+3x8UHzyHEItNLnxNJOQZ2++bOboOxf40S3/
         X2qlOUICUKl9WTzwXWYvDhHIJ4bUsunANmFQ6F7fpdLJJtZ0uXmL+GQszm/TGygc2Ngo
         bj1g==
X-Gm-Message-State: AOAM531Wcq24Er7hzSrFa/Ri9anZY2j0nTb97cqfH78mev7/wV/0SiV6
        3Pbq0R6JXwBzM4ueDuwDlnmudA==
X-Google-Smtp-Source: ABdhPJxye5U4MtIWKA8XEV+Ile2cxBdIwWMj2P7B8bI+uQVmvGBl5gA50D6rwtjuL+/STdr3NPYmXw==
X-Received: by 2002:a17:90a:22d0:: with SMTP id s74mr701194pjc.200.1589504299208;
        Thu, 14 May 2020 17:58:19 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id m188sm363345pfd.67.2020.05.14.17.58.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 17:58:18 -0700 (PDT)
Date:   Thu, 14 May 2020 17:58:17 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        georgi.djakov@linaro.org
Subject: Re: [PATCH 4/6] drm: msm: a6xx: send opp instead of a frequency
Message-ID: <20200515005817.GW4525@google.com>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
 <1589453659-27581-5-git-send-email-smasetty@codeaurora.org>
 <20200515003957.GV4525@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200515003957.GV4525@google.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 14, 2020 at 05:39:57PM -0700, Matthias Kaehlcke wrote:
> On Thu, May 14, 2020 at 04:24:17PM +0530, Sharat Masetty wrote:
> > This patch changes the plumbing to send the devfreq recommended opp rather
> > than the frequency. Also consolidate and rearrange the code in a6xx to set
> > the GPU frequency and the icc vote in preparation for the upcoming
> > changes for GPU->DDR scaling votes.
> 
> Could this be relatively easily split in two patches, one passing the OPP
> instead of the frequency, and another doing the consolidation? It typically
> makes reviewing easier when logically unrelated changes are done in separate
> patches.

After looking at the "upcoming changes for GPU->DDR scaling votes", which is
essentially one line I'm doubting if the splitting would actually make sense.
I'm now rather inclined to see "drm: msm: a6xx: use dev_pm_opp_set_bw to set
DDR bandwidth" squashed into this patch.
