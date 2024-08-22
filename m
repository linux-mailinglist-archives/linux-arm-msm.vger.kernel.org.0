Return-Path: <linux-arm-msm+bounces-29288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD9095BB90
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 18:16:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2923B2997D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 16:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1641CCEF0;
	Thu, 22 Aug 2024 16:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="VxAe4pnu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01olkn2056.outbound.protection.outlook.com [40.92.52.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF0B2D03B;
	Thu, 22 Aug 2024 16:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.52.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724343233; cv=fail; b=cLz+73kyulz+8pFB0Lwrk/SBer0NzO0zRSvSiiQV/SqlJS+vyqxvHoZ71pYU0vb4awhnvvZp+0PIAZc9k7hLT0DRvfNcEYgQPNfDtw9pBeKhoYjnh5jcF6hOwCV4xVogst+S6gSyXwtx93g39jCJ/crIJjw31ZqLUf/0Pw21Vfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724343233; c=relaxed/simple;
	bh=8nWGpfUQV0/SMeZyqmpITLuBEAX3yerDmqrFzW3xolI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CS3/q8vVXifku+F/Z8RHLQEJNK/5CVWeYYzZch6f/9e7E/DuU5IDVzqE/i8HjQCWTqoqckQ7VnsdKM2kdeQ93pgvCJIKwrwmykuEgXCpk+4cvgkyIgNT6CRAl8weSj3bJG0m+O86wNvIB1CHO9x5eFRzjvAkxjQ0PKn6S/1EZZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=VxAe4pnu; arc=fail smtp.client-ip=40.92.52.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPfU4A/5E7LMYSeUm7Dg4baAaDC4o1q5GdAexFN+DK1hOhp1c80vW/9BDVaMWFx9DFIyHzNrxMGT2B5ONUduk/4laCk+CqU5k7xxYB0PracrW0uGqfR6tsmd7EKFD5GnINf4P0arHHE0+8u7ZJydvzK/MUua8YLRK9VVYyISkvutBotRUs2lY/chncy7jxtDOV5pgghW9uuhB5hSuab7EkigNat3dgxoQs16p+9vNHySXRMnGCHT8xJLn2aBpkrb+nPDmBXdKR9yEA+6NSJJ0+GO17CnrbiiHhe7Q0XRGkcM7xivuBbtULtZMvU6dbRg2ZKN2CRguvw4fk3Ic8ruUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8nWGpfUQV0/SMeZyqmpITLuBEAX3yerDmqrFzW3xolI=;
 b=GRQiCvlnoGJg+f+b2qtoBeggjFZQEzqqIPQKysnfAfGjrhyNqpkmwvMVqefmBbXbxsDTNy9JXVkpAwo1w+oGKNjt0XE6oytPe6im6SPtQQt65xWCtXbV2+WERfGomvpmfrmMV4faEnOQNW7cqw+78YepPlRFQAiG8r45/CvzHu43MUKynhq42lNUf2rllw5nH/5mXAMmDOGFoNMuFmMcDpVKc0YB2MAgbbbhM4f+rSEEtaJSiWV3t14ftbKNSbWhUMAR16PqAxy+wPWa/K8Mhp1mN9Zm09aKB70v1ZazhaClOfKBsDhN0f9xxwuVV3u8uD+yBQIn7smf+hq9/hlFTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8nWGpfUQV0/SMeZyqmpITLuBEAX3yerDmqrFzW3xolI=;
 b=VxAe4pnuHArL9vtbZayl/bTKIt8KnCE0vK7al3uQ7UVDfYOPh2G8TwGsUZ+4L1w4tw1GC14LPFU7FOQ5+eGBNJoQ1JxS3h5cerUT9v+MOsmZXnFJ0yjsKtSygwtUAqCf+ru3YKETpd+yZCT6VlLhF3xpRXB2aT7Gx53J6uCN6QI535iEfiopmGX139Cgc0fbiQboBg1zi6TZeaEOrjnFZsSPlJBO8FwFGmJFhf/Or1wAPXsVATmCK3/CTzq1J3JiJYfFf3trEpvrqGjxTcW7WxeBNCADz7XE/FNyCvvi4U6Lc65ddq6JkP/UFf2ho6+Xc0NrZgL6gNLj9Q8KqrzP7A==
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9) by SEYPR01MB5363.apcprd01.prod.exchangelabs.com
 (2603:1096:101:d1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Thu, 22 Aug
 2024 16:13:42 +0000
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::3641:305b:41e2:6094]) by TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::3641:305b:41e2:6094%3]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 16:13:42 +0000
From: Ziyang Huang <hzyitc@outlook.com>
To: krzk@kernel.org
Cc: andersson@kernel.org,
	bartosz.golaszewski@linaro.org,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mturquette@baylibre.com,
	quic_kkumarcs@quicinc.com,
	quic_leiwei@quicinc.com,
	quic_linchen@quicinc.com,
	quic_luoj@quicinc.com,
	quic_pavir@quicinc.com,
	quic_suruchia@quicinc.com,
	robh@kernel.org,
	sboyd@kernel.org,
	srinivas.kandagatla@linaro.org,
	will@kernel.org,
	Ziyang Huang <hzyitc@outlook.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: qcom: Add CMN PLL clock controller for IPQ SoC
Date: Fri, 23 Aug 2024 00:12:56 +0800
Message-ID:
 <TYZPR01MB5556648ABB617F62EF865A61C98F2@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <be2eae05-6deb-49fb-94ce-cb5e3a5bd1ba@kernel.org>
References: <be2eae05-6deb-49fb-94ce-cb5e3a5bd1ba@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [qjrQirH2e0MraYDqBhVXehUdI0vDS0gj]
X-ClientProxiedBy: SG2PR02CA0088.apcprd02.prod.outlook.com
 (2603:1096:4:90::28) To TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9)
X-Microsoft-Original-Message-ID: <20240822161256.5599-1-hzyitc@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR01MB5556:EE_|SEYPR01MB5363:EE_
X-MS-Office365-Filtering-Correlation-Id: 757ec19f-0924-446a-ba02-08dcc2c56324
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|461199028|15080799003|8060799006|5072599009|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	1TOtJKT0HXC+JmWDnuXgOm2pTye8EXawE0SUG5caIdBkOcQ23+tm1vLLN21+N5WFX4FULRPmmk4Li03OBB1QHjCt2DRDe/sSBsT0ch7XW3iqKOblFzqCS0s0klaJqvtKy5E+tB5yaYg9nx0Q0ir/aL1xPxNleVLJAK/Jsw3vLuOfUpqf6FYsFxyKgYdiOWtpFN2FR5eT7s6RHPemk0vofn4ywdXN6qY9IJNkctaJEjYtSC7uqt7MDsclBIF68SeNGayIOrNva6pIuZpB4mFFtO/KDi8zLLADUU8vWXwIICBtnp4BlEVZvVLeQ3TiNUX7dxHQZLqP3UeEiJgS9FBTd13OTI824dNFm8gTDmIus1hTlyZAvRlBWKzoDRdtM/MnKXiHdRuo/y2/nXsFcKR3yzWppCF3YfEsx3Kvn+k/MG7yzk1xOZzxEN/qux58Fa3Vpu8bMR5zWRyOYze/9w1xUKTY3dj+Z9wv37tlAD6kq7mvRwx65VBT2EoX2V3ougPUYkVYzJu/f7eDHIQFMFw9L8Nuw+poYdXqg6MO7F+3CCoOQMDs+IEDGdv099F3ZJNCOq/UaONmz3kqyCTFB9yy4tr0HqCqLtjlCbqfV39+VEELuOrAdO+Cp4JTf6S+w5PdV6LzNleVZMUUgLsmEjsLgbHjpDucyxOnYR8WSQA1dzliZAzhnPwcBe5y3mnrYiZfH5iEp/XM8T2itiY77b+5/hrTUQqDv3t7/7qy1Sir6QCOov9A67/vKN+M0ArlnLJonSkooLasWMVuLLZ2KYSTANWO20uMxjPdOnHFhzWXpew=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7WoYvHks4OP4Dcqw0fLLEMsCHFBEMR+48K5s+4TnjSwwJVcPBBu3gaUTmkED?=
 =?us-ascii?Q?o59D9b/XBpbvifR6/eLaTrpzQfXjfYGVJuHpVbenNYiMX5HT2fCnkzz4QGwT?=
 =?us-ascii?Q?/SwipoKUo1cZjiufHR0aAL2vXY7lci2/cTYjbeomWOfEwdNaYPLqxQ1Df2qn?=
 =?us-ascii?Q?CNuRIBnzQPvSbmK2h9w31vtkX6WXCme8ZLs1AyZiLB34KKzv9RmcjJgV5mAG?=
 =?us-ascii?Q?GmMQZaFI7QoAo5OnndAnk68qoWAPzrg7Bt7p6EGHOKdaFPbZezJbFlPI1dFV?=
 =?us-ascii?Q?EvHx3/LMc6Kekio2NK+59zl6ZRd8tUNd9eEF9wpdU4XwF4LlOP6dJzGStQmJ?=
 =?us-ascii?Q?rQSOWTZitwUScGjONknSHjk7WPAjVMIckVtdAtbHdoNCcjEzx1pMQBlmh+3c?=
 =?us-ascii?Q?7jFQ0pH6vz+Xp5DUHF9lVRE2YixbEa16GA8E+B5RSjRUWROHFP0DSuqfbEEV?=
 =?us-ascii?Q?6e+FxInusL70+t2Fq19PqbuCQdvyet2wGY7ENLTDsAbdVDRkJfSi324Up7c9?=
 =?us-ascii?Q?iMUaC2CcTVQcYz21Fdew/YPGdix+2KOgtpbSpTX0Fzbx9eZxKY9vIxcDSfgv?=
 =?us-ascii?Q?ENPByiwDrucO92yQnCIkjXDzSgE2F7TgMU4UdTeBEO0vYTMuc1nIBOnCDZSy?=
 =?us-ascii?Q?0oW2cQaFgsIcg/fgGKtlo0veoZeGIuNn5zvpd67TL6PmbaXgA2LYxj7WS4cQ?=
 =?us-ascii?Q?nXZS759LxZd5717NwCbFt2UCOh7X4ySOcn+ATT52uJVG4ln+d6JvpGW9fNy7?=
 =?us-ascii?Q?QgoMQUs/jovQDMztlmaMCbXNrYVxeZeSIYGaqooUqohJdoUYo6Oq0oYpeB8h?=
 =?us-ascii?Q?jVOJ9WjnczxyEgLbSkr5Vd0bOpPEBXH5cU60Kmu4J9icKm+MHPgJIEVtIAc+?=
 =?us-ascii?Q?on1f7kKUrbBALfLw2Ud7wU8lDyU2OQpy3WZ7IyUfmT4/gDg35h6hz+QXvb1o?=
 =?us-ascii?Q?SEgQXmZEAi2oPZqjqw2gJE8iAYV62qXg3q6LfXkPr2qo8JRGlf1l4tDRqDLp?=
 =?us-ascii?Q?B7+6y4paHg0bKUcnEA7KVPQF/B88+n6rk3Fs7/TEj5NirT7muh/GM77iZni7?=
 =?us-ascii?Q?wC8zM+Po0eSLeUF7/Cpjaq47xbwuKrLbdbsTdr6RHoSl0zBqh6op61Rjc3G0?=
 =?us-ascii?Q?m/eZsrxlolpYwcVJPwcvE843STjVx/8cn9S8yxblfPtFh6pMF1hcFFOBoB9k?=
 =?us-ascii?Q?3UKooNBdPOBJ5offzYZnio/EnOLnQ5ZNTBet0JLOc7GHqkaXKfj+vaLEFqU?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 757ec19f-0924-446a-ba02-08dcc2c56324
X-MS-Exchange-CrossTenant-AuthSource: TYZPR01MB5556.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 16:13:41.0532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR01MB5363

> Yes, I double checked again with our hardware team and the
> documentation. CMN is just a short form of "common" with no additional
> information in the guide.

Hi luo jie,

I'm a free developer who was trying to add the ethernet support for
IPQ5018[1]. And I'm also trying to write the same driver in the V2 patch.

When I was trying to write this driver, I was also confused about the
'CMN' whcih I can't find any description.

But finally in WiFI documents, I found the same word explained as
'Component'. There may be different. But I think this is a better
explanation than 'common'. So I named this driver to
QCOM_ETH_CMN (Qualcomm Ethernet Component Driver).

Hope this can help something.

[1] https://lore.kernel.org/all/TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com/

