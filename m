Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD7817B58B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2020 05:31:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727416AbgCFE3J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 23:29:09 -0500
Received: from mail-yw1-f67.google.com ([209.85.161.67]:38573 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727408AbgCFE3I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 23:29:08 -0500
Received: by mail-yw1-f67.google.com with SMTP id 10so1096460ywv.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2020 20:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yRfDYcfz4PClGgSHNiGQSObIaHKPYjVoLJsVmUvy8Lo=;
        b=OXDXHwpEpqm9D6EcBAAjatlE+DkIqArtmlE79u330SGvIljyyQS5qNc8upKinTIUFS
         2rVoFnb4MEcaWdeNW4ZLBTNsSq4JgxMVEwAAFjzXvkl31MSvgkWqP+ZGX1CyrF+flEY3
         b7hSc7mD3NO11fAQX5vLYMveEjpzSvfcyULcFMrpq+ZL0oB7vA9bFxwQeobDEZ8P1WUz
         sWq99rV4yu0jDyj8aWwi3hCgBT6QrkXNhljWXdm+57lPXotGyvyecDybaMHut2cUCoYm
         ksiCCYCTqPFmR0IGa5hOny86DRJUr0yOif35Wc1WpAufYd5NlFH7UeLFEvyEMDax3aYw
         GTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yRfDYcfz4PClGgSHNiGQSObIaHKPYjVoLJsVmUvy8Lo=;
        b=gWznE3DFK9npGB4kZjHxtghDUkk8GBBCK2vqKEfkYTeVnwsFzqjmJCMCe8G5HJkjKn
         SoRPph/GyDtJcisnGaXnL1buoxXKf68M9NXGaF8yQCOF1vbemLxOK65RudkMh5Djz24k
         lyuz1KqanmDAI92+yxlYzml8+dKx5p7wSFmDZoP91Qazc58V8b307dgiJN+gCWEe623E
         opoYIS8r0p8Ef7LtwmWH7uy7xxEiAY/e6011G6z2+JcgimRKdKRcwjtpHxoYgLch/YPc
         hM9fN1mqBlJka3OlXEf4Hu4nqvxoNVmcA3LdsT3D2uxAVtRfBwT0p9/sPheqtLTM3fij
         g18Q==
X-Gm-Message-State: ANhLgQ0A7SENYznJEVZ+lMuRhJafzGgQhuFPBIHDRYwP0aLzwOzGnLfl
        cjrL5o6DUelkOeVy6xPeVHOfTA==
X-Google-Smtp-Source: ADFU+vtbD6s3KdGkoHIR3Jf3W+cODKnwpaKznF0IhVNkYrhsjL5c3tCJAgWOSqj4enQpmdrmxj8CdA==
X-Received: by 2002:a81:6c06:: with SMTP id h6mr2166065ywc.302.1583468947687;
        Thu, 05 Mar 2020 20:29:07 -0800 (PST)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id x2sm12581836ywa.32.2020.03.05.20.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 20:29:07 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     David Miller <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>
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
Subject: [PATCH v2 16/17] MAINTAINERS: add entry for the Qualcomm IPA driver
Date:   Thu,  5 Mar 2020 22:28:30 -0600
Message-Id: <20200306042831.17827-17-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200306042831.17827-1-elder@linaro.org>
References: <20200306042831.17827-1-elder@linaro.org>
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
index 2ec6a539fa42..e8666f980a21 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13662,6 +13662,12 @@ L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
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

