Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7162279792
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 09:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbgIZHlR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 03:41:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgIZHlR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 03:41:17 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8735CC0613CE
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2020 00:41:17 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id d13so4328658pgl.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2020 00:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=OaqWuxy2M9eImPpuAf5glJGxxD92OtFncd8r97AgYM4=;
        b=O0dm9hMEqc1vEs0A9s9u8sPtT4XYPZ+egumnSlp7wUZCtw2BJSRbP/BmWpow8IJPxL
         Xr4GAJvwYtoZjZdrGgwyAlfx6tFy5hmlmjfsBeeKYS9zlsvk3uFiD3LvQqHc/Uy+OV6p
         nQ0seqgfAIQ5iuHLtYk83rKNW9diUkuC+45Zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=OaqWuxy2M9eImPpuAf5glJGxxD92OtFncd8r97AgYM4=;
        b=n23oii50Mn8Qmqv58Y19Mn7yEjc2MJfZr9gWfkRmVkgg3mT6cTN8oPX02dMOl36qAe
         OlSEOyv2SfO56qdf8puLuI02AeA+4TIjajmpSurKSS2cTWtwfdnfweyMt5OekpTkz03f
         xWSYs9uI8SRFEF2oVFMgfASy7KR/Xauzq0kxrfnOsyylEv04CEut0bic59lOOtO+NIY4
         Jk3fuwGPqbFa6mIc15L7xy6qAPl+avBYQLi9P/8cvUJ+i6q8Oom+nHiLQC3r0/Es3VGO
         XZR+xSOQrTejLsg0J6BfSIChTi4WNa2l5ukvmhLE2gtwwmxWfAddYpDRRN9uWbHAdP6b
         D3Qw==
X-Gm-Message-State: AOAM530BNQnvC9HFJ5/EcI8d7xQRYwWhISj/bg5ubi7SQ2nM+MAWB9Rb
        VJ/X0it3bH9FqDnASPgFIgg3cA==
X-Google-Smtp-Source: ABdhPJzEAKDRyk+rvxA2q8CkeH8Jl0KDYYDLphxH3dmvJ35XQzgM6LZvJ3fC1/ASAZVYwNv2FOMcew==
X-Received: by 2002:a63:490d:: with SMTP id w13mr2027849pga.24.1601106077143;
        Sat, 26 Sep 2020 00:41:17 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id m188sm4836662pfd.56.2020.09.26.00.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 00:41:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200926025512.15145-1-abhinavk@codeaurora.org>
References: <20200926025512.15145-1-abhinavk@codeaurora.org>
Subject: Re: [PATCH v2] drm/msm/dp: fix incorrect function prototype of dp_debug_get()
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, tanmay@codeaurora.org,
        khsieh@codeaurora.org, kernel test robot <lkp@intel.com>
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        dri-devel@lists.freedesktop.org
Date:   Sat, 26 Sep 2020 00:41:15 -0700
Message-ID: <160110607539.310579.6954031617378004352@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Abhinav Kumar (2020-09-25 19:55:12)
> Fix the incorrect function prototype for dp_debug_get()
> in the dp_debug module to address compilation warning.
> Also add prototype for msm_dp_debugfs_init() for fixing compilation
> issue with other defconfigs.
>=20
> changes in v2:
>         - add prototype for msm_dp_debugfs_init()
>=20
> Fixes: f913454aae8e ("drm/msm/dp: move debugfs node to /sys/kernel/debug/=
dri/*/")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
