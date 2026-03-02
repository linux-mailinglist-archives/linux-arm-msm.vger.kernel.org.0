Return-Path: <linux-arm-msm+bounces-94792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMomG3FHpWkg7AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 09:16:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9231F1D488F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 09:16:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75D0E302E7BB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 08:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C087377017;
	Mon,  2 Mar 2026 08:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="S26jE+9A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011027.outbound.protection.outlook.com [52.101.65.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4BC38A285;
	Mon,  2 Mar 2026 08:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772439332; cv=fail; b=MIY09BhWkcF8mCx5cri3FE6FFmsawPhkMhKp84B356ybzzRBF1tuqIxyPIQ94tEN0RDwcqRqoD+QeJHJT7UhP+S2HPgfS7NLLhbNchvOIoQMvYisXw7FUvQfciCC1MmGqCwr4rTctAlcX4nmpVwJYzfAQZB59TKPBBcdPpRUoVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772439332; c=relaxed/simple;
	bh=Jo0hW/yU/qoO4ms8iBLyX2Quhtri8Aogk0vAoFI7iPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IDm04EUYtUSLRSYZ1t86ZlBdh5MGkTfIUiqL0UaniVshb439PsJ+vAOHLJS7iFI1oSbxhfvunU2AbQYMvKxGkOQbUlWWCuDBvT/edZeCxtM/WJ2c9Ra4Hp7VrwAmTvB3AwUjOteD2hKG+mAkUx1/CZD820DloiHEIReup6FoyV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=S26jE+9A; arc=fail smtp.client-ip=52.101.65.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okEnmQXzJoruVOykxcbPTNJ6LPaXiBi+aXOzqxdQfFgO85Rkoel5brvDqzq0wr8knT48CJ2Pn7FNGuuEzrkelF1bVU+13s7Fgb+OnA6b28UYeQ5OdqOydYYnEivkvZ6T0z5vn+kDXVEOA5JeQ3dzDpPhY3Qhg1V5LLMD67oX2XVF29FcWVGi3nQWMqoKF/+7fWSLvAzsenpht5Oih5cpzViHak9vxiKzqJ4AXjaq3h7ANrAncr2M5101oR8LwCWIRfoppR1WDIt/ICKbcKM7kTs4vNJIKBS7hzbhAG3nn1zxuCsT+SeBVOneNRclhLn5M0qkoUCN+6A0MpuX86EtpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0C8EFJIojzx0y8Hgn3zZJ0+/K4ss9RUxQ+deTNNJAmQ=;
 b=bGJrAcM4HRHqQ78/WsXIFlCdna24IGK0gNVvQFlnwfrulXJWtcFNGjV8UQznnq4e23hUUquxYCMcya16XBDsB/E7THwI1GHSc1hNlzV0Cvuts5RweuS5aHVSLVhzIcA3+fv8/c6QkBW8QxjWDK0MdKa8WVTPghY3s8c6kqfpTbcPh9OZ+fsjINKA6NvlgoXC49uHKHw3+kxLyyti+0pFyW5TmKxZXQEbZ7NID2dfL1s/a8GoBB95RFQbgTUc+YftPhNpC0N3cDpG0IMRGyfXkA1jDZReZgupVFE6kH3M2+Dc+ozjmb2iNX9UO8XvOdft1035ucHwnZ12VKiGLnjWnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0C8EFJIojzx0y8Hgn3zZJ0+/K4ss9RUxQ+deTNNJAmQ=;
 b=S26jE+9AGvE6Iens6PY2lkm62rYX1l1QOE3ANs5B0OMmLwJ7KyRSUDznDzVfyKbh7rcpIR+YGNbDq/GLdSGgkrDzwgdzFjgTC8EYq0aeix8O2Lv8NdOyZipt9EahswaE3OYBNMPhTQ+tIYchyRdPE/NVcv+xApFN8b3ROrqKjKwqCOuXCcCTGdKyHs1BHroxb/JqraDHFSJlOYJ1RSIkYoTMXA98jV1OGWqqgKWpJNHH6NiEsSp5jXm7vQHt5XatPl+z6wiiXTRRWRNU+Sa81tl6QdOqtXJNrHnlha4QozwikrjPa+cDv3qsBuKhxUqD7PgQNU1HuSvQ2x8vsk5a9g==
Received: from AS9PR04CA0122.eurprd04.prod.outlook.com (2603:10a6:20b:531::24)
 by PAVPR10MB7515.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2f6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 08:15:24 +0000
Received: from AMS0EPF000001A5.eurprd05.prod.outlook.com
 (2603:10a6:20b:531::4) by AS9PR04CA0122.outlook.office365.com
 (2603:10a6:20b:531::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 08:15:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001A5.mail.protection.outlook.com (10.167.16.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 08:15:23 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Mar
 2026 09:17:41 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Mar
 2026 09:15:19 +0100
Message-ID: <9a53fee8-3194-488c-a04d-2070d91fc6ce@foss.st.com>
Date: Mon, 2 Mar 2026 09:15:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] bus: stm32_firewall: Use scoped allocation to
 simplify cleanup
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, "Bjorn
 Andersson" <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, <linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260105143657.383621-6-krzysztof.kozlowski@oss.qualcomm.com>
 <767cafff-1ce1-4291-bcda-7a9027efc32b@oss.qualcomm.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <767cafff-1ce1-4291-bcda-7a9027efc32b@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A5:EE_|PAVPR10MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: a7d4e270-502c-439d-05ae-08de7833da79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	c+mADtvIhIHGuxx1kvrqjXYL6TzI95VCflt4Bh1n3YjBlS3Puv7M45XKJN5rSL5om0oKRUqpgSX71uKzkryyLFri2uOdpLZSoUrpwpMwe4hyIN3h+ws0smWblbB/MxV8UV+y7ha0loF5eaMLesSPSWCR9QU07VhVIXdx6xWML96k6CXwY71AKu0w67mKmKxinSj2VT7i3Z6coMgJ0u0GP4hssmcE0xFQ2t5V1ddYD+QUKUgJ+g4N+kmfBq5oaIjZ6gvd54W3tYYiMtKqJi8Qn+TVEcRBrC/b0O8Hko5ZUZIcfl0ogBoYY1TWjhWk2XJBp8PXdCdHH2jHcrZfiIu4/Yu0yohoJfinj9sae3vsc0Lor3kpdM1kZSnG2K2mr/bN28nJMbPl5r6DQrS52vW8wgPZA4D+FGbVgsRHNCO0Dyk55YVibYlkEZ5a2ivW2/8l25OWfKgTCUYR6+I6CL6cv9dhtgVRgGB60p1K/N1osXyaBUCSbqFJmvVirYTHLpcoBff5IweK4acleVs1S74JJ8hCciGwyRXHwtynMOd0IhLrM4+KuKgGDJmgKQsDIA8hiIqgOAmb7x6YAJPMfljEUtRgWz/nTyOPyG1PauCcAZcJ8Nw7uREdy41UaPQpMypaehVyFS/yUc2d5cHfLcWcJJ4gzKcTQmG0ci0PCywIACW0w1hrkIWTy1W0ioNfmTVUCYpwqFTqAwehJn/yqjViAnr2GoadFijHdIXY675xWsuxWPFUxQuTTA7bknroKCvdZlgUWubxujwtWkQ3hnRYQ3paOd2fKiihdZaEKTs1KSxpQybT/cYB+Ev4iZcwNKAJLP9n64TsU3vIad1t9m4a2w==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NuFCnPWG9woXWvREWA+8Z9CvfZ+h+1DJIqZDegF24rIOipnE5w1itzOcRmdSkzE746WBh1J/a7iJznGYZlCyo/eBZ1+apWokzDkc21wk752R68LoNkMw93bCE6vs8mlmWGxXucybXn7OPERIIzy2CxJQUT6+mzoyVR9Sm396xS2QvYYgDBRvPStOR7HZFta26AQ4BITG6erRE/F7NFcZ64plKB09xWj2L1j1GIEDj9M+zTPTmL90Er4OH1MjFpngC3y0mhpqMlJ5GpO42ViG9PpK7L/tUzhxmJ0MRu44usdwpt4YQ+tnVEBBqT2k5A2Y3ZI4kgQxWuBkb65j+V7x4qSXNOKlvdg+dLRW9KUrGPRupxg8cJooZOgiuQAXJ+os3nHqv9M3u4HVfjOqXT/VZtf9Ab+xkiyCdI4smMFIbizYFqzz2YkjXI07UjGj5wKG
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 08:15:23.6407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d4e270-502c-439d-05ae-08de7833da79
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7515
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94792-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,foss.st.com:mid,foss.st.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,foss.st.com,gmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.torgue@foss.st.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9231F1D488F
X-Rspamd-Action: no action



On 3/1/26 15:12, Krzysztof Kozlowski wrote:
> On 05/01/2026 15:37, Krzysztof Kozlowski wrote:
>> Allocate the memory with scoped/cleanup.h to reduce error handling and
>> make the code a bit simpler.
>>
>> Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> Changes in v2:
>> 1. New patch
>> ---
>>   drivers/bus/stm32_firewall.c | 10 +++-------
>>   1 file changed, 3 insertions(+), 7 deletions(-)
> 
> Is anyone picking up patches for stm32?

I will.

> 
> Best regards,
> Krzysztof


