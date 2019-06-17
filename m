Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D37C048307
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 14:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbfFQMvP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 08:51:15 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50278 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727916AbfFQMvO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 08:51:14 -0400
Received: by mail-wm1-f66.google.com with SMTP id c66so9150623wmf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2019 05:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Yh8KWN22mWMhTl8rcvEzBYBWJNOHxR/ZVbPRRDE/D+g=;
        b=q/VQwMJ7CaCCS2TpiY40tB9SR/0BGYUD9cg5QmvyZlgN0oSe9DGo/a+8W3tFnih/es
         f/TGbxw2+NhrkghexAa4OElVuqj6adr3zChACFmOr55PBTOD/M1NIEdtp5/IEy9qU/kC
         fX2Qrs7PhDGqUidNClIWZ04Lwg4RW4iXSfsUN/mQ3Fz6ReP9i0AdV914a9optyVwxJ9W
         Xy6Y1mSeoVn1NeqGDQGLUT+gzK0PwP6QYlI5aEiS1G795pxPRN55vGKPX1Kr7l+p8xwx
         9xxVx3Oo0mrnM/HpISh/Sd3kMq4WHV1BoTnn1nr+LgaU5NktIDT5p1PPAhig5lYx1wqZ
         dRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Yh8KWN22mWMhTl8rcvEzBYBWJNOHxR/ZVbPRRDE/D+g=;
        b=mqr/jhM9XGd+l6Cun+utMIe4yZuhUP7g8AcOezx80qOR8fqsJav8Bifbsk21upsPdn
         AxOC68n8v/iECoAK/dVJJutgl26MW1IWK7sBeQysT9LaOnlUtN0dMQ+jwYp6/Onxdw0b
         jTV0wJ0sq2Ajrx0kW597j8VO4vdbNF2hZtSJkNKnOGQ7gcsFtAH5gakUwSIwqKsELPvN
         Bb7hsoXDufZa08DcMiRNa2XAMdNVkBk7TKwHTJiqupgrvJASKk7hLNfyeeBFTP/oaEhl
         CPiu9MsozESfvulG7gVoajogRK603c46x0NvPVEn0tfzX0i3ReotzXnddF3B8dr96z9F
         3AmA==
X-Gm-Message-State: APjAAAUR4tRjRWY8E1BiD268gXAGp24syo79dvELFyAQ6/3bN7M+d48K
        +c/li0i9RDfb6Cg4zN1nSTiGUA==
X-Google-Smtp-Source: APXvYqyQ7uC0yXE6+rCbtoO1nXI3vuubKGuLiHCQLeIEVsa7DW/HvoU6icIxjcUwUpeyeJFFHJ6L2g==
X-Received: by 2002:a1c:63c4:: with SMTP id x187mr17953607wmb.4.1560775872645;
        Mon, 17 Jun 2019 05:51:12 -0700 (PDT)
Received: from dell.watershed.co.uk ([2.27.35.243])
        by smtp.gmail.com with ESMTPSA id o11sm10477852wmh.37.2019.06.17.05.51.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 05:51:12 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, ard.biesheuvel@linaro.org,
        jlhugo@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, felipe.balbi@linux.intel.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: [RESEND v4 4/4] usb: dwc3: qcom: Improve error handling
Date:   Mon, 17 Jun 2019 13:51:05 +0100
Message-Id: <20190617125105.6186-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190617125105.6186-1-lee.jones@linaro.org>
References: <20190617125105.6186-1-lee.jones@linaro.org>
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
index 2d050303d564..c59e9d8e8609 100644
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

