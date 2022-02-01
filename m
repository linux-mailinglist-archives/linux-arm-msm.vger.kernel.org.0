Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0C34A5661
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 06:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234251AbiBAFUv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 00:20:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233816AbiBAFUi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 00:20:38 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5AC9C06177D
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:33 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id s185so31225197oie.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hVGYmXArXG8GIfrXzf15WvJ5KpD7Ng0lKVLODJ1EcMg=;
        b=VNuFtQzu2pwPOug3u4uIiEihzfC8Ll6+3SX0rNG8rXpG9yPWPqnCfFd1uhVZOHu11C
         39HTeFJkAyMXND2wx0RzSGaDgNvNb8ohh/f3fbB7rQWyQUPzsKdAm9Lpd/Y3nML9qVLZ
         eWqfEIz373nLaAnpI0bXhf+sPaDYUWVfvKLuHepo47w2rwbmOzAeaqpRtPeamQmA2zVC
         FOAjMAnou/QCqFZI/2Wq7mI/6BV7/EZ9too6gPOk6FNjp7Yp9aiByoLXJS4NKbmoYTGg
         bJ5/rL1B9kHGKmluH5Z6mvrHFqKhpGLF45qqVS04nVMz6UTZo5m66YhPpDbQXb4FKJEw
         krew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hVGYmXArXG8GIfrXzf15WvJ5KpD7Ng0lKVLODJ1EcMg=;
        b=UTyVdCvg3AUo2lWaTKN9rm97LPL7astu381bo7KNqx0qBHjjq+SPHHqZ1v2XQoe8Ax
         OrqAMI0NGJMfbN1h9h1h4ZvgWZ1nAIQUCmz0hd61nN7r/ArMH910Zuo/aBmnGg19r0H9
         nFYLr856Cm1xbsQEQaYHCOINqjYxsENsb6s+zABKTftvhC7yblj2/GdQTHe3N1c2snFb
         3f7+Z+js8lkyOh88XtRESAdPz4L++QZxPS5hmxWCU4taKvOrEGHZiJnvsq9PnOAdazGl
         5e0kep5tyGMkC5GegjRn8DHdwGRyL6/GEFony++dIJX9G/y3uZeX7Amp4T5DL06OfN8X
         UmdQ==
X-Gm-Message-State: AOAM530v/H/KvkMaouK4oWezNfY3YyUpAB8FPChdckWHIdveVYpe0FMY
        LEygVDXBSKOJkgB+WvVbqsjP9Q==
X-Google-Smtp-Source: ABdhPJw0rxP0aaD7SBSgIboiruNmEfyN88p/y60iO7CYjNuN2WP4yup7/68qbil1igVnoBMb+89TyQ==
X-Received: by 2002:a05:6808:1248:: with SMTP id o8mr224207oiv.205.1643692833142;
        Mon, 31 Jan 2022 21:20:33 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:32 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc:     devicetree@vger.kernel.org, ~okias/devicetree@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        LogicalErzor <logicalerzor@gmail.com>
Subject: Re: (subset) [PATCH] ARM: dts: qcom: fix gic_irq_domain_translate warnings for msm8960
Date:   Mon, 31 Jan 2022 23:19:41 -0600
Message-Id: <164369277344.3095904.15509491723672452794.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220108174229.60384-1-david@ixit.cz>
References: <20220108174229.60384-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 8 Jan 2022 18:42:28 +0100, David Heidelberg wrote:
> IRQ types blindly copied from very similar APQ8064.
> 
> Fixes warnings as:
> WARNING: CPU: 0 PID: 1 at drivers/irqchip/irq-gic.c:1080 gic_irq_domain_translate+0x118/0x120
> ...
> 
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: qcom: fix gic_irq_domain_translate warnings for msm8960
      commit: 6f7e221e7a5cfc3299616543fce42b36e631497b

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
