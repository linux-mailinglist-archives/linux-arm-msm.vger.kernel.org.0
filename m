Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD68C1BD423
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 07:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbgD2Fpe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 01:45:34 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:55571 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725861AbgD2Fpe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 01:45:34 -0400
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 29 Apr 2020 11:15:32 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.157])
  by ironmsg02-blr.qualcomm.com with ESMTP; 29 Apr 2020 11:15:20 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
        id 7DEB929E2; Wed, 29 Apr 2020 11:15:19 +0530 (IST)
From:   Harigovindan P <harigovi@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Harigovindan P <harigovi@codeaurora.org>, robdclark@gmail.com,
        seanpaul@chromium.org, sean@poorly.run
Subject: [PATCH v12 2/2] dt-bindings: documenting compatible string vendor "visionox"
Date:   Wed, 29 Apr 2020 11:15:15 +0530
Message-Id: <20200429054515.4976-2-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200421045508.21137-1-harigovi@codeaurora.org>
References: <20200421045508.21137-1-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Documenting compatible string vendor "visionox" in vendor-prefix yaml file.

Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
---
Changes in v11:
	- Added compatible string in vendor-prefix yaml file

Changes in v12:
	- Fixed the string to clear dt_binding_check errors.

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 66a7382add95..1c86ebbeae20 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1047,6 +1047,8 @@ patternProperties:
     description: Tronsmart
   "^truly,.*":
     description: Truly Semiconductors Limited
+  "^visionox,.*":
+    description: Visionox
   "^tsd,.*":
     description: Theobroma Systems Design und Consulting GmbH
   "^tyan,.*":
-- 
2.25.1

