Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C53BF4775A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Dec 2021 16:18:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238129AbhLPPSf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Dec 2021 10:18:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232605AbhLPPSf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Dec 2021 10:18:35 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B617C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Dec 2021 07:18:35 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id j11so23345262pgs.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Dec 2021 07:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/hWBxeW6VlEgpDPPN9ifq8EfRvPJP/oCX5izdzH+swI=;
        b=mAR5fDmMXQIvVskLPJjPpzFYtgqpAb+p/l3hcmwzC/gf8H7scPh4eOUPGGj4wrZked
         YUVJjhhSMTUETart1AhsQDJWSHuwZz/CmqWPxlPlcxDXHpgw/42qlx+U2Fg4DkLuIiEe
         /QuHPKr+w0IlrmUNcuPnYfbJioF6oEMdR6D9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/hWBxeW6VlEgpDPPN9ifq8EfRvPJP/oCX5izdzH+swI=;
        b=fKcMCr2Os9rfxRwHevff9u70h3fr8b7LTWJegfAvcbIXO3UvHCEjNdmNkj4DPQfQfk
         g9PNAEgEDYBFk8tYffgbb80zWlsVoHM6NPQRADuESYVHRhtL2sO/f02AoaBji5X5VSQd
         //lQE61xUsfXn3YNXeeFnM24JmBqyL/OJW38/Zx7Gu8pbESPvRCUtbKqMUMsW6UKaqq+
         ExHKE68Z44WenGyaMXNYx/fNNS9zBUKZS2HtM4yDaJndcoh8fz2+Bd3mChjXAXM15BP0
         5CHCP8jxwXPsd2/vgxs67emyfSI4MWikNnrBXMbxMJ8YgXGfWuSdfqw+z1MubTu0qBM2
         wEVQ==
X-Gm-Message-State: AOAM533pUGdp4UrashCDgazrKsrBuQEya/EMLcvLsNEeMHZgPa0DzX7A
        UPKCYNFAk1662Dodfts6ttzwK9u3cgKqUQ==
X-Google-Smtp-Source: ABdhPJyxpNj1L9Kqw5yYSecNAZGlhLDa9HNH65jFKPYkKNfSMgB2+YARIfpqOrssyAcpCH+6YS3F4Q==
X-Received: by 2002:a63:f14:: with SMTP id e20mr12320083pgl.218.1639667914695;
        Thu, 16 Dec 2021 07:18:34 -0800 (PST)
Received: from localhost ([2620:15c:202:201:81:c257:d961:22b7])
        by smtp.gmail.com with UTF8SMTPSA id m2sm196514pjh.36.2021.12.16.07.18.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Dec 2021 07:18:34 -0800 (PST)
Date:   Thu, 16 Dec 2021 07:18:32 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2] arm64: dts: sc7180: Add board regulators for MIPI
 camera trogdor boards
Message-ID: <YbtYyPZoiWFxpPRd@google.com>
References: <20211216044529.733652-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211216044529.733652-1-swboyd@chromium.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 15, 2021 at 08:45:29PM -0800, Stephen Boyd wrote:
> Some trogdor boards have on-board regulators for the MIPI camera
> components. Add nodes describing these regulators so boards with these
> supplies can consume them.
> 
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
