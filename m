Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16FDE474C9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Jun 2019 15:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727358AbfFPNaK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Jun 2019 09:30:10 -0400
Received: from onstation.org ([52.200.56.107]:53656 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727215AbfFPN3r (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Jun 2019 09:29:47 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 74C163EA08;
        Sun, 16 Jun 2019 13:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1560691786;
        bh=9la9rGA+VNucWpe2JoLlGvFG3lx2LubbW/TmbFF+fH8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VU+cpI9z+k+iSfXw3RgNYJ3yBU9flQoNiqpnn/h4j8WT9/myas6AvUvMr9XovJtvX
         sYUrXdS8e1UwLv1w8Zl9VJockEuMLCI964F/PYRJd9Yz/fcfgixS9pCqkQl5PLXZQg
         6d+vi9MagZ0qsRSZrIaCRslvPSHJGFIxTH/6NMAA=
From:   Brian Masney <masneyb@onstation.org>
To:     agross@kernel.org, david.brown@linaro.org, robdclark@gmail.com,
        sean@poorly.run, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, airlied@linux.ie, daniel@ffwll.ch,
        mark.rutland@arm.com, jonathan@marek.ca,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/6] dt-bindings: display: msm: gmu: add optional ocmem property
Date:   Sun, 16 Jun 2019 09:29:26 -0400
Message-Id: <20190616132930.6942-3-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190616132930.6942-1-masneyb@onstation.org>
References: <20190616132930.6942-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some A3xx and A4xx Adreno GPUs do not have GMEM inside the GPU core and
must use the On Chip MEMory (OCMEM) in order to be functional. Add the
optional ocmem property to the Adreno Graphics Management Unit bindings.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 Documentation/devicetree/bindings/display/msm/gmu.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.txt b/Documentation/devicetree/bindings/display/msm/gmu.txt
index 90af5b0a56a9..c746b95e95d4 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.txt
+++ b/Documentation/devicetree/bindings/display/msm/gmu.txt
@@ -31,6 +31,10 @@ Required properties:
 - iommus: phandle to the adreno iommu
 - operating-points-v2: phandle to the OPP operating points
 
+Optional properties:
+- ocmem: phandle to the On Chip Memory (OCMEM) that's present on some Snapdragon
+         SoCs. See Documentation/devicetree/bindings/soc/qcom/qcom,ocmem.yaml.
+
 Example:
 
 / {
-- 
2.20.1

