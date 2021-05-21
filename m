Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1B7538CFAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 23:15:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbhEUVQv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 17:16:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbhEUVQu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 17:16:50 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A658C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 14:15:25 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id a10so9531245qtp.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 14:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CDXffk8yuVYOn1p3JAQ7iuPJM3NbY++kDuUelyU/OiQ=;
        b=IUe8dgsBYwdkeskH874YCPmph/UsPTlXVZoGqqKDDhoBMBgaFAVyPAsh42s2HQ1qrL
         Oe01LVrNZhKPvoHDtSKhAaGKIMuxoRrXuKb6wZlD10kYHdcwfnc+FCI/bz87BebQf5hw
         Flyruw2yZu5Oa2kYYTQ1hAmjWnRoMq4kjU/gY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CDXffk8yuVYOn1p3JAQ7iuPJM3NbY++kDuUelyU/OiQ=;
        b=Gh9RkxR19UvXfXbjyRneL+bzc+ozQ3hkqgtd5WcLHut7p4Jwx4VaCOMtvWazfylocV
         h4OIbQxgf7ldF7PWeUkkKz8E1AwTyoC8/hRdDxsKLVA44rhxdzZUEAxwCTSCGNMa4q7n
         NfrkFrO0nENCmvw3WDFsPBoEhbHk0Cf9Q6LO7LOpI2eVoFw6XefWNQaJ8oyzNQ1lGCPI
         nkN3d0M1/e/CwF9EHxg2HagRXcStagXNm6U+Sw4Pgd1vQyUy/pNEsSm/rL4h0srX7bzK
         BUmjhf7QKX0/r5eVGcmClRcySEsb0Kus1xP4gAkiY8pEH0m5Js0D3f/7v50INnWh/8fs
         urKg==
X-Gm-Message-State: AOAM533P4K6FTz/71PWTqSXwGnb8a9ZXtihf1KN00HOpLOLVwnSMbSqk
        CMrTIY8rpz9McK5V3pX4wjwKWCvzEkJZMA==
X-Google-Smtp-Source: ABdhPJzsrGyjuUU3nBgRWmJWj4MFFWFFJGK+c8CTeu0m6B5SKRiJO6MzBDlwypixq9pLmQVrIbpaxA==
X-Received: by 2002:aed:2128:: with SMTP id 37mr13231661qtc.163.1621631724157;
        Fri, 21 May 2021 14:15:24 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id 11sm5824267qky.71.2021.05.21.14.15.23
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 14:15:23 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id r7so7221236ybs.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 14:15:23 -0700 (PDT)
X-Received: by 2002:a25:734d:: with SMTP id o74mr19566830ybc.32.1621631723160;
 Fri, 21 May 2021 14:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210521200529.1991729-1-sujitka@chromium.org> <20210521130511.v1.1.Ia83c80aec3b9535f01441247b6c3fb6f80b0ec7f@changeid>
In-Reply-To: <20210521130511.v1.1.Ia83c80aec3b9535f01441247b6c3fb6f80b0ec7f@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 21 May 2021 14:15:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VO6aiAULtsDbqbJd+F-BXxyOOKvwRXxUCahQEetdfcbA@mail.gmail.com>
Message-ID: <CAD=FV=VO6aiAULtsDbqbJd+F-BXxyOOKvwRXxUCahQEetdfcbA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] arm64: dts: qcom: sc7180: Move sdc pinconf to
 board specific DT files
To:     Sujit Kautkar <sujitka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, May 21, 2021 at 1:06 PM Sujit Kautkar <sujitka@chromium.org> wrote:
>
> Move sdc1/sdc2 pinconf from SoC specific DT file to board specific DT
> files
>
> Signed-off-by: Sujit Kautkar <sujitka@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts      | 102 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 102 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi         | 102 -------------------
>  3 files changed, 204 insertions(+), 102 deletions(-)

Yup, this looks good to me. Basically a no-op change moving this to
the two boards.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
