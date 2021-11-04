Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3A7E44541D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Nov 2021 14:39:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231658AbhKDNlc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Nov 2021 09:41:32 -0400
Received: from mail-eopbgr1410107.outbound.protection.outlook.com ([40.107.141.107]:23712
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231881AbhKDNlV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Nov 2021 09:41:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/2T6PI92SaB6NhpLHQQbl90PB+APGylTU1FuSSVvRnVhzwpKvyTJGzXBeZ099kVIvUywJgzv2al7kVnkgaa/rkDkBjYkNEtvdmJRy4uE3CNFBm+c9fxFWYemAcsn/1ypcDUcP8Fs7blRcDKsQ9YEfE0ra1s1N6kKqox6Enb2lJ0lRF+E7gwmn6apcdKk06RLbvlVu/CISXtChxqFkfTDD32j+whSu4J8NfQtG093p5pbqqTWvoOXoywfgpvIdBeNjMtMxSo0pKm06pEzhZGE9yYKJATu/Skft/LojBLqvzND40wy+INSwLzDao95TkLG6yux5vVs0FavcuAf76bNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PN+BXuR0CzUHHkp2IIiEa32RT78TNFUoU7fkU0NoBrM=;
 b=aG8WeygLeHuFaECcFi/mCTUpF5Ms7wyHK2AUCdb6bKNq4YUM8fah5uDgPkbt7Tk8s5dSDpU8oCfLMsNiMPi9hNNjKq6A46F0WpXdq6NUXEyhPSKnkTsdDi40XJ5ZL9p/c5UIpmkOWvnlYOXkwv52fJ2Q+fl/u+bvE253CKU0uxRMBQRU4T6MZPlQ/qvSe3aGMIodSQhwctfch/xQvvnpLaQL47SYzsWyZ2aXM0/MqJ+aLSZU3ii4T41dLbNuocEiTWxOlFZ52fSjuGnxIyLN99JK5J9nIJ1Fysao4M9aHmoEqu1M98PiVt98XuCBIJh9lXwyVpsVqfPr0rRQwQ9v0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=connect.ust.hk; dmarc=pass action=none
 header.from=connect.ust.hk; dkim=pass header.d=connect.ust.hk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connect.ust.hk;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PN+BXuR0CzUHHkp2IIiEa32RT78TNFUoU7fkU0NoBrM=;
 b=hm6iSQ7PJSaV5HPqzpsVyAqySgN7qx+Y0wykID9FDVfx9cb9gPOq3mRz8bRxxfowa37+HfxSUkmJUm5zQMMCxwqSaTqwyzQJSa6IY5G4CljXf+5XQ9OyiI44NFkWWRDC/8L/iS8gmS/lopuI9HPYaU6kJ5lUFyVW7+k9tciFVBM=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=connect.ust.hk;
Received: from TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:b7::8) by
 TYCP286MB0830.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:7e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10; Thu, 4 Nov 2021 13:38:41 +0000
Received: from TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c0af:a534:cead:3a04]) by TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c0af:a534:cead:3a04%6]) with mapi id 15.20.4669.011; Thu, 4 Nov 2021
 13:38:41 +0000
From:   Chengfeng Ye <cyeaa@connect.ust.hk>
To:     thara.gopinath@linaro.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, svarbanov@mm-sol.com
Cc:     linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Chengfeng Ye <cyeaa@connect.ust.hk>
Subject: [PATCH] crypto: qce: fix uaf on qce_ahash_register_one
Date:   Thu,  4 Nov 2021 06:38:31 -0700
Message-Id: <20211104133831.20049-1-cyeaa@connect.ust.hk>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR06CA0007.apcprd06.prod.outlook.com
 (2603:1096:202:2e::19) To TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:b7::8)
MIME-Version: 1.0
Received: from ubuntu.localdomain (175.159.124.155) by HK2PR06CA0007.apcprd06.prod.outlook.com (2603:1096:202:2e::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend Transport; Thu, 4 Nov 2021 13:38:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87a7b4bf-09aa-41db-c4fa-08d99f9869ca
X-MS-TrafficTypeDiagnostic: TYCP286MB0830:
X-Microsoft-Antispam-PRVS: <TYCP286MB083060BAB71EA52CEB6DD6468A8D9@TYCP286MB0830.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0FURoWQOQLsdb27M2o0fiRrwA1wtB6nnxCuq/+90IovhaugUPE6nU1ClbzirgOZJWEZsA6dYHIcMPmKb7NOicQEiaxnG5DKrxFBh1WUDCuO4wmN2076pp4x/XI6jelFb7TwXfhgcoBO4slAvYsU1MtAN2ttDcgfKY1SzRnyfJIr7I/u/GC+SdQ1iOYDZAQO/zeC4t6ZqMZLsu9wiF4S8RIR90PK/lb5dJ24DyDbtzYcV2F2We9iMJilaoZ4DndfC+zg9a8nzErqy55KNmpZB5i+lbJoMzAHcuNOI4m5v2+idDbn/YkPVcPJeMJabb35v+Q2a/0jflgPSaJ4DlmwND9ZkNr96XMNaT09w7ypVn96RuMJyRbRyOyug6YFxwOa8sMl7psnbG+ipHzyrPnRMlJ/EaAQ21resugxpzRNWqXvcf54iJttygbV2/v8dBas1XhQg8EO91tRXAhP2p2D/HF3J3+V66kSpMzkm5bzdJygIzu7I3asa+U0b6mZEHVURpiP0Ywigakz9lAajWI+8UzTNTdCoKKkns6xqOsQ7Fz5rhGlU7hbcujRUUvDz3qWQtGFZiFFFs6FiSuIS6GG0DIoWLE0+ViTFqWmOsPMVtPYfDs5kTBn6esu37Wyqb2HMPEsBphgdcQdMgjQMT3Gt/XhdAnZVcg67DsEiFjSA40XyX3uz8rfqlS0X68025peGGKgXeO8jTPj6LR0eufTH5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(786003)(316002)(2616005)(8676002)(956004)(107886003)(8936002)(1076003)(6486002)(66946007)(86362001)(508600001)(66556008)(66476007)(26005)(6512007)(52116002)(2906002)(6666004)(186003)(38350700002)(38100700002)(6506007)(5660300002)(36756003)(83380400001)(4744005)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nBKfJPxp51x5XiPpk8ch2Xt2VoUBJuqSs5VnIiwzXW3Op3xS9ekPbz6y4awC?=
 =?us-ascii?Q?jjj2mYimbSluyT2rHx3uD5EcaQ4AOI1ywYvwflF+BeRmzBx4gdayD3r3nzSt?=
 =?us-ascii?Q?7YyJDuFV9KqjuAsMW/HXdw2swWfcY+g9li9bdPW6FWPGy/s3EzVbY2e8mIZY?=
 =?us-ascii?Q?Q4/L4zYdlXKonTXTEHJ4b+s88mRt8MupcXYnl78Tv6ODCAEVCSJC8QUYUyBZ?=
 =?us-ascii?Q?9HGyeGmIONZHLM0WzIXKG8hjZXiHETrDkn3TD8RaIA7iQFqUjEgWOTBYkTYi?=
 =?us-ascii?Q?fFG7XU5C9FaRHfLXkSMmcofXH2gRyYmiMAMtOOVg4TSqY1qn9yQKVMIeRVxL?=
 =?us-ascii?Q?Z+2bszxCSiMzpCduSsJzbs3ZpMyrufnI4vZ4aCMW6hzTolsA8QDMLOOZTrIo?=
 =?us-ascii?Q?awQF7XLmAnxpeBSH5KsiZM4GxzBhSgRTg1uDFcqHdnm+pfmaJEnJ02HbjQe7?=
 =?us-ascii?Q?LXYcL0S1QHTgtm1AwvxvgpuuTfXWk13lhdw6mge02fT3aL6bE75HVgqVzEAY?=
 =?us-ascii?Q?6f+YQ1AmUcbf8BE8zl0wIFRrtpN7aspqCDG1Jv4WCL/q7nndk9KuyKsFngmV?=
 =?us-ascii?Q?PHPhxuXMUnKipTE8wuNquBpV2Is/n1alEcIXd62oFLIInwzp6y+/LVB0kaNt?=
 =?us-ascii?Q?DKCBDw/4W+KbPRrMSPYg0YIVcteVMBkz2NPAVUrx4AsCILXi8Oi6S1gB15BT?=
 =?us-ascii?Q?KKfGE6S0/1hUFdJx9UvQJ2TBlDXrdfLic3j878cDIF4k0tgaRdnE07TCNhQY?=
 =?us-ascii?Q?Jm+GkKfnDr1Bmwi8YMLtbGhEhwCHmjVMHRWLNqcLc8FGNLxrBo6Av1YdmIym?=
 =?us-ascii?Q?C8pmcJA4p3mPbAe081Dd7fhrhfFth5okX8+kBHgBcVnimktDVJ3RUynGMFVL?=
 =?us-ascii?Q?N5y2YRKppadbKxmDFTBPVmhQp/5+oBO0m13OuzeWAqUErmD22U0P+wiiqcRu?=
 =?us-ascii?Q?b8HKZiH4bDt03U48cI63jWz4EV4DfctSXvPSjlbAHOQzoVnc5u/0bRCjZ1E0?=
 =?us-ascii?Q?pmTkdpdb4dw0pqKcsX5B3bmnNvAiY3a3cN98YTPJgeesqY0xiOGKxtLCxvqA?=
 =?us-ascii?Q?X9LCEiur0pytfLEsHmhl2C94TJYPqBCRtCvPq0Ck/uX4vaeZ2zOGPj+hz4Hv?=
 =?us-ascii?Q?bQ3JFf7I3xg5BnqjnTFL2/ifo1rhxTzzdK8xr8Tbc10+Z8k6Bt3CYN2Ajajc?=
 =?us-ascii?Q?PBEvL1n3fL4PqJxUb/ngY6/Q4MHMHzp0Amf3xcc87YwTcsJdwajikmnSVzFf?=
 =?us-ascii?Q?wZqTYw1/pOr1k9fTwbi04ORjQD/yvbeItMJj5uHNmXoXqLOU8EyqsqdKBTWL?=
 =?us-ascii?Q?2DBY7jpWJD+ii/uLkjUMAO4HhIP9KGu4iNqitnf+FJnUBCFAiGjjA0XRvBq0?=
 =?us-ascii?Q?2G+a6f+sXn2IC3pJWfl8vQyh29Si5J+fo3djSkmtNq2lMGIzQh9ThBUtJcAX?=
 =?us-ascii?Q?qoxlIC/id8GNmODQG1dXjGV74we6/ZBmmUDQQgbbVIjJom7pUVpxPn6VxDzr?=
 =?us-ascii?Q?bupS5SNJFflNqfYu3pnpMjCOI+5J3IiO64bHdIDaLlxDGhiNxrAKishKwP4c?=
 =?us-ascii?Q?MockPr/HKnUPWxAwBjcsjlPHjSqr0UkDsmYe26vyAXWLX2fY4R2FnIyv2qTR?=
 =?us-ascii?Q?p6EhzgHDke4zfaQiOzlxmcA=3D?=
X-OriginatorOrg: connect.ust.hk
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a7b4bf-09aa-41db-c4fa-08d99f9869ca
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 13:38:40.9681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c1d4152-39d0-44ca-88d9-b8d6ddca0708
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Dgy7Mt9y1AFF2pmOPEcEa8B49WWePeNlQ7qnA1dPIZdAtZK8+DUcuvHizuHihdKws78pTqFzqEWGTmhknr/hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB0830
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Pointer base points to sub field of tmpl, it
is dereferenced after tmpl is freed. Fix
this by accessing base before free tmpl.

Fixes: ec8f5d8f ("crypto: qce - Qualcomm crypto engine driver")
Signed-off-by: Chengfeng Ye <cyeaa@connect.ust.hk>
---
 drivers/crypto/qce/sha.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/sha.c b/drivers/crypto/qce/sha.c
index 8e6fcf2c21cc..59159f5e64e5 100644
--- a/drivers/crypto/qce/sha.c
+++ b/drivers/crypto/qce/sha.c
@@ -498,8 +498,8 @@ static int qce_ahash_register_one(const struct qce_ahash_def *def,
 
 	ret = crypto_register_ahash(alg);
 	if (ret) {
-		kfree(tmpl);
 		dev_err(qce->dev, "%s registration failed\n", base->cra_name);
+		kfree(tmpl);
 		return ret;
 	}
 
-- 
2.17.1

