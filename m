Return-Path: <linux-arm-msm+bounces-55987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5630BA9FC59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 23:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE0A44634CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 21:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3421520B7FD;
	Mon, 28 Apr 2025 21:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VOcNbcMv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2048.outbound.protection.outlook.com [40.107.105.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153E0204C07;
	Mon, 28 Apr 2025 21:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745876451; cv=fail; b=qIEIz/CDsRxAhpc2ZiV6sVCJdch2HOPgffhozOqgZijx3/2rbQpA/5nS8KYwXsxDlocmYEP4Ekr5OLpqz3VmdllF9OgfYOXWBRkWt98pCxNyPyGRZ78bJLSILXnnAEPFOSDF7BvWxBTOI2Hyua112HbuwxV7IpLbgqj/6ekO3kQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745876451; c=relaxed/simple;
	bh=5n1q6rhHhhuFfbcDF0ybsXj/W1Wv58OfwYihfQR4y38=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ab+MnYe3kXeiV6MK0Vp60QhruOXU3+QqEj/2Z/8xgqUvV2ex+5K4453o9fWSXjmlbXeroLcGP+MIxa2315JPS7dh5DAgl/hKVr3XfzAURbH+u7bBk3F+Attu/RQCn31NgUY5L2zcj3wEl7m1P8p2mLdzkE90EBiONc4Y9Yw0wX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VOcNbcMv; arc=fail smtp.client-ip=40.107.105.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=irKriz6Lq56gQ3xNCcyOilJkQvD64VAZk6i2J+vkZzoO8NPp8RH2HPZVZ5wNFUGoQu9r1vCtwgcx3X9SgU6EVrrRTEIp+4MzgdgMvn3kCFwCCP3BvoobzzTeIDMAqzZ50bOHSueENE4LOvn+ct/DAPTfbUXJ5gKExWjnhefOKnCs1DUbar1xmenndMVqc9ym4qj7wsPEA8WyAXroBZ7oD4fJ+URHZ584fXi5yGNO7kq3LG1oGbjIKgk6TySkeu7q2zH7T2JqVFecEpC6up7mv96rQ0PQ9MHR5pCsyBjs32uGwPDVN/nbA0L+LnI4upiIW/QriOkoHgWhK1K8tsYs9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=le5HuXrhqWS72PSd8/L6yifA4QUECx2VlRLIIw/1PLU=;
 b=rlcSlj0VAUFBi2mRJDidSYVji2Mt9scB5PpcPeEDFd/R4biTJjvp5ZX7wJZreRky0tg9PNhYUtqktMvLf5g8AIa/t+WbAapbLPOtK5nS1nNhqsyU6lpHm/W/kJHp39OD50wtBjKlnnYG5SUtVogk74MSSozBpZs+ZiMFj3TrSTxZcTtjS2CZsNNPYplOFCOFzJHHSU50q1moj5X2MnF5EP5DScDt9iqsOh4Uo5t8hxasGrh/q/h4G0nwkjinptMW3EWr9yp+JoUWXFByezDGUMSXYSCnnyBiNOrerRrfWA9XMiOEa4MyJ8d7yYwOb+5KDk9N1gmutOT9EmmEtH5XLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=le5HuXrhqWS72PSd8/L6yifA4QUECx2VlRLIIw/1PLU=;
 b=VOcNbcMvrg9tpjk19BiFekFcWVg5DRL81ho9NAPry/qHLG/eZxjIKXnlv5vYAPF8a+/U/QAam6d/2gdq+H9rtQ5c8vIQRSWrUO+QAlw0f2DaJXvfpuRbuuF8ngYVGIsPZuDSKl6gCM6UlMWws6J9h1WiGvJNziA7wstfRZ9z7OW4nBumK/0Wb7tTktdpfyDnqCgbtaKvx4lU2EpX9L0/A53n1LnulqlSyuPRUlh1VqYZdA4b+Hza0iq0aFwmucwN5nuoS/iARVsaIMDuf6oKhCO/JR9iHRPo6tT+khBplGijlfBduZNY+hAccfUCgxRpYLWZES4D2eaVuJAxf7v8TA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by AS8PR04MB8708.eurprd04.prod.outlook.com (2603:10a6:20b:42b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 21:40:45 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1%7]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 21:40:45 +0000
Message-ID: <89d58524-c6ac-4517-ade6-80c966c20115@nxp.com>
Date: Tue, 29 Apr 2025 00:40:42 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] of: Common "memory-region" parsing
To: Rob Herring <robh@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, "Andrew F. Davis" <afd@ti.com>,
 "Shah, Tanmay" <tanmay.shah@amd.com>, Saravana Kannan
 <saravanak@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
 <CANLsYkxKHhCHYrbAGzQ48QGpL_DbuLnX3=ppmpyu0vjuuvvODg@mail.gmail.com>
 <322d366c-1564-4b06-9362-28fe451a35e7@nxp.com>
 <CAL_JsqJemaAzx6v0kj52J=YFRGqLo5=xk8LXXk-8i=mAomTCWQ@mail.gmail.com>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <CAL_JsqJemaAzx6v0kj52J=YFRGqLo5=xk8LXXk-8i=mAomTCWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P189CA0037.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::8) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8774:EE_|AS8PR04MB8708:EE_
X-MS-Office365-Filtering-Correlation-Id: aec1419f-6d00-4d27-15aa-08dd869d550d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1A3clhGbzg1aFlVdmw3V2JnZFhUYVJJck54MDZ6ZTJVd0plMVp4T21XcklW?=
 =?utf-8?B?V2tiMEc2Wk1aTlZFR2tSSE5rT0tjVEplU0hRR1RIM3h5NWN4RzMvMVlHVXVE?=
 =?utf-8?B?MDl2U3NDWGRXVFdGR2ppQ3dXMnpFN2NDSCtBMU1FKzNiSDU0b2gvc2tGQzh3?=
 =?utf-8?B?bXlvRkNQcmNUTXJQaVJIWW5mUVdPZjBFOG1obDc5M2lPbUlYT0h1ekg0V2xl?=
 =?utf-8?B?WlpxYTVUcjNucHhVNTRrM01oVk5aS29mMkFDaGhXTkpCcCthQW4yazVPZ1N0?=
 =?utf-8?B?WkZBS2RHcmZCQ1R5M0hhaThlRWgva3RmTVBBbXZ6ZnBHeW1vdUpuOWhyOGVn?=
 =?utf-8?B?b0R5c0IxSFJ6aXdSd0gyU055TDU0eE9ScTdYWnVacVU1VW4ybmxPSmdFcXl1?=
 =?utf-8?B?dGxWeEh0Y001aEQxZmJUbWx1VUdVZnByeGJUYkxycHFOd2JKeE8rT2dGZzFQ?=
 =?utf-8?B?YnUzRmVjMmc2Q3ZMRmFBKzlRWi9xMWQ5cHIzVlh3NE1nOWszOFRNb294djMr?=
 =?utf-8?B?azBzTFp4RC9zcmR3VGh2N0N0dHBTVWFVSjl2dWlUK3dsdUsvSm1TdXNjOUR5?=
 =?utf-8?B?NGF1ekkxZjRxT1QxaEJZTlVEMFhXWmZPcWRIVTJFWlFiUDdXMllPRmg0WWJH?=
 =?utf-8?B?MWE4MllWWFUvZmIvTTNVNUNkN0N6YmZTRm4zMWFMOHViRU96NVRQSXBjdCs3?=
 =?utf-8?B?SWx0YS96WnlkRDZhMGhhQTVQb0ZaSmh5am05bnFqci8reTJPUDl0VDVpUFRy?=
 =?utf-8?B?R25mU1hOSkxJMWtFMklLSGxiOXJNWHl6QXg2ZVI2T0xCeGtpeWlXdGgwVlB3?=
 =?utf-8?B?aXU3Y1IyRGFQN3RlS1ZEOFh2SHUxVlFWZWkwU1IrZDN6c0xFa2Q3YmRzUFNy?=
 =?utf-8?B?M29VVEJ4U2dHZXh5UDY3eGNtclowZ01lcHRrTXJBQitDYldORC85WUxLSEJZ?=
 =?utf-8?B?WTBGR3VqT1JVeHRHNnRXNUhLRVFZUmxpU283Qmp2aSsvcm9tYnJxOStuNmw3?=
 =?utf-8?B?OUtGZ296MDRvSmRTaS9sOEFjMWF1d041elpiRXc5Z2k5di9pN3R5OWdxNjBs?=
 =?utf-8?B?SEt1N2hYS0QvMzM0U2dHUzMxZVVvM3pCWExQdm1yUnpwc0twMFIvelRxVUVX?=
 =?utf-8?B?YjhFTm0rQ2lqcGhMYXNoRU1Mc2Q5bWZSeVQ0NkZIMlhvL2FqRUxrTVRydlJC?=
 =?utf-8?B?Smt6bER2bzhpNGV5VUNkV0N5NVRiVXZiWVhEK3NpUTliM0xsekE5VlZDcXly?=
 =?utf-8?B?QzAwZ3huaUx0cE1mQXBVYW5hZnEvSnZMM3pCU2FJRkwyTk96Q2htaHE4VXBw?=
 =?utf-8?B?K1BOUTZaR0tTV2ttVVo2VU5Pa0s1Z2hGaUs4aUgyZ2tPaVp5QTVvUGlzd1pj?=
 =?utf-8?B?SGZVTmpWdG01YmNrWkpZc0R2TzZ3VDFBY29vVHEvTlR1cnVLYlJlcWY0Q3R1?=
 =?utf-8?B?WGljenc3NG5nRjFJNS9xY1A4RWIrWlZzZ0QwYTdMWE1XZUdtYVhnNVRUanRp?=
 =?utf-8?B?a3dpQkxPTzRwU1RSYWljY0x6NU9YL3kvV1VGMHlXRzQzbnlvYVkzOFF4OTRp?=
 =?utf-8?B?N0VOZkZBMGpoNXRPUEV5L1FVbi9QWG95RktiVjFnbFB6ekFKSnJHQnR4YVdx?=
 =?utf-8?B?YldRSFJrWWwxS3VCQ0l0OG91QWRwaW9lemcxRG05QytXaHJ4aTdvTGtwMVdr?=
 =?utf-8?B?a3VGd0lNcWZ1MC85RVlzcnlWa0tSYWJ4QzNodGo3STZoSXFuZng1OFN0Q1Q0?=
 =?utf-8?B?L0ZrK3ZvYzlHeHlJeWQwcjIzdW5zMmwxVk5qdCswQTRIZWttb1dQNjRzbWZl?=
 =?utf-8?B?TExOcXFmbWNpaHM3L2tJN0l0UEEzR3NEMm93eWw2cmwxWmczSjRIQlJaYTdv?=
 =?utf-8?B?S3RXbCtQTnRmRmJkTlMxZ3VaSVRoYnZiM2Q4MkJPZ25ydG9CMk9oaDZhSFNN?=
 =?utf-8?Q?lnZGXQOP4jY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8774.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3ZCY2pORGdFV1ZZa08vcjh1bC9QMFNoY2dsZXFsRUo3Q0xLemV0NVBydStn?=
 =?utf-8?B?N3VVZWRjVmRkRC95UmwzMzBwYTZkVnV5dXg0c1BORzdTdUR0MCs0Z2VLS0xa?=
 =?utf-8?B?RndGd2FTT2JjQmxnR1hMZ3pxV0U3aEgxS2txM0pCdC9mUkxZMklqbkhPRy9C?=
 =?utf-8?B?T1dXMmQ1VXA2ZzRHSXB1WEpLSkhkL1VZWVRTd1QvQjNIREJhRWFrQnVnNGFu?=
 =?utf-8?B?bEhqY3A4ZFZkUjJ2ZFJVR2JBcVp5dXVWRElSOXdneTBhY3pqbzNwTHJhNmI5?=
 =?utf-8?B?ZVU0aVp3LzhJVTdKczdBQzFEbjlRSVU4TEZMZ1JSRFNkTmxmRlZiblZ3dWNG?=
 =?utf-8?B?Rjg0NGdQUXZiY1hQeFZxV0FJWGpZekp6anJuakxvckhTSzVVQ1pOSWlBVGx3?=
 =?utf-8?B?OWVRSWcrMnNrNW9CeHlLZE1GSmFCWnVRbE1Rbi9JbWJpMVN5RlJtNmZHdHZi?=
 =?utf-8?B?ZDFNMDNUaHpGbi9rWXYzMXREVm9lRklFdHA5TUFQV2hBM21JVjlOS1ZzcDhJ?=
 =?utf-8?B?MDJ0Ri9xOGljMWZEVCtwT3VQV2ZLYThDOW1qT0lBUUM1N3Fxa2NNU3kwTHAr?=
 =?utf-8?B?Y3pTSHozMmhnbFBnOXo4S2JEN3pjVW1NR2MvbWZpVHhTejRSSDFKY3ZnYkNy?=
 =?utf-8?B?T1lpcWRDNThxRjQ0WWE0VkR2VjFTbno1STRhL2E4WE1Oc1FXbnBVcUdMRk1H?=
 =?utf-8?B?dmMxUEtzNlFjTHZBUmhuNXo0YmJzV0xCUGJ0MWhmQ1RyMVlPN2JPNlZXQ0pY?=
 =?utf-8?B?SlliWjhhR3g5TGtuSnU0WW9ob2ZEUnMzZDVVemFZOEgvbUExWWMxZ09sWWNk?=
 =?utf-8?B?RlJRL1hYc0Mzdi9mZlpoaGhCbzJzMmxXMlpwWjNhem8wS0MrbU0rVGFEQkpO?=
 =?utf-8?B?VFpjcVA0KzZ2YWxidlJtanNqTmt3REd6WUdmZ0drcXR4Q2VoMmhBSzFCKytI?=
 =?utf-8?B?cmJQYW92N2RMZGYzSUhIQzVWakd6WjFSc2hjRjk5akZhaWxhbndueGUyL25l?=
 =?utf-8?B?aEJSbUJyN2hWWUtKVGg4QkkxMDZhYnZpQks0YnhsbTdFdnBSTVU5M1dLd2Jn?=
 =?utf-8?B?RUNQRGxaQURaS2VscEVwR1FMVldxSDFwdURiR3htMFRGdGgwU2s1YVZzZ21n?=
 =?utf-8?B?M0RiTWJvUllDUnhidGE0ZURpM2piZDFiTkFZbzVTNEY0eGViN3c1N21UL3Q0?=
 =?utf-8?B?eXowWTJiMytHMTRvcFo1L1ExVUZlUFpvSmw5YnFoeVBNUWxXM0tLdGp3ejZi?=
 =?utf-8?B?QXc1eFlDSXFmd3N2Qm5SNjR3QmtYaXhLVFNId0p1amI3V0x5Sm5FOTI5Tzhs?=
 =?utf-8?B?Lzg4QndsbGpkMDloKzJvdzR6OG1iZ2VxWWdsenNFdGJkdU9vVzhQUjBTOUhs?=
 =?utf-8?B?cW0reitCSm4wYlpMUUthS1FkMzVQSnJoS0x6TUpReEdNWUFsK0lSSjVyRElI?=
 =?utf-8?B?YUpDYzRsaGZkY1FCNzk2b2IwdloyMUdVVDZGUnIyTERFbGJaUXhhTFRhK3ox?=
 =?utf-8?B?bnF5dm90MDR5ckJqUStKakZUTkwzU1VFY2VYR0JhdjJBbVc2THV0YTRHUmdX?=
 =?utf-8?B?bnREN3NDVnFZYmRBSVNxaU12QWN0bFhoeW1mQkJaN1pOOU81aE53cEZHR3hw?=
 =?utf-8?B?Yjg1UmU3WU5tejJwSXNMUmNVS0VkdEw2OHpwNkZMS2wvbkV1Qm8xZVo1L2x6?=
 =?utf-8?B?K2ZnS1JqOVJZRXVHamxYaHZ2UGZOdnNjREM5THF3R1haS0lzRE5jcUZ4cWxQ?=
 =?utf-8?B?V2VBSDBaUmhLcGMwcWducXgzK045eHhGWTZZWjBKWkpoYlpqamVjVmQvc0Fo?=
 =?utf-8?B?MnlGNWJyWFYyZVRhenlCak1ZK1JZOFJoY3NYbEVDeHQ5Rjdxcjk4S25obVVM?=
 =?utf-8?B?Q1VoNGVaNyszcnlPSEp4MktHZ0E1SXJOSjVIQlVlMDVGYmprOGZjWXlwajNa?=
 =?utf-8?B?VkloMFltc0VKWDIwdi9iZzIxS09VV2V0VERiVnRGVEMrT0YrR2RFT0t0cFlT?=
 =?utf-8?B?UDZDN2t4SXlSWEN5U1NlT0dVRzN6RmxIT2NObEpLWnpmaGJ2K3FtTnRrUkI3?=
 =?utf-8?B?T09MMHNaUmNDQ1hiUW4vVVNQSEJ4dlJLbGdUdVdnVTJ2RGNzbW9PZDdBVkN6?=
 =?utf-8?B?b1dvYkJiVEpxY29hcEFQajl0Sm5LaGEwUGMxOGVFQ0F5enRpSmFXQ2U4eFVP?=
 =?utf-8?B?T1E9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aec1419f-6d00-4d27-15aa-08dd869d550d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 21:40:45.3507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +bj2zKYqrCfal4xcKlXwj8RbUIAtOY1JuxfbKYP9Q+SZwn8zTC9tl62kc/wuVYqsgbsgUJY0GzpUfN1XSwxnmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8708

On 4/28/2025 3:23 PM, Rob Herring wrote:
> On Fri, Apr 25, 2025 at 6:34 PM Iuliana Prodan <iuliana.prodan@nxp.com> wrote:
>> Hello Mathieu, Rob,
>>
>> I've tested imx_dsp_rproc and it fails with:
>>
>> [   39.743770] Unable to handle kernel paging request at virtual address
>> ffffffffffffffea
>> ...
>> [   39.805078] Hardware name: NXP i.MX8MPlus EVK board (DT)
>> [   39.810390] pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS
>> BTYPE=--)
>> [   39.817353] pc : __pi_memset_generic+0x50/0x188
>> [   39.821892] lr : imx_dsp_rproc_prepare+0x3a4/0xea4 [imx_dsp_rproc]
>> [   39.828079] sp : ffff8000853dbb10
>> [   39.831396] x29: ffff8000853dbb90 x28: 0000000092400000 x27:
>> ffff80007a36d3d8
>> [   39.838540] x26: ffff0000d0a5e410 x25: ffff80007a36d3f0 x24:
>> 0000000000000004
>> [   39.845685] x23: ffff0000d5414880 x22: ffff0000d5e1dce8 x21:
>> 0000000000000000
>> [   39.852827] x20: ffff0000d5e1db98 x19: ffff0000d5414b80 x18:
>> 00000000ffffffff
>> [   39.859970] x17: 202c656c69687720 x16: 3e2074756f657672 x15:
>> ffff800081f8d050
>> [   39.867114] x14: ffff0000db584680 x13: 0000000000000003 x12:
>> 00007fffa3330000
>> [   39.874257] x11: 0000000000000004 x10: 0000000000000ab0 x9 :
>> 0000000000000000
>> [   39.881400] x8 : ffffffffffffffea x7 : 0000000000000000 x6 :
>> 000000000000003f
>> [   39.888546] x5 : 0000000000000040 x4 : 0000000000000006 x3 :
>> 0000000000000004
>> [   39.895689] x2 : 0000000000008000 x1 : 0000000000000000 x0 :
>> ffffffffffffffea
>> [   39.902837] Call trace:
>> [   39.905284]  __pi_memset_generic+0x50/0x188 (P)
>> [   39.909821]  rproc_boot+0x2c0/0x524
>> [   39.913317]  state_store+0x40/0x100
>> [   39.916812]  dev_attr_store+0x18/0x2c
>> [   39.920478]  sysfs_kf_write+0x7c/0x94
>> [   39.924146]  kernfs_fop_write_iter+0x120/0x1e8
>> [   39.928598]  vfs_write+0x244/0x37c
>> [   39.932008]  ksys_write+0x70/0x110
>> [   39.935413]  __arm64_sys_write+0x1c/0x28
>> [   39.939342]  invoke_syscall+0x48/0x104
>> [   39.943094]  el0_svc_common.constprop.0+0xc0/0xe0
>> [   39.947805]  do_el0_svc+0x1c/0x28
>> [   39.951123]  el0_svc+0x30/0xcc
>> [   39.954188]  el0t_64_sync_handler+0x10c/0x138
>> [   39.958549]  el0t_64_sync+0x198/0x19c
>> [   39.962222] Code: d65f03c0 cb0803e4 f2400c84 54000080 (a9001d07)
>> [   39.968317] ---[ end trace 0000000000000000 ]---
>>
>> The problem seems to be when computing `cpu_addr =
>> devm_ioremap_resource_wc(dev, &res);`, in patch 4.
>> In `__devm_ioremap_resource` (see [1]), it's expecting the resource type
>> to be `IORESOURCE_MEM`, which is not the case here (at least the flags
>> are nowhere set for this).
> Thanks for testing and diagnosing. IORESOURCE_MEM needs to be set. Can
> you test with this change:
>
> index f87915cce961..00c93585758f 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -771,6 +771,7 @@ int of_reserved_mem_region_to_resource(const
> struct device_node *np,
>                  return -EINVAL;
>
>          resource_set_range(res, rmem->base, rmem->size);
> +       res->flags = IORESOURCE_MEM;
>          res->name = rmem->name;
>          return 0;
>   }

I've tested with this change, and is all good now. Iulia


