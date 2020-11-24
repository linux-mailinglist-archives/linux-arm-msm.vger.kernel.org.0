Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C52252C201A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 09:35:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730694AbgKXIeT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 03:34:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730474AbgKXIeS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 03:34:18 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54A56C0613CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 00:34:18 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id s30so27711493lfc.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 00:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NOsLiTbxYXKFhYn23AnKm0GCKqtrauKi3T2pGJSrzE4=;
        b=CHpi3zXM+ZBBjFWt8aYVGwBA1uUi15+6FWT6qz27hAldi+pwaVb0kEHyHvVJ9IWDqU
         78qWvzydSs+QGI4nZKHsOjiUkxhCks2W7zFbtEsqKAYTa6RTZC1qplbbxH9OCZUkkKed
         hPwnVsxYfLJbg1GSu5+d7iwpLOve5ztHF7PmP71nG4fuEV3rFzbF4CcNmez3CqiUH2xm
         p3AwMbsnrjuAH9sL7Gw3mdqyzcgoxESpbXsbPxWgGzR50Vma/y970yd5OwyDbjIhbiRm
         ueIB3bgljndM2dhF8XQzvlS/2Tmt7TwgNyHt9GHTyt1jM2cpi2p9aZXh+575xm60+uwu
         AM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NOsLiTbxYXKFhYn23AnKm0GCKqtrauKi3T2pGJSrzE4=;
        b=FWAD64oHvwXS48XdfTKMG/SwIF/nGvJESV9cX97O/wHh9fBvSaqszD20wAJTl2PClp
         Wc2y65k0hKFtxbXrVW7HXkYBlnuwui+1JHppcP96SJJXSrZJ6w1yCGSCthZOIKzFhsup
         eI9OSD9r7DFX0p9Co1A8F8lrcyHyTxbL+esjKGulOcWmhUdVRhFTolLm3zNKiuYDBaX3
         P/z51IGSlcyxMdVpQ6ickSIDsDvKV8rg913hlL5iuGCVgUSN47Nk8YZvFGpIROFks+v5
         6LRtKvUlBM7ev4aS1HiyYrmP8I/Wv5t/2VhyzPoH5hDiQDLKTkpApzsMgFrhtHPVCNgU
         Cwiw==
X-Gm-Message-State: AOAM533DiYZw7wJvIOk1e4J2auyzSnJDzzpLtSWJW6tQGE90j6mnFOXf
        NQPf45NdRdShWYxIorcTuEL4mVCOsy6FNLGeYkh18KdmBW8j4Q==
X-Google-Smtp-Source: ABdhPJwxXRCbLjcqM5cNFxRoLZTAopE19twHnC2FECcsw9s6HGoSZ1ZUv8r91e1dNjCEe2qNGc+bjQNoHSzhHXZbocs=
X-Received: by 2002:a05:6512:3e7:: with SMTP id n7mr1218244lfq.585.1606206856836;
 Tue, 24 Nov 2020 00:34:16 -0800 (PST)
MIME-Version: 1.0
References: <20201110215619.86076-1-john.stultz@linaro.org>
In-Reply-To: <20201110215619.86076-1-john.stultz@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 24 Nov 2020 09:34:06 +0100
Message-ID: <CACRpkdZHufAsjySL7wWb1fSFJTgUhdiNjs_L4He+pHTpKfUy2g@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: Fix msm8953 Kconfig entry to depend on,
 not select PINCTRL_MSM
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        Vladimir Lypak <junak.pub@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 10, 2020 at 10:56 PM John Stultz <john.stultz@linaro.org> wrote:

> One fixup following my patch commit be117ca32261 ("pinctrl:
> qcom: Kconfig: Rework PINCTRL_MSM to be a depenency rather then
> a selected config") being queued in LinusW's tree, as a new
> config entry was added for the msm8953 that also needs the
> change.
>
> Applies to LinusW's pinctrl devel tree.
>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Prasad Sodagudi <psodagud@codeaurora.org>
> Cc: Vladimir Lypak <junak.pub@gmail.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> Change-Id: I9e8e83b1ea57aff338074be9174fce53cef29eff
> ---
> v2:
> * Fix flipped numbers in the soc name, pointed out by
>   Jeffrey Hugo

Patch applied, for some reason this got lost in my inbox.

Yours,
Linus Walleij
