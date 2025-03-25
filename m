Return-Path: <linux-arm-msm+bounces-52487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D5DA70B55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 21:17:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F7ED189EC82
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 20:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6312026658E;
	Tue, 25 Mar 2025 20:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="A5VaOq3G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2101.outbound.protection.outlook.com [40.107.22.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6381266587;
	Tue, 25 Mar 2025 20:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742933596; cv=fail; b=QHyDsY32qOrv8VMuS4zrVh+hy//daSWs9/b08bfcjSCOA82nIQmEMZJMx1rkNyIJI7ayYP5+T0z340a5EITr9JXPB7gVmcKZdVS6PfFCprbhkB3QR7fsDf+8A3I076GXAAzRF/eiBUfWeU3qR0eaERzx0Iwm1EE13T0VF02cUmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742933596; c=relaxed/simple;
	bh=f5wGo9xXrKdjRRa6wWxj2rxXT0hsEU4mBHNt+OnXGS4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UfIHW2sIVCm5vTQ73qaZyb9t05t+g4nfEHo3HfbN2OS8d3SKZhoITK4UrOTIRj/4Ud7tg5R5PbDVvf1Vh835IHkDwF76a8Do2EHFjnHG40Z2NxDCVhiO6j05+8RMVniLGVDoiyvNWkxSDO3XIzjIaDT9OCxceb/07UcxSBSbNiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=A5VaOq3G; arc=fail smtp.client-ip=40.107.22.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mMrNqTa6aUg7apiO9UXd+PJcPOKG1mMt5Q+MWef6FHj7owuhY9KPYU127YMLdeS9625I7O2PNNzC6GoBijndlgA/+wd8aoaEcGWpKNrd9EnzWw65cXmWnVscWi83+b/IcFlR+IoNfDWrk1SvDHOlUV8sMIXqnQ97WL56RbYydl7enPJ1iFxApXR8W3KYm8rP7iRwXbVaGmHga/i4h1V04iwu8UA0ag51dOUAUzM94M6z2rdiTRZeIJNqT733U5dXO8mBC7EZkoYZ3tW20K+6ojNzijNA30QEJc+p3x8xTvo/DkS007+WfDLv4G4HSPYwdfju6Jq3d/0zJS1WOV0TSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5wGo9xXrKdjRRa6wWxj2rxXT0hsEU4mBHNt+OnXGS4=;
 b=WRe6GjtLGFLfJYBBjJ31lovkHNa0qYs89PNeNOY62N3rOcWdme8NMDdW1iSSse0NaqYI0mksTLdJkyVecmjpe91q6cR0Tu3Fk+UIVEkpbRC0ZrEWUuk+hblfVppQDRoXG5g/HFdN0xUzQcGk4bZ/O5IYjRis2cL0Za90HreTniIELJfbHg03bqHIqummDhwqR0TCyrKoIGsLbHqFkrHypFK96myC2XYKLULitbQ6icSV7lbrmxXskkbcChoQgNX3PZWAVgvfJdiXeS9Oc+zoZYEDgkpHfjVnNRDAdpEVnY0kqNHxLg7AB2zBLNjqzw6RKpS94G4q2nkIQdf+wRzZCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5wGo9xXrKdjRRa6wWxj2rxXT0hsEU4mBHNt+OnXGS4=;
 b=A5VaOq3GiDGBb8xzMFu9P2VnneF9F1eHo5yxIVw07Giq4Psl6khXDtB2gLqxJ74pRxUWS37GSLnoDsyjiZ6B3kCkp6+PilEJsZ9Po0SC9B1+Ek29tsLVj7avrC6AT6C3Foxk29hvFpq93j9DV0gU2XHPNvoKJarcL9MSgP9fzAk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8)
 by PRAPR02MB7956.eurprd02.prod.outlook.com (2603:10a6:102:295::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 20:13:08 +0000
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827]) by DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827%3]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 20:13:08 +0000
Message-ID: <14b7f2cb-6f40-f8b8-b3de-fe99080e6e40@axentia.se>
Date: Tue, 25 Mar 2025 21:13:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 5/6] ASoC: codecs: wcd938x: add mux control support for
 hp audio mux
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: broonie@kernel.org, andersson@kernel.org, krzk+dt@kernel.org,
 ivprusov@salutedevices.com, luca.ceresoli@bootlin.com,
 zhoubinbin@loongson.cn, paulha@opensource.cirrus.com, lgirdwood@gmail.com,
 robh@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, johan+linaro@kernel.org,
 Christopher Obbard <christopher.obbard@linaro.org>
References: <20250325114058.12083-1-srinivas.kandagatla@linaro.org>
 <20250325114058.12083-6-srinivas.kandagatla@linaro.org>
 <vmhrs62ygu2xozcabc6tgy37ta5qskeyks5j3ldponzfijicl4@nudcmxonq7qj>
 <4654f21b-bf61-4b41-b073-407fab4bff6a@linaro.org>
From: Peter Rosin <peda@axentia.se>
Content-Language: en-US
In-Reply-To: <4654f21b-bf61-4b41-b073-407fab4bff6a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVYP280CA0019.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::22) To DU0PR02MB8500.eurprd02.prod.outlook.com
 (2603:10a6:10:3e3::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB8500:EE_|PRAPR02MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: 690cb5de-08dc-4086-4193-08dd6bd9755e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VHhFeVEwWGZ4Skh6cTJZMVVWYnpXNGZUeFhXeDdWSXFJUys1UkN2VkkzKzZG?=
 =?utf-8?B?K0JvTzRsdW9JSjN6WXI3K3dPQm56RzFWL1ZPUmJyMFZoZnVGTjBlVnptdUN5?=
 =?utf-8?B?V1RlUThTRXVyQ3ZkQU9QNlVxQkY1WW02eCtXdm8yVGljcnJ3UW1QQzJLbnk4?=
 =?utf-8?B?aFJHNUp0dXpwaDRmK3N0QnZUWnBKdE5GQzJUSSs3VGNhbUVhVHUvdi9DZW9T?=
 =?utf-8?B?K3NYbFNYeE5QM25vRU1MTTFuVDliQStLaW5LS0tDY2tqcHJWNDBFV0RRdk1q?=
 =?utf-8?B?dFdVRVRBOWdrZjZZb1AyWWVZZFVNNUxOblgvMVNZbWc5cjRCbVNzazA0cEhi?=
 =?utf-8?B?anBzb2NvbUw2YlNNUm1wemdCaWtLL1c0MDllQUdlRjhIZkd5MVBqVjlkTWRi?=
 =?utf-8?B?Uno2bG54OThBWkZ6SDVZd2ZtWmJHR3JkVjBERnVMbEVwUlFQY0c4YU44NCtj?=
 =?utf-8?B?MGMxMEpQd2RPeUNVdC9ZRzBUSnRvMytLemV5NEJsSWtqOUFmcXFuNnlxRW40?=
 =?utf-8?B?Vk1SWGwyRW5XclcyOERYRE9xN3JtY2JFNjZZMFBadzU0WFlMSFptenpoNFlj?=
 =?utf-8?B?ZjJPblNnQW9rZUlaSlV5UDlUK2JubG5rRlJQMmZ4K0JJL0o5eGYrWG8rKzU5?=
 =?utf-8?B?VFBFRHlHTHhDSFA1bmdXMmkvMmVQbXNWaC9EdCthQTVKOERPcERoQXZ6QjFi?=
 =?utf-8?B?NFRHaVlBdlJKUWoyNFVibTFMQzRiTkZETWNHZy9HV2VCVjRGU2xpQmcvNENI?=
 =?utf-8?B?R1ltUFB1Kzhoa050ZDVkWEZkNzR0bjFOanpBK3E3VGdVeFdpelE5NVE1VWI1?=
 =?utf-8?B?ekNhK1FsdzVCMFlmSjNCaXRwSHVVc1FaRlJJQzYzNFQ2OVFiSGFJUElLZkty?=
 =?utf-8?B?ay9vV3BudHk2OGNRY3hjVHVicDExWVVxbGhxR0dSSUY5VlNFSytybmtBYTdS?=
 =?utf-8?B?YWRaUHhKMzRlN2VleDJoM2toTkRFdTRvZ1dnbjdRdUYzUHl3RHI0WWUzTGwr?=
 =?utf-8?B?R0FTR1lXNHBocytTTitYcWlrVnFnME5ZWDZ3MmxsVkJrYzFQZmtuTWUrRHNs?=
 =?utf-8?B?RlkzRnJXWHBzN3ZBQW1lcTNOTXoydms3MGdrd2RtNzRoNVJ5dElhd2ZNMmNo?=
 =?utf-8?B?RmFJdHVyZUZFVW56T1lKeFo5RkFISXc0dUlCbEFEam81QVVhOUI4bmhyYURL?=
 =?utf-8?B?Mm92OHd6SDNlMHVSOHFxSk5meWlacDJMbTdMNTI0OTlMM09tN0lhUmpXOU0v?=
 =?utf-8?B?OXBaeVpTTmVFM3JBdmZyNU1vSjdkSzA0aFFiMEQwQ3FvRU9ySFV0QkFGQlY2?=
 =?utf-8?B?b1dGb3dneHlVazlCalMyQVdzUldzaG53TUJrc3ExdnFpbytPeDlvNk13djI3?=
 =?utf-8?B?UmpkT0VtSFJVRy9kcjR3aDJqdk9GQ1ltdUU2bG4vYTBaZ0M0am9lNG9Ia2hr?=
 =?utf-8?B?bXdONlJYVXQyajFlSlNrMkgweWJsZzMwR0JvLzdXMm1wR1V3elhDMmwzeHRM?=
 =?utf-8?B?Sm1KQWpwSS9kVDhmTEVEbFBrWkZJTFdlaWhkVjEvcWx3VUxveW51OWNpeWNw?=
 =?utf-8?B?TGZLUEM1dnJJRU9ZV3FvQUZLUEpoa00xOEw3ckswYTNJQXYzTTBzMG1vMVA2?=
 =?utf-8?B?VllHNzExOWJKM2JYTjkxZEVBVGFQU1NhMDBseURYdVVvbHMwQ3VEcmhMM3ky?=
 =?utf-8?B?aWJXcXdqZzJGemw0TFZuWUkvUWJaUk16OTFFUkNBcnpQMEhDZHBmUmY3b0Fi?=
 =?utf-8?B?bURHRFdPR0FZODlyVDVQNlM0Nzg1N2pGdFFOeWZCdHdOaUVSa2ZpRHBGd010?=
 =?utf-8?B?bDgyNEVVM0UzdU1iQ2tvVlBiS2hxNWdCclFnUkFWTkMzMWM4NFlkems4bVlG?=
 =?utf-8?Q?R10AxeMV9ArWI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8500.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkVuaEZJbk91VVExdHoyQWRHS1ptVlR1dHBkTVBLYXdUNHFEQklKckRPMXFM?=
 =?utf-8?B?ejAycW1yKzVQSmRhZnRZS3FvRmRCVWcwQWxMTTQ4dStCUWt5V0FjMUo5WUI4?=
 =?utf-8?B?NVcwUWU1M0VqeDUvUUd5NGdkblltVzVGV20xL1RiNzZNOHBwRWlhS2tVakw0?=
 =?utf-8?B?THJlWVBlQXJkQkVnbHFQU1lmcVBLUlZ1cFFjN0tsUmpDRmZpSUsySHR2NWpa?=
 =?utf-8?B?dFlOMW1aVFgvelhOWFUrdnlyU3p2a3grM21WME43OFlBTFBBcHBrcGJ3cHB0?=
 =?utf-8?B?KzJSZUdwTTBMczJtNWllMEJpUkYrQTh4cUE1b2xvSm0zSlJkVEJBczVEb01I?=
 =?utf-8?B?TXhoSG1VK3o5WWFjL0RRZDZvK3BnQ2FGc3R5aHBLRlM2NWFKVWV5MEJ3ZXM5?=
 =?utf-8?B?by80dHB4c1I3cVk1TGhMUjdWd2E2MGIxTjNCbVpzd3Nma1ZYR3l5V1QwQXp0?=
 =?utf-8?B?U25OSm4xOUowWlVGNFFsaFg3L0ZLbm05dStnY0pjL2twUGE0cU5VQlY1VUpI?=
 =?utf-8?B?SW1vVG9uVkl0R1NpR05pZk1HalRYQWd4aW42WVArNzc5QmIxcjRmREFuOGpO?=
 =?utf-8?B?TXRQbDR4R0t6VjNlSWtzeEFsZjBuQnZkOXo0QzZNNnlqeGt0Ly9BRjNyc1FB?=
 =?utf-8?B?RG03ZEtmV1VZYzlLRGEyWjQzdzRlOGhJbjIwaHVCaUpiWHQxaVFJKzFOYXNu?=
 =?utf-8?B?MCtMVDJWQVlCN0FCaHVxZ3Vtc00vaTFmQzdBRUJVcEtMazJWZVJ1VFo1VHFT?=
 =?utf-8?B?VEhKdWIwQ3F4bm53Um5hem5uZGVQT2FhQ0lsNS9nUzlqU25QcEZTcUt4ZlVn?=
 =?utf-8?B?RW5wNHZiTk8rbGVzSnp0Q2cwMHdhUkJvbklQaHV3dG92WFNCNzVGSnBqNS9s?=
 =?utf-8?B?Y0dHNkZCUkRsZ2RaMkVhaFg2MGdjR3hscjZKRGN4MllrWWJldnIwNXF3dldE?=
 =?utf-8?B?ZXF6aldHaHFoSk8yc3BUaGRzYVl0Q1BQUVViVTZZVDlRa2tpSkZyMjNQOG5s?=
 =?utf-8?B?ZytiZXRyZ3BSeXpxWWlESHNuRzhOS0pNbHhiRmdxdmRBUzBoK2NFcGNTTmhZ?=
 =?utf-8?B?Sk5QUW95RzRENGRSVEJOUnQ0SkY3c1lZdzZVekZaU0VhRXdGbUZYWjljMFpr?=
 =?utf-8?B?R0lNaUFkR1hRR0ZIUVRkdytjdStsZ1gxLzU4eXpycGNPQ0ZVd2NwNHdPdW1M?=
 =?utf-8?B?SlNFYUt6c09neXRrcFlyWEFUbEh5dCt4TUpERGx3TlVhb1pnTVh1S092VHZ3?=
 =?utf-8?B?Kzk3djVNR2NUZ3laR1FVcDBnLzR0ZmtjRWVzajI4T2wweEN1QVVSWFcyNWFp?=
 =?utf-8?B?bGYzc01TbHJiVDlLV0VIcTlMVktNZUxvbzFUeGE4RTJBM2lLckd3TFpDK3R4?=
 =?utf-8?B?eEdyb1Nxd2dMTURZbFRRMERmZXlSenFPWXdRZjQvQWRQaVJIU1NnbzZNZlhn?=
 =?utf-8?B?dUJNeWNibUNqb3RkQzhjaWRRN1Q5Z0w5RmZkMVBodC9Hd3VUZHB5YXlMc0dM?=
 =?utf-8?B?dCtJS1FVaUZzOUlZTEN2V29CN3pQTytnNEd3Vzlybm0xVno2NXJuTnhLYTFs?=
 =?utf-8?B?TVVpYUhLRE9tKzVBVnRNTlgxRlJzNmVMc2tRQzhMZzh3OU16YUJLcFhYaUNz?=
 =?utf-8?B?SWpSM0tkT3ZEekNwU1RHdFVsSkp3MWF3WkNOZGlPNG4rZjlUZjF4V0phcHBt?=
 =?utf-8?B?dGp0bzJoQy92MGROdWdFTVVRazlVSXBYMUVnajh1N2t0VzFlSmxQc3pwa0Vk?=
 =?utf-8?B?YUJ1L0t1a2hvVi8xL1A2M0ZxRHN1SmhMcUw5TWFnK3hjREhJR3FWMVQ4K0VL?=
 =?utf-8?B?KzZnamtBZWJVcUM4NS9DS3VFNW5kVHhzZzlwbHJORTNwV2s1d0praTdwQ2pz?=
 =?utf-8?B?Nlc0OWZTSU1Ia1hsV21yeUNJYW5RdjNRMkc0amtSNURJV3dOR1dPbW4yY0N0?=
 =?utf-8?B?SGdYeGdqbTZxQ0tjb0V0RktxdzZmYXpaa3JVd1I3alpTOHhoMDFGbDJhTnVR?=
 =?utf-8?B?d05XN2RpcFVFNmFqRm85dHdEVnYwaVNZRGdQVjFRZDg2RUN3UnltYitqd1ha?=
 =?utf-8?B?SHI4NjQ2Q1ByamtQV1VJalNvRStEeDQvV2wvKzJQUisyUmhneFphZWhoZWVv?=
 =?utf-8?Q?yJ0g5xot+dHFZCc4jXh8+ZVi7?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 690cb5de-08dc-4086-4193-08dd6bd9755e
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8500.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 20:13:07.9030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: glTFYIz6SmfXQcJEILAF9I8+McWZcLodPWXyrXGQnR773zFU4UNGbV+BC/IaFbHf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR02MB7956

Hi!

2025-03-25 at 19:04, Srinivas Kandagatla wrote:
> I wish we could be taken care in mux-core or even in the deselect api

It is not easily done. A mux is a shared resource. How can the mux core
know if it is consumer A or consumer B that deselects the mux if both
ignore failures when calling select? Mux select is backed by a semaphore
and there is no guarantee that a consumer selects/deselects from the
same thread or anything like that. The onus is on the consumer to get
this right and only deselect when select is successful.

I believe the documentation is clear on this topic: "do not call
mux_control_deselect() if mux_control_select() fails".

One thing can be done from the mux core, and that is to provide a new
API where consumers get a mux that is exclusive so that the consumer
can call select/deselect without involving a lock in the core. There
need not even be a requirement to call deselect between selects in that
case. Such an API is what many consumers want, I think, but it is of
course not really compatible with the existing API, which is totally
focused on the need to share a mux among multiple consumers.

And, of course, someone has to do it.

Cheers,
Peter

