Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76595FBA10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2019 21:39:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbfKMUj5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Nov 2019 15:39:57 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:32768 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727031AbfKMUj5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Nov 2019 15:39:57 -0500
Received: by mail-pg1-f196.google.com with SMTP id h27so2113232pgn.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2019 12:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yJ+OqtXGNDpquBLmUc2gxer4AoTafNPZvnhBD9jto6M=;
        b=nqpFgRu72ExoW4cdQPUGtYALmsuvJeMgA5ThWflKhT4PB499qw9//2/H6iUop6HXjf
         csgKyV0x7+XLSru42QPcBk0LzwmlLAGKWUYxQkcb8R5Qn5IqjwvdD0cH2ENUSFhnT68P
         AFc098+LHsNlsG/u2bByRfTP6ZI15TD6xdRtKmJ1F0u/llR3YBEHKhec889mXKmDZW4+
         0zdow5PDBGQy9a8WbcT2mMLaNLD8d3kNTcEvlx7ilQ24kjdDwmZdjDmIRjEGfov2827S
         /21G3LnNDeoK7+J5bQEa3F9P9zYjx0BvyVUCEKJUwU9pCrMwB1dQKWMI2+14P0SG1qzH
         gAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yJ+OqtXGNDpquBLmUc2gxer4AoTafNPZvnhBD9jto6M=;
        b=BQfsM33IOyX51PAZgqzntPYeJ0BzrzlSYT1rkTA5ImXE61OAm7S3YLAiuEOp79e3Ee
         Ig9MBI4CvjFREOgCgg1XSTnip+ewDfqH1rVdMRdI+eo3RNb9POVw0tujffMqWuSsF+XA
         DSiVTXp2xjXC0XqhTCRq6bxrevf1po43I6wp2IHh5ku4F4lchX90UtM8HxzyTI5r+2OP
         TtiVBWkZG/v4mWxrLwTC1Lw9Z/ZVTPgMzjGNXZ0NMe6rSJML2xBhWWruWnP7pl4p8KT9
         m+LmhRD5PoRGh2Dx7UNPaX4+/YeiLYFgy+j4wHhq6PuKYvE7AONiTe0PIN2I+aqqVECb
         hpPg==
X-Gm-Message-State: APjAAAWekMiGZxM9VjWGEN0hwhTFWm1kVO5CLw1zrdk7McDJHOrXlLrl
        IMZieMQ6wXR7IeLw36yCITlyOg==
X-Google-Smtp-Source: APXvYqxFDGoFj2CIbZ35kJ359jzDsphPskdtvjydZyBSgTkA/d1hX5d0bjWWBiavC5E3In4RqimrKw==
X-Received: by 2002:a17:90a:9a9:: with SMTP id 38mr7744497pjo.45.1573677594579;
        Wed, 13 Nov 2019 12:39:54 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z7sm5007361pfr.165.2019.11.13.12.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 12:39:53 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: db845c: Move remoteproc firmware to sdm845
Date:   Wed, 13 Nov 2019 12:39:51 -0800
Message-Id: <20191113203951.3704428-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The redistributable firmware should work on any engineering device, so
lets push this to qcom/sdm845, rather than qcom/db845c. Also specify the
path for the modem firmware.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index d100f46791a6..c4f6c6695bbd 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -197,7 +197,7 @@
 &adsp_pas {
 	status = "okay";
 
-	firmware-name = "qcom/db845c/adsp.mdt";
+	firmware-name = "qcom/sdm845/adsp.mdt";
 };
 
 &apps_rsc {
@@ -343,7 +343,7 @@
 
 &cdsp_pas {
 	status = "okay";
-	firmware-name = "qcom/db845c/cdsp.mdt";
+	firmware-name = "qcom/sdm845/cdsp.mdt";
 };
 
 &gcc {
@@ -352,6 +352,11 @@
 			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
 };
 
+&mss_pil {
+	status = "okay";
+	firmware-name = "qcom/sdm845/mba.mbn", "qcom/sdm845/modem.mbn";
+};
+
 &pm8998_gpio {
 	vol_up_pin_a: vol-up-active {
 		pins = "gpio6";
-- 
2.23.0

