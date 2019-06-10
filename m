Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D79D13B0E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2019 10:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388020AbfFJIm0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jun 2019 04:42:26 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:56055 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388566AbfFJImZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jun 2019 04:42:25 -0400
Received: by mail-wm1-f65.google.com with SMTP id a15so7607322wmj.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2019 01:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FalRLEADzMPtGyW8NIPAA0F5olxzxXGnPVoGFb+myak=;
        b=ErpuCgIKx7tdIhXc0Vgq27YYh5IdzYS8ZROzqkhZo992Lvnn19vfhbIqZzxfQ10161
         q/yb5S3UOlu7jVewR6gPOHtopPzH2mIm47P8H5DIDXJkkAvu/fVLeYL+XDHodIfbmI/Q
         CKa9e4AABXjZuSQiUwSxAL/oBnskNHq1jEInWN4Q5Tp+sQdhRKsiH2TxkMt482GTBNR7
         aY1rlYW3/QXDuFLndlbV2tpu9/XuFDuowc7j5gTlPoBAZBoUbY32p3JHHxZM6+39iUMi
         I88QsPzhpoQOgqfRr4ELN1VJv09S0GcBFZHzKYKYqObfTb0uzFEHbnk2tmqKPOZqSUBm
         gHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FalRLEADzMPtGyW8NIPAA0F5olxzxXGnPVoGFb+myak=;
        b=XFvR04GkbH+kN3vyDowEIp0fXOW3tfBN7pxhJOKLIcCVyyeV3mh2xgqzVz8lOYm45s
         DutkstnlopmTe5yLuq7uSuMTAN6W1WU6JV63lK+Jdv9NeixSVZsJO0q3gkbFVuDW19uI
         0SPcyE1Y+MoZb+Wx8P6/2yAK+iblmVLsteopXQaUyZjgK//faikAKdIsBKYFZPrILXfv
         7BOLhjDa0ZbiPuTDE4Q0msjMsAF5Xecf8n/dIE3r8ET+0gc10syq3KxujYj3uwaGlaIq
         DuY48nOeCNVER/tkr7PA9Kd+EhdRU2qDB91Ns8RPM/XD4JVHZjMsizUJORgBnV9atHvZ
         h1yg==
X-Gm-Message-State: APjAAAUmKNReinG0lqCLRxNEh00oP5MH5AMgB2K2H0W91umsGl3MNVml
        ojZChsB6f0eeRWmvK+Y8gVkFsA==
X-Google-Smtp-Source: APXvYqyC2APpf/zAbitrU/BjHOuyVW/f2vbj2/AUhh+FVA31orPg+ghJwVZnl4+ZvUlYkGglrWpA1w==
X-Received: by 2002:a1c:35c9:: with SMTP id c192mr12941297wma.147.1560156143556;
        Mon, 10 Jun 2019 01:42:23 -0700 (PDT)
Received: from localhost.localdomain ([2.31.167.229])
        by smtp.gmail.com with ESMTPSA id a125sm9929670wmf.42.2019.06.10.01.42.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 01:42:23 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, andy.gross@linaro.org,
        david.brown@linaro.org, wsa+renesas@sang-engineering.com,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        ard.biesheuvel@linaro.org, jlhugo@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v3 8/8] usb: dwc3: qcom: Improve error handling
Date:   Mon, 10 Jun 2019 09:42:13 +0100
Message-Id: <20190610084213.1052-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190610084213.1052-1-lee.jones@linaro.org>
References: <20190610084213.1052-1-lee.jones@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dwc3_qcom_clk_init() is called with of_count_phandle_with_args() as an
argument.  If of_count_phandle_with_args() returns an error, the number
of clocks will be a negative value and will lead to undefined behaviour.

Ensure we check for an error before attempting to blindly use the value.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 55ba04254e38..e4dac82abd7d 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -409,6 +409,9 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
 	if (!np || !count)
 		return 0;
 
+	if (count < 0)
+		return count;
+
 	qcom->num_clocks = count;
 
 	qcom->clks = devm_kcalloc(dev, qcom->num_clocks,
-- 
2.17.1

