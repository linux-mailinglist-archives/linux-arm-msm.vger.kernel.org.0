Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A442173117
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2020 07:33:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgB1GdO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Feb 2020 01:33:14 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45187 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbgB1GdO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Feb 2020 01:33:14 -0500
Received: by mail-pl1-f193.google.com with SMTP id b22so835373pls.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2020 22:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z16ZHpuypSAVdnxOxij5MvVMLN1BTwXGBSuHheXl+q8=;
        b=i0mXqGQr5GdP34akzJU2rXrJDzTsqrX/p7eCKI/ia2WYggc9Ju1+iUOP0ImylqI54T
         IKZX8AnrS+OqtZbM/AcsiLzWkA3iw+DD819cIseEZN+GSnbbddb+cAyMlijjCRPp3YTl
         dQG3CXIhIVahebgHL9zMYwpQIvpTIxC6TMZhdx3VC5FGxMkvCj5aPQ1Wfhmj9H1aBTiL
         tWAVIr6+FJf0qcpTQw1cGyEi/GaGAr4khCC7BGLEPPrzA+amdm+OYT0/j8TWtFTsNOK9
         I5BUCS1TNSU0ugPdvCzMBgqrpS1ksu1zSkdbWbeOoblsDdImhhTxBovEs0BvTG9FT18M
         Q+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z16ZHpuypSAVdnxOxij5MvVMLN1BTwXGBSuHheXl+q8=;
        b=MrKxgy1br3QzEcpnRv9ahZv0a8oR0c+dN0W7+c6uI9Ci3OPzv1EIA2QZ9cXN2jdJET
         y394HZarcV+STjXBXk9D2kBvlxrXGWceAym9OtS/7XcKLstO0CTDJZ7s4yFZLkou+rAr
         WrxMG1mN0e/UELBmPfo9ESIRSDbsUdG5l9/SZeUOnTD26VivOjy4m+zvoAixR2hotBj8
         gjtagB4qTSNF7+Iu5W+sedoUQoBJ0M0uZQ/UJ3lR2A9WB258NKfzULx2UGmvwpZSx/gt
         blEyRUp0mS27Xy9QeZGTXKDbTApy6t51PmV6GQx1HGpmvr7O2hsCW1IBq6986b/PRPaq
         tvgQ==
X-Gm-Message-State: APjAAAWfQ+NagafwVUNm+EAXA7ik7ZVpBPCXiTMTUb+3Th4XPAZKhNYK
        N3y3j6nqhxNuKzwIOqAa80lBPg==
X-Google-Smtp-Source: APXvYqw1CF+JtIMKBXwKc+VzDvcLRXgVhoVWOsCC12dQe/rihzCnhdFZbclxJc7jAwzPUcFCvD5uKg==
X-Received: by 2002:a17:902:9a48:: with SMTP id x8mr2747564plv.14.1582871592974;
        Thu, 27 Feb 2020 22:33:12 -0800 (PST)
Received: from localhost ([103.249.89.56])
        by smtp.gmail.com with ESMTPSA id d73sm9942863pfd.109.2020.02.27.22.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 22:33:12 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vkoul@kernel.org, daniel.lezcano@linaro.org,
        bjorn.andersson@linaro.org, sivaa@codeaurora.org,
        Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v4 3/3] arm64: dts: qcom: msm8996:: Add qcom,tsens-v2 to msm8996.dtsi compatible
Date:   Fri, 28 Feb 2020 12:02:42 +0530
Message-Id: <ebaa801adade53c567857db2f74af7d2e00f935b.1582871139.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1582871139.git.amit.kucheria@linaro.org>
References: <cover.1582871139.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The qcom-tsens binding requires a SoC-specific and a TSENS
family-specific binding to be specified in the compatible string.

Since them family-specific binding is not listed in the .dtsi file, we
see the following warnings in 'make dtbs_check'. Fix them.

/home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
thermal-sensor@4a9000: compatible: ['qcom,msm8996-tsens'] is not valid
under any of the given schemas (Possible causes of the failure):
/home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
thermal-sensor@4a9000: compatible: ['qcom,msm8996-tsens'] is too short
/home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
thermal-sensor@4a9000: compatible:0: 'qcom,msm8996-tsens' is not one of
['qcom,msm8916-tsens', 'qcom,msm8974-tsens']
/home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
thermal-sensor@4a9000: compatible:0: 'qcom,msm8996-tsens' is not one of
['qcom,msm8976-tsens', 'qcom,qcs404-tsens']

/home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
thermal-sensor@4ad000: compatible: ['qcom,msm8996-tsens'] is not valid
under any of the given schemas (Possible causes of the failure):
/home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
thermal-sensor@4ad000: compatible: ['qcom,msm8996-tsens'] is too short
/home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
thermal-sensor@4ad000: compatible:0: 'qcom,msm8996-tsens' is not one of
['qcom,msm8916-tsens', 'qcom,msm8974-tsens']
/home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
thermal-sensor@4ad000: compatible:0: 'qcom,msm8996-tsens' is not one of
['qcom,msm8976-tsens', 'qcom,qcs404-tsens']

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 7ae082ea14ea..f157cd4f53b4 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -446,7 +446,7 @@
 		};
 
 		tsens0: thermal-sensor@4a9000 {
-			compatible = "qcom,msm8996-tsens";
+			compatible = "qcom,msm8996-tsens", "qcom,tsens-v2";
 			reg = <0x004a9000 0x1000>, /* TM */
 			      <0x004a8000 0x1000>; /* SROT */
 			#qcom,sensors = <13>;
@@ -457,7 +457,7 @@
 		};
 
 		tsens1: thermal-sensor@4ad000 {
-			compatible = "qcom,msm8996-tsens";
+			compatible = "qcom,msm8996-tsens", "qcom,tsens-v2";
 			reg = <0x004ad000 0x1000>, /* TM */
 			      <0x004ac000 0x1000>; /* SROT */
 			#qcom,sensors = <8>;
-- 
2.20.1

