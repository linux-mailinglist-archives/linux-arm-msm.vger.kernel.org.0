Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 451E153F254
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 01:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235208AbiFFXFr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jun 2022 19:05:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232378AbiFFXFq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jun 2022 19:05:46 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01olkn2045.outbound.protection.outlook.com [40.92.107.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8D729FEA;
        Mon,  6 Jun 2022 16:05:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=arqP/E1ysWYAvKkwkKN9P3oS5tB/MtetzLlunyDySeSVrLe2JFF4pYL8eJOc6J0SEIWHDdZwJcI1GPgD65tsoZP/hB6t35q9/Fc3qkOwivC5ujW9GMh4soeFIyJKZWvDE9QoU724osGRodEqkkTtb2cvi4pbBKfzmR2HSrmDI9rsnTGJ95aV1yQTBDL0b07fiy96UJNmZu6Mv4ReDQifcigZuTdBeXhekLlysLWXaSw2Xcw+WrxbnhN1Z9p1n5v9orHjkzGwI21se0Lf/tWN8gx2ST9meRs5ScUGau0kcl6egI3zYj6XpjCYrqkmBqoABIeIdpzSV5v4A5sJ+bn7BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7BAzMJUpd/c34NtUQrHoKjKNReeBxPTXHR1jq7KKqqs=;
 b=TmLZqyHBs1JWgu/Tx42JfQHOkDDBVcyE/ypyQ7tbLZbs1OtG32iumFkijxUPuSL140K8aOSlhc0ujD5QWkhL6m4isApCJdNmyC2cA2eY+jIqpUWwTShJwHRXAQbj9fbVBA2VocCzJ1l2h2ix8uAFN41d2ieZZ5baBAXZZZbchAmRfPPws+7/nuiLWPOm/sDNDl3MOoP2nkWrDq/weRQGLTZ5FfpEBYmbiJ8WUOWpGY8gEl7O4ttscqQqIhj5UhBolPdXgI62JjWZZ0rrBWV1elB7L3UYzWLeWtVCYHXtgj4VnYRFpMt1RN8RnRA1AmMIiuZffOsjYoIgPuQa/5BSSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SEZPR03MB6666.apcprd03.prod.outlook.com (2603:1096:101:7d::6)
 by PUZPR03MB6187.apcprd03.prod.outlook.com (2603:1096:301:ba::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.6; Mon, 6 Jun
 2022 23:05:38 +0000
Received: from SEZPR03MB6666.apcprd03.prod.outlook.com
 ([fe80::9129:13b:1fd4:1961]) by SEZPR03MB6666.apcprd03.prod.outlook.com
 ([fe80::9129:13b:1fd4:1961%3]) with mapi id 15.20.5332.007; Mon, 6 Jun 2022
 23:05:38 +0000
From:   Teguh Sobirin <teguh@sobir.in>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: display: panel: Add Innolux TD4328 panel bindings
Date:   Tue,  7 Jun 2022 06:05:16 +0700
Message-ID: <SEZPR03MB6666F4081BF29953A0DC379BDDA29@SEZPR03MB6666.apcprd03.prod.outlook.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-TMN:  [DfeeB1xDS0YUM3Zs9Qn6tcyZBNOJOX1L]
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To SEZPR03MB6666.apcprd03.prod.outlook.com
 (2603:1096:101:7d::6)
X-Microsoft-Original-Message-ID: <20220606230522.107428-1-teguh@sobir.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea572e5a-7784-4fc4-c936-08da481111d9
X-MS-TrafficTypeDiagnostic: PUZPR03MB6187:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b85M04EnCjnkMe5J6oed7wrnWbbJ06+RpBTCs6ngx2KFq739pfRmnW25V9Z7R+Mw4XRBikvcXQl//KZa7RHcesXK1Kl85edqzp8U2ZMQjs0TJyypIH0SSnwbDgdJyWbcvf2TIabM6j2oH6TOBmOZHNJSmX49FbhAkRPzlNYql+0wXxISDUOrYao5Hcwwy9tlRTM0ymhR0t415ghg1aqaq0d2fKF2oSxPceO+S+YAKxiFIJ5JaSSmUYKZDMk8Ud/kYYSF4j3d6QoUT+xwIMBxHYgSgmgpXmkh8J/oO/yUdE5+MnuD3bUfjmJexLn5fFtyMTrnpYnv2YWplgNyZ9HbBxIj96+5zXgCvXqRvMpQ4dsrAw/W51F/hEcEd96tX2amSRcPdQhR3x4fXw0a1q7WVFl1TVkojsEhplRC/jze8khGZHiY6cDqSMsGwovYCdjOIGXkMAF03nS+XKI0OjZ+0zMZiA3PEWOvot2T5xuVbm5tc0kHvovkPlySqN64FvaXxgIn9/m4EYNyasxCH8MMrMd1ySGH2p/ydwjhurPQ6zPABo9A02wGQSG+NmnVAE8RRjWJ143mDerHiKk3/WK4lALIe7i5jre1iFfBIEG9DTAGEKF8fd0N2UKqzUthKaRJ
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zBzVRX6gmdxwlx99AvAJeI15oQBi9SZVMcJGo11kHrUw1smcGifoMlO4rq78?=
 =?us-ascii?Q?cEy9nUKQOG0Iu0nU7Xzp+GsZI0wz14f6Mep5gVOf2Ris8x2LPKjkYj87Wlom?=
 =?us-ascii?Q?rWnqNBTzkoemIE2K77NtaoOd8uJc8HCdY1MxyYG1gGoo3+o3kfAcHp7NlG2M?=
 =?us-ascii?Q?IqcXzvDINwpFKg+QtFt8HNWYnfqRy5xExMzXJifsNp4l9D7XPm/ObTo5uZmC?=
 =?us-ascii?Q?ExMJazkqpltyDTCjyakMe43f7RgDAemUKEBv82HfJNx5R1jBMYpaIWwWwvZZ?=
 =?us-ascii?Q?QayqBB87ra9iowGdyKg/3rEJAMMzdSVC4DMrBaa4rT6BYws4LkrsoQ21jbqy?=
 =?us-ascii?Q?rLJj5AIL/atjRDwOWQHDBYG/6xaDtzhK0Eu3/ps+5GeiRU9RoKLdvnlsjoQ5?=
 =?us-ascii?Q?SWceZhb6CefnERbgB2UJWF58kLJwImvoBqydyDm7kMni0qlQeoZrIQ1b8PTE?=
 =?us-ascii?Q?xHnc6GzQX5/lAKGjz3mB+ea2DlQq8uuhKa7wc6YnkeCGdbC+LWpUrxt5qxpZ?=
 =?us-ascii?Q?l9/i4nkLlT9khQ9rdk8MNj7zPTH4y/ZQfMjOiiaNKO6lrt82T8qW8diVVo54?=
 =?us-ascii?Q?xf7czbqS5yZ4zQB6hD8AxaUo9knUzM5GcKGTS8qbR5JUIb7sxAQIOVCXxkvR?=
 =?us-ascii?Q?qd1XQ19MISBQMywTEgCUQ/iEHA+OYI9AKR4YJjZ/VcU5C0mxldo/absDW8RH?=
 =?us-ascii?Q?Boo29hM8DyBcQkoWhEkAvb5ZqyESO9jwX0aEeGZgsqbVfexUYcHcL4EkJ/A6?=
 =?us-ascii?Q?Lt6mizUUg7VzVcuC2qHq1UpbCcMKp0BwSWij6fSmVG1LD6u3U/Qcu2iyL0AW?=
 =?us-ascii?Q?Cfrsi6fqaGV2K13cGJPm74KRp/4SkAj6u7v+ybKeaIk7k1yOHa8nMFcdztwA?=
 =?us-ascii?Q?Pyt/9oUANlor5oLFQ3MzyM/a3eFI6AiBOWNDWMVuclEQGmqBdtzeTvwyjmOa?=
 =?us-ascii?Q?fJ3Y3jW5lWWWkfc1mz703kxWQnVllF+7bO8uxIpLV4d+TEbTkxEO60PuBAtj?=
 =?us-ascii?Q?KLMvLdtHQ/PVWl9w36HU35r0OSBD+gcs29xkvrlEBveEFGEeJTiyMmdJ4IJF?=
 =?us-ascii?Q?Nnu5b7eBPeC9qJk8WvICY5zwKRK8cdNxOw3xvDZ/JO25IHkPbiyZ9d3VIhUJ?=
 =?us-ascii?Q?DqPIfrp8lBvj+K35Cul/AVdzyVtE3ILp/IlXPxcbBVUltTWYvSZA1U0k82X/?=
 =?us-ascii?Q?0gHHIXEtgjOFrbC2R+wZWfaxUDfCONuzCKsQaswKOCsyaBypzdN2AT5cIUq9?=
 =?us-ascii?Q?kzcKqNFJKiQ48V7OG3zupzriHtzh1VHYZznNfxCFoYxRnNz4GKKHJIKpuarE?=
 =?us-ascii?Q?0ANzlJC+A8/l+K/x72MJNsgpZTUtXg8JHJEMo/m3tuvYGZwtDnwkI4B4TBL3?=
 =?us-ascii?Q?V+Kr5GbvdYt8LowCfjoQi89wrRfoPhv3V92XquzbF1vPo+PpxA=3D=3D?=
X-OriginatorOrg: sct-15-20-4734-24-msonline-outlook-c0b75.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ea572e5a-7784-4fc4-c936-08da481111d9
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB6666.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 23:05:38.0601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB6187
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add documentation for "innolux,td4328" panel.

Signed-off-by: Teguh Sobirin <teguh@sobir.in>
---
 .../display/panel/innolux,td4328.yaml         | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/display/panel/innolux,td4328.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/innolux,td4328.yaml b/Documentation/devicetree/bindings/display/panel/innolux,td4328.yaml
new file mode 100755
index 000000000000..d4773ade0f13
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/innolux,td4328.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/innolux,td4328.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synaptics TD4328 based DSI display Panels
+
+maintainers:
+  - Teguh Sobirin <teguh@sobir.in>
+
+description: |
+  The TD4328 IC from Synaptics is a DSI Panel IC used to drive DSI panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: innolux,td4328
+    description: This indicates the panel manufacturer of the panel that is
+      in turn using the TD4328 panel driver.
+
+  reset-gpios:
+    maxItems: 1
+    description: phandle of gpio for reset line - This should be 8mA, gpio
+      can be configured using mux, pinctrl, pinctrl-names (active high)
+
+  vddio-supply:
+    description: phandle of the regulator that provides the supply voltage
+      Power IC supply
+
+  vddpos-supply:
+    description: phandle of the positive boost supply regulator
+
+  vddneg-supply:
+    description: phandle of the negative boost supply regulator
+
+  rotation:
+    description: Display rotation in degrees counter clockwise (0,90,180,270)
+
+  reg: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - vddio-supply
+  - vddpos-supply
+  - vddneg-supply
+  - reset-gpios
+  - rotation
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |+
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "innolux,td4328";
+            reg = <0>;
+            vddio-supply = <&vreg_l14a_1p88>;
+            vddpos-supply = <&lab>;
+            vddneg-supply = <&ibb>;
+
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+            rotation = <90>;
+
+            port {
+                panel0_in: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.30.2

