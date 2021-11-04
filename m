Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECC44453D8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Nov 2021 14:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbhKDNbB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Nov 2021 09:31:01 -0400
Received: from mail-eopbgr1410127.outbound.protection.outlook.com ([40.107.141.127]:6162
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231152AbhKDNbA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Nov 2021 09:31:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMxVb/zYQ6w5l6oI8jCyQONaJaK0F/pPscKFwygRiyudMQbbPUFAkvTxrzRCdd5dF7lrO/y7gqtMHqWhK4L1d4jHbD+lpc5bdYUonFV2WYo/zAWhUHGprc9KYkvgz8jyH75A/WXp0MBUtu4qYuW16/UVwW71EsZh6rNNl9AYkuK27krFIMY84BYiHKvx25d3ASrifjIcjyGThFWKoaA44YqNDIzt5pyFZ6DPP6fvg9X7D26PNrix4oe1D26z0xyQS4ILvPjKhWU7XFJa2tPyHH4eST4iQoZIYpeQ0ridbFA+bV+J8mRveDjkYvv0cbLzq/lqMWbCzKQnbONDeMc2vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWAquR+d6I86AR0G1N0iJNx46oaL1hJNT7UpsKF9KBE=;
 b=KaskjL8+Xh6VpLHwmHMCzNp6AMgPQLhLqxBARSXVv+Ra/1pUA/rmaYry+p1zMsygaxlnJUxP677jjK3xfGzNUwVaCvsE2cd+cPSGJ6dzgRG4Xeh+9BfmlMDOm4yCV4sttPm1VmnCzK60jyZ2MSXK4AsGhSXKrkl6yJdbMucjVDcE5gpNJa0dsR7XQozWOdW6UP5J8bj8hl8GrTmZ9aqUfq6C/Mv6WzIsRwaCS0ZU5PDXpzcBCqKmllFiK/vr6hGFqkVI6Q7OChn8QKpMpOowI3cPuL2dYzYdjpNsfSfXyJV0To7C+R4KTWSCQ/sBifnr+0sS6y0ZRTMRq6sKd9Qh+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=connect.ust.hk; dmarc=pass action=none
 header.from=connect.ust.hk; dkim=pass header.d=connect.ust.hk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connect.ust.hk;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWAquR+d6I86AR0G1N0iJNx46oaL1hJNT7UpsKF9KBE=;
 b=iSqFWHlTjFbIzyi2BBhjOJI7acKj2DaUsKbon47N9Et0QJxG6crAnMP9G3EWRU70EYw0BawMyR+S4CGMmA79eiVMdt0EOde+Tiz0ajVN36Kn0cxApw7CUlOdrt5XQpwTVcOuG7oNXi5jrfMw2HefJPGxtVsun9IaGoVwiLstxIg=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=connect.ust.hk;
Received: from TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:b7::8) by
 TYBP286MB0334.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:802e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Thu, 4 Nov
 2021 13:28:18 +0000
Received: from TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c0af:a534:cead:3a04]) by TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c0af:a534:cead:3a04%6]) with mapi id 15.20.4669.011; Thu, 4 Nov 2021
 13:28:17 +0000
From:   Chengfeng Ye <cyeaa@connect.ust.hk>
To:     thara.gopinath@linaro.org, herbert@gondor.apana.org.au,
        davem@davemloft.net
Cc:     linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Chengfeng Ye <cyeaa@connect.ust.hk>
Subject: [PATCH] crypto: qce: fix uaf on qce_aead_register_one
Date:   Thu,  4 Nov 2021 06:28:07 -0700
Message-Id: <20211104132807.19366-1-cyeaa@connect.ust.hk>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0207.apcprd02.prod.outlook.com
 (2603:1096:201:20::19) To TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:b7::8)
MIME-Version: 1.0
Received: from ubuntu.localdomain (175.159.124.155) by HK2PR02CA0207.apcprd02.prod.outlook.com (2603:1096:201:20::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend Transport; Thu, 4 Nov 2021 13:28:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2770a70-9efa-4269-4c49-08d99f96f632
X-MS-TrafficTypeDiagnostic: TYBP286MB0334:
X-Microsoft-Antispam-PRVS: <TYBP286MB0334DD5A2C69F40BCF5BA4718A8D9@TYBP286MB0334.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hES1d/sxsZlwDFbE+CjloF/AQb3mxNSZlJdaC7+wc1dRbyetY2BM5t4wAoO2wfUdEV6FJZGJsrXtbUtwlog4U7wy9cX7RvAd1MgAv7YJux/D8Yx+3mla6MFdnk6G826lk9YiXQd3Fkb2QMR5MKi2kVvbZuMfHG1sVwc6tj30slCTLZD3/OH3ukSOElPIkd2Asuet6CzOslXjOqpFgBxIDZrKNXYHLP/zpui206NZ5vCCU/kfUptez6nkdiHaw126iinbFrgAO2QsU6R1GRIlf/4VxBxPkaf5XqgwztcRWxApGIObvD0d7PcfNZ0+CxxsWGyyauX/R54GUbXsHMx6+Ew0lvfYvBJF16Hql/qvbaSt8qCuRJK8wIa5gR0ZD+Btao4pZ5iJmmLaA/j/xQhxXcqPQEPnJE7mlX71MooPzhVIFQ1ltwCCoRWiN8mar/VPjAKNiz2UvfI+++aFUq6ezPGWd3n9IU1/Q3z6iEx0gkHzUIOnWrv8e+lmYZmyetsgJRMGc4WWGZgXEioyuaKovZtlTCLZwJrQYsWf8YSyHfd50GMlEM7bQGXNnMTeoAgnMlbfVr6boVkCsx5fYWFjj2C5L4jmNKkpBkzEpTopijr5dQnLwyv6hAOOkhaKD4yuQ/ZkYrQjP17AB2KaUi1ksGP8g/eV9b7BdQewNuTe2NAp1lfFvEOGVEXVVskqrZS1Nj7tUVh/suNXfrmxqjACEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(86362001)(26005)(956004)(2616005)(186003)(6512007)(8936002)(38100700002)(38350700002)(6486002)(786003)(316002)(36756003)(6506007)(52116002)(508600001)(107886003)(66946007)(83380400001)(4744005)(6666004)(4326008)(66476007)(66556008)(5660300002)(2906002)(1076003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gbIO92+Qq5MrIIRcenIqul57JeQFulkR9+tH3bHfdNeaDXXAMXH5K298ivfH?=
 =?us-ascii?Q?PoVZZyCtxj8r3Vv0AIr/ma/7aIT7mEhmHU2tmGfwo3lDj1zR0qX1nyQpEUK9?=
 =?us-ascii?Q?EW1sQORDuhec3tWij9FUeUlSkj237savvIESf84q181hpOGEkMV9pqI5sNZR?=
 =?us-ascii?Q?1dYNEm72ed/fLjZQzviLkRH70gghg04qKqc7VWEZIynhgi/7iedG1vWBjYxL?=
 =?us-ascii?Q?ss3LF3WzPnE5CHAuj1RlnwD1O3kHdk3QR9x11qQYNcr+hfZnskth3uu9dyxr?=
 =?us-ascii?Q?7gfLi8RrFiZv1/MGbWCTaSW0L4qLiP9ff+vXPIa+YcmwcyfgMhlig3/hq4du?=
 =?us-ascii?Q?e+aXwpos7jhk8XgoJ2wwB6cCH2hLChlkc/azxtZYt/YIRg4O2lC/P4+uEZ4s?=
 =?us-ascii?Q?+TNq/lanxAD7LxzK47VdJ4o0as/HED4sMZG084W0VVQ+GWxVsCn/pO9B3ef5?=
 =?us-ascii?Q?dCuPZz8oUHPoGPAKyXwBm3/2RoUIk8rkb6LpPx3G/xwqcVZbGAGdJpFdAubE?=
 =?us-ascii?Q?MrQHPpdCIZwRJme2f3NCl0AWTjkoVQPjIumMvdUyjnBIfXHBxiaw+Gg9pJJm?=
 =?us-ascii?Q?Mb/C0vz9xEKEMaTOMu6TsP97Z67QCwrwVKrUNUpf5MsQFr86j9CB0SJP1TaH?=
 =?us-ascii?Q?PKAYCcCZjX9/p8Adl9iU2SfpTG71L8hv91htLzuFzjfjjnL13VV8Nlp4bREf?=
 =?us-ascii?Q?YrYI3ZKrZgFPnbggLQ0mOp/VXIPw9D522S2C7MSqjHiWJzI6utpMuQTcgKMa?=
 =?us-ascii?Q?Rm4fZY1KoC/Hrs0gZdE08ItFl9XT2JBTyVZEhAq/7jwAOLZliJGpNPY87qzf?=
 =?us-ascii?Q?hnlcFfPEzGNT7eG6W7JvT1dkotoiB0WWWCnhirvHerJhZJamgbkuKOhDs8wM?=
 =?us-ascii?Q?xvQbm8Cz9kcTdUf3y0FQnQdqlUECzkrkzIPNem8Yuzw0fwT3JB3+/nFm423k?=
 =?us-ascii?Q?5huyJosBhODX30QGi4NrGhrzAlenlPERHQ99cNgh5P3LqIe2xSJWMlMrz/CB?=
 =?us-ascii?Q?uHpR9a6F8UwtsAQGgEhtmCoG8gzV68GB/aLIvBvg0L+p6cJvM7njvHtmCUbJ?=
 =?us-ascii?Q?AnVkk6ogIqXDgCSgNJG+TBt+So6NkuOICmFcN1Cn6EdL/85Ngdvm0SCsALU1?=
 =?us-ascii?Q?dUhe1mS6Jo4MG+MLNAtWYYP1Fz3ut2E+CpanbyVrji/mA3+eBnuL5J5um8qK?=
 =?us-ascii?Q?AgKResZ8U895kfyEpynPXMTfiY/ybKTyP3MpE2+EFt6/IXu9MsmmFkDv6u2k?=
 =?us-ascii?Q?FIXvWS3GJDFyWMDyMINX4LFRg6PmfCIg3upB10zl4eCtcXyNi4BWWO5f2vV2?=
 =?us-ascii?Q?lrXXZHUnSdLMtCZwUjuqb1OFeUKbr33zSOt7eEfMkL9j56SvI6k34k+xqY43?=
 =?us-ascii?Q?KM3A5AoUoauSSdzP7e2aR4oh7E4+mUS2VhUUdqNGX5Ssdo3oLto+SL66rRl4?=
 =?us-ascii?Q?kIUsowu9L6tc/M8UMFpHE4GLsv0OXPI7uimb5Kmc5DPN0COC+FExM53MrhKM?=
 =?us-ascii?Q?tJ8RrBrXKRP5XQAITeu/t2AjHTQaFvZk4bnYzy9lzgzfHLRgJqlUocPfQRLk?=
 =?us-ascii?Q?vpDO3LQe3sb/nCAG/Wc/jRvMoDIo5iKdtd9NINDNIh31SMEZZ0RbD5FaRI9D?=
 =?us-ascii?Q?BU/7gIV4aiBf0rIGMYc2Zf8=3D?=
X-OriginatorOrg: connect.ust.hk
X-MS-Exchange-CrossTenant-Network-Message-Id: e2770a70-9efa-4269-4c49-08d99f96f632
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 13:28:17.5561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c1d4152-39d0-44ca-88d9-b8d6ddca0708
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f9AkR7VoQeoHLD7M+6UnYcYGzY4gQdsu4bQLfuZnhC5uTMcLaqvdSjtNEuIOU20Jl3cIYWjDe7SfRpXVAiA/nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBP286MB0334
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Pointer alg points to sub field of tmpl, it
is dereferenced after tmpl is freed. Fix
this by accessing alg before free tmpl.

Fixes: 9363efb4 ("crypto: qce - Add support for AEAD algorithms")
Signed-off-by: Chengfeng Ye <cyeaa@connect.ust.hk>
---
 drivers/crypto/qce/aead.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index 290e2446a2f3..97a530171f07 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -802,8 +802,8 @@ static int qce_aead_register_one(const struct qce_aead_def *def, struct qce_devi
 
 	ret = crypto_register_aead(alg);
 	if (ret) {
-		kfree(tmpl);
 		dev_err(qce->dev, "%s registration failed\n", alg->base.cra_name);
+		kfree(tmpl);
 		return ret;
 	}
 
-- 
2.17.1

