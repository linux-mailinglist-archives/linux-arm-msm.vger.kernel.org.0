Return-Path: <linux-arm-msm+bounces-96560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOz0EeHir2nkdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:22:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 816F9248452
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:22:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AADC43200C08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4821B4418F2;
	Tue, 10 Mar 2026 09:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="cad1t05/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010061.outbound.protection.outlook.com [52.101.69.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A521043C05F;
	Tue, 10 Mar 2026 09:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773133489; cv=fail; b=d1B0oal5C8Wy9exlb3JHTtXII8Swmj5o5mGr5H4jpG71uffUj/RaIDMZIUYqZbxjiAVEoa6xQWVt68rmqk663UaKDZ1cR5XW0qnTI0I/Hp4uieZWE/rco+6wJ6IPI6tMw2r8CQy6eceHLBxxitEc/x8I9WvRIlyl50vxhx81MOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773133489; c=relaxed/simple;
	bh=+kAHaSHYN2WvgFj1QzL2IS3P1mtqhdTdw16GpsHrpSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UL8e985wnEDIMZC3oO9wFk7RintVoKA1GNID2BaMaF/Q/5hvj/aYqKuHdkSKOjpkV80HvSLDHQu6KTSLpPyDAJZTyNS1PCEwMzBxA2H9fXSafaZJwbTXBFXQSDPRFrya5y0Q3J7mi2PgEVZQQP6rH4USC3kUKjIorT7Jeddx58k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=cad1t05/; arc=fail smtp.client-ip=52.101.69.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IhU536QZyR8OYGuuqqf22e9hwWjYRjrNOqyRTrSRBX//3bLyLNSviB8S4ryVviHBwjUH5Rm8J+PQc69RGQHUGiBDQ3s2tQSEyPFTMLtWo30Dn1b9kJMfyYKjZj2iVrC4Z+9sqRjlCW9MsLDFTGFM/3s4d6/viBsSNF5P5nA5Kx/4nICmKFIVNe7WJ2QkrWuq8AiKGSjJBcDE409asZLvLVerB1CMNwk6GCCPt2RqOOMmzqENKmtgx3YkGiDk7HYU7NN6FjuyPr5u/10RjZvQFfz/GeGpb5gUrEjkcCJOmXFsp1FPnWzsR4Ow3H1w60o9bRXrvSYI19iEiXfyg9pjKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6Ir3ZmlqCSegwE/u/fefzVrVhxZRDNCd5imaYryl2c=;
 b=CkF/CBBB9a4XcpsCf5CDo2KXxJ5zCIcWejlYzSKi0KyUrsyBLxsug/8gXGmUKhfmuL8/NPMc5M2CxMYe5cWV+BxH3JPqfixSWQYMAXscd4TehdZD0NYRwYRjA/yQQ6A6xX4Ft0uc8woMaUjOIXAovO3YNZhBdIYNpTcGGdQspQZiJ0aWml4wFejjsW97BckyPsXniSSfMbFPmNHOdJ+T0mMRSx3KW9DjH4NZJPryVTVaNG/KLjfbY5uWDhrexs/pML9U9QaaPqA1qMGK6cDUqwjjFWDuW3ZnwSE9TxuOeLdJDmMxDn66VTExSOQsg6Gi4AX//fpZZEEfuh9PkXO5vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6Ir3ZmlqCSegwE/u/fefzVrVhxZRDNCd5imaYryl2c=;
 b=cad1t05/SzQlnWWK4wL4+ZsHYoCUNn+6UbhnY1J/rYwd85q1BjcPDFPZY7sh8RV7Vbpck/bVD18P5uX3A4OdC2ZXRpMxn2kb3An8yn8Sk5OC7w5NT7kIHp0sz98OWMBNiSVOvKkGhl2W1OMcqNktGXomA2Lo/YbM8yWcMaRjuo0uim7sAqBEDKtEAPOOPwDl5JuMASOw6S1nWAOLvHrTJM3C9zy6HTOjLlIzUg3P5B/Dz1l4JkGR+vR17uAfK8ENWtj9zVCPY97o9F7tjM61Ytc+IW0kfncwIVRodIS7d3qJz/e1bXAGfAkEhVSEp3Yzys6/adFxSwR0me/1Jud3+g==
Received: from DU6P191CA0036.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::23)
 by PAWPR10MB7269.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2ef::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Tue, 10 Mar
 2026 09:04:42 +0000
Received: from DB5PEPF00014B95.eurprd02.prod.outlook.com
 (2603:10a6:10:53f:cafe::8d) by DU6P191CA0036.outlook.office365.com
 (2603:10a6:10:53f::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 09:04:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B95.mail.protection.outlook.com (10.167.8.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 09:04:42 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Mar
 2026 10:07:09 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Mar
 2026 10:04:41 +0100
Message-ID: <53af5511-626e-4fe7-bc58-b80018a58647@foss.st.com>
Date: Tue, 10 Mar 2026 10:04:40 +0100
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B95:EE_|PAWPR10MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e9b29fc-104d-40ed-54eb-08de7e841136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	e2BJZ7mDai92sEvjzlxGN46Bjp0a+PHGqcoQPpq9ge35mF0Sro5CwDmyfUhn1VJfcU/d5XXb5IKF+IucB653kda6yFq6bkp1t28tgyKmTCG26PGL1/ZnNNQQhz1Ujqzw2lycSezfAwckXQkrpf4ykkzEng5R0lte+rPT9IDUl4jvOrXtsUd/otrymj1ia9M7QDELeWF8mraaxRZW9GkYTptpcLp0tovkG1z2jMzCcJxWeacuxU4JkA+RZcdBprLTWbwrf/U8NsCKgtEAbYaknD+eGu0nOFyxTIiZmG2yXvIzKC8mr3Jj2qjQiZHJ0fuJrJiyPl01FnrWMsXT6SLOdcsKr4UCh/NNgkiRdGjRUCA3o1Z1tt8gWmroc//UgzHPGOIl79uanKwRpmag4iCK1xzjiECiel3w/5tneEyhXvU65YIariJ5Vd86TrfHPeJFwJG1BZzkKFn58wVwUYs4DKc6ygkpUDgzcuCrkmrtssaAeXusJga26I+EowpzouyEki6wsErc4ymV2lfnTsJGNPb6x17upa7ETVZkoTuR1Ewrsbx2w4X/sbF+KR+6LMf66udo1tyx8ZGRIGD/q6QMR37O+Ugx/9gPiXHj0oPrptRMimiSxOyl+E29Yd78pewMdU2DFech2LjmVPP4mqaVbTKEeaj9CVDB7XebIgOGoUNJUV52hVSGfk13W8w9f2US/hjGuoHmqHXpDgP2zrQ4AtdC9TlRr6oFHQ9DYOCztx2BfJot2bmKpYZHm+77wSrjJOVoH136q6yuYE6B9vmx5Q==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	b3IFZtiQzBbxMI3RCWWW/L2YReorGGdiXy66Qlv0BG81LYcil5jrMxz87QqBslQTb9tdut4TQ2p4UH/563Ufv0+0hIIcqtEyg4c6fh6bAMgHF9jQPTc93vcKIfN4FomsuIPoFe1UweIhAOrS4XVLetgz+SumW/PaV09+WzWHD/QxZhVfmzP/3zz/NqI7kRIOFAqm9ZbeG4ug5NKGkUszCWZk+L6Xt86dVb/rsYnB0OyGmu9f68z6ryCWYcSdsQg7MyCJ61pb0yhKrwhYfw7hFmjfMf/lVk9KZnxvoqhLFxXIs2+0mjvT5mkT1spWT84GFNiNIof/rK7529RF7wnc9DI4v+S46sGb0EcTgcu8E5szk5JyUhMFJ2FCDkbJohMBhur/moiimL6idUVJUZ2ooWgN5BK8jZ1PZsiK2R03l/2ujpL6c9mKV335BJBqeLRW
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 09:04:42.1618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9b29fc-104d-40ed-54eb-08de7e841136
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7269
X-Rspamd-Queue-Id: 816F9248452
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
	TAGGED_FROM(0.00)[bounces-96560-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,huawei.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,foss.st.com:dkim,foss.st.com:mid];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[8]
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


Applied on stm32-next.

regards
Alex

> 
> Best regards,
> Krzysztof


