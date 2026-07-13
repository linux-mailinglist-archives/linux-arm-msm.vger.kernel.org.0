Return-Path: <linux-arm-msm+bounces-118789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LFp1B6rnVGqRgwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 15:27:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1D674B8F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 15:27:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vivo.com header.s=selector2 header.b=F40rDWhr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118789-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118789-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=vivo.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3748933FD79A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 13:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97857422552;
	Mon, 13 Jul 2026 13:19:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013057.outbound.protection.outlook.com [52.101.127.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295C6426419;
	Mon, 13 Jul 2026 13:19:54 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948796; cv=fail; b=GHYcKDqZ35ktMaSELmvW3ay8cSOWsiuXPT09tOiZy1JrW8ls54d80jdg28RdIB+VUedFPQsNnYkLMtZT0BaTjTZVZMUyPkX20n6DteF2nrYZdoopprQmQDEyJFxYkpUkUaDa9jGkF/wDmPcPzrU+B0Oaa2bgfIbqPgU3R+LnNeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948796; c=relaxed/simple;
	bh=YtxGLHtiuUrVrtdbdYRYXgI2XCRoGax3cWz0TKqqDOg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=GIEj2H5nK6CQ8u84XL5+EobegiVSMzNDE6QK+kPrtmbmGeYYFiEb6ttZSQpS9ou51VZN/3NfOeYah0KCMkQBMOe5ExCijrPC1q7XQK5GiBGvV4phmMBHUvW7z3c9gk1YTGdMV7/0mlGfboFKMOrXHZz2xhBvQKniP6FX7CdgCtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=F40rDWhr; arc=fail smtp.client-ip=52.101.127.57
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gw3fT1NOsrmoNL2+TJi+wN6GPyBGaLcZmwkdR5gi4W4EkLzwIZlmMNdribg8yFTDobu6DbtTEGjuIZJZjaKiijw2/EKlPwizRSMu2hZTP/HrpINYYq2enVAIGqxfKgue31Bc/yJG11YvvDQdUGTAmxuRboR2jXVd1YYJ5KCc9Vf0/a8rYhB0HgDwHdZsAXhDo5lBqkPCKBJ/kWMFm6I56zNyjreBNITmimXLGlNJlq+wSja9JIll8U5yZtEf9RX3z3BVHdpD4vwsiznvHjIDwg9hRyJAnVHJcowJmzWoJRSO6ZLlIrQTQ0EZNFcc03Hi4sQernzbGkKbWfZ84Nuq4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txnOBS9N2KPaMltX4usSrDPq12/QzhwE6y1rUpacbO8=;
 b=I4TZFl8oLVz/UE46yHn9KV2sniAU5nA3dxttG+zDNQmwOxZib3QEixn/BJxS4bIBSbW+lQ+ViYSq/jfLKriMcBFanhJOUcHlNLGNTgMeQ8SoJE+GoNFFN5T2QWzj4f1hFDBSzsrQj7n3NkcHnbTmxQqsjTNx1SDx6QJpYl0EVXIGcvT3jkMIW8FQ7gbKIloR5noCG12OkkyRmEIqiW+sBxLORsY3sm70/3zwIOEt9ncfrMGhiQ+PtgJL5DUqKFmLrOYRQviZmWDaYQSaoGgapz8+QW9Ra8zCn7EiUQmIbs19kNbCYd7wq0QLslpl9jEHPZUz5FqOJfjzSaGOi6Ik4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txnOBS9N2KPaMltX4usSrDPq12/QzhwE6y1rUpacbO8=;
 b=F40rDWhrfu6oXttjFvZXeHuKfBZ0yoq7YbrzoyNjGrtjf4LaRpkp6FFBe+4eRwPdVfDSAGz523+5/VPZubmjBp7GLgJstweC8htlw+F1p+Dfy8cMsAUYqT0DNBPsSl06AB0AwbS85k5UQYJEEi9tH6jDBiZiorstPC7A6d+EBq3mfZNk1CehtANNGfn33OkcG5i640XO2zyVK3Fc44OV8kn1BdVTuALJ75jY+dSF2tb4NdAQMP6P711eZKvKNPiijrQpXV/LkbHR+JnRDO4P63ai+6JfxK07YjkGYTf/5zeIUG3am7Q0B9ytgbOsPP/RZ4dagxhRAid/bPHjf3FsCA==
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by TYNPR06MB9248.apcprd06.prod.outlook.com (2603:1096:405:3d5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.22; Mon, 13 Jul
 2026 13:19:52 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 13:19:52 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH] firmware: qcom: Remove redundant dev_err_probe()
Date: Mon, 13 Jul 2026 21:19:39 +0800
Message-Id: <20260713131940.355559-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0019.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::13) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|TYNPR06MB9248:EE_
X-MS-Office365-Filtering-Correlation-Id: db9b2659-b952-4531-eade-08dee0e16c1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|23010399003|1800799024|38350700014|11063799006|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	swJDGmXLQySR5i2IsFsHiR2o8tBwO/En9mMKeHy/sUaQ/0zs67no9unzbnFr68ayR7SohEA88xKamX1M/jlTuELPiIXPVt7VcA3MWoB0QDK7ZVYLdTrYAWi3wArvsqRPNpVk3AeHTirWnkBT2IPryY+uVoi7Kh6ZnGeg5tlnJEdZ7ZNIvz4fCUDkU8ycmhzJN6c6eFzcoF450oQb0lSs9FbPhTGWvKt0vNAoZG0zWiLlpLe1UQ4j7Z+Ua7hJTL3hj8BgHJTNTUakcelE/YsF4HHbol9rMpijpGfwioFRHgyJv5v0tgqlGx6b0nb4aocVfGzZji+vTlzUKPZBeng2sLEhDrrvNT07US/uIMWQvPSfOJyncKJ1oCqUBzE2M4jozVzGJHpc9ENMoYgbM09JsqcSPp4Epn8JOilLTFZQvngZ+hJz1Z3kackzNcxmo8AVcRFdJw0hsOi0u7CQR4yIWzwI6Z+mPTzDA0+fFOhp9+7IDLOZy4mMyoM1fi+qeLkUghP4y7gEaWLpV75hicKZ7DVi29Z99R1P/x70osB3hgENXON8UL7euZ4U07fNa0Ln+M/c6VLO6Y7jTn2sH5dXMPtV46G1/N+g0PVq2O1AIvjAlvp1dwRbS1GPe35p1NFiKGPvTe2QNQrd/tl64nOaHvuNZlu8zHrFa+HnLdM9vuhs2C91h5OhefPcfOs2zs49EQxEwfPEZVBv7xko0OfyDXuIJrJ0qK7uOX1ktalHHo0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(23010399003)(1800799024)(38350700014)(11063799006)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UvnjlZcveHrw3/XH16cE7Ft2rO/bV93ycC/zsVPAfXtkLCbxfrY8F8JY0rCq?=
 =?us-ascii?Q?iYFwcn9RKfvyo9LkEvlSnq1Jz/mdRhCoeS7pIXU9ZSZGnErOFjo+9R9KcltC?=
 =?us-ascii?Q?LakluQ2GLO4/lZ6JGtcFDSI/n3pQb2U3qp9XezqtvH1pCsw78jHmOeEiTa3k?=
 =?us-ascii?Q?tN5j7W1YvAEa6PKPGYVe8fV6dtFBOXOn+oV1vfOUNq8PrviluRs5IayB4XmZ?=
 =?us-ascii?Q?7KxQEiFDicy9rD2meNWM8gD5/mbelPtrMDWF94K5hOQc0METVulxal4lyamY?=
 =?us-ascii?Q?8oAAiDfmEVe41IXc2Ng2SaJFTYBK+iPyGN33A1zMo34qVNNzF8GaCqBemNLf?=
 =?us-ascii?Q?yQlxXGv1u2RSdNKpMW81LqtG85qG5S+kIhjMaTplNeEJoGyG4SRigSM6v0gk?=
 =?us-ascii?Q?9olxjAVvso1+oprro9TcCDvr6SVrD6HERCYg5WZ8LINAiAWNxMSpS2eCuWsC?=
 =?us-ascii?Q?pHAs3dKYnYzQf6qoKRbOoBhK0uIx76PYyfGJTYLo0WmJ31/14NnaCV9I5Bkl?=
 =?us-ascii?Q?2sOs3XxRPEd9rm4FydFTIK05Ce2zlfi9XV5v22ODrKGZkPqCSt1F8lpIkWJi?=
 =?us-ascii?Q?dPiRJ3+gvCmiT9kQLakrurq+i3RcvNwd25clg2RL9ShwXyOl5udI3zQlIAdF?=
 =?us-ascii?Q?Uc3We9PJ0P2pPgyHlx/Xeb6qPlqRUqOCBlckR5Y6W9MnekCgGCzTVdLtoEsj?=
 =?us-ascii?Q?GwasvmlvpUhFu94BaLxwGtmLCL/o9x91C4wWTZO/Q13MxwxuWqLSU9Qrr+2Y?=
 =?us-ascii?Q?4iiM94hYb/o50yW5MIkOI0YHVyEd5sS82NPppTKgXdJTke/SrtDWhD1a8qNH?=
 =?us-ascii?Q?sJgA3yB7rt2YnH2QKYezWXQ29qZ3QLmXrh1li7+rZI1lOo/gGLqp+hNS5azg?=
 =?us-ascii?Q?lX1uFG9R5VmH8txbJj2qWvVuNoFDQW29VcvXJzWmOn1GjHkuIqVxEzNNuxVX?=
 =?us-ascii?Q?N2xRluQDMddRLTcaB2cYN7HScDEEQh3Gft0tY3I8T/pK3Dp5SS0WnxZeOefw?=
 =?us-ascii?Q?KEqAXRTCsTLQfDq28sAH3lLp1yv8n/ZYYQrsgsiM9WF5jt/ImSs/Gr/3il3l?=
 =?us-ascii?Q?7zlINXB6zlEyi1FZ1Bxjuvtvx9UHMSL3nAMW67rTmzzU4vvByrIL00S7EhXR?=
 =?us-ascii?Q?9dfCLsRjYvRjr+zdm3cbZy07D5aUTHbjKDsERe7znXLOJkz/8Sp/pS7+BEe8?=
 =?us-ascii?Q?Nz7va5D21Bd5ZFDr1+2nNboFqwdiotVY2TbRgXbOJkn2CoAg/kfsAqQk6el5?=
 =?us-ascii?Q?/a96Jj6BGz6j/9ZzYG7jtVDQfOj4cwqHtmXBeUCj4+SLgGL6rNXUsnosETft?=
 =?us-ascii?Q?q1ksaj6xbSzrl31nss7hGkOHg8o9n+0jWGJbh4w6PBel9hPQPoioz8RipNmH?=
 =?us-ascii?Q?HM1pdkxvu8GLQhqENp5APYSTFbQGmZuTTykcqxsEkg1/VU5Kay0dODIJgnCu?=
 =?us-ascii?Q?0Nv2ZeDBuYIsBw1AH0oLTVrQGUVUMoomov93Nr1gCAsirVXUoHRVqr6BQGHG?=
 =?us-ascii?Q?U44HZh8yeXdcoXrZ3aDir9fTZOyB4swYigyL6YGKKpWediMlRXzrVUyzx8pv?=
 =?us-ascii?Q?CYO+cDQR3m4CR8/EeX5+aJrk6zEwvcIKuepHAz+lHSmeyJXyG8OsMAhHF4ir?=
 =?us-ascii?Q?riskoDl/NlvRY9JloIK2hOa9EXGAhScwxkB9HaKeYbmI1Qmp+3k/wdoB/Eh1?=
 =?us-ascii?Q?b4Gq7w7A9nGyoQqNy4wRzQoDKjts4QH/vJPkNKiqBkYcPvszaCjIfy2OtrFz?=
 =?us-ascii?Q?GOVUql5vRA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db9b2659-b952-4531-eade-08dee0e16c1e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 13:19:52.1258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o1AcoEG4T+wELtMk/o+x8cLhRdeIOjxn50mC0xnJWpga53Cn9hWAbQ7Gfq0nWbxa73kwR/qe3EK+ryjIWrMakQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR06MB9248
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[vivo.com,quarantine];
	R_DKIM_ALLOW(-0.20)[vivo.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118789-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[panchuang@vivo.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:panchuang@vivo.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[panchuang@vivo.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[vivo.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vivo.com:from_mime,vivo.com:mid,vivo.com:email,vivo.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E1D674B8F0

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err_probe() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/firmware/qcom/qcom_scm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 6b601a4b89db..fad3e73791ac 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2822,8 +2822,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
 		ret = devm_request_threaded_irq(scm->dev, irq, NULL, qcom_scm_irq_handler,
 						IRQF_ONESHOT, "qcom-scm", scm);
 		if (ret < 0)
-			return dev_err_probe(scm->dev, ret,
-					     "Failed to request qcom-scm irq\n");
+			return ret;
 	}
 
 	/*
-- 
2.34.1


