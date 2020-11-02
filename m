Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 134502A2AA9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Nov 2020 13:27:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728484AbgKBM1x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 07:27:53 -0500
Received: from mail-eopbgr1300074.outbound.protection.outlook.com ([40.107.130.74]:44858
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728359AbgKBM1w (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 07:27:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bt6U0uVOg6vRtFWkh6ovxdA00lYG9jqlj7/GT9IV798and/9ZKpWHXJoAbRd67hYy4apPwivRP+avorY1NvxZYcQqwPYJEvaNjsvo1IEkBL9EKPu/2C/IvcY4XV+EBKtUqH0rx3gYRZN3a5a5raxmqg0a7357m+mw/GPnRr68hg0aoRutUvvCnIf3YXAB4Ddgy3PLcP41McgtF0Fr5vdGhXg9SpzbNRcgdU1mwy1lo4500+3HXg1/M3xz74kWPbNaQda7MbVzi5XkdbjbHnCE+9i5OII/aiDnsSlZTh0QPYM58CDsdgK7t5uSt6LfD5YwfPdGxIf4M88emw2TZWe4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVHzbeI/KEEVJb3fByHYJfrYeAfRYsjUbGs8A7Z2srY=;
 b=oCcN+djIxEWB0miIIj6XniNjXl8/1nnihsFr/bjLRYX+Jx1S0BZrTAEv1LEGtcBvlGUSGnkX8FKGHYmemhfcvDQrbfAEhbKsoFBgFQ3uiuM8JKXRRR+ZkbMdMp37ena/qbSFFsXOyh1T1bUJMKxWmvV99w9viXk5oEnA+xemhkWv9RhlANsjEW3Z7bro53i4kienZmcah7xgfP5BleVevQKKgLzWLMvpbkTS+Qz1BO9rN+NHUnrIZfkkxjkc/8uZuo7/hIiAnCeNfMNHn1NZGWAmGImqPpU1wY+ArThvNkc8s9C3jmTr/WuN+WGAUo45sqGXEyMPV/SnqWqFBpx0SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quectel.com; dmarc=pass action=none header.from=quectel.com;
 dkim=pass header.d=quectel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quectel.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVHzbeI/KEEVJb3fByHYJfrYeAfRYsjUbGs8A7Z2srY=;
 b=AbgnE8WSSvHpk7xtJSaKatgNVJMf6q/jEYv3Fc4SUolvfHciheOjGu5HfB8t6hOQ8hN0mDc4bx8CZ7Kpxyplbqa0XGgGkK2ft7gSVvk7WWn/DGaB7WSWHrfpmrQ4+HfCCaCeNBp4dlsEghga760s/fl5E1+eu9bPUIrfK+6iqQM=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quectel.com;
Received: from HK2PR06MB3507.apcprd06.prod.outlook.com (2603:1096:202:3e::14)
 by HK0PR06MB2225.apcprd06.prod.outlook.com (2603:1096:203:50::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 2 Nov
 2020 12:27:46 +0000
Received: from HK2PR06MB3507.apcprd06.prod.outlook.com
 ([fe80::94f:c55a:f9c8:22f4]) by HK2PR06MB3507.apcprd06.prod.outlook.com
 ([fe80::94f:c55a:f9c8:22f4%5]) with mapi id 15.20.3499.029; Mon, 2 Nov 2020
 12:27:46 +0000
From:   carl.yin@quectel.com
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        sfr@canb.auug.org.au
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com
Subject: [PATCH v2] bus: mhi: core: Fix null pointer access when parsing MHI configuration
Date:   Mon,  2 Nov 2020 20:27:10 +0800
Message-Id: <20201102122710.23406-1-carl.yin@quectel.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [203.93.254.82]
X-ClientProxiedBy: HK0PR03CA0102.apcprd03.prod.outlook.com
 (2603:1096:203:b0::18) To HK2PR06MB3507.apcprd06.prod.outlook.com
 (2603:1096:202:3e::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (203.93.254.82) by HK0PR03CA0102.apcprd03.prod.outlook.com (2603:1096:203:b0::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Mon, 2 Nov 2020 12:27:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b94d863f-c403-41e6-da98-08d87f2ab3f9
X-MS-TrafficTypeDiagnostic: HK0PR06MB2225:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HK0PR06MB22255EA247959A3654FA275F86100@HK0PR06MB2225.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2f7buR906Cjj5QQ4MpFjZm+KTI/QcUa+Xy1P5sZz96aGmmTlO789d/IlFx5pttWMzSP97WGy3MjxkJnpR+Gcj+EK4iLvQmjqt6qXE1nsFkdqO1y1jT0fK/ezFYmRP0uUjEG3gkUGArbNLb3QfMhpea0OeKzoteZiU0c9oPvHgBdxEpJeg4RSQmudM9u685T6PA8tLWt57aI4YBymcfpK37R4tHivPyKDfBlbKrVsAFAZtf3ZkcBY09t6ORr/mHekF8y5txe33vJFKVy8LTQO9EeWO6RP65K0CqLWE/k0pfbKzPNwbznyqvaUASOTG9bqQAAhcVxbHr/2I9UQHGBV6RwN4T1Nq2tM9GjKFu/PRioHyGCG6t00lMbO8fjMA4/U
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK2PR06MB3507.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(136003)(39860400002)(366004)(396003)(26005)(956004)(69590400008)(83380400001)(186003)(316002)(2616005)(66476007)(66946007)(478600001)(66556008)(16526019)(4326008)(6506007)(52116002)(8676002)(6486002)(36756003)(2906002)(8936002)(1076003)(6512007)(9686003)(5660300002)(86362001)(6666004)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: x8xB+mrNJI0IBjOqgdiIOv0C4R4/WINxihw4pgKGfVGOR88FjNqmeYzUumZXR7+wW6D7q/j80M0tj2ZPjOerG9B/XdVIhWMXhQmqczC09EXxov7fz2qY5RprMAI4k0bMwSqCCiODTLpHvPBeYXXU2k0U6UWYd/5B4rL/U1ASRFxtLfUG+z6pHYntlRobOeszNQ9vfwDXFtzMr2FBfDUHDc9g02h+Zml/Iu+PZoe+NaX/yMv8yqItrtw3LvVPDiPrlHbSIgqfU7AgSrwdUYd8VkgqvhWGgBkAxDmMcOQlf0jxYzUsI8RvwtgyG2mlb4Dy/qj5XSOyhdeJ1gX0n8SARRAA1EQSfllfZEdVsVhLnozi5wrWd1xWpJR5tWXPichEukXMvwDDELk//Xwkj5r12v3W7oUTpij6ZxLP/lbbMVkUSnEIMDUY1Zfbd19Ekwh6cdEKXPtCCLiOdT6lPWzrJCQo/E80NXffl3wzgJlU0Ss0jbg9vV2JE56PbarMG6JTQmoun6+wPiK+S0r6WmeXJHwL9RUYzbddRTZDgVgEW1VNjF1YC/lcB24NyE/oIHqltQRNi7/XRVo1so9hmPcBHQPJtbVYfoyP1mGK8hc8QQXzJjc0n1RH54vohO080lyKIknCdi7m+wQNVK63yIftjQ==
X-OriginatorOrg: quectel.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b94d863f-c403-41e6-da98-08d87f2ab3f9
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3507.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 12:27:46.1133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7730d043-e129-480c-b1ba-e5b6a9f476aa
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A1NS+MF5uP6GDTBBdTVA2ap//IRqqjraxU5ZM0SwP+pKnL2uHZ0t0LfDHx6YljM+zXA5QyUR6D9y+WMCW4WwiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2225
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: "carl.yin" <carl.yin@quectel.com>

Functions parse_ev_cfg() and parse_ch_cfg() access mhi_cntrl->mhi_dev
before it is set in function mhi_register_controller(),
use cntrl_dev instead of mhi_dev.

Fixes: 0cbf260820fa ("bus: mhi: core: Add support for registering MHI controllers")
Signed-off-by: carl.yin <carl.yin@quectel.com>
Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 0ffdebd..c6b43e9 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -610,7 +610,7 @@ static int parse_ev_cfg(struct mhi_controller *mhi_cntrl,
 {
 	struct mhi_event *mhi_event;
 	const struct mhi_event_config *event_cfg;
-	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	struct device *dev = mhi_cntrl->cntrl_dev;
 	int i, num;
 
 	num = config->num_events;
@@ -692,7 +692,7 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
 			const struct mhi_controller_config *config)
 {
 	const struct mhi_channel_config *ch_cfg;
-	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	struct device *dev = mhi_cntrl->cntrl_dev;
 	int i;
 	u32 chan;
 
-- 
2.25.1

