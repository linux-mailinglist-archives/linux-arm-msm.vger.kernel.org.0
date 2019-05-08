Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA7B18265
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2019 00:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728903AbfEHWn2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 May 2019 18:43:28 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:32782 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728606AbfEHWnP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 May 2019 18:43:15 -0400
Received: by mail-pg1-f193.google.com with SMTP id h17so137822pgv.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 May 2019 15:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5q9dsjY3DBzndr7wkuvZRTHnczHf4Q/fpKRsCx+qJwI=;
        b=N7Vx7SQnonpq06ayiMuPXO0+ovJ9IYasbzcwhbTme1cqt6g2l9EAJqV0qhEcQK1LXZ
         8RsHpt092gP2klW+DYNIce8SMCQbCIbM2mAaR/ePnQcJby/DDVcuFak875Y4u9bTLuCY
         ZF4KHTOQnu5/Y00nHE9tsG4FY4ZC9vyUPgEylDJ+iqA34If3nZZP23+P8+WcOnk90U6Z
         GCB5qzKAGTplbpCxsI2zSlBk1z63A99GOru/9uItbbTCs3V7fRcMgbjRDswQ4CLZV5mn
         9I9yvTxeEwUs9yr0dEmFXyJrdPlhs5VBxj/lOiIlznABbisQ3pZ2hLvUfQbZ18G0j1Du
         UAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=5q9dsjY3DBzndr7wkuvZRTHnczHf4Q/fpKRsCx+qJwI=;
        b=OcZyyD9yRFHvM37wo/ARk1B5TcbAtfbVBNkwYI0NBdezSer7X6z9e+JVfK5BE/5KPr
         uImuNmtBKXQFQfmhLBufHpNqK8iKLM7ykg93/VZqIM8e2NiEvx4xcd5dZrIAWs8W6JoU
         6pRrUstmDPy1TyKj7KEcSzFx/dL2thNUs/badOkZZbJQU44X0R9MYY4V7IsU63J+CH8Q
         2lvuKKsYXAm4jopFZJeCL3ilYssRpC42LgpdVUgx8vvuRqPwF8pdBNMYMBPe/KFCEZZS
         0xlWaF2O/t/6Sq16mwbyIWMlPstJjbcoGsEQjVw6YWG2nMK1D+YAnMrJh9Nu1suaSg7m
         CZCQ==
X-Gm-Message-State: APjAAAXPZr6LcT+uQRxhgoTbIDVAWV3cDnS6eho4p58kjSuZBuDFTpxl
        1iUpdf3CNtdJbX4MdZamo4nB4Q==
X-Google-Smtp-Source: APXvYqzOx+Ty15Ki0fJrGT+TPqPGOflDSOwh2gjGYsH4NMh4u336RZkfTJHnFY5wiuyJ+fbYEByX3Q==
X-Received: by 2002:a65:48ca:: with SMTP id o10mr900894pgs.136.1557355394400;
        Wed, 08 May 2019 15:43:14 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 25sm320494pfo.145.2019.05.08.15.43.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 May 2019 15:43:13 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] arm64: dts: qcom: qcs404: Make gcc as reset-controller
Date:   Wed,  8 May 2019 15:43:07 -0700
Message-Id: <20190508224309.5744-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190508224309.5744-1-bjorn.andersson@linaro.org>
References: <20190508224309.5744-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

GCC is a reset-controller, so define #reset-cells.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v3:
- Split single patch, no functional change

 arch/arm64/boot/dts/qcom/qcs404.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index ffedf9640af7..65a2cbeb28be 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -383,6 +383,7 @@
 			compatible = "qcom,gcc-qcs404";
 			reg = <0x01800000 0x80000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 
 			assigned-clocks = <&gcc GCC_APSS_AHB_CLK_SRC>;
 			assigned-clock-rates = <19200000>;
-- 
2.18.0

