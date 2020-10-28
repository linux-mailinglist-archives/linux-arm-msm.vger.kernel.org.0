Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5235429DA78
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 00:23:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390158AbgJ1XXp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 19:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387602AbgJ1XWI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 19:22:08 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73104C0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 16:22:08 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id dk16so694863ejb.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 16:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hatfo1xwFEDynogYQDEhCt1lpMjNGoJQpQEAAPUn4fY=;
        b=o7y3xKxud6jpWJiD7Y/D54i7FmuhCdJjwT+WBVsmaMPt3nLT6r/eT2RK7+eSFFJh+N
         C/QVs+MZ4Lm7rwEX2dqJ0I3QCAT+OdhVTJmk2WhagbTrBfLj3o895BBWKbRm1hIYCEMM
         6/lB/QNEWcsELphJiVQmi94u/Boca3tez7YBz6e3p5yZjHRCFWwAGovezFOFSGFbS7kh
         exEW3HvfxSOBS3fQp94B1TXeSks+8Zd21nrupBBq3K77pKSG5UOGVltHfNGOQVgDurTz
         8e6vs6QD0PHSN243mURr9pUb6EWOPRR/E/U35y7EpmhJIQtMpHOxDXd/9HLLUOPrI7KR
         pjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hatfo1xwFEDynogYQDEhCt1lpMjNGoJQpQEAAPUn4fY=;
        b=R0jFQ72VcYXv3uVwYRH28WXL832Vw1AegtSq9j7cxw4BbSj9txHW8gFSbhpfja8Xma
         or9F8i/dGET6bGPS9fpyqw8Vqq70c6K9h0hFKBRm1VdK1PJI11uLgzJR/8OkzOGro77d
         D0dhTL5JLMhr0umHgcfsc6PzESmyBAnUwmu6F9RPxKBgACDBiHP5k6DRNQe0B5NEA5JS
         GBLcJ2E8N1Nb+Qw2X3VETlhaQ4zVmNlrVbOVysItdacuYs2+J16LXgvsXdRBfR8ISBoh
         XZCKYbac7ngmmut+MnDsePLuuoYOCe3wlq5D9Z2ltVo78I01gBFvivkP8aEZ/s/iXsLX
         4Gdg==
X-Gm-Message-State: AOAM530kWum1izlNExfg2g/EPmgPOvZ2tLRqrcMIz1yPJ7oJRuE/Px0m
        6Z0vt35Mh43lmwLud9lRnSAj1A8ESPaYAQzAifZETXiTvivSoQ==
X-Google-Smtp-Source: ABdhPJw+Y+AFcpZE5IrWDaF75uBlkljVPeaRqxNXP6B8aDvxXTWl++DYovIgyPQUxwMCkmQBdRS/3260GiTYigirY18=
X-Received: by 2002:a2e:86d4:: with SMTP id n20mr3755779ljj.293.1603900056645;
 Wed, 28 Oct 2020 08:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <20201007160611.942754-1-junak.pub@gmail.com>
In-Reply-To: <20201007160611.942754-1-junak.pub@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 28 Oct 2020 16:47:25 +0100
Message-ID: <CACRpkdb=0iEqT0+6UnB2y09_XdQWwf5za43Sn-g7vA_dEkgSuw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: qcom: add pinctrl driver for msm8953
To:     Vladimir Lypak <junak.pub@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 7, 2020 at 6:26 PM Vladimir Lypak <junak.pub@gmail.com> wrote:

> Add inititial pinctrl driver for MSM8953 platform. Compatible SoCs are:
> MSM8953, APQ8053, SDM(SDA)450, SDM(SDA)632.
> Based off CAF implementation.
>
> Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
> Signed-off-by: Vladimir Lypak <junak.pub@gmail.com>
> ---
> Changes in V2:
> - sorted SDC_QDSD_PINGROUP entries in msm8953_groups array.

Bjorn can you look at this?

I was submitted right before the merge window so I guess it got
lost in the storm.

Yours,
Linus Walleij
