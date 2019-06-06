Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F8A0368ED
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2019 03:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbfFFBCz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jun 2019 21:02:55 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45418 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbfFFBCy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jun 2019 21:02:54 -0400
Received: by mail-pf1-f194.google.com with SMTP id s11so364141pfm.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2019 18:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CVfY2rC28TUuJiq3uH1wJEhWN7/kC8yOQdwb0MYva/0=;
        b=p3A3rKuHCefXZWN7fWg4nX9E9dn1cL6KkVkiCyfgemW5z+YDAhDOOzLE2Wt6m3AywB
         PPWMt5gnn/3cS9b7n/IXqu8mD7tivfsbbGAs0NR1j1euURvrjyAtcN4QZi7A1zWxGAiV
         gpW2Anv4nHlPa0Z3Ft+nrox4RKEBmzlDe/09UkdUe8lfykT+C+KtqejLv/AlZdNxkt5G
         V0WX9bxKce6MZXbfnI4TbzUmgHfGxEspgmrh1PHamE+fBA1nkxZZ5ZetzV4VZEQAAydg
         oGtS0ZFd59yPQU/2+Q3okeTDPCVMUbDg3+PSBxlm9T0qVZNZ05tfFoIikARM3Tc2NUpp
         zq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CVfY2rC28TUuJiq3uH1wJEhWN7/kC8yOQdwb0MYva/0=;
        b=F5An59NVty8FNmkGBfSYUoXTosLI7UblCM37MKpiJRJc+/z6qnRY5LZ78OXTRivROt
         iANAJMsadIGqawIiHM/0ERwYn43AFTAJsX6EJzXJDHEoZpu+oTHxT5aOBD8UfkGgusB6
         s71jjpAnTtk668ypIucBt9GX0OkTBKBcNPrjRNzAH6jPruZsA/Myj1EqKpRy3P4eOmpl
         kB6NtOdHKQpY7Bm9EnhEogN65mJN/Uq0OA1kYqfVuucGo/RMthILSzMEzQM6T5xZqaNY
         y2O4zn6pan5jEvaS1SO48c6JYMJp8lDMZWDauRyJbhPb0iQqnPFJf3NW/XnRJ6Y/zwiQ
         njsA==
X-Gm-Message-State: APjAAAVieAd36W+AEqyGtw6dAZDNDel2AX7C9cVGmoQW7JABah3LOb0v
        uhQexSSDrP3UhnTvSm4Krid7LQ==
X-Google-Smtp-Source: APXvYqyCypg6oVvwk6Ue9xlyaT78SEVJA7D+c9VA4Krrku8TKMD49Au/WSck38jKYsQVj/zgTSIYMg==
X-Received: by 2002:a62:ce07:: with SMTP id y7mr22987027pfg.12.1559782974090;
        Wed, 05 Jun 2019 18:02:54 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 144sm170856pfy.54.2019.06.05.18.02.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 18:02:53 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Evan Green <evgreen@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: [PATCH v2 1/3] pinctrl: qcom: sdm845: Expose ufs_reset as gpio
Date:   Wed,  5 Jun 2019 18:02:47 -0700
Message-Id: <20190606010249.3538-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190606010249.3538-1-bjorn.andersson@linaro.org>
References: <20190606010249.3538-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The ufs_reset pin is expected to be wired to the reset pin of the
primary UFS memory but is pretty much just a general purpose output pinr

Reorder the pins and expose it as gpio 150, so that the UFS driver can
toggle it.

Tested-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

 .../bindings/pinctrl/qcom,sdm845-pinctrl.txt         |  2 +-
 drivers/pinctrl/qcom/pinctrl-sdm845.c                | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
index 321bdb9be0d2..7462e3743c68 100644
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

