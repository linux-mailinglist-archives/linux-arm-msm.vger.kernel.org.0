Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A135919A590
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2020 08:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731941AbgDAGp1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Apr 2020 02:45:27 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38218 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731927AbgDAGp0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Apr 2020 02:45:26 -0400
Received: by mail-pl1-f196.google.com with SMTP id w3so9221766plz.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2020 23:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jPuAXHpqrNAT+U03Z2D0D9d6MExECUerQyolxFR+Rtk=;
        b=NryMhRQi83DHyhY53J8kDk2KrCvPLCJRrERSgzyG5dESc4FOYkPwrst1NysX1FpLH/
         6QgUmWMUIFUXV9aG5rmb6gJAnCXCKYpbAV2clWmEBYJy1tGTUfJ+dIz87wshIUP57gcJ
         ZV5ODxkqIxqFE/4S2VXy0KCL0xxqOlLf+kiLZvfF7DZCUctKqojFFW8hrabNlssjcI3J
         70BozhQmBsvgBeTScRuFYNSIvLg3u3+v2lg70ObzQrHQtWTuAYZ44ZhpAA0M+ABNdTBx
         u13c5GsQcyycncDcexDFJa/C/CjTA3bo6fGgtfdAToojfQPFvMkbuZMLtJ+R6tKuN8sd
         xedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jPuAXHpqrNAT+U03Z2D0D9d6MExECUerQyolxFR+Rtk=;
        b=DPwrXn4LMGKgDl/SrKJn4ZgHanHWyqjmlcgwsXjblv7Rl89cUH0YG1Sei/cIhZfRQf
         q+eWm+0grd3qbm9ZZxSIepnoSG4ENuKnWPlW1q9QU6CIIQ6Lk9mBDPoJULNXGR0IYn3F
         kc37RW/w/cj1wL85sHZvZdblPxAwHZP80JLpmGBP6hz0/wq2ChzzsHw+HhR82Sb6YZnd
         OVz0zTTLPI/rAkf9gun/4Za9wfxMhuWGNLrtLMHM2zAfCJwhx84lecbEnpOvohbc697u
         sZhy91Mk38NB2dh+amJFqCNpTC9DHf76SfoXYUmcUl8D/WPjNNnxclw/70+hTR8768TI
         CTSw==
X-Gm-Message-State: AGi0PuYDM2SOWlRzZX0jgnoTI4qF1eh7jgGg5X8a4Zjy8326kfJMl4E1
        NNjNXLIVeRvZ7NGsgiSi7PSY
X-Google-Smtp-Source: APiQypK7hpQFunxEgiKwnKuQ60lo30Q5kQwMBmllBYF2QoQe8BtBSeNBhv2aiTno3NZMdWH/3D5IAw==
X-Received: by 2002:a17:902:8305:: with SMTP id bd5mr9547761plb.114.1585723524162;
        Tue, 31 Mar 2020 23:45:24 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:648c:592d:60f5:6f58:e46:db78])
        by smtp.gmail.com with ESMTPSA id w24sm831962pjn.14.2020.03.31.23.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 23:45:23 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, davem@davemloft.net
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        netdev@vger.kernel.org
Subject: [PATCH 3/3] net: qrtr: Do not depend on ARCH_QCOM
Date:   Wed,  1 Apr 2020 12:14:35 +0530
Message-Id: <20200401064435.12676-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200401064435.12676-1-manivannan.sadhasivam@linaro.org>
References: <20200401064435.12676-1-manivannan.sadhasivam@linaro.org>
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

