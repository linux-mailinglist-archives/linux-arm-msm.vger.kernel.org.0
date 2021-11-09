Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E585B44B3DD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 21:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244240AbhKIUYV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 15:24:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231872AbhKIUYV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 15:24:21 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C859C061766
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Nov 2021 12:21:34 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id n66so839011oia.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Nov 2021 12:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2bkcPZxFy4otFLdNug+cuD0qwesnkaZRZdhfmKMjIhQ=;
        b=AT3ewhh5rfdjFWpDWhNwT9yqY0kdlPWvW1TGijSZQxjbDseYcq/D2kPFS3rLbEVJhm
         O3QeTPPgPVWWEK4Ua7kiPX8RkjATovcRiD3KNjDYDcybTClXQAaZvc66GEYLOGvA2Z6m
         wal8X+lvAep8AF7V+yu1lNtcju75GflZZwRhoNANvZ/9CaPAMSlLgOTCqQtTD2fXZx+i
         U43QrFIU3z4wZL5ifbWqyf8pDp5ZvlOCCTjtXOjjtLARbBmJPAgo+CW+ZeNktAQ2MW6I
         3lRRUlDfduWtCHfp98gjDExpCjFr/jwCcVOJM0RgGnTBhDz4qALzTI13rO0RQI2YQuMK
         aU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2bkcPZxFy4otFLdNug+cuD0qwesnkaZRZdhfmKMjIhQ=;
        b=4GWaUuHny9u0++iztui/PKieqqWO6ZHCWK44/xZLZv9g2R5/19winuZFTlHFTzmuwu
         8vkaKRfcOFh8HmoROr4T7y2DzDImtMdf7nPhjmcHxz2MNwruMwLhzWkaJScWHzFI0X3Y
         avhd1FSAloGBFn5+bUvM9dd2B30hA66cNXTOz2Oxs2x34GwhspW4bSJfsQxvUviCfwVM
         E0eTkKYTP/Yculsu7QvlG+ssA/A7gPxQJrFqGYL1iYv/FPE84uafNVbFg2DHiFxT+gFf
         c7fovPcZ4n2UUK1c0j8H6dVFmYYU7b3BdA+zEbc/x45EktjWWIdR4Lxj66gqyGBcBgTY
         clMA==
X-Gm-Message-State: AOAM532sc2gpQqmG+CUDdFBgB5LeDzRcKdexNqE1fy7eeneAKEPEP5rS
        cWzR5u0RSll+Pm8FHIvQNyCNCaUGNIRRtQUYDV6JpA==
X-Google-Smtp-Source: ABdhPJzy5H8Qpb/5Cgyv/YOM54pkbhWTSoxC79x4FvNlgpvaTFmf2JW/zcONsoNsaCxEc1r3xTjLki60c2d9mnCd77g=
X-Received: by 2002:a05:6808:60e:: with SMTP id y14mr8510016oih.162.1636489293983;
 Tue, 09 Nov 2021 12:21:33 -0800 (PST)
MIME-Version: 1.0
References: <20211104170835.1993686-1-bjorn.andersson@linaro.org>
In-Reply-To: <20211104170835.1993686-1-bjorn.andersson@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 21:21:21 +0100
Message-ID: <CACRpkdbSJRTcXdPO_CAHQ93CXszawvY9EQH4bcXWjSfuU+Y17A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sm8350: Correct UFS and SDC offsets
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, vladimir.zapolskiy@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 4, 2021 at 6:06 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> The downstream TLMM binding covers a group of TLMM-related hardware
> blocks, but the upstream binding only captures the particular block
> related to controlling the TLMM pins from an OS. In the translation of
> the driver from downstream, the offset of 0x100000 was lost for the UFS
> and SDC pingroups.
>
> Fixes: d5d348a3271f ("pinctrl: qcom: Add SM8350 pinctrl driver")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Patch applied for fixes.

Yours,
Linus Walleij
