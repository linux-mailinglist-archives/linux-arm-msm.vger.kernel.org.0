Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 973D0101096
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2019 02:18:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbfKSBS2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 20:18:28 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37287 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727116AbfKSBS2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 20:18:28 -0500
Received: by mail-pl1-f194.google.com with SMTP id bb5so10785205plb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2019 17:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hq5TX+U7APVzVaoaAOIejhIYqLJqIfb0addUNvfV3EY=;
        b=QcPAOz4T+S3x+pR/AFPvhDB6vy0xUDa3hIedvCIdddoG1hKBw/R/jdvu2y1vaQ5NBt
         F6E7e3jrjAcAA7KKuBlewxII6CBHoHBQfEqhs+ZedoTgRtzbcKwrUeZRsUs+jZvU7LMa
         +JzdPX07A1xwXRNBMMKUB2P4DQS/xey81RybmRPdchxIF2EbNWi3nfusbJjXvw2t6vgX
         RE2uYTKJQ+lkQPxvNMpvuNWgoS5VrYZlTLo9BcvInCyXb7gSqYfF4Yuo0LOP93HkaHO0
         dMYivO/7n1qj8MJln6KZz9yt5yvdowh3pbjlKXkCr26wQtZubCu+eL4Su+UBmlOtREAR
         A+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hq5TX+U7APVzVaoaAOIejhIYqLJqIfb0addUNvfV3EY=;
        b=aqOJutpN+5+b/T6HoPFLEsn9mTvqmP9Cw0yB0w9SZ4Wyvu9Nl9syXwBWBgOS3LSJYH
         znlziVI8/yOqAooddi20a0IdLHqpsWLlsx4KU0X/CvZvWWEYaXBsw3TuQ3hQ7EBrHG4t
         KmQa5QmtdkGA8xPpkihtUI6nNYyAVL99duIEhWDDiqADZ4YTKjHWl7TFHEE3X5cG64cE
         yDMXk4/G1BxYcc6xhkcr9oPrnxH36H03qUGzbHDGsRcmp4gtGnbqAzG6TO2wvOYCcBgh
         tPeICtcKTyF9K+J7Hhqyg9lznBjGmKNwzgLplkMxJO89GsZz9y70lmZ3p34wFmguGv+6
         mRaA==
X-Gm-Message-State: APjAAAV3UxLZNN5e6DWmcjzjL4K5gO9rQQssHKntI6+M/V1a+UssJ8Yz
        2CyqNwnLTckmWFUjodjyNvCZ3w==
X-Google-Smtp-Source: APXvYqx2qcau9xuLewpvhhxmVyJe8cNx/r8C6kPKS6U7KeCXUsr34SI0cHzxo4FWWbJtyN5gp8OahA==
X-Received: by 2002:a17:90a:4d8f:: with SMTP id m15mr2705487pjh.71.1574126307097;
        Mon, 18 Nov 2019 17:18:27 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x13sm22929055pfc.46.2019.11.18.17.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 17:18:26 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: msm8998-mtp: Add alias for blsp1_uart3
Date:   Mon, 18 Nov 2019 17:18:23 -0800
Message-Id: <20191119011823.379100-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The msm_serial driver has a predefined set of uart ports defined, which
is allocated either by reading aliases or if no match is found a simple
counter, starting at index 0. But there's no logic in place to prevent
these two allocation mechanism from colliding. As a result either none
or all of the active msm_serial instances must be listed as aliases.

Define blsp1_uart3 as "serial1" to mitigate this problem.

Fixes: 4cffb9f2c700 ("arm64: dts: qcom: msm8998-mtp: Enable bluetooth")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Rewrote commit message

 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
index 5f101a20a20a..e08fcb426bbf 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
@@ -9,6 +9,7 @@
 / {
 	aliases {
 		serial0 = &blsp2_uart1;
+		serial1 = &blsp1_uart3;
 	};
 
 	chosen {
-- 
2.23.0

