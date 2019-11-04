Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E40E5EE30F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2019 16:04:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727788AbfKDPEp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 10:04:45 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38203 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727998AbfKDPEn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 10:04:43 -0500
Received: by mail-lj1-f194.google.com with SMTP id v8so2342034ljh.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2019 07:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OKf43Xtd1wEHNciZoBlwFOJ82a1QwEum0MNhO8xHxVU=;
        b=gYkvSCffYZJYwTaXZaDFIUqPk5ipBdl+XNhc/jsUSWqBPohl+dBdezLtdddkCLi0Q8
         AvwAFjZhKC1VLxRvNBbptKhKNAVavvPtMwppnk0QI+Blez2n25Z+c/Q6zTUKyNugN8ET
         kv/TqNeC2PtzHIJihbw8M8j675n8j1VIIL0Cs6ZrprNkWZntmUSHUhcFnb1A1O7DKcZn
         xyjf6eULq4FBeqaMEcu4kUVYfqDf+MZLp0kkmy30Au2zIlv86uv9CbgWRnTqaX9s8Z23
         0ZJqK/MWG988Lvu7mWZnKldNwoTswgpH1txIxNtvTYAEOJenrM18U0Y6+q6/TabMtw0B
         Vtyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OKf43Xtd1wEHNciZoBlwFOJ82a1QwEum0MNhO8xHxVU=;
        b=p7CG05QVpHLGUmQU233x7LiocMwYBGEjyiXRHi61UVxAnCg1vmxzkMfS0wHqWwc7cR
         gIqgzulddr7/8ygTAzNbWsADfeWQMoVi/bFCa0VmH9V1gc+t4KT6Zh4UjeHdcDIw7DI8
         fSJW/AqejZxwz7OxcMKKbo5yJiRmgq8+szYFCWY69zh1KoBfucTcZAGluCEwDInz2my5
         nTwDP4bNu/ehNc+w5l7WTxqCpfT/LnBB3Lg0u4BKN/JDn06/V+/tQZJLDkW1JNr6T5VJ
         +siypo7w8lQtYXs6IgLslIvoKX7DbH+LqQZyt8TsF9Jr1or5HwoyrU5I1RkiDWb0UF2o
         vFsQ==
X-Gm-Message-State: APjAAAVE9FVBCYVJ/Y0dskAGEgOAftkJrRlmggojXLOGKgRX3bJxxy2z
        E5xkPcHiXmPMXyiKii449R5ZKWEn3X9fSGz4xoodOA==
X-Google-Smtp-Source: APXvYqxy6M2YfqlgiosgMtrEMRGPVh5BipMF3g7VDZcsoZie0Iue5hC6m1+U1vgt2pyXgw8xrRe/9wm4ygBXT7/F2Pk=
X-Received: by 2002:a2e:90b:: with SMTP id 11mr18696588ljj.233.1572879880204;
 Mon, 04 Nov 2019 07:04:40 -0800 (PST)
MIME-Version: 1.0
References: <20191021141507.24066-1-rnayak@codeaurora.org>
In-Reply-To: <20191021141507.24066-1-rnayak@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Nov 2019 16:04:28 +0100
Message-ID: <CACRpkdYFZ3V87kWFaMdMf6vGdr-=dR4=0GiRAQyY-=2uEwNLyA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sc7180: Add missing tile info in SDC_QDSD_PINGROUP/UFS_RESET
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 21, 2019 at 4:15 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:

> The SDC_QDSD_PINGROUP/UFS_RESET macros are missing the .tile info needed to
> calculate the right register offsets. Adding them here and also
> adjusting the offsets accordingly.
>
> Fixes: f2ae04c45b1a ("pinctrl: qcom: Add SC7180 pinctrl driver")
>
> Reported-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Patch applied with Bjorn's review tag!

Yours,
Linus Walleij
