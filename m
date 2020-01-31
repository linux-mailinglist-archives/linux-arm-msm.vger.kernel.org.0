Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81D1B14EDF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 14:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729130AbgAaNvN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 08:51:13 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40079 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729109AbgAaNvM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 08:51:12 -0500
Received: by mail-pf1-f194.google.com with SMTP id q8so3361148pfh.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2020 05:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=15QkUOyqGz6eomBKIwtq/Fp2YhGFsx/KFWnHxF+6NKE=;
        b=ISgFXlgbSjoaNQdlXcasL8b7XByDfc2AgsqgVSdZscktiau910QBbo7inAVBo0gpH6
         hgQcwSRB8nJx4vl7UdCPHWcrSOK0az2vUIp807fa2D4Drx110mvniQ3kPT62wagO0VwM
         ECbHvNNr1bPVdYq2898XmfoS4gPUOlY/fm9BtKCcskVxNU2bfrlORcz6QHo9McOLhNmU
         miqveSFc9YUdf0bthSQAWi29alC7KkSg+UEZhU5LBaP/XHlFm+N6rGGeOefv6oGUwmKi
         31Q+cGqLIFMWzIV+xo3V3ETbkbTjFNCfcVBZ32LWWr4iz68oyxaG7PFJo3eI6DCgMbT2
         u/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=15QkUOyqGz6eomBKIwtq/Fp2YhGFsx/KFWnHxF+6NKE=;
        b=qFoPJOq/roJ6TELMWU7i+GfAj9NWrC2LzVXisALlYSpz6PQaQnFE+x17/2eyz2DHTz
         mkFc1ePs+ymmXy5gzc42pYQIy2DoMqdP/3n0s5Z8mdO4oU7NnVykV0srGTPkBHRGWK29
         1F2yuok0lE0aS2DMXTDyvPbaXQaRPQsXnOp4RC2bG8VlLzXEEywR/adSPLaqQ1MWw6r0
         nlT183sekIiUmGp+70GVRGjeLF5yLNyXWqUJ0B1IvH1sqtiDFn5a1GQOil6QZWdJA9z9
         TGFgrsGOpLjJL+tKRfGzL30O/uWNMdd8Gg46eC6qMB2dtHiPpd+hRNsfmyppXbrrNW7H
         WXMg==
X-Gm-Message-State: APjAAAWyTaglta7bwaYCjQqNKLFLr7WUbNVrXcLMVSLE08kc5jIU0BIl
        /lw2InWR4EEsGIoTkdvYqYZo
X-Google-Smtp-Source: APXvYqyrGyPU05Wk2/bA7v9oUPmg8+u11LxeDi0ZcVAzt4ckjpjF5CejAxqC29e1S4cfs/XFdrD7SQ==
X-Received: by 2002:a63:dc4f:: with SMTP id f15mr9598293pgj.300.1580478672218;
        Fri, 31 Jan 2020 05:51:12 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id p3sm10625632pfg.184.2020.01.31.05.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 05:51:11 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, arnd@arndb.de
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Subject: [PATCH v2 15/16] net: qrtr: Do not depend on ARCH_QCOM
Date:   Fri, 31 Jan 2020 19:20:08 +0530
Message-Id: <20200131135009.31477-16-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
References: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPC Router protocol is also used by external modems for exchanging the QMI
messages. Hence, it doesn't always depend on Qualcomm platforms. As a side
effect of removing the ARCH_QCOM dependency, it is going to miss the
COMPILE_TEST build coverage.

Cc: "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 net/qrtr/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/qrtr/Kconfig b/net/qrtr/Kconfig
index 8eb876471564..f362ca316015 100644
--- a/net/qrtr/Kconfig
+++ b/net/qrtr/Kconfig
@@ -4,7 +4,6 @@
 
 config QRTR
 	tristate "Qualcomm IPC Router support"
-	depends on ARCH_QCOM || COMPILE_TEST
 	---help---
 	  Say Y if you intend to use Qualcomm IPC router protocol.  The
 	  protocol is used to communicate with services provided by other
-- 
2.17.1

