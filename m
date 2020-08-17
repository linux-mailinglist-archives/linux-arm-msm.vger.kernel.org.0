Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21DBC247886
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Aug 2020 23:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727828AbgHQVMZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 17:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727792AbgHQVMT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 17:12:19 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B223C061342
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2020 14:12:19 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id y8so9016213vsq.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2020 14:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ekTSKo1pbYsTe6haa619uXui/FKJjHYGUOaSFf17VjQ=;
        b=QBOEjwUjtryHxtBvVTbC4f0ZBDkwpm75MZYBWIfR90Ktq2NgHymjo76sA9zuX1ejqT
         gJN4UY+ePTJVNDgOSy/5RQkn7isZOpL1QmvO2HnjiETWqlotGNMX/0YDkv3IA/v66B0c
         OLPA4KN7c42fNV2cJ/nsN1yHEiVJcWvTJlJvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ekTSKo1pbYsTe6haa619uXui/FKJjHYGUOaSFf17VjQ=;
        b=KlgVDe9VT5jFhJCIAymKGtUDZseu58ackpHpoEc2CC0FswItpbBGSKZU8vDtRaTIQa
         U47VIc8uFa/045G+z8XtO57v2FFRTLA21iwWhrdnAMP1FJda6y0+YiNJlSwdDlOKApv/
         kck6q/wAl8cNI4qo1V+7lcbhJg/XVjrMx6sGF35SD6UsL8DO815ilK93dpA6+PFkfaRR
         N6fSy9XB06ovW8SIPoE9lmiNsWWSMJ2GpWkUSGzYH43BW4l0cFDVC7Kx/A4gykp4Q9cS
         +XLXY7uxQkdz1jOAqL0/yFddbihugsm6NlOwmyM5VXMcFF/rXX3oYl6RIF5dX/JytQH6
         P9Xg==
X-Gm-Message-State: AOAM53198VJoRWKCmhTH5xyokS59qkCnfSITvBCZU64Zd4BfDG3oDmlP
        5Z8j9WUDKLdSfCFcwfkgIA19w3G5gOr4bQ==
X-Google-Smtp-Source: ABdhPJx1smE6JaVWmPZB8s4j5m/ympblMo1iL/p6JsYuVFPY6YqwyLxY7gZppFPWxVS1BLGEauq7pw==
X-Received: by 2002:a67:ec13:: with SMTP id d19mr10084121vso.28.1597698737919;
        Mon, 17 Aug 2020 14:12:17 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id j195sm3692171vke.18.2020.08.17.14.12.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2020 14:12:17 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id q68so5178759uaq.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2020 14:12:17 -0700 (PDT)
X-Received: by 2002:a9f:2b89:: with SMTP id y9mr9076116uai.0.1597698736857;
 Mon, 17 Aug 2020 14:12:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200817040417.11111-1-saiprakash.ranjan@codeaurora.org>
In-Reply-To: <20200817040417.11111-1-saiprakash.ranjan@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 17 Aug 2020 14:12:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VVeoqOsVzJiCxjYTpJc8JX4Qx3vB+0evzp8oMdYsRZvQ@mail.gmail.com>
Message-ID: <CAD=FV=VVeoqOsVzJiCxjYTpJc8JX4Qx3vB+0evzp8oMdYsRZvQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Fix the LLCC base register size
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sun, Aug 16, 2020 at 9:04 PM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> There is only one LLCC logical bank on SC7180 SoC of size
> 0x50000(320KB) not 2MB, so correct the size and fix copy
> paste mistake from SDM845 which had 4 logical banks.

I guess SDM845 not only has 4 banks but each bank is bigger?  At first
I thought "yeah, 4 banks and 4 * 0x5 = 0x20" except that's not true in
hex.  ;-)


> Fixes: 7cee5c742899 ("arm64: dts: qcom: sc7180: Fix node order")
> Fixes: c831fa299996 ("arm64: dts: qcom: sc7180: Add Last level cache controller node")
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Without having any documentation ,this seems sane to me.  I guess it
doesn't do a whole lot because the driver just reads one register from
this whole space (at 0x0003000c bytes off).  So it's just a cleanup,
or is it needed to actually fix something?

...the fact that there's a status register in the middle of this seems
strange, though.  Your commit message makes it sound as if this range
is describing the size of the cache itself and then I would think that
this was the address range where you could read from the cache memory
directly, but that doesn't seem to mesh in my mind with there being a
status register.  Hrm.  Am I just confused as usual?


-Doug
