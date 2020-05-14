Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 954771D41E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 01:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgENX4W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 19:56:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728084AbgENX4T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 19:56:19 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07331C05BD09
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 16:56:18 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id a5so167859pjh.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 16:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V7AO4OblGlSBwQug8IWxWej/AMRXHDQKDH+1XWLNVew=;
        b=hzggQepQrsKGGnBsKsAANMRY17+1T0uMxt3OSRHq07nFJRt3KU5oRuA+Eo5PsWfqs+
         PFCm8AqB0mGEx18uOYHt+Lq7Ec3Xank+8pNhj4oDSf+u4lUtGp76aHY4RkH+YZphAaRt
         R/ShiS2/ZyKNvNg3n6iPwASRzJF7ENniMAaps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V7AO4OblGlSBwQug8IWxWej/AMRXHDQKDH+1XWLNVew=;
        b=YMsYtKUFpZl8kg/IDdn/rkSkSYL00VuHc9ROmXAhS0RhcwruaEgUmhBGRcrxWRYc+J
         vU8YPi3+8O/rsTHWP6+lo/QFs6M2+3/MuWCGIm+x1HlTVuf4CHEZsbjfioOpLwfOwleC
         kXSyIP+0Ly74XDD21zkKLK0VsYwqC48j8TfHWWH1+4b1PWKtGC4z18QA9oFg1azAHw9M
         4IsVACJySkdUx3UQWb6K4/Bal+NZXunIl9upLHdKEwk5wW8fnlmLYHna4PoRk3Ov0e50
         jUx1SWdTndrSWc7SLa69awrlFwpjiHiO3cBUvkQCdPdxgy4LCJtn4exLH4IovyIHVDqP
         RyEQ==
X-Gm-Message-State: AOAM533WofwY65GXRE5CoXjQC7vYqQUwHpxaN2RERsyg+Dw/v+Y0U5x6
        GEMgIFAexkW/0uNdTvjdj5KcDw==
X-Google-Smtp-Source: ABdhPJyi+LzUx1kJiRE6ItqiavOmXdW/8OwRjVGekQrbAMGtyQUoyeqnUTlfgO4bMCWn2eddMBgRCQ==
X-Received: by 2002:a17:902:c487:: with SMTP id n7mr979410plx.316.1589500577438;
        Thu, 14 May 2020 16:56:17 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id w14sm260208pgo.75.2020.05.14.16.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 16:56:16 -0700 (PDT)
Date:   Thu, 14 May 2020 16:56:15 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        georgi.djakov@linaro.org
Subject: Re: [PATCH 0/6] Add support for GPU DDR BW scaling
Message-ID: <20200514235615.GT4525@google.com>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 14, 2020 at 04:24:13PM +0530, Sharat Masetty wrote:

> Subject: [PATCH 0/6] Add support for GPU DDR BW scaling

For anything but the first version the subject (for all patches) should
include the version (i.e. [v2, 0/6], etc for this series).

> This is a rework of my previous series [1], but this time based on the bindings
> from Georgi [2] + a few fixes which look to be fixed in v8 of Georgi's series
> [3]. The work is based on the chromeOS tip.

Chrome OS is irrelevant here, the series should be based on Linus' or
one of the relevant maintainer trees (+ the patches it depends on).
If it is actually based on the Chrome OS kernel tree (v5.4 I imagine)
there will likely be conflicts which will make maintainers unhappy.
