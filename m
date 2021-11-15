Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18DC9452856
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 04:15:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238977AbhKPDSE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 22:18:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237714AbhKPDRz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 22:17:55 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FA1DC043191
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 15:45:47 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id a23-20020a9d4717000000b0056c15d6d0caso23152058otf.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 15:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=DJxnAju8ZcoHymLSy/2zxtKet5bzIUVWZOB8Xt+TFDM=;
        b=MrYtDApAgMWv95IIbmh2ZbmKWIdvEbyaVwK++N/ANKcr1LFdbHpeshfpvFJ7WcKewM
         r3eXc4CSQJ8aLR22q9fFIKN/yy87kzTl24H/tCzYorrOHnp7C8G8W3IQvzIfouWUuMIh
         5wfp5+YNlBMIBeOh1odqjGFG4xRYoQGxUCHgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=DJxnAju8ZcoHymLSy/2zxtKet5bzIUVWZOB8Xt+TFDM=;
        b=uCgxX1goIcv7XkQt9TKb4GB8IunT6QvISPCKCQFxcLJNQsjoZJEjM2/VK+qk9/++Z3
         H2BLRXTbTQt4UBWb8klhhI2Y+8qdfC8VGbf8tf/1IDTZY8SInUIb8ocgK32uRSsJstpS
         e027xb+Q96N+c9icz4v++foSIyS6qc4/j4lUlec6hAVVIVle+gMWlbgsTRGoiGbkUtuT
         ypVVm/jaTLXeUqgPANKlGINcDcFQjXrN5c2hkXav4qarQf4QHaQeHjw+iFesDL5VwXgg
         dPQEcocZ0KNrYWxuzsW2N9BJM3k5MBwUnFXja4QqqXZDWKqzVyORySS3Fd47cGwc9vdu
         mKlg==
X-Gm-Message-State: AOAM5336a+UDUMnwcNz+ORaDFFvHHHWJS8MM+2LFxaVwF0snnW5yIQ+m
        OLI3mgg2s3drDDqtqPPZLFTpOk456S9EPkJ0B78ygg==
X-Google-Smtp-Source: ABdhPJxIHTJ4V0v3V0REg6nwGmuD8+3FvwcZO5Cv3CkaMLWJnA1lIGUFiTSPqAkR30MnUa8+OH3cLsFZG0TnE2Wr1mY=
X-Received: by 2002:a9d:7655:: with SMTP id o21mr2410261otl.126.1637019946748;
 Mon, 15 Nov 2021 15:45:46 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Nov 2021 15:45:46 -0800
MIME-Version: 1.0
In-Reply-To: <20211115030155.9395-1-yangcong5@huaqin.corp-partner.google.com>
References: <20211115030155.9395-1-yangcong5@huaqin.corp-partner.google.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 15 Nov 2021 15:45:46 -0800
Message-ID: <CAE-0n531-YnSYJ+Yf8v-s3YE7LkF5i9wuBOTZPmr9DzbCM_Nrg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: sc7180: Fix ps8640 power sequence for
 Homestar rev4
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        dianders@chromium.org, philipchen@chromium.org, robh+dt@kernel.org,
        yangcong <yangcong5@huaqin.corp-partner.google.com>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting yangcong (2021-11-14 19:01:55)
> When powering up the ps8640, we need to deassert PD right
> after we turn on the vdd33 regulator. Unfortunately, the vdd33
> regulator takes some time (~4ms) to turn on. Add in the delay
> for the vdd33 regulator so that when the driver deasserts PD
> that the regulator has had time to ramp.
>
> Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
