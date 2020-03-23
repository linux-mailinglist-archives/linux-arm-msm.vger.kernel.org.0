Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC73218F4AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2020 13:32:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728299AbgCWMbk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Mar 2020 08:31:40 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33243 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728262AbgCWMbj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Mar 2020 08:31:39 -0400
Received: by mail-pf1-f194.google.com with SMTP id j1so4731287pfe.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2020 05:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rEAkBJxPd4hSHqHeDBCWCT76WtgPmMTyeJUR1ztc3Ws=;
        b=QRYKlwz+3wUdtgT0HtxmgWkUMXKIl6FDmO1CEZkb865YpAP3hnIhmMRAC5Jv7LrWP3
         UqKpz8+kWkeyxuDgqiztAliegXLra6GT/RKM9sJDlP9citChqHDyKeCOucH9TCS19Wze
         dLtH4g7cxy5DNAr5ZR2ja4MoBwadhqEt+Nq1rNLwCp3Ci7rRpw8ZebP0Lc+S2jiPgxMd
         WnoYeQikA8KkBqUJp0L3Wz1QGo86NA16hnMirkv0axfVJ9f5WJjCjvmtm0D3Y7YrlSwR
         Iy3Ej6HA8IWGNoE9K4UIijkqchwpK4oKNL4wEwo8SH581O6BuqAFh3yuww0Vzm3XGw/Z
         Ke9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rEAkBJxPd4hSHqHeDBCWCT76WtgPmMTyeJUR1ztc3Ws=;
        b=q2HcwsYAn/ogNQiist6nZRsDJKp6qYKirwThnbzfpFMxC7nXkYLEj6k7apc8+OqgCD
         QZqmCcX7wqIanm4TQxGS1HJYo+hQsmIOF8awb5Db05VGxzq3Eno29MTSkFRl4XmfrVyM
         kaoSNF5vMmgpRDzQDT9783+fZjczNQJySOmlnoKCwLGv+cclYLlHEexUCYtFpPsmq8oW
         Nek03qDo3D/brX1yJcI3vJSw2JiTW+y3drunptvT01TIahFqbFmbPWvbwwGLtcsZTxfX
         Ce+DkxcyhEVx/YV7VKVI2WNY3RYHQQWeEK1fxiqDBlwwncpvIk/ZMJpf4NuGM27YOXcj
         dzaw==
X-Gm-Message-State: ANhLgQ3IblN4Ln7arYmGxnfPz9Lw1WL5KLIim3td66HVNQhouOuWlc25
        cOF+JETlM6K9qi6C5G8C8yGy
X-Google-Smtp-Source: ADFU+vsdD0ZZ982SutPaxJPmPd5nX7gRp0D+LOtoVjGZjdF/H3fWCAWtZgi/vfuak6vBRIQm6Vbxew==
X-Received: by 2002:aa7:84cc:: with SMTP id x12mr5852695pfn.82.1584966698034;
        Mon, 23 Mar 2020 05:31:38 -0700 (PDT)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id 144sm3590131pgd.29.2020.03.23.05.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 05:31:37 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, davem@davemloft.net
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        netdev@vger.kernel.org
Subject: [PATCH v2 7/7] net: qrtr: Do not depend on ARCH_QCOM
Date:   Mon, 23 Mar 2020 18:01:02 +0530
Message-Id: <20200323123102.13992-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200323123102.13992-1-manivannan.sadhasivam@linaro.org>
References: <20200323123102.13992-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPC Router protocol is also used by external modems for exchanging the QMI
messages. Hence, it doesn't always depend on Qualcomm platforms. One such
instance is the QCA6390 modem connected to x86 machine.

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

