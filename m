Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1274A5669
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 06:21:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234094AbiBAFVA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 00:21:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234089AbiBAFUj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 00:20:39 -0500
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EEF5C061749
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:37 -0800 (PST)
Received: by mail-oo1-xc2b.google.com with SMTP id k23-20020a4abd97000000b002ebc94445a0so3881380oop.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LAH/xpO7dmqJi5llds2HI9MJ54m6F+2jB1nqKKZdM5Y=;
        b=BpvDhL1UW/95FzozB5gGcxlCpzNIRGs6r0oQK8xWbCoP9g0aNjIC7FjLxh7cdnyJS1
         5mVSQ6HzlZOxQao4CbnInfYXeefvahwiFeRZZdl2c/uj2Ma6OT2B896dpryZJOo0jWUG
         3dkEZqdl/E1RE0rHeWW47NU3yroh/rGgMBediRPheFZ6dJMIAENxFmLDQ+JXUzxH7LOH
         PrKsipfEctcWxNs5Rjg1xMQFd7yd/Ned7i5bjakp7foGK/LtnpBrt5mi5Di3kZhPEga7
         7y5z14nCizw2LBNOM05gkD9+7GWCMOKknb7lBlOprpIXqNQhLEewHIGaV/UHZtAXsgfd
         9jow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LAH/xpO7dmqJi5llds2HI9MJ54m6F+2jB1nqKKZdM5Y=;
        b=cFwVzOHPkLz901ajeKv1+/zGDILMzSw1o5JalaLy0AvcJMLkZIcjwMmFE0iRpodi8l
         PcKTyMk8hSaX9uqXdnlyCYOr5PTYoFp33VVG5GmKkPDsAG2myePP2bV1wGHCk5mmyFJO
         9KmAwL2d2SGegKpAxmjpE8jx8DolEg29ag0Q+UcB7U0ZKuvbUyjFgrgXrjfWss3Aszin
         xXWlV4bd5NTq+ZXfOdba81ZKHwekaGeLcmurW3quzTiA4kltAoevJKQL77PXK6/wFs4L
         V4k1MSwSLqtCEjUL7swGwN+FYMmlYdJKowjx8ajiv391eaulWMIoQAYZfF/ZK42cXSPr
         NddQ==
X-Gm-Message-State: AOAM531seyfAqzRtwSWg5j7a+LWbv+1YKzkr8+pE5fNjFJ+9YCfVpLXP
        lN8AcwXodcrZu/Xwe6LKH+900cclHPqLaQ==
X-Google-Smtp-Source: ABdhPJwkWgB/pkfV4ZHTa4Kgbu4KoU8Gtt9Ihu6VdrFVAVrPPs9MLFEQw529dR+k4nv/oTaXajin2g==
X-Received: by 2002:a4a:d54e:: with SMTP id q14mr11808566oos.39.1643692836786;
        Mon, 31 Jan 2022 21:20:36 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:36 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>, Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH 1/5] arm64: defconfig: Enable some Qualcomm drivers
Date:   Mon, 31 Jan 2022 23:19:45 -0600
Message-Id: <164369277342.3095904.4200248396936294863.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220131165056.2117434-1-dmitry.baryshkov@linaro.org>
References: <20220131165056.2117434-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 31 Jan 2022 19:50:52 +0300, Dmitry Baryshkov wrote:
> Enable coincell, fastrpc, mailbox and adc-tm5 drivers to be built as
> modules. These driver are used on many of Qualcomm platforms.
> 
> 

Applied, thanks!

[1/5] arm64: defconfig: Enable some Qualcomm drivers
      commit: 1677e64d480d190959c971a69c17e8da27bd3e17
[2/5] arm64: defconfig: enable ath11k driver
      commit: af2d38db2674139182e0cea4552cc83cbb8db0d0
[3/5] arm64: defconfig: enable mcp251xfd driver
      commit: 17ef0b4b441f755ad81800167a672ecbeeafb6c5

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
