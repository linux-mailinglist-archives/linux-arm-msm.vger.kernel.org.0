Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6747D1F8194
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2020 09:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgFMH2Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Jun 2020 03:28:16 -0400
Received: from relay-2.mailobj.net ([213.182.54.5]:41405 "EHLO
        relay-2.mailobj.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726453AbgFMH2P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Jun 2020 03:28:15 -0400
Received: from v-1.localdomain (v-1.in.mailobj.net [192.168.90.191])
        by relay-2.mailobj.net (Postfix) with SMTP id 3C1DE12F5;
        Sat, 13 Jun 2020 09:28:13 +0200 (CEST)
Received: by ip-25.net-c.com [213.182.54.25] with ESMTP
        Sat, 13 Jun 2020 09:29:08 +0200 (CEST)
X-EA-Auth: U1QvuLdVC7huke1i3/+qyWTGRNyRCXutzaT0V3pccpxgofONL3oENl5vKuogdqOuJNEgUC19kWbE6RX1/tPyapPecref4JoF35SX8wTltDw=
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     sboyd@kernel.org
Cc:     konradybcio@gmail.com, Vincent Knecht <vincent.knecht@mailoo.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 2/4] dt-bindings: clock: rpmcc: Document MSM8936 compatible
Date:   Sat, 13 Jun 2020 09:27:43 +0200
Message-Id: <20200613072745.1249003-3-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200613072745.1249003-1-vincent.knecht@mailoo.org>
References: <20200613072745.1249003-1-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
index 90a1349bc713..51d1ef62c745 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
@@ -13,6 +13,7 @@ Required properties :
 			"qcom,rpmcc-msm8660", "qcom,rpmcc"
 			"qcom,rpmcc-apq8060", "qcom,rpmcc"
 			"qcom,rpmcc-msm8916", "qcom,rpmcc"
+			"qcom,rpmcc-msm8936", "qcom,rpmcc"
 			"qcom,rpmcc-msm8974", "qcom,rpmcc"
 			"qcom,rpmcc-msm8976", "qcom,rpmcc"
 			"qcom,rpmcc-apq8064", "qcom,rpmcc"
-- 
2.25.4


