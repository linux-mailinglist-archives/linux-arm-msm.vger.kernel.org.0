Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABB33458707
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 00:21:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbhKUXZA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Nov 2021 18:25:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230449AbhKUXY7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Nov 2021 18:24:59 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B328C061714
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Nov 2021 15:21:54 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id h16-20020a9d7990000000b0055c7ae44dd2so26152439otm.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Nov 2021 15:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ud6ziG3usKO9f8o7qjC7A82Uat+dBjwHJNb515nwCxM=;
        b=NImGdG1/Rc7kAoMP5FLhf3fg0Sm+sx+/A/mJl6OBKrwc/4+tmMpb6C1tFSZYChIAUL
         i7istXlfUWD1rc5CoVJJnBBkPKzsNoUgAWOESwbHtnYWKDLJap8P8FXEEM3xtBmJEYNd
         5qwSdR/sBMiyJqbkyW+i729JqREryEfAPH7NihcrVUheiinaL9dPcLYOGbmeX2+QD3L7
         OH+vMbH33wKwoiyiJcj3ibyhLS0N/Z8gKmKIill4txyuaTSP5xW7ynVMtVjvxXLUFaRD
         8/WMJWyPwks7+Vq1/Vv3VJ6B3wnqjBRXMwQ0TAsIk3dvW3UVmSeHIvbx1XCdVtJ6nPVG
         /yew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ud6ziG3usKO9f8o7qjC7A82Uat+dBjwHJNb515nwCxM=;
        b=LVTOAXwf8bbu8mzL1v0ZPHNvXGQF1GaXHu0a1DVduyaKPlzIVhFnr2gZ/cHXNsDaVH
         iRjF8i390dpQVB62QxS2PW/NLxaWw58AmltLSo9EQMnzgmXDCaNBO2lfBlIpkbQm9qLB
         KMDtzKDSDtA37+6bKBN1HyjSYmbokKzB0LlKayqyV/BRZ1J+NprgtPrTQPlsQ85xrciR
         UPMRnhXo5CgUgKIV/MLALE4yy8po13mMIwNheaFz4iWn7yG5q4ryVqYtfkGGqI4Bkoih
         3m3I602xVzhQuc9LTPCZteEXVWSORpeilI0UxoROo6qSnjTQCcbNgteUPBJYTd9jssCp
         WMdg==
X-Gm-Message-State: AOAM532SI4M9i2PEbr/cS+ANevWUKdyTklrFzcVqOi4jN8a1EYz231Wv
        yXzu6hEWV/oVTSXCASlOIxposeI10fwCBFoY6l3Eww==
X-Google-Smtp-Source: ABdhPJzcYEM3A5z/pVX4hervhAjpeRMARRGOYFFxPJrD2bznfwfSsPJRVvPhnurH6tBkutUpIUSoB/CQgy9qua66Xw4=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr21413600otg.179.1637536913802;
 Sun, 21 Nov 2021 15:21:53 -0800 (PST)
MIME-Version: 1.0
References: <20211112115342.17100-1-konrad.dybcio@somainline.org> <20211112115342.17100-2-konrad.dybcio@somainline.org>
In-Reply-To: <20211112115342.17100-2-konrad.dybcio@somainline.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Nov 2021 00:21:42 +0100
Message-ID: <CACRpkdYesPD38efs+wZng8RbHQky2=rNw_hntDpNK28AZooz6Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: qcom-pmic-gpio: Add support for pm8019
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 12, 2021 at 12:53 PM Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:

> PM8019 provides 6 GPIOs. Add a compatible to support that.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Patch applied for v5.17!

Yours,
Linus Walleij
