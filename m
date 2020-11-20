Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 076E32BB3CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Nov 2020 19:39:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731342AbgKTSih (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Nov 2020 13:38:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:56778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731341AbgKTSih (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Nov 2020 13:38:37 -0500
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EC06421D91;
        Fri, 20 Nov 2020 18:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605897516;
        bh=ju5aiY7t8yuacS4TNsi2zbNjewpWGBo8WBUPY/Hv9AE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XClGgrKaAacxsH8usSw05JOrFmJ+umHbgussKohokXAhj88axhqdUbbqMQ0zekjyO
         mJSisP6AIwulSlgusebMY3Kr1WxVvBOwBy3u7fcw4MOBoBGZDjUqFH4J+XrATIVj1w
         qCjRftWoRwF+IaZLxP9MtSgttf3APLovgUXqMjco=
Date:   Fri, 20 Nov 2020 12:38:42 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH 114/141] phy: qcom-usb-hs: Fix fall-through warnings for Clang
Message-ID: <0253fd307f2d2929ee4b169b06bfa6eb5ff99faf.1605896060.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

