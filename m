Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6DE83A122A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 13:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238398AbhFILTF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Jun 2021 07:19:05 -0400
Received: from mail-lj1-f175.google.com ([209.85.208.175]:46772 "EHLO
        mail-lj1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238691AbhFILTD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Jun 2021 07:19:03 -0400
Received: by mail-lj1-f175.google.com with SMTP id e11so31126262ljn.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jun 2021 04:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=olC98MYXFE09NuYvJ2tPm+RNCwhGWVV3/05T5xhu3Uo=;
        b=YH8vcYA/ZwssAN7fISdlBtvdYmubomn+aIrUeOrb6h5HR6KTFux/z5CZKE3EqoTuVJ
         NhAh0PmPC4aCejHrQ+moJ8vtcppENaCRfexCkmn67q0PCyJ9wm2y+URdfyZJ9PoDLFpx
         SrKJrPO8aRmQH2A9mAYoioo/tZCh3fpixvb2PBjaD6pUfA4cfjUiodtkDd+HiF3cGb+u
         /N3JlijaZNUvf/1de0fFSKbv6mPwq9Sbhg0Aky1J1dcahiNTn5TlKPdcHbJugRHzJY6M
         n6ThAuIQJiFlWUvLUKCbSQEkrNAKOwgA39ad2Lb8R4M0V/ZfspVI66apjpqR1TNU5H98
         vouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=olC98MYXFE09NuYvJ2tPm+RNCwhGWVV3/05T5xhu3Uo=;
        b=ixcaJ7CEVWNZEAkPOVT3W+zFTuJwhHPjicaIqLpoaeADPSj2fGz4pVDL2gEm2O4Har
         EOLVZ3bYO8HMQfRzJlIdPiSyZqMX0o/lvI3RcWV1l+vJZxrN9ysrhUF/LMYcuFq4WFRB
         P7gjMEYK3J75ZWPtjo6nwaltyaDigv4lbkjddO0fUQlrdFCtLdzSxXfbVZUMlnIFJUcB
         WjhhZmf0h/yjOQ13VohLL+yIYTJSXn+mGLK9RHfxGUD0Kz674ZSXnvKc1+Nt9xMoBhHE
         RNfXRIuXqrOAT5AEVRQ+rYK1mIWGE90N44zVxzkiShvh9x1ggYl2yTq6eHWwS79dBkAI
         vjkA==
X-Gm-Message-State: AOAM533NwrLfPbVTpLwuqEih6Ig5L3jWItdP8si84ypLda3015zorfMo
        FJI7gpfwc/D+6m/oHlYrBKsJ7e1HKw4Ox9QK/OF0iQ==
X-Google-Smtp-Source: ABdhPJzZt2f4CMFKxy0STGsifmYNUzF59Rr0w0JqTC4qSDcJkvMUJKmzmZNc3fVhOB/7MclmzbsJLeJg0V/ddbUMUBc=
X-Received: by 2002:a05:651c:1501:: with SMTP id e1mr22755386ljf.74.1623237354584;
 Wed, 09 Jun 2021 04:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210608180702.2064253-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210608180702.2064253-1-bjorn.andersson@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Jun 2021 13:15:43 +0200
Message-ID: <CACRpkdbSRWMPRANKNQcuQ8p2V_2BUeXkJ2F=PeLNbyYwTYiV0A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Make it possible to select SC8180x TLMM
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 8, 2021 at 8:07 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> It's currently not possible to select the SC8180x TLMM driver, due to it
> selecting PINCTRL_MSM, rather than depending on the same. Fix this.
>
> Fixes: 97423113ec4b ("pinctrl: qcom: Add sc8180x TLMM driver")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Patch applied for fixes!

Yours,
Linus Walleij
