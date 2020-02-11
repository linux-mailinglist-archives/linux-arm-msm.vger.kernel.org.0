Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3932158708
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2020 01:52:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbgBKAwj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 19:52:39 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44618 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727577AbgBKAwS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 19:52:18 -0500
Received: by mail-pf1-f193.google.com with SMTP id y5so4551102pfb.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2020 16:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M8+iy7pVN4WE3jutHz5qWVqRqdhsfXVc/4DMY70bYKQ=;
        b=krxFBIuL7oKSbZcqFj1jVnlp3lrMP84d2IGovq34cVVYAhbvsdfo2xtjVTuHRHzcHW
         Ul+m25Diga040b2BWpWkTKMuejH24MHC0kNpWlKeJwBi3MP+dMUEqF3MEl8/CBnBC3zW
         j2n+5n9RHv5Sb0Q0QX0XqOn9Y0AajR7nTvj4/oy0ApKii9/kxslgo6ryTuzKttiA3Zly
         Ymv+snierXvMsL+GsvI2XTVOIn0mV9aJoFfJJBlB1XaUMnagRi/2QabexTPgGnBmVCga
         lgoOfBo9Mz7BvDwu9YUlpEfdRWYuyYnkOqex7849I5GyGINClDwrfnkM8So0t/cIYNro
         Limg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M8+iy7pVN4WE3jutHz5qWVqRqdhsfXVc/4DMY70bYKQ=;
        b=BRD1FAhCiKlWVLXavbIZ4Gn3M83PEiA6JlkoOK8Sq1tG9f3egi+kOyCK1ozpMJNyd0
         TqOCIJTMsy31evWFq7i56Cw3e+DmLoNda3b2O7uKusAoCoRzMtP/+VmRjZN7nIAmE+bx
         jDJb70+mngV8SMaOrzp6IB63RJvmgPJVu2wo4EqVArqPARpL29jyulW0StnRYV+XQxzi
         +EW56IpBCBqTDJq2d1O+Cio/oUkD7KzZgK9s/Eb498MpIieswwfhkShNf1QUHbnz9oI9
         FQT9M8UcWfEZ24ZuL1sWlGspBbZGOLOqeUFmwLxbsy6qBJ/jz6sz9tnGXc4veVMPmZJM
         KCVw==
X-Gm-Message-State: APjAAAUUTFDkM0dDlBqnbiN+kJXG8fb+c3LUH+3TOs+k4K6AJu18p8pT
        3fRDk4YzXfA+B9TgdpbLUpxWkA==
X-Google-Smtp-Source: APXvYqwzEs01mneR4MjC/kY7F3XwSiwiWb6bslc15hzLTqaoTFJRvKVCPb8EQ9uh+djJtwD3r9r7kQ==
X-Received: by 2002:a63:2f46:: with SMTP id v67mr4526056pgv.220.1581382335751;
        Mon, 10 Feb 2020 16:52:15 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q21sm1538480pff.105.2020.02.10.16.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 16:52:15 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v3 5/8] arm64: dts: qcom: sdm845: Add IMEM and PIL info region
Date:   Mon, 10 Feb 2020 16:50:56 -0800
Message-Id: <20200211005059.1377279-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a simple-mfd representing IMEM on SDM845 and define the PIL
relocation info region, so that post mortem tools will be able to locate
the loaded remoteprocs.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- Replace offset with reg

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index d42302b8889b..3443d989976c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3018,6 +3018,19 @@ spmi_bus: spmi@c440000 {
 			cell-index = <0>;
 		};
 
+		imem@146bf000 {
+			compatible = "syscon", "simple-mfd";
+			reg = <0 0x146bf000 0 0x1000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			pil-reloc@94c {
+				compatible ="qcom,pil-reloc-info";
+				reg = <0x94c 200>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sdm845-smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x80000>;
-- 
2.24.0

