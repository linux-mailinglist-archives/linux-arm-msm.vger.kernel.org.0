Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C47931ABF22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 13:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633203AbgDPL1e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 07:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2506226AbgDPLQn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 07:16:43 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FC92C061A10
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2020 04:16:43 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id z26so7315239ljz.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2020 04:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SMyype6pheH6p2B+meThOWdIwkgayOziZmviW73TOhc=;
        b=G11PTYYbg1ocBkCFQdd0WZXWBNANuFHYcy3Q0hhd1bv4erB3jLCmyws8c3lC3wfILN
         aEjQAMcNSSjZZ6VYLsP3RjLmeeQ38obVAOp2FdH9Hlkb8BMxpeq3nwMChdscaoxLphO8
         18kcnImbDmf2F/hY8mCF7NtGP/QOU7TJwbMgnElSglmUjALRd4is/kaKoJKq40iCMbPA
         C1QwlcoOo3YW/zqzVF6bz/vrgujFNn9QGK85RYjnFtqO4MxCkihbN9IwBEIKIAYnum09
         8ZZmTfW3LKVQrk/WFYzTTBtn+gbVGGOmr1fFaDOez9a9KTwK5u0sO836VbnhsXxjs2/u
         li7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SMyype6pheH6p2B+meThOWdIwkgayOziZmviW73TOhc=;
        b=S+8YiEnaNXEh9DrznAPN/jdrrs66qFSnUFKFU8EMyc3B4JcrPD/xZMIuazEZmOjDlJ
         hvjVaVK7XiRMTJk74K1flUFX9fpXEMyiqZY4T0Bb/JV1L0CaQmzohvl8/y+9v9h/m7Tv
         5J/buo7O1UehuMfvCAYZrrFLWDZvqQKQMUKNWuRtaOL6fI9FraRyMiFYpr2HGcImmPQ/
         enLa3Z3u51nZ9s+F007uMwvg70Lf3T4Qx2dRvRPK/9MBwpiXYpti+F1fxny8WByLlZRR
         a2TPVbtFcVb44jCcGQIuDGsUMATeHb7l0frZawTZK1ASfHny0SkC6+amZfADcveG/NTQ
         Zhdg==
X-Gm-Message-State: AGi0PuY6V2VJeCr1hYmOiRjnvKA3Prc9GX02OU6oBwLPdb4Jvr5Euk4O
        9WUPQgq+97PFiN8MiGrEmIX1gx6T2R7dDj5aAq66SQ==
X-Google-Smtp-Source: APiQypJtQonKD3jh+va1+KhfBd6fpkD1BkWgrhEcoubjUXb3Sm75zbBsDipOQ9OsoADIUiMNpnQEpKxU7Wdf1AH6W6s=
X-Received: by 2002:a05:651c:23b:: with SMTP id z27mr5910865ljn.125.1587035801960;
 Thu, 16 Apr 2020 04:16:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200414003726.25347-1-ansuelsmth@gmail.com>
In-Reply-To: <20200414003726.25347-1-ansuelsmth@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 13:16:30 +0200
Message-ID: <CACRpkdY-t5GPdUg4uf-1W6VXBcgSL5MSPe46Aj93hPSdWDbwCw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: fix wrong write in update_dual_edge
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 14, 2020 at 2:37 AM Ansuel Smith <ansuelsmth@gmail.com> wrote:

> Fix a typo in the readl/writel accessor conversion where val is used
> instead of pol changing the behavior of the original code.
>
> Fixes: 6c73698904aa pinctrl: qcom: Introduce readl/writel accessors
>
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>

Patch applied for fixes and tagged for stable with Bjorn's ACK.

Yours,
Linus Walleij
