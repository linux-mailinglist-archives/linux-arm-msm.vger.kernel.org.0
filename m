Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BFA453F25D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 01:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235231AbiFFXF5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jun 2022 19:05:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235217AbiFFXFw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jun 2022 19:05:52 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01olkn2010.outbound.protection.outlook.com [40.92.107.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28DDB36146;
        Mon,  6 Jun 2022 16:05:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5y1GXK2PmxGx2bOoJjsO3FrAZ8mlB+QX+1ffKRR4WCA6/p0LqnzsMKBznasT7vN1JSCm16ZlyCROvV3rjl+FcpLq3ZxcjK978q33lmg50/Cc+5vKNlZs2oOK96He08Td2ns+T39qWKJ8XFIj/XOnFvfmXAbEafjCkMkXfwsh0+CR0CHHc0BRdIhQdOPXN3cEpzOAUl26s2dESlwukRvAC9PPgIs0cZkkHwldvC88SNLoMxQ1o5rzipovc/18XoXbrzVY2QTyRYaIbajlutjibTHXRctzstXrCzONcw0qiryyLsxltJl5aRi3Jw/XHwdf5MIcnSboWipGOBzEIj9ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Drn8moffDQ3oNTqLy1KQ2Ql0DdWrq6jJaS6H7Mq0UWA=;
 b=IU3gU4DobQl8Tno4Fo1nlEspqWmX0HP/3+jTG89OrOmIHySG3mh4bl3L4HqgugeqluoL3F0kZh5AsaRqJb7M+0I2KvHkqzeLumCX8eBLC1GJ2X8Jp1vv597GQd0b7004DS8J4AbTSDOhtie5Ftxnu4fHwR6vuQozpJ3l9SLSWsrK/tufx3FxK72U7xERkUdmkrl3Ki4L84sX7CXiK/dL/JIJ8a+H9DdbmC0GNKhi/PWyx9Hf0Bt0ITGJ+pbC01iPXIbdFQOZYJkQT82o9xj7vcYrsmtu8b0PirA3IcKrj/rlBIAUfrM+jMUeb9XvIpkUcpvoJJR2p/QfRLdJSlmWGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SEZPR03MB6666.apcprd03.prod.outlook.com (2603:1096:101:7d::6)
 by PUZPR03MB6187.apcprd03.prod.outlook.com (2603:1096:301:ba::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.6; Mon, 6 Jun
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
Subject: [PATCH 6/7] fixup! dt-bindings: display: panel: Add Innolux TD4328 panel bindings
Date:   Tue,  7 Jun 2022 06:05:21 +0700
Message-ID: <SEZPR03MB6666045033F40C7BC524AF88DDA29@SEZPR03MB6666.apcprd03.prod.outlook.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220606230522.107428-1-teguh@sobir.in>
References: <20220606230522.107428-1-teguh@sobir.in>
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-TMN:  [LWKNGc1BWSWtj2Nk6JsrS6P4qrPM8ZKJ]
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To SEZPR03MB6666.apcprd03.prod.outlook.com
 (2603:1096:101:7d::6)
X-Microsoft-Original-Message-ID: <20220606230522.107428-6-teguh@sobir.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79b1fac6-fc6a-42ef-54fa-08da481115a9
X-MS-TrafficTypeDiagnostic: PUZPR03MB6187:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u/MouWisPMOeHffrZtDT4FWk/HHWqzfDST6pbjT2WpfJkMhzaVEg0rT79JtMpMLYj+mmE+UBWNQhfyzqntHHHwcZF/kDP7sqdEuhXOxFA02O0v7pyCUaNPavy49EvbBrYGh5aWlJxy9Z2Aki2HYra0fFxRPLq9A823jWarq9HR/q9bF5MhGnr+6tsm/ttxm1zwA/3nC90qpMdKWTNOE/rlUEvA9rid/Dsvh9zAEY00/2Qv+YcX6Ct65NDi3wNiYvyqLEwaf/jdxNQoKAXfno42Ha2b1DJuWEINZBnt7di/avZX3b2cmfzj5LWHdGFr6cw0914F/EEUADGYzppYjPQH/QJUh+UKS5QHomFUnW0vtJKbZnQxRhuKHzpolUiwFvVoir9pe8R8x/5cWlMeE92dYQzuneo1p+j1GoHHlTcOLeMDHVuO51J1xKlyP3DLIHA/NYbZtHa7yaEMEJe+KA9D84lfVO5OS/MGgaI4ZZ5Kaha4rggYCTO2rqyfYAtgczVUo1DORbtC6RSbXTrzXkafKICoWrXEKzfTS/aXstKYBCYwvioxr2rlJr21YLkGTyALQaW/QrNxKaq+AtoMnKHw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h6sPLLcN6tQjcFnNXkm9O+u3HAFr9wzrq5qbQkopIEpT8Q1PhYSxcVHyuAA5?=
 =?us-ascii?Q?1C7RyxNQ/1WhCP3uTiYNLeTbeYjKTq6RMXnbuDZPfLSorm7QVE8zR8bZ+PQB?=
 =?us-ascii?Q?m2G8ZYhSvaoDnKSDLsD8i/7b0hmQ8Gx8AO2RS9GCRmqTj6J9anqfjRyMKEjA?=
 =?us-ascii?Q?bL4Y9Q1Kk2Dx5cW+/CelNbE8pah5XQYIbi/MEGNIWFQgh+rwkjpC48sASjzj?=
 =?us-ascii?Q?wA9YudmJkrnnB9+mB4jMLKiQPcq0Z6bhJNqrOgvS099UVJ/WgArJZQcdpFqI?=
 =?us-ascii?Q?aFJ5cUbjUSZ7We+DKtFIYIkP+8ESLYgMmU5347UNFX6FluK7DtoQFzMTU1hg?=
 =?us-ascii?Q?aR/m2khg/45PtbxwTRx2ZyEp0h2EM3Wk3jf33uKitnx5urhfX7ZN2gyhNhnx?=
 =?us-ascii?Q?FW8hlq23l8GSfwRUEoCfzHwyFAzXmK8/Qxyjv/icHkvReBEObZmTIPTu7RHF?=
 =?us-ascii?Q?bdZSRz2izM65rqFlWxp/jsB6aRg8Qv9v1UnJj7C2xnFoopM+niYz0BUkx+ol?=
 =?us-ascii?Q?pi+R6a/KPgGRpLbH2g9yiUR4HSRqfYBNHHF3OcmDygAPryVb/WX16K0gRhKj?=
 =?us-ascii?Q?4aGFB58a7MyrM8GfiGktIgL7nvr0QceaOMdlqJKXXMFfKIOtqUo6/el8hn1i?=
 =?us-ascii?Q?P7leXcaE5dcBgSHWGJIdu1GfGutn184bUReYiSYlEe4HEPVrINaO9pm18CO0?=
 =?us-ascii?Q?EGmNrm4hHLldmg32sC7Y95ALupcQ7CPLMD4w+VlpbxUsWrGdA2V27P+fYl9s?=
 =?us-ascii?Q?wFIqpr25WTaODmdTy/piIbVUimKzonKBzaBExRyJJKM563Gg8euVUjjrhdGt?=
 =?us-ascii?Q?ZlwecLngY4MlAWg2Uq4qmuIv3RzQKTdLlbkVb1OeF+5/2zOqJ4d30A4hE44M?=
 =?us-ascii?Q?+M+lgmpP3HAYCpi0Kp6i68/NFZnBdivJYgsL7bN8cIqGi5XRJgbwAN6g/Bxq?=
 =?us-ascii?Q?FJnlCLMIhgrlMY6w6CDHtKq7hSJShmZUzSAIDs5FDstoiSre4dsajWBdHr9R?=
 =?us-ascii?Q?2E4bqW7IUrwSqiOibg7uZ5DA7SmFRccgLxATHmra7a+SVNHZporylWMAl/wk?=
 =?us-ascii?Q?A3C4lLNW8FvdTsMIocdsGtxseT40G5K5tTPlcFeC+jdDXeWwBrPsXscwgq57?=
 =?us-ascii?Q?/Ce26eWvv8Z4HJrb6eY/GhZOsER0iHQD66v+Eq8N7eOAYwTX6MkfelPveb44?=
 =?us-ascii?Q?NBgZ83cpBfsS8GuQTjB5pgk1UblXSYy3sGxVYkndk7IavuzHgeD/wif5pWeN?=
 =?us-ascii?Q?/4bTMQm30uss+D2ruuJ27POXo30PGKWqpRxqOenWSaZ/ykoeFLF5dfKNb4u0?=
 =?us-ascii?Q?+VZIVkvhi31xqx9hderVchlsRRUuV5NWDyii4iDA9/9j55XZGA7s0ZGrr2x5?=
 =?us-ascii?Q?LcWAjULMM17vzPI0s+A+eFPFO5kH2BOKJa8f6mLXbcybxoBjMw=3D=3D?=
X-OriginatorOrg: sct-15-20-4734-24-msonline-outlook-c0b75.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 79b1fac6-fc6a-42ef-54fa-08da481115a9
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB6666.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 23:05:44.5471
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
 .../devicetree/bindings/display/panel/innolux,td4328.yaml         | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 Documentation/devicetree/bindings/display/panel/innolux,td4328.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/innolux,td4328.yaml b/Documentation/devicetree/bindings/display/panel/innolux,td4328.yaml
old mode 100755
new mode 100644
-- 
2.30.2

