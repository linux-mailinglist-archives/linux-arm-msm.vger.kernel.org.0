Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD98D1466A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 12:20:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729370AbgAWLTl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 06:19:41 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36144 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729355AbgAWLTk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 06:19:40 -0500
Received: by mail-pl1-f195.google.com with SMTP id a6so1230738plm.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2020 03:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=15QkUOyqGz6eomBKIwtq/Fp2YhGFsx/KFWnHxF+6NKE=;
        b=RlDi9bN/8bPFgqQgfP/5w0XWTn0g7NWphocLjSNdwU3gk2TR5m/9JJjyX20ie+xfuB
         s/hWZ2kFtCDe1Bf3rMI4ZuOOkQxBn3ATb4RYE+NZlD8HbMJcrDUkYyAzm3XIIKG1FGPw
         bB42RmozNEd8jRo9w8i/Z8ENNegXMJVmSgfjRuZmnjX7/r3POPo59EMv5p0bP4/gPfV9
         pr/Q0QG7CBxOFXOVpKZaKzbNsFWDb9GQ4o0ohmQ1LQakTIbi1c9rA3JLeYUpi9Kyb2Bz
         G+qLMQQDHZkedyH9nwSkcriQ5oSLqk7mqFX/xiXzuBNO+2ectedr4X4S4IdqdA+ItQbX
         Wbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=15QkUOyqGz6eomBKIwtq/Fp2YhGFsx/KFWnHxF+6NKE=;
        b=KirAxeqyWzdXpqyTondXB2yrT5jXgaH+7koU5V42CjJYiS8ha0LZ61YKO2hjC3lJ3a
         ZQq+kZNKNcOU52eSXJeMY57CyLOcgihbdj8JGr3MbT1DCIJv+8qGK3KjeRxnUNxqC+BR
         Sk920ZSZpRZLCR7DCIdDICiqh/HERhRTz4hXApNwgpsEEJEWM8JlmIs/irr+Fv/P6vuT
         78JTOgzrWcB6fFsAkjZ3KD66mkUJgQEbREg/vTZcaRVmKUdqLTTMV3q/kbwU+kT5qRAU
         ACq3tgKfdituy28D76N5KxBMaQ4HTaHwpaVB6Q3QCREzIUHiyoaIFKb0aZbVJNTSKv0d
         3SEg==
X-Gm-Message-State: APjAAAUezvUpeS+gp7KqEykf4mwZNf7XoVn3o0LOqVXoy3Wz3duihe7P
        ynQzEPL1KkclkazP617Ua7uS
X-Google-Smtp-Source: APXvYqzcZRJ2TmhHoxy1Rew245aJeebuTCCNqMgta8RcCA/PQhdOitTg+76KTM3uKTY3O0heA+6vUA==
X-Received: by 2002:a17:902:12d:: with SMTP id 42mr15480441plb.246.1579778379054;
        Thu, 23 Jan 2020 03:19:39 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id y6sm2627559pgc.10.2020.01.23.03.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 03:19:38 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, arnd@arndb.de
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Subject: [PATCH 15/16] net: qrtr: Do not depend on ARCH_QCOM
Date:   Thu, 23 Jan 2020 16:48:35 +0530
Message-Id: <20200123111836.7414-16-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
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

