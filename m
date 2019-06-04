Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4412C352B1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2019 00:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbfFDW3l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jun 2019 18:29:41 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37150 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbfFDW3l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jun 2019 18:29:41 -0400
Received: by mail-pg1-f196.google.com with SMTP id 20so11185237pgr.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2019 15:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6uE/vL/AC4uqE6b1DA3SJoV5lcu+xB0dTnx7ipoYpvg=;
        b=ThlZP82odSOJMRtuP5KlQfAGXd08O5cSrIkgolnq6lpnCAH2tNpZTGqPgQMuzncV02
         RjfNVxjYH6HeKZOvuPE/YS94Jw1KmLj6BYkoCrGgAxYvH4FNfOzymv/1y4Ex6w242IhN
         2AVOoGjYcut1rdGtRBhVydhEXdj0+HiRRs9QI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6uE/vL/AC4uqE6b1DA3SJoV5lcu+xB0dTnx7ipoYpvg=;
        b=JfbcCvvXqSUHOfj8Oi2i23jgsG80SFlW+g80Or5rggUS3UAkoCC6NKig3HZdRwcnil
         6N13t3BW/k2XvFjcvmAUYIQpUE1bYYG0ysmysfpEXns8DFEKH46kJf3cWoK6Xwmcb+IE
         vEIDlXfEppYJYaQxxNMJPQvj2j0BcJihnWUFT8gxPw79rhFnJe8i9vnsTxPLSrftrhMv
         g4u9PtghAyZvTaRdzE7REuXQB5pLt40u+sBO/fjiJSz47jhvpZJG+l2IHf2qox6idLbV
         Gmdl1rdiF0SCBdZhq/sb2nfYb4d9Sl+QtnwLJ4f1tPl2HyUdBXK3imEIZFpLxeZmo6lj
         xCYg==
X-Gm-Message-State: APjAAAUROJ9fnh4E5ayGGXo7FiU1orLkbJyd8muof2mc5cEfUHpdiPLK
        C1mWFKizCjkRQwa67v71extmkg==
X-Google-Smtp-Source: APXvYqxj1ArdUEzLJARGRA5oIt6nAw4LfskkjatYOZKNGhHdl2uqFQV8wBZAi/NcC6V7qYlnrRiKIQ==
X-Received: by 2002:a63:545a:: with SMTP id e26mr205701pgm.162.1559687380982;
        Tue, 04 Jun 2019 15:29:40 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id v4sm22224251pfe.180.2019.06.04.15.29.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 15:29:40 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH] arm64: dts: sdm845: Add iommus property to qup1
Date:   Tue,  4 Jun 2019 15:29:39 -0700
Message-Id: <20190604222939.195471-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SMMU that sits in front of the QUP needs to be programmed properly
so that the i2c geni driver can allocate DMA descriptors. Failure to do
this leads to faults when using devices such as an i2c touchscreen where
the transaction is larger than 32 bytes and we use a DMA buffer.

 arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
 arm-smmu 15000000.iommu:         GFSR 0x00000002, GFSYNR0 0x00000002, GFSYNR1 0x000006c0, GFSYNR2 0x00000000

Add the right SID and mask so this works.

Cc: Sibi Sankar <sibis@codeaurora.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index fcb93300ca62..2e57e861e17c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -900,6 +900,7 @@
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
+			iommus = <&apps_smmu 0x6c0 0x3>;
 			status = "disabled";
 
 			i2c8: i2c@a80000 {
-- 
Sent by a computer through tubes

