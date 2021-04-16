Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94F353623EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Apr 2021 17:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243009AbhDPPaF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 11:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343665AbhDPPaF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 11:30:05 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0649C061756
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 08:29:39 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id v13so574669ple.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 08:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p+GVt4zFmKmqKxkmzGI4Q5a/DBpLPH80j/5btmM1LmY=;
        b=xoRW3IYe922zO/lzORn0p+Xob3qxvdX+UnZ3jGlz/goun4RYxt/xKdSMkm+ZcSFGvp
         OGQ+OJ4CFGN1ip7TcfW0wZVUd/evc/G8BPcQRXnDTmyAR2FyopuxFjIaEoIX2T2Bw2Xk
         2GLFDgRt8NR98KcfxBvnOE1Zqmq1BCWh7C7nPX2TdU0zB5oGUhLpARKaF6BmGLTyqJGd
         08+UDLagE5NHj4yQ538i0aEd/5p1dIghqOEpKJqOTyNo20j85WKmxtoCtPbSFhfWWjes
         7LNszsmrpa4UfiVOCU2CmH/340pfVuDOMDJ1j6mBSTbuRC5Ese40W4vyPcpgLK7GlaKx
         /RBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p+GVt4zFmKmqKxkmzGI4Q5a/DBpLPH80j/5btmM1LmY=;
        b=q0QpJOBG4sAzx6ASEc7cSk4DrnM1O88vgV1VuzZkcLtuWQZljPkaiuePiR22WQFkiL
         KVict5XHqNBgA4pezJPBH0a6dBwxKn6MpFUeeo4ZQY9CtoxkYOsnxIvlX1AnDSYMIhjB
         9W5kc0XzOFrCtFwDMiLZGjuRnarw6DGum/KgZFL2BohXfk2Y1d0WQsCSU4q/uHqv2fjG
         WNuWOzXtJSllPvIotLGEWdixiAhIapF73Gh7StF+QpINUlJZAuVoS8lt+vcQ2WZ8UsXV
         6ry9+0R65/QQwKBDFunGFThNFmMIDcHdAeKo3koYOYc/j1l6Q9hEPYyCWFfU1Kt1WVUG
         I2vw==
X-Gm-Message-State: AOAM5313mUdmkpUf5DXj3JumnMxV5xPeofTf+fBDOk/G2mbez00DOcpa
        H4Y++PkNi+XRHjBhGIrYwFq+OGxfmG5OsS8blrpwyw==
X-Google-Smtp-Source: ABdhPJyZtucPw7kU6E7JEzddw3OxyuG6Na85DhOxrZ1BNc/ZLcHmt799YZYyVsyNY88iS5vemCAFByqQ4FRtUsBe4ns=
X-Received: by 2002:a17:90a:b112:: with SMTP id z18mr10675954pjq.18.1618586979275;
 Fri, 16 Apr 2021 08:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210413160318.2003699-1-weiyongjun1@huawei.com>
In-Reply-To: <20210413160318.2003699-1-weiyongjun1@huawei.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Fri, 16 Apr 2021 17:38:11 +0200
Message-ID: <CAMZdPi9c7L7_4Pzr82zfiYOXp128gnwMEpSex7S9-tQ=jWvNWA@mail.gmail.com>
Subject: Re: [PATCH -next] bus: mhi: pci_generic: Fix possible use-after-free
 in mhi_pci_remove()
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 13 Apr 2021 at 17:54, Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> This driver's remove path calls del_timer(). However, that function
> does not wait until the timer handler finishes. This means that the
> timer handler may still be running after the driver's remove function
> has finished, which would result in a use-after-free.
>
> Fix by calling del_timer_sync(), which makes sure the timer handler
> has finished, and unable to re-schedule itself.
>
> Fixes: 8562d4fe34a3 ("mhi: pci_generic: Add health-check")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
