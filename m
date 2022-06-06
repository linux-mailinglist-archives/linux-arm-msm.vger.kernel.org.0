Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8141153F25B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 01:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235221AbiFFXFx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jun 2022 19:05:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235212AbiFFXFv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jun 2022 19:05:51 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01olkn2010.outbound.protection.outlook.com [40.92.107.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4076C9FEA;
        Mon,  6 Jun 2022 16:05:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQwB77sVcGl2k3kSE0Ypd6gKBAx2oF0O1i0X96ZFr0VwvzcvWYbSSaVzhuxTJbzCJR0ssajrNJ232p1P96bdI8H0wyVbR4krcKKOQeoWaTLStOkCPaV3fqrQ6hJxnuFUtNKMvarXd8xZhJnsVXq0rz3Yk1xNGHYgkojCeTto7Lm6FSkJVYI5aUtZd9Y1BbE/daxgejstYEgzriZBKlLRitJdwiX4AlZhwDNwZ9SNwpClcDJ11VEEt9JNa4h769eA36Nqb0nIbdOtttYlQaSYHYqzKmKzeSKyGo7jE9v49A6Avmm7SL71QryN6rIbxAeQ1QkFtgXvfqH28NLPdrYkfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZEPcOEyiBY1qHmUhYPn9S7xNil00XcCMgXENKNpCVT4=;
 b=Y5DvxW5RPXe6belzB2RjjwifcFai2sRgXGwIvJWZ79r6SLTFJvQ68VZT8lGQKzfVexzI8lbtQn+gei4GuThMhTMxNOnqgnl6zNCBy7rgJCCtgYHWM/pl99PTvx3gpTD42M6Az9Zy5yCiShPaa109oJbHHWtZ8gBQi1anSy0bjWEkJDQ/Obxd1ShZpXViGPbgV3EGtGxat/PO+T6/GtHkF+PvFkI8R59guyKQFEbTM8oUTFa0wmAvUubQWhkKXWTbBiFW3Dd6P7C1BFhUdM6stypJKS94V/EpRdLGcMLiyTVfSMkRKLFjl+XhukvaHaiwJJbCVVHTkKsV/P/P+sFtdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SEZPR03MB6666.apcprd03.prod.outlook.com (2603:1096:101:7d::6)
 by PUZPR03MB6187.apcprd03.prod.outlook.com (2603:1096:301:ba::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.6; Mon, 6 Jun
 2022 23:05:42 +0000
Received: from SEZPR03MB6666.apcprd03.prod.outlook.com
 ([fe80::9129:13b:1fd4:1961]) by SEZPR03MB6666.apcprd03.prod.outlook.com
 ([fe80::9129:13b:1fd4:1961%3]) with mapi id 15.20.5332.007; Mon, 6 Jun 2022
 23:05:42 +0000
From:   Teguh Sobirin <teguh@sobir.in>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: [PATCH 4/7] arm64: configs: add Odin support in sdm845.config
Date:   Tue,  7 Jun 2022 06:05:19 +0700
Message-ID: <SEZPR03MB6666FCEA1EF51815F91F40B4DDA29@SEZPR03MB6666.apcprd03.prod.outlook.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220606230522.107428-1-teguh@sobir.in>
References: <20220606230522.107428-1-teguh@sobir.in>
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-TMN:  [PuIvThooB8c8Gi+mbZ4oM4xpzFWQEHO6]
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To SEZPR03MB6666.apcprd03.prod.outlook.com
 (2603:1096:101:7d::6)
X-Microsoft-Original-Message-ID: <20220606230522.107428-4-teguh@sobir.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0cace23-3c71-4ea7-4c3c-08da4811140f
X-MS-TrafficTypeDiagnostic: PUZPR03MB6187:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GedDvfWTiAJqRxqvgJ0toMSegaQUln4wS+yOVcK0xnmQOpB0yFHAqGKIxnK8lh6END9XEQah9JOKuBzQh5P3V5w4uVYlwp7RynWfV0lSi4V2C8tdOnFnTSYwBN9aCZUmvYHtOX+CssNxTPzMcCgzDUheEqHfjx9unxCgKCB/x1NML7Wru3+ENectaVt6fvDWQ8Jyw+vmxrVLZ7xWmgui7HjE1PAAPvJf7lbdTWgy+xs3zNKJlp1CturRMBqDnNn4NUoslOyOiIAWybVHRjxVnZSSYEj0bUPFuG1QXbcKTdxbKxoRj7/38/DvGwYRTnwlZicYETRVIxpM7EzqWLaFbhmnQV5EWIlsmUx7VgjPM7aRM3RVB3J18GF6Ge6g/vV5mir66fkUidYmSk2+gtX94qfJcMtc6cme+4PwFiT8kpWRnsPh/zP37LG/3nEsXEmK176Ipo2LsGTY3R6VhHmhcyBJRZpXdH7aywcfK5JVZEa5w6mTGWNIlDFMaCRndaWQFzD5SIFnY3//CPuRH07Q1HXLZbrdTKmUQYzZOv2d/ireIjTzi98+EeEt+QkrFdzXoVq0t5EosfIQ25fgUEap8A==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lcRkZfb3ySBrMqDf3A0RTV1lZl9hL6Hp80N051SFEA7tqKEdnWEB7j5fbz33?=
 =?us-ascii?Q?q5kvYI7zIQR0KPArDyXbtGxtT9y2a9Y+R/yMZXMrxHbCk0wm9gTvVB7MEoGF?=
 =?us-ascii?Q?rNDyfkB6p8pOEu390RJibfGlsWe8v3BnNVtRRFyzn5OcjosEfDra+0J15asP?=
 =?us-ascii?Q?wfhAPVwXil0nQCQKy4wtoYODHJoV06JnN8LBXJ7IhzLa4pTk/MpOtMkRiykc?=
 =?us-ascii?Q?RS+UlPVmOxm/cpdWw/LkSZwOOCyiWDaeQupZpyTYyaYz/VJ4lreCCTTVEadJ?=
 =?us-ascii?Q?+pT9X4snCzQus8OVVKmtCaubmghcJJnhONgbdiW29HcoODVK4cSl8YpIMB5w?=
 =?us-ascii?Q?LkQ99LIlC+fcwiJGfiBCMt2Z7cJElRx1XeKdMJBIGmWn5koByfdCgiY19W6K?=
 =?us-ascii?Q?gE+jgWVxIlsjaqS/yt8sJmbVeaQN4uXaaJVlG1BUgLeQsQXpl1qmdE/Jb6aP?=
 =?us-ascii?Q?nNIsAyXZFas/POVm/DP6slZALTwUMkKmlC5Wg4BbI5niUm+bppTI/E86B7XJ?=
 =?us-ascii?Q?OJ5+8m8xASHMiol+IvbK6JoawENwCYBnrcoXHghCLajUdCBGtcr3tR0Kb6DP?=
 =?us-ascii?Q?KYON+CM2OqNcB2CJYoE4+WX8uZpD6+nZQoZeW/YfN/yWd+r4/B7leeusNT0v?=
 =?us-ascii?Q?+ErqXUXnjxCNj09fI+BU4C5H0kCLhCsCc1n9VX3OUizq1Kq6CpHbx09lsUd6?=
 =?us-ascii?Q?9InS/gPf+Dozyrt5Cnu8fzIWOExA0W6XBea0o58vggTCVrz05pxLdKZurSG0?=
 =?us-ascii?Q?U8N78KFeOzZyJV6CJHUW929y89FiaeHRebggDGppnJEib+bdRFllq0n6ty87?=
 =?us-ascii?Q?YXmyEX/y1ww2FcnJZVBLPn2lC1UEB1BvzbZ6Yk0MqafiZQSZd9mA1KwlB6sA?=
 =?us-ascii?Q?00QaAakbStRhstColFLsG9K05/VrE/jpiq9a3pEXAxWmOXpIyQnyoPlOJ088?=
 =?us-ascii?Q?xRyBLxR5Rt57PGuxeJeouebcqRbC4VieNp3lQNkGpufeIFMf7a2QSbZoFu7+?=
 =?us-ascii?Q?jmg15wsANE7i8Z4og0P+dfwTaYTc3jjUwQNYri8j3tvXgBAjWk3knV+DK2ZA?=
 =?us-ascii?Q?rk9df6sWpULaLTJYCNhjVVjdOu+1qN0+jtAE3tZldDyaCmZor9JwUUYwZQLr?=
 =?us-ascii?Q?6kHN3wnNRhTxhY1T1srm66wM+YqJThoFmj0c+Zl7ZQemhRqzv9yA0+1CW3bF?=
 =?us-ascii?Q?LL1ybu6AnT2FnOeTL82zckIpg7xAO2aNn9pkCPjJxEEyv7UVlm0XEdFhMIJh?=
 =?us-ascii?Q?t0tywSkVPSrOxqgQPqT/TfJkm5Z4XW/ticUMwYWYs509JyA50Ol4UwPJcwg6?=
 =?us-ascii?Q?oacGRDTHtOrZWpa/Eskgvh0LUmJf/KOvfQ+ZQ/W+tH6XwnlIrMCr82irOrPk?=
 =?us-ascii?Q?sQMsXKsxm/myky0Nq8KJx/lu3qO1wZwFNkaK+9k7DQbuuJBFvQ=3D=3D?=
X-OriginatorOrg: sct-15-20-4734-24-msonline-outlook-c0b75.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: c0cace23-3c71-4ea7-4c3c-08da4811140f
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB6666.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 23:05:42.0150
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

Signed-off-by: Teguh Sobirin <teguh@sobir.in>
---
 arch/arm64/configs/sdm845.config | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/sdm845.config b/arch/arm64/configs/sdm845.config
index 2801d2535667..eb0575ad5d4b 100644
--- a/arch/arm64/configs/sdm845.config
+++ b/arch/arm64/configs/sdm845.config
@@ -19,6 +19,9 @@ CONFIG_SND_SOC_TAS2559=m
 # SHIFT6mq
 CONFIG_DRM_PANEL_VISIONOX_RM69299=y
 
+# Odin
+CONFIG_DRM_PANEL_INNOLUX_TD4328=y
+
 # SOC
 CONFIG_NR_CPUS=8
 CONFIG_SCSI_UFS_QCOM=y
-- 
2.30.2

