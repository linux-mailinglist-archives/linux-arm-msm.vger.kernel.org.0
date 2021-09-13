Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09115409F48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Sep 2021 23:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244566AbhIMVji (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 17:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245490AbhIMVjg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 17:39:36 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99DA4C061760
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 14:38:20 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id a22so14096158iok.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 14:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oTXg4OkxA4gYmaLOUALhExrv2s3LoqS8/onFwK1MnZ8=;
        b=e3VfJk7ASvcBdgvYNAlNBeXh3UUudj7i1P+E2WM/PGgBYfWK72BaoDbXkGBeDE+W1W
         s/kzZmdY5oaQhZAY2YxG3wtGsNfnvmO3jfYqHzo+xjW7gy90Yi4AJNUTTLdYSOwy92UW
         HTAAZNoGrpzoHJ9ThsSQif8yTNpgcZ/hXBOs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oTXg4OkxA4gYmaLOUALhExrv2s3LoqS8/onFwK1MnZ8=;
        b=A3oA3Jo54FGkPPHFgn8Gu9fxpBYoEg2KloadRqiY+aiNkhGf/seZRo60tnbSzH0hca
         uKC+zh3rEbqbmS6/Jl6cyPD1MJcnruAA4quMSUWxvKHnSIia627B5/KLYuKUH51IabY5
         2Pb9Fo7ZpO+6RvwF7FlTgtnNyQfHzExUkbhW0C/mucf0V3Hz3DQAnv9e1VBHCor8jX3u
         LXDtyKIvvKqFN8RnOtWwGSjTOLCAcLbbxSM2A1pdmtLeDLC7Vxj3UoHoD1pME61np6O+
         BfnyLVJ1Q4TmyPUXRTwGJpDBEO6NXLoUi9bMwiN/F1zhh/DWJ9+6l2PptxV0IRE/t9PU
         tdbg==
X-Gm-Message-State: AOAM530SuKF2N1jaRq4984cNbjrPEMtmrSyDcukp3ryDREkQJp8zt9c+
        WSaCtHUVJxn2pzg83HrIwyMw2A88PlAmtw==
X-Google-Smtp-Source: ABdhPJykZVMBiMqNcSaLD8/NyvIsDHFQjogNgdcAcDnnBPaW5rxzQbVaF75fxhbZSA3XA8mNle1UBw==
X-Received: by 2002:a5d:8d1a:: with SMTP id p26mr10866343ioj.141.1631569099830;
        Mon, 13 Sep 2021 14:38:19 -0700 (PDT)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com. [209.85.166.180])
        by smtp.gmail.com with ESMTPSA id m11sm5562513ilc.2.2021.09.13.14.38.19
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 14:38:19 -0700 (PDT)
Received: by mail-il1-f180.google.com with SMTP id w1so11701841ilv.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 14:38:19 -0700 (PDT)
X-Received: by 2002:a92:da0c:: with SMTP id z12mr9421434ilm.120.1631569099034;
 Mon, 13 Sep 2021 14:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <1631530735-19811-1-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1631530735-19811-1-git-send-email-rnayak@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 13 Sep 2021 14:38:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Va55WWbBebieNsuS8LE1XBkPAmCT5BMR1nXtBn+EY0EQ@mail.gmail.com>
Message-ID: <CAD=FV=Va55WWbBebieNsuS8LE1XBkPAmCT5BMR1nXtBn+EY0EQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280-idp: Add vcc-supply for qfprom
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        "Ravi Kumar Bokka (Temp)" <rbokka@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Sep 13, 2021 at 4:00 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> Add vcc-supply for the IDP boards that was missed when the
> qfprom device tree properties were added for the sc7280 SoC.
>
> Fixes: c1b2189a19cf ("arm64: dts: qcom: sc7280: Add qfprom node")
> Reported-by: satya priya <skakit@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
