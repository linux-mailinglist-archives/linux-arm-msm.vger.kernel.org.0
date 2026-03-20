Return-Path: <linux-arm-msm+bounces-98931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHgiF49MvWlr8gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 14:33:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AE32DB077
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 14:33:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A25AD3024BF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 13:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C80D3B27EA;
	Fri, 20 Mar 2026 13:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="xH7ynMA+";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="tvmFBbzA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx08-0057a101.pphosted.com (mx08-0057a101.pphosted.com [185.183.31.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA8D3B27C5;
	Fri, 20 Mar 2026 13:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.31.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774013348; cv=fail; b=Sbq4rDc2DXkNu9C126lB2OYcaIet26JTFEZChfmOxLHdl4mR2AkY7oBI4vJA2ItDLm1kwhibUAdl6tYpYK/EYUw3qfVf0bB/bEaArmzdhLOuaUXH0xMBYGA0fu1jPPWvG9Hoc2yI4qozAswZk2SmJoyOI466xnAhYCZ6GQ9fZS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774013348; c=relaxed/simple;
	bh=FgOXSd2M7C04pKAq+g3F6aDBYmZ75CIVojVG5S5Fie8=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=OJFPRJJXvJBtOapPg0x/BZKpOcV3qpJ2FyBWPtae0GQviZUmVnM6w5osShNAA3pot/AXJ4A00gdkLDGag244mSF4iw23Eu5PkxDWxkjEEyCmAz7TKXHvZ2fTSkW3K1Qcz4Q5WvkW53ylrGf/VrB/Z3ZZYkeiOdgSZNt9lToDsjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=xH7ynMA+; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=tvmFBbzA; arc=fail smtp.client-ip=185.183.31.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K7voIa2116792;
	Fri, 20 Mar 2026 14:28:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=270620241; bh=6VXXQ4tKHVKxOqi5El2Uqg
	l/0K7zXId5tBb120jRcww=; b=xH7ynMA+7dlE0qb+OR2Gxv82VDTqyc1orB3K0F
	4lVmEJTogTN5mr2WY50bAR0UnQIRXjKVCzUuMtpG5dQQpUKBxFHC5yTbSMx3de/D
	ihyzpvQfCLnE7yAh5vkkCObs2n2AOfw12AHfFAp8dgjm5TOINSIYBes0BwIVi9bW
	cFiZKw7/Qkv4MuRxIZLNDCC3hl47xmaDFxoAvJ7e7foaNwTQCjH/69S5RaGHbixB
	56jMr0dvtgQsUsaGhW5Pp4dz4zu/y6zUmpEl2zRT1jURdLss88Vui8FH7pL/D0P/
	PDuLIuOzWpIRVYjABoGDqaNAfAWIi0lQBDRfGuPgOw4MEjMw==
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11022075.outbound.protection.outlook.com [52.101.66.75])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4cy6wnbbtt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Mar 2026 14:28:56 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ljyMGM901onRiTR5Llf+Qm6WRxk+ZhAqFeAvz+T7xIa02nxt6Ut+QAWORQw9oXi35ySM4HdRYpQnvmv2HWToMunCCThS/WAyAduaxuREVsZgbgeY+lDIpXnMCFSh6STeQsNFng95JYy8rwu07ome5a+URk2NP1JKF3t8th6aogcnm8FQx2aWt5rbGg6nfy/eUprTzhp2aZCdrls2Xs4Rgia+/vgo7enXLDan/e4sIOhxWxeBT5iOsWuO2gpCzsbGqlJ1n33+O9uairvtM86DDeCrUTGgJVUvHZZc04rLcdtS459UsoIxZ0CS5Bs/r9bz6v+snlatWf6yGmeSv1zJ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6VXXQ4tKHVKxOqi5El2Uqgl/0K7zXId5tBb120jRcww=;
 b=yMNk/Fb17IhGMiXu3G7yPwPmApap//nL40eO0RiyzqHSJUolj162AbEiTA31tyrbUTnMD8OcMfYahDnBCgsAjKdyE2EZAjBZjAvY27CQ1ypVKzutGJImKW6aWM3GWKP1/n7K8j//Iex2t4puNk9vQiW/hiOaLNQVI5By9pbw4+/bRWudF/P+n1ylQdd9tEOT45MzDTyZkUr+wbyG+KpVmI+zWyCYZAEctetQkqSFAbNH+5KDhplC7AQMds5AzD9mhkhEuKM1T2juOP86NXt8xy17g716e+8/edSHtDFb1W3FK97ev62tv1wMWSepL+7sITYAIigQjLM8dfCULFkiYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6VXXQ4tKHVKxOqi5El2Uqgl/0K7zXId5tBb120jRcww=;
 b=tvmFBbzAarGq+KCm8f4BCyqSnbFXl6/ExmD/g3j+iQMAkwe/Fn+balohMzOPH6JGWg5Nm/ayZpxB3dKNaJ8EGddAoStyUDtKWaLjJCndd0gj6jt5CNVGbUlzUxwqsJrJWhkUx9NLekeOanohszCIP7KZcicengue2EhCcXnj6os=
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5e2::11)
 by AM7P192MB0835.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:14f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Fri, 20 Mar
 2026 13:28:54 +0000
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b]) by DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b%5]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 13:28:54 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Date: Fri, 20 Mar 2026 14:28:52 +0100
Subject: [PATCH] net: qrtr: fix handling of confirm_rx field
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-qrtr-fix-confirm_rx-on-big-endian-v1-1-e1a337dc1a38@westermo.com>
X-B4-Tracking: v=1; b=H4sIAJNLvWkC/x2N0QqDMAwAf0XybCBWNtBfkSG1TV0elrp0DEH8d
 4uPB8fdAYVNuMDYHGD8lyJZK3RtA+HtdWWUWBkcuSf1jvBrP8MkO4asSewz245ZcZEVWaN4RRq
 8C8SDT48ItbMZV/9+TK/zvAD2ujbYcwAAAA==
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-ClientProxiedBy: GVX0EPF0005F702.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::253) To DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:5e2::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P192MB3090:EE_|AM7P192MB0835:EE_
X-MS-Office365-Filtering-Correlation-Id: fc606f98-5468-4795-053c-08de8684a1c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	P6p0MQtYG63I+GodIH4V1m/O6jL8Qaq+/rh19GNMRMBg4RrmmNMaoqyDdCWhdyL3IFngnOrrMjvhVc9NvQRzGe97wvAankU2HkwPaa+mN1GF4WQbV/0SyEEhmF8sYJ4nnYYt82h0SW/ceC6RLkj+kVgVqZrsfC8vHsGDbxBv6+M/auNwPQESoGCxKLTR9BCHpJ6lUbc8Mvc6LDG/SeAeZUMHDmcufa0qbfnmlyTNWcvuEXebnlJ6hB1wkoazRU5/lPUY90zsuxQPcL/NgTm421E3bSVoqj+Riogrpf7DH1lrmCYDdVng5HU8n6KPEM2hxEVoze2PH6FiVGWl7rMf6Rqd0s6xXBIzBHwz1MFGd0sNL0uawgyYUMtO+yAOrsT7R6FSRv+ZXAExa9/BasM3N5JcQyIjvcwLNWrWK74tBtd2dRUG5MFjd6dy9y44LWYWyvP4AySMYmlICjRLCzxN8YmrcMq32oKDsfezqFRIsf95ABTmFcadH3pLFRAUB+sTqfBWsotI0jMzHhrG5P3Vs8uay00S/F56DBELMDni/cDRFJ7+Vouz45IuZmlBHe4scfPFb+RZ/FgNV7CP/0fx+aTIOZxZA0EqV6PRJXLw3T5dHH+8Bb2TP//0qQTG1z+pk7SIuEbPsH5vyUz1wk7vcAzbaCrtFLwlM2pqAJa7wW+PdjAw12oGnQxPKvE4kTrRGtQNPehaqV0vUeA1Z9fsY+5gQTKbQnIwBXHGU8cYM2s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P192MB3090.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0MxU016eU5kdXoyb1dZelphZW1JeU1LYStMQ3N6NjVBNzBCeFZiV2FiSVNZ?=
 =?utf-8?B?RnZ5OThkb084d0RhSmI1dDd5WktKc3Izaks4Um82QzVzb3hqUjAwT3YyOU5J?=
 =?utf-8?B?NUlHQzE4dGpndmRZN3NsZmV0eG0zNTgrMk5xYnhja2JHYnQwMUZ4cU1jV0ZG?=
 =?utf-8?B?K2FyTGZqK0tlOXoyVXRsVnNqeVpWWDdNOE9xWUVDSnZYcVc2bWNMamdpSUNn?=
 =?utf-8?B?eXNKWW5WT2M1MlY4aFhFQUZOQjdQWHlCWE1uY2FPQXBHYkxQVjRHQmozU1NJ?=
 =?utf-8?B?bWd0eUFIeVE1cjBpSWZIQ0libjkxa1U4empXeTJPU3dFSzREdUJDRGx4TEtU?=
 =?utf-8?B?TmNXYWRMMXAzYXo3NnJqYnRpcThlWm5nRmVFY25EcURVNnd3anpNb3lrd0xj?=
 =?utf-8?B?UjFOL0tBazZPM0lWQ1IxSUhMYkhRK3cxNDlrRlVObXl1ZVdiVnFVS21zLzRj?=
 =?utf-8?B?QnRqZXU2VEpKWGFQeW5QSVAycDJUc3NEb25VMVE0cDl2NXNXU3QwOHNyNjlU?=
 =?utf-8?B?ZFcxZWpVWE1hWS93YXdjc3laUWdwRVZ1RHZtOXQ4OXRKN3BZZkNSNnp2OEhn?=
 =?utf-8?B?eE1Wd1VVbCtZZlJJcm1JZThRWXB1U0ZDcEM0QzB5dzYrVVI1VWRESUxqZ1Bh?=
 =?utf-8?B?RnMzQzRpNGFrdUhET25EejZBOEVZK2NUeWpWR3lzZWRkZ09zbEt4SWhOZlJr?=
 =?utf-8?B?MmNXRWd1VHBvM3RnRWYwTVJOcDhnY1N2TnZiU21aL3FSYzZGN25ZdFYxRVdw?=
 =?utf-8?B?MU5pRks1azFUYkl2TmJyTk5GYlBkTFhqVEZOY0lSSDFJU1NjeHlvVFlJLzdx?=
 =?utf-8?B?RitTYUpIRXREMVFJZmc4ckRrYVJTcVV1S2xkdW1IdVpUQzRWTDF2RU1LcW5V?=
 =?utf-8?B?UWIwb0NKWG40S3EvNThQc0Y3ODkzazhXQ2wwS29FbE5qdnhZdXhzWTl0UzQz?=
 =?utf-8?B?enNTdXVQNnBnN2VqbHZ6anQ3b0lhaXVhUVdDUDEzZzhScW42NEhoL1grUlJl?=
 =?utf-8?B?VkVDMGQ3OTRFUjVHaElrWVloSERacHhIaWIxYi83NEJMcUdOOFh6SnRpTVE5?=
 =?utf-8?B?VDZMTzVmSjc0clJmZUYwTWZVVjNPMXU3dm1zS0xrU3c2UG0xVk9LTE1rUzg3?=
 =?utf-8?B?Ui9DL2twU3BpZkY3YWxYTlZieVlkcU82RVdUdkpnN2YwVFNMeHpqTk40T2RV?=
 =?utf-8?B?Z1g4L1BieHh6SjlrU1oxdzl5QUMrNGVLU3dwdEZ4NE9XSEtUazdZNGt1eVp5?=
 =?utf-8?B?NnE0c29YbmlBbmRHU1h1dUNwSUJEWGZsOVUvTkJ0WkdGT2s1S0tmZ2lITlE4?=
 =?utf-8?B?RVNvSnFGYkFhdk13cjhOZ2tZYXRGem9VNmNyTlFTYkl0b2lNdzJzSldxZjMv?=
 =?utf-8?B?WnRXYmxRbWlYZXhuQlVrcHBZTUFFYzh2SUFXbXhlOHFUZGZoMHVIWVhiUGhN?=
 =?utf-8?B?RGc0NUZWcmZRZk1CQ2ZaRTk1T0FMUHRYR1VQQ1luVFRWS2dpT3ZIQW14MC90?=
 =?utf-8?B?TXFUeGtaaDNaczN5K09zTmJPTjY0cHJEWXdxRHVWbjlmYWdSdkM1aTVVVHBw?=
 =?utf-8?B?eXUwZ2xJTS9SL1FWOG55Tng2U21BcCtZSU13NVhSVlNBazNWNkxGSktIS0lG?=
 =?utf-8?B?bnFRUWt6ZGxGaHhUWmJkRS9jOUZTdWFWOGRQa2NsMWZzdytrMlIvMTcvT2xm?=
 =?utf-8?B?YTUvcUxRV01xUUpYRFYvZDd0NmJXbDhVVHFaR2xoUHE1Vy9lclhCY0VqOU1s?=
 =?utf-8?B?YVNEbHVJamtEOFZ2NGlyZWlqTG5ockd6bkdGTGEwZDhtdWFqUURpcEtkYmhp?=
 =?utf-8?B?NEFUUGxMYlFEWCsxcGV5ZlhtaXRRNkNoQU1PNUJNNzFrWE1ZeEd2S0llS29Q?=
 =?utf-8?B?ODlBNjdrM3VPbVU5VW9XWWRmZ2NtTk55M1F1VWh0MVdVMnFTS3pCWTJjQVJx?=
 =?utf-8?B?SGRvc21udFdmWkVUdHdHVnFiMUE5N3d5SnVOczg1Nkk0dDBoTWFZNG1teGo3?=
 =?utf-8?B?WSs0a3MydFBIN0M2anRzMXNoWUJEU1JuNHBqcTMxVmMzd3hTN3l4MWg5SkpD?=
 =?utf-8?B?OXlhZW9tY3Q1RWVFOUtUYUtXOStQRlNNQUVaNE81eE5sL1RwTG44VC9zYm9F?=
 =?utf-8?B?ZllxMUJCY25SZ2ZCcDIyTUEweTh1ZkNiU0VUeGY5dy9GTEU0a3RZOXhTOURC?=
 =?utf-8?B?aGVYUVVXWVVFclRDQ0FNankzSEh4a2FrMlZ2MW9XU2hzUHZYUzdKY2FSUHdk?=
 =?utf-8?B?NTg5dDhqYW9HQ1g2T3JNV2tjdExTTTBpblV5Z3Y2MWsyY0I3cmtseklSbW1Z?=
 =?utf-8?B?Z0Y2a0liQXBCRnl3Qlh4UDJQTWJBdzZjSkFmZVpENyt6WHlXWTZVUT09?=
X-Exchange-RoutingPolicyChecked:
	iMdCUDyqnA8Q8DnaB9LAdQZdtAVX/3OAf4BI87I7TMJ04hf85AYUpVwlqOPLkLumbMHRx45CV06WRVwgU5XrWxGjJQ3OPYVW9LFqQ2SbOppQEjWxIIob2w+0A1C7Y6pLzw5wrwjvRat3sIB5g0/2uMQLUYLLWOtZJySrJEVlppQ4xYP1X4nZkb0S+lNf6ZEi+gtHxeSY/r+ZcEtxFsFJIgdq6OOXawWk/y2LG233eLBzMAGTzvKVhQXqhD4JKmOKiIwplElLxZynda0eeVQoIuWqbaUmngyHxHfavn+jVwDgB/J5nuUbAWyL4hkBsk1iEVom6j7XNdubUB1k8sEQHw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Wbv3/SQTyCFwKMjFA86szLaMMJb9roRFRn0HpBgHpmsH8tZZm7Jn0y2WrdT8LWfawIUgXJRHNrrMpXjKnPCHX1v0Rhf1wKDPpMB0pM51xY+ZTj+VgiYdbiQy9lcCD0Yj/NwerGzCwypUyH9M/jZVskDtsRgFUeTTOT+XFpUoaeeIRWlk9zPVg5gB7a39mdkRDs+dhagfXM5gOVOweh4sIw6GqY0iM4A2QQv7rq8oxIi+4tfP+PcYphS7uk3gpGCW74Tm229e07dxf72cULal/TzVkKfLDdPr2rve5gcMuIRSpXJPARhcmNrdzK4uiYurCFjMX1JbKoCf45OHewR3+ajDF8TmWpFZ7lAGTxvM98h48GiWWGolIQNxdtBQ6KdxdevUUSv39khTxvQJU8BmtPTqwrulBfsKK1CwcITPfqRDBJq9gUBIAscn22D+QXl/oHI5hSukw/8FxeI1d8+O0GxIB6TjrACL87g9PtdsCbBYLdALJNtx12aoggQt0iFrgEF6BldNm53wqZY2Yjn1Yk4O5GTjz87NU62Gh4QENR9Y8+vb0yvq7+8yGlcQbNH0g54MrS+S6TCy7CE/FM4jDEXy99ZLy9KYZFg6096nAME0E4KI19qs3TU5R5hf9NME
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc606f98-5468-4795-053c-08de8684a1c4
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 13:28:54.1775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9QDTdYwBINVtq1BZLpHoertz/xlnVbLUjlClT8GdKCV+Uz9zG/voDcIaHCSAkoQ+gNlIkTliwjAn4d0bBFDxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P192MB0835
X-MS-Exchange-CrossPremises-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
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
X-OrganizationHeadersPreserved: AM7P192MB0835.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDEwNyBTYWx0ZWRfX67zN2vlbTza4
 n2WF+Lle7gjhROQ5S+JrjM/ewZc8to7Ci4tZ6HLwM7lhWUNhuarZLgv6wNmm6WjTyyFj2dZmjhq
 p9yD0HHx40D1R9/Tc4S/G0RbMsesBoL7L6ag3K0DU5EQgOCQmejoAi0SlyIpTsiqbCTYJbsS5k7
 1hkhl1LuwimHVj4obRz8yhX2dezGvbvDRTQ1UBKas+FL4lmIkeNNNp35ku4B4BGKfqTmtQnQ6YP
 1STYkj+9fV9+wRJdVmNjl0D6Yqq4oZSytcJyZU+BX1ZIQ6sgqv/DS8TNK/j1AhJzHDHCCBBMzvp
 xI/0Ix4zFwb2Tbb5b+Xh0y7gjrIr4OgAMZvVREyx1OKE8wcLCJeq0sM+LH7k5Z6h8xfy2+YihfH
 shddrbiuHliJWdYVPIfTJ3BlUR//NaTPFZh8qm0zFrX0xgsBeKFOMKvlW+8HFh2bRuhJ7+0pPkS
 kyZHY5T6SpO59j4iumg==
X-Proofpoint-GUID: rxzaKgg6MEwb07OGWGxBqc6HJ6jJFJM0
X-Authority-Analysis: v=2.4 cv=a/Q9NESF c=1 sm=1 tr=0 ts=69bd4b98 cx=c_pps
 a=sg7YqsdWFpWCQ3lvnvyxqA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tr3XZvuDWTETL0Uaxejn:22 a=WQ4YJ39tjzx_Hbm9pN5v:22
 a=N9GNhs4bAAAA:8 a=XPY_d7VNu9vM5ihsr9IA:9 a=QEXdDO2ut3YA:10
 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-ORIG-GUID: rxzaKgg6MEwb07OGWGxBqc6HJ6jJFJM0
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[westermo.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[westermo.com:s=270620241,beijerelectronicsab.onmicrosoft.com:s=selector1-beijerelectronicsab-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-98931-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[westermo.com:+,beijerelectronicsab.onmicrosoft.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,westermo.com:dkim,westermo.com:email,westermo.com:mid,beijerelectronicsab.onmicrosoft.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.wilhelm@westermo.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 68AE32DB077
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert confirm_rx to little endian when enqueueing by using cpu_to_le32(),
as big endian systems otherwise interpret the value incorrectly.

When receiving, apply le32_to_cpu(). !! ensures the result becomes 0 or 1
in native CPU endianness, so this conversion is not strictly required, but
it is kept for consistency, clarity, and future safety.

Fixes: 5fdeb0d372ab ("net: qrtr: Implement outgoing flow control")
Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
---
 net/qrtr/af_qrtr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index 55fd2dd37588..bea1f1720e7f 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -365,7 +365,7 @@ static int qrtr_node_enqueue(struct qrtr_node *node, struct sk_buff *skb,
 	}
 
 	hdr->size = cpu_to_le32(len);
-	hdr->confirm_rx = !!confirm_rx;
+	hdr->confirm_rx = cpu_to_le32(!!confirm_rx);
 
 	rc = skb_put_padto(skb, ALIGN(len, 4) + sizeof(*hdr));
 
@@ -466,7 +466,7 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 		cb->type = le32_to_cpu(v1->type);
 		cb->src_node = le32_to_cpu(v1->src_node_id);
 		cb->src_port = le32_to_cpu(v1->src_port_id);
-		cb->confirm_rx = !!v1->confirm_rx;
+		cb->confirm_rx = !!le32_to_cpu(v1->confirm_rx);
 		cb->dst_node = le32_to_cpu(v1->dst_node_id);
 		cb->dst_port = le32_to_cpu(v1->dst_port_id);
 

---
base-commit: 0e4f8f1a3d081e834be5fd0a62bdb2554fadd307
change-id: 20260320-qrtr-fix-confirm_rx-on-big-endian-09a2c0e9af5d

Best regards,
-- 
Alexander Wilhelm <alexander.wilhelm@westermo.com>


