Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C16A71B9929
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2020 09:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbgD0H7E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Apr 2020 03:59:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbgD0H7D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Apr 2020 03:59:03 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C41A8C061A0F
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2020 00:59:03 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id d184so8631372pfd.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2020 00:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jPuAXHpqrNAT+U03Z2D0D9d6MExECUerQyolxFR+Rtk=;
        b=j1MoGpGODY0G+y0YAjbilr/Dm5aQfXd9MCiY/FcdZcdVBByNPe2LcKMDjoZJQdqpJC
         eEodDfBogAmd+rBU/dgf3nJ5zdJrMNuTJqhBtS/iSgl4HpvmMJzFaQO4rB71uw+HMlA4
         uqSWAKRcw0tNlQezUH2GxNshYDP1eORsMQgJFQoznbI54J+owrXIE3h3wxvfxFL03l+o
         vb832Zd/4KmQdiSf8i9drvrBK2/4dA1yTi6T6oMOuvxvlwIbmr/whiz1BBs9VfuHT9fW
         jBGBUJ4aRvv+AS1iu6e4rxDRNFuIcAz58C746IMS8TRtDLRbt2D3Ta8b+VuPbVZS6LDT
         DKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jPuAXHpqrNAT+U03Z2D0D9d6MExECUerQyolxFR+Rtk=;
        b=RVhpvNEWtH/cBnfOBjbzaEZBkkWxfdvWeoYrFivAKcnErIdbVVVuG6FRBhttSe+jRj
         n1LcoS04r8xZh0alaN+zhAawoui8MRY3J29Du5MlHuBK2rpgeD3f1QHYe6IrkV2sgZ+7
         8uTr7uLGvhh6z48w5XG4jODDGndklFhtWJypgtgK7a983iL8qex8JhyrK4axNrq1KdVg
         Cp/Tx3/IM4rWTSMzWyI6+csF2o7+rGxkGWArjyXFBdWBOWexMpqlH1xkIaBLH4TY6ieD
         TljVSkeL+qLA2PPEgzy6K7swOsmoVDmgqho13YeU6+aTzLU7bewgwU86gyZXIleYXKx4
         a+0g==
X-Gm-Message-State: AGi0PubS9t1YbmTAEMhfaExI9CNlVW1vS79bzqrS43rILkNuGu5S4LS6
        ca5Sesp6Aj4pKozYKcwQBZ8L
X-Google-Smtp-Source: APiQypLZpxltxsTka+7sS/LyifM/nE79AgNzoR4gAcDIxipkFRxh/hIm6cR1gUqyoxtd8NkbZ/xIjQ==
X-Received: by 2002:a63:ec0b:: with SMTP id j11mr21238091pgh.376.1587974343260;
        Mon, 27 Apr 2020 00:59:03 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:996:8534:f925:aed4:6e41:e1dd])
        by smtp.gmail.com with ESMTPSA id a12sm11621190pfr.28.2020.04.27.00.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 00:59:02 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, davem@davemloft.net
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, clew@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        netdev@vger.kernel.org
Subject: [PATCH v3 3/3] net: qrtr: Do not depend on ARCH_QCOM
Date:   Mon, 27 Apr 2020 13:28:29 +0530
Message-Id: <20200427075829.9304-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200427075829.9304-1-manivannan.sadhasivam@linaro.org>
References: <20200427075829.9304-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPC Router protocol is also used by external modems for exchanging the QMI
messages. Hence, it doesn't always depend on Qualcomm platforms. One such
instance is the QCA6390 WLAN device connected to x86 machine.

Cc: "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
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

