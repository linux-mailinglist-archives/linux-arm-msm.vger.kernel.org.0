Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAB754A5654
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 06:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234113AbiBAFUk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 00:20:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233763AbiBAFUb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 00:20:31 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 318F8C061763
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:29 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id m10so6178380oie.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G0aG669PsgXP9P6gAr8/xW6JA5lRIN3Hof/IGZioAg8=;
        b=dbMfihBAn0HEDh2PDmqD9IynUfx4A7IL8vjxANjNdUWzWz5mpZ2h1dPE1YewNISwap
         MNuSNYjGUAn+bOuT+Sj8BRLYayU94F8AjPvE+OS6RW8uFElpvj9L1/OHCLGkrGX+SMx2
         d34XdeF1HpRIvTWRvuLE/ujyBkQ79ASnPj8P8AT1CCj0mlAYeUfjJ4grUb9okB3udclR
         /vpBEwwl014m+NjRWoKSInxpJP1LfrL5YTHbbW8TBcrl+GtKJg8OAJK1/R9328VByIFn
         m7at8W80VEDDqG4NVhycfvY5/1WRqlHkTbV4VvpIQE/0mm3oDO6x946u77Saz5hRUuHZ
         /z8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G0aG669PsgXP9P6gAr8/xW6JA5lRIN3Hof/IGZioAg8=;
        b=PVyoulHWyoDStCczB+CehY4docq2bLTgx3oidEBCYFY1ENMLwIIwfYdA0sBgbbD+Mt
         B2ni9vxGZnkof07IQBaBl4Xg2VoR8UrT7iF+S9C0jcBHBsy9xkl9Kp0M8f8JBDpv+Rc6
         XdVKifmtS/P2E1hAKiUGsY/WzgK+kNPqAa8LAXCOsmSKK9nQuKTBDCyE6/Pq4Xfvv7PS
         k8lK8jFMcfJdfN0mT+lFlhIkzi3Ohs0UIRmGiLnM7TveATpAkYqcNsfbfwYKZt7KPWZd
         dGkl6pc9ZF1U3QhQ8k4A+2nhiCC3PaqQu9WehbGBEMRLxuoAox/c3CMTf+8IVtTLDHjf
         DcDA==
X-Gm-Message-State: AOAM5314PKUfXepWVn6k9A8OhQ7MCHTCY0g/uhHCeZ04b8GYT/Jaji/8
        /2/Mf73EP8xYQ1qVGiF0NVBcfjov5Qv2Zg==
X-Google-Smtp-Source: ABdhPJziV9DY8HYVCofXNLnbC1w6PFFADzFCMBRVwdftsOUyCsC5d+olIAlWi8pR4ZQjpAgsYMeTNw==
X-Received: by 2002:a05:6808:bd0:: with SMTP id o16mr228863oik.26.1643692828557;
        Mon, 31 Jan 2022 21:20:28 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:28 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc:     devicetree@vger.kernel.org, ~okias/devicetree@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] ARM: dts: apq8064: make pci regs property dt-schema compliant
Date:   Mon, 31 Jan 2022 23:19:36 -0600
Message-Id: <164369277343.3095904.5100675113829735729.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211225003502.115502-1-david@ixit.cz>
References: <20211225003502.115502-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 25 Dec 2021 01:35:02 +0100, David Heidelberg wrote:
> Correctly format register pairs.
> 
> Fixes warning generated by `make qcom-apq8064-asus-nexus7-flo.dtb` as:
> arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml: soc: pci@1b500000:reg:0: [458227712, 4096, 458235904, 128, 459276288, 256, 267386880, 1048576] is too long
> 
> 

Applied, thanks!

[1/1] ARM: dts: apq8064: make pci regs property dt-schema compliant
      commit: 019b7f93bf0dd6de82810f3cb0897ebdd5fd9285

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
