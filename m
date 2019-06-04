Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEB6533FEB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2019 09:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbfFDHUH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jun 2019 03:20:07 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38069 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726855AbfFDHUG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jun 2019 03:20:06 -0400
Received: by mail-pf1-f195.google.com with SMTP id a186so11424389pfa.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2019 00:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ViYa7F9UtMEME21J5BQzy3vs+Cq1vhzXOpNQ8GRwj90=;
        b=IQHyypeLvlM4iPMqI4K31qIccqyDXJUNAkUxaVhwli/2GjylIzF6dAawwqwChEpKAy
         aaIKSnnA4n1FcjHAefxCe1pHccyedHAO8oXGSu8TWcR4F7rdgAWWgfh6SL68CEVAZHEv
         Pp9dp0tsP/1Z8C7VLNUOy9xy5En5PaGeNIKDrpW/8sBu5ARxEBLxLSXkMlkk2WGmrOM/
         dLEUx4SM/+JAjA6Konl0hOJ4xF+4x1Da+dMN95qPZL+CjTbTd+DAKjYgtNdbVRZdCvtR
         lAR9K2wXfF7DIWiapg1VyBBCVFcJ1kUI68o0j99J1vfebfnVlxDaUu46CRCBEiCYLVoc
         BF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ViYa7F9UtMEME21J5BQzy3vs+Cq1vhzXOpNQ8GRwj90=;
        b=GqnU6XItb/fcXzX/oxvp4dzB9wX2kNeiuiLwr66N4IbGlaC0BXEhUsZ1d1Xv+zxzWQ
         CRZ5sPbRqQ/WC2J0sODBIOAPWo+s3KA1RGT216eAKY2GqVr0sawriHrBBlX0okBtAkfi
         WSTbVjNJ2jGcjRpq0lBmixVWkBmVj2AJCaq2Yo4VCpuA9RPaqGeppITwDE+9oZwGt3cv
         4mFfEKbgu3RPSTYWO+QjmFNcS0uQJcU9G0F2H5eQtdtXh1UahhmbTsnzVU/+FF7S7p5A
         Jgyei9Ws1OB1WwtwrSyLclLxElA9Ic9cnk80sUENIO9P3/gK43Y2Ny+eV4ypHIRg6FtS
         zT6w==
X-Gm-Message-State: APjAAAUTXcjWO23amZzdoeE3U8nexSLno5NwSgNerJ35H+zhdCPT3Rsq
        u6LS7aPibFh5o7HsC/SPIhN8Pw==
X-Google-Smtp-Source: APXvYqxep24lPZLwXxpx558WKp+gDT6VilB85WYF0oHb5nOjxCXrDxAsXc35nYFTLkltrAI9xGRhvQ==
X-Received: by 2002:a17:90a:2648:: with SMTP id l66mr6801082pje.65.1559632805532;
        Tue, 04 Jun 2019 00:20:05 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d6sm17747446pgv.4.2019.06.04.00.20.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 00:20:05 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: [PATCH 1/3] pinctrl: qcom: sdm845: Expose ufs_reset as gpio
Date:   Tue,  4 Jun 2019 00:19:59 -0700
Message-Id: <20190604072001.9288-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190604072001.9288-1-bjorn.andersson@linaro.org>
References: <20190604072001.9288-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The ufs_reset pin is expected to be wired to the reset pin of the
primary UFS memory but is pretty much just a general purpose output pinr

Reorder the pins and expose it as gpio 150, so that the UFS driver can
toggle it.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../bindings/pinctrl/qcom,sdm845-pinctrl.txt         |  2 +-
 drivers/pinctrl/qcom/pinctrl-sdm845.c                | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
index 665aadb5ea28..33ae08aa4b89 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
@@ -79,7 +79,7 @@ to specify in a pin configuration subnode:
 		      gpio0-gpio149
 		        Supports mux, bias and drive-strength
 
-		      sdc2_clk, sdc2_cmd, sdc2_data
+		      sdc2_clk, sdc2_cmd, sdc2_data, ufs_reset
 		        Supports bias and drive-strength
 
 - function:
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm845.c b/drivers/pinctrl/qcom/pinctrl-sdm845.c
index c97f20fca5fd..e4e5acade086 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm845.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm845.c
@@ -420,10 +420,10 @@ DECLARE_MSM_GPIO_PINS(147);
 DECLARE_MSM_GPIO_PINS(148);
 DECLARE_MSM_GPIO_PINS(149);
 
-static const unsigned int sdc2_clk_pins[] = { 150 };
-static const unsigned int sdc2_cmd_pins[] = { 151 };
-static const unsigned int sdc2_data_pins[] = { 152 };
-static const unsigned int ufs_reset_pins[] = { 153 };
+static const unsigned int ufs_reset_pins[] = { 150 };
+static const unsigned int sdc2_clk_pins[] = { 151 };
+static const unsigned int sdc2_cmd_pins[] = { 152 };
+static const unsigned int sdc2_data_pins[] = { 153 };
 
 enum sdm845_functions {
 	msm_mux_gpio,
@@ -1271,10 +1271,10 @@ static const struct msm_pingroup sdm845_groups[] = {
 	PINGROUP(147, NORTH, _, _, _, _, _, _, _, _, _, _),
 	PINGROUP(148, NORTH, _, _, _, _, _, _, _, _, _, _),
 	PINGROUP(149, NORTH, _, _, _, _, _, _, _, _, _, _),
+	UFS_RESET(ufs_reset, 0x99f000),
 	SDC_QDSD_PINGROUP(sdc2_clk, 0x99a000, 14, 6),
 	SDC_QDSD_PINGROUP(sdc2_cmd, 0x99a000, 11, 3),
 	SDC_QDSD_PINGROUP(sdc2_data, 0x99a000, 9, 0),
-	UFS_RESET(ufs_reset, 0x99f000),
 };
 
 static const struct msm_pinctrl_soc_data sdm845_pinctrl = {
@@ -1284,7 +1284,7 @@ static const struct msm_pinctrl_soc_data sdm845_pinctrl = {
 	.nfunctions = ARRAY_SIZE(sdm845_functions),
 	.groups = sdm845_groups,
 	.ngroups = ARRAY_SIZE(sdm845_groups),
-	.ngpios = 150,
+	.ngpios = 151,
 };
 
 static int sdm845_pinctrl_probe(struct platform_device *pdev)
-- 
2.18.0

