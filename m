Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA76830740
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2019 05:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbfEaDyn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 May 2019 23:54:43 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:38197 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbfEaDyP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 May 2019 23:54:15 -0400
Received: by mail-it1-f194.google.com with SMTP id i63so8754040ita.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2019 20:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hqFf2+cwBc4XPU/wNoeNiXzq2lmzHpPCTPDaeLdQu4s=;
        b=dwV6lcEWrxc5B6DJHcpq3zyz85EXyb7kFr66i80SndfVrNSU4O6J2BhCuq4xE9YuzG
         QJEmlxKobURV1wOZvw/c6rRePWj08be/9fs9y2H4V4dAqvoWGBzKvPWGy3M/GlkBE0dG
         fB0+1S4FXZaI2IcfQfZRZVtRvdl6d9HBSKFx7wjh0vvlKTQbnW0gnMSsdPc4JZbOEZxZ
         9+ldXNVSP69hgIFuV09GrO8sJw5L3I7P9UL2lk12RFXNAOLaRkF4zItXR5B1Uy4SSQ5S
         2lnj0k2mR9SfKdIkG9tTaENn3hV+GHxRfykjUcndTjGzcKr5Fj37FZl1j9/iwIRDGMNH
         /bvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hqFf2+cwBc4XPU/wNoeNiXzq2lmzHpPCTPDaeLdQu4s=;
        b=sHXQeVsrpBzndzxbm77CGa7WlemK5rQuHxs2v90+cgRvE9XmbtR8aUj1uwcgUq+YzC
         0PVH+kKBJ1p1hpe+EsDmOSLcYJ50WQ8qyHWodABOn/MCor8SiLDAzU2Z4RRj53MUKz6s
         R+9FTz8nqGzneEnykbdnKi+u+an8RCmv+wbkKPn4QNm8xfJm8M4863zYE5QAk/QT4tyR
         ZGY8AGn+LLuhLYf7YWRn+19WAcsBj1u/tQZltBHvx25NFmgrTzlspwETrDjsGinJ8ZUe
         IefLqDTxkVvBM9P8DI2r9bZiVwEtssMbcb/o42VC/u+5Kq2waqrtn7ZThDFn7/Bwmi2z
         tPqQ==
X-Gm-Message-State: APjAAAXX4VslScTGIum+6QJlZJpJuQNDVflCxCsAXXs7Eg1YQrHfa2no
        nSRRfS/2xM4qGT0ND/e8lK73vQ==
X-Google-Smtp-Source: APXvYqwWD8aa4VUIefG8yGQZZRSCg34qIIIGxgQIp1ineTqYUGxgNceXvUOJ1ILtPXFr+A14j81EGw==
X-Received: by 2002:a24:a09:: with SMTP id 9mr5343497itw.146.1559274854371;
        Thu, 30 May 2019 20:54:14 -0700 (PDT)
Received: from localhost.localdomain (c-71-195-29-92.hsd1.mn.comcast.net. [71.195.29.92])
        by smtp.gmail.com with ESMTPSA id q15sm1626947ioi.15.2019.05.30.20.54.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 20:54:13 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, arnd@arndb.de, bjorn.andersson@linaro.org,
        ilias.apalodimas@linaro.org
Cc:     evgreen@chromium.org, benchan@google.com, ejcaruso@google.com,
        cpratapa@codeaurora.org, syadagir@codeaurora.org,
        subashab@codeaurora.org, abhishek.esse@gmail.com,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 14/17] soc: qcom: ipa: support build of IPA code
Date:   Thu, 30 May 2019 22:53:45 -0500
Message-Id: <20190531035348.7194-15-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190531035348.7194-1-elder@linaro.org>
References: <20190531035348.7194-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add build and Kconfig support for the Qualcomm IPA driver.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/Kconfig      |  2 ++
 drivers/net/Makefile     |  1 +
 drivers/net/ipa/Kconfig  | 16 ++++++++++++++++
 drivers/net/ipa/Makefile |  7 +++++++
 4 files changed, 26 insertions(+)
 create mode 100644 drivers/net/ipa/Kconfig
 create mode 100644 drivers/net/ipa/Makefile

diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
index 48e209e55843..d87fe174eb9f 100644
--- a/drivers/net/Kconfig
+++ b/drivers/net/Kconfig
@@ -388,6 +388,8 @@ source "drivers/net/fddi/Kconfig"
 
 source "drivers/net/hippi/Kconfig"
 
+source "drivers/net/ipa/Kconfig"
+
 config NET_SB1000
 	tristate "General Instruments Surfboard 1000"
 	depends on PNP
diff --git a/drivers/net/Makefile b/drivers/net/Makefile
index 0d3ba056cda3..ff8918fe09b0 100644
--- a/drivers/net/Makefile
+++ b/drivers/net/Makefile
@@ -45,6 +45,7 @@ obj-$(CONFIG_ETHERNET) += ethernet/
 obj-$(CONFIG_FDDI) += fddi/
 obj-$(CONFIG_HIPPI) += hippi/
 obj-$(CONFIG_HAMRADIO) += hamradio/
+obj-$(CONFIG_IPA) += ipa/
 obj-$(CONFIG_PLIP) += plip/
 obj-$(CONFIG_PPP) += ppp/
 obj-$(CONFIG_PPP_ASYNC) += ppp/
diff --git a/drivers/net/ipa/Kconfig b/drivers/net/ipa/Kconfig
new file mode 100644
index 000000000000..b1e3f7405992
--- /dev/null
+++ b/drivers/net/ipa/Kconfig
@@ -0,0 +1,16 @@
+config IPA
+	tristate "Qualcomm IPA support"
+	depends on NET
+	select QCOM_QMI_HELPERS
+	select QCOM_MDT_LOADER
+	default n
+	help
+	  Choose Y here to include support for the Qualcomm IP Accelerator
+	  (IPA), a hardware block present in some Qualcomm SoCs.  The IPA
+	  is a programmable protocol processor that is capable of generic
+	  hardware handling of IP packets, including routing, filtering,
+	  and NAT.  Currently the IPA driver supports only basic transport
+	  of network traffic between the AP and modem, on the Qualcomm
+	  SDM845 SoC.
+
+	  If unsure, say N.
diff --git a/drivers/net/ipa/Makefile b/drivers/net/ipa/Makefile
new file mode 100644
index 000000000000..a43039c09a25
--- /dev/null
+++ b/drivers/net/ipa/Makefile
@@ -0,0 +1,7 @@
+obj-$(CONFIG_IPA)	+=	ipa.o
+
+ipa-y			:=	ipa_main.o ipa_clock.o ipa_mem.o \
+				ipa_interrupt.o gsi.o gsi_trans.o \
+				ipa_gsi.o ipa_smp2p.o ipa_uc.o \
+				ipa_endpoint.o ipa_cmd.o ipa_netdev.o \
+				ipa_qmi.o ipa_qmi_msg.o ipa_data-sdm845.o
-- 
2.20.1

