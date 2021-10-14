Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A323942D25C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 08:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbhJNG0O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 02:26:14 -0400
Received: from mail-eopbgr1320103.outbound.protection.outlook.com ([40.107.132.103]:24672
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229984AbhJNG0K (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 02:26:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMT5Lotan5ErfdDVz04GIZskjhFwnJUFh9XwRcCzjRgA92L+NjWoT9qcG3yyAAfFVWT8tsQMt6walVA2Le38sQFK/sxYqGzuhuNawR5WFfvjvEgdiDT6Seawpal1ZzOLdPgXJHWIvBohr9b0s3D5WX+MnKFHqR27LtsxRIwLLGzWgpR36PQf5fLT4lXwfNoaHb6x5JDiuV182jGHWyB722i/c7gS7yTHU47V/1RhmwgttWuE3xqvggb9xw7smm+dMNMdc0T2z+wYYpQXvK/5ImaG2CTkVcoE3cXnpE1tDJ3e5F8qQTVPo5tTKp5fRthByLqO5VTFMrKVnlnA1d0IOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t8zYZ0Nyf81eD8XSOdOi3nGw8IjcLa1/3R7wutRIGBs=;
 b=afIl4oRqF+Ws5BNgrfocYi0U2g30aN2hx1tBaPuh5/yiw0DAtTIi5ah+aQ/WkwqsuRinBk3OyIWfQoxBRF36ZAcONJJ8Z2xFFTIOVXBG3tkiLeve8ReZxXb9uzivhTpgEQQxZxwbyy05XlY5tZyJ9Q4k9IpR+q4pDW4RhvgH0yYtgqrNRGjEcp1+v6AO6QliLA82C4ClVF1t5dIHu5rORuDR+L7c8GVeEj5yVU5Rp+W/QJVr3FFKKiq1C8CXbYA0+6Ni0gPPLrMcmzB8WKrDcf6FwVm1H8YZR+C3Foy5LKIC8MJ43yK4cT584fl4e1viUV3s/3rlu/dmO9iZQ4jjDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com;
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8zYZ0Nyf81eD8XSOdOi3nGw8IjcLa1/3R7wutRIGBs=;
 b=SUyGUX+ufTlZQkR3fHvhyEx1InAPX+CXkCCZ0UnOJcVLWF9krsnguIc7wOn2FYrNh8FvpFw0TGXt77lEUSZyaqAdOYqt15LT95o1CjlK8mjQ5oumEqvagKCpaCMHiw7uP8qLikM3042mzbx7Sc8+3Hn/VpyNWApHPao3cxobT2c=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com (2603:1096:4:78::19) by
 SG2PR06MB2460.apcprd06.prod.outlook.com (2603:1096:4:65::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.25; Thu, 14 Oct 2021 06:24:03 +0000
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::fc12:4e1b:cc77:6c0]) by SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::fc12:4e1b:cc77:6c0%6]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 06:24:02 +0000
From:   Wan Jiabing <wanjiabing@vivo.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kael_w@yeah.net, Wan Jiabing <wanjiabing@vivo.com>
Subject: [PATCH] soc: qcom: smp2p: Add of_node_put() before goto
Date:   Thu, 14 Oct 2021 02:23:49 -0400
Message-Id: <20211014062350.8942-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR03CA0046.apcprd03.prod.outlook.com
 (2603:1096:202:17::16) To SG2PR06MB3367.apcprd06.prod.outlook.com
 (2603:1096:4:78::19)
MIME-Version: 1.0
Received: from localhost.localdomain (218.213.202.190) by HK2PR03CA0046.apcprd03.prod.outlook.com (2603:1096:202:17::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.9 via Frontend Transport; Thu, 14 Oct 2021 06:24:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d421e62-4219-40a7-73eb-08d98edb3716
X-MS-TrafficTypeDiagnostic: SG2PR06MB2460:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SG2PR06MB2460AE01C71CBC117674A748ABB89@SG2PR06MB2460.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3dYXWRqc1/9VCm0wOjLkv9Hm1PWFd+fT5+0GUDtMx9R6iUeDnUXfUpuZaescvFiVoPvhQ3JGXeKNUhAEhzUJhiJKb9nYqPPerdXE6HjILhxW06vt4RhJOMULdYc15/Sad4oVM62Fn4Gp4+R+ptAjpenUoJWI0V+MrTpP7ZkZ4Ghb8UrwnpjI++drizT/z9SnUwIVq0Mihh6cKGmt+yAdE0IzMQZhwZLkwN/KNmOndBDh/SsFkz22405PqMKn1JF713fcTrV2ANeJfrhYFaCGPPDa5MVEtyOL8+Ss8oB5DxJmyIYfYb7Eva0/ImUv4z6VJm/HIqTN5JQX8CRtR2tzsXD6NK2DzLRGjlJ6sIS2yk1YPZD631a9lwqFuDwI00iTIaBmT9NAKh4mJHFzpUY0hWwXn8uHsiJHSr0t/YlkDXMZHpYGafqYOU0/sVH48UWJAoL4hbZaRQNTN9aAMMh0rkldhcQFMUY2b3ExAUA9ngyZDaIqxDIuMKpoVp830A++c/DaDbBEmrWS5prSmHn64DCjHjwPIc4clw55ERSskyAPitp6vcnfp7QM/20oQ3dDBEw/H62VOefVkZTf7TRRyLQWTaBUdFzbCgwetryN7tVayDOoyqG+HxhAzV/L1T3uAEmKbX4EXncmCsLeaO6TrLRTEyWEhXbnmgNMEWADP54heRK/QxeMrr/onH3cANov
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB3367.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(38100700002)(6512007)(6486002)(107886003)(66946007)(83380400001)(86362001)(508600001)(2616005)(36756003)(38350700002)(66476007)(6506007)(6666004)(316002)(8936002)(26005)(66556008)(5660300002)(2906002)(1076003)(8676002)(110136005)(52116002)(186003)(956004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2QAmlKT1p6hoJPSQLxN/gDnDiM+QrzJs8phkMrJ5WGI9ly3TrxEu9/10uP3G?=
 =?us-ascii?Q?gutCbQHtwgpaZSEifJNXQltPlUOXFgFm6yBnuyPvv5xiXEisQMBwkh9YMOt6?=
 =?us-ascii?Q?hvKbEx1RwdKxxpnppXYqzwl+5xsWhcIu2xPPtPHC0fXvao2zbJlumtm2vuT0?=
 =?us-ascii?Q?5jSSfZt3P73wMkOCMJ9DoOsX/yVc1f4DDNDr7xoRLsJQaaL0FMGsQpCBFRWc?=
 =?us-ascii?Q?8tKHp8PFWYPe1w6IrdE6vbnYyQeT6QWoJ6w0UeCiUR4BNB59aqAwH8cVeCrX?=
 =?us-ascii?Q?moXGEnnJpR0U15CSRf+bGPoNomJZRaa+c+oHKL9Nsyig20d2Af7CLeQaFhfs?=
 =?us-ascii?Q?QXuEKsnvWe0nZgvPS3/hPxZl6ZLSadji6BEmNahbBrqPIb5VkzQdaYmwhpfi?=
 =?us-ascii?Q?3pCNUH++Xf35uQ3HTAyE8cfvk9i05T0ps2NDosOuwQVtQHL0WnS3W8LPnc8p?=
 =?us-ascii?Q?gJQTv7+DwSYvjh8d6zXjejFZzWlua1FjHNlme1+WNSEjinIBVXbBcq9mBCkw?=
 =?us-ascii?Q?T8nndHrUaTTOuy/7LIJgCGkWpWPu1hUJV60FwNlQJC9jydljgm4wGPXoxuJb?=
 =?us-ascii?Q?V+BO11IXIwjmMgQlbr1sd91UIh5xigphnQZY6FSLh7OA3b7m0uvW9jiS0PBt?=
 =?us-ascii?Q?bWV+SQWv7Aj2ZOi/6G+nyevDWPPdBfwLcD1nEhyayOidzJZgBK37HkBpKwpk?=
 =?us-ascii?Q?zQvEktHSqL5HCEIP1Ius/6VjGU/tzwCqagi+RTycqa3QUrNoFjjxvva6mNEd?=
 =?us-ascii?Q?ivKaDK3NQsEAxLgBAh1uoPzF47X6oww5ol+g/NZ/skks5yTLHPAptm9REZiS?=
 =?us-ascii?Q?E3g6+XMMxEPqtJDlhR0enrtEGPX2bVpOc7Roo5EVI2IbuDdQKnzBnVx4YH8i?=
 =?us-ascii?Q?2PLZ4T3qNzM0MLUX+wMDMIXu/EkkNGjP342pywzD5jWmLvPWmaT4fswkj0QS?=
 =?us-ascii?Q?r9+YuPIlA4eQUl6iPjX1T1q9Qj0S/LWJa17Za5fqmNTtsPbTMxljDi4kBK87?=
 =?us-ascii?Q?3aqPMOXi2yCJmDuHU/P7+BZizg9whoKM2KwJ15hsWPcS2CMOjnsHbX1/FM76?=
 =?us-ascii?Q?JDhVahWRgG9qLkLFw42G6HWJ8YfL9VqTZuqYb8FatI3Q1FVINPinuYj/f2+m?=
 =?us-ascii?Q?xjcEzyCBDp++nnEk9ejuH0uMh/UaLihsGQ6S28HrkCv4DNUVINc0tvkIq/lF?=
 =?us-ascii?Q?Jq3nJgvr9aQwHKYSn480Mgn7YZl5gZHM/G66J3hn/sm8cnCRENBVguXPA8Wc?=
 =?us-ascii?Q?l/EtWdwjPYUcJebAQSEX6/E11lD8nEwOZv//NPfGnEYkgHia/W6VYQv/Ukoj?=
 =?us-ascii?Q?4HVa3sB4vBWpPEJjFlCDOpSW?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d421e62-4219-40a7-73eb-08d98edb3716
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3367.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 06:24:02.7073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7nHOX68LiMOmTN5Y0KTXU8GuS0nPFxFy8X6SqxkYL/QRCzmRW85RywO8ybEbsXXsUvebdko6pN0jAXhFn2lLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB2460
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix following coccicheck warning:
./drivers/soc/qcom/smp2p.c:501:1-33: WARNING: Function
for_each_available_child_of_node should have of_node_put() before goto

Early exits from for_each_available_child_of_node should decrement the
node reference counter. 

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/soc/qcom/smp2p.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index 38585a7edfe7..2733f494009f 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -502,6 +502,7 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 		entry = devm_kzalloc(&pdev->dev, sizeof(*entry), GFP_KERNEL);
 		if (!entry) {
 			ret = -ENOMEM;
+			of_node_put(node);
 			goto unwind_interfaces;
 		}
 
@@ -509,19 +510,25 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 		spin_lock_init(&entry->lock);
 
 		ret = of_property_read_string(node, "qcom,entry-name", &entry->name);
-		if (ret < 0)
+		if (ret < 0) {
+			of_node_put(node);
 			goto unwind_interfaces;
+		}
 
 		if (of_property_read_bool(node, "interrupt-controller")) {
 			ret = qcom_smp2p_inbound_entry(smp2p, entry, node);
-			if (ret < 0)
+			if (ret < 0) {
+				of_node_put(node);
 				goto unwind_interfaces;
+			}
 
 			list_add(&entry->node, &smp2p->inbound);
 		} else  {
 			ret = qcom_smp2p_outbound_entry(smp2p, entry, node);
-			if (ret < 0)
+			if (ret < 0) {
+				of_node_put(node);
 				goto unwind_interfaces;
+			}
 
 			list_add(&entry->node, &smp2p->outbound);
 		}
-- 
2.20.1

