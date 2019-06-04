Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1FFD3448C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2019 12:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727454AbfFDKpJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jun 2019 06:45:09 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33905 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727472AbfFDKpI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jun 2019 06:45:08 -0400
Received: by mail-wr1-f67.google.com with SMTP id e16so7022248wrn.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2019 03:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MkGVFZY1XhtlH3EXbDSeWCPiZrbaYk4zwPdOeyiIsNc=;
        b=hljw8RsTFEcbuplHCj6D4tq/5nIpPFTXoAK24WDaO16R2lM4A4tkIl52AnrPf6JXw1
         gT3EjpICXK9lQrDnqMtsHhdKD3i45MO0tlSwTZkOGsLnygeqnS1GEq42hVT5+HlqpNGw
         T+gYf8t0vIU7HSEAEdNBmet5opXalvHQjYcEdfz/km30EDtQQfXPpL8nTAL5/46rMhak
         gMuexpRELw1yz4AqSHcBpII97mOzlQXjdBv9q9uxJg0vY4L2Wkz4mWfTGT41kUyPjWyf
         oCCUVzTVMMLzv8BuVscDTyHO0HMHqetsCPsptCOLxfHbS+xv6PqNZFqqiN1cTF5Ezas/
         RETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=MkGVFZY1XhtlH3EXbDSeWCPiZrbaYk4zwPdOeyiIsNc=;
        b=t7teihyZfsrQjC7Kd12//wFhQa/Fx4WBCyisSiwGa/1qCRMeNWUTk+OLHpECV1Qpqc
         +bONqegMGFygWqite93MJ/YPCvU4wxj4DE+lSXBV8tTidgbK4HiN51+dwE6UZkNC9nR1
         imye/8TESbI5wVmSYeIxwrRz+ZYKA/6jALcYKxVcZ0I2U12WF4GhcO45RVSpD9SiCb5h
         4civ0pgW1/Os09yDUGSh86C1ucyGICm+9Kdas8WyIH3+inUxc9wqemHbtROJOdPjDlNv
         l+V9YVZidmUdagNqiZ8aU8A3eDKWK1KrOdn6Xz3gxCB/zcoaB5fTCJxJLNAUZvtEBZHf
         I/JA==
X-Gm-Message-State: APjAAAUU/ghtLnWd8s+C2dA5RtTfTHCeKHna2QS9V94OasPczZpXNn4L
        lh+ENdMknQT70fF/IClDnhGR+A==
X-Google-Smtp-Source: APXvYqyK+bgytdW+OPwhr0ZBevMVV7NDVd58ezc6owb6wL4UOd2DK/LWci6dPsr3n48XMl5sTrJS0w==
X-Received: by 2002:adf:a38d:: with SMTP id l13mr13613323wrb.187.1559645107190;
        Tue, 04 Jun 2019 03:45:07 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id t140sm2718623wmt.0.2019.06.04.03.45.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 03:45:06 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, kramasub@codeaurora.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 8/8] usb: dwc3: qcom: Improve error handling
Date:   Tue,  4 Jun 2019 11:44:55 +0100
Message-Id: <20190604104455.8877-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604104455.8877-1-lee.jones@linaro.org>
References: <20190604104455.8877-1-lee.jones@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dwc3_qcom_clk_init() is called with of_count_phandle_with_args() as an
argument.  If of_count_phandle_with_args() returns an error, the number
of clocks will be a negative value and will lead to undefined behaviour.

Ensure we check for an error before attempting to blindly use the value.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index f21fdd6cdd1a..633482926497 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -419,6 +419,9 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
 	if (!count || ACPI_HANDLE(dev))
 		return 0;
 
+	if (count < 0)
+		return count;
+
 	qcom->clks = devm_kcalloc(dev, qcom->num_clocks,
 				  sizeof(struct clk *), GFP_KERNEL);
 	if (!qcom->clks)
-- 
2.17.1

