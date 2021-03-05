Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9E532E596
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 11:03:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbhCEKCu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 05:02:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:46086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229957AbhCEKCW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 05:02:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C86164F45;
        Fri,  5 Mar 2021 10:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614938541;
        bh=ju5aiY7t8yuacS4TNsi2zbNjewpWGBo8WBUPY/Hv9AE=;
        h=Date:From:To:Cc:Subject:From;
        b=aEl/dN1J2UbpTsa1LTePKCr42YiT+xziEGCfi8suiPMrjS10Lnsyr8XSr7GOqBnsL
         P6maa/ds752Cmdw6MVK52xAHyhpTu/GxOm/hRgFYVWSDhsqpGnXos4NH4lRGfdkEWx
         78Ta+9wP1ZGI/QC3F0DAmTRKp3C6SZwUtsHH6TtbMVkimh8Bb0To7GSmZqaei/hNtJ
         gvA+wus0t6u74/fRk/2SCDlR8ZKg2o2LFo4ojGRo3Xuoc5hhY9UkimJondvIRfbpr2
         Vv42o7ew25OtnQPU1+RBbY6jgmDf2YGuRoagAQ3BMMQTBYJta2JBkiQPAji8sobG9f
         ffJpqcywrFLVw==
Date:   Fri, 5 Mar 2021 04:02:19 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-hardening@vger.kernel.org
Subject: [PATCH RESEND][next] phy: qcom-usb-hs: Fix fall-through warnings for
 Clang
Message-ID: <20210305100219.GA142595@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
by explicitly adding a break statement instead of letting the code fall
through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-usb-hs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-usb-hs.c b/drivers/phy/qualcomm/phy-qcom-usb-hs.c
index 327df1a99f77..5c6c17673396 100644
--- a/drivers/phy/qualcomm/phy-qcom-usb-hs.c
+++ b/drivers/phy/qualcomm/phy-qcom-usb-hs.c
@@ -56,6 +56,7 @@ static int qcom_usb_hs_phy_set_mode(struct phy *phy,
 			fallthrough;
 		case PHY_MODE_USB_DEVICE:
 			val |= ULPI_INT_SESS_VALID;
+			break;
 		default:
 			break;
 		}
-- 
2.27.0

