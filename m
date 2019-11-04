Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90084ED8B9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2019 06:50:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727320AbfKDFuk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 00:50:40 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38529 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbfKDFuk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 00:50:40 -0500
Received: by mail-pg1-f194.google.com with SMTP id j30so7055586pgn.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Nov 2019 21:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A6V4Ng2X5iyfEGtux8sUaqDYyz8AcDkQfQqSibvlYIc=;
        b=TCO4pLysvBOoL8EIC4plxLj8gT2iLvKmoR4+tiO8BnE81v1EhxFr72ndqebRTVeKT0
         1hOkd7EFETBgmGNMOJfJTXd5Ws6/XohdXNjXyHbSfBfJrtpeN5MQ58VPNTCnLVkIjLx0
         mCGjtqphAqjJzKN95Lhx32+FViP5JxkNG4ref0lL2bTNJS0xhVbJWqQRnwc8DNrc9JMR
         r35QrfQh9N11siawGdeiU6SeU2WJjwMl3C263KINGx6x0jbqY3BrhaH++2Tr+uX9mqh8
         EQFnLGU8+d1EtKujUUVdbwzt6sEikEzEvBb8aTpK3AfjAAnW4agbmcoEXjPc42Y2Hrch
         xCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A6V4Ng2X5iyfEGtux8sUaqDYyz8AcDkQfQqSibvlYIc=;
        b=tr0Qh9y41D4LhcXPHDskrcXGZCkxj4jR+mrPZNg3PkeFvMdDu1Z7JsmqT5XLsk+3Dy
         rtgedrbZVqsCz93+OIyhvN3TskvLqhzA0Ph9kyAOkAMjREGMv0NNTv7jJ8umefxKs44H
         RdociUuW8NfurYHzpYLo9XNdefdbEZi9/OZMHQjymmq1dTScJCYl7xkULLpUNp9ACrBQ
         lCWyNm3PElh8LojVc0sskZxA6zIGRI+7/d0US4TKCYkZge2wbBJdVM3EwPCjUT4E1vOC
         /pC4mUCDkA+nJZ2ywr0fLvcxU6i8KR+rIdri5bAlIfQTHEfuv+QXrBUdpQDRhV2CsxYg
         JJqg==
X-Gm-Message-State: APjAAAW3kmeZo8hWFsRlgHpNteJaS8qUvRJjRD4AWilbeWzDoCTfKdqR
        U5O8C0c/O8KB5jHlxygw4pEQ405fHxg=
X-Google-Smtp-Source: APXvYqxDddi16LlOqgfrQOBwBUsg/2SGpxXR7dY9XrhzQUmNAPSg6R/Gygx3anF1R6C85nbSpn6a7g==
X-Received: by 2002:a17:90a:ba17:: with SMTP id s23mr24849230pjr.78.1572846639768;
        Sun, 03 Nov 2019 21:50:39 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b82sm14107769pfb.33.2019.11.03.21.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2019 21:50:39 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Add myself as co-maintainer for QCOM
Date:   Sun,  3 Nov 2019 21:50:36 -0800
Message-Id: <20191104055036.63414-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add myself as co-maintainer for the Qualcomm SoC.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f33adc430230..8bba0f1a7077 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2126,6 +2126,7 @@ S:	Maintained
 
 ARM/QUALCOMM SUPPORT
 M:	Andy Gross <agross@kernel.org>
+M:	Bjorn Andersson <bjorn.andersson@linaro.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/soc/qcom/
-- 
2.23.0

