Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1C73165AF0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 11:00:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728055AbgBTKAh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Feb 2020 05:00:37 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34328 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728022AbgBTKA1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Feb 2020 05:00:27 -0500
Received: by mail-pl1-f193.google.com with SMTP id j7so1373894plt.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2020 02:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=15QkUOyqGz6eomBKIwtq/Fp2YhGFsx/KFWnHxF+6NKE=;
        b=hiuCUmCfLCKyVHPPxzjMhumjyrh6B1A16pg0DojQwPUiI964RCzIfqNv+XihK+bp3V
         TUJPE6MYFQKH2Wv4ZwqZPYy8BpZHZUBU4xcxShBEIgECEBYnfvsDq9ZSC5Qpniy7WgvV
         stZSLcQmVbb0yDumCgAnGFWISB9/pc1GKEX1VUHG0suceqKhXrM31B0NT9cq1lSLP2gw
         y1+g8FDEpwz6tKpq2XlttWsN4p15OVSz+BKidJFBy27N6sqVOdWL3fEDr0qZCvLO25j/
         Cc61Q/6tpVvaVMoreeGMuW39HDaz9tuUipKZb4p26vaGF4XvTqrhxmHqHp983fnor+8x
         1MZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=15QkUOyqGz6eomBKIwtq/Fp2YhGFsx/KFWnHxF+6NKE=;
        b=UkKvtuYPvBvDJl/e4zikI1ZLNC1VMoFLXktgHtUO+hZ9yyC8ProuAVsG4poB17mi3k
         8otYYQ8MO33egyop64KOuDFDklaQyoRvh10zRtzDjnHojtLFV2yUJQ9XhUPY9D8iJZSk
         sVrozTLbBACWo3PAnoBTcSl2lhcMCBfgumgUyEVdZfbLaWekegyogU4sRUmfSk766iRI
         iXQ7uTeBLFN2cTJPACyXmLqsZ0xF2jGhkthxPdyqn4yv4e3cP5Le+k1oplVeVS+Eu8oH
         QeVsa4mgxLRbojN6s2ETVu7l/2tS44a0J/f3hkCAcXw5lw7MAOH+tNBB3CTM5CQHYjbs
         /FAA==
X-Gm-Message-State: APjAAAWFfJvuyr3S7g3xyf6MqYSChg1RZqTLb3dTI7jQKky+5EpePzPM
        mF5mroXpQscK7GoXa/wYapfjMXgeZDXA
X-Google-Smtp-Source: APXvYqwacF6ybkjY5Ij8gFwXOma6aXyq39Ay53DohmoLvDmhDkqUODMNBJth9hqvAnFA5BC1cCbHAg==
X-Received: by 2002:a17:902:ff11:: with SMTP id f17mr29352446plj.273.1582192826397;
        Thu, 20 Feb 2020 02:00:26 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:315:9501:edda:4222:88ae:442f])
        by smtp.gmail.com with ESMTPSA id b3sm2678644pjo.30.2020.02.20.02.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 02:00:25 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, arnd@arndb.de
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Subject: [PATCH v3 15/16] net: qrtr: Do not depend on ARCH_QCOM
Date:   Thu, 20 Feb 2020 15:28:53 +0530
Message-Id: <20200220095854.4804-16-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220095854.4804-1-manivannan.sadhasivam@linaro.org>
References: <20200220095854.4804-1-manivannan.sadhasivam@linaro.org>
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

