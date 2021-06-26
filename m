Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E60CE3B4F85
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jun 2021 18:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbhFZQxM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Jun 2021 12:53:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbhFZQxM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Jun 2021 12:53:12 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 226B7C061574;
        Sat, 26 Jun 2021 09:50:49 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id h2so16409412iob.11;
        Sat, 26 Jun 2021 09:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xy3lC+V75F3LEy2qe6vlvEgmNM61OmT+282ss8aUIRc=;
        b=BUrFm2FGfAEOtYJn+IkvwU2pAP/yu0MU2fYSkUNmE6kjcQWR4MmK1mnKcRzwKMSau3
         vFxO+UWVyUGIMO6D3qXsnkn70nnHvEIjorjCCHU4EAKAUPa7tzkFw9KAY2Ipq7gjcXUu
         uOU1tHeVo7JpGGvTpw1tu8s2Yo0ub4SiCtEis66AGEJtcfVTptpxKerfDiWWkM5+CRBD
         PyDi/eYtL+otbtRZwfXh/PaXKn7XlRdbpeaTBf/3wrIX3o0WuHuYgSYlsHv9LUWxihhy
         F5LjtywH0Yi9PnJ212G0zp7/rSAQ/7NGMr3wmiXfgUfD4h3M4Q1PRgvk3XtbAXH81HuN
         wDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xy3lC+V75F3LEy2qe6vlvEgmNM61OmT+282ss8aUIRc=;
        b=SFUvrlGcElhiBrqB+9bv24eiwpmoBZgUOCytShcT6JcpUg/k2254PJ7zxXVxryvUd4
         5HCPNUvki69/xKUCFD6i412jdh0PBBkhP66lG+sN8bypI3MjTcmVsz30E3WPGg31iobe
         KjVBY7slxtG1HZIsJxoYf1PkgPYpfX405V/SDaQnLlQlL9vvfW46R5uz/gIwUw3PbmUS
         bLG38rnU2jebSJue4WVcPnZAL+l8nSOAH/xfQFRKbsqD8OaoG6/XOUeoCOR4KeCuYWC8
         j1ulEfJ9GSoOrlxfMJUw4EuZmezw0JcOt2ONZMDHe22yGxOOsgSYvQ/oEt3q2numiDDF
         0LQA==
X-Gm-Message-State: AOAM532FTts+WJ5m7Hwd4JKZIKACnRLbkcAAirMVSjNBWbls5z6V02GA
        RFKHVPFtdE6BSU6EKhxTh9CBD1vHW6mHAUoGlmM=
X-Google-Smtp-Source: ABdhPJxpo+yKN+1W2sT4n/Ehljt8L3bKaKuHOvgSUXGTOFjzO2vyyyDUzw8f2I6pNnuacLngfgmpFToeZ/LJZuln7Vo=
X-Received: by 2002:a5d:8242:: with SMTP id n2mr13545566ioo.198.1624726248533;
 Sat, 26 Jun 2021 09:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <CABb+yY0sdSinTm788pMFrqEZ6QMC2OwCP7Kkto+pG9h1aGMzwQ@mail.gmail.com>
 <CAL_JsqKdoMwpL_tYC7VQRAG2AC5nR4diShMQCgDseObcgU+egQ@mail.gmail.com>
 <YNEiUMBqGAx1zLVX@yoga> <CABb+yY2wy4iSKjn+SihQ=FE=YwcEzUNOpGw_CV22Anzgbba8hA@mail.gmail.com>
 <YNFKpvhXyZbs8RE1@yoga> <CABb+yY3RpQYvNBHvpwZearpBPph0uj8YQwX2qu=TX=QAO6OFBw@mail.gmail.com>
 <YNFegmmCzk6JUTN+@yoga> <9aae3092-2e2b-9261-f4e7-864b873eb2d4@somainline.org>
 <YNT0HPOJEoJYipyE@yoga> <b0ed9294-e4e1-3185-d81f-63e6e8d45692@somainline.org> <YNUdJC1y8lWHg114@yoga>
In-Reply-To: <YNUdJC1y8lWHg114@yoga>
From:   Jassi Brar <jassisinghbrar@gmail.com>
Date:   Sat, 26 Jun 2021 11:50:37 -0500
Message-ID: <CABb+yY0S+msZ0J_sjPVXpEcifcBbsGBtu_KMpmcMaB6ki0OLSw@mail.gmail.com>
Subject: Re: [PATCH V3 3/3] mailbox: qcom-apcs: Add SM6125 compatible
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        jamipkettunen@somainline.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 24, 2021 at 7:02 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
.....
>
> But just to clarify, I find it annoying having to sprinkle compatibles
> all over the place every time I try to get a new board up. So I am not
> against us trying to figure this out.
>
Rob has acked the dt-bindings. So I guess I have to pick this patch
(and eventually the more recent patch adding another 2 compatibles).
Bring it on.

Cheers!
