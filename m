Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D742268820
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 11:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726123AbgINJTA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 05:19:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbgINJS6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 05:18:58 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BC42C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 02:18:56 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id k25so17990344ljk.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 02:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gnEpJzbyGxYVJC+WE9SlhHIeVnSfB41fHSb+EFmzq5I=;
        b=zqjb5lwtMePnKZPt6EWPRArVIa/aHqCY/jZ9wBc0z4i5LaIefGJakujGhp4SSsQZ9E
         /kR29oWljmdvVz+/l/iLXn/L00M2wL6Nw2Sa2xHFJgXfDY0MBzYlYtBnfdsJ985VQPUF
         3eKmlP/f3jt1/RuYDgMOpcY2cscoNIByY9nQvp8NlM9FARWh2NGHTVq3YgmhzBYmYuc+
         zDN9DriOCx388ztJuyVcemJVBQ4ADjGrlvGiWaHyxP237elQoSk7qAZ6jIwPNpAVnCv3
         hGngjgZ6K94oaDIBsLaLNKh8B8HilQPwqlSQz5jh5/fW2pshBhvXw+P3dYukDMKtndh/
         s9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gnEpJzbyGxYVJC+WE9SlhHIeVnSfB41fHSb+EFmzq5I=;
        b=MllSqvMJSH6eyazlOQpcZs4MDKsUrYmWQn1rtWJiPSxriQW2znqAA3TsBLNbNTZYy7
         XVjMkYtNIpVFTKeIfIs9StuvYEBGABeqKDiz3t8PfsvEPLFxdovqdLKNyqUAueRqtBX8
         kIXnheW37arphhJcQ8R9n1iVBe9ToZ8F0Q3mo0Mw1JkavssJaCJHNT7OzBgiIlAQB5gT
         cj8z0TjlAv+9smDIpw4zwOpkGii0POic5faH8NzrbZAnATO1B/NsQv67Y8bo3gCjPG8N
         Y9CtZNh3MwfX9c9QFPmUF5bsaaCXBVCcIomrhTpTNFujSEIsbYe9sFAtmj7gUcREKjjL
         oOfQ==
X-Gm-Message-State: AOAM532xCnvSRqhLNZyftWDh0I0dTx9U8uGyPM7+ZzlLdy+tRzl/Ptpb
        Pky6bCifVYIcvSKxhDWkmoShWw==
X-Google-Smtp-Source: ABdhPJxf+QlWGVT+Im3JbTN8tb88VuUQ2D/GH2xr/fxP9MQYl0pnCS33Vk0FT6BS+EHZtS6AEohmFw==
X-Received: by 2002:a05:651c:22e:: with SMTP id z14mr4576273ljn.260.1600075128793;
        Mon, 14 Sep 2020 02:18:48 -0700 (PDT)
Received: from eriador.lan ([188.162.64.187])
        by smtp.gmail.com with ESMTPSA id 191sm3214606lfa.131.2020.09.14.02.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 02:18:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3] pinctrl: qcom: sm8250: correct sdc2_clk
Date:   Mon, 14 Sep 2020 12:18:46 +0300
Message-Id: <20200914091846.55204-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Correct sdc2_clk pin definition (register offset is wrong, verified by
the msm-4.19 driver).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 4e3ec9e407ad5058003309072b37111f7b8c900a
---
 drivers/pinctrl/qcom/pinctrl-sm8250.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250.c b/drivers/pinctrl/qcom/pinctrl-sm8250.c
index a660f1274b66..826df0d637ea 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250.c
@@ -1308,7 +1308,7 @@ static const struct msm_pingroup sm8250_groups[] = {
 	[178] = PINGROUP(178, WEST, _, _, _, _, _, _, _, _, _),
 	[179] = PINGROUP(179, WEST, _, _, _, _, _, _, _, _, _),
 	[180] = UFS_RESET(ufs_reset, 0xb8000),
-	[181] = SDC_PINGROUP(sdc2_clk, 0x7000, 14, 6),
+	[181] = SDC_PINGROUP(sdc2_clk, 0xb7000, 14, 6),
 	[182] = SDC_PINGROUP(sdc2_cmd, 0xb7000, 11, 3),
 	[183] = SDC_PINGROUP(sdc2_data, 0xb7000, 9, 0),
 };
-- 
2.28.0

