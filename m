Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF6F91D1A8E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 18:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732938AbgEMQEm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 May 2020 12:04:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730984AbgEMQEm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 May 2020 12:04:42 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 631CFC061A0C;
        Wed, 13 May 2020 09:04:42 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id b71so157479ilg.8;
        Wed, 13 May 2020 09:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5dJUi9PgEBsOz4xL67nAyi1nzj6ZF74cK2F6Xdr8zwQ=;
        b=BK15qGDzi16VRLNLARlzHmUK4+d0bzfFvecJV9tgKyj06LBPHWIM/o1Ux9ns6H+h+q
         xX+0LrFzuAyc7DMWKq4CodjEui3P8n3JKEWjnFUlMIWiYGS9XR2v0ibw/E3XldNNzBeX
         Kzkb17TC+wQGWIOLLqLSyklHlSzEVOfm/DyEtLqTvpwrNnvFyI8Gl3KFdIV4aFJZ13Eh
         hqyK25W71N840NMUoHsH6/TArhNtkNo4k3TryhEm6ljRmPuqR/Rg19CPWuB4exnmjNV8
         zHD8PmFsWWa9oxM5+fpPLVdlGbnkVsxOu12i5W65YuSmo06Lq3w1oK2UN2zb2E2xCfd/
         EgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5dJUi9PgEBsOz4xL67nAyi1nzj6ZF74cK2F6Xdr8zwQ=;
        b=LjmEgYsXIsu6vnZRI5EQQO1BkBGbg00Z0uJPgO1r3UQ4WVSinSD3Fkf8XpKMFm4+lT
         Z7eVLVZ34DXN/AYt9Zc83DqC8uiV+UvendRjwMs1kNVFzhV5LlwRHk9pW0EzjTa0KDIZ
         HrQ+CrvY8MxjvLG2mmSiK6EugoxoUcU5fSEYLJLqtGeKII5E8G3dhCQFT4/SBZlN58zD
         R/nQrlVinrAcUymfrHwplx6exV2r16K3jkYKaRx3+V3pW7zaEVZZVve7PqYfiiHbAxO9
         vgfVFligRxC975X8Iozq7x01a3iOa/BQwLtgWu/Lxqtdwvufr8fz6VqmDaYu4WAh/M9p
         eYyQ==
X-Gm-Message-State: AOAM533B3bbYORHnb4UcOAtZtiIyK0+XbyhW6+uEV4spUp+yfC/mbtkz
        kO59SG8rbA5QCKy/c4qq5jTUOcC6f1RJnrKxqYBBkw==
X-Google-Smtp-Source: ABdhPJzzsVWP7L+v1ttBMz+ZQMxwjSjNaKQ0a/eS3DhFV+V9Q2UTV9XgvQ4lJBO/cu+G2QvqP9XT9Q9acrfKczceegs=
X-Received: by 2002:a05:6e02:68e:: with SMTP id o14mr140943ils.33.1589385881800;
 Wed, 13 May 2020 09:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200513154718.17401-1-michael.srba@seznam.cz>
In-Reply-To: <20200513154718.17401-1-michael.srba@seznam.cz>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Wed, 13 May 2020 10:04:30 -0600
Message-ID: <CAOCk7No3bJMpZNjXaNv-OScaLXPKbdj3d_n20ss3MyciPO=e3g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: disable the new cti nodes on devices
 with broken coresight
To:     michael.srba@seznam.cz
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 13, 2020 at 9:53 AM <michael.srba@seznam.cz> wrote:
>
> From: Michael Srba <michael.srba@seznam.cz>
>
> Attempting to enable these devices causes a "synchronous
> external abort". Suspected cause is that the debug power
> domain is not enabled by default on this device.
> Disable these devices for now to avoid the crash.
>
> See: https://lore.kernel.org/linux-arm-msm/20190618202623.GA53651@gerhold.net/
>
> Fixes: b1fcc5702a41 ("arm64: dts: qcom: msm8916: Add CTI options")
> Signed-off-by: Michael Srba <michael.srba@seznam.cz>
>
> ---
>  arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts       | 6 ++++++
>  arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi | 6 ++++++
>  2 files changed, 12 insertions(+)

Why are we disabling these in board specific files?  Seems like these
should be disabled in the base msm8916.dtsi.  Otherwise, the next
board that gets brought up is probably going to hit this same exact
issue.

This also follows the solution that msm8998 did for the same issue.
