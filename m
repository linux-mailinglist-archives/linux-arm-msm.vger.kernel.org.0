Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5087A41674B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 23:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243232AbhIWVQr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Sep 2021 17:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243174AbhIWVQq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Sep 2021 17:16:46 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7952CC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Sep 2021 14:15:14 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id m3so31695379lfu.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Sep 2021 14:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f9fF1es1aEeH+o2sBBMLmPK2zQTL0jPUM9WO4klM+IA=;
        b=vSV3zeebm7WI+VqdkF7vS+UCyw08t3Sh3i5cSKiVxyJN6kImADE6c42pxwf0I+t8Oj
         u88Ra797Y4PaN0nwlQoLxQAydPBYLC/zhRTGx3a6Sxxe+WGsTAPgisVCLH6+kIXiZMnL
         hiuLnIwVuVOPfgg1obGzyD+5wiPg92JebqWvlUEEJi1a+7fXYHPBkDzxE53qEZyMx4r+
         4ieoV75QtMDWdsvDSdyoZI7r4i/KCapAt3EQtz4yBYWTGQlE1AMpaeqvz1mtoCiaZFWo
         BIm4+nxxg1DmhgnqB7MM8D8TzPBUCAZiG8feHRjP2KsUsmf+wUtHS48333q/P2rNuGDs
         6XxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f9fF1es1aEeH+o2sBBMLmPK2zQTL0jPUM9WO4klM+IA=;
        b=E4ML83NlsmMNkPikEN0AzrW3kiItx+apg8K/PbpPw6WW9jTHbzRrym2aojLjRCcSIk
         DMSG7EEuZBi1cppE0q3L7WgR0P2Ib/UDTaUPEpBv7lmbGw2juB0V2MFCyfj1hxlsDKkA
         6lPrBkjVm3YODqTdWCEXAHHNH45ntHCYuSueSeX3jBhg2m0pVbXy14X4qqlBANmrOYIm
         acikgZJ/W+5monOjeFJkkdM/uxTX0IclKFQ1JNY5FuiqNL5ztiXqVoW3T7vdh6YwUg8l
         CF3pinmTDotItsVAZlqgkdyfBrTmlMDPz23wKA3fbhKJy3Xh6eT/brE2Qoy5K97yaAOi
         6Wfg==
X-Gm-Message-State: AOAM531EPNHy2US6jYs6DI3yg6o3pbAe/QY1ZMzw/fwxkBg+8FvqStmK
        0M0AY6jHfgWFK3nhpbu75PlSgQzPEllJ9IupQOsICfUSnII=
X-Google-Smtp-Source: ABdhPJyuSO61DwL5xrptJCfC+nHyEj2RbaWo2sXdQsh+r2DreGO7KINuSEchn0tzjfVrF/fRc/3HKOYOXXxnMkpW+Vo=
X-Received: by 2002:ac2:4d03:: with SMTP id r3mr6436551lfi.339.1632431712880;
 Thu, 23 Sep 2021 14:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210921162433.1858296-1-dmitry.baryshkov@linaro.org>
 <CACRpkdb15D0m7L-vO7RFcAaVuS7hdD8J=6=15TFgRgvvsw1e9g@mail.gmail.com> <B4GVZQ.IG4PDOTEQGB82@ixit.cz>
In-Reply-To: <B4GVZQ.IG4PDOTEQGB82@ixit.cz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Sep 2021 23:15:02 +0200
Message-ID: <CACRpkdZJb-ybj8o5hSxEgYbfLfxN96O4cfC9FYa6g5HPSc8yTw@mail.gmail.com>
Subject: Re: [PATCH] mfd: qcom-pm8xxx: switch away from using chained IRQ handlers
To:     David Heidelberg <david@ixit.cz>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 23, 2021 at 7:20 AM David Heidelberg <david@ixit.cz> wrote:

> with this patch, it does boot without any problems or warnings
> regarding to IRQ.

Excellent, let's apply it!

Yours,
Linus Walleij
