Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE17A1751B7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2020 03:09:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgCBCJX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Mar 2020 21:09:23 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41400 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726627AbgCBCJX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Mar 2020 21:09:23 -0500
Received: by mail-pl1-f194.google.com with SMTP id t14so3552006plr.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2020 18:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Y617NjPV2w0ps+7DkMU/HSrI2+VaICeo3Wmn8yqjrI=;
        b=Yqr0M/Nd8HF+aGZNYtnaqApjbKNmUfJzIkxfNG78niHql0bIYGw/HmZsSz8UJEnHui
         P26sITklXpwlFTmbB5sf4gLJed2jbKdyqUYnKnhgiQJobwT988DqsMpePkywIlSdj4CC
         iculfj6zghd2otF8wYE0m4rSHNEkPsn7+L/IL89fSsaKPtbNOzDuB3H9utHpQSrndn98
         2ToAnUEoU43XyAkGgRhVZF0fn1efgvKI5Lzxvan50s4COGHKQeKUuOCvCXY0CqGxuwmx
         0JIFsML4gI94JYAEH1Kj4X/qgiFSCYJ0sZes+WGrHnnymMyZnz8NGShNRb3KVUWSr/7S
         gOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Y617NjPV2w0ps+7DkMU/HSrI2+VaICeo3Wmn8yqjrI=;
        b=tb5x3HmNP8eE/4LaCA9BKTmQukpzrDeBEAIiQiEPCxrckA55/kwRADYA6sL3JHvlNB
         nf1UBy3192cm0X7GOATXieyHj2MisaDbORlQDhqwRKI+td8QfRt+n4eyS3l7VmWYvIc9
         jS/rJdHxy/2xFWQ+gmG3LK6Yt/fyp95hG5ajhXCxlISw2MOBrLQitsbT3IsENMa8OVcI
         modp+6wVtbmApPOjBQMllxjb3FrOGqiUkcaIM3OARlid20I2jw4fb78ngH0b329+VXZ8
         Tb0ZfqAX0eq+GHFyPQIp7h4L4gCvyDf9hPXJ5zLjTyP7VhQxH/Ku2NrwzuIfASc74f6V
         Ujiw==
X-Gm-Message-State: APjAAAX7rBBJP695LZpYAYnkGN3apMJDg0b6GFnV0nxYpd/pW9Q5EnRG
        DpKfTK4oxImANmd93xuLqEYcJA==
X-Google-Smtp-Source: APXvYqxfWyEPbC+YVHwW6uh4cHK4f4uu8GCmPDe2S9W5MvePPjMSTsJSNaOeLDNfMtXpLd0yZXczFA==
X-Received: by 2002:a17:902:524:: with SMTP id 33mr16076380plf.241.1583114962362;
        Sun, 01 Mar 2020 18:09:22 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o12sm6147522pfp.1.2020.03.01.18.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2020 18:09:21 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sdm845-mtp: Relocate remoteproc firmware
Date:   Sun,  1 Mar 2020 18:07:57 -0800
Message-Id: <20200302020757.551483-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update the firmware-name of the remoteproc nodes to mimic the firmware
structure on other 845 devices.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index 09ad37b0dd71..fa7f4373a668 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -50,6 +50,7 @@ vreg_s4a_1p8: pm8998-smps4 {
 
 &adsp_pas {
 	status = "okay";
+	firmware-name = "qcom/sdm845/adsp.mdt";
 };
 
 &apps_rsc {
@@ -350,6 +351,7 @@ vreg_s3c_0p6: smps3 {
 
 &cdsp_pas {
 	status = "okay";
+	firmware-name = "qcom/sdm845/cdsp.mdt";
 };
 
 &gcc {
@@ -372,6 +374,11 @@ &i2c10 {
 	clock-frequency = <400000>;
 };
 
+&mss_pil {
+	status = "okay";
+	firmware-name = "qcom/sdm845/mba.mbn", "qcom/sdm845/modem.mbn";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
-- 
2.24.0

