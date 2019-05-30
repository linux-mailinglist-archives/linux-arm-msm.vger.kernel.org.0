Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 422263007C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2019 18:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727557AbfE3Q7T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 May 2019 12:59:19 -0400
Received: from esa5.hc3370-68.iphmx.com ([216.71.155.168]:26719 "EHLO
        esa5.hc3370-68.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727153AbfE3Q7T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 May 2019 12:59:19 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Thu, 30 May 2019 12:59:18 EDT
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none; spf=None smtp.pra=ian.jackson@eu.citrix.com; spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com; spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
  authenticity information available from domain of
  ian.jackson@eu.citrix.com) identity=pra;
  client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
  envelope-from="Ian.Jackson@citrix.com";
  x-sender="ian.jackson@eu.citrix.com";
  x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
  Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
  sender) identity=mailfrom; client-ip=23.29.105.83;
  receiver=esa5.hc3370-68.iphmx.com;
  envelope-from="Ian.Jackson@citrix.com";
  x-sender="Ian.Jackson@citrix.com";
  x-conformance=sidf_compatible; x-record-type="v=spf1";
  x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
  ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
  ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
  ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
  client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
  envelope-from="Ian.Jackson@citrix.com";
  x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
  x-conformance=sidf_compatible
IronPort-SDR: j6Jla5bEjOysbWY33LQgBsckjzCSiUp/Xf80ERNKwuOaABxlNxI+FRTakiLW97oJOwguOEb3FY
 Jsl8qgbIv/ozrbZ7fOVFrNTUaJtHliMomnFkbKdCSbhSWR33Rag3S1RIA1rhLVw6B2pzJiEy0r
 ZHaXA2byisdFFypizTBrmsu0SmkRPjzGiCXiYUOrT+z2urjMQX5MHCsyMHVaf5PKkGA79LJZ9U
 KdQyqKksZgusjCHkBMn622oo8tSbmeRngv04mVrJaCXwgrfnm/rZIMviUVqIMbiR5uzigWR6mD
 XWg=
X-SBRS: 2.7
X-MesageID: 1092333
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,531,1549947600"; 
   d="scan'208";a="1092333"
From:   Ian Jackson <ian.jackson@eu.citrix.com>
To:     <xen-devel@lists.xenproject.org>
CC:     Ian Jackson <ian.jackson@eu.citrix.com>,
        Julien Grall <julien.grall@arm.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [OSSTEST PATCH] ts-kernel-build: Disable CONFIG_ARCH_QCOM in Xen Project CI
Date:   Thu, 30 May 2019 17:51:23 +0100
Message-ID: <20190530165123.22593-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <c78c372a-4cf4-9721-38f2-d173eecee27e@arm.com>
References: <c78c372a-4cf4-9721-38f2-d173eecee27e@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

  drivers/firmware/qcom_scm.c:469:47: error: passing argument 3 of `dma_alloc_coherent' from incompatible pointer type [-Werror=incompatible-pointer-types]

This is fixed by

  firmware: qcom_scm: Use proper types for dma mappings

but this is not present in all relevant stable branches.

We currently have no Qualcomm hardware in the Xen Project test lab so
we do not need this enabled.

CC: Julien Grall <julien.grall@arm.com
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Stephen Boyd <swboyd@chromium.org>
CC: Andy Gross <agross@kernel.org>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>
CC: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 ts-kernel-build | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ts-kernel-build b/ts-kernel-build
index f7d059b0..5536586f 100755
--- a/ts-kernel-build
+++ b/ts-kernel-build
@@ -274,6 +274,10 @@ setopt CONFIG_MDIO_THUNDER=m
 setopt CONFIG_I2C_THUNDERX=m
 setopt CONFIG_SPI_THUNDERX=m
 
+# Some Linux branches we care about, including 4.19, still lack
+# firmware: qcom_scm: Use proper types for dma mappings
+CONFIG_ARCH_QCOM=n
+
 ####
 
 END
-- 
2.11.0

