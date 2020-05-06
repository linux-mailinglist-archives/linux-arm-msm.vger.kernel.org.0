Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 829F71C671A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2020 06:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgEFEuv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 May 2020 00:50:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726885AbgEFEuv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 May 2020 00:50:51 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9C20C061A41
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2020 21:50:49 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x15so413929pfa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2020 21:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FSudHAT4wzxoYvh1XMNs5f+xHdE9nw3XTPAzmG768CM=;
        b=U3aDzcawg82HoyJF4XsjEECEGMvShr3jwEb08q/y3Gp5KJ+A3SFFYbESzXQpGxuCsd
         zACdWKMqVeq0+JZChcq/Dedbf8ZWMoE0WJucb2veZ59NC8vm1DJH2xTm0/Ua6ewnL/1f
         rU3Ur6HaT4HXlf/+xuubUBeWjsOGpYKr3JjLVJZ9419XaxgVNACzR6YpAXP2ZcreWRYT
         6jpduQWONW5u40Rkh+SLKyLnRXEIyxom2Wq7OAVnyUpmDk3TYRx1Py8ZacO5QVW/O/DB
         9iSGlaZthKfyUGXTH+4wCIpTPZd8MunSTBr45HNfxwdI+IeGPklbqUO8K+JU3UZpGoEs
         SkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FSudHAT4wzxoYvh1XMNs5f+xHdE9nw3XTPAzmG768CM=;
        b=n4jPOKuWlpb6W1bD/LEcAKa76XJCZCyGs8dVjVSdle/jSOXRtJksmj4Nn1HmPYpgSr
         0RlREXqZiW//glWyoxLzRTJZ+EwVKQnWI5rgBVrDjGlOYXRvqXdyTSZX4qE/xGcWsWzI
         Qwau1VJEWA72V01dp0KR3DBTKHcQW4AmvpgQYzUylDJ5PvzF84/Vymzms2p/POUxDYfh
         L8mx9nF7PEBgRG1l/zG7s/OvfLqdgo0zreHX35qtzsMaUELcz7MlrmkUnIXemg4eSUJ6
         RBmLRe5JJ9KOwd4mVnuRALLsvAV7QUhL8CIYLLz7NS2PP4SvDdCbhFKypWejFNWrSphP
         h1Dg==
X-Gm-Message-State: AGi0PuYsFZla794PJ+WwM5HYX+jbwlLj6A9tqjN2aFQanNKQ4rSB8XL6
        WP9/ipDcB5Yf7fyjNplEbRJN
X-Google-Smtp-Source: APiQypLjtuvE/fbjYHCJaAnW9hNPEbhOvT1KeTnwHy+YbHtcJlY6KdWyWjT2sssutPY0psBUFA480Q==
X-Received: by 2002:a65:5947:: with SMTP id g7mr5550370pgu.258.1588740649191;
        Tue, 05 May 2020 21:50:49 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6e88:ac9a:a18c:3139:9aa9:bb73])
        by smtp.gmail.com with ESMTPSA id n69sm3491840pjc.8.2020.05.05.21.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 21:50:48 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     davem@davemloft.net
Cc:     kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, clew@codeaurora.org,
        gregkh@linuxfoundation.org, netdev@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/2] net: qrtr: Do not depend on ARCH_QCOM
Date:   Wed,  6 May 2020 10:20:15 +0530
Message-Id: <20200506045015.13421-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200506045015.13421-1-manivannan.sadhasivam@linaro.org>
References: <20200506045015.13421-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPC Router protocol is also used by external modems for exchanging the QMI
messages. Hence, it doesn't always depend on Qualcomm platforms. One such
instance is the QCA6390 WLAN device connected to x86 machine.

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

