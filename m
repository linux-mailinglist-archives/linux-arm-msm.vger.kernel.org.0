Return-Path: <linux-arm-msm+bounces-96215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLlTJTyqrmntHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:08:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FBF237950
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:08:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E131D302A50A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 11:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A246C393DEC;
	Mon,  9 Mar 2026 11:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="xiIXbgQI";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="MQPdOunX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4B63939BB;
	Mon,  9 Mar 2026 11:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054290; cv=fail; b=s84IgLKb7Ia394x1UeZtzyB2n5jvVG7xlPRL44FWprZzM9rx2uO/o8TZLYmTRgJPW/9lP3F4mf64OVlb6Tg/9fWWcAEzR4bZvqF5qSYFJPf5VmhBtOL6qhWJn16ratrdS46pmz9ecqDTPQ5G6S8oErMectdFu75z5+UQpo5f8Lc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054290; c=relaxed/simple;
	bh=dLRVqKvqt6Ef26SGG/aGhbLYhAuL0dRdv9JEENpgL+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mKgXEBS2F8FnOM6+Cgn1iIiifOuoee/SxigdrZmw52+3bpk/ncAHYd26GrQu6/77qs/8S2xOfZKthVqMy378ZZcFCXHqB8fAc5c4psXN9EQj8an9wJAXGAhh2vm/58FtuXO+jE++roJ5TLN7hHpErpkXy2R1+2uwTu4Y8qfQlNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=xiIXbgQI; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=MQPdOunX; arc=fail smtp.client-ip=205.220.184.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6295X1Vv664449;
	Mon, 9 Mar 2026 11:43:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=270620241; bh=
	LALrw+UkCvn1wXtYy6nqu04kww9Qk1fEbjTvqtmMsmI=; b=xiIXbgQIWOzT9nkv
	yJSVXjwhd7rOuGH63f/c3aRaqYLhVCTFvnxNOsaPdK00cJQaTRPHOpVh2yqCAQIc
	9IhlVMw7YTl+4BZWDOz4uSu/f4VlVKmcnKR2i74qDE4LCrGzZRVcT0d/P0+I8KhY
	Cwge/fx/fn++e1Atm7L6gW/zl78m2IcWNuBVemE4Ge1lvR4AaBKZ1wRtpHkemNbN
	xMJFyEePU5i2WLVpNeyPVS4VLz9PolKfQEswnT//rmOZRNYffmdA0HAPbH9g3env
	o/HXv5fY3IaR1V4y8fTQQPmlc1HF6y0Ss5+n3NgF83ldbgW+bBsfjVPM5HjqYz6/
	mC+xhw==
Received: from mrwpr03cu001.outbound.protection.outlook.com (mail-francesouthazon11021077.outbound.protection.outlook.com [40.107.130.77])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4cr98dss10-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 11:43:00 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t3xc/b5dRiv8AiX6UFx5CPskVZUejFd8MKBobnj98IepVIKYCxJdPipo5Ue3et06wDz6gicDJwd3+lWAUGs9b+KKMIiKGPJy7zsjxi4MYSmSGFWCldOaG365k3oLwJR0LIbDjt0Cu9qrcQ7BXOLfC1l+ay0xiZxMVbjglj6Z4SUiQdfrjmkvHNaBxBtCsBU4kEmDdXTTVZnDmw+hcGoqDjfVH+WCPUVYJCrN4oHqblJZzsB40t9i1HwhQGhvNlALw/bQ3zGZF6QFEmQBAybT+f9y+K8cMPMmBhgbg7Y0I6CwVNFmp95Vdp4cPxD/tiYgiPTje/vHXeSf9xbnLABoVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LALrw+UkCvn1wXtYy6nqu04kww9Qk1fEbjTvqtmMsmI=;
 b=AWPbwUbjlAEkYhiJu7a5xRRuwBTKJ1ZLLR3D6PXnA41YGU2azqZfoVYCfc/udmFfjq0Gl/MYDXBpwmnsGoo+PpmA97mut7biy/lrY+FlrbJUgz9+Fo5/jBmemtXHNBbyvL5gHqumShTVNt/b+HOj/RKv4isKt/2gkzO3719I7jfHo2aFbdMhUkFUD7DyK9lAAMY/ucgIMZ4tBzENxQNBeMq27hniwfoB8JHZN6AgzKDHDfNN9vJjVNPOJI83pV6U//ha8R0UOeoupxoVABCOKVrDue8pEcu+xtO/MolyRMAo7IZMxtV/RZfWij3Kfk7tc/r/gSd/fbAOG5H7SaZ/0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LALrw+UkCvn1wXtYy6nqu04kww9Qk1fEbjTvqtmMsmI=;
 b=MQPdOunXyd34EFXip6wybUia6EuKeSwyBF69THDfjpJuCCKgFDXekKyjzLGekNXXtJiyvgzVKtu66fWHBuxhVTnJjNkZTRsH3o9SIennqdXoEt2SiZIqtNM9U5KaD4idc5USD5+QG3kNfhudkmRFV5STRaIMj90lcO2XxJISfg8=
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM (2603:10a6:d10:17c::10)
 by DB8P192MB0823.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:165::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.20; Mon, 9 Mar
 2026 10:42:59 +0000
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8c02:9739:5f2d:b147]) by FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8c02:9739:5f2d:b147%6]) with mapi id 15.20.9678.020; Mon, 9 Mar 2026
 10:42:59 +0000
Date: Mon, 9 Mar 2026 11:42:55 +0100
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Bjorn Andersson <andersson@kernel.org>, David Heidelberg <david@ixit.cz>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH v5 0/3] soc: qcom: extend interface for big endian support
Message-ID: <aa6kLwNxoCIvquBT@FUE-ALEWI-WINX>
References: <20251119104008.3505152-1-alexander.wilhelm@westermo.com>
 <dfb72933-938f-43f2-87f3-2e3ab9697125@ixit.cz>
 <mmd44dczfsfcjfhfikcjzaxongb6dwy4oqxtpv7t2jvyudzut4@hi3n3e7brse4>
 <6e4d21f9-87cb-44ea-bb04-eb4f047f3ff5@leemhuis.info>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e4d21f9-87cb-44ea-bb04-eb4f047f3ff5@leemhuis.info>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-ClientProxiedBy: GV3PEPF0001DC08.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::276) To FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:d10:17c::10)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FRWP192MB2997:EE_|DB8P192MB0823:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fc608a5-82a7-4a9a-7b17-08de7dc8a176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	tVZYNs1Hf3v1u4qNIVTz32G43mSAw0vjdf2ktPOrx4qbmxlxKKa3TVhx86eLZFhsKkoj+7FLPRHaLvct2o0AMz2NgKEKHkj0Xbu2+UWN2I+ATlp0Ss6Eg8Xbv3uBhp7baaOoTc2jnobzIsOiXkj+hYaKhSUBYrZIBy3pm7AQD6SL/fiCdlfzshvorzFIZ6A7Ybdq3lW/0Ezu0rgdd+w2y1YkKWj285EeAooYHlTGxmoiUYD6ZInPCQrwjFIlkfGeHBAq3/ZPORtM8UQKwW4U0E1StE8Q12VZR714LtmdVyFG9fLCXljTnWkQlizJg29yFAMRETdPwUcNEQ8lI5nIFJ+ZyviE1GKe3YrPmiTSVI5D5uLbJxzHAGCYmydtS+voU0c3upPKDqH7Z0mhChcsuHpGOVWxGEXLu/CJYs5FQiWxkNHLcq8XK420mrmu1WT142PzFC9pvlqF9UVdKsgdGrD3mBUIrvOU97H+NqbscIwCatIc4YQVSoG9uImO7QymrwPFy9wKf8vvN7IZue4CIx5CQ2je0BS3Au33jEnbxNMlPK46ERfZJGojj5NP7iAzI5aXuFN3HTtRK4pJVeIAJaD9RjI5slwkExuCLj9stpeQks/jBR4hg/GBlqNjv3dujl/ba+UOdLsMB0Zo5x7HaI/0rX5QHoAQXVZSpWJKKagRhwLvHcXmkWtJdgxs1VPaJSMbbxkXkyD8VSshzE/w89f0tDIbIXbXc6bU5soo3MQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWP192MB2997.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHpzUjYrREpMeVFsWTNBRDcxazBiNzc4VUozNGFPR3RMS0hIeHVWQjFZdG8x?=
 =?utf-8?B?MDJiQWRENlk3L2hsMzdEMklYbmVlNkZ3OHNBY0x0d2MrUnYzRE5UQ00rVnlM?=
 =?utf-8?B?V1Bud3RSaWwwcWJQbzJqZ3MxejdSU0NVUkE3MnVTRjRIcVZBRjFRQXNtanhQ?=
 =?utf-8?B?Zi9LSjRZVTgxNXNNdHlsVXgvbjFZMEllZGRPb3NpUFFQdHhQdm9jcWZiRllI?=
 =?utf-8?B?Mk9VTGQ2cERhSzJ5em9SR2FOY2wwblZ4N1dsZFpocnVPc010ZStkMUREdWUv?=
 =?utf-8?B?TGRDQUJ5YUxKN1JPenlUTkFRaVQ0SXpWVXNUcG9TakFOZjEyS1NjeEZVZ1hk?=
 =?utf-8?B?SHVoU2RLdlJqb2QrSUl6MndBMDRER0R0VWRVTS9hT0dhYndqcENoRTJkZ3k4?=
 =?utf-8?B?dDQ3ZnZEYjcwUkVTbGFTMVE2WFNybS9RVnduNmRUS3p3Q3hjWDdNNi9jb3oz?=
 =?utf-8?B?azZsbHhpaTZ6c2o3SWJzTnA2aFJpYlMrelp3SEVnWjBxZ0tBZ3NtMGJyY09D?=
 =?utf-8?B?ek9oZm5SVVNHZkozWmc3NTRjNUd1SDl6cEg5VWZjOGMrdjBHRHBJZGo4dEJ4?=
 =?utf-8?B?SXRpdGV4TUVPN3Z2SjVYTTcxeUZhTVZnOS9yU2VLMWpUZDM4bnFIK00vOEZE?=
 =?utf-8?B?L2JFenBYWlZoVHRIK2FxL3ZnTnM0dGdxdys0c2NRRWNGWUI2S0N3c1Uwd0lS?=
 =?utf-8?B?M0JRTXVweWJlL3M1R01FTGVUMHFKeEZaU1J6dzdOMXpVSTY0M0pwVnlPb3Rz?=
 =?utf-8?B?NmpoTXQ0eGlvblM1dzREaGhaYVh3aFdkKzE0SGJLUjNjRGJzV3VBVDBpUlNW?=
 =?utf-8?B?SGNua2J0R2RqMWFSaGZWQTNuSDlKS3JUVXFvUW5reWI4UVh4T1dtS2I0Yisr?=
 =?utf-8?B?V3E1bXp5eTd3YlJHK1FZYUZDRFI4bytxZVNvanlVTFNEVm1HUTFSaCtNbWdv?=
 =?utf-8?B?SDQyZElBWmhzc1VjdXE4SmQ1QW9RSlFuNVU1bndNV21OY0N1RDJTcTB4U0cv?=
 =?utf-8?B?ZzNzYnEyMHNIem5Ud3JRTS9XZk5pdTlQK3cwVGtvZTByM293VUgyNWRtaHk0?=
 =?utf-8?B?Z3JBVDgzUTAvYy9WUUwvODVoL0taRzlPSllkYmtQbHpnZCs3TWdNVmFsSExa?=
 =?utf-8?B?aGEwcndYbjhNa1pLYUdyaDYrblppQXpucitUQTNzVkUzSmhtMjVGNUt0Y1Fo?=
 =?utf-8?B?dzljR1hKR1p6L3Y0aXdDb3BrWFJpNlpuK0VYdll3cHBzZkduWUViN0pudTZw?=
 =?utf-8?B?Um5IUmE5aWgyL0ZIY2E4Q3JTOUw4TXoxcUxLcVBiM3dxL0VXTlhWVVJUUVlS?=
 =?utf-8?B?OHBpVmYvYkJKUzlmQnR5endEM2FwZ1crR3hXK1B0UEFteERZOXB1aUQzV2RK?=
 =?utf-8?B?cWpkaFB3aHpKSERmVUwxV0xCL2JlUFF1eDI2SGorNDZyM3FDR3VEdE9RUW5G?=
 =?utf-8?B?ZWpLc0xDUWdnQzVQcUR1dWs0cDRnWjBaZzFuKzlmdGk3dkF5My9qVEg4c3g5?=
 =?utf-8?B?enUzem9kMlFCeXNvckx5WWY0NWRCT3liTUZzb2R6b3BJcHQ2cnh0WC9FQngz?=
 =?utf-8?B?aGNEa3M4SDR3SkRsTjhwRjJLT3JLWXFoZWxrM29SUUwwMXN5OVd4d093VjB3?=
 =?utf-8?B?STdQcXdkWDFaVlZTYmtlUThCK1d6c041Tmdvbk1lR3lUZzJYQ01Id3FkZ2FS?=
 =?utf-8?B?eGZ3M2NFSnZNanVvRC9EenNhWHhibWZmcjJVVytIMmxTTitXUGdzaVpwNTBU?=
 =?utf-8?B?eitJUUprc2sxajVLVVBKOUloLzRSbk1ZNHdMaDFSS2xPV1B6b1pTeElObVFQ?=
 =?utf-8?B?VVVscHhvRWNUeFczeWtCMC8rZ0prWkwwUGpCZi9ud0JkY0FlbjNtQ1FvWldQ?=
 =?utf-8?B?WXlvTTFjeWIrL0FFMUtxNk1DRFJhS1RBNVdyWDZzK1k0OGZDWStCNmorRDFn?=
 =?utf-8?B?ZERJZ2ExNzlaNmgvWWM4MWlFeFNGTG4rQVN4cW1qUlN5MjJQeHpIbG9LeXZM?=
 =?utf-8?B?VmV5TGVhZzNpNmEyNDdRa3A4bTduWW9rc0I5d0hxNHA1Vlh3cEF2UlY2am0r?=
 =?utf-8?B?azVaTDNzMnkxanA1a212WEkyZ01UZHAvbzJ0ci9yWVBJdEF0dlFNV055YS9r?=
 =?utf-8?B?bFAxVHhYN1V1WC9lUUxRUHRhcXdjVm42V1d5MnVvRFFYSldxMVBrODFZakJ0?=
 =?utf-8?B?bEd5RnVGZmEwVGo3TnVqbWxJUGh6Q0R3YWZQVUZEazdlZVBKdXQyYTdJQWpM?=
 =?utf-8?B?a2d1SXg3VzNFRmxNMXNFRVRhSit5NzY1ZTc3bTl0Qy9HdUVadkFrRHJvM3hQ?=
 =?utf-8?B?Q2svdmJVTEdjdmpESHA2RUxuRHVnRmU0SnoyZURjSzdqbkt2dDlGZz09?=
X-Exchange-RoutingPolicyChecked:
	IzkyvLewT6+sA2F8dheqPeB47XRws6/CwWE9WqDZ2mgYQ+55uN8Ew7aTVDv7PAog93F1sBX0X0GcUzTSz4sx/B1jvRxgW9uKZU1WOJQCOIDn74ayYkqg9dtyGETmt5DCt3k4GUaTWqct6LlkNDFfkD2QF8w+OrS7SRMkhgGx1oPznP2kOa3XNmxDHdes1jvaOxhaf/U05YahvgIR43hRJb+LAedq9eo1yP7tvXbjQRW0MDPvqCQhlvX8hLXvf3K4OhHcULvpDgtVEqMYZCk84V/yFAKqVex2t2BCcUlO7c7/f7YGwTh+iWdG0ZotrjefJPqPmX1xw68hmkWSuYo5Pw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WjhTaaHQG2KJMerug/wGN2l06CuJ0N6VEURRbZzVZ0wsDn+/3xAcWkxFc0EY8ld8Lj8haISg6tgMAUswyqRcP730RuGiOl1IcKkZZtkBwiGzpvCdvMDvI3LYip6z+xECjwatTjpS/QzF4ojmYvC8qssBaQpliCxdUJHNk5EV9+PjViLYtjjhSFQ+gyeh/6SZjmZ92Qucshyhzs0bt+E/QJ/Do56d6gBwIRDuRT4etdSKqZZHOq4ezEpsQahAJL3MtcciK2gGPgkoH7jeP/4WbR3ZMRN8GQ1Qr6Ot36SdLfzJQhLdDg0UlAQzgb9KRLqOK+OCeE9CgzkOi0aDTZ1St6xPrSTB3FSleZoQTSFq77XpUoigRJaW78RHXV79p91YvdggI/y8haYaJQonzTzt8C8MYSTjVuk5sZiTn3AVblQAca8/0OPBR+LPa3bUFw/CBCqYFQMXp0s1AWugl8Y3WFW+zOvkgpbaj2oU9XbQRJs7AJGBZ8I2H0QuBhFiE3t9BTNUqKH1HWX5NsxpGVvC4gd0mtGHKTREJ8AFaxpPSbt5qLmJNrzpOwaFeJ8CYfc4fenb9LQoUnwWIpQFKQ8r8nN3hQU7Nb0JlefezXKWfTWcPo6Ukmpy53/hLsAKAjr/
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc608a5-82a7-4a9a-7b17-08de7dc8a176
X-MS-Exchange-CrossTenant-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 10:42:58.9846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/jcrWICDtB4pbcwPELr4MHZ4Aw4HteV7w+2bHdiSCHt8Zycj2/fA0pGY5MZPdC5ZjhM+yOnn7eosw7FdPq3mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P192MB0823
X-MS-Exchange-CrossPremises-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 14
X-MS-Exchange-CrossPremises-Mapi-Admin-Submission:
X-MS-Exchange-CrossPremises-MessageSource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-OriginalClientIPAddress: 104.151.95.196
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-Antispam-ScanContext:
	DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-Processed-By-Journaling: Journal Agent
X-OrganizationHeadersPreserved: DB8P192MB0823.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA5OCBTYWx0ZWRfXzCyM+9Zh/9BL
 uFjCfukuEhATGtTaP8mM4u9d6ynhyaVg/MKtLczNX+iP0eYEeELM3mADbUZEfexpSE/0di047xA
 o8Cb9SWMJQTJ+zw/jmeBt1zUOz5wQf87VxYJzCToxf9PO9VGTF8H+kcfgYFUUj072K1N71kRNm1
 dyJs9Hoi8PAIAY+/rsLiMEXEjhPdDfvWTocbhwLS2u7n9YR5fJrncYuPDQ2G+uaJ5szgnsScWCz
 jWDwd0HEKFSWquakqUkj2DXfIM7x96xnl97+6CTiUr5q8N6JyXZLaL40k4LOUsNXYFz7rrfX8pb
 UK3KwqCmnZQV4+Aru1UDmnZMnjCRBUoaKxPiXhh3PledzQatcxWo9cSYLC1uGPwdnmF7qesqEIb
 gVT8mObcJg1cBVBMt7cjQV1IfKvk/VUJ2g/lym+gvBnkY4WMr1L5shlDIl0+yJ/FA80tCYZdlDK
 IPocqc4NtntueAVHXNg==
X-Proofpoint-ORIG-GUID: NI8I9-73jU6QYe7Ybgk0I6_oEDsEIyz8
X-Authority-Analysis: v=2.4 cv=DMaCIiNb c=1 sm=1 tr=0 ts=69aea434 cx=c_pps
 a=/2PNOLK9gQkkk3xJd8/oIg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tr3XZvuDWTETL0Uaxejn:22 a=8ys4xmT3Mru1TjC2zVq1:22
 a=KPn9o8iWLBuVyoTstvUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: NI8I9-73jU6QYe7Ybgk0I6_oEDsEIyz8
X-Rspamd-Queue-Id: 00FBF237950
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[westermo.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[westermo.com:s=270620241,beijerelectronicsab.onmicrosoft.com:s=selector1-beijerelectronicsab-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96215-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,westermo.com:dkim,beijerelectronicsab.onmicrosoft.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[westermo.com:+,beijerelectronicsab.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.wilhelm@westermo.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.958];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 11:30:42AM +0100, Thorsten Leemhuis wrote:
> On 2/14/26 20:26, Bjorn Andersson wrote:
> > On Wed, Jan 21, 2026 at 09:22:07AM +0100, David Heidelberg wrote:
> >> On 19/11/2025 11:40, Alexander Wilhelm wrote:
> >>> Currently, the QMI interface only works on little endian systems due to how
> >>> it encodes and decodes data. Most QMI related data structures are defined
> >>> in CPU native order and do not use endian specific types.
> >>>
> >>> Add support for endian conversion of basic element types in the QMI
> >>> encoding and decoding logic. Fix the handling of QMI_DATA_LEN fields to
> >>> ensure correct interpretation on big endian systems. These changes are
> >>> required to allow QMI to operate correctly across architectures with
> >>> different endianness.
> >>> ---
> >>
> >> Hello,
> >>
> >> I recently (next-20260119) started receiving errors on Pixel 3:
> >> [...]
> >> Since it's not well tested, I believe there could be problem with
> >> configuration, but after reverting this series, no errors pop up.
> >>
> >> I would believe maybe these errors was previously hidden, but just to be
> >> sure asking here.
> > 
> > #regzbot ^introduced: fe099c387e06
> 
> Looks like nothing much has happened since then – or was there some
> progress or even a solution I missed?

The current proposal is that the driver side should always use `u32` for
all `DATA_LEN` fields. Most drivers already follow this, and Bjorn has
proposed the patch for the one that was using a different type, and it has
already been applied.

Check:
[1/1] remoteproc: sysmon: Correct subsys_name_len type in QMI request
      commit: da994db94e60f9a9411108ddf4d1836147ad4c9c


Best regards
Alexander Wilhelm

