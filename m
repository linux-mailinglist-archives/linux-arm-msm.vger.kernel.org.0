Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A84CA45ECA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Nov 2021 12:30:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238145AbhKZLd0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Nov 2021 06:33:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239586AbhKZLb0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Nov 2021 06:31:26 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD08AC061D6E
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Nov 2021 02:50:15 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id j6-20020a17090a588600b001a78a5ce46aso9683367pji.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Nov 2021 02:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IYO6p8Ym3f2IeVVBn3iVr/FscUdiGm+cfP8ZhmD9kTA=;
        b=TyeOJQCkZ4i872PO6edTvTypMVE4mJ3hI70Wq8sVdT2+CiRgXEGZWCkjfwQPVEoO4T
         EHu47NvnI/1/G6uZZDkUQbEFJzdL7na/NZEOfJ/pUwQrgTZua/gKOhWTSULaXs6OuLfK
         YXfEUXy4RJ+da1+7NG2yCSMs9vgNO8yEsIUyu/OJRydsc5yEtR9OboTuMTwO/G6rV712
         k+gqUkjM1okV35PL8wLQ39hbcVm9vvUElQFmx2jL2nKrlZLUOf0TkPhMM1e+cxNiK+gh
         Z3F4IY2tsyxIEC5mTtexzewzcxnTklp5FU0M51lckDYSZYBF9tk4+fDa/YN4nfPn8DcQ
         Y6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IYO6p8Ym3f2IeVVBn3iVr/FscUdiGm+cfP8ZhmD9kTA=;
        b=6QmL1NU/uJ8AxkwFZSegdPcr8dxdVW85nNoWHE+hgUV0Ql7/UERyA2UCEedYNFCHH7
         Jw6VuVDZ+/s/6vxhtJNwQy7nwFVsCxUcdvirzy5cFiMXMSeAlcw9z26FzXAvtUL4ym3m
         0n/Kc5gdUO6bBlztlLC4BTi8AADmr1ZTRekx3niZkq/QaMtUTwtHY1X/OISrGYB53eS5
         oksMxOBaAq1P103BJ16eue2q42v+BX1/Az+xcklGjyokDj0wiVizCYsDnowDtU1M0CIV
         q8FIqXHSPKNHcZUdOCkA0yHJ/5pgfmTgZvxFlugv9/F/L0lOWE/eCmCfUIOlt9qp+7Sm
         4j3w==
X-Gm-Message-State: AOAM5303x3zXxdsiIewyDKgMfcsFx+mbsnQvzCUUldSyXu0pr34gjkiL
        7dTHHgZ8NKULqCUK5Z08IF9T
X-Google-Smtp-Source: ABdhPJxLfqswKQnt0W5ILuWZXp5OFhCazDu8Z1JO8uPVhvpQcq8kMmias595kKwl5/xR+psE29/GlA==
X-Received: by 2002:a17:90b:1e49:: with SMTP id pi9mr14607601pjb.220.1637923815369;
        Fri, 26 Nov 2021 02:50:15 -0800 (PST)
Received: from localhost.localdomain ([117.215.117.247])
        by smtp.gmail.com with ESMTPSA id 95sm5277452pjo.2.2021.11.26.02.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 02:50:14 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     mhi@lists.linux.dev, slark_xiao@163.com,
        linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/1] MHI fixes for v5.16
Date:   Fri, 26 Nov 2021 16:19:50 +0530
Message-Id: <20211126104951.35685-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

Here is a single MHI fix patch for 5.16 release. This patch fixes reset issue
with Foxconn T99W175 modems due to very short recovery time in pci_generic MHI
controller driver.

Please consider applying!

Thanks,
Mani

Slark Xiao (1):
  bus: mhi: pci_generic: Fix device recovery failed issue

 drivers/bus/mhi/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.25.1

