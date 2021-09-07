Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 416D3402FD3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Sep 2021 22:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344115AbhIGUjn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Sep 2021 16:39:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243733AbhIGUjm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Sep 2021 16:39:42 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBD78C061575
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Sep 2021 13:38:33 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id v123so97298pfb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Sep 2021 13:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jZlU/HxXkHz1W926ueyJvmqOEC+o2GIx9Kl1Vxt/VwM=;
        b=TFnZY8VpjIjap5WXXQNL+cLO62KhC13oY0R3yKPQI5pgOxTKpuF8PFFN4hTfwWUxKQ
         /mYROqvJPcCXaaMqFEXXWkQ88x4LqJvymD2+j+PBqoimr6WP6pAVIFee751KGm/qpg+r
         nO5plZpQ2zlptiBiyfpBmul3FFX2P2GdxQTTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jZlU/HxXkHz1W926ueyJvmqOEC+o2GIx9Kl1Vxt/VwM=;
        b=bJlQ2cdPkXRIBvFuarudmM4iZ0hnrlsL8VW0fUzdJeoYmblKDUKFwarKEfssj7AVVm
         fYg4H0RFHR8trKEDW/domv4b48KVvpPD2BWtVGBpRkHQQPzCfZQj1KwO95Xh/SrbLOzw
         7INRH4Ve134DjNWCRfzmo+fl1FbRqrpoJoWahIdr+6f87iZkn7S14RE9UsuSFF3JE9AF
         cs04kO2uL2un0Eh3I+CF8Y7pkM8SUMsMKsvB5Uhhb7SeADV1QinHEeIpqeTogPi951Rs
         c1Xp8LA7F25hkVWbDpdZGvo2dBYbaGlxBy3oghc4u+WRQjIzNuXphv9HTVT+DVilME08
         zeYw==
X-Gm-Message-State: AOAM532I4LNKg84/jcSqFUVzHEvs42e8ge1525FlsALRuRG0h0fYvZdl
        8wjrK6smQ8Go4+t0cHJ7sS/IoA==
X-Google-Smtp-Source: ABdhPJxVCGqybcGJlQE3JbGNAAUDV47+nxUlRdEc8LY+e6h3CknrbxYjBaMpYK64zu6Mmch0r1Ll8g==
X-Received: by 2002:a63:be0e:: with SMTP id l14mr151331pgf.363.1631047113499;
        Tue, 07 Sep 2021 13:38:33 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c6b2:7ae:474d:36f6])
        by smtp.gmail.com with UTF8SMTPSA id v4sm9324pff.11.2021.09.07.13.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 13:38:32 -0700 (PDT)
Date:   Tue, 7 Sep 2021 13:38:31 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drivers: thermal: tsens: fix wrong check for tzd in
 irq handlers
Message-ID: <YTfNx7WQ9QM9t3Z5@google.com>
References: <20210905174708.4605-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210905174708.4605-1-ansuelsmth@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Sep 05, 2021 at 07:47:07PM +0200, Ansuel Smith wrote:
> Some device can have some thermal sensor disabled from the factory. The
> current 2 irq handler functions check all the sensor by default and the
> check if the sensor was actually registered is wrong. The tzd is
> actually never set if the registration fail hence the IS_ERR check is
> wrong.

Indeed, tsens_register() doesn't assign ->tzd when the registration of
the sensor fails.

> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
