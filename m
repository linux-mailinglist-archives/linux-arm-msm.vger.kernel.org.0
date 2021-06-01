Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6A8F397654
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jun 2021 17:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234359AbhFAPSB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 11:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234130AbhFAPSB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 11:18:01 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAD16C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jun 2021 08:16:18 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id v23so12413749wrd.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jun 2021 08:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=9N/R5apkW7OyJPTinHkQdbCP9LdocCdq+1dxJucdCHo=;
        b=y/z0+en3WznJcf6Fkw5M1Tlk+8E7kHJqTu0WIeFAogSLXVmlmIM3k7sbFmT5SgWrKg
         yAkK3DrCaUlYQ11OfNQRkJlGYWLvzHmlj5QpSjXszmRzRhGjVxLrxszOSC6dFIrFrIRa
         S0g0yo6LCFPu9uPT/hr8j4l1ND9l6v1oYgPjKvK5uAcsp1k7ofW4IL2hvA/AtATNKzux
         HukqxQ+Fl8RG8XDDCa3e7nR+lA8IDFjhx/gbNlH70BwxJ1byif+gfVbrtisxnNfIHrs9
         +I1ydZFHWSSkPF1JmaaxePN0OyPeFbRRSH0+Y/VDdnUj6Zqwmrq0o3iM10YvMu60EYks
         +FFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9N/R5apkW7OyJPTinHkQdbCP9LdocCdq+1dxJucdCHo=;
        b=ul3//e2KpJ0KbuJxQxhpMVTL9RCo7Jj1//Y4zocMxvHwIebR5GpVhUohWxiyxhSoJh
         szVOTYOd9Uce+Ylq1FG3OUeBOwOEUqG8B5pALDf0BpJvquyb4MdyVJ3AZnk+eJVJsfrz
         0hUUDIPl+hsZ8bB8LYMKYFuNHujvtJYlCCwHdk8ZFz/YUymxTvoEiInhsWmIG5NEmFHS
         u/wD92EMh1mtg46iMJny9Yb+kZf6pm0+Oq2fU6L/3le8vBZLwG9SpVHhh9H/PODLUX9P
         ZWIb5RUFAbd696sTrFf54rJgaL4SnPxAbkP5ygKYhVVvcF/56ph4FS1PltjxPZhgtKQ0
         d7Ew==
X-Gm-Message-State: AOAM530CViVI1DCP3r6pkhVis7ID7DTqG+t7vKPHktg3YgbHkCbEgSCI
        G69udz3VaDhxOP6P8Wj7Y8qEcA==
X-Google-Smtp-Source: ABdhPJy5z3N9VAoqgIJvTIfNHIEw2Tsk8hYf4ihv8KwZfGfhWRzNFiHJ01Rm8tMnCiteN5fSyKfSuw==
X-Received: by 2002:adf:c393:: with SMTP id p19mr21354228wrf.92.1622560577405;
        Tue, 01 Jun 2021 08:16:17 -0700 (PDT)
Received: from dell ([91.110.221.249])
        by smtp.gmail.com with ESMTPSA id l9sm6843223wme.21.2021.06.01.08.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 08:16:16 -0700 (PDT)
Date:   Tue, 1 Jun 2021 16:16:15 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Guru Das Srinagesh <gurus@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v4 3/3] mfd: pm8008: Add driver for QCOM PM8008
 PMIC
Message-ID: <20210601151615.GS543307@dell>
References: <cover.1621965146.git.gurus@codeaurora.org>
 <4e97bf0bf3b876d18f958660f0ae8ad0baed4566.1621965146.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e97bf0bf3b876d18f958660f0ae8ad0baed4566.1621965146.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 25 May 2021, Guru Das Srinagesh wrote:

> Qualcomm Technologies, Inc. PM8008 is a dedicated camera PMIC that
> integrates all the necessary power management, housekeeping, and
> interface support functions into a single IC. Its key features include
> overtemperature protection, low-dropout linear regulators, GPIOs, and an
> I2C interface.
> 
> Add an MFD driver to support it.
> 
> Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> ---
>  drivers/mfd/Kconfig       |  14 +++
>  drivers/mfd/Makefile      |   1 +
>  drivers/mfd/qcom-pm8008.c | 260 ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 275 insertions(+)
>  create mode 100644 drivers/mfd/qcom-pm8008.c

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
