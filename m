Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DCAF53F25F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 01:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235219AbiFFXGC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jun 2022 19:06:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235222AbiFFXFy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jun 2022 19:05:54 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01olkn2035.outbound.protection.outlook.com [40.92.53.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E62F3615B;
        Mon,  6 Jun 2022 16:05:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FqOtti/JsnFP8wCtpZKtBHNEPyXjUMsowvFz13adAXt8wMpbnWan3Hakd978eVNIMBQwp0fzGGIOszJjQ760J4FPwm9HrvNNMRMxJQhidHoTtk1s6s+MY8IKEC8YwEUdiWMRx239y3P8YHj0SpMlV3+3En3JZrhokZPWLhFbrozS8d2tvEYOpkIWDNdn+212pZoeEPYziCFuYeuqqch3wFiqjb/rXyqSHopfiyGl/kKZBo9ysts0jsKyfA6RigiT53G0uQs+lC1EhYMwIVM+dGEcZ5Pbh8UO0RaNJFjOCu2oEw7y29Nyp31ww06kTcBVCYNEoX8TVYQS5wfv1OrQPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vE7S0AFd0tEeN0qZMCo2opOAUbZIAaJALgZaWn+wvOg=;
 b=bdpyYv1fevuOtwAa1sLE0JDizLSeC6LmFPyQdLVtzGVrnCpDttCGNredzxkOBWUQR7p3qQVZkSJBwWUANY/vsCPR2NFB8tp/v+0Kq853lAkqmJrnNI+CCFRyn678gYS1A3FwX+pq5E8zn/LV054TqToQivmkwevmm1/pAP18HtpHMWgrio19e+4yAfoUWoY6COCKq9mI6qC5IfWlFVu2/5+/CoO5jvxQC77M8xrDTG3bg/TW0V5x6C7fwbustntnc4e2Y1aTvZdNsuOuiT5xJFo8Wmoh9u2/kqYahVyPOvUDbTfdncq8nzC5ffRl0XVPTSUq0N+fhRNnullQD46Rnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SEZPR03MB6666.apcprd03.prod.outlook.com (2603:1096:101:7d::6)
 by SG2PR03MB6263.apcprd03.prod.outlook.com (2603:1096:4:170::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.4; Mon, 6 Jun
 2022 23:05:48 +0000
Received: from SEZPR03MB6666.apcprd03.prod.outlook.com
 ([fe80::9129:13b:1fd4:1961]) by SEZPR03MB6666.apcprd03.prod.outlook.com
 ([fe80::9129:13b:1fd4:1961%3]) with mapi id 15.20.5332.007; Mon, 6 Jun 2022
 23:05:47 +0000
From:   Teguh Sobirin <teguh@sobir.in>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: [PATCH 5/7] arm64: dts: qcom: sdm845-ayn-odin: change compatible name
Date:   Tue,  7 Jun 2022 06:05:20 +0700
Message-ID: <SEZPR03MB6666B3A4C6398D73A4CF89A7DDA29@SEZPR03MB6666.apcprd03.prod.outlook.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220606230522.107428-1-teguh@sobir.in>
References: <20220606230522.107428-1-teguh@sobir.in>
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-TMN:  [RaTnwWJdsi2L0R1H3bntzOJlqCccFgIx]
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To SEZPR03MB6666.apcprd03.prod.outlook.com
 (2603:1096:101:7d::6)
X-Microsoft-Original-Message-ID: <20220606230522.107428-5-teguh@sobir.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee935cd3-1141-4cc1-0dc2-08da481114e8
X-MS-TrafficTypeDiagnostic: SG2PR03MB6263:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lxS3ZAQ3Br1AFPSKtZ9BSZJLfrPPAsGWQze9dbTJJ3z/fwhxE5hmiYgI0Oi1rzAwCJyzRnWUVVIPl2XMfAu3UaesPBQ1W9LTor2Fa/8LMwQeresLXEF94JWpFJvCNQ6Gl+0U38kjss14cTPlLBV6KMyAd6I1v0XNb8dogJg4RsyyIhJSvqsQY/69tvLY+WH8BF4xyx4D/IM0oq+g4EkeWXWrxKK+LuWx7JWU9oNNVEuyrttHPkY6+85nGCQ3aH7fLsBGcZBO2Dagctv0iHY57GCOh+oRku5h/KIMgutacllAOIr21rXqgwOKOdY3+b+YlRqgNz9WKjc7tUkFcRfkmgKjsdq4Zra4e9j5UE5lpbucyUQwYYWxEPzS9zSGGirt4Z4jdk5cQRMe73OD+7DBo+B8op0qBg3XtmPzAUBzuPuRaPpF7JB6TWmBzu4usFcpGUOjYmTN1spxKwfB8ECiAVtJfJeVXvyoRkOAp8SSn56deMDAa2Op79w0RCunMNxm6LBiPLoSyZKZzCQA2o+ZVwhaFczGGhkX0n1q+MwQO8pbLoyrTu6Cc4UcAKiXnLFvAvmQ/bVc5bw4feb8e3EDow==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B4Xu0/Rc4siSfumBx12mB0AUaMrZ278CcAyGUDdGs/596tRKCrvplXSER4/r?=
 =?us-ascii?Q?YxB1NDSKK7UrRfWl6SS8ZcF8UUVZUSypgUdW/vPVXsO9eyfbMJik8iN8sTv6?=
 =?us-ascii?Q?voQde7qk4leUrYkEoDO4svBpBtq7DvgM2vTxAcwVzcGZZz1+Y8JUKFG8jhqX?=
 =?us-ascii?Q?voznxx/WZ93iyTmAVd7QJG3b7hAwM/+nl37BLgWHVCIUJ9fVlCpecMZ9dehV?=
 =?us-ascii?Q?9JIqEq7j1eMlTb25miKJFCj24wg8GsDcMU6nYLIs71E98zbhOR3c7FxCHzyV?=
 =?us-ascii?Q?UiZPAISgMLIg77BelMuXOL8jYDYmbAd4b6c+dC9Z3i503HMGsKQHyS6BYr1B?=
 =?us-ascii?Q?bKDiuL5JdBVyLWQszDaYEz4D4wukBacxET10n0hd66xQeIdDcKABSBWAzXgZ?=
 =?us-ascii?Q?ajW9NsbpF+fDvkEa3O9ErM+X+1Pe1m7SqBGnpaEQXSPZpk9685vvXG7UcDAg?=
 =?us-ascii?Q?zrnAgxwH/bA29a9RdfLpVoI5JFTitsvWQV8OiS0/0L6diUInL0evFkHjis6S?=
 =?us-ascii?Q?UVVAnJLiZjlPSkUQA5RFurZITGoBAqyRdsrKuFhZyeFx6lUQ5MriLXr6iFD0?=
 =?us-ascii?Q?SbSsMY2M2rk6rxo3uo/TbrkRE+bnEWK2hcMe6yTMY/Hfxu9QInwZ/q5TGt+Y?=
 =?us-ascii?Q?7bJLGyb+T9jgnDyEAbifZbZVDqOPBb+KSF+4DwpyZWpRYCDbzFYEpHFdI6Sz?=
 =?us-ascii?Q?rYSQFCs3ZoktTyPLG6hcnqv3r5uSKTDOnDNnne5ZqxXjseEOnOfh0QKVbGh1?=
 =?us-ascii?Q?GVxTtxWAJ1DO0x+Zvl51p3EoHFsayxuX9cMchB5tnw+VXRTgDYxwNiLW1Mpz?=
 =?us-ascii?Q?EkkxYHDKrtam18mqmxSULfAZerfl48hSvL9QzJD2l5RgtSlS4I0X6csW6yO7?=
 =?us-ascii?Q?3WqF5jy2QWop8dkk4o2LMkdNwA0NyszFdJivZQKhaL56Kj8TbdsAiDZaFOfT?=
 =?us-ascii?Q?a2YmMhw78rS17bhgDVhyeDiUcOC/c7h8E9aDF+OgfehSzjSoXPFq4XuE8+9r?=
 =?us-ascii?Q?PV2ian+faEb1UV+f6XNlJF+yqtonVuOeRAJ2Fl3A5M+LiwHDxd0DJ+QUyL6g?=
 =?us-ascii?Q?3WaXZ8wcg6JkWyyyFo7zDti52mYkZIna9c/52v0PdbrazReoSMSEVvivSiiG?=
 =?us-ascii?Q?AKfEteHFMKcBXrFPPIkvYciGy1uNh/ruG7Jfoc1PD8YV25JF3/EUNQY2KjaI?=
 =?us-ascii?Q?1KG2XMAc4ul1xcLiQhAC15c5JBkOSH9KmslrR5yZ2b4a4NhxXBwxrWHnfZBP?=
 =?us-ascii?Q?yPUKqiQQ/+4uxnb7I09o2ygIkCLrC6AmcJ1aAFkj2mjCl2L9eET9cOp7SzG4?=
 =?us-ascii?Q?4QjVAhnlbv2vICS4qdRsUT8sB2dX38L1Ujf7uVnnmpG0rMkBoIn6dX33lk1x?=
 =?us-ascii?Q?U0m8Y/EvNIj7P7HZKlV9RB+Gj8sOl18rHy1hj3pWwyqWsiKXEA=3D=3D?=
X-OriginatorOrg: sct-15-20-4734-24-msonline-outlook-c0b75.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ee935cd3-1141-4cc1-0dc2-08da481114e8
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB6666.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 23:05:43.2973
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
 arch/arm64/boot/dts/qcom/sdm845-ayn-odin.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-ayn-odin.dts b/arch/arm64/boot/dts/qcom/sdm845-ayn-odin.dts
index cca43d55baa5..545debd7c275 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-ayn-odin.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-ayn-odin.dts
@@ -5,7 +5,6 @@
 
 /dts-v1/;
 
-#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
@@ -16,7 +15,7 @@
 
 / {
 	model = "Odin - AYN Technologies Co., Ltd.";
-	compatible = "qcom,sdm845-mtp", "qcom,sdm845", "qcom,mtp";
+	compatible = "ayn,odin", "qcom,sdm845", "qcom,mtp";
 	qcom,msm-id = <321 0x20001>;
 	qcom,board-id = <8 0>;
 	chassis-type = "tablet";
-- 
2.30.2

