Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9426553F262
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 01:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235216AbiFFXGE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jun 2022 19:06:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235225AbiFFXFy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jun 2022 19:05:54 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01olkn2035.outbound.protection.outlook.com [40.92.53.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5751A36311;
        Mon,  6 Jun 2022 16:05:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/q8u4hj0vyhzgxsM7n2Fu4qkigzW0E2i+9+lgDVXvodvfjwYWF5C8/A+jzjtMvwt4nLux98MEPNznOX3HHh11UnD9cSA7dmO/usoZwvT/mHklfeUr4x0FLqg1QCvaod3veQZDPm5jg8Bkz5qzdTdORGFayeD7iD34s16RD1WW/KcvKez4YKuGBajv1iqmuYI8Nlwoa6YnxdOwRUXhJeCgiL9zdDVTvTDrAzMJ/zP1FvjnRZ+IyFcQXh4NSUEAXgjPr0yZ2Brti91UARurAXstRvbMHb8ofjs8ghby4UK7LsTze17e7Y/Lcze95wCFx+G9W35/Q2l+l/EILMuyn5WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsc0VrvXp8lQiWtzq/OdxcVCtqOCh/nGPoGjKHO94OE=;
 b=Q0QFVTIFt8Blj+Wd4lJicFDze6CLvhVInP6XjYHMDGDVTEMpPSd7ru8gKI6RM+7/Q5jdRLZNE8NhPbFy7zOso1IqT3h7W6bSky5gD4a0+Bei6qU2F+DusJflA7hqZuS0M/IbHsW+0oF5D66vtpWq/FfqBmSL0vSglCqmTVvqORpV0+53semTT02W00URgqE8eIc6zMU3fbwf1STF3J44XOgzsPNBnrhxS6IzwlzBnQNANK9FhWlnudPrULjqW+MWpa8B3y8adUjV2Y0czs9eYzRlAgKs2s/CYN8KxB9a9VtIbdEI1Nd38dxZ/b0YM8pDNSFz27D8gfIrxAnQaoWUUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SEZPR03MB6666.apcprd03.prod.outlook.com (2603:1096:101:7d::6)
 by SG2PR03MB6263.apcprd03.prod.outlook.com (2603:1096:4:170::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.4; Mon, 6 Jun
 2022 23:05:49 +0000
Received: from SEZPR03MB6666.apcprd03.prod.outlook.com
 ([fe80::9129:13b:1fd4:1961]) by SEZPR03MB6666.apcprd03.prod.outlook.com
 ([fe80::9129:13b:1fd4:1961%3]) with mapi id 15.20.5332.007; Mon, 6 Jun 2022
 23:05:49 +0000
From:   Teguh Sobirin <teguh@sobir.in>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: [PATCH 7/7] fixup! arm64: dts: qcom: add support for AYN Odin Base and Pro
Date:   Tue,  7 Jun 2022 06:05:22 +0700
Message-ID: <SEZPR03MB66669DF0DECE022290F7C9E9DDA29@SEZPR03MB6666.apcprd03.prod.outlook.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220606230522.107428-1-teguh@sobir.in>
References: <20220606230522.107428-1-teguh@sobir.in>
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-TMN:  [Agp2LaduMVjSMXipo9OE0pBR1/irvPAH]
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To SEZPR03MB6666.apcprd03.prod.outlook.com
 (2603:1096:101:7d::6)
X-Microsoft-Original-Message-ID: <20220606230522.107428-7-teguh@sobir.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6fefbdb-b2b9-4a83-9d09-08da4811166a
X-MS-TrafficTypeDiagnostic: SG2PR03MB6263:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aAi1bnKdmy7H8ypZNY50Iv1o5k9f+Txihh3dJ4Yfy8lJZMIydYoFuI2BjPmV8j9etzp81fv59i41Jp47YBmryBC/GUbevnaRDybx0Y0NlakXYwGeAF90S+VFVUGJi3GBC64Fw24+9gn3yaL77pCqCFcRTnvsvlSF1/UwvvBG/lfWchkuVPa7D+9ZljXdXk5uunUrn9cmWAE8hs4U9PN7NJPzqDq7WEamtF4cQt/LmPoip+FhqlXBJVPSypR5i1HTP80Q42MLEeovQ6jXWPm9xGmIgMq6zlxrV8Hu7+tqiE0LT7MDSivgh0dc8WqfBdbE8Q7v/TdLwAfzYtQllFpGUq18ltLkW0xjbvfuJOehYiao9T+aHQMdJbgkDOK1sM8/p958cqmHOi8n3kZ6+kST3dzCXxuRz+4yGAfGLb8kFpgKdpZqeruis2ZgKtKVZLU8yKoRXiN87PVJ4EGuXtzBK9h359j0/ZSTj7gbtVH8nYN0tFa/lHcMzXBON3XN41YxeSNOUoZ4XwVJcLMRsjMGBY3E0YDMN9ZQ6I3kj4dCDDNnwHgTlmOpAxLIoj/aG+VtzESyFAtLzkEXqn1kJLNGgA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q+wTk4ogPjEbX7VFFluJPwW+sdqxPzcSQWtndHVNN5qThHPH03FPnzCDWr4K?=
 =?us-ascii?Q?8f/jm0UtPiGo/8W65qdhgIPXN0fV4T4O+bzbk8bmVomCKVWwVf5hp9EafkXR?=
 =?us-ascii?Q?7p5vKokgtOdFJhhEZB4UkDVDBPQ6MkHDzrCnoYtNz29AxhPeDUSSx0vSjaDF?=
 =?us-ascii?Q?H7AzgNVisIZAps5P8hBoriGJyHzAtO0ZdEwwvfC/ReAE6jodFR0iVXzGaQE7?=
 =?us-ascii?Q?hAtYRy3iCwx5idSL4xBs42GcC/utGxL/UPadv9aSCPyBTW20Ue+FRtTiMcqT?=
 =?us-ascii?Q?sTwWFwtmy7xdPyPtWIBt4rGCZxotFGrVYNwvyek+Q8pP28ZMGD2LDFsguV9O?=
 =?us-ascii?Q?7fxiDXvBcjTDVAkhHKj3PBXAinaw8PWl2PqWWRODY83RWefdAWL8nUHHaQaT?=
 =?us-ascii?Q?H4cc+7j0ruFnA0rMbJCmKVDW43b1AL+sXehpkeWk7g8cvb4aH5l5DCiU5mow?=
 =?us-ascii?Q?XyPSfEhi5dAS74rmjInkrRe40Ki4AqOr5lDAQZMfejoOaYuKnyi0vGmORIQ+?=
 =?us-ascii?Q?IfZWTtcL2hyq16Y+O6uqnu6uL58BWZJgVqwyIphzOBTihxDlkAwY85XL5gfT?=
 =?us-ascii?Q?NcetdxuhytMsoqF0vWCFFEpdly5DrElA2z8zJlko7UFG9JECTBOcaHxOIbD7?=
 =?us-ascii?Q?VWqnz4xE2ONSDyYiQCrEl8ozblTkPN1BkxaOpRgEGvTUIQbCaUUZ3Rb3kuy+?=
 =?us-ascii?Q?Ocq51BQlypvi0SkmKLaXeopG4/Pt0kcNFMTcNvr4G+szGa+TSz3VKA7MLiD3?=
 =?us-ascii?Q?ouWYQyVytD787BKYFJQNymQMy3CmGw58qfrXb+IUbvRH4LFay02vNpvHfPUM?=
 =?us-ascii?Q?jf++vkC1ZSsemIqTKIZrmYkQfChObVgUxRWaOvK2TxdWJcwb/HaBm3hBjc1j?=
 =?us-ascii?Q?CorcmWUv7KTSid5/5ywaTyvaI6MsV765mqwUI029yNRyDTe6en2kDVyG61j6?=
 =?us-ascii?Q?5Wy6KKIdSwefQgUwlesLip2Hl5z8Ps1TJyCW18NAzbAXTMWXU44xEDDzyQZd?=
 =?us-ascii?Q?O6gDSS3OOSaqGZvfUsCMuHO7JsEPMRPosNuajFtgl/iZ/39ma2Yq0L6CtYfK?=
 =?us-ascii?Q?qoFUWlyT0Gfd1nNr3IeKwMqGxJWfWLkAZPMThpLPzhrKiznc7Akh2s0sQqsz?=
 =?us-ascii?Q?ft9Q3Opt/9MuxUAMVraTnkJyq7EdTBzvTCQiQK/9rf+YqvCLf4VXm1Aa6AD5?=
 =?us-ascii?Q?rBQzqKk4HA2dwWWKrmwQO723rfpHVui7L/RC/LpM4psvODF+KHVCBxvhuEYK?=
 =?us-ascii?Q?Bw787b+7MJcYfn23KryINCtuevUi4jFtV23m7cHvOlAt9caSUqgTNApRFO0i?=
 =?us-ascii?Q?X2euYoInxuBoxpydpuV7jKNxhNir2bzExgIagZ0TitkWqWN2gf63hrN77LdW?=
 =?us-ascii?Q?IjAgpCXoj/CF1sSt2WIm0ITzAxj0baoGAxjzpq2j9Rw7o11l4A=3D=3D?=
X-OriginatorOrg: sct-15-20-4734-24-msonline-outlook-c0b75.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: a6fefbdb-b2b9-4a83-9d09-08da4811166a
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB6666.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 23:05:45.7825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6263
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Teguh Sobirin <teguh@sobir.in>
---
 arch/arm64/boot/dts/qcom/sdm845-ayn-odin.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-ayn-odin.dts b/arch/arm64/boot/dts/qcom/sdm845-ayn-odin.dts
index 545debd7c275..8deeb375bc1a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-ayn-odin.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-ayn-odin.dts
@@ -133,7 +133,7 @@ vdda_usb1_ss_core:
 		vdda_qusb_hs0_1p8:
 		vdda_qusb_hs0_3p1:
 		vdda_mipi_dsi0_1p2:
-		
+
 		vdda_ufs1_1p2:
 
 		vreg_l1a_0p875: ldo1 {
-- 
2.30.2

