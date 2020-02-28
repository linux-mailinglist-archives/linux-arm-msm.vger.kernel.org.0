Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A59E174238
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2020 23:43:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727320AbgB1Wmr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Feb 2020 17:42:47 -0500
Received: from mail-yw1-f68.google.com ([209.85.161.68]:44471 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727198AbgB1Wmo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Feb 2020 17:42:44 -0500
Received: by mail-yw1-f68.google.com with SMTP id t141so4896308ywc.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2020 14:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rBNZ2vXyhxdKjjPVhgfvGeeO+0/SInHI1a05bF63DNs=;
        b=ov0h+3Mevwwb7JRSBbaI50cmb7TS6mbPJ85QLtqhRoY2Mft7RJCqE1A4usLDBEQfyq
         SxAEj3TBAZAtIpkm6hvcucBiWKG1yvNMVWw7Tndoebn1PSGqRUQIvj/gocZHd30nrMY2
         3sFmrT/5Z+WkrnzUVbRQ6A/YCQgFco6VeahzBTAUOY5Oq5ZBee02REQpiF1DhZykiZvg
         10vjo/ZUBgSgkds/weBbcpmiEVGV/6wFXiG3cnAScX17dXX4qbsD2KTerTyMpTeTfq3d
         1tzwWXA6afl03yCz7+nEB//eOnXi+agCBFc7fEX8vdmt2uT3CSAWVGxGFa8BOHow8vP2
         PXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rBNZ2vXyhxdKjjPVhgfvGeeO+0/SInHI1a05bF63DNs=;
        b=NuSuBHv3oNH82tMqSEHeTgx3KQAYbHf7ZgmU5MK+y+V8UKTFS6JCqF8Yyv5R4lmTWt
         fCvD9r63YlNmRtvlqivKFy3D22YVfCutN7hiRaeLxNoMRQSltQxqGWubpcFf6oTIMxP9
         CJhbV9zYNqgZi3WO5L4pW0nPY6pTicO2PdN+vVOli11Mb4QqbkbpI3jqcs3vo9MWEr6A
         rtdPOonlmlEBOnn/1dKVuVD25EzYa5ZCZAlIDy6h8htvS7JjmTLxtBqabR4A0T4+0aWb
         fZIl2C3faE3RkeZsfjb+02jlgTFZAlUS3MmdLHLxiyW71wq2EaEcB+/zk+VAIp5jWlRF
         5+5g==
X-Gm-Message-State: APjAAAVRYDlIAcnFZjYhZ97JmEDinx61T/87cPTY2BJgL8SvUBplEKkC
        XcHzO3WP9co4Rlm+iCYiHNNGnxXyUWs=
X-Google-Smtp-Source: APXvYqzCnkaSsbmC+fcQRH5hKJw0WVbqzYQqbj5IN6MRfe4oJ4isWav3JGkTyME63rxVAVn0nktf4g==
X-Received: by 2002:a81:27cc:: with SMTP id n195mr6712318ywn.491.1582929763518;
        Fri, 28 Feb 2020 14:42:43 -0800 (PST)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id d188sm4637830ywe.50.2020.02.28.14.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 14:42:43 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>, David Miller <davem@davemloft.net>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Dan Williams <dcbw@redhat.com>,
        Evan Green <evgreen@google.com>,
        Eric Caruso <ejcaruso@google.com>,
        Susheel Yadav Yadagiri <syadagir@codeaurora.org>,
        Chaitanya Pratapa <cpratapa@codeaurora.org>,
        Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 16/17] MAINTAINERS: add entry for the Qualcomm IPA driver
Date:   Fri, 28 Feb 2020 16:42:03 -0600
Message-Id: <20200228224204.17746-17-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228224204.17746-1-elder@linaro.org>
References: <20200228224204.17746-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add an entry in the MAINTAINERS file for the Qualcomm IPA driver

Signed-off-by: Alex Elder <elder@linaro.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fcd79fc38928..49a680b0c945 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13664,6 +13664,12 @@ L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
 F:	sound/soc/qcom/
 
+QCOM IPA DRIVER
+M:	Alex Elder <elder@kernel.org>
+L:	netdev@vger.kernel.org
+S:	Supported
+F:	drivers/net/ipa/
+
 QEMU MACHINE EMULATOR AND VIRTUALIZER SUPPORT
 M:	Gabriel Somlo <somlo@cmu.edu>
 M:	"Michael S. Tsirkin" <mst@redhat.com>
-- 
2.20.1

