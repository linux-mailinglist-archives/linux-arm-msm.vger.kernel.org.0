Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3550D3B07B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 16:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232004AbhFVOqK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 10:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231890AbhFVOqJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 10:46:09 -0400
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6329C06175F;
        Tue, 22 Jun 2021 07:43:52 -0700 (PDT)
Received: by mail-il1-x133.google.com with SMTP id q18so18631899ile.10;
        Tue, 22 Jun 2021 07:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VyrTYY1NLqBXZTyOChDjzqQgAawz77pFXYpanVHi6os=;
        b=d5F+Kxm3COjjwCUEVMV+utTvXZNsgsRSKDPqirx7wNCo4jGooAk9UhTz+HVk2mXLq0
         Zhq0JGkZ/EqH6hoYkOdkGQSP50ZfGQ7Ky8JJowYHxCwgNPe0nBYDUySguJ1lO3QvsGhG
         U3exQgKTqKhDMjGUK04+KAbvYenwYiVkF/xCSdgdrZZK+qCEZOAFBS9pYVDsaihopRkj
         CHvmQoGblinmJwcXBBHnhuad7/qDGEpVLxdrGi1/Kqxe/EuY/u7+r50v0wSbWXq+mdo+
         BcoRvKx5Qk0X1P3nXKGROs6U6PKcdu6DlNOyWlnIKkfd6GiAaT4/x70UmGE8+Gl5n4Tx
         nYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VyrTYY1NLqBXZTyOChDjzqQgAawz77pFXYpanVHi6os=;
        b=EpckfntGulQqQ2hm7YFP6LudsxIRYpHMxy6tAFrxY46y04sW/cDL1Jw/swLDK/fRwr
         WDSMJLxJAoAKDHbLluJpgr0w/BsFsR6bMfgX4pY2lU9d9xNUPBE7kO59lVk3Z/q2YrbY
         87MEsaYvYUAFVZSOKy6ag2xGOXnY0LJR7ij7yxxbzBDLczZ48Eog7UwEyS39yAtdPQo6
         BEspb6tVNSo6j+m05eT6h5XCUEp5uDDKXt1ekFs+xe0GDN5VeOMt1wbXhBH+C0ZdEqA0
         wx2fwmT9UDqAjzFKedCzBcOOV8Cendh/uVFG/tLgNiVTzfERkicPfeVb8E7HfLymP/hz
         JWug==
X-Gm-Message-State: AOAM5306mr4qZV5TYjTASE+UBDGn1WNUMgm9XHUhNR/CBwKbQlrXAb7I
        q43xu6UQwpbG0Kfvkz6UPcwP/LGjwZoGrQCO0Rh/rHro
X-Google-Smtp-Source: ABdhPJziWwprrFjmTfbzAnoaQbzFR75gkbK5FLp+X8DbF1XqwJthUwF0+6k4KQU+JrH9CPBO/P8yVrDslpAnhreB3fk=
X-Received: by 2002:a92:7312:: with SMTP id o18mr2749318ilc.289.1624373031751;
 Tue, 22 Jun 2021 07:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210612094631.89980-1-martin.botka@somainline.org>
 <20210612094631.89980-3-martin.botka@somainline.org> <CABb+yY3BYYC2na8EFunEeu0XCfLXrUQon=hF3q5p=+FUoigoyw@mail.gmail.com>
 <CAL_JsqLWqtAtqLRF-MAnq80NMfD0a+CfWPv8JWjjNTJFgMjCxg@mail.gmail.com>
 <CABb+yY0sdSinTm788pMFrqEZ6QMC2OwCP7Kkto+pG9h1aGMzwQ@mail.gmail.com>
 <CAL_JsqKdoMwpL_tYC7VQRAG2AC5nR4diShMQCgDseObcgU+egQ@mail.gmail.com>
 <YNEiUMBqGAx1zLVX@yoga> <CABb+yY2wy4iSKjn+SihQ=FE=YwcEzUNOpGw_CV22Anzgbba8hA@mail.gmail.com>
 <YNFKpvhXyZbs8RE1@yoga> <CABb+yY3RpQYvNBHvpwZearpBPph0uj8YQwX2qu=TX=QAO6OFBw@mail.gmail.com>
 <YNFegmmCzk6JUTN+@yoga> <9aae3092-2e2b-9261-f4e7-864b873eb2d4@somainline.org>
In-Reply-To: <9aae3092-2e2b-9261-f4e7-864b873eb2d4@somainline.org>
From:   Jassi Brar <jassisinghbrar@gmail.com>
Date:   Tue, 22 Jun 2021 09:43:40 -0500
Message-ID: <CABb+yY27fvdJEg2aDDbzENZ1Cen3Biic6Kf74vKEr9-zawHmmw@mail.gmail.com>
Subject: Re: [PATCH V3 3/3] mailbox: qcom-apcs: Add SM6125 compatible
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
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

On Tue, Jun 22, 2021 at 9:36 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org> wrote:
....
>
> Checking further, we can effectively reduce the amount of compatibles
> in this driver by simply removing some "duplicated" instances
>
.. is basically what I think.
However, since the existing compatibles can't be removed, we could at
least stop adding new, but reuse the existing ones.

cheers.
