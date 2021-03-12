Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7EC338537
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 06:28:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230501AbhCLF1d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 00:27:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbhCLF1C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 00:27:02 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C042C061762
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 21:27:02 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id w34so14058282pga.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 21:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=J5fqwubZg87avI0rRtQwN+SXtjOKj2+8RaJp62TnkpA=;
        b=mf2lohOPVRGidobqklbZjn3Xnmn4GilOSAPz/Es4rZMVhvRFW16qKSvJwGxacizmDM
         tT+ibJwyDMj0dZ0QwtMsGsshtI9JpOBj3AoJvLaAxuhaZ4HL6tkdafRXi5HPx8aFNxZ7
         4/jSQSqTdf3ieXs01o99B+bOnXCH2Vj1q5a3kEifOFtvDASGY1G+OFDLlWG+R79T9q7h
         sdjbwjQxL/4vjj48pT1ohmJzSy1nFnAXg+AW9fFrnh+JpHsKDI6C6jrmli1PwCO/6P9O
         ggAmfg1YDpRtAAdzDL+kVupEn08FqGF4jO3q4TaMYNg5dJBZY8ewfS1R7G6SA7fUhvy0
         ssOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=J5fqwubZg87avI0rRtQwN+SXtjOKj2+8RaJp62TnkpA=;
        b=UH3xhxCEUpXxN+xPIhzcWoFml79ikPi7G9ReBZ3RfItnnntWB+DvkIz8otBgY5+iLf
         LNf4xP4Ge4+F+BOc5PqSsdSt6HY0rc16AdcsaEkQtCJP3KRYV+rzWzf7KQtq1B18H9kG
         Jd9j9Uxuj2yuCCCT2oR/XpqWRw4CkcckFowrENeq2+ZXpngE0fxIrokJQcJ13tEDsNWr
         9HwTchhkxRtuzfymVHrs8l9Ch+1ELOfWJijH2QZITmZNge1qgndTzSZv+b7OusZgaeeU
         mA8AW9bwuYQ38r7IDfUF4+jlxa5yZT2ooJxoA/bq5uOLS5ZgOkFFZPNpEDlppSdVW/Hx
         GHLw==
X-Gm-Message-State: AOAM530YPWdxjevAr8IHBFCDxldXzizxzGFjZkyoCp7pL/AG+qCakU7B
        lcwKOkzwAJbnn4p7A2x8XoHImQ==
X-Google-Smtp-Source: ABdhPJxSydG1zZQdQJipt4kFNAl189iLlI7sOzPMgqns7aTDEbaSzTwo9QPnHQ8GgoEZNmcDOq5YJA==
X-Received: by 2002:a62:84c3:0:b029:1f5:8dbf:4e89 with SMTP id k186-20020a6284c30000b02901f58dbf4e89mr10615120pfd.49.1615526821953;
        Thu, 11 Mar 2021 21:27:01 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id a144sm4185197pfd.200.2021.03.11.21.27.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Mar 2021 21:27:01 -0800 (PST)
Date:   Fri, 12 Mar 2021 10:56:59 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Rob Herring <robh@kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Steven Price <steven.price@arm.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 05/14] opp: Add devres wrapper for
 dev_pm_opp_register_notifier
Message-ID: <20210312052659.uih7ikjdnkc5kl4j@vireshk-i7>
References: <20210311192105.14998-1-digetx@gmail.com>
 <20210311192105.14998-6-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210311192105.14998-6-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11-03-21, 22:20, Dmitry Osipenko wrote:
> From: Yangtao Li <tiny.windzz@gmail.com>
> 
> Add devres wrapper for dev_pm_opp_register_notifier() to simplify driver
> code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/opp/core.c     | 38 ++++++++++++++++++++++++++++++++++++++
>  include/linux/pm_opp.h |  6 ++++++
>  2 files changed, 44 insertions(+)

As I said in the previous version, I am not sure if we need this patch
at all. This has only one user.

-- 
viresh
