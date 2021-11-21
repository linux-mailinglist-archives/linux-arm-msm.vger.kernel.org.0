Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 198E44586C6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Nov 2021 23:49:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234221AbhKUWwq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Nov 2021 17:52:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231975AbhKUWwp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Nov 2021 17:52:45 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66F57C061714
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Nov 2021 14:49:40 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id t23so34170354oiw.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Nov 2021 14:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X99/qOPdJ+WUbWBBOwNYpUmngjvM1PDWHkQjo0ad32Y=;
        b=Q44svvAiadlk8aMSRveyGTPXRA5oCYbxFmT+IhIUTIN2fwuIw52DehmCszaMmv5M7t
         mo1dASbLVJt1oJ5uYp5n+1c/QqzKMbyE/hmBiNoxaEufxzhfelf5KD2Z8d9M5inU4S9y
         FuERCfwcJdOG0DZbzcbVXCE5/f/5K+0kk6Q1q0Ast4WisWpKmjB5mvyrrkVcHnaeT4hS
         1i20p3nA5Xsk5zB5b7tazj+rpqTz/yMPuIawvy1D9eTl/Cum/pPAbzKERJAo2sGeu7uc
         /PBtXxWpdWAhP+DwcgjeeZFk3iiwZGM8JT7MWqhygcvPtbAfM5/icS9l1cBkeJSBxsNO
         FIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X99/qOPdJ+WUbWBBOwNYpUmngjvM1PDWHkQjo0ad32Y=;
        b=s+GPXGUfDcATqeXGPQ+/jod6PBrb49yz2RY+lKFMmtpk38qnEZR6SkE8m1SDOZE/hT
         ZfXEaJCvKyWSucpaQT4HmjV/OoHBtuOE6VT0lbg9hYci20OITQkTgVCa5H1WI6jORMUZ
         q1/qmVgNqsGvjME496RBUj22cKx8Mr8y/NUcFg86ah56hd8NL5mzoEIv2w0L7C5jPofh
         xF11a3sWrdk7XtFY/4QsUGvlFdwHptdS2TtShbIl8SS2uEAQAY0ro3pX5g0GTd9wqC2b
         Ze3JTukGp4X5uV2sOaxM07LmSbrQQlHNEAYKnggrigCnPhXTDOgTGrS3B2u/Ht7QBSeI
         MBpA==
X-Gm-Message-State: AOAM533EyonWHmxDvps8P6h0gYLCkmwepdLUyb9uB2NhbjbYiyFPi8kk
        OFTp0GriEkNmUjwdA6kedLPvqVDWBICtkRFv1wdZnw==
X-Google-Smtp-Source: ABdhPJwgaKcMuYgYCnXAWZszLJBD35nrr/psdZgwCLa+EINWN49QQKsj71cxw3YkXzLW9+ZE2BbOlleDjfZ50bFaefI=
X-Received: by 2002:aca:120f:: with SMTP id 15mr16999633ois.132.1637534979818;
 Sun, 21 Nov 2021 14:49:39 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637048107.git.quic_vamslank@quicinc.com>
In-Reply-To: <cover.1637048107.git.quic_vamslank@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 21 Nov 2021 23:49:28 +0100
Message-ID: <CACRpkdY7h2ff8Td_iV03Bq2F=UcSOJj5W+5zB+UAA8uWK8z12w@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add pinctrl support for SDX65
To:     quic_vamslank@quicinc.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, manivannan.sadhasivam@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 16, 2021 at 8:40 AM <quic_vamslank@quicinc.com> wrote:

> From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
>
> Hello,
>
> Changes from v3:
>  - Addressed comments, fixed dt_binding check errors and collected reviewed
>    by from Bjorn
>  - Rebased on top of v5.16-rc1

This v4 patch set applied for v5.17!

Yours,
Linus Walleij
