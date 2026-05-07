Return-Path: <linux-arm-msm+bounces-106337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCCCLqxo/Gn0PgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 12:25:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 515604E6C33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 12:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 173E9300BC96
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 10:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A821D3B4E97;
	Thu,  7 May 2026 10:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tW5VoVAr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013067.outbound.protection.outlook.com [40.107.201.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FEF3C0600;
	Thu,  7 May 2026 10:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778149538; cv=fail; b=RiKN49RzdWQjmBfCCNY6izDu/b0UxcTYZy0exUmCpdqHlwKyZtJ+pyYmc25uwuDdi5Wqs2cwgl2DySz7ZHQRgkT7OaFR3OTUE3wX/TjyISHJxfFIJCT1Qki8Ut23vyrMbeG0LZTgmzvusJuQg1i8dj8eBRlRtwHc6KIpjvAGjW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778149538; c=relaxed/simple;
	bh=y6YDLBu9j/vvHePVebpERyjbrKK5NxrKsGn+OpfwOPc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QxVLtnWAE9CbgGR8kjMFkhad3DKdLJpilHB7mdVxegWL6+oyyc/PxL/8L9i68jJ94NyxWko4wgBdSh5WDFZno4zL7cc38P3lnBqtpyZGbCkkpccp0qCDTV2lJVoiloE4nyooaokGCXNjIx1stqi9jwhAzhhtPKr39MYjIcMnITM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tW5VoVAr; arc=fail smtp.client-ip=40.107.201.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGN3nArTVsgKG9MHxT5QxpyVNbcrI6z+Dn0Y9fRfrtcUECCXE1jGxXFQTbN3nJhHVix/Yq+Nv5+8kg8Xkh94e+P4X5zHhJRq71c/+x938/bD693cI7FAYH2w29BxO9SIcGGv3YMrbXisRE+HkqjbdgcUre6hD7GBbIcwQoa2ZZEUHaGwmcwHIGz+YBXSrLNKg0OgdWtiD7X2EZqQ8D9F7qu0wOMCUjhzUBqNoa81QSmLX6mRIk3sPRhUzUK5DCzTPHG+Nx3j0sB/Mgqvs4r0gHdibUMIxRUUDuUiTxX4J6AzrlDes/YqJANWDhEKD18cT7GYZ/Prt7+/HWYxPB08Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjdkyEP3j+ksuGd2WXMLEneS629MBX0AVUsc5JnmCgk=;
 b=lp96tb5H18vHDctDp35BbnwZFNJIPXyBiqUxcqrilf7V0m25c7dS3Z6UEEGQaEV1iI/jpsIpQEgrU3f77D9Xz0wzZdt7dydXwPN8+So8WYHc4fYeh0WRVf01pgtlsrHSNHFebb64nSlgxTNZxX0zRH1aJNvbZZgDLQhXVbMU+h99XEUo5ZFmyvkuEhQaF0hCKl9rt6NUDNTke9rm7vuZ0YzFE19o7p1QVoENGnQfZEXyHNajjhxRXmylO6r11sFsqXLywDT0Euh0PNjjftcY+I/2vaunTKxCAeozZfCZfJ5+fkwn6EO3ccJ+7DJXhPWwCrcF/1AHuPq5nDKoVXbVDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjdkyEP3j+ksuGd2WXMLEneS629MBX0AVUsc5JnmCgk=;
 b=tW5VoVArT1sXFMm0oBHx3XVA6JsunmMU7wkm7L4cpHb2RjwbBV+VVybwX1UUA5ih3yTK+KTevYLJWOqzcP45Dr/o16hBHBQG9VQqdFJY+fOidbAdjLOObD+bBGNP1Oziygx/zkswMJuEb7l0k+0xlqXlQ+DPJE6oJq/pFUQVt2mr5EtD98c6M09ZeMi2vMjNQidKc0LlabI5ttWJ4KEgnxoEA7xXUxLELzYeTyDb97ItmbXZ9MwLTu6Mj0tTDKCNHdCAv7tWXvwbemFuN80KDzaOcQzwWdTtaXJM/DLmN9LM2L1H1nKVyHHZ4dIeAFnjhc/qZk+/gUGesjHJP2kB8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by CH1PPF4CBE7339A.namprd12.prod.outlook.com (2603:10b6:61f:fc00::60e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Thu, 7 May
 2026 10:25:29 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 10:25:29 +0000
Message-ID: <8d8b2244-2bf0-48cf-8fb8-9e47e197a62d@nvidia.com>
Date: Thu, 7 May 2026 11:25:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] PCI/ASPM: Override the ASPM and Clock PM states
 set by BIOS for devicetree platforms
To: Bjorn Helgaas <helgaas@kernel.org>,
 manivannan.sadhasivam@oss.qualcomm.com, Thierry Reding <treding@nvidia.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 "David E. Box" <david.e.box@linux.intel.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Chia-Lin Kao <acelan.kao@canonical.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-nvme@lists.infradead.org
References: <20260122152903.GA1247682@bhelgaas>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260122152903.GA1247682@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0370.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::15) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|CH1PPF4CBE7339A:EE_
X-MS-Office365-Filtering-Correlation-Id: 30a7af8a-080e-44f2-e046-08deac22f644
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	JdAiJLuk597Xc8LfM6mtKH4hcxNRacX2YaxwJC4Rw3rM/QEtiYzkq8gOmIph3lIY2mMisU+b+Yzjim/Ayxg0EyQ25dHjUfvflJcJ95W3Aa0KntJqxp+Is92v6IX37dWCeDZMgo3Dtu52il1XVQhi8Jrqv4XGkx5Tz35giB93x1rbAoRkIWywSakMy8eFQMrMVu+AY+tM2A16hDSg0riSAPzCRnedxutKF4weZB2NLKwpFD9qFQGAFB/sEy0ukTq++HUVLK1FxACTCKE7ApR3qwSHsue+nOjw3Ziap3K1xyLereuRmyU04o0krd1mgV6HT6T41ihpQxQCCqjB+exiPmSJuyzwGaxBKePBBfdfkES9ZoNtx/6a9g+Kl3r2cp0YiC4m7chYduxkaGs2HZKweSa1kn62GJmrh8zMpGWDJVj7rQU1YxFjuHLhWU4XaAbuQWaqc80eM5XPthJaa3HkJ+CwqOw4cxiFGrmIcKHsDqaLAgwcLU2Dc0tSnqGwAML6gnji5dtzfPvuQU7zmJKkeOvQTigb2/mSKuM4oNbyJynBGT4E9jzEeZ2iw8iaqxUtqe5iuxn4igrukpsIYfQkIrYDblHyx+ipnB/svJ4CSvilmzjYLWy0zHoODR5VYXla2tBdi0bQ4kmcLCpEDzZCEwuU0vJvOCw4tITpug2Uwf+O2z2ZfzXnihm7vhqIdYu/ZI87oYmD8VH01NhRTLrr2A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFgzUkNMenNFM1ZvV2xFL1RtQloxMU4rVkp0a2N4cE9sK1VQUFcvNGVyTXVH?=
 =?utf-8?B?TTBTamphYmRHNzBUT0hFblA0VHNYNktzYUhtNGhqTnJ2WmFraitxZzNKZnFF?=
 =?utf-8?B?bFBmaUpCeVc1c3dPQ2x4RXJoNlVrdGFCUmVNbVpqK2hXL0hUUzNNc1NFdDZM?=
 =?utf-8?B?WWpnWHdnNXBNNTRHZ0FQNFFKUHJSVCtBMDAyekNraDJJMkN2Ty9CL3lXeGtP?=
 =?utf-8?B?cTNVc25DdDJGWXlVcG1mMlI1S1ZEZmRDU1laVVgzYmZENW1qWG91Mk9yTUJy?=
 =?utf-8?B?NVBzaFdFSmRTUzJGaHpEaUd2ZnVnYlNkd2Fid3JwRUEyWmlCZW4wVW1MWHFp?=
 =?utf-8?B?V3hweDIySGtXNVNlNUkrb1BYUWZVazcvOS9CaXVpcUhjN1o5emFIcW5paVV5?=
 =?utf-8?B?c0VIR0NrSUdKZE8zcGlpYmdsQUcxTjdaTjhQcGdxcFRSZ2xhNGdqQUU2NTBr?=
 =?utf-8?B?OWN6eHB6U1Z3eEFqYmswSThlUjhkOUw2cEpXTFBiY1hGYXdyRnhlUTY0Qlpv?=
 =?utf-8?B?WHFIeTFrcUt6TEpIRlpMSlRvbjFvM1F5Tktxck9rS2JGaFhwa1kvR2pHR2tC?=
 =?utf-8?B?WEVIOWxwWnpqTGxEcEg5aCtJeVNPSkZxOGc4Q1NhRzEzaHFhNnZwbHlDamFN?=
 =?utf-8?B?bHZLYVRDZGFxWkk1MmUwaDErNlNQWEtSU0ZSMkFXaGRwVUR6L0h5a3F0TWNH?=
 =?utf-8?B?NU5yWlJBS2xCYnVUWGtSZ1NJcUwvRHJaamR2ZkRheGYza2R3b0hMYk1ucVdL?=
 =?utf-8?B?UG83SUpXYmNKcVYweXVoM0Y0ZHFLeFEwZGErZkZzem55bEZqdVhXbFhDZkhs?=
 =?utf-8?B?ODVJd2xTNkxha0ZKLzVRdko3YlM5NUpHMVRHQ3ZERDBWM2pQazBsZk0rWkV0?=
 =?utf-8?B?cGYySER2UVVFM09iK1ZvVEhVQ2hjcTIxMVNXSmVHNjNpWmxiT1c4MTdRTisz?=
 =?utf-8?B?RlhPU0oxYTVZekcxUkVGQ2d4cWdUeWlZQ2NGRnRIZWY4WDhwVHY0b2x5Qjk2?=
 =?utf-8?B?VnNxUFB5YW9yNU5TOUZkZUlWaHJmLzhaQmJjZ3BQdXZ1NytjbjZhbHA1dWli?=
 =?utf-8?B?NmQrbnBwTnVZazVlWUtQU3lpWlZHVHV5cE55VTVFVUhsWDR0YTlxWFVjOGN1?=
 =?utf-8?B?MXVHREpvWDlGcW9zQnI1Q1JjK3ZZUkx5amtxbEVHa2RoTDVqOWJ1a2NIMTBL?=
 =?utf-8?B?UzF3Y3prenFRMUJZQWdKcjdHY0ZLRG5Bb3JRSE50UG8veXlNUG9USG5OZ0hu?=
 =?utf-8?B?VFdaRDRZZk5WNk9qdGdBbVQzV0MycWFNSERPL0t1UFhaRmRKVlVTbkpyOUFO?=
 =?utf-8?B?Q1VEUU52OHc2VEV6aHljSXJQR2FRaGxPcUliOVl4bVFDM3hzRDJWb1RGQ2JE?=
 =?utf-8?B?YXIzckZFaUM0b2pNaVNtdkVma2Z4NGNWVWhHcHFXRmR6dEhzb0d0MkxHWDZr?=
 =?utf-8?B?T3o4SEFUK2xaSnNPL012RWxKaURCWnBHMDBlN3lnTTRHSlYwUGFlSHBjWjlz?=
 =?utf-8?B?YithOERvZHJKQ3lobWwzeUpCT1I2STVWbHZaRTJFRXJFMWkzcFptTFBlRlVh?=
 =?utf-8?B?cjVwcGlpd0JYSllIdWVJTW1zc2xWenFkamZEUjFobnJ3M1F5eXZjcjZBczVL?=
 =?utf-8?B?cHYxZDFlQjQ2Z0xHNkd1Sm14V0s3dS9mTjBaemI3RGF5VVUxdVMvK2N3Ty9Z?=
 =?utf-8?B?OGRFbjcwZW54d1E0S250bzJEYWQyditrMWpWbm1CT2pxNWZ4LzMreGtwMC91?=
 =?utf-8?B?T29wcTZaWmc5RFlwY0NXcnBLelgvZGM1TG04ek5iQXg4K3RxY3ZEckNTVHRr?=
 =?utf-8?B?SGpWb2hUTEU3N1lvUXMvT1JvT250WHdVUlVrbDB2SHBKNnBPV1dMZlRaaEo1?=
 =?utf-8?B?bVdRRlVoRWt6VGdrQzM2Yk9YZVdMTWVIamxieXRta3FCdXprQng0MU1JbCtm?=
 =?utf-8?B?cmcyOUNVbGNNYmVDM3R1alNnQ1FWalhsVUlOMU96NzFSWGZmdkhHdjJ5bFVk?=
 =?utf-8?B?VFVOdFVuK2RtblQ5S3ZqVUhBdXJWSDNBUUlEaURLWi9PcnNKRkh5Tkw5QzZo?=
 =?utf-8?B?VHpraGtEb0Vmc2pRM2sxa0ZVZVA5UFEyMThKZTBIaEJINndqYmVRVlZGMmtH?=
 =?utf-8?B?Rkx6TDFPNHZSSjZsdjMycktXUm5HcHlNWnh1OENxWFo5SDIwaDN1Q0tPMWhV?=
 =?utf-8?B?VjZmMGVmcjJoVmhnRGRHelVjaGUvR3lORUxUdGVQYkJuTVJMRXVIanRGV2NT?=
 =?utf-8?B?UmJobkNSU1F3aTlHODI0L1R4UCtKc290eWdWOW1HOC9sd1I4MXd2YlRIaXBE?=
 =?utf-8?B?Y0lLandVSHQyUUU5WTZDSXVXQU14M0FMdlNoUDRJVVREeVlWYU5pZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a7af8a-080e-44f2-e046-08deac22f644
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 10:25:29.5685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b2xxEOItAnroU7g6oWa7rkkwHZ2JLGj8G/xmLJ/zGyLlvIccX5XSAmH8rIY9lGCRLHmrjuhhe7YsJfPdOYq5iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF4CBE7339A
X-Rspamd-Queue-Id: 515604E6C33
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,vger.kernel.org,linux.intel.com,canonical.com,gmail.com,kernel.dk,lst.de,grimberg.me,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-106337-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Bjorn, Mani,

On 22/01/2026 15:29, Bjorn Helgaas wrote:
> [+cc NVMe folks]
> 
> On Thu, Jan 22, 2026 at 12:12:42PM +0000, Jon Hunter wrote:
>> ...
> 
>> Since this commit was added in Linux v6.18, I have been observing a suspend
>> test failures on some of our boards. The suspend test suspends the devices
>> for 20 secs and before this change the board would resume in about ~27 secs
>> (including the 20 sec sleep). After this change the board would take over 80
>> secs to resume and this triggered a failure.
>>
>> Looking at the logs, I can see it is the NVMe device on the board that is
>> having an issue, and I see the reset failing ...
>>
>>   [  945.754939] r8169 0007:01:00.0 enP7p1s0: Link is Up - 1Gbps/Full -
>>    flow control rx/tx
>>   [ 1002.467432] nvme nvme0: I/O tag 12 (400c) opcode 0x9 (Admin Cmd) QID
>>    0 timeout, reset controller
>>   [ 1002.493713] nvme nvme0: 12/0/0 default/read/poll queues
>>   [ 1003.050448] nvme nvme0: ctrl state 1 is not RESETTING
>>   [ 1003.050481] OOM killer enabled.
>>   [ 1003.054035] nvme nvme0: Disabling device after reset failure: -19
>>
>>  From the above timestamps the delay is coming from the NVMe. I see this
>> issue on several boards with different NVMe devices and I can workaround
>> this by disabling ASPM L0/L1 for these devices ...
>>
>>   DECLARE_PCI_FIXUP_HEADER(0x15b7, 0x5011, quirk_disable_aspm_l0s_l1);
>>   DECLARE_PCI_FIXUP_HEADER(0x15b7, 0x5036, quirk_disable_aspm_l0s_l1);
>>   DECLARE_PCI_FIXUP_HEADER(0x1b4b, 0x1322, quirk_disable_aspm_l0s_l1);
>>   DECLARE_PCI_FIXUP_HEADER(0xc0a9, 0x540a, quirk_disable_aspm_l0s_l1);
>>
>> I am curious if you have seen any similar issues?
>>
>> Other PCIe devices seem to be OK (like the realtek r8169) but just
>> the NVMe is having issues. So I am trying to figure out the best way
>> to resolve this?
> 
> For context, "this commit" refers to f3ac2ff14834, modified by
> df5192d9bb0e:
> 
>    f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
>    df5192d9bb0e ("PCI/ASPM: Enable only L0s and L1 for devicetree platforms")
> 
> The fact that this suspend issue only affects NVMe reminds me of the
> code in dw_pcie_suspend_noirq() [1] that bails out early if L1 is
> enabled because of some NVMe expectation:
> 
>    dw_pcie_suspend_noirq()
>    {
>      ...
>      /*
>       * If L1SS is supported, then do not put the link into L2 as some
>       * devices such as NVMe expect low resume latency.
>       */
>      if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
>        return 0;
>      ...
> 
> That suggests there's some NVMe/ASPM interaction that the PCI core
> doesn't understand yet.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/dwc/pcie-designware-host.c?id=v6.18#n1146


I want to revisit this issue. From my perspective low-power suspend has 
now been broken on some of our Tegra platforms (that have NVMe devices) 
since v6.19 and so far this is no resolution to this issue. The patch 
that was proposed to fix this [0] has been rejected by qualcomm and 
although this does workaround the issue, my confidence that this is the 
right fix is now low.

While I appreciate all the feedback on this, the problem is our boards 
are still broken since v6.19 with a vanilla upstream kernel. At this 
point I would prefer to revert to the previous behaviour and find 
someway to opt out of this overriding of the ASPM states for all 
device-tree platforms because this clearly does not work for all 
platforms. I am not sure if there is a quirk we can add, but we need to 
find a way to restore the previous behaviour if this cannot be resolved.

Thanks
Jon

[0] 
https://lore.kernel.org/lkml/20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com/

-- 
nvpublic


