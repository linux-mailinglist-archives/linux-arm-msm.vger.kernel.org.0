Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36FAB2FE204
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 06:50:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726665AbhAUFsz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 00:48:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727247AbhAUFsl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 00:48:41 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76548C0613D6
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 21:47:35 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id v1so557642ott.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 21:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=So7n4CXW5rfKosTBs+wAYGz48ULvBM4ktYJXBciZ7Dc=;
        b=glVhYP4Hu5qOk9XNH1PetEtPf065rkp8x4wHsjwwkBo4jfTlVvwx0U706YM9o7PlR5
         jBrl2ZnGv2+mtCQkUqkUbXZF4jOYpgKTK2w7nMqOyAM8r6+C9uGiL6L7PejsYpWlskc2
         q7bRCXo5M6tg2AdAtkq3kPcJJlp5mg9D018HK5w39x3c5b2FQ+XvbzDfx2nhkaQKN8II
         9q5JFrFOlXnCOUl+EcPlaDaq8s3YIFMhhugXN/b6aDSNjT53LFqi2QKTJk0CSWfd6Sp+
         9bv7f5wxXfKVh3XEBLOxQskKVuqy6fLBVHSHXIblh64umV+rQT8/x5vdGUxi1rlE07DA
         +XSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=So7n4CXW5rfKosTBs+wAYGz48ULvBM4ktYJXBciZ7Dc=;
        b=dfys2DfOgE7eW05RLJrzUZLLdc1oeh04mW9xZLUzrJDNwYpi1/yPjkF/uy2v3LF+gM
         qgEz1lvvpDtxnk2EdNL3aYcZgS5H0ZLllyobP7H412t5IYYloOxnMMwN1YkV+07lU7z1
         Phb6gOTEdfWTxuRKOrJ4ylnS8F0VYwNm7aGjTzjAqQ0qfB8MhDbvqdDCFArDF0OR7sVm
         xNVug11ImXo4F/15ZZGej93XAaCjFDlzdwC3/9lc7kpBS3+063xdHdIesd/gq5SIiPsX
         /POSCENPsw4tkHr+4tFh98ENUNMIrQCjIR8tim64JdGYVtgUNXlK6LiXCwfapH8F1mN4
         JULg==
X-Gm-Message-State: AOAM532x2c2XXj5Ou+CX+W+TpJkY1jdJWZUxkpUjQNYoIFLfgnxhuNtn
        OyEDhHXAi8LjccbHi386Pxpm4mTskjRP3g==
X-Google-Smtp-Source: ABdhPJysvLoMeu7qgenoO6uU13klsr+b3S9kAO++BSTs7ZLhpyiB2MkpLh7oktSJj0YYNOZnAM70Iw==
X-Received: by 2002:a9d:611b:: with SMTP id i27mr4298758otj.352.1611208054744;
        Wed, 20 Jan 2021 21:47:34 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 67sm79061ott.64.2021.01.20.21.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 21:47:33 -0800 (PST)
Date:   Wed, 20 Jan 2021 23:47:32 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: gcc: Add global clock controller driver
 for SC8180x
Message-ID: <YAkVdOmy0MTeRQhz@builder.lan>
References: <20210120223556.1610214-1-bjorn.andersson@linaro.org>
 <20210120223556.1610214-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120223556.1610214-2-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 20 Jan 16:35 CST 2021, Bjorn Andersson wrote:
> diff --git a/drivers/clk/qcom/gcc-sc8180x.c b/drivers/clk/qcom/gcc-sc8180x.c
[..]
> +static struct gdsc emac_gdsc = {
> +	.gdscr = 0x106004,

Seems like I missed squashing the fixup where I subtract the gcc base
address after migrating these from the downstream dts.

As written the platform doesn't boot.

Please let me know if there's any other feedback before I respin v2.

Regards,
Bjorn

> +	.pd = {
> +		.name = "emac_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR,
> +};
