Return-Path: <linux-arm-msm+bounces-117828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id unPaBLwYT2rjaQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 05:42:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA4772C613
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 05:42:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vivo.com header.s=selector2 header.b=Ng1C9532;
	dmarc=pass (policy=quarantine) header.from=vivo.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117828-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117828-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7C11F305E1F1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 03:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D337E3AFAF4;
	Thu,  9 Jul 2026 03:35:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013038.outbound.protection.outlook.com [40.107.44.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0353AE1A8;
	Thu,  9 Jul 2026 03:35:41 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783568143; cv=fail; b=KSGqlSer0BDxySElqz6/8DIwZ9FSvoOiJZBHE61OxnC33/16VvsMTYoTYyZfoOGGw/ZJmTebkKdudKNqmQL97hKxVoWJvWUORiELaqcOiGc3M/vtG/PDTOaCpjCXZPKNLOYUbLH7mKCjIRD3tqqCE9sNWPXe2dwWnOchMQSnTmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783568143; c=relaxed/simple;
	bh=qdB9bY+JzOFa+efFt9wfEbsWBnIUPZyrzlNaNIuud2U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EZUFStIAzsKmblrthRiRtDoj+5pfAedZEflzA/q7rE7qsogAN7CnnCOufIavurldrZwC3txkoFTcXp2JEP2D24HEEXMiuvIbLJVkwq54hXrSY7L7Dhs4swdJ6bNYXoqsqDxBU1cLrJCss3U2QNi4jp+wqdqW1N5xXAZtydbvpWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Ng1C9532; arc=fail smtp.client-ip=40.107.44.38
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2JATjk8e2xndQytGk5n2xnf46R5aY8YGLZ9F3YtLd7OmrrouGDwoCM9bTYuWA6XchvAwyWdg/o3lfqj+OYztqXk7jzSxT60F9NcrKGrvPbklGW6GLlxnByU9I/MUviwW3P+ZxdttzlwQmAWzp8+2ilb2IYKrWMh8TEx3Cpz5TSp191wIJAQP/+5Gw/V3qCRmKyNu1DJtXZC0Bs0WxsiKzxGYpaZemlo7RC5krlfaFXiHqWHITnncKjI4wKfNe1uErgA9TiKrvNb+r14TlDSBl7ZCTkaqTO5sn5annK/tfh/Va0CQdfHGEQ0HIQt42vubrDsbTdlsgklxh15hThyOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ef7KvaHXb8A59JsoFu31euCt0p7aqES7MUvLMS7lc0I=;
 b=sEwlfcSUTogCCu66t3XKarZA6JSeYSNGFsEah4fkVzUNidW3pTOvkLbupP5KLd2lub8mE7WjI3d9IDr6hXFHIkVdljVIuCEX/51FhIjIAaIQTC3MarhxTXacm4QQAUUqVK7OPYrHS28fVqU6dskwvZbdMxZoQujT36FQIcfXAvqmSTl1cRbk5jObwXq+UbDYgfFMG6VEFlsAkGOwKgyTqaDwBBF0HY88+ENoH05ZRF3yMBZatxn8aVxdVvm2sxr/rrPeoIjfxkl1TBE8MmHTGFVd+hxbxpdPQm2w6RZguoW98jNcp8ItKEo12quSw7PTnXr9GsI73tUR5hegKfKPew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ef7KvaHXb8A59JsoFu31euCt0p7aqES7MUvLMS7lc0I=;
 b=Ng1C9532lyt8q7U0wBEylFovWuWHifGngpcGJFrkJ6ZKyRZJbT+QQjMNTa51q/8gn3iBrpJLF504isTUM08PYn6m4QZ8I4I2DwxBWKtuudRXIB3Hl5HHqGmp1ZxcYsAt+9Ke5tet1VVwVRJI41Zl0JWVrWtK0SQq9hMx39dgMxioqffiubPGg3otnHflxd55xhLDLa1ssmRy9HfJajY+wtCJw/ivPf2cj/CvjT080/cGaFeYk1T6NeEqqCnIg0oXBbWluVVVbVyMQhK1+WJFWGm9y/NFtO8AcIllVE/IaSTiGyqBIjRhfUCF/31wKK/dMgL0PnmoaXQRQ/kt2c3bTg==
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by TYZPR06MB6213.apcprd06.prod.outlook.com (2603:1096:400:33f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 03:35:29 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 03:35:29 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Sebastian Reichel <sre@kernel.org>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-pm@vger.kernel.org (open list:POWER SUPPLY CLASS/SUBSYSTEM and DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 29/43] power: supply: qcom_smbb: Remove redundant dev_err()/dev_err_probe()
Date: Thu,  9 Jul 2026 11:34:08 +0800
Message-Id: <20260709033428.362970-30-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260709033428.362970-1-panchuang@vivo.com>
References: <20260709033428.362970-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0017.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::9)
 To SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|TYZPR06MB6213:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ba71a50-0b0c-4482-a492-08dedd6b1f67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|38350700014|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oouW/s86QQkW2V6fK0EEHQ1OaQMXGeOxDr5C6lb+i9Uz1Piv1kvl/RupQQMFTZMYce781ja5t/Xafu/+2nBiyQ1Owkg96gKV3y0qC99OFFyM5czMIHiuqrnkXpj0oxc4h5abk/mTS3/GPbdwzH3vpxWF0r+XeYzDAJz85j/xZlKpVqs9emSrpPh1xv55MOrp5uFz5XlBY59zJB7Zf2+fDiOI8xUOFiFC0Tk6HRgTeEmFENpjUBFn1hvXduT5WNemMjCsovBnu3SPnuDhqlRMjyq09rzPQZ8VptI52sojFwbQk8czhNRiJuFpYZrN0BAdOuW6/qgd2F5/fpNIHx2wHdqnypkjBuogrI3MWmnKvAUDzSKwQ4NIuIJI9bWt/ZeFWcKtN3cDde9w7jhThXQK+nNu/jKdLtoMbBe2vGhE2MNTWeGLDIwVjrS/XatXyu79y/k6Epy3E+g/NYBgbLmu/isFVUj6oMfu0/Vzb8tmsOiHlS/pNKqUMcO2uU9vR3jdQFqryOPEAj2r3exVINn/nrJxhp2pkh7iIWnYmOvubgQiyzOXq/qXPIiWd7wNnQcbEUvCryAPRCvj+SSXtHO/CVpcxyqEfrIkqPVjoLX2c6e6V8+JqWDXUMp9n8oAclC/5kvIBxvOvt6vixCLBrLv6t8YbXkVKmARw6+AgJqoaCqoWqyPSmK6mMQuxaXAyUF/3MbczfB4h5sszgquLSoj4b2RbyCBeY6iszP1uNpXESY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(38350700014)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iqVfNaPUzd8Sk9jtFk7AOC/ngzgoi39JBAokN0OyZoZxgEjDdH/kw6XmjzB7?=
 =?us-ascii?Q?ETk294FGjKsbIT1yPgvT3FwZqo94hrA+z8wSg+ozzpYLscUVTfcW0+pXvKpC?=
 =?us-ascii?Q?7+gkgmF5ziKsXpu7CHwKG2DfNvMSZun8JQN8bCXFjSaFLNix1Ek0kvkygshN?=
 =?us-ascii?Q?vXa9iaWLhynbYSJtRwzZuRRbkISs6w1sGbF9B8oCN89MpouuoTErTK2nABpt?=
 =?us-ascii?Q?tawT56Q8tgqPv0MaKHHnwpigDnJrShtYV+JHqVtS38oV/B6CP47Ck4UD77Bl?=
 =?us-ascii?Q?xgpXWlmmukzzBTHmBS2Y1SqPrMhno9gwPXV98RIH/2/92FAP2AzjWVtsQtY6?=
 =?us-ascii?Q?MUAsxCuxLjvlLAKng7BhjaBN6GCs5aCIlHFOlMZ9NNugMHf+/7E3cU0Vzq8t?=
 =?us-ascii?Q?ueIAEZp3hvzrNbz0SP2qAGfnHlxy3tfL1o7P3W1wh0aBBxiRycwxVt/GKZc9?=
 =?us-ascii?Q?v/WwWMqaeSYhF2WwAEyM+I039vVx12eDKZdYEHjZmqylEySwbUSFtZgd/a4V?=
 =?us-ascii?Q?Vz0Lc5HpStgm9BiHIISs2EQzeguV0OoPKRcoPvQ7qKe7PXoYcTky22MBhhIR?=
 =?us-ascii?Q?e6jdQaSLdlgX2Em+Tf6aDBOc/LpQG9F81FqV1tztkgIFd/BkwkfAyLXVGUDH?=
 =?us-ascii?Q?1AlQ2K6OLFd77MZkhuibHfndv5TvyJWwfFvwuEQXsId50r4qmp34Bxk4V1Pm?=
 =?us-ascii?Q?E6MpMyrgDkrjIUtOavOlL/jVo1q2UtAVVIX7TJ7P4OY445d+xXZl+WQJDhPC?=
 =?us-ascii?Q?1gDQTyaQs4+AUAW8XXfHUiYTgRxRPEdCOEcmoj4A0kZjmrtvMcjNyRnK+C7L?=
 =?us-ascii?Q?i+zBfhtna/rYP1mZpldBsO4qDvTQfulgZi8VzyfnFUrZPTqf/1z9Nd/UeX5y?=
 =?us-ascii?Q?+jRBj9/rsIQMeThDz4vwGj0u4MsyJ3yd/+895jP13eu6lH3OwPToUpzXrxzR?=
 =?us-ascii?Q?dSJLORePhpFQUBwLAxFXJxn7eBzs4T6C85e+5S3KKj2eyXzVN1sCpaSGp3p5?=
 =?us-ascii?Q?BqKK+IPKhgFSnPb0TgNVT94GIbm/18WdTUbeNXNzQwpJOkmLPQOQ3GOOKy9M?=
 =?us-ascii?Q?Z/P7GLvZcL6+UvHWGVugerJnH21cY8kk2ZxF/79ITPBCwvelaD56pIjBBHYN?=
 =?us-ascii?Q?KAwOxxtkq00eWlF619ssuz3EQ8Q4KBYfmg7ql78gjgi1jtY100nk0j54RuXt?=
 =?us-ascii?Q?ccvoV+642IP9dMVnhfCVnYjza3jyAGJNGd8Q+W1MLfd1mW6CiQ/X9bKF9OLN?=
 =?us-ascii?Q?UUoK6btRylgfb3WGc+7lT0hQmN8Wg5wTkwUpwCD43Lv5zB9AR46RjRw1P7Mc?=
 =?us-ascii?Q?Q2awVKM1LmaRt+0MUAyz7aYZ57zGTWq2NqpQ9tqLcwQfiSZEJXKJ3CxSfS7Q?=
 =?us-ascii?Q?OwNVDieSGNd3gw///mKlevJZIvm+9t1ICPVXhX9sJrXzWuO9ibsgI5ccoizM?=
 =?us-ascii?Q?PXz9bPtFxF71IAfFa+NUZGgJl7ivrlO6WMstF7hhZJrdFKRPoPkUHCw0/LJz?=
 =?us-ascii?Q?AkHex6ypCRCPsKiQb60auJ7UhtbcvLkPsY71blrYCuL+x4MQ4w7qCWCKKtJ5?=
 =?us-ascii?Q?ypMefplyYLDvp7DRpIipyfCDVykKZdZ2zYLN3v7fcffSZGrc+2FAyPj5HR5a?=
 =?us-ascii?Q?TCl/PgU+5gOekTsOluq32urL/tgRGjpEbh2TiLxC1uc+NfNf9QsPTLBcknIH?=
 =?us-ascii?Q?BssPZUsMW+zZV/n40lUv0aInmhnIrChkSUeQntPk10RIVCEaHPFcW0Uynrlf?=
 =?us-ascii?Q?ytukupDEMw=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba71a50-0b0c-4482-a492-08dedd6b1f67
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 03:35:29.2975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XPUJXqdGTcdydrSLZckyWZk/pGHMJqR/l9lO3SUJb0z7fWMcgJRXIe6wYu13MbvhZZRet53TQNryAQxsZNoIcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6213
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[vivo.com,quarantine];
	R_DKIM_ALLOW(-0.20)[vivo.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117828-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[panchuang@vivo.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:panchuang@vivo.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vivo.com:from_mime,vivo.com:email,vivo.com:mid,vivo.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0CA4772C613

The devm_request_threaded_irq() and devm_request_irq() now automatically
log detailed error messages on failure. This eliminates the need for
driver-specific dev_err() and dev_err_probe() calls that previously
printed generic messages.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/power/supply/qcom_smbb.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/power/supply/qcom_smbb.c b/drivers/power/supply/qcom_smbb.c
index 28afe758a2da..f33aab9619c4 100644
--- a/drivers/power/supply/qcom_smbb.c
+++ b/drivers/power/supply/qcom_smbb.c
@@ -937,11 +937,8 @@ static int smbb_charger_probe(struct platform_device *pdev)
 		rc = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 				smbb_charger_irqs[i].handler, IRQF_ONESHOT,
 				smbb_charger_irqs[i].name, chg);
-		if (rc) {
-			dev_err(&pdev->dev, "failed to request irq '%s'\n",
-				smbb_charger_irqs[i].name);
+		if (rc)
 			return rc;
-		}
 	}
 
 	/*
-- 
2.34.1


