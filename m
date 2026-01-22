Return-Path: <linux-arm-msm+bounces-90197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5JYoB2QjcmnhdgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:17:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A69CD6727D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:17:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 74653762A4D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 12:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1CB47F2CA;
	Thu, 22 Jan 2026 12:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JHSq9r3P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011041.outbound.protection.outlook.com [52.101.62.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2726F43E48D;
	Thu, 22 Jan 2026 12:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769083975; cv=fail; b=INQMY3J1tXuaOtnqR+FCODaFRKXYQOzYSjksIQSlietY3zSd435G8EQlwvkK7s7hOfoq0xHBQ6OY2u8HXp/2o3COFgqre/YyJYe2rwMHRmk8O/CXhzN1EDsLz0giKOMAL6Lne8u7eorHy3uxHC85tfF9cXD14+3H3Z0HCjepZTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769083975; c=relaxed/simple;
	bh=6ZdnX84P2lPwK8fhIZPPS0GZ+7+lrvxuNl7pVPj8mw8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FonyaEt8hldXJa6lnhSMMzNf9xexadPAUAHg4cW7N7wTwB/VG+h1WnVkyOEeBMbFxfazrHKCiMs6IvUfvkGJ9mMs+MC84yr80xSXV9cYVdIEX6mMUtH390qs1q0CEpCMwT9ixmbQdMdDnAqH0KksC4y2CIqAM468h1SViluHFoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JHSq9r3P; arc=fail smtp.client-ip=52.101.62.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OraBreEc0Nv34aoQ4L1eB65UMEB57mxdPYWg6LIEf5+944VJILDWnwCnYuxJ11YHxZC/fVQKT7B4he4KVpV13+YHO3VP5kMyDObQ1RC1/rt2hXtxM2GEXHfcUjKFBDGA282CXZ4KDudAbgSgavkFEob3gl/OOGrAs5tEEDtzdbzz1bKEI/3YwjtyHBqSQiVhOjcjXTWGwm39F+dMjM+R36BHT1F+wyvB5L1ltaGReR4anebhQ5lEFQsmgC0KV7fWjTtreEy0SVMRCgIJ+Gb2KEioMXnJE4eQiN8Ik8nBKv07xJ3V48B6gbOyVXEcj4Sd86OHiHT1UYnTELJIYYY/ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpNsVZhYVwMpYRNbryLAMwOw8dlD5Hs95kxlwr3yPBk=;
 b=IfwhSHsaL0KnPdJ3PeON7oFd6VEwXNxRSLtZuyLLSzQxkwTp0yp/F2snY2N8GaJqD1HolZCYcEK3oRW6nvRkSi46D+2fmp3U21MFKaaGMTmrPcqUY+fwY40N7WjCS0hyRDCpEzgo+tkFA/78JHwFEahMKysQ7I6g5BT87TIsM9UIrdz/bu2XzQvn/U7f2Lp/W1ol56gif0FbgWBS0Q/mS2kS5tKT0VGx/P7pXMoIR++8BAz+018sgdQR/q09xtnvruEC87+EqPm527P76TjDUQzsVEWbSNqGavwtk0ktsdAzHUKw8MIaSASI/JEGaoyyUGaaV5h2T+K0Wz0qAya7BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpNsVZhYVwMpYRNbryLAMwOw8dlD5Hs95kxlwr3yPBk=;
 b=JHSq9r3PQbpSXNkrIo7zX3LUUvEiCNgwFwOqYAn6QlBpFtzImdT1MvBi7kCdjR5iSSEX4DCs14TA++qmPFsHtwH1z7bC5oQfxDwYfM88zTwi8wi1q8UHFJK/qAx3RM0UsnCrcOoZRV6693Lsoko202/YrXrx7WtiAreB046oMB88bawCySRuEiPMyZU28hEUyx4lJA4C70DQX/vyYpzhZ0hWgu9cc0ZLqd1Eo7ZJ9yTIJtOk3tMfNMH0CnWZFkQnC8dj//5GMefaDHzRpCjN6rC18cMBn6GHVYYiItudy6BJVGDz2XrifCo78TgKKsqKcU5z1wz+oXo3cGIZst6UAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by IA1PR12MB6114.namprd12.prod.outlook.com (2603:10b6:208:3ea::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 12:12:48 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 12:12:48 +0000
Message-ID: <7306256a-b380-489b-8248-b774e6d3d80e@nvidia.com>
Date: Thu, 22 Jan 2026 12:12:42 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] PCI/ASPM: Override the ASPM and Clock PM states
 set by BIOS for devicetree platforms
To: manivannan.sadhasivam@oss.qualcomm.com,
 Bjorn Helgaas <bhelgaas@google.com>, Manivannan Sadhasivam
 <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, "David E. Box" <david.e.box@linux.intel.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Chia-Lin Kao <acelan.kao@canonical.com>, Bjorn Helgaas <helgaas@kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20250922-pci-dt-aspm-v2-0-2a65cf84e326@oss.qualcomm.com>
 <20250922-pci-dt-aspm-v2-1-2a65cf84e326@oss.qualcomm.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250922-pci-dt-aspm-v2-1-2a65cf84e326@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0322.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::16) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|IA1PR12MB6114:EE_
X-MS-Office365-Filtering-Correlation-Id: f8f45e30-1085-40e0-722d-08de59af8e89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dTJiWFNtOWIxTHVsZllLVzVQQ2VPcDVRZE5IWWsyY3pES2ZoaVZRQnNHR0pZ?=
 =?utf-8?B?UHcvby9TdnBJSGNsa0xyVE9kZU8rZ2pNWGRLRUdId05keGpyQmk4YXhKZVRN?=
 =?utf-8?B?TVppUGp0aXN0TEFOOXpDQllIR2xLdVRvZElYY3QvRmNWb3FqNXB5VzJQNXUw?=
 =?utf-8?B?Ykx3dFZGUmVJcnIvTVhWVE5kcmszZVVoQ3RCbStTT3hqRm1QU2RzWU11SDdi?=
 =?utf-8?B?VnIxMHA4NGxIWmZXVHNRTXIvNENtcEdDR3c4bjlOWmJ2MXc3OTlrajEvUjVu?=
 =?utf-8?B?UUNEU3RnVk50aXMzZkhzRjJUa1ZQSE5IMkVoSmRPeWRkc3NHT3Job1lYdVdi?=
 =?utf-8?B?cm0reXZJenF2QmZ0VzRrUW5CRk5Jbys4allvRnA4Yk5OUC9lWHV6T29WSEpC?=
 =?utf-8?B?T3JScDY5WUNZR1VvYXRVQWdWV2ptSzM0LzkvaTc5UURpdkJPVDVZVVZwSE1L?=
 =?utf-8?B?bnl2VlZCN3llSTVFTG9RdVU4L01Ma1hSYVA1M2RIUWY1Tnk1M2NRQ3V3b3Bz?=
 =?utf-8?B?YmJEVW5uWmhtUDRKQ1l2SDhrcXVmK3l4TnFJd0tXU05Kd3pQUXI4QjFPVEoy?=
 =?utf-8?B?ZFdRWXNGQU9lZG9YL1VXVURIeUEyTkRYQ0NoeEY2SnpZMG13Rk1tMjJkZUJs?=
 =?utf-8?B?TnRmZS9zZnVPSmJ5dktHSndlMHBHVVRYTFU2QXpZL295b3lCbllKMTQyMWp3?=
 =?utf-8?B?TXJxNzBKcnpwcFRtc3BLYUJXanQ3NHBidnJzdXprdGhjWk1zY1lTRXZZTmNa?=
 =?utf-8?B?MFBlZG40SzdlekZuNjR2djRYVXBjS2hXK2lOcm1Dbm5mMWtjYi9uU01ZRlZ1?=
 =?utf-8?B?ZnB3VjVyaGFNZTJpQU11elIzeVlDNUhTL2tnck9POVRpWFJOREtHZ1JCKzlt?=
 =?utf-8?B?VWdkVTE1bzUyQitjUGcyWDFZNy9aVGRYa0l0YUpkdmRjeFZCRWhCUHo0elVG?=
 =?utf-8?B?NVllOHl0UU5vSExYZTJLcStsRE1HVU9SeHV6V2NSQ1VCeFZ0Z0plYUtXeTVF?=
 =?utf-8?B?c1d6aDNXcWwvdVl0a2l0SFljUmtZQlFVMy9KQ0N5UzJabjdHTHlMZXhjNXFl?=
 =?utf-8?B?ZnFLS0Y2UnFKMjlKam5TcjdZSUFnUUZHVC9yQnlFbVBKdjk5VjdBRk82VmYx?=
 =?utf-8?B?RThQREZWb3NNSGpuMWVzcTNNQm1kY3FQakNrZmR5YXJDbERWU0pLamlOMngw?=
 =?utf-8?B?NlpzdHhpZ1hSdGo2ZWdpUzhOMWJWemdpODNUTGFCbTRyd0dnR0t1d082ZUtk?=
 =?utf-8?B?Z2hrTy9WUUt2OEptaVVqZVBhM25qaHRnaWJQWjdlSmJhbXRDM3pONHVPYWxD?=
 =?utf-8?B?T2JZQ04xSWxVd1ZvRHJpeWMreHVRdEFhK3Y5RElqK3ZFQTRycW45cmN4R3J6?=
 =?utf-8?B?eTBCdWRaMmMxU3JUdTJHRHZYRnN5K041eHNscHYzbnZscDUveWp1N0NORjdD?=
 =?utf-8?B?T3NTUUxHNEY0end1b3lscSs2cmJVRWIzSEhKN0VIdThKd3dETDhxMFprTldz?=
 =?utf-8?B?SHUzcitLSTdUS1ZtVlVsLzMxd20xczlCaERjN3lOQmN4bytLbjIrOWlES2Ey?=
 =?utf-8?B?VlU0MXFLOEU0UEZncTNKcEQrc3FMejBjYzRpdVBTeDdQaklBTUhqWUZuWEpW?=
 =?utf-8?B?OWNWMEpjNXhUY004U2hYNFdEZWcwakVBWWlVSGNTQUZJNWxhQy9qek9obVBr?=
 =?utf-8?B?b3J5LzQ5blBSbEcvbVNmQnZFT25xUmRHT1VmdnNRRlBmRjRITmdXMmM1d3Fy?=
 =?utf-8?B?ZWIyK1JkL3hjQ3JlOTdkTkxjMmVmdlhsa3ZVaUNDNkk3L0FiWXUzai9wUFI0?=
 =?utf-8?B?Ly9YdWJQNFRrZU0wc3ZaNHB0M3l4WU9nMVlYZHVoSVdSSWR6SFNOazNSaENP?=
 =?utf-8?B?b2ZEUnZNdk5BYzNvS3NOT1dsWUQvNEZpZGFXb0w4RGtUalNFSnBIK3BLMkpW?=
 =?utf-8?B?MDk5ZDFyOHJqc0p1TzFmMVZhRjVnZDI4Ukt5MDRvVFVkWXdOREcwWnBRVEN3?=
 =?utf-8?B?WkhWYVlMcDFWTFUwcytZdTQwc1BzcGlDNlhQK3FYbVhTbVJFYkFTcTVRUDRk?=
 =?utf-8?B?SmhtVDBOZE9MaXh5RkJzeVpWdEhGWkxYelVTQ2JtcDkwOWh0UlVKM2tHZVdw?=
 =?utf-8?Q?ztKg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTlObjgzNUVUeG9lRG05NjdPK2cxcFpLZGk2cjNTTzFHS1JSZnlKTFFwTFFw?=
 =?utf-8?B?dEUyd0IxOW9WckFoWGwzdzRBRzJQbFhlNXc5YUthNnhsY215UWtCdnE2WW15?=
 =?utf-8?B?N1NvNTN0b3M1T0F0N1Z6Q1phODRtNlFNdURiRHJFM2hYUnI4MUJvMzZPUUVo?=
 =?utf-8?B?UUdsRms2dWdIVlRkV0dsano0NEJJS2NGdUtSdDdtY1FDVFZYQkJleU9Vb0Zr?=
 =?utf-8?B?Q1pCTENqWFVaVUtjZSt4aCtjOVJKRG5JK3VpRmtybDMyeGd5Q1dvaXpaNmJJ?=
 =?utf-8?B?RHhKR2Z0UnJjZURlcnh1NU1ON05pK0c0Z1F6MUwwVVpOODdQNU1KQ2FmZFpY?=
 =?utf-8?B?OVV5TXBNbFkrNEFVSS8vbk8wRWMrSm12a0hNM01DcVliUUV5UFRzL25xK1J5?=
 =?utf-8?B?OTM3ZFk0WlpScjBxbmlncHZpZnU1WFNkMFBUZ05mSUNTUlBzWlNVL211Ymxx?=
 =?utf-8?B?SWZqUUUvL3VaRklTKzQxOWNQcEtOM1k4UnFiaVZ1OWdKTXVOZ1pBeno5SmFT?=
 =?utf-8?B?cVNxWDdkNzdwQnpzUzNCYndDblJQUHRIV09ybk1FdW9RSmRxclYxazhhK0xa?=
 =?utf-8?B?STlvRXZJakhDY05KQXNvV05RdElHNnpkTm5IazRlNXovaFhRN3Q3NDFMQzNZ?=
 =?utf-8?B?ZENuelc4d3pLckhaUnFERHdUZm8zTEhuaUduVVBRQjZuaTJqR0trMGNjVkVq?=
 =?utf-8?B?RnpqU3ZQY1lBOGVtR0s3RGhYckp5NTduc3JEV1hWMnJZOXFHRlpSN1dLS0VW?=
 =?utf-8?B?V2wxWm5wUmxKQTRNMUZGMDFMVGxGSlN4K3VtSU9nQ2YyNjVSZU4xZCthV1Zs?=
 =?utf-8?B?aUlLdVZ0eGhBajR2T3VLS2U5OUdGU0RiMm9NZU5DcllrUlJXVWFCTWVyaUxT?=
 =?utf-8?B?RkZJRUtQWkRPekxmUHcrZC80TmQycTZpTHVOb29nTXJldS8rZ2ZNQnlzTWxL?=
 =?utf-8?B?YlVqdDNoUVpzaXZmbDdWb1FKYTg4TnBTakh5ZGxQcWNLZmx0Umt4NlNnSml3?=
 =?utf-8?B?WExQdlEvRlRKQ2w3aC9id0x5eGg4UFBDdzZ1WXh2dldnbUpXYU5waTBDcmp5?=
 =?utf-8?B?TlhPTHd1RGcvRlJDWlJIdjU4dzFRT1RaTURZcEZjcTVNWHhjaHdtc09xTGht?=
 =?utf-8?B?WjFGTTFHNkFsdktaeVVNekhSa1NyWC9Vb3FXd2hzNk1ZejdhYUtsTElMRjl3?=
 =?utf-8?B?VVRoWnBxVXBnajU1eDZmVlVsNXJzd3JNVTB2djRzMm42NHM0UmVvZWxoY2t3?=
 =?utf-8?B?Q0N4NXBkTzh1VEJKOVl6bzdtMnY5a1gxY0lGckpkSXNYMGdTWlQ5a1p6VDJw?=
 =?utf-8?B?NDBicjlaaDlaZEFSYTkway8wV3hFSHExS2Y4bnBIekkwM1owVGtBMFFVa3Bs?=
 =?utf-8?B?eHRLL1lnU2sxVkhmWklOemppeXg0SGxtWC9wS3pIS0dxMzZLd05mZE9wcmRn?=
 =?utf-8?B?alhadzZ6bVRJaFBtcnBQemtYK0I5Vm80cHNlYmdSWW9Ga1NsaFJxd1F4eXpR?=
 =?utf-8?B?U1dzdG9oWW9HMyt0ekw0elFJdU4wUjhVVGNDSTBYR3llaTJaaGFLbkFnNnNz?=
 =?utf-8?B?bUZFZmpDakVWY0ZEYkdGZnlVblhMZ08zTDgyVDBEZUx5dCtDZEI2emQwNFp6?=
 =?utf-8?B?THlacXhWRmYzTUJ2YlZqUzhKZWFjeExFVFR4dG9TVi85ZGR5RG02bk5ydHlQ?=
 =?utf-8?B?LzFNUTM0dVBmbHRwVmlKZ09lTXJBWUg0U0haKzNmM1lCQXpzZndqcmdha2hO?=
 =?utf-8?B?QjdmVUlINWM3TmhuVUp3aExGQXlDeUZSQ1dYbTZBQXltSUNoUjdEaFRlU3Er?=
 =?utf-8?B?VW5NREFId0JUbm9zOUwyNFZaV3hBL1hLMW5TRUpaYUNuWjdub0pNQUNtWHds?=
 =?utf-8?B?OE5uZ0l2ZWdsamlRRjY0UWlPSUlsUHI0ZU9YNzVNQUZQb0xJZTJQVlZYQVlY?=
 =?utf-8?B?YVBTcDlvclRibGFYbVBGY1V1VURyeFJKVjEzS0tMY1c5YXQ5SDNISHJSU3c1?=
 =?utf-8?B?WGovaVFmNU5MMWZIaDJiWVl4SWVIeGI1VXBPZFJTdXhEMmtEU3ZTSGNTQW0z?=
 =?utf-8?B?RU9mM0Z2WHZiZmRZRHUxOGZPaXMxSlJDMnppNDRBT3BQWTlCejNYcHhvbnhl?=
 =?utf-8?B?THF3b2JtNXo0YXVBaEVQSTUyc1IzQnNTRmtteGpHbk8xTUErTjJxeWVaeUZl?=
 =?utf-8?B?d0FmRE14OTAvOXZaRXQyczVFQXdtL1pTejhQcGFDRGp0ZWx3aVEwOGVrYWpt?=
 =?utf-8?B?OUpUYjFYbk5BRFhIZHhLUmR1Vkt4RVBCbllpN216bitaNUZGbGg4ZXo2anI1?=
 =?utf-8?B?TDVNVmJSMk53R1U2WW1lRy9hbkZQR3lCUDViS1QzNWhEVGdjZU5oQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f45e30-1085-40e0-722d-08de59af8e89
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 12:12:48.0797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rqzyek2T56DHreVQe5MNfluFmg5C7XIQSAbpMJyyUt5z1OpnYCn73l0tgATjPndhVQkq7iJUGIdlkBuxkikAIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6114
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[nvidia.com,reject];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,canonical.com,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90197-lists,linux-arm-msm=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,nvidia.com:mid,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,qualcomm.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: A69CD6727D
X-Rspamd-Action: no action

Hi Manivannan,

On 22/09/2025 17:16, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> So far, the PCI subsystem has honored the ASPM and Clock PM states set by
> the BIOS (through LNKCTL) during device initialization, if it relies on the
> default state selected using:
> 
> * Kconfig: CONFIG_PCIEASPM_DEFAULT=y, or
> * cmdline: "pcie_aspm=off", or
> * FADT: ACPI_FADT_NO_ASPM
> 
> This was done conservatively to avoid issues with the buggy devices that
> advertise ASPM capabilities, but behave erratically if the ASPM states are
> enabled. So the PCI subsystem ended up trusting the BIOS to enable only the
> ASPM states that were known to work for the devices.
> 
> But this turned out to be a problem for devicetree platforms, especially
> the ARM based devicetree platforms powering Embedded and *some* Compute
> devices as they tend to run without any standard BIOS. So the ASPM states
> on these platforms were left disabled during boot and the PCI subsystem
> never bothered to enable them, unless the user has forcefully enabled the
> ASPM states through Kconfig, cmdline, and sysfs or the device drivers
> themselves, enabling the ASPM states through pci_enable_link_state() APIs.
> 
> This caused runtime power issues on those platforms. So a couple of
> approaches were tried to mitigate this BIOS dependency without user
> intervention by enabling the ASPM states in the PCI controller drivers
> after device enumeration, and overriding the ASPM/Clock PM states
> by the PCI controller drivers through an API before enumeration.
> 
> But it has been concluded that none of these mitigations should really be
> required and the PCI subsystem should enable the ASPM states advertised by
> the devices without relying on BIOS or the PCI controller drivers. If any
> device is found to be misbehaving after enabling ASPM states that they
> advertised, then those devices should be quirked to disable the problematic
> ASPM/Clock PM states.
> 
> In an effort to do so, start by overriding the ASPM and Clock PM states set
> by the BIOS for devicetree platforms first. Separate helper functions are
> introduced to override the BIOS set states by enabling all of them if
> of_have_populated_dt() returns true. To aid debugging, print the overridden
> ASPM and Clock PM states as well.
> 
> In the future, these helpers could be extended to allow other platforms
> like VMD, newer ACPI systems with a cutoff year etc... to follow the path.
> 
> Link: https://lore.kernel.org/linux-pci/20250828204345.GA958461@bhelgaas
> Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Link: https://patch.msgid.link/20250916-pci-dt-aspm-v1-1-778fe907c9ad@oss.qualcomm.com
> ---
>   drivers/pci/pcie/aspm.c | 42 ++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 40 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
> index 919a05b9764791c3cc469c9ada62ba5b2c405118..cda31150aec1b67b6a48b60569222ea3d1c3d41f 100644
> --- a/drivers/pci/pcie/aspm.c
> +++ b/drivers/pci/pcie/aspm.c
> @@ -15,6 +15,7 @@
>   #include <linux/math.h>
>   #include <linux/module.h>
>   #include <linux/moduleparam.h>
> +#include <linux/of.h>
>   #include <linux/pci.h>
>   #include <linux/pci_regs.h>
>   #include <linux/errno.h>
> @@ -235,13 +236,15 @@ struct pcie_link_state {
>   	u32 aspm_support:7;		/* Supported ASPM state */
>   	u32 aspm_enabled:7;		/* Enabled ASPM state */
>   	u32 aspm_capable:7;		/* Capable ASPM state with latency */
> -	u32 aspm_default:7;		/* Default ASPM state by BIOS */
> +	u32 aspm_default:7;		/* Default ASPM state by BIOS or
> +					   override */
>   	u32 aspm_disable:7;		/* Disabled ASPM state */
>   
>   	/* Clock PM state */
>   	u32 clkpm_capable:1;		/* Clock PM capable? */
>   	u32 clkpm_enabled:1;		/* Current Clock PM state */
> -	u32 clkpm_default:1;		/* Default Clock PM state by BIOS */
> +	u32 clkpm_default:1;		/* Default Clock PM state by BIOS or
> +					   override */
>   	u32 clkpm_disable:1;		/* Clock PM disabled */
>   };
>   
> @@ -373,6 +376,18 @@ static void pcie_set_clkpm(struct pcie_link_state *link, int enable)
>   	pcie_set_clkpm_nocheck(link, enable);
>   }
>   
> +static void pcie_clkpm_override_default_link_state(struct pcie_link_state *link,
> +						   int enabled)
> +{
> +	struct pci_dev *pdev = link->downstream;
> +
> +	/* Override the BIOS disabled Clock PM state for devicetree platforms */
> +	if (of_have_populated_dt() && !enabled) {
> +		link->clkpm_default = 1;
> +		pci_info(pdev, "Clock PM state overridden: ClockPM+\n");
> +	}
> +}
> +
>   static void pcie_clkpm_cap_init(struct pcie_link_state *link, int blacklist)
>   {
>   	int capable = 1, enabled = 1;
> @@ -395,6 +410,7 @@ static void pcie_clkpm_cap_init(struct pcie_link_state *link, int blacklist)
>   	}
>   	link->clkpm_enabled = enabled;
>   	link->clkpm_default = enabled;
> +	pcie_clkpm_override_default_link_state(link, enabled);
>   	link->clkpm_capable = capable;
>   	link->clkpm_disable = blacklist ? 1 : 0;
>   }
> @@ -788,6 +804,26 @@ static void aspm_l1ss_init(struct pcie_link_state *link)
>   		aspm_calc_l12_info(link, parent_l1ss_cap, child_l1ss_cap);
>   }
>   
> +static void pcie_aspm_override_default_link_state(struct pcie_link_state *link)
> +{
> +	struct pci_dev *pdev = link->downstream;
> +	u32 override;
> +
> +	/* Override the BIOS disabled ASPM states for devicetree platforms */
> +	if (of_have_populated_dt()) {
> +		link->aspm_default = PCIE_LINK_STATE_ASPM_ALL;
> +		override = link->aspm_default & ~link->aspm_enabled;
> +		if (override)
> +			pci_info(pdev, "ASPM states overridden: %s%s%s%s%s%s\n",
> +				 (override & PCIE_LINK_STATE_L0S) ? "L0s+, " : "",
> +				 (override & PCIE_LINK_STATE_L1) ? "L1+, " : "",
> +				 (override & PCIE_LINK_STATE_L1_1) ? "L1.1+, " : "",
> +				 (override & PCIE_LINK_STATE_L1_2) ? "L1.2+, " : "",
> +				 (override & PCIE_LINK_STATE_L1_1_PCIPM) ? "L1.1 PCI-PM+, " : "",
> +				 (override & PCIE_LINK_STATE_L1_2_PCIPM) ? "L1.2 PCI-PM+" : "");
> +	}
> +}
> +
>   static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
>   {
>   	struct pci_dev *child = link->downstream, *parent = link->pdev;
> @@ -868,6 +904,8 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
>   	/* Save default state */
>   	link->aspm_default = link->aspm_enabled;
>   
> +	pcie_aspm_override_default_link_state(link);
> +
>   	/* Setup initial capable state. Will be updated later */
>   	link->aspm_capable = link->aspm_support;


Since this commit was added in Linux v6.18, I have been observing a 
suspend test failures on some of our boards. The suspend test suspends 
the devices for 20 secs and before this change the board would resume in 
about ~27 secs (including the 20 sec sleep). After this change the board 
would take over 80 secs to resume and this triggered a failure.

Looking at the logs, I can see it is the NVMe device on the board that 
is having an issue, and I see the reset failing ...

  [  945.754939] r8169 0007:01:00.0 enP7p1s0: Link is Up - 1Gbps/Full -
   flow control rx/tx
  [ 1002.467432] nvme nvme0: I/O tag 12 (400c) opcode 0x9 (Admin Cmd) QID
   0 timeout, reset controller
  [ 1002.493713] nvme nvme0: 12/0/0 default/read/poll queues
  [ 1003.050448] nvme nvme0: ctrl state 1 is not RESETTING
  [ 1003.050481] OOM killer enabled.
  [ 1003.054035] nvme nvme0: Disabling device after reset failure: -19

 From the above timestamps the delay is coming from the NVMe. I see this 
issue on several boards with different NVMe devices and I can workaround 
this by disabling ASPM L0/L1 for these devices ...

  DECLARE_PCI_FIXUP_HEADER(0x15b7, 0x5011, quirk_disable_aspm_l0s_l1);
  DECLARE_PCI_FIXUP_HEADER(0x15b7, 0x5036, quirk_disable_aspm_l0s_l1);
  DECLARE_PCI_FIXUP_HEADER(0x1b4b, 0x1322, quirk_disable_aspm_l0s_l1);
  DECLARE_PCI_FIXUP_HEADER(0xc0a9, 0x540a, quirk_disable_aspm_l0s_l1);

I am curious if you have seen any similar issues?

Other PCIe devices seem to be OK (like the realtek r8169) but just the 
NVMe is having issues. So I am trying to figure out the best way to 
resolve this?

Thanks
Jon

-- 
nvpublic


