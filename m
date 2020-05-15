Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5A9B1D4230
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 02:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgEOAkD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 20:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727995AbgEOAkA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 20:40:00 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6638C05BD43
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 17:39:59 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id p21so156076pgm.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 17:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MxFx2v3CXXJI2uqpzJc0nTIbU803tm+QFkEcg6RoGME=;
        b=ncWP6c8T/qeB5mTi8dmQ/2f++LBk5CizP09+SlPJnyCzgNs/XM3OV3LABFolMAuaaE
         UYHUIc3yE2lEXImqHTT1olFACAUL2RuRf0qtmuTLimsMw3ZEFjzxm4slAwvUIDb2cFT/
         wcJNyV8sDtE3sXgsivVXiTYvixU3wl/p0/67k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MxFx2v3CXXJI2uqpzJc0nTIbU803tm+QFkEcg6RoGME=;
        b=Ei2sfLQohrjJhIJPTj7ovDmNMKH91sN1zRqDmePqBsSbpo/pli6PykQN/yNYa6d5HI
         nv0JwynT/CT3/SaQruTQxWkb1gBy/qTGxpyWqhxt8LCaI0rhPdvzHXgBDbY492NRUxHA
         N9HoqcsI/TnycCmfQfK2oO/LzCUcL2WTuFfQGLLFz8EfOANgWDt2p67l4yeGT4o/ZQ9P
         yClFyP6EPFGK7oVLaA7/nuADUu7aaKach+xpZKjxtNZLfSi4QAJ+BvaaITiTJ+bowZL2
         5C3Eg0cJW8u5OBZrocjLe2vPBGx0wKWN/AMu4fDD8iwWJLCDxm0o4HxqV6x+mB/bNYwc
         Fd9Q==
X-Gm-Message-State: AOAM530Ysn/gzUqCajpeOthbiwtANiUaKBAWBvEyK4870Yo4yIpwJU0b
        SGJDMeymink9bS9jfHyWrQnDDYrAJ68=
X-Google-Smtp-Source: ABdhPJyyWhg/HZloV77tc/5SwAYHguc5UciRxuk4OrFHLyBPk1weM70XMcLYipySphGQrca0OnCZSQ==
X-Received: by 2002:a62:3343:: with SMTP id z64mr1187982pfz.55.1589503199243;
        Thu, 14 May 2020 17:39:59 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id 138sm334556pfz.31.2020.05.14.17.39.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 17:39:58 -0700 (PDT)
Date:   Thu, 14 May 2020 17:39:57 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        georgi.djakov@linaro.org
Subject: Re: [PATCH 4/6] drm: msm: a6xx: send opp instead of a frequency
Message-ID: <20200515003957.GV4525@google.com>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
 <1589453659-27581-5-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1589453659-27581-5-git-send-email-smasetty@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 14, 2020 at 04:24:17PM +0530, Sharat Masetty wrote:
> This patch changes the plumbing to send the devfreq recommended opp rather
> than the frequency. Also consolidate and rearrange the code in a6xx to set
> the GPU frequency and the icc vote in preparation for the upcoming
> changes for GPU->DDR scaling votes.

Could this be relatively easily split in two patches, one passing the OPP
instead of the frequency, and another doing the consolidation? It typically
makes reviewing easier when logically unrelated changes are done in separate
patches.
