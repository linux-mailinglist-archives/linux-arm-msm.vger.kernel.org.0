Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1645219BB5F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2020 07:36:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725789AbgDBFgs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 01:36:48 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:53598 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729262AbgDBFgl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 01:36:41 -0400
Received: by mail-pj1-f67.google.com with SMTP id l36so1093876pjb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2020 22:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jPuAXHpqrNAT+U03Z2D0D9d6MExECUerQyolxFR+Rtk=;
        b=FLxJvfQS0ysmXpNHESPUDdj7u8d5tYFdiE/P7MB7ZAiuFbqgIiOi0ODzXBe0HK5t5y
         05ZME+MBiIQY5rPFJhn/ankIYTGPQ39BjLn3zNjh/hKIl83Cq5plB/coFF1KyMN5Wv6x
         sDjUTNTxeGnF1C9EwKC5E58eLETX49fVYiRrILohyk8d4PThgmZFwY+iYVcnpbPamiKB
         +VHONI6ttdeP87QsPum9UOXkFBP/QxZOVh1bft6RS92h6kicR1Y7AJsTzXs35vARM8FX
         xhLXxvZT0kQqlH534Yc9tglbmXj6DaWECLZVNh/vc3ALb/ev+KfKHOlcrHYT8uEppfiD
         p2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jPuAXHpqrNAT+U03Z2D0D9d6MExECUerQyolxFR+Rtk=;
        b=hcdQJr3SoO9CGkxZfUC+gRJOjpJLwFDmIr5ct6I5wgDek1X6wlQhSa7UxFH+KPozvp
         jETn82hiXX8ncItba+hp79ZBlrkZNuZpIOvRY65n25Hc7/UtBmlopA7G01jH1H5ZQM5l
         +2svJsedKtryMyeOTHrc0LJRcGp2imdVjaa5XUAPIubDus0Vu5HON16d7oIWte4Fs1sD
         Lc8jvUjZcT8WuMetraUQ9qt4bKf64nEhLYqaNHgvv2aopiIgdMrOaKcuC3o6gLgjpFqY
         dFPA/NgFekuNQ/zFytBT/qrTUJZbhTfojjbVX12K1z4SmQlhdBSvGNSV0xT9yybh3k+k
         RXtA==
X-Gm-Message-State: AGi0PuZI6abfy/ga0T5Tc7IfOuKeAc+rKjx+0XOqjC0/f5Ln5k7oltQV
        AAlJYxUzSQVDD+GgJOyV/wL0
X-Google-Smtp-Source: APiQypLUO9ItCUYvMe/cdxMNd9ZZ/BddDu0GYPMSa91cheBTNWouOMVF2ehqKljSAS/Zgn43sQDi/w==
X-Received: by 2002:a17:902:d705:: with SMTP id w5mr1414399ply.68.1585805800814;
        Wed, 01 Apr 2020 22:36:40 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:29a:a216:d9f7:e98f:311a:69f6])
        by smtp.gmail.com with ESMTPSA id s14sm2684824pgl.4.2020.04.01.22.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 22:36:40 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, davem@davemloft.net
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, clew@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        netdev@vger.kernel.org
Subject: [PATCH v2 3/3] net: qrtr: Do not depend on ARCH_QCOM
Date:   Thu,  2 Apr 2020 11:06:10 +0530
Message-Id: <20200402053610.9345-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200402053610.9345-1-manivannan.sadhasivam@linaro.org>
References: <20200402053610.9345-1-manivannan.sadhasivam@linaro.org>
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

