Return-Path: <linux-arm-msm+bounces-95212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCs8EYtNp2nKggAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 22:07:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E52191F7276
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 22:07:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CD7D31C55EE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 21:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD98388E42;
	Tue,  3 Mar 2026 21:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="l2gzDjPU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013028.outbound.protection.outlook.com [40.107.159.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBDC396580;
	Tue,  3 Mar 2026 21:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772571767; cv=fail; b=keNRFOIhx2MKW8AvnzVoQhjmQWgM2pK4aOPEW0vyCazc5DIjxeBKWbY0DJll2T7nKIrm7QVrdI03DwY58YXh3YnFSGICvehRREq7t5L6w0vnadlZhvPT8xZZ/48J/IWiK9sqowE7eo2497Oa4Ptx/8MAJzYsUcDFoZRwcJFufKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772571767; c=relaxed/simple;
	bh=Z8CVn+1UHHohpiJ6q+fhDmAOZIcIu+I33URvz66xLHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gZIcs9U8H9YmDjoJEENLFpX1WJuHwE8eqmABHKkrrPZUZ46IvSwrMe22Gec/4VCwiVJN8/wmL9yERukEsR10ILY5o0rZt6O9fmmIuszaCgSXYoY0SPC3byIXSi8ZCVnv6agTFaeh6M7ho653qv80esc+uuI5NrdfZwhaw37fiAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=l2gzDjPU; arc=fail smtp.client-ip=40.107.159.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxLdCWmr8wpvQ+hkDcoBZZ2wPvInEBByH0+f0Jgzy1nkxw7p7Glng5bI053VGfZsGPq2AV6X0mvU4mq+kjUUmAZwXLPkof2V2FTFtoBs0385WsYkTL6codXHdqRwFUudMY72F9Dq98KPO28Q/Ik0JYlXUpKfmfjs4tBE/VzWgOZj3YSvT1fTfLqYqLegnz538VvKWDoGlAENgbxo0yIc0nR+wFVrPwvWPV3clYiZGq2A6oOwiC4VtmrGG4+NO3VFd1KCP2uXuB/GE2v/LzlDYe9sDwXdjlPMswYUh4t3irqdq1gUQ0fdqJPPuk8oJ756+7pBYvjHu5bsDidKO3iCsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EhobpqFBSEizyH1eYfgTcznYEha5XHIBpUwHFAfxt8=;
 b=Qvifwvjg2gDUUkuwrPcmMVPU+jeHzB8hVdS8SbChyX7qw2z70ZzrI/ehTlNBE11wfJZSK2cVNnZTz9UZEmgR7UZiPInVwWbcjO2n1AP6kbY8Dn3Yesz/S+13lmQMEK7EDOIYSnOj6qzTqYNh2ebhTvaUpM+v4B/cEYgujU0B87EGdekAyxw/kWom46LesizVWZPMbIxeCJyqDUpqOmUV6RWugk6p/4OA/26lB502zC/aIWcOFPMDo66Ma33daCAnjtxB6+8sa65gRnWaRHntO74Wd2lzUX+/PLgk1g57Yk3ZAe8+OP0FwphQsGXesQI0W4Yt5XI/HAVId0m4/n97Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EhobpqFBSEizyH1eYfgTcznYEha5XHIBpUwHFAfxt8=;
 b=l2gzDjPUD9iSjoHqQJCF1pAUM4Bts640XZyAWiTee7uxDa0ozu8wPO2h75LqvYzFQvEZXh5lvD/VeWfAuiKwz/5Q4+lqisFawjbHqemoGry4TgrTgfOyf8oQWDjp65Z46KkJfauFL0uw41TofP2ddAGh7b1NaipBawHJlQGi3NB3ZZlgB7cErnvljxrE5IS4z9lOyln26jv4nDiQXnATyJ299+1Pb2U8krP3TehRqSrsHrAqFEqTmivj0xJDkFEtl1IJqVzYe4WKFvgWAH/0lqztFtXGDrOkr1EjwgfXfIRT3j83zJZOwnXNSnJFWwCVtrAiAPikcmi9lhSeKpVuSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Tue, 3 Mar
 2026 21:02:39 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 21:02:39 +0000
From: Frank Li <Frank.Li@nxp.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	hanguidong02@gmail.com,
	ysato@users.sourceforge.jp,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de,
	abelvesa@kernel.org,
	srini@kernel.org,
	s.nawrocki@samsung.com,
	nuno.sa@analog.com
Cc: Frank Li <frank.li@nxp.com>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-sh@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 3/4] hwmon: axi-fan: don't use driver_override as IRQ name
Date: Tue,  3 Mar 2026 16:01:07 -0500
Message-ID: <20260303210131.2966214-12-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303115720.48783-4-dakr@kernel.org>
References: <20260303115720.48783-4-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB8PR04MB6858:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dbfed32-17a7-42d1-3883-08de796833ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	Lj6WeDC6v/RtZ7vin2s7jqO0ts8RVMe8WU7lxhxaD5CGbSNhuDzHGOBlpaidIUcOTQym4xlvKM285ifbJDpNm1DgQxfU7M0oSJanGLK6UrQv7fdBCeLKr2ZZFQhqoipEpRB8D2ku6b0YnAOc60zQvD1wF4/joAYyreKkoEuLhAoPoOnVkd6PNB6TVL2A0Ocr5EKItHI9ZgIwSZpct08lPABrJEeNkcKUr0bfdjNsmIutsLECJnQNowCg7q/SXbbEIbdWQa1bEbMQVcILB2laWZ6RLsj0AP3FJP6Sh3CgkLpnaDqlyzp3epRiqz7Bbsc7mn3BoXamdnST+r/qU9L8T6PjlSqzVq5+NUlZ5rJYEtDyf9GuZPyCxDAYYg5IilQ3ebKIiLR9f47pnBMZa5iYjCbtw3iq9I40M0EXxy5DnOD1iVcusJhosiSiksM0QqZBFt3J9AhwzbjTJbyM1fY6X4kTR4Cd0SnEvB/xNDeyQ1BJ6SaAfD4uj4m6vqvYR0n+JONtFP3Eb1hQbq4KSZnGzY8k11bHCbwwSP4/cPgf2/1yn9MqODjVUMUkjQB+FcO2GzQPTiWQrOuXPIW3hbkfEW1CnU/X9rdZea2cgexhbwZFsaMxholzQFtAIMu5gVPoUHFrue0seh3zJ+bcct+fEi9lu934EpGLyBSLcNOveJCQILRmkz99pNjuLpLnnzhyXJJnAe2HRQ5Dz9C5426Sq39yX6K48OSj1R6talUYZu38y1QB4s0bMK1efEsJn+iSwxJh4aqwvTImSOPzScA+3y/nl1wdmbWMI6XLO67tdOwk0OVNGtqZ2N1R1cRBVe8S
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGVEcU9tTWZYZ0wvVEFSS1NENDNLSkZTVkN1ano4dkdkdndFa3l6TTFUcm9T?=
 =?utf-8?B?M2VCRitxVWVTTVlvM3lvMzJwQnZOWU5uM3c0cWRsQVpUYktMenZuUnI4cWZN?=
 =?utf-8?B?N1pwYU8wZXZ0ZDBVR1NBcHMwRVZxbE1mOGV6NlZmQk1wcTZlUG1FK3Bsc0tR?=
 =?utf-8?B?cTNaZEFRMG1TTmozY2ltVXVwcEliVDRYREVROG9NblNaVHRhNjFmbWFTZG9y?=
 =?utf-8?B?b0VMTFgrclArR1pNdmc1aVAyWFFYNVN3bEhqWkFWeHh5U2JDQUtrdmU1WUxo?=
 =?utf-8?B?YzV3L3RYVkpQUVl6NGlRRWxDVjVQMjd1UlNKblZqYTB0WWlqaTdGUGVQZmVT?=
 =?utf-8?B?Z3cxOTEzNTMySUViVFE3bXA4K3lyOGNxWDhjMCtQQmNvU2toMGpKd1l5cVBa?=
 =?utf-8?B?OFZPU1llYnlPcW15akpGR3M0dHd5c1lQOUZDS1lHZWxBc2paLzFScnA1cmFI?=
 =?utf-8?B?bUF6UFk2cmhUL25jbmpydlBSOVY2M2VyTEo0K1BzaXI4NHhaOXBabEFRRG56?=
 =?utf-8?B?bkdteVNXTTcrbktuRUdvRU1VbjRMS3R6aFdibnNTdC9Ieks3M0p2UzNRb2x0?=
 =?utf-8?B?ZnBGV3VpR21MR2hqMjdWYjI5OFh4MTNCeWhRSFZSMkpwaE9QWi83UVVmbVhp?=
 =?utf-8?B?cnJMdEFjZnlMQVdScUxkNkV4VWVXMkhTcVA4RDNNRUlYelhxQlMrdmJ3ZGRE?=
 =?utf-8?B?ODNjenc1TEVqLytJSmVuVjNhWnhNWVQ3ZmovZ1VjQ0tzZFdZQkg4QjlGZmRo?=
 =?utf-8?B?cWFtSXdaV3AzU1BXYlM1Q1pOVEJhb3BpWnRrQWJEbmI3SHVXZjRuVEVaRW53?=
 =?utf-8?B?c2xuL2E2aVhWeUFOd1hqK3NGVE9hYVVUcGVTc0UvN01VVnMxRTA3cnNFR0Vo?=
 =?utf-8?B?YUZDSWsraTBtSnNMWXFNVFdCd1BJQVFhL05ad3c5U2RwM0IzVnRxSlViSjBo?=
 =?utf-8?B?U1pVcEl2eFRqcWdZRkJlUUtPTmtCN1A4Y2RGRXhlR3QxQ0FVbzlNQngwNjZR?=
 =?utf-8?B?c2xCRytmR2FlWEJjUWpGRUdNWmRGa295Ty9iZ2x0L2VBQnYydlZ6T3NKWFRj?=
 =?utf-8?B?M3d0clV1dEZGWnA2K1JDNi80VDBZa0hobjhsb1pybzB5eUJTQkFtZk9HVmxV?=
 =?utf-8?B?T1JwWkZubVM5T0ZtVGY0RTd6Rm9WdTB3andUZEVNbFZKUFJZd0t3TlJPdi93?=
 =?utf-8?B?VEFEOVB2RWxhSStaQ29selF2WU1XeWRheWdDRHhIcjE1TkhtNU1rWUtwREtM?=
 =?utf-8?B?T2UvNjl6b2NtTHR4RGpZQVBOUjFwYUx0eGVyKzdtSWg2STRrRlpsYVVNOXUx?=
 =?utf-8?B?dmpVc2ZPSUlpd2loRjZNdWhGcTRwQXdqZE5CdkI1TDlOclBLblg2VDVqeWhw?=
 =?utf-8?B?d1A5OS9pZndNYng1eGxsRDVnTit1bmJlVkxHRnJlYnYwcjdma1pZOFdaeS9C?=
 =?utf-8?B?c2NDRFgxdG4xcW5kVXFMMEI1R0NjTGtPTzk2UW1rT3NKaUNJSWRCVG9TVzNl?=
 =?utf-8?B?eEx4OWZsUGdPbXJvTllzQTFkZEVwK2NLeHNzS2RJN3NLS3N2UzFGREdUMzR6?=
 =?utf-8?B?K0NwcTY4czV6MlFxcjZFdUsxL2ZDejFVN216eGlreFMybVFmZy83YVppTUpR?=
 =?utf-8?B?dE9WVXBaWUtWN0h5QkxseWpGWndFbFdhQms4aER4NGN5ZTRJRzFMWCtpRG4z?=
 =?utf-8?B?NkFvSDVZbG84RE9jTm1vWFF4dFlWcnVqcVN4dmhMdzdoVnU4bjVncEwzd3R4?=
 =?utf-8?B?emlESVhQWjR0M0drSFRLa3ZrS0lUN3hUUEtmdzl1c3RSN2lrZ3YvQm1tVUk1?=
 =?utf-8?B?Z1Z0SjNabU9LMjUwSUJBbnRKVExjaFlrQlFGRUQzSVJlZUpTcDNrQnZ0RjFW?=
 =?utf-8?B?YXRjSjc0eEtFUTgxMnkyd2R4bmYvcWIzbGYyUHE4OW5JUUFrOVh2R2tkSFho?=
 =?utf-8?B?cWFQdVNRWllTRmQzRCt4NzI5WDJRaWxKMGxBaTBSNm5FeS9TWnZaYTM2d0pL?=
 =?utf-8?B?RW11dlFQOEZQQmF6KzJhSXdYN3I4K3dMMjBoZXU0anVTVnhna3ZSQkRXWjNn?=
 =?utf-8?B?bUdhM1NtRnNyTW5QcDJHN0F5clRONU5NRzNmc21nVXdldmZXWHQwa1RZTVBW?=
 =?utf-8?B?QnNHUmJ3aGFraXZNd2l2V25YRzAwcEdMb05adHhqOTJMU1QwZnQrTGZNNjFW?=
 =?utf-8?B?VjgwUU0vTzVsNWg1Qk9oVnpuYTFpUjF1VzRwU0g3dTVGdDJIZXpWMmhyYXFT?=
 =?utf-8?B?VmRFaFJlTURaVHpvQUkwc0VFQjMvd0NtZU1uMWNaeXVZc1NoZU84Zk83Tnl4?=
 =?utf-8?B?NFhqWHZpZU5jTHN2RDZEOHdzS2w3YU54MTE1Q0EzZ0tPMTdEUzRwZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dbfed32-17a7-42d1-3883-08de796833ff
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 21:02:39.1793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQWf6WKZxHDKW0mkSKgWG/9C/PF6GRn7xhUseFyWucNn2dvdFZLTFqESJxtZz0Oc11OU8w3mBjOwm1ViAHNOIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6858
X-Rspamd-Queue-Id: E52191F7276
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95212-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,gmail.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de,samsung.com,analog.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Frank Li (AI-BOT) <frank.li@nxp.com>

> 	ret = devm_request_threaded_irq(&pdev->dev, ctl->irq, NULL,
> 					axi_fan_control_irq_handler,
> 					IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> -					pdev->driver_override, ctl);
> +					NULL, ctl);

Good catch. Using driver_override as IRQ name is indeed unsafe since it's
not guaranteed to be a valid string. Passing NULL is correct here; the
devm IRQ helpers will fall back to dev_name() which is always valid.

The fix is minimal and addresses the root cause. The error handling path
below looks fine—dev_err_probe() will still work correctly with the NULL
name.

Looks good to me.

AI bot review and may be useless.

