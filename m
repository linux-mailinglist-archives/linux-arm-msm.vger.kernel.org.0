Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A1D335B7A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2019 13:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727582AbfFELnY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jun 2019 07:43:24 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37094 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727579AbfFELnQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jun 2019 07:43:16 -0400
Received: by mail-wm1-f65.google.com with SMTP id 22so1938000wmg.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2019 04:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FalRLEADzMPtGyW8NIPAA0F5olxzxXGnPVoGFb+myak=;
        b=QKMO16HzOa6yOl0TtOpHhtaz2SlgdqhYZJyTw38c30d4UIeX/UDQnVA2Q9d0ipicdD
         Emx8H2oabCuuVPEsxhBlwmfa+rkssHoxoqRU3YK8BQlbomqW5kzJbpEytzeiEhZgRzTj
         UuIbaCfiENidI6XCj4Q+ItiQk6OwNI+MlfHUM4Ee1wn3nAm4MbEgnWVI2SXMhsKUpm74
         uQFspWBHEtn7jRgazZmuN+pcHm22NJx+aTrImCUgcPsYActEEks62mCVCDgBdhq4xHqV
         aLwalHia+TPEdWi3LiXfCNf8Dzv+nwpo4e0Tsvy22vppNbw+xuPuEpZs6dyJHOhTwxZg
         pP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FalRLEADzMPtGyW8NIPAA0F5olxzxXGnPVoGFb+myak=;
        b=Vh7oGYZ+3FJPTVx0kaLAPke46WyWo/kj8wIHJ9gkrATYHxkYXsVaMAqEe93l7+GpU9
         f6hmJCaFlvcLikHv8hscAmDodip3bBZbRPTSujR6CO+lo5gt5/IibwrWxmYV9fHfa31i
         3mlDbEFX9OLqL6GFmfCg4FjLn28dyDC3M8r6+a3+3RYyXHRjpvfZR1nKwuCjFdFYe5cV
         gMmpL34b1jnJetwq2fZKJuciVcCJLN6Zwao/vjGLYhGnhaLCLZO5ZeplFzrA52bXD2Lu
         MSVTHQnB8uMW4UZ7R6K75Obr/dDMjCOnxcm5dugms1X7+MKogw6jZcFltyQ+akrk3cVJ
         mm0Q==
X-Gm-Message-State: APjAAAXTCfVWPh3KsLLyjKOhYiWlZLDwu8PdJtBsTFgeDgkBP7AdYsAp
        Bz2RZeTdkkakgbhxlDDjGb0JZQ==
X-Google-Smtp-Source: APXvYqwEFvsfbNVarbCKn/CaPPWWGkVmIUJ55Mc+kqvQbIA3b9FWJAmPfuM+8mkgIFBS0YNQs5g27A==
X-Received: by 2002:a7b:cb06:: with SMTP id u6mr10100159wmj.170.1559734994798;
        Wed, 05 Jun 2019 04:43:14 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id 34sm27718740wre.32.2019.06.05.04.43.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 04:43:14 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, andy.gross@linaro.org,
        david.brown@linaro.org, wsa+renesas@sang-engineering.com,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 8/8] usb: dwc3: qcom: Improve error handling
Date:   Wed,  5 Jun 2019 12:43:02 +0100
Message-Id: <20190605114302.22509-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190605114302.22509-1-lee.jones@linaro.org>
References: <20190605114302.22509-1-lee.jones@linaro.org>
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

