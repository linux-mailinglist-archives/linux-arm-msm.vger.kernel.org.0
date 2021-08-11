Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA9033E8FF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 13:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237443AbhHKL7d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 07:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237419AbhHKL7c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 07:59:32 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0C5AC061798
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 04:59:08 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id c24so5083970lfi.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 04:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mCS3awkzA8RWLuNBik5eKT8lyl2fZPoNsKZCtZjxeHM=;
        b=hvGuv1nPXE5fSGfW1StTPNwEqjNezSk92PHiyyiwzWfzWx7F0QIB9jS+QRo2gn28to
         Bt64oCxPp3gWybq9VyJQI5P6eRwZEgBjuXSJJc+1E7kBWo3mN8sS88EWk9TwwiOnItDa
         amJIUrEvP3YE23YIkI6LfcTBNzAKd6NeAfHjBDqcTZhFdfThXqGlbvcjMmAbGcrWIlmo
         XpNL3bXIBIV9C0BofYvuV7jNV2Z7IgZFUzIj6rbEjkZHVLos3+R6gksqlU8S4+NSHXbN
         4xrYzpcGqlVg8xY+eQ1bG7ML0svz3zlO3T1CRl0yOyjFtKvTxyH1gEEcWh5pHroP2Pmk
         WMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mCS3awkzA8RWLuNBik5eKT8lyl2fZPoNsKZCtZjxeHM=;
        b=ueXE6f06TJfds4vbXbUP/nPmo6rRKM8mFKyDlkUkYsQJWGPc1K5MUB6Y//a2//6dKc
         eHRJzpivolCvXMc7LaGCA1tDETIyLLoXBoHmWbTEgmtnElf9HwiWFmDzTib4OzCQn90+
         Mir+EfK1/ITDc7wGLmP3mVRFs2U/P8zGj4tRpPs+e0omZkTcWJXmLiovbrhjqgEKHHKg
         OcmScDy3+2y/KuwNwcixEv6q5ptF5gtlHipzgZhrK1GrEwFO6NCrrYbrPOiNML+LGCAb
         i97bGc91y0L2wEEzGNfBW0+3opyun2TcHRTM6kWDxgPTt1GbA5g+eaD9/05lXsPwffIN
         VhkA==
X-Gm-Message-State: AOAM530v+CnTY/bdsUwwADSEOIV5cCVa1S9efavcpB80gpEozyMQWSgz
        b5htBVlzgjlYb442Q3DQCEcZ/Vy89VvqZD4pCRLDkQ==
X-Google-Smtp-Source: ABdhPJzpYp6+24xONNd2RkFQ9OJS/necpcEFr9NwCBDIxjwF+49VMogiOFbS/tQWPsgHQZdMikO98rimMH1Xw8RSdJc=
X-Received: by 2002:a19:c7cd:: with SMTP id x196mr24889464lff.465.1628683147259;
 Wed, 11 Aug 2021 04:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <1627910464-19363-1-git-send-email-skakit@codeaurora.org> <1627910464-19363-3-git-send-email-skakit@codeaurora.org>
In-Reply-To: <1627910464-19363-3-git-send-email-skakit@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 13:58:55 +0200
Message-ID: <CACRpkdYMp6d7hhKSMknsGCQLuytRwow6+5UuiLs=yh9Oh6JFaQ@mail.gmail.com>
Subject: Re: [RESEND PATCH V7 2/3] dt-bindings: pinctrl: qcom-pmic-gpio:
 Convert qcom pmic gpio bindings to YAML
To:     satya priya <skakit@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 2, 2021 at 3:22 PM satya priya <skakit@codeaurora.org> wrote:

> Convert Qualcomm PMIC GPIO bindings from .txt to .yaml format.
>
> Signed-off-by: satya priya <skakit@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

This version applied.

It didn't work first so I had to force-apply it. I don't know why.
Check the result.

Yours,
Linus Walleij
