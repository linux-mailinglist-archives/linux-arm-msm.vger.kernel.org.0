Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 641FA22E5F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jul 2020 08:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbgG0GhH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 02:37:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726324AbgG0GhH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 02:37:07 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50269C0619D4
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2020 23:37:06 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id o25so5080573uar.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2020 23:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uf+aO2RQUKn1d5pR2F4gMWCBxcjW+UPQkxCmy0LnZio=;
        b=upbKdIBwvkJdjrPMzU3CVfC3OFLDXWGTpVERNLux2LV7rnb6xk5ZKpBzYOk9l/T2bI
         dDu4FwrDvzpmYu+B/2i6RUYXj48rQFVJ2UL1eipn+oHuaXw7Dcxd8wkZmQxiQLfxvk3a
         KAeUECRbR9dVTAMBZVkvpFFWJai1YH0Jj2mNmanbzhjJjCrmsyQ4EQFw6vwKGILMJZTq
         squqYUin/91h2CjNC3ZAWXUu6Q3cpDKUy51RiB8pSurcl2BI7O+cc1hVmOPjvrYtuZHQ
         HLOGh/TXEnxTIzJtW/UmxTFHvAQTA4p1pXP5J/3GzMauecoSExgBRbUX+wjgh84bZf5Z
         emkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uf+aO2RQUKn1d5pR2F4gMWCBxcjW+UPQkxCmy0LnZio=;
        b=oNm4x1q8j5Xkp0M6qY+prJeEwPrdlfoaYuRo5XH2hsO0trjLIkt5A0E4K1D2gK0AbB
         rLARmpH+hDtfqEz8miII2HDSWJmflgMS/NUP3azCQphk5Jf13b8lWVPSivLhH8O2jJq1
         GHm2K4xy/PW3G1lgCn/j151y/BdAVLUMaEUr6cKoB9oxVCWPiOgP8ekXTA4rnk7ZsPgh
         kal1WRBT2uBOJz9bBm3cDKCOygLqV8e2GlMo77LiuO1AcQSA/5u9LjJekFB7sWuA2M7M
         4+n0aAG4qwYz0+uyyRUxbkVJu1O6IRjMl6uuJm6Dn9dE7pFfOlcjxKN5+y3v1jBYuaqU
         sezQ==
X-Gm-Message-State: AOAM531lUinECCChPhiWZJnfpwDXpMn0SW5VQRTsKowNrSvc/z+1q34D
        +dMR/wp23xljTSQcoFHFUeKTXz5FVNFRUNT6bK2Q5Q==
X-Google-Smtp-Source: ABdhPJwEmwIfpU2RpMZ7JAj4Jn0G+e8msqENJChRL0+/pzJa3t9qRcPIB0PXZi80AQn9Yhaa8tNAFpksT9HfCb4BeMA=
X-Received: by 2002:a9f:24c2:: with SMTP id 60mr16301200uar.67.1595831825314;
 Sun, 26 Jul 2020 23:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200629144926.665-1-shawn.guo@linaro.org> <20200629144926.665-3-shawn.guo@linaro.org>
 <CAHLCerMyEsvuhNPnwDow5JYVAbem0Rzs+5-uzKZNeFt+3rYHQg@mail.gmail.com>
In-Reply-To: <CAHLCerMyEsvuhNPnwDow5JYVAbem0Rzs+5-uzKZNeFt+3rYHQg@mail.gmail.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Mon, 27 Jul 2020 12:06:54 +0530
Message-ID: <CAHLCerPEPEOkkBd8MZq8T99eS7nE2pMio6ojnMn7bc54ian-3A@mail.gmail.com>
Subject: Re: [PATCH 2/2] thermal: qcom: tsens-v0_1: Add support for MSM8939
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 27, 2020 at 11:56 AM Amit Kucheria <amit.kucheria@linaro.org> wrote:
>
> On Tue, Jun 30, 2020 at 1:09 AM Shawn Guo <shawn.guo@linaro.org> wrote:
> >
> > The TSENS integrated on MSM8939 is a v0_1 device with 10 sensors.
> > Different from its predecessor MSM8916, where 'calib_sel' bits sit in
> > separate qfprom word, MSM8939 has 'cailb' and 'calib_sel' bits mixed and
> > spread on discrete offsets.  That's why all qfprom bits are read as one
> > go and later mapped to calibration data for MSM8939.
> >
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
>
> Acked-by: Amit Kucheria <amit.kucheria@linaro.org>

Shawn,

Have you not sent the change to the tsens.yaml and 8939 DT yet or did
I miss them?

Regards,
Amit
