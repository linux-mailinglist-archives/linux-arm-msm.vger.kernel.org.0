Return-Path: <linux-arm-msm+bounces-42622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0077E9F6235
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 10:57:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5EA27A21C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 09:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0D0197A87;
	Wed, 18 Dec 2024 09:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kEM/EN6Q";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kEM/EN6Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2071.outbound.protection.outlook.com [40.107.21.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026A8158D6A;
	Wed, 18 Dec 2024 09:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.71
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734515835; cv=fail; b=IQbbY0V48lw+OotYBZDhpnKiU6z6qGPFRPbiAiETEovnrrGwJngh6LKGGgRTb2kQSr45KRzHmiZHldllZh2Da5Ls645qSp/gBi08x3HRdOT9pOyuJwlUifxSPk3t7AK8oqIWo/6ZcKG3PZUEy05bzTNp+zAHrq7heW65fHOVbPg=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734515835; c=relaxed/simple;
	bh=fYl+Z9F2+iKYukdp4xYR1fYpQQW+VE9Qh1/JqEFfocE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EH1jjlHrCnQTtl0/UjdMBLd6cE+8A/rUbFVNB+l5osuAqcNp21JuhGXAHxRqBaguJl5+MG8iDxrSkd7v+tn1KfdV3936PI5lYD5gUuNmLDeL71sEs6MRPhz07Huh4mKKx8ysxEwRLDCAiE0d8NYUxIAhXljQ4binXHHV8CKhqNI=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=kEM/EN6Q; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=kEM/EN6Q; arc=fail smtp.client-ip=40.107.21.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dyZ3/ZwoP3aUEHEbcRR7SbY0zY1W7uGzAdE0BRqOy/xRpKar6sM093kj3gdFCJfW3GVEYVBvLuhEhmrpNksWQa+yugGVhyzYBE0+58gPyvIeIqiwXpuR+mHF/lluCAqk5ldCwKFARJm+WUmDTik2YW5lHSfrcZ7Wof50lIRiPt/VBP8maLEi/90YPIIqVbSUDobL+N+1r+cfQjM6S5RMzRz3oISrkTxeFJV7lxqxTBNWfkO3oyF/VtCP4nwigNLK1hQDqz1YwU4vgUBfy+UZBrOgRnzMklKyVDNnsPNV32/DNIP16neTs2Jyhdn/WDoonehECj7gfYOaw4gOcvxNGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JyUjcs3rcwq8Lkt/UGQWnvQK3vDjYt9sW+5nP/0W1DI=;
 b=esUQK3VtwjDyeZCLbM4zklXMAy/ZQfasGW/Qdu+fXIwQsmpOKCRTAmHukIAvwbLhFZYj0ZYMTMVOaU9Xs4AjszzkeIKGlnktZvj3KbcZTTlEUbRspveafBrxc2DGVPVWog9ppQsYNx+1mOtaohIbgove9U5X0V00xVZmc+ZN6pimrJWKyJsNpfVIBMRI0mTFyzuwoZdpKBmuVoAwg7uVkvYqEqa6dtwQRoOe92iFiFjFD1MBcT8zezjaN/Uw3eeL9Qup/xlzHbt7d0C8zvGMZPa+Vp9eagXhLDl0zu2DaPNSi2RlUx8Spg+mYzp92YPM2LAs6yBUwclZPWgL1sjFZA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyUjcs3rcwq8Lkt/UGQWnvQK3vDjYt9sW+5nP/0W1DI=;
 b=kEM/EN6QNjJK0cnDe1hm6vNuyMHDNacJCDxZR6KA52g/fGqIRqcTj2JF/VBRh4IBl5K97+C9e5Iu3jhUbV/d10RryDE/edxQHRKhVL/h0XG1AycI+nc1+wWWLprp7oXPpjsMp/2FD7d6GoZXvNWgvzTGiXMQjaBhCTd22VpWaes=
Received: from DU2P250CA0010.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::15)
 by PA4PR08MB7458.eurprd08.prod.outlook.com (2603:10a6:102:2a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.12; Wed, 18 Dec
 2024 09:57:06 +0000
Received: from DB5PEPF00014B97.eurprd02.prod.outlook.com
 (2603:10a6:10:231:cafe::6e) by DU2P250CA0010.outlook.office365.com
 (2603:10a6:10:231::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.22 via Frontend Transport; Wed,
 18 Dec 2024 09:57:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B97.mail.protection.outlook.com (10.167.8.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Wed, 18 Dec 2024 09:57:03 +0000
Received: ("Tessian outbound b519d6c64997:v528"); Wed, 18 Dec 2024 09:57:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8ed2bed8df755d71
X-TessianGatewayMetadata: oFPgeP24SPXvDTUusMn2FxKXyXQGWWXmQjEunDd5ryANslK9erKdvgmL1jQvuv0zexpF8pLwNN+zw9zBDNa1H/08JOq6OW5vUYJcdH5oeIfwppVR1OHsipYC1KfnsJg2lPYTGpgvawNhsX4CB2M4Vu5lBVGcLJOc2iFOyhz4bNG8f9PVCFEoGtyZ1M+CMK2lzfqVCXvJbl23Ge7HX6aFww==
X-CR-MTA-TID: 64aa7808
Received: from Lc04189cd5ba8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6651E4B1-E96E-40BE-BD9A-EE3D505AE8EF.1;
	Wed, 18 Dec 2024 09:56:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lc04189cd5ba8.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Wed, 18 Dec 2024 09:56:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9g34ei5P0zUR+JrulAoDFF2zGDDd2t4SlazeIFuFS4xZCbI0/3AnTg8Nwm5zUxnyD8wGx0SbOYQS22fYitATaNaiZ4SkX9cwvMWjDh5M3wbFm8l2Q/WspFP1DTF0hAYYtmG7u9v7XIYki4SfLGr3kLCvNYdL2AwzrqfxH2N/xMi/Tffj9bYztwQfEVXGgyHKRWTJE9/ArwzYhRJH0kxyUAmTpm3hu9KE9pnQolb+oBWX2c3tH20ZkGzGHw0rVDeufVgEP8EX18pP3wt4S7Q5rAxGNutab813Mw7MuQzrUanaJvwD49qlVFrkGm/bkxE2YZMT+NaKWGFG7Yfhuad4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JyUjcs3rcwq8Lkt/UGQWnvQK3vDjYt9sW+5nP/0W1DI=;
 b=Wr62H/aGUKF7lG5dX7MA/AwkrMhi/31cGOX0XSomvGAptjVRS/TQgnwuKrceYFfOv1LLcUXtTbwBNZt4fafIrE594nTMJR52ZOVZmNekCgvMVdLz86K2HWD5pZu9hvrePi71TivEvZaD0KnzTIGVeQyV8WiYcjEZaZiptgMjNSQF+pgVcanV5EA/SpdOnYxkApMBAOQj4ElMJP2PGoqQoaNqnxY3t7iKrTVYgQ+md+oK5J6UwkIYJnoivfhIkS2/+3rGgkPtPfDn49pfSNmx9lN35SGec3fU+BEb3sbdUudnXIhB+5iCKuB1SQVH2BrdgxwkYT2mMWM/iIBO6d/fPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyUjcs3rcwq8Lkt/UGQWnvQK3vDjYt9sW+5nP/0W1DI=;
 b=kEM/EN6QNjJK0cnDe1hm6vNuyMHDNacJCDxZR6KA52g/fGqIRqcTj2JF/VBRh4IBl5K97+C9e5Iu3jhUbV/d10RryDE/edxQHRKhVL/h0XG1AycI+nc1+wWWLprp7oXPpjsMp/2FD7d6GoZXvNWgvzTGiXMQjaBhCTd22VpWaes=
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com (2603:10a6:102:31d::14)
 by GV1PR08MB10953.eurprd08.prod.outlook.com (2603:10a6:150:1f5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 09:56:49 +0000
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::c392:bd57:e439:1f25]) by PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::c392:bd57:e439:1f25%4]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 09:56:49 +0000
From: Mike Leach <Mike.Leach@arm.com>
To: Suzuki Poulose <Suzuki.Poulose@arm.com>, Mao Jinlong
	<quic_jinlmao@quicinc.com>, Mike Leach <mike.leach@linaro.org>, James Clark
	<James.Clark@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konradybcio@kernel.org>
CC: "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>
Subject: RE: [PATCH v6 2/2] coresight: Add label sysfs node support
Thread-Topic: [PATCH v6 2/2] coresight: Add label sysfs node support
Thread-Index: AQHbUE20GnjS7uT85U6OE59zjNIFu7LrwIiAgAACq7A=
Date: Wed, 18 Dec 2024 09:56:49 +0000
Message-ID:
 <PAVPR08MB967401DC65384CBA26B6829C8C052@PAVPR08MB9674.eurprd08.prod.outlook.com>
References: <20241217063324.33781-1-quic_jinlmao@quicinc.com>
 <20241217063324.33781-3-quic_jinlmao@quicinc.com>
 <985d234c-e088-469d-b9dc-7904fcf5a91c@arm.com>
In-Reply-To: <985d234c-e088-469d-b9dc-7904fcf5a91c@arm.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAVPR08MB9674:EE_|GV1PR08MB10953:EE_|DB5PEPF00014B97:EE_|PA4PR08MB7458:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cd35451-4bb3-4efd-00d7-08dd1f4a5318
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|4022899009|1800799024|376014|7416014|366016|38070700018|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?E0bz0tryZ9R3zzyTQpp7fLX4vj1bWDDzlxm4rjZCV3g98K2khm8IkfjP2cmM?=
 =?us-ascii?Q?C3UeR2/VU9/HMsFhbSc+zbNyopueQfQq9PtKRg+v6r6MTmnlLtSzv24K73XP?=
 =?us-ascii?Q?cqfbGQ0m/Rcy/j2agaCSAHMfy7Ej9IlFrgh3tCnlXNVNHVPoMAcPNzM7m0oW?=
 =?us-ascii?Q?7iXhuS7UKa1NJRTQ84/Y/HBTB//vm9NvPIRAjdJ0j86ujp8u9kfeGJb9QY8q?=
 =?us-ascii?Q?ZtczHQuhYadYVXM1RR6289M/V5gdem2P7HcsfBthzecrNCsPe3VCRzlTE7/S?=
 =?us-ascii?Q?Ssg4s75lQwj5DZKv98ghm8NOqSlCRSi2r1jb6k2ryFVH/lWoXNmhcj+2PuG0?=
 =?us-ascii?Q?xear0iIA+RYKssBAX2dCoqciMxqz25Oipa48RRIHMttjQDxx4e0BxW1yEEHr?=
 =?us-ascii?Q?WvVu3a/gygWXsmcDa/2DvKtzyoVYdkTIWfkLLY+1xKYKkiCLiFAyIw08vK81?=
 =?us-ascii?Q?CdHuKETWVaTbH9Pi/dyxqBBbIbcnqkX/WQFOvuzVSiZkIh4YKtQvKvp2l9/4?=
 =?us-ascii?Q?xozEXy7B8M61hX9dwUpXJp9qZnTKB880v58Bj0NOSqUohu3ZOC4wJ3AVlhC6?=
 =?us-ascii?Q?mcXWzdohKenJ3Yu6t+2kHotyPJePYA8zREw4X3Di2xRfWjCG24KwsNGSqTPR?=
 =?us-ascii?Q?FBgGQnOicWMxBxeKb6TudebFy6KK9Jim04YOdeUOmyuPVpsBcpmJ5E6Fz9wz?=
 =?us-ascii?Q?LCYvM3RbVzda/ZI71ZcF+iYnvd+JP7f0jQWfdEPcsNhkeuEhra8mpBXIo5Pv?=
 =?us-ascii?Q?teTRhHMhJLLrhBZeGjV+9j892KEMDwmjwNIzobg/KKszqXIOdbLDeh5U6UHH?=
 =?us-ascii?Q?ydzZE8A25oxWm0KSOth3LZLEsWMiZmuyq6b3P9x0wqISnDZpCfuQhA7xThzq?=
 =?us-ascii?Q?Zaq6JEXDn68G3Z8xrXW4TySZKhuNFdhaLGqa41oq+cs2trZog+T3qsC4BJr+?=
 =?us-ascii?Q?cR/7aaMcBTis9fUdS+lhUHBFJ+ymeVQ+HcroQt2E4dg9u7h4Gf7yoTbpk7EX?=
 =?us-ascii?Q?77r7iikaNHc2m7hhkzmoq1YkXWO4yG+MJL/WGmco+v9yHQRcolRDjaJOLq9/?=
 =?us-ascii?Q?27V/bJEntgxdUqChzPHs0PxDDkelxxAViaKlcCsWY+x9TZr/ujCpnVrWx9BY?=
 =?us-ascii?Q?kkZYOwo000311lE4IDXoiOv9ODPgcmPm0mleT778RIViW/P6Dj+7sF0Zkrul?=
 =?us-ascii?Q?zB5DB484uL89TLk17Me979bByrJpTEa91XTj+j5zkpJ3QCLSxWiLmuYoiP7w?=
 =?us-ascii?Q?PnuSchQNlr1UL+eWHZ9TNColVXA5rxnEVehoKy84OrGl1+W3m175mFVz7qhA?=
 =?us-ascii?Q?xp5m4sFGoCyWj2DSblTZHb3fn5TF0Auxd4dD57ZWb4IC3iboGzumK5jZZbVG?=
 =?us-ascii?Q?oRJyuCimuwLKJzt6omzzI7GCC62Vr2RsuQ3hHMG1UO/Rzbq/4waZamgbNmD2?=
 =?us-ascii?Q?sbDdt4eL5JQt/MFnbYUv+jCbWXSuq0UNG++ztb7ARfTqvZQDltRJeg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR08MB9674.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(7416014)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10953
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:102:31d::14];domain=PAVPR08MB9674.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8a4a7614-4d63-4601-a5b3-08dd1f4a4a6f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|4022899009|36860700013|376014|1800799024|14060799003|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t2+9vlMGmQ2f7mTKRlckcfnqqBhDDd1aFsHDoPz1SctaIZASry7HqBTByZ0h?=
 =?us-ascii?Q?1/FrczEGMTIu5GHwdYMt46A12WNZEUZ2QK25f0KX6tde74zEMk/7EYphh49P?=
 =?us-ascii?Q?kXKx+dbuEMCDWon2QGgHUv1N3rTRPwmmnntvnQTA/B6ohITRkKEr/+GzxwWv?=
 =?us-ascii?Q?dE6rgRM6fDNyAp4jaiA54yswAyXAspVNvWBKcvQIlORBtoohe2GEem+xOYRu?=
 =?us-ascii?Q?tH/e3c+ppl80BbOHlczTaq4F6OjMp22tEN5aRJX2Xc6JM+ZyBg5Vzu2LABZc?=
 =?us-ascii?Q?AFt8NFG1WeyVk/j3fu7sS3fqOc6Z2/ZDJv/GLDtGE48zh8RMH7d5oBQMo1FP?=
 =?us-ascii?Q?/dLkOXIBwSBG3nMhV3uSeS4tiUPSkKj1PQa9llGMEI2ZwvPYdbZDvw7feV02?=
 =?us-ascii?Q?6JwihAJJJBT6dfymOa+sIW7tiBVXrSU7ZB3Nt4DuOBh8AMZaLaju8i7zBXCd?=
 =?us-ascii?Q?PclHlbDjsY64iSlMC6Ns5IOg7wNnGluN4taB/5mqDw6mVkYQkILiAdl4sfMC?=
 =?us-ascii?Q?o1LuRslnRToarTwNH7OSX1MVzFN7N4J86uzl6J4jNEtSoSXkqRd1bqtpUdLc?=
 =?us-ascii?Q?rPoiSlyQv/PJLRAvUvhambfwtdo3VbrUi8XCFMM0E5noS897BVpbhJ4+kOm2?=
 =?us-ascii?Q?gK886TA/7eQ1FhtyX9GsfwUpsboSkxiCixtjWMTB5CP1Satp7aDKuwnwqKWZ?=
 =?us-ascii?Q?hjVKkl92hvvkH97xzY8rqv0bE57KaPH2XD/4eYmH5hrMYk2BH3FyMi1svGS7?=
 =?us-ascii?Q?EfjDgahEG7rb88Zf5B8or0n2FuneoW6IvMJZDQeb8zPPvzzqd+zYbV4+Po0G?=
 =?us-ascii?Q?mOVA1Pw6Vc6Rbr5ZkNrbA/3PLZAjv2wZf+pDCEqNw3MzA7knPPsEbMlV2shc?=
 =?us-ascii?Q?U5qQeXjGxg1To4oes3dVKbShSoo1gKm7wAZBgCIKVOfCtJG+HZepzkGfXe2V?=
 =?us-ascii?Q?7lzSX2UJ21adB2RgovCYCWl/Rt3KCIMjsgZN3LOijK6CgPq8YQP9J+pJsZz8?=
 =?us-ascii?Q?s8TKIzTJKx2no49JhMtpOD3eEYDrvyDEtwUSvOf4OQbgjMtRi9MK0KehZ/V3?=
 =?us-ascii?Q?kDGHGWX5qZ/qo71SPOAcj+/Pxatd5IXCR67/HFbfoqtXZn3skroqYTr1XQgV?=
 =?us-ascii?Q?tF9bj4Ykxtw9D2Bf15Ls3A+2a2jgTtaDV7txH2cLrG3YtQcH2YzFBss44ex5?=
 =?us-ascii?Q?/hV4JtA2dVgSHTPwEYxgYCmFDVVGH73+DiC8bd3WH+lTMg2p0kj3Jk3S0QMh?=
 =?us-ascii?Q?V1k4ce9L2S/WhrbWanmysZMDR1cqLpYDRco40bWZgYPSUFw67GuKwgYZ8oBI?=
 =?us-ascii?Q?awBaKXMwDMgiRniuUicLj0PPt4qYDie41487LHRN9OEtLHbaV5QThh0eYA9c?=
 =?us-ascii?Q?h7IGw9vy9q3BSTv3BDE8R81Bjn6SVqYKo/ko0E8WLcIp46htjZNbnmNDoAER?=
 =?us-ascii?Q?Oet4xqun1/y5MIzdtEMERFw1qXQeZAa4lwJ6iVWhMrdyMy62p0duGD1oNQCy?=
 =?us-ascii?Q?dt+goQksoGsWYm9eyxOz3DImM6CIdqrFpfiJ?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(4022899009)(36860700013)(376014)(1800799024)(14060799003)(7053199007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 09:57:03.8601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd35451-4bb3-4efd-00d7-08dd1f4a5318
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7458

Hi

> -----Original Message-----
> From: Suzuki K Poulose <suzuki.poulose@arm.com>
> Sent: Wednesday, December 18, 2024 9:38 AM
> To: Mao Jinlong <quic_jinlmao@quicinc.com>; Mike Leach
> <mike.leach@linaro.org>; James Clark <James.Clark@arm.com>; Rob Herring
> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Bjor=
n
> Andersson <andersson@kernel.org>; Konrad Dybcio
> <konradybcio@kernel.org>
> Cc: coresight@lists.linaro.org; linux-arm-kernel@lists.infradead.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> msm@vger.kernel.org
> Subject: Re: [PATCH v6 2/2] coresight: Add label sysfs node support
>=20
> On 17/12/2024 06:33, Mao Jinlong wrote:
> > For some coresight components like CTI and TPDM, there could be
> > numerous of them. From the node name, we can only get the type and
> > register address of the component. We can't identify the HW or the
> > system the component belongs to. Add label sysfs node support for
> > showing the intuitive name of the device.
> >
> > Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> > ---
> >   .../testing/sysfs-bus-coresight-devices-cti   |  6 ++++
> >   .../sysfs-bus-coresight-devices-funnel        |  6 ++++
> >   .../testing/sysfs-bus-coresight-devices-tpdm  |  6 ++++
> >   drivers/hwtracing/coresight/coresight-sysfs.c | 32
> +++++++++++++++++++
> >   4 files changed, 50 insertions(+)
>=20
> Do you think we need to name the devices using the label ?=20
>=20

No - absolutely not. If we use label to name devices then we have to valida=
te that the string is a correctly formed device name and that it has not be=
en previously used.

Using the canonical driver selected names works best as we are guaranteed a=
 unique name and the information label can be used to provide flexible cont=
ext information that best matches the users requirements.

Mike

> Or is this enough ?

> Suzuki
>=20
>=20
> >
> > diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
> > b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
> > index bf2869c413e7..909670e0451a 100644
> > --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
> > +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
> > @@ -239,3 +239,9 @@ Date:		March 2020
> >   KernelVersion	5.7
> >   Contact:	Mike Leach or Mathieu Poirier
> >   Description:	(Write) Clear all channel / trigger programming.
> > +
> > +What:           /sys/bus/coresight/devices/<cti-name>/label
> > +Date:           Dec 2024
> > +KernelVersion   6.14
> > +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
> > +Description:    (Read) Show hardware context information of device.
> > diff --git
> > a/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
> > b/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
> > index d75acda5e1b3..944aad879aeb 100644
> > --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
> > +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
> > @@ -10,3 +10,9 @@ Date:		November 2014
> >   KernelVersion:	3.19
> >   Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
> >   Description:	(RW) Defines input port priority order.
> > +
> > +What:           /sys/bus/coresight/devices/<memory_map>.funnel/label
> > +Date:           Dec 2024
> > +KernelVersion   6.14
> > +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
> > +Description:    (Read) Show hardware context information of device.
> > diff --git
> > a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> > b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> > index bf710ea6e0ef..309802246398 100644
> > --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> > +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> > @@ -257,3 +257,9 @@ Contact:	Jinlong Mao (QUIC)
> <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_t
> >   Description:
> >   		(RW) Set/Get the MSR(mux select register) for the CMB
> subunit
> >   		TPDM.
> > +
> > +What:           /sys/bus/coresight/devices/<tpdm-name>/label
> > +Date:           Dec 2024
> > +KernelVersion   6.14
> > +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
> > +Description:    (Read) Show hardware context information of device.
> > diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c
> > b/drivers/hwtracing/coresight/coresight-sysfs.c
> > index a01c9e54e2ed..4af40cd7d75a 100644
> > --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> > +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> > @@ -7,6 +7,7 @@
> >   #include <linux/device.h>
> >   #include <linux/idr.h>
> >   #include <linux/kernel.h>
> > +#include <linux/property.h>
> >
> >   #include "coresight-priv.h"
> >   #include "coresight-trace-id.h"
> > @@ -366,18 +367,47 @@ static ssize_t enable_source_store(struct device
> *dev,
> >   }
> >   static DEVICE_ATTR_RW(enable_source);
> >
> > +static ssize_t label_show(struct device *dev,
> > +		struct device_attribute *attr, char *buf) {
> > +
> > +	const char *str;
> > +	int ret =3D 0;
> > +
> > +	ret =3D fwnode_property_read_string(dev_fwnode(dev), "label", &str);
> > +	if (ret =3D=3D 0)
> > +		return scnprintf(buf, PAGE_SIZE, "%s\n", str);
> > +	else
> > +		return ret;
> > +}
> > +static DEVICE_ATTR_RO(label);
> > +
> >   static struct attribute *coresight_sink_attrs[] =3D {
> >   	&dev_attr_enable_sink.attr,
> > +	&dev_attr_label.attr,
> >   	NULL,
> >   };
> >   ATTRIBUTE_GROUPS(coresight_sink);
> >
> >   static struct attribute *coresight_source_attrs[] =3D {
> >   	&dev_attr_enable_source.attr,
> > +	&dev_attr_label.attr,
> >   	NULL,
> >   };
> >   ATTRIBUTE_GROUPS(coresight_source);
> >
> > +static struct attribute *coresight_link_attrs[] =3D {
> > +	&dev_attr_label.attr,
> > +	NULL,
> > +};
> > +ATTRIBUTE_GROUPS(coresight_link);
> > +
> > +static struct attribute *coresight_helper_attrs[] =3D {
> > +	&dev_attr_label.attr,
> > +	NULL,
> > +};
> > +ATTRIBUTE_GROUPS(coresight_helper);
> > +
> >   const struct device_type coresight_dev_type[] =3D {
> >   	[CORESIGHT_DEV_TYPE_SINK] =3D {
> >   		.name =3D "sink",
> > @@ -385,6 +415,7 @@ const struct device_type coresight_dev_type[] =3D {
> >   	},
> >   	[CORESIGHT_DEV_TYPE_LINK] =3D {
> >   		.name =3D "link",
> > +		.groups =3D coresight_link_groups,
> >   	},
> >   	[CORESIGHT_DEV_TYPE_LINKSINK] =3D {
> >   		.name =3D "linksink",
> > @@ -396,6 +427,7 @@ const struct device_type coresight_dev_type[] =3D {
> >   	},
> >   	[CORESIGHT_DEV_TYPE_HELPER] =3D {
> >   		.name =3D "helper",
> > +		.groups =3D coresight_helper_groups,
> >   	}
> >   };
> >   /* Ensure the enum matches the names and groups */
>=20
> _______________________________________________
> CoreSight mailing list -- coresight@lists.linaro.org To unsubscribe send =
an
> email to coresight-leave@lists.linaro.org

