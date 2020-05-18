Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 933D61D71B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 09:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbgERHZP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 03:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbgERHZO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 03:25:14 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3493AC05BD09
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 00:25:14 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id o14so8695611ljp.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 00:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A4X2qdsWrVq8ys2tL3BwSCqBZMXXWj5rnnEaJc5JZaE=;
        b=eLfcfSqtRDuc6tbg88OApOzoqUcIS4NG8GeiZWnCrgN+ybEldsNH1oGxujMdMe5Bzf
         9bter5swZM+kfB23l91tUOydEeSmenGgjwlIHMzPGWZnZjn80YKa/MhPyZgN4AZ6c+K1
         ZAPmMlZ3l46v6YcSSsLIqCv2e9sMbN6cuproPK+HqWPMNvN+HzOasHiI8ySQ7FbD/vrl
         16n7FLJa3FLZICDzHSVgoGMDLudAgYf7FewpKz/VQ7aM7FPhEiJa0VjIpuszLuqRVn09
         660pC6OZGCB8RP19vKSAvyGq7Nsjb/9WIQru91qiA2NxLdLMYd87kvRI1ka/402H9eHR
         njoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A4X2qdsWrVq8ys2tL3BwSCqBZMXXWj5rnnEaJc5JZaE=;
        b=HPbNBHJM+eCOyIqTq2DkNIbdv6epmBfhfVJoLN5HuGKuQoy4G1FiRWZAUXbS0tr6Tc
         i9rPLCGYDJgiXHNUiQ14RLOu34jOZY3CGlvfFp/YammRsV2K+bxX7sOA0X8HJMPfBEJH
         sEkUcrgtj2n948bp/PROY9gemimRAyPipH+R/Q/TP0w23U3a5qw5y+5KxP+tDOyJZ839
         /K1jXEGKL8ALNkPODW9ouvjAQbQdVxqqAwnfnxYArqPtWXU/ho8aOkgq4ukRA9ZYY8bi
         K5t10KqfwkEy+QtmBj/EL1YL5KU1Hb4Kl5AgurNrDXNH0/Pl6t8y73vVkV1yfEpSqy+S
         twuA==
X-Gm-Message-State: AOAM532r7okmJ2MqmedVdRFNzceWMGwUCCSfjwi6lx//WrDeQJnQaAZq
        XTZGDRsC46YFru30ClBzDpCaKiy2bl57semYfNvuqw==
X-Google-Smtp-Source: ABdhPJwMZMkCfCW9raRwDJrjtwYd9CAK3CzuX6TpRrPy9cZjubvsZSWmsZiS6MCkoF/MQ2FSXPfidMfY+ruGlhpXcFU=
X-Received: by 2002:a2e:8805:: with SMTP id x5mr9995860ljh.223.1589786712610;
 Mon, 18 May 2020 00:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <1589361736-816-1-git-send-email-jprakash@codeaurora.org> <1589361736-816-2-git-send-email-jprakash@codeaurora.org>
In-Reply-To: <1589361736-816-2-git-send-email-jprakash@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 May 2020 09:25:01 +0200
Message-ID: <CACRpkdbcRQT=tK=jTbTvgoZvyzC4kSkkj2PK14nKE3WamVZz7w@mail.gmail.com>
Subject: Re: [PATCH V4 1/5] iio: adc: Convert the QCOM SPMI ADC bindings to
 .yaml format
To:     Jishnu Prakash <jprakash@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        smohanad@codeaurora.org, Kiran Gunda <kgunda@codeaurora.org>,
        aghayal@codeaurora.org, Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-arm-msm-owner@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 13, 2020 at 11:22 AM Jishnu Prakash <jprakash@codeaurora.org> wrote:

> Convert the adc bindings from .txt to .yaml format.
>
> Signed-off-by: Jishnu Prakash <jprakash@codeaurora.org>
> Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
