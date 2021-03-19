Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8BA8341B93
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Mar 2021 12:37:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbhCSLgx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Mar 2021 07:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbhCSLgU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Mar 2021 07:36:20 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3AE0C06174A;
        Fri, 19 Mar 2021 04:36:20 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so6587801pjh.1;
        Fri, 19 Mar 2021 04:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eVpuvkoPJ+6XsXdlLgUmTJOnHjh0/ViqxnLG2XmHnSw=;
        b=ShBJLKv2zNu7wM2lIoAiIg7C0iWTA7q0Pfxmg1hGvqNS1HBCVRCthwPwX99bxSbug8
         AAQZ1GkGAcmiIYy499E1VOHDsUlOAeI7bIhAaxxA+TojO7oYviaSdOtQZM0qa02OEelL
         g8oWTqrqnq9CBPUxwUYFZ1tpP+vFltsrbGLAOEWRjjCF9F1/5hxF7gFfG/alrDPBxzW7
         tJxNFZ54mAg8J/Enlo2rKQAqTqYfVQCHV5dqJrGSMRQmgYPMTzOrk82UuZS/QkDylgPc
         3bLhpcNTvJgP0rPj38g2UMLMCRITRF3rUmJ9yo+P23z/R07auejI/g5batsGsBdlCp+u
         xJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eVpuvkoPJ+6XsXdlLgUmTJOnHjh0/ViqxnLG2XmHnSw=;
        b=PhmC0Xou6IAocdrio0XmtM1mC7xir0jB3iPodPvWxh1xKLlBoQjM/YhCdBS0Y5cvgp
         BTtfv6CzA+mOcVECJr3u0Fy24fNieAC0UDVGiVd538w5/5/y4jHuYChF98pl6/UOZXvS
         viKVdDO9qlEoaeP5j4+LJsHFTtjkI657jV9T/CRIfbMFn+mMeVl79huKtJgbQV2FOsU7
         hfSTUE8sQRGxTXhd5rPk+TpJIj+ihpmmRYRCOYgc0OZ9j24nFkFdURk34sTJx9j370PF
         upxaJgce+LnWvH3YZCTgMCO70AaYPzTEqNOrqcB3kM6AcdD+IZHRtWXNdoH3WwYdxhHv
         gxGA==
X-Gm-Message-State: AOAM531cW9/N179kCgXHXjAttFKVIkGkmkj9E3SYpPM0+rJ3LX8jNKEw
        d2Yez9U1iMesCn27lxbiXyE=
X-Google-Smtp-Source: ABdhPJyGsqPCjDh/ygkSyJ5o3ygeOW8OCnWeV/AfJqIN1fpDfK+WWCCPcdeR19C4Fg+NWei+luvoiA==
X-Received: by 2002:a17:902:ff15:b029:e4:51ae:e1ee with SMTP id f21-20020a170902ff15b02900e451aee1eemr13762076plj.83.1616153780253;
        Fri, 19 Mar 2021 04:36:20 -0700 (PDT)
Received: from localhost.localdomain ([178.236.46.205])
        by smtp.gmail.com with ESMTPSA id d11sm5596075pfd.43.2021.03.19.04.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 04:36:19 -0700 (PDT)
From:   menglong8.dong@gmail.com
X-Google-Original-From: zhang.yunkai@zte.com.cn
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, kishon@ti.com, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zhang Yunkai <zhang.yunkai@zte.com.cn>
Subject: [PATCH] phy:qualcomm: remove duplicate argument
Date:   Fri, 19 Mar 2021 04:36:12 -0700
Message-Id: <20210319113612.494623-1-zhang.yunkai@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Zhang Yunkai <zhang.yunkai@zte.com.cn>

'HSUSB_CTRL_DPSEHV_CLAMP' in 'val' is duplicated.

Signed-off-by: Zhang Yunkai <zhang.yunkai@zte.com.cn>
---
 drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
index 9061ece7ff6a..bfff0c8c9130 100644
--- a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
@@ -276,8 +276,8 @@ static int qcom_ipq806x_usb_hs_phy_init(struct phy *phy)
 	val = HSUSB_CTRL_DPSEHV_CLAMP | HSUSB_CTRL_DMSEHV_CLAMP |
 		HSUSB_CTRL_RETENABLEN  | HSUSB_CTRL_COMMONONN |
 		HSUSB_CTRL_OTGSESSVLD_CLAMP | HSUSB_CTRL_ID_HV_CLAMP |
-		HSUSB_CTRL_DPSEHV_CLAMP | HSUSB_CTRL_UTMI_OTG_VBUS_VALID |
-		HSUSB_CTRL_UTMI_CLK_EN | HSUSB_CTRL_CLAMP_EN | 0x70;
+		HSUSB_CTRL_UTMI_OTG_VBUS_VALID | HSUSB_CTRL_UTMI_CLK_EN |
+		HSUSB_CTRL_CLAMP_EN | 0x70;
 
 	/* use core clock if external reference is not present */
 	if (!phy_dwc3->xo_clk)
-- 
2.25.1

