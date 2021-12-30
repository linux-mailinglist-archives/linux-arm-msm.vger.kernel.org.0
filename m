Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1564B4817DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Dec 2021 01:07:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233590AbhL3AH6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Dec 2021 19:07:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233585AbhL3AH5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Dec 2021 19:07:57 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF83AC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Dec 2021 16:07:56 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id l10-20020a17090a384a00b001b22190e075so20816378pjf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Dec 2021 16:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/hWBxeW6VlEgpDPPN9ifq8EfRvPJP/oCX5izdzH+swI=;
        b=AxmDje3/xd29wllytbs2CZW4URFitMK0jyjdR08nQCpa5ROX/ljaaDCwkgqWm/v5n3
         RX6t9dmiGNvo20+kIlYL5Kz+SmA1kx0+TDg1XxLAa4hFd/gPubWaF4Ii//QZw3+zB++d
         /IlL4gmP7m3LU/vspr4UGHLbvipS62YuDtZ+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/hWBxeW6VlEgpDPPN9ifq8EfRvPJP/oCX5izdzH+swI=;
        b=zmxbuVzZLWIvqmenfW4RQGLu9HCQLUxmLeggo2WaeFC2AU453Q9VUp+i+lRreM0bbo
         At9bnfXhPBWyEFqmp5YXkEZTg8GGoP7kb9Xlssmd5HEc6Vu3lwG9obOACKyOq9DXW2rC
         QTYIWkqxxYDTuyOLA6/4JzgFuWXoN9K9s56Wgxq5RX+BlY5waqivdILX5EAKumzAAq8u
         3u/GXTzq3Re+d9jT/8JYirW5ebefaGZ4msDdzBFYuD+kGH8UiYsPoOEY+5uglMcQSrxJ
         srEYxrja7ajrZ+WSua5Dnp9Yn5IdlGRrLToNi2Qv/laNRGSHA4G8fQ6XXkTk2wQJXgzL
         9lMQ==
X-Gm-Message-State: AOAM530VvSqDgAbd04h1KhaDePXTcSXyRgIRa44OTi10/+A5lSKRXxAl
        ksCvQkc25qwK5j+XTW4ZDOSUvg==
X-Google-Smtp-Source: ABdhPJymmUREnI2quBKKj/dWSKAyYHaOpdEd3KfjvDu/pSnJj1dOtBAMdjRNgAdnz8URso4DFIUMNw==
X-Received: by 2002:a17:903:200c:b0:149:7b1d:8145 with SMTP id s12-20020a170903200c00b001497b1d8145mr18739701pla.58.1640822876552;
        Wed, 29 Dec 2021 16:07:56 -0800 (PST)
Received: from localhost ([2620:15c:202:201:963f:6ecf:d90b:76ca])
        by smtp.gmail.com with UTF8SMTPSA id mh3sm29386264pjb.26.2021.12.29.16.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Dec 2021 16:07:56 -0800 (PST)
Date:   Wed, 29 Dec 2021 16:07:54 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2] arm64: dts: sc7180: Add board regulators for MIPI
 camera trogdor boards
Message-ID: <Ycz4WmbWaQio1ijU@google.com>
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
