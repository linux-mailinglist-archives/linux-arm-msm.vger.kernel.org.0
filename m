Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC7A3CBCC2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jul 2021 21:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232849AbhGPTmN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jul 2021 15:42:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232882AbhGPTmN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jul 2021 15:42:13 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41E42C06175F
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 12:39:17 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id w194so12183068oie.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 12:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=fv7DMd/gditUGd89KsZv6kzGs+OqmSKrVvU2f7TJ2+4=;
        b=Mpr02/1AW3f18Bb7yv3Nx1eLLmiLG8qlYaDWjqSEtb94u3VXNqZpJIFPZF5AZAYrv4
         euboawnbYOrMxF3OPRs0jHyxBRjazEdcT3+6u/3TkizPZagpBwGvU/SFpzT/UwWPaIg7
         C7Tsk1W2jc5M2wXUoEfxlsxOCYO4QqPm0KNzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=fv7DMd/gditUGd89KsZv6kzGs+OqmSKrVvU2f7TJ2+4=;
        b=X+D2eS820ABif1I9FDA9FdGsmL0AlqZTjkELaorV8t9SWERDm7MO0ye2kpSy82f0nP
         wZ1oAvr6ned0ym8YA1iWFMJbg2Orlb1bEVUJFKEYVBHahvHUpOI/cQpqXFCgI7rF1wYS
         XifgL+PdM9sqG4sP0FIIdvh9BLX34+EL7wmlyImxn60KMR8O0+3Wm9a9zPJt8x8xv/8P
         LSu/pXIO0vhxaBYeSvMTGKhyJBz+ram0YSmn503RQJvcg8SWSH+z9PnDXV89xfp1Ojf/
         ut6nNb3QWbryUWuLYWlLYwJN+/V2SyEj9PrdJkBdM5mGqg2ojXxD1b27aaSDpHnkC1uK
         lU+g==
X-Gm-Message-State: AOAM530ybFrbAGqO8f2tcbhfKAxfZ9NccFDKOoAlGNPSp0CwFlExw5gK
        8yJIuO1OYiqJDgjlcbEbZ52wsSnEW8nLZvwJtIwRXw==
X-Google-Smtp-Source: ABdhPJycyfU2OpnyY8fwekR9OEhg1REuKFzJyJ9WFoqtk/B5zwwVo35Tvga6/Erqr4MKZV48CnYi9IgxHuWqdIpFqW0=
X-Received: by 2002:aca:7545:: with SMTP id q66mr9245579oic.19.1626464356697;
 Fri, 16 Jul 2021 12:39:16 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 16 Jul 2021 21:39:16 +0200
MIME-Version: 1.0
In-Reply-To: <1626429658-18961-3-git-send-email-rnayak@codeaurora.org>
References: <1626429658-18961-1-git-send-email-rnayak@codeaurora.org> <1626429658-18961-3-git-send-email-rnayak@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 16 Jul 2021 21:39:16 +0200
Message-ID: <CAE-0n51y2JEy-singr5i9gFFO4uGJ_UVDFChNPUwnTEBO=5kQg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: sc7180: Add required-opps for i2c
To:     Rajendra Nayak <rnayak@codeaurora.org>, bjorn.andersson@linaro.org,
        ulf.hansson@linaro.org, viresh.kumar@linaro.org
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        rojay@codeaurora.org, stephan@gerhold.net
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2021-07-16 03:00:58)
> qup-i2c devices on sc7180 are clocked with a fixed clock (19.2 MHz)
> Though qup-i2c does not support DVFS, it still needs to vote for a
> performance state on 'CX' to satisfy the 19.2 Mhz clock frequency
> requirement.
>
> Use 'required-opps' to pass this information from
> device tree, and also add the power-domains property to specify
> the CX power-domain.
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
