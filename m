Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF8CB0053
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2019 17:39:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728635AbfIKPju (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Sep 2019 11:39:50 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:34291 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728412AbfIKPju (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Sep 2019 11:39:50 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1i84ih-0007gj-Fc; Wed, 11 Sep 2019 15:39:47 +0000
From:   Colin King <colin.king@canonical.com>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] bus: qcom: fix spelling mistake "ambigous" -> "ambiguous"
Date:   Wed, 11 Sep 2019 16:39:47 +0100
Message-Id: <20190911153947.10203-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake on the documentation. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 Documentation/devicetree/bindings/bus/qcom,ebi2.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/bus/qcom,ebi2.txt b/Documentation/devicetree/bindings/bus/qcom,ebi2.txt
index 5a7d567f6833..5058aa2c63b2 100644
--- a/Documentation/devicetree/bindings/bus/qcom,ebi2.txt
+++ b/Documentation/devicetree/bindings/bus/qcom,ebi2.txt
@@ -71,7 +71,7 @@ Optional subnodes:
 
 The following optional properties are properties that can be tagged onto
 any device subnode. We are assuming that there can be only ONE device per
-chipselect subnode, else the properties will become ambigous.
+chipselect subnode, else the properties will become ambiguous.
 
 Optional properties arrays for SLOW chip selects:
 - qcom,xmem-recovery-cycles: recovery cycles is the time the memory continues to
-- 
2.20.1

