Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 163AD1F8191
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2020 09:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725771AbgFMH2W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Jun 2020 03:28:22 -0400
Received: from relay-2.mailobj.net ([213.182.54.5]:48979 "EHLO
        relay-2.mailobj.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbgFMH2U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Jun 2020 03:28:20 -0400
Received: from v-1.localdomain (v-1.in.mailobj.net [192.168.90.191])
        by relay-2.mailobj.net (Postfix) with SMTP id 0626312F5;
        Sat, 13 Jun 2020 09:28:18 +0200 (CEST)
Received: by ip-25.net-c.com [213.182.54.25] with ESMTP
        Sat, 13 Jun 2020 09:29:13 +0200 (CEST)
X-EA-Auth: /YZtz4n9ytcy8mBH8aKu5mU4c2etIp7EyxNz6tcam14WVXDxvs/lWBsSnIfhTnWHSz+Ytti5bx6ScrFOxgfpU2AqgdNxmOD4cEZFEqLRhA0=
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
Subject: [PATCH v4 4/4] dt-bindings: soc: qcom: Document MSM8936 SMD RPM
Date:   Sat, 13 Jun 2020 09:27:45 +0200
Message-Id: <20200613072745.1249003-5-vincent.knecht@mailoo.org>
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
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
index 616fddcd09fd..55f8abd845a7 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
@@ -21,6 +21,7 @@ resources.
 	Definition: must be one of:
 		    "qcom,rpm-apq8084"
 		    "qcom,rpm-msm8916"
+		    "qcom,rpm-msm8936"
 		    "qcom,rpm-msm8974"
 		    "qcom,rpm-msm8976"
 		    "qcom,rpm-msm8998"
-- 
2.25.4


