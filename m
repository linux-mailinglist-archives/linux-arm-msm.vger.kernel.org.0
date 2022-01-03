Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36E52482D99
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jan 2022 04:01:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbiACDBK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jan 2022 22:01:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbiACDBK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jan 2022 22:01:10 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5FDCC061761
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jan 2022 19:01:09 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id t26so67310671wrb.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jan 2022 19:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZPVYLHdEN2vTjfHQg99TQO0KsUtSn3N32X0J9UMa42w=;
        b=H2Gj8QRAS7vbR7dVQuXfqWlVxR/q75a06Yf7SXfC8g7bo6wPNAGbKwvo9e1oDp0rSS
         IqVi5jZ4zlKsJogJi16DJpAnfcM4y5FFmOjuLq1ELUTjNV7KQNVqA3ewSgeG4Y9u/hcN
         7pRuR3J2OV9l2u+zJY+KggAf4kPCLt+XSf89ufkgsX63CHXS91d7tBVh097+h0XU4Lld
         pIn494w+M027JxDJZnw9RmQwAd7JmfI3dVFqXpQIPXodoqTYKq2ZePtl93zKGlHgbpK1
         cGxDMwdFS3f90hOgmhyeDguH5a66LS35QJwFducQygnYMZCLvqKiTzanRw7CPM58kHOA
         rADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZPVYLHdEN2vTjfHQg99TQO0KsUtSn3N32X0J9UMa42w=;
        b=euDxrwhzZHS3f+dPVsprSRuVwSnkYYokOVEa/zhDv94/NdGHtlAcRPH+rR0xXj6UUf
         mfN+L6yyC77dZovZhCXHvDGkmSfNwr3idQ5Q+Ind6GmEI8I1WHqQklqastd1nOjT8f1k
         USKu31Kw6J0fO0lmizYcaFT0NJtMqVK901cUYfiVwffoFYuSg54iHPRnD+gKRMP0mqgi
         /P5UaLqRGj1uau3+zz3WXR1dSttHdJSUmprhbXjx1wsEdCy1OhV/RhJMm4jT+CubS8W5
         3ZR/mprddB8RSq1qp35MecWwAHR9NNcEmkMcKy8U5Ndw/BN0M3fbUYZ0ldr5dj+Qkdq8
         tWew==
X-Gm-Message-State: AOAM530VwiKdkPUuhaUIYr85pG9d1Dqw1TB0vBKtxjr/xzKqtwkSg7SX
        JGDmNz8eUtXUw5z3aHa8rUpUvxjaK+fqIw==
X-Google-Smtp-Source: ABdhPJxcACWfxvCOxKTjwsBBcoTwoLDkHGPSqYp5nL4pj5yyJ6axB85Bz6ziXkkXIbIBhKNcXbiB3Q==
X-Received: by 2002:adf:f245:: with SMTP id b5mr36603818wrp.506.1641178867961;
        Sun, 02 Jan 2022 19:01:07 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p11sm38095667wru.99.2022.01.02.19.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jan 2022 19:01:07 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
        mani@kernel.org, miquel.raynal@bootlin.com, architt@codeaurora.org,
        bbrezillon@kernel.org, absahu@codeaurora.org
Cc:     baruch@tkos.co.il, bryan.odonoghue@linaro.org
Subject: [PATCH v2 0/2] Two Qcom NAND related fixes.
Date:   Mon,  3 Jan 2022 03:03:14 +0000
Message-Id: <20220103030316.58301-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I've already sent the ordering fix for probe deferral in qcom_nandc_probe()
but there's also an associated printout in the partition parser that
shouldn't be there.

Add a patch to silence the spurious error message. 

Bryan O'Donoghue (2):
  mtd: rawnand: qcom: Fix clock sequencing in qcom_nandc_probe()
  mtd: parsers: qcom: Don't print error message on -EPROBE_DEFER

 drivers/mtd/nand/raw/qcom_nandc.c  | 14 ++++++--------
 drivers/mtd/parsers/qcomsmempart.c |  3 ++-
 2 files changed, 8 insertions(+), 9 deletions(-)

-- 
2.33.0

