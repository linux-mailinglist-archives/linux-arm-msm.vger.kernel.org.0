Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B18F13C53F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 15:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730540AbgAOONq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jan 2020 09:13:46 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41521 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729526AbgAOONa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jan 2020 09:13:30 -0500
Received: by mail-wr1-f68.google.com with SMTP id c9so15894043wrw.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2020 06:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=utrms9phUtFiuVDkbSHkMcIIB+hqEFiylLVtYFCLs98=;
        b=h2avPzgtHS2x2OYDax1t4VNWKLqty6XA4E9ZjqJab0pKdQByRf1PEj7tqgfbT1rFOC
         +tENLeDKBOT8PQfZQe4cJQdhBk5tDerzipgC46tWGHbhhRloQqY8NwK1VT/2R2mK4Kzn
         HnmQjbZbdO0t1U07yQe5h3IcPXYY7KVs51OCDTYJ7FEJa/dKyH7I0jB53geercfQdC7X
         NBdP4Gr+LnIaavxzM3YZP+XkJUNe5G7KuTt9eLSjyv7pVluSs06/y2ulrPilSIYBrFtl
         asFezWef6PblRiEpOXxP1wUQcQHrUtHDJm5iDEE6KAyGtXOMq1YXk3HbGOAsY1DGaaTT
         WNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=utrms9phUtFiuVDkbSHkMcIIB+hqEFiylLVtYFCLs98=;
        b=V5kUQHqlm+AbVGcWdlIy9kTTk6RW8UTRb3Xke9/9iywzeVhyydjC4f3KezblsOIwte
         pdfMBE8Wtk81Bj2j8ewVXMfmZN6YtfjLMMLwOOPboqCHosb766yRSkmiDRKeXakuRlng
         3aDmOugF+sCNsjuDgS+4jd4kmTogr3SIDMoY5eCL0JqQixcc3v8IwzkhTiThm8wqrBAw
         ZAhdOPV+n9UsF6WdLcRpA9bqd4WXl9qEMkmc8/7Yxc9o8R1QF9EUCxMeUb+UDx7xVVJm
         OuJLXP5eLQNx2TJilc3RKVxvJUlS49ajoHHsoJl2NSxmJ8lS5oFhKYQG2zFYiYPly/AJ
         6HRg==
X-Gm-Message-State: APjAAAVXVt/QyGB9MRDAtlunX6Xs/GElWsV4fjvmXXlpqSKhQqnOihhW
        3d7jxfyqISrTpIm2bJLTt7LM4fbSlb0=
X-Google-Smtp-Source: APXvYqyTuamJ9fHx0PYuc9zHO/uCqxLay9MiZeaYDixnvT9qgiT7T1DxVJet5UBmYWb5t8PaSKTN9A==
X-Received: by 2002:a5d:6a8e:: with SMTP id s14mr32360617wru.150.1579097608303;
        Wed, 15 Jan 2020 06:13:28 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id m21sm23730720wmi.27.2020.01.15.06.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 06:13:27 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH 17/19] arm64: dts: qcom: qcs404-evb: Raise vreg_l12_3p3 minimum voltage
Date:   Wed, 15 Jan 2020 14:13:31 +0000
Message-Id: <20200115141333.1222676-18-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
References: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rather than set the minimum microvolt for this regulator in the USB SS PHY
driver, set it in the DTS.

Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 01ef59e8e5b7..0fff50f755ef 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -199,7 +199,7 @@ vreg_l11_sdc2: l11 {
 		};
 
 		vreg_l12_3p3: l12 {
-			regulator-min-microvolt = <2968000>;
+			regulator-min-microvolt = <3050000>;
 			regulator-max-microvolt = <3300000>;
 		};
 
-- 
2.24.0

