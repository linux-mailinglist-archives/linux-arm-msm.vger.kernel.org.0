Return-Path: <linux-arm-msm+bounces-102914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEk9Hia33Gn2VgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:28:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0AC3E9D59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E7A2302D97A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 09:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92F53AEF5F;
	Mon, 13 Apr 2026 09:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axon.com header.i=@axon.com header.b="ZdYFktG8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010018.outbound.protection.outlook.com [52.101.46.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213B73AEF2E;
	Mon, 13 Apr 2026 09:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071406; cv=fail; b=cMH/ET2XTrWG5/MDhGZYsmbXPBuWwfsX4N+s3g9mlbd7OPIbmYgWnpZq/DASEM8RS7okPE3jDO4Sl+5gJQ+F4RH9JwipvjWjwPNGBcFzoEL2oYrX/FrBMpeN6Rfw3iA3cgbuv/gUHbm9Vbd6YmaFIPOcxcFjqgxCNg0L0xOO1xI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071406; c=relaxed/simple;
	bh=vy/q/UP7u9JNS894FnuNCc9rV6t7Qxi276+bnXp/CpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZB3I+GGF2FXSNz+9rIP0iv2/+WdobOqXlRRuL1UiV6rBhL+oQDmfhUXjepFjAt2h9ArS30xABV5Gfv5oIfZCxetyJQP5ohNiqjl9na5gu5UwRg6rYQ7Z8W92Q0Fg3k+z30K3fNTiVzD7kxSBkj49ydtUJ+I0S1zxjfjAUGIg4zE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=axon.com; spf=pass smtp.mailfrom=axon.com; dkim=pass (1024-bit key) header.d=axon.com header.i=@axon.com header.b=ZdYFktG8; arc=fail smtp.client-ip=52.101.46.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=axon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H0VvfiFii/ptG+oPLU89SAOdFVgN8LEbZEAivAykWrrzcLMG1d3vc1jWf0ZkpukasrPuzNcjkfj6pTxx6UPZFxswCDM6wiDDYwS2iocmk4+yqe2JtMpdwqarp4ijIklXl6CUO7dC/zD40V1+2WJ1AjuTRWg/qMY709WSGK5Q3EdJTFcEZXHaXGgLne7Ac1qIyjB/wnVkBXvLRPvHlz68+OgYVncmjECRevUyZBHKVoDUMs+NJNd3Qz186cw0+1RE0S0ObkaS2Tp5/lH3nszqvmX9JmOmk6ZkOoSi8jXGpql9GOFA0KlPw//McJMXFwDkByA+Lf54nv7ZKHlecv4eOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJgD98GxhW9rZj73Ic80yb+ZB1d3Vj0gm7MxOC2Jggg=;
 b=VE2irZCPNUt9IkFLr/1FrbLCJOhZMZCZYFKp4cT5dk4kWFE44GQdfJQwHHYbmaUzQsfofUaLszBFrb3uKcLlFAkF7b7/BI09qtFR0AFOLUTqZUv7JQWz8KRBnx1H+Yw0wRvrfeBUxyWzLz9UN5Nv8+9NGG+inXO2YN/KzTr1F1BR4o+gFefaVezE3rf/IndjSzug6MkgoJy9jm+xb/B9dSCSAfkoVnoQC9SINOQkrnqr7LcxkcyxFHirDkY88JgVJwiaSauJVorDkwrgM5hTmDhRayRjMQcFkrDSrH/8Z4A2nda/Q0FPgrp9Noi+/HXQQEmNeQsbIkCiIkecqmBFWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axon.com; dmarc=pass action=none header.from=axon.com;
 dkim=pass header.d=axon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axon.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJgD98GxhW9rZj73Ic80yb+ZB1d3Vj0gm7MxOC2Jggg=;
 b=ZdYFktG8QZldDZypdbyycjxPbPJLVPO3BTHRn4fa02pfDM+Wzg4PSMNUqKX8a1vNJWjrrTO4g1zIo/PAa+YG8rSFFB2zPxIUH2vKrp3l5gQ2vw7OCk+eXQ6go3YppKU41vKS57h447mjv8PAmQMIzZ09YZR51SWMjXihE2lMB3w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axon.com;
Received: from SA2PR10MB4524.namprd10.prod.outlook.com (2603:10b6:806:118::8)
 by SA1PR10MB6367.namprd10.prod.outlook.com (2603:10b6:806:257::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 09:10:03 +0000
Received: from SA2PR10MB4524.namprd10.prod.outlook.com
 ([fe80::f41d:e38a:4741:e76c]) by SA2PR10MB4524.namprd10.prod.outlook.com
 ([fe80::f41d:e38a:4741:e76c%4]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 09:10:02 +0000
Date: Mon, 13 Apr 2026 10:09:59 +0100
From: Joe Sandom <jsandom@axon.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2
 board support
Message-ID: <20260413090959.pt3smt7oxqb4toxr@linaro>
References: <20260409-rb5gen2-dts-v3-0-be736355d4b4@axon.com>
 <20260409-rb5gen2-dts-v3-5-be736355d4b4@axon.com>
 <luljw64s2p5kvxe5itn6zwbjaugkj7a3hndfn6ff25wbwqcwv2@numatjdny6ho>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <luljw64s2p5kvxe5itn6zwbjaugkj7a3hndfn6ff25wbwqcwv2@numatjdny6ho>
X-ClientProxiedBy: LO4P123CA0486.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::23) To SA2PR10MB4524.namprd10.prod.outlook.com
 (2603:10b6:806:118::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4524:EE_|SA1PR10MB6367:EE_
X-MS-Office365-Filtering-Correlation-Id: e3a91da3-29d8-400b-19f2-08de993c71cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	BtIxlSqZKkfBV68+qjO2M92eEGUvFom6lHMMxuHwpaINpiEvLp4W0SPrSkam5WPUKLyQdi+Lbgn+awW15n/z5qgDIhKGweRsJBqj2sCaJXrAoX7gGs1RCUIKANR/ZR05OUkb/GivWHHjHfHbLBImJNSHtqNYd1hsMsP2qwWC7xYAhHP4Z1uj+F31n5hbmbvy2kG/EiJ7hCwbaK5NCEc7Yws40t9L/YAuUEVdqOI3vxSzq1NbQcTvc9bYATmr9fRkIMeJTUOIpShbFEU7WLfwScKl8+V6hDuBEY98ZnG5LyCU3StCHYg1nxBg2xjdyVIVo77x08BnrO3hLbVVFYUvdzqKwCUXO1I2D0dW66vmIH1umvArUc1pK3Lzu4XxRMzcsFSElIoxMo0WD6PLlJOW7foIS5xnR2e3IlCMa/gb+u7QIslHKO1iczlxVZfTVC79HV01xraoKVm85wQesfdtGCfluiAbkl/szSTZzuJka8yZi6V/9JX4PmCHSKaIgimuaTw5iit2f20NrGmOc7qMSwognY8kJrdZCw6EWdRbzLj+XY4JR2zWXEbINuGZA2IJuoXJa3RlZzcKw9iVTKNwfBZ9vaAB7Dt3riYOZstMGBRqfe+cPU4q518so3u2GIcfN5WtGGNYa5Lu1GNmwSqzd2UwScqAikE6tdZj0hDUxdOpvmTlHiwFvVghB/AgiriJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR10MB4524.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YbdJ3uOVUGjGPVGl+4QswiCyV4xvQMXGL8x75D6Lgis8FmRg1C0fNp6wPhgu?=
 =?us-ascii?Q?9OTSFy5KMgcHj5lFsMppxrsEbJve/f4MwWSyill1KVm/bLCPgnbiRNPvuIxU?=
 =?us-ascii?Q?Wazm0EpvKTxbelNrPI6ZKTmGAubc2ebzZh2VaeljQSO9ulTAMl0QblYzV9UV?=
 =?us-ascii?Q?1CDAeRASGdI4D4+rZoBvLXyWLzDvocFqUB64s7MKKTx533Hqw0rtVoVy/vbB?=
 =?us-ascii?Q?Ik8mOYVmS00EDGXJmX5KNVJClStmyD/NNQzwENVyfn5wkKxddQr2vVBwA59j?=
 =?us-ascii?Q?OGU6ACKalXuIVlXAAwCa+4XJTPyGhFpvgdQbvFYjuLRL37wziKe0qKzJykjo?=
 =?us-ascii?Q?5XV9v7x2rcNmNnaunsI0yx6lqbtF1tY/xfhKbVXJwzVNIz6GKb3l+VGxH6tW?=
 =?us-ascii?Q?0FMbqENKp4gRk5cTmhfWba3+p3MOS0LV97gPhYvF4dyTch0F5LXmazUVyuT6?=
 =?us-ascii?Q?P57egLdgw9zZqFDscLH6saDBDpllZvluYgdAhC1Qr60cBWLtPA2/ykxftGf2?=
 =?us-ascii?Q?azW92ED3tlhftVsfEeRg3nKhwv9SnqQChgNEpTohl9v1S5qItdyYfytNbkue?=
 =?us-ascii?Q?YXj1gVLnkW6HBNnto/k8rJIfQGpG6Zu3BCqKefF0mcNMug4UatiwBnTo6z4N?=
 =?us-ascii?Q?Nguigmqj/BWLBmnnrTmsTmTgtN7+N7ZS/4E3WdqgSgGjluMWBWKXsDFkpErC?=
 =?us-ascii?Q?zYsQuqDRWsuX7t8L/m77sjI1ZVbdMXIlrpYtjdhCRFL8IN4cbK/QVRCDIzNS?=
 =?us-ascii?Q?RFgYeqcPVJnpX2oPuXziud+r5U1Hqtu0tWMx9KU4J04KuZVcXaqP1J1hPzWX?=
 =?us-ascii?Q?SeqOML3726SnRwTt1Vs2dStX7JH8hIy1mYO6oMAbIYBLnDHvyjoPvrqWG+2D?=
 =?us-ascii?Q?NIevjMJDnZputVWN5/zWKFGy5VIxkwATblsv9S2S1EhsYLSjKOrYIakVC4Fa?=
 =?us-ascii?Q?tX1TmstTHEc7v7jD7LXUJVQ5T1wSuvO7YoMAS9ui3cDBXMaJZZwDRCunsg8S?=
 =?us-ascii?Q?ZIMUGA3XygNOBp0VFWR33vr2vXU+cYAig1abBu34eicViF8wQLCf4RhWKe/n?=
 =?us-ascii?Q?OtNEixRYC29fffk11aBhlB2zREYXZaFYarz6onQl/n1GImLys89QxOBT9mUo?=
 =?us-ascii?Q?WNx7A6atD9WyVQXXbPdeBQ+5n4MjiPwpautLJwugPrjH+WQ24VaD+EbI8Lb7?=
 =?us-ascii?Q?+fPlWkPm6fFRAvU2Y+OUwHCFXRBaUDVxzsGTbB6Blkgjx7AGWlLzLhLoaOIZ?=
 =?us-ascii?Q?kyeTjqZEsDbDoxM4MMvQJPI7/TTBHAHJJhvR/3fHGbIKzo64+e64VM/OdKnb?=
 =?us-ascii?Q?768lYHaXYEtYJElV/cG6E68UQls27Ob9xqrNFgbpjfpTosjhUW54QKISC2Ke?=
 =?us-ascii?Q?m6uSM55UwAyOx6LsqejRSvbhIwfivBAYLhndAF0F593BIEn1yWgguFxfotbz?=
 =?us-ascii?Q?Z4HlV9jRxE4t4kXHSWuEAQGojqr1EcLfBzgRT988jL9Dotk9LDCfrfud3U58?=
 =?us-ascii?Q?/5Pc8ozKNMKjLzeGH0QjTkjP6uxb/2lHc8CbIc1FsDldpe6hFI292o6M19hx?=
 =?us-ascii?Q?PWnIeQgEaiXtU69bsmFyUvFN/rdU54fe4ExahDC1CDqpyjSyncSnG+NTS9Dq?=
 =?us-ascii?Q?VrwIywQPUUu7fYzBf0/+DDXfSWNcKCQS3h0F58o3L5tHP88vDobntlKXdMo8?=
 =?us-ascii?Q?YNwZWBIpDn9F/Lx/iesYLczQ7KxvWQywbp/a5YjqghVH4mM1?=
X-OriginatorOrg: axon.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a91da3-29d8-400b-19f2-08de993c71cb
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4524.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 09:10:02.1785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b575368d-7461-447d-a9a4-f90f22962981
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3I1zG0jFZL3wbNS085x4+s6901jk2Svqu1pWQbJhpVwkTLedj5Q097ZdjxUpXNkgSx8fYv2wkkVjILZ3fZmdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6367
X-Spamd-Result: default: False [5.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	ARC_REJECT(1.00)[cv is fail on i=2];
	SUSPICIOUS_URL_IN_SUSPICIOUS_MESSAGE(1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102914-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_DKIM_ALLOW(0.00)[axon.com:s=selector1];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[axon.com,reject];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	DKIM_TRACE(0.00)[axon.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.233];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jsandom@axon.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	REDIRECTOR_URL(0.00)[urldefense.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.2:email,0.0.0.0:email,urldefense.com:url,0.0.0.1:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,2b:email,axon.com:dkim,axon.com:email]
X-Rspamd-Queue-Id: 9B0AC3E9D59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 04:39:55AM +0300, Dmitry Baryshkov wrote:
> On Thu, Apr 09, 2026 at 04:26:57PM +0100, Joe Sandom wrote:
> > The RB5gen2 is an embedded development platform for the
> > QCS8550, based on the Snapdragon 8 Gen 2 SoC (SM8550).
> > 
> > This change implements the main board, the vision mezzanine
> > will be supported in a follow up patch.
> > 
> > The main board has the following features:
> > - Qualcomm Dragonwing QCS8550 SoC
> > - Adreno GPU 740
> > - Spectra ISP
> > - Adreno VPU 8550
> > - Adreno DPU 1295
> > - 1 x 1GbE Ethernet (USB Ethernet)
> > - WIFI 7 + Bluetooth 5.4
> > - 1 x USB 2.0 Micro B (Debug)
> > - 1 x USB 3.0 Type C (ADB, DP out)
> > - 2 x USB 3.0 Type A
> > - 1 x HDMI 1.4 Type A
> > - 1 x DP 1.4 Type C
> > - 2 x WSA8845 Speaker amplifiers
> > - 2 x Speaker connectors
> > - 1 x On Board PDM MIC
> > - Accelerometer + Gyro Sensor
> > - 96Boards compatible low-speed and high-speed connectors [1]
> > - 7 x LED indicators (4 user, 2 radio, 1 power)
> > - Buttons for power, volume up/down, force USB boot
> > - 3 x Dip switches
> > 
> > On-Board PMICs:
> > - PMK8550 2.1
> > - PM8550 2.0
> > - PM8550VS 2.0 x4
> > - PM8550VE 2.0
> > - PM8550B 2.0
> > - PMR735D 2.0
> > - PM8010 1.1 x2
> > 
> > Product Page: [2]
> > 
> > [1] https://urldefense.com/v3/__https://www.96boards.org/specifications/__;!!K76kBA!3gMyDZ3RqJTInuD9UAhneyD_Ga1OTDOm5CbLp15KXHLPV8aflL7_S_i89xs_S_dJ2SHGHnEEyMD5zZMi7iWLAuaVhZPXvg$ 
> > [2] https://urldefense.com/v3/__https://www.thundercomm.com/product/qualcomm-rb5-gen-2-development-kit__;!!K76kBA!3gMyDZ3RqJTInuD9UAhneyD_Ga1OTDOm5CbLp15KXHLPV8aflL7_S_i89xs_S_dJ2SHGHnEEyMD5zZMi7iWLAuaUXzBHLA$ 
> > 
> > The default msi-map from sm8550.dtsi is deleted for both pcie0 and
> > pcie1. The QPS615 PCIe switch on each port exposes more than two
> > devices (1 USP + 3 DSPs), but Gunyah currently limits ITS device
> > mappings to two per root complex to save memory. With msi-map
> > present, the ITS MAPD command times out.
> > 
> > Deleting msi-map causes the DWC controller to fall back to its
> > internal iMSI-RX module, which handles MSIs without this limitation.
> > 
> > Signed-off-by: Joe Sandom <jsandom@axon.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile            |    1 +
> >  arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts | 1573 ++++++++++++++++++++++++++
> >  2 files changed, 1574 insertions(+)
> > 
> > +
> > +	lt9611_1v2: lt9611-regulator-1v2 {
> 
> I think that comes from the RB5 or something similar. Could you please
> rename the nodes to follow the pattern used by other regulators
> (regulator-foo-bar) and place these supplies accordingly.
>
Good point, will amend for v4.
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "LT9611_1V2";
> > +
> > +		regulator-min-microvolt = <1200000>;
> > +		regulator-max-microvolt = <1200000>;
> > +
> > +		vin-supply = <&vreg_l14b_3p2>;
> > +	};
> > +
> > +	lt9611_3v3: lt9611-regulator-3v3 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "LT9611_3V3";
> > +
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +
> > +		vin-supply = <&vreg_l14b_3p2>;
> > +	};
> > +
> > +	pmic-glink {
> > +		compatible = "qcom,sm8550-pmic-glink", "qcom,pmic-glink";
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		connector@0 {
> > +			compatible = "usb-c-connector";
> > +			reg = <0>;
> > +			power-role = "dual";
> > +			data-role = "dual";
> > +
> > +			ports {
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +
> > +				port@0 {
> > +					reg = <0>;
> > +
> > +					pmic_glink_hs_in: endpoint {
> > +						remote-endpoint = <&usb_1_dwc3_hs>;
> > +					};
> > +				};
> > +
> > +				port@1 {
> > +					reg = <1>;
> > +
> > +					pmic_glink_ss_in: endpoint {
> > +						remote-endpoint = <&redriver_usb_con_ss>;
> > +					};
> > +				};
> > +
> > +				port@2 {
> > +					reg = <2>;
> > +
> > +					pmic_glink_sbu_in: endpoint {
> > +						remote-endpoint = <&redriver_usb_con_sbu>;
> > +					};
> > +				};
> > +			};
> > +		};
> > +	};
> > +
> > +	pcie_upd_1p05: regulator-pcie-upd-1p05 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "PCIE_UPD_1P05";
> > +		gpio = <&tlmm 179 GPIO_ACTIVE_HIGH>;
> > +		vin-supply = <&vdd_ntn_0p9>;
> > +		regulator-min-microvolt = <1050000>;
> > +		regulator-max-microvolt = <1050000>;
> > +		enable-active-high;
> > +		regulator-enable-ramp-delay = <5000>;
> > +		pinctrl-0 = <&upd_1p05_en>;
> > +		pinctrl-names = "default";
> > +	};
> > +
> > +	pcie_upd_3p3: regulator-pcie-upd-3p3 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "PCIE_UPD_3P3";
> > +		gpio = <&tlmm 13 GPIO_ACTIVE_HIGH>;
> > +		vin-supply = <&pcie_upd_1p05>;
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		enable-active-high;
> > +		regulator-enable-ramp-delay = <10000>;
> > +		pinctrl-0 = <&upd_3p3_en>;
> > +		pinctrl-names = "default";
> > +	};
> > +
> > +	vdd_ntn_0p9: regulator-vdd-ntn-0p9 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "VDD_NTN_0P9";
> > +		vin-supply = <&vdd_ntn_1p8>;
> > +		regulator-min-microvolt = <899400>;
> > +		regulator-max-microvolt = <899400>;
> > +		regulator-enable-ramp-delay = <4300>;
> > +	};
> > +
> > +	vdd_ntn_1p8: regulator-vdd-ntn-1p8 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "VDD_NTN_1P8";
> > +		gpio = <&tlmm 67 GPIO_ACTIVE_HIGH>;
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <1800000>;
> > +		enable-active-high;
> > +		pinctrl-0 = <&ntn0_en>;
> > +		pinctrl-names = "default";
> > +		regulator-enable-ramp-delay = <10000>;
> > +	};
> > +
> > +	vdd_ntn1_0p9: regulator-vdd-ntn1-0p9 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "VDD_NTN1_0P9";
> > +		vin-supply = <&vdd_ntn1_1p8>;
> > +		regulator-min-microvolt = <899400>;
> > +		regulator-max-microvolt = <899400>;
> > +		regulator-enable-ramp-delay = <4300>;
> > +	};
> > +
> > +	vdd_ntn1_1p8: regulator-vdd-ntn1-1p8 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "VDD_NTN1_1P8";
> > +		gpio = <&tlmm 42 GPIO_ACTIVE_HIGH>;
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <1800000>;
> > +		enable-active-high;
> > +		pinctrl-0 = <&ntn1_en>;
> > +		pinctrl-names = "default";
> > +		regulator-enable-ramp-delay = <10000>;
> > +	};
> > +
> > +	vph_pwr: regulator-vph-pwr {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "vph_pwr";
> > +		regulator-min-microvolt = <3700000>;
> > +		regulator-max-microvolt = <3700000>;
> > +
> > +		regulator-always-on;
> > +		regulator-boot-on;
> > +	};
> > +
> > +	sound {
> > +		compatible = "qcom,sm8550-sndcard", "qcom,sm8450-sndcard";
> > +		model = "QCS8550-RB5Gen2";
> > +		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
> > +				"SpkrRight IN", "WSA_SPK2 OUT",
> > +				"VA DMIC0", "vdd-micb",
> > +				"VA DMIC1", "vdd-micb";
> > +
> > +		wsa-dai-link {
> > +			link-name = "WSA Playback";
> > +
> > +			cpu {
> > +				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
> > +			};
> > +
> > +			codec {
> 
> codec < cpu
Ack. Will amend for v4.
> 
> > +				sound-dai = <&left_spkr>, <&right_spkr>,
> > +					    <&swr0 0>, <&lpass_wsamacro 0>;
> > +			};
> > +
> > +			platform {
> > +				sound-dai = <&q6apm>;
> > +			};
> > +		};
> > +
> > +		va-dai-link {
> > +			link-name = "VA Capture";
> > +
> > +			cpu {
> > +				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
> > +			};
> > +
> > +			codec {
> > +				sound-dai = <&lpass_vamacro 0>;
> > +			};
> > +
> > +			platform {
> > +				sound-dai = <&q6apm>;
> > +			};
> > +		};
> > +	};
> > +
> > +
> > +&i2c_hub_3_gpio {
> > +	clock-frequency = <400000>;
> > +
> > +	status = "okay";
> > +
> > +	lt9611_codec: hdmi-bridge@2b {
> > +		compatible = "lontium,lt9611uxc";
> > +		reg = <0x2b>;
> > +
> > +		interrupts-extended = <&tlmm 40 IRQ_TYPE_EDGE_FALLING>;
> > +		reset-gpios = <&tlmm 7 GPIO_ACTIVE_HIGH>;
> > +
> > +		vdd-supply = <&lt9611_1v2>;
> > +		vcc-supply = <&lt9611_3v3>;
> > +
> > +		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
> 
> pinctrl-0 = <&lt9611_irq_pin>, <&lt9611_rst_pin>;
> 
Ack. Also another instance of this for the tc9563. Will amend both for
v4.
> 
> > +		pinctrl-names = "default";
> > +
> > +		ports {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			port@0 {
> > +				reg = <0>;
> > +
> > +				lt9611_a: endpoint {
> > +					remote-endpoint = <&mdss_dsi0_out>;
> > +				};
> > +			};
> > +
> > +			port@2 {
> > +				reg = <2>;
> > +
> > +				lt9611_out: endpoint {
> > +					remote-endpoint = <&hdmi_con>;
> > +				};
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +
> > +&remoteproc_adsp {
> > +	firmware-name = "qcom/qcs8550/adsp.mbn",
> > +			"qcom/qcs8550/adsp_dtb.mbn";
> 
> Sound and GPU firmware is under qcom/sm8550/. Let's don't multiply
> entities and keep all firmware in the same subdir (including the IPA
> firmware too).
> 
Fair point. Will amend for v4.
> > +	status = "okay";
> > +};
> > +
> > +&remoteproc_cdsp {
> > +	firmware-name = "qcom/qcs8550/cdsp.mbn",
> > +			"qcom/qcs8550/cdsp_dtb.mbn";
> > +	status = "okay";
> > +};
> > +
> > +&remoteproc_mpss {
> > +	firmware-name = "qcom/qcs8550/modem.mbn",
> > +			"qcom/qcs8550/modem_dtb.mbn";
> > +	status = "okay";
> > +};
> > +
> 
> -- 
> With best wishes
> Dmitry
Thanks for your review Dmitry.
- Joe

