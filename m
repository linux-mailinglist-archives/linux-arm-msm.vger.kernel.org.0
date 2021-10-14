Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9276642D4DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 10:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbhJNIcs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 04:32:48 -0400
Received: from mail-eopbgr1320132.outbound.protection.outlook.com ([40.107.132.132]:54846
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229970AbhJNIcr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 04:32:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UDOiAPFNctKrHUBHVqU+wVhCnqlrTpHSOzT3NaicHHW+p4MR4KQ7RO2my+sgj08DxcUbeavri4JNpOQPnKvhJd7QZcaKqj9SLG4i89oIyOy0k7oBJ/IZ4HXhnYW/ViNOmTJq/OjMDqhwDzMsVQfAR4lgX5SYNWeGxTVu4w6jogBERj0YTSgvunHkx62SuW/5tabxq+gVbaAdIGVg220jKfLvhVPFLmP2AuNu5p2I6xxCJfVzxNew7aB1BdVRAo6yBw3q654CbXELDYSxFhHWHSbFDlMJjDd8OPWe0ZmW9AcvKPoEfLeaBqHrVUJFRDfRT4nwuEXaGRoCgSeYxngM9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NfwDgpBme1A0+rPaa7TsMmpv9SzGbJq/IQ85PwA4s4g=;
 b=KwDymUS5P1FdaS9JYOPz66NWFeaYdA7kSJofryaPYbAvaSq1aQEAqEkkt04gf63a9xLZt1BDqlZbMDOndHRfPaA1YkhZWKKZ3CsMYYRKwtmOwIeRT5bw9pbJxQXBGa7CDGXA+8Ll6eqQvq4M4VoaFmI/KjFsnMIi2s3ifOUURgBJ7Zy3jBCncJhz6Zw8CGfmFyUHvsCyl0YV14+hoeuwHqd+ZzbLHYBvFqcOYiz5OHNht9eXfd89CnKCtkBSwfqgg3zQKLqXuzIPGzBGjo8bnANjscU4kJMLKBtL8chjqpQcosVe60GfRZTKZpwS47G85Ad0RLEdN8J9Ta6azSyt3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com;
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NfwDgpBme1A0+rPaa7TsMmpv9SzGbJq/IQ85PwA4s4g=;
 b=BZG0bvZJ21U6E36n4uCJYOmL4AFvs69Rd4UwHfjROeBTbxcJfjbHBAmEDZHfgRBVxcVKvFaYt2lKla2H6Sxy4nfveqswwetgIHq2Il7Ycjwjmr3EErGoTxOM/khEmhNhRoNx8mRyr8xwc1OzkYZuRVf+qjPchbNLpyaMaWcw1tU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com (2603:1096:4:78::19) by
 SG2PR06MB2858.apcprd06.prod.outlook.com (2603:1096:4:1b::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.20; Thu, 14 Oct 2021 08:30:37 +0000
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::fc12:4e1b:cc77:6c0]) by SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::fc12:4e1b:cc77:6c0%6]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 08:30:37 +0000
From:   Wan Jiabing <wanjiabing@vivo.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kael_w@yeah.net, Wan Jiabing <wanjiabing@vivo.com>
Subject: [PATCH] soc: qcom: apr: Add of_node_put() before return
Date:   Thu, 14 Oct 2021 04:30:17 -0400
Message-Id: <20211014083017.19714-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0049.apcprd04.prod.outlook.com
 (2603:1096:202:14::17) To SG2PR06MB3367.apcprd06.prod.outlook.com
 (2603:1096:4:78::19)
MIME-Version: 1.0
Received: from localhost.localdomain (203.90.234.87) by HK2PR04CA0049.apcprd04.prod.outlook.com (2603:1096:202:14::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend Transport; Thu, 14 Oct 2021 08:30:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2af17867-eb0a-4571-1a64-08d98eece5e7
X-MS-TrafficTypeDiagnostic: SG2PR06MB2858:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SG2PR06MB2858C7DCC9B90F1C57436683ABB89@SG2PR06MB2858.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:312;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CHtQVaEj5TcLIaehsE7By77NOK8Zc6F40RTlpo/rkpgLAZ70VSCPgevKinOcT4wjE/nY3aFZKK1e+TzfaU+ESF4OWluloopz+K7c8AiDaTVMfWM9xM/KLfsPjK2P29fDY3EaFxZrdngfx8XTG1PS1R+R3gHeFtyY4NDm4ToeARgi3bYB0h6uYV31rN5DTUjDdiIOM4pIXrOESB2/xUkdkEB5hdKfRcy1e5ypr8jQvRNSJ5JdRbzRA9QlwxEXhtxS9RNybd8zQF/In562UiKmOzGq1lAGhcgpmPNPjcIKQT7BGVSEJfnqOwU1RHsJEDGjviT9YzxKGScTFGDceJP4GgU41FORWrMK3zwFvMIQ1zvwaDuv87kaoYL4G2PT3e7J7ncSyRXZycuNU/vudFDEBPW7f/tMxOS0XlgFFzzNMhZcw/Gg1vglDYnN8mChQVu35SFJ5+L37rbai4WP78KRKnv8C3OT/xvXwg4HdWfEcvlDbFypQxRTwsThrclm7UZ+rn7jcB8rdub/RGiocZcqw1hSgE0nh/zpvZDN9oCaq/GgqG57v0YK0nA7hXVZErgvyirlaqf9bujwYReUSjzOvFPddqC5Lf0tjK7bkL5n5QTC2wfPC1fBuzsnwUgz1vOGQ9q285G/g/mZC1DennxrQykhL4u44o0cCmjHQoulLra8YsyDaBYc1/lgjw8NVs0Yeud95oJpu1Ixe3OE/wdu7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB3367.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(26005)(956004)(38100700002)(5660300002)(4744005)(6506007)(2616005)(52116002)(2906002)(186003)(6486002)(8936002)(4326008)(110136005)(66556008)(83380400001)(86362001)(36756003)(66476007)(1076003)(8676002)(508600001)(66946007)(316002)(6512007)(6666004)(107886003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z8pZBS87I9rhX5zWumIPm8FAAt4S6mqmDEXwosowc562PcNzirzlN4a80zfs?=
 =?us-ascii?Q?IybZ5gJtGPSPL347AjlxeVi/Y5AJeF4l0py64CQzrxuZzfepN8IHCDt07EQn?=
 =?us-ascii?Q?ZBG6nYP4e70BLjUS2G5lFs2aCjkMV0LHGccW274ZZc1t95tyyOfXtx69q4RO?=
 =?us-ascii?Q?im29JIccB626Y3ZP+WZmnLM3mtzbQ3PJwcjOfzfUPgB0bdwRNttWYXbBKcrS?=
 =?us-ascii?Q?uOUGmPO0YUz1gNUsLXD2pLbxCL+hLwkTfGN4KCQLJN/JcmB+5vvllv+anerC?=
 =?us-ascii?Q?mK99g+27yE1gA0OFxK7sGrqVed4t2B6dGiY+Ji2C/ssuopyeybVS3i5LauIx?=
 =?us-ascii?Q?B8vtspogsC8rnjv1D1MYbrOtMPzkIziCjqtPV2qAJTwqpFq0fmlLrNtmz7FD?=
 =?us-ascii?Q?5OpM2JkfeJzL3xvcyziQ95y9pEh5LJbUJCa13Oo8l0zSRqCFClDVBCgBfPUx?=
 =?us-ascii?Q?/S3sKiTR37cVCS8ijiltdoxyAohidr0C3WL8049zH463K390w5d1nr7zTjx5?=
 =?us-ascii?Q?vxml798ZFi40pCnVTRQINJViM4BW9PFaNi8xyY0yj/R2OhPj7e63doix/oIm?=
 =?us-ascii?Q?pjppJ70gC3QbLhh8CtG/Xp/mgFVaHhBE6dmrjGF4iFmOb7aqpVYl7AdFKP2G?=
 =?us-ascii?Q?fChvauHnLFJ7lMfLSlri0cTPZ4IjqE1hhyO4lBQ2ClZ5ooz49exMbibkqdnm?=
 =?us-ascii?Q?3faJwngvqOgzUhDuL1Tv4cQV6t9sgV30E3DeqA99/02AC/3q+jeN/xE7Euqt?=
 =?us-ascii?Q?9zYaGkvggtL47bRBDC1fV8gcwR9TKwN1k1sZen6aR2+tiZJr28ZOFl9mzV3+?=
 =?us-ascii?Q?wTKZck+lM6t20g/8m/iWEzbjBo4AQ7EHLqChEpyP/+2weQxJwtgtMpYZnBNG?=
 =?us-ascii?Q?ghloJxeKNIbpRQev0PeAj8P9KmswJybjxzDf+Iyv2keHmKAL38RKVhLytymH?=
 =?us-ascii?Q?1uwdxqqMwsXtCratyqpsO1U1Ys/3oJlpBYyZMuR2STql8AyQThQxh+/jaurt?=
 =?us-ascii?Q?Rt8QQQBhDv0LFHct8KOcilfYJQxkztnGw1uqlqjm6+rpK3FseVI13nAALFaM?=
 =?us-ascii?Q?BLDr2VbHjw0PWSY29VETSwINX11myLhQwHBuOT4ocMdgco1YwSWmFptsJ1rF?=
 =?us-ascii?Q?KFi6B8VkQdFbVyXRTH8wTUhf7x1lO4FI1ZmU9nVqfodU62iUKXO8bxc2sNfe?=
 =?us-ascii?Q?pMiwY/aoe5sPDueM+hQqVAOTT8hzUb90N1oyGM0IrIx30oS+nZ9Chzbhl8On?=
 =?us-ascii?Q?jQrVLrwt+Q6pNIvyP4EQ9sNpRGEWy5OXoUHa0QNqkEHsVB5TYN8+/6hTmF/R?=
 =?us-ascii?Q?+88OtS2xX4X1R7tk2CTPYbAW?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af17867-eb0a-4571-1a64-08d98eece5e7
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3367.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 08:30:37.2458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MV0/tHRuco3TKFjRoB7166ZikyHHoIpHMWx3Azy985c53rqogOV/q6XlokCX6m4p2obkv6UmcIooIvOMLh4/sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB2858
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix following coccicheck warning:

./drivers/soc/qcom/apr.c:485:1-23: WARNING: Function
for_each_child_of_node should have of_node_put() before return

Early exits from for_each_child_of_node should decrement the
node reference counter.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/soc/qcom/apr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 8a9bfbcd4bb9..82ca12c9328a 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -492,12 +492,14 @@ static int of_apr_add_pd_lookups(struct device *dev)
 						    1, &service_path);
 		if (ret < 0) {
 			dev_err(dev, "pdr service path missing: %d\n", ret);
+			of_node_put(node);
 			return ret;
 		}
 
 		pds = pdr_add_lookup(apr->pdr, service_name, service_path);
 		if (IS_ERR(pds) && PTR_ERR(pds) != -EALREADY) {
 			dev_err(dev, "pdr add lookup failed: %ld\n", PTR_ERR(pds));
+			of_node_put(node);
 			return PTR_ERR(pds);
 		}
 	}
-- 
2.20.1

