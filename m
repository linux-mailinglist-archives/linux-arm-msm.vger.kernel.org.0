Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 377EF2B73A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Nov 2020 02:18:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727926AbgKRBRX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Nov 2020 20:17:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727734AbgKRBRX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Nov 2020 20:17:23 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98589C061A4D
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 17:17:22 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id e139so595297lfd.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 17:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=upNhDSD7uK2ZOVQ0hHkzhR+LnuCA5mLVwy01zUvUhgY=;
        b=bh+8rQxwa7EjqGdcGJ0qNVsUM0Efy0UbTffNihX5hvdZWSCg13yXcuLVT/XQ+mL3y8
         j3YsVmlBs2K2YkpaHT7okR68fq7dIIoLfLJFfUod/C+v6O0fHrxUPaYU6WvirJjsdGaT
         m5iuhQ0cBW3zH1BevrETby2ATSldsXill6yhSradv2bCdNneCQdasMPdNavDdsDRXbwH
         o5i39TSLtvB1PYLKz4dhv38Xvz8w3kyQcVJa+hDXFJpeGC1uRk55rxjd2WQ8Xb1bPqAt
         k8eetWzgpY6smlLohuJC67AP4sHcQEju41rmUl+whR00O9X00ObqbUmEUq57rqPR26i+
         TwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=upNhDSD7uK2ZOVQ0hHkzhR+LnuCA5mLVwy01zUvUhgY=;
        b=dA8z6yTgeln39yBagzITJNNKVaM5k9WuNe8GaETUjB+dTmX0XhGCMo7srlq5LUdfmz
         m7ig3jnV9bgrlSp167xBlUppXCFYXKvcViQwG2LodUOt2HFCeDGu00SQ8AfDkDATvq9F
         1L3MmhvAN6SQnbEpHCeYgEVzIz3phuCfLSPznMHYejMGvbY3NJdYrJ5iBqFh5cAIUv8x
         e+ekOL3q8LWPKYoolmky9Lwckk+epfn8ahLc8YqgIyWxeNXTEYs8CHmiWsiXreThln91
         U9ewOFt8ch9wI8CT45Hmyt57qy0dU2oXvsT9Carfi8YuCxqXPu2gQ53Dlu0ekDfV3Oj/
         wn+Q==
X-Gm-Message-State: AOAM533DuJlEFzlL4egdWz39h5/XTGtDIighbyek8Q9Bc0COAgULV78N
        7nImVKqpXnHY4ElNZf7AI/BFoToNhCRP5ydsoyebgw==
X-Google-Smtp-Source: ABdhPJxFHQAIQRDKhTcuTDcK2nXR2ixM+rGNxNiVeK8ytP7bxNblPyvGZGafF5gPs+1iohaXMatPtKjbDdSfBnvUCG0=
X-Received: by 2002:a19:546:: with SMTP id 67mr2520411lff.502.1605662241004;
 Tue, 17 Nov 2020 17:17:21 -0800 (PST)
MIME-Version: 1.0
References: <20201117174845.28684-1-manivannan.sadhasivam@linaro.org> <20201117174845.28684-5-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20201117174845.28684-5-manivannan.sadhasivam@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 18 Nov 2020 02:17:09 +0100
Message-ID: <CACRpkdbaAJdH6FebbpiAV7wmoTA8Rb_vqKyrDNLX9sy4Jv9RjQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] mtd: parsers: afs: Fix freeing the part name
 memory in failure
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh R <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-mtd@lists.infradead.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 17, 2020 at 6:49 PM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> In the case of failure while parsing the partitions, the iterator should
> be pre decremented by one before starting to free the memory allocated
> by kstrdup(). Because in the failure case, kstrdup() will not succeed
> and thus no memory will be allocated for the current iteration.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Fixes: 1fca1f6abb38 ("mtd: afs: simplify partition parsing")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Good find!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
