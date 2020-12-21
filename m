Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A784D2DFA27
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Dec 2020 09:51:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbgLUIvj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Dec 2020 03:51:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbgLUIvj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Dec 2020 03:51:39 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D4AC061282
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Dec 2020 00:50:58 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id i9so10219496wrc.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Dec 2020 00:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=HiUxImaTMOJxBS0lS8gkXi8Ib4VLGRDfAmzxV9NVmjs=;
        b=thNONzPi8sHYjiuDHZLfrDYWcQjyZ8LFHza7xvBDfME60d6EqXe41jaro8uB3hPdn6
         q+v2Ch8u0v0nUUDgYiPErLoAZjdYfbE+fEmjR4wFfoHEFKxOOcYH2Hz+bgfv9yAnioXJ
         YBRhNs+DpkTM07zNtGuEox+HraoKiLnj4v3C5hUVatDd057Ss8JHK0o22HQNZ+2yT3+K
         oSdYXsFULAkroiowZPYuCAdqU25m0qU7N+QzyvUVKNwGB6y2ZptWbliVn11xhOpFb4An
         FT8aQu/wAsfdsPmTDHis1NhPV30iPp4U4ZDWx1MaLjyk4E0SZvHbWEgUdQ+6aAdpobA8
         TZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=HiUxImaTMOJxBS0lS8gkXi8Ib4VLGRDfAmzxV9NVmjs=;
        b=cf6ZW4zjV8WsBwDE/vnQ5DZ9ssd442vNbXgDqtqll5apV4UBmvzjPuktt/6SUZAJqb
         Plic81uBXkuQ6ufVgDgr9krKwVdwnwWD4cdQ7G5f1n79tELgN8Bf+014W9SPpJ4c/B0+
         EhAQlzoy8bU//daX5FMYPk/55fNb1v27abezqPvfAC1PIMd1GhHor54yZ+0O9g8RJ1PY
         zrDX6t6SPp1v9kUrA6EJp4M3ZcVdq1xc7TXkePmtBy/sSu92mrguiJF97MC7nddY/590
         0lNKmLi6aCT9M5u4HeoyibLfUgqNH8EF+mvHftynCRnawy1ZzEFPbMbUmdE+r5CubDLQ
         v54w==
X-Gm-Message-State: AOAM5320gnLOpFjLvfCCgKqfa4GbmfU2tRHCIFlMAPyFo4qCSYrXU7k7
        kGaYcAyXdW2hRc9tnhayjq75+Q==
X-Google-Smtp-Source: ABdhPJz0CfnJMqRakjbLvxsa3wOtw8VE5NpYf1AuUOoYPDYUwgIWZv82mIQcXWXUwOm657ra4/VwFg==
X-Received: by 2002:adf:ba8b:: with SMTP id p11mr14910550wrg.328.1608540657646;
        Mon, 21 Dec 2020 00:50:57 -0800 (PST)
Received: from dell ([91.110.221.144])
        by smtp.gmail.com with ESMTPSA id q143sm22522944wme.28.2020.12.21.00.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 00:50:57 -0800 (PST)
Date:   Mon, 21 Dec 2020 08:50:55 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     robh@kernel.org, swboyd@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 1/2] mfd: qcom-spmi-pmic: Convert bindings to .yaml
 format
Message-ID: <20201221085055.GC4825@dell>
References: <1608279292-24760-1-git-send-email-kgunda@codeaurora.org>
 <1608279292-24760-2-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1608279292-24760-2-git-send-email-kgunda@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 18 Dec 2020, Kiran Gunda wrote:

> Convert the bindings from .txt to .yaml format.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> ---
>  .../devicetree/bindings/mfd/qcom,spmi-pmic.txt     |  80 -------------
>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    | 127 +++++++++++++++++++++
>  2 files changed, 127 insertions(+), 80 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml

What are the other patches that I was not cc'ed on?

Generally it's a bad idea to send only some patches of a set to some
maintainers.  Best for everyone to have full visibility.

Also looks like you're missing a cover-letter [PATCH 0/4] which adds
to the opaqueness/confusion.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
