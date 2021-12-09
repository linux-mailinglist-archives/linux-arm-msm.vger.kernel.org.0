Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C652E46F721
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Dec 2021 00:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233771AbhLIXEI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 18:04:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232499AbhLIXEI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 18:04:08 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34DF0C061746
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Dec 2021 15:00:34 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id z5so24952790edd.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Dec 2021 15:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a+0Ep/yb8H7MLgHj2miW6l5c50PIqRx5I19pHgtjLSE=;
        b=Uvj5gScfTG89Z8iPzEhR/7q6XFsGOJ4trsr3RUOhWIqLtsVf+GZpaq4AxCpHHhiEaU
         Oy0cc6bVqOHkZbTuYTPdyTo/G1m25EJPHYvUqjyUaJUvlsznlPPTp9oyptbTjm3D6eHS
         zd+4cmRtujNe3n0orD+b3GjyonJZGFY37oTIMf8BSJeWd0tpglR+QyIX0cHtfbwzAjzh
         lAIg51QL1k2w4H4xlUZdqjjkW7uFFKx5CvGl+d/QvJfvYD6g7ODQlOglzmh0UsOkq+L5
         5w8sB0NwLPEpYRkxs49EM/dsponzDQiuPYOOC+rH4LQcYKt16qca2ZL090tFZhsVYb1i
         ytWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a+0Ep/yb8H7MLgHj2miW6l5c50PIqRx5I19pHgtjLSE=;
        b=vlJix01w/jEcAke3z9LD8nu7IuyWx62q5SZW/DPt3ZNJAPB3a9bCRa5n7jIjL8zO6D
         J6MaQMXsdbZu4dIqXFHavbrW6ZRNln1Ua3WZVYdTy0th+dxpRXtlDaXyVHrHYYdWbKFD
         UnULn7YyyiuTbC2fL2BxfZaXc6huf4Cm9WGc0UatEn5h4q0v6j8W3/od8pWSY/GhFxlz
         yPalAgyrGJQRRlOhX43vVuiKKGwbDXFS5S4eLZ1fMtuE8W8Qq/tLaHrJ8r8EdIb20uWR
         o4k9rN0y/RoLZMI0zYAsA5atjhMaDd/gKxW0tU43/BG78FpHMHYZUaZYKkf0doj6Ria7
         SVSQ==
X-Gm-Message-State: AOAM531vXatiIbzPSSnoqd6nT0DP8HR3Z+6R7Vu9OzXS+EHMmmvSjuic
        EdFnq2/4js8XfkvJMH+FvgHTRg==
X-Google-Smtp-Source: ABdhPJzpObr0Euc9Aqi+D4bMnsIpo5b7q8xE8lSN9AIusc1I3G72KfXa4pytAmq0l4lbuYXkzvYuhQ==
X-Received: by 2002:a17:906:399a:: with SMTP id h26mr18850064eje.131.1639090832781;
        Thu, 09 Dec 2021 15:00:32 -0800 (PST)
Received: from lion.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id cw20sm523557ejc.90.2021.12.09.15.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 15:00:32 -0800 (PST)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org, amit.pundir@linaro.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
Cc:     sumit.semwal@linaro.org, john.stultz@linaro.org
Subject: [PATCH] dts: arm64: qcom: sdm845-oneplus-*: add msm-id and board-id
Date:   Thu,  9 Dec 2021 22:59:38 +0000
Message-Id: <20211209225938.2427342-1-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The msm-id and board-id can be used to select the correct dtb when
multiple are provided to the bootloader.

Multiple DTBs can be provided on sdm845 devices using boot image header
v1 by appending them all to the kernel image before creating the boot
image. The bootloader then selects them like this:

Best match DTB tags 321/00000008/0x00000000/20001/20014/20115/20018/0/(offset)0x79998E27/(size)0x000173CD
Using pmic info 0x20014/0x20115/0x20018/0x0 for device 0x20014/0x20115/0x20018/0x0

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 2 ++
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts    | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
index 73493079d13e..5936b47dee5f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
@@ -11,6 +11,8 @@ / {
 	model = "OnePlus 6";
 	compatible = "oneplus,enchilada", "qcom,sdm845";
 	chassis-type = "handset";
+	qcom,msm-id = <0x141 0x20001>;
+	qcom,board-id = <8 0 17819 22>;
 };
 
 &display_panel {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
index b63ebc48f62f..78a0b99144e6 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
@@ -11,6 +11,8 @@ / {
 	model = "OnePlus 6T";
 	compatible = "oneplus,fajita", "qcom,sdm845";
 	chassis-type = "handset";
+	qcom,msm-id = <0x141 0x20001>;
+	qcom,board-id = <8 0 18801 41>;
 };
 
 &display_panel {
-- 
2.34.1

