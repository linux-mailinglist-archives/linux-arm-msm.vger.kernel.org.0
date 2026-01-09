Return-Path: <linux-arm-msm+bounces-88253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA89D0896C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 11:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5EEB630022C1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 10:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DDA5338F40;
	Fri,  9 Jan 2026 10:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ZUHQmx1G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0CC338591;
	Fri,  9 Jan 2026 10:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767954867; cv=fail; b=fgEtUyI3vMpjMunWpt/oz3cPYzAYmOXyZWTsiD6yi2ejiAa3edXFS8r0y5OTUR31fsBlZhBv71Qw0fV//iI3zFWNqcp55+XB8xr3I1EfoMr//yD5UFxOLBL4NbMYH30SkVebKmnu1ovTD4scJADNA5QohbLwpbo3gQgIN4IAeRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767954867; c=relaxed/simple;
	bh=N6KbfJrerio4Q+i1S//6KqoUSq/5OBvZn/+0LD1CHMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EYU45PidDQcnmaSEAp9ItZ7QnAtuxHU7OLbTs6XKazRZy8/E44qTaBhM5D/u7DD6UYRTctchdQg8HnkE7A0x4zaL80+d7SzXKuVMWH8+jl5HSDuYn11ZQ+gKGToOwxyE27B6vfXGEHkTlhYF5QApQ8Q0UBqIv1FnUY+UmMhZR0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ZUHQmx1G; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609ANfKw4146875;
	Fri, 9 Jan 2026 11:34:08 +0100
Received: from osppr02cu001.outbound.protection.outlook.com (mail-norwayeastazon11013058.outbound.protection.outlook.com [40.107.159.58])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bjv221084-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 11:34:08 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3ZlmZY6SHAc3QEh+f8B5NR90CsGRhUcFdRGNPwSPUDxuhJ4HrgKH6GnLiUSBEq2EqGQwf/qxI35sP+oNrS0jT1lQNYWjpaBJKJvZXjt0pKhkivCBhR4yYXGHOYAiG/71FC+wD/WVVtF/dkpJtqpDLoVAmbjIv1i1sKLGxmMSlfvpcNdbYMYSaFvyiFvSxAklXKnOwHKcb/1GFLYEigZP2XiNs3s6mr1fTNJatl/tIJdBHyoRpTrhTDTchI+6ROc0CX+2ib3dO/kaBgxDN3wVoh9oWdenfmobcU2k0cQxtNKPldLFhAvjxQgrZMo+GJJgSsMeh+FmeKZ6jDUcIlQnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9TZZ7zcfmO/d5UhjpjnqONtJL89XW8e59CGHoi59fI=;
 b=GOFZD2VNK/+EwBs7uf7KubOR9EhL6Y/Jq6KX46LDFFkJvC5H6LGp6gau8s4bl+IS6r8yZ4vCtEd78BI13vkDNW0sGaBQbnXVy8xysCzQR5iLIwRMJUqqnxiWtp1JHTf69XGlk1yNWkcDi0dD47Swrg9oa7R8Y0yHWwk8V9Vr1v1YLUY6U1YF28gMrJ5dcXGW+cvyAnDPCoP8QwM9f+byWV48eHzAtWKejF3vQAxo5UFCaSebG3uL3v5as2giZVaypx8c+SNYsRThrjdNDYIRFq4lkxCwi5HM4hi1LRwdiuO6lh/sgTAioqCDoEol1G/m+mGzjq2NEE8Llvh48lRCBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9TZZ7zcfmO/d5UhjpjnqONtJL89XW8e59CGHoi59fI=;
 b=ZUHQmx1GkAyAL1vQr1M/l6Ae5op7m6aAHFVTiTCVVuTpjzA7+uhTLztYJzW+ZAV2oS5LEL1o+pwBWyiGweh74oxJiqXHxCT7KoFS3yAu92awn1jYpwuDp8UoBqrvXqVnsm8REO3i7npOZMvfcHGuWzWDrS+q8HUyLOcJyPIOdlUhPfBjyMdHHZUwIXQn4mw0lFbKHaxZb+ZfwgnPb2flLFXtIv2v//1lVOWQxt6op40jS71C0b6DfUT+BlWK9JplN2xF7Sjprm6aIoSTSF/TptO5jki8LNGCErYTYL4VZXunOeGeyk8hrmpwVuJLs2UfIGPiJtVLkXP2OIF3bAjFyA==
Received: from DUZPR01CA0081.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::6) by PRAPR10MB5346.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:298::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 10:34:01 +0000
Received: from DB1PEPF00039231.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::f2) by DUZPR01CA0081.outlook.office365.com
 (2603:10a6:10:46a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 10:34:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF00039231.mail.protection.outlook.com (10.167.8.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 10:34:00 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 9 Jan
 2026 11:35:14 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 11:33:58 +0100
Message-ID: <2405bd00-e10b-4369-9819-c6782c4f9708@foss.st.com>
Date: Fri, 9 Jan 2026 11:33:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] bus: stm32_firewall: Simplify with scoped for each
 OF child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260105143657.383621-5-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20260105143657.383621-5-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00039231:EE_|PRAPR10MB5346:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b3e887a-27fb-4be6-d10b-08de4f6a9a56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aHRuQy9CU3hHU25CUWRTRTdGWDAzbU42Y2RnSmc4QmV0UUxmRkorTWVyaEZl?=
 =?utf-8?B?Zi91T3c5NUtRbVIxZVNTdXJIMFhoOE0yOXpRN1k5WHVTZndZZ2VWc0N6NE1B?=
 =?utf-8?B?dVZXNFV4VEt2NlEzZm4wU3lHNmdkM2JQTTVoZFVCWXFtRUozZ0Q3anFYVStC?=
 =?utf-8?B?dnVkMUQzZzFUR3NwZ0tkNHRYWUdQcy90RXhWaUhrMFBBZXlOa2cxbWl6aW5E?=
 =?utf-8?B?RTRMMERCOVM4T3VuRDRib00zQ0pRbGNwZmliYmJMRy8raGNmMmJ2dVV4Sm90?=
 =?utf-8?B?cStxRk81K0F1aVhmZS9vamd0U1QrWjlVQzAwTUVKb1ZWeUtuWTNTOXhmMCtK?=
 =?utf-8?B?dHZZNXg4aGFzYXZXUUZNbU9oTWRKaGJIWlZLeEt4RDdMUldXckttWEx6MVZv?=
 =?utf-8?B?RkhIYS9YY0VET1JlWjFIRHV3bzFhODJ5Y0ZjeThHaTFOc2JRY2lTYy9YRmR2?=
 =?utf-8?B?TmJBdGtBMnhmTWVNdVFUaTlxTzhzdW05NDJTdm0vOGNYYi9LMkxPR2dZaDkv?=
 =?utf-8?B?czU2NytvZ1lGTnQ5Y1dnR1NYdHZHZXlycDVSOUpTUG4yeG15bXFmc1o5dThl?=
 =?utf-8?B?aTB2djhhM2w0M2s5ZzFJaEJ6dUdGMWl3QytwSmozL1ozazhLRkFrcUFhR24z?=
 =?utf-8?B?Z2RFdnNkNWxRT29MYXZwSEhkSXpSY3NBK2ltNjlMOVdCYXdEUXBERmR5NUdL?=
 =?utf-8?B?OFNJU3h4ZXpYMVRMYjMrN0ZFZEJyc1JGa1FZa1hJcDh5VTV3V3pqMVZOZytX?=
 =?utf-8?B?akJqbUMzVmNzUnhSZzJVck8xbFRvTUdmTFJNWFdIUUlubnVoYmZ6RmNjblJh?=
 =?utf-8?B?QkJQZ2RXK21oa3lWcGVDU3grWXVXRWJhMkhQL0t0aUFVdENqSFhscDQzRWJU?=
 =?utf-8?B?cmRiQmErYS9ZdjZpSlduRS9MN0hFWUVaNXkyY2tiemZPeE56bjU1dGU3aERW?=
 =?utf-8?B?Rzc1Y3Z3elREMkJzTmRWZWVaczdLNjVjeVBVZXQzQ0c1TjZTemVZblZIYnRX?=
 =?utf-8?B?TDFsZ1lCUzYyZ3UwOVBBeFJReXFnS0FjUDg3SjlPdEhpRnNBWDdzZ1A2VTA3?=
 =?utf-8?B?K0dKS0ludlRoNlZhdzVOT0lLRWdPdjVWOTF1UnNad3Vld2hQNElydy9JUWhv?=
 =?utf-8?B?Qk84Q1VBYUpKTFdKTStlK0NBN01rMStPMFFFWU01ZnM0Y25vYUV6aWYxaFFY?=
 =?utf-8?B?ZWMrZThNMjZUVlFFR09tOUVCWEdHd0lGM0JROHNrbk5Kc1F4eEJ6M1hMSFVa?=
 =?utf-8?B?QUwzTnlnU3NRTmxYTDh3REVZVEMxeGx3MWtmWXYyQmJod1U4K0RabFRHcVZx?=
 =?utf-8?B?MHI4MzdkRGM5Z3NtV2xYZnFsd1VNZkJ5VmxqOWFFTHlycGdnRWwvVGRQNXdG?=
 =?utf-8?B?b0Y2bll2dzBiN0c3TDR6dGJVQWZXTG9sdkY5ZXlkc3MzZEFzdjc2YnV1OUpV?=
 =?utf-8?B?bDVUdW9xQmZzOTNXbklRdkg3RFhXeUN0UGNvaUprL3Z0dGhKS2pmdWJsVlVG?=
 =?utf-8?B?bXhtL3pCWE9rcUV4eXhQVFRhRHVEVjRsNFg3S1hrdCtZbDRBSUR2VDZ0ODR5?=
 =?utf-8?B?ZjJpMUtvNDNTYzZEZ1ExRkphNHVvYVdOT2toRWRrc0I4dkc1WjFJeWplV29o?=
 =?utf-8?B?RjUxT3FwRDJaUW9ZbXhTeXdxOHF0eTcydU9ONnhGZzhnMldHOEhxUThSamhk?=
 =?utf-8?B?T1paOEwzZFZDRTQ1Qk1xRG04N2g4WWU0Q2ZsSmlWd1UraHdyVTZ0ZVU3TldO?=
 =?utf-8?B?dWJoZmFPNWh0aFdkcVF1UGY3TnlucDZMZGpTWGhWSTJWZVM0eW9uZEtRamgy?=
 =?utf-8?B?YjBHcnkyR3lickFLbVBBaDlyWS9RQ3hCeXl1aGVHZHQraWZaUkJpSURybDIr?=
 =?utf-8?B?c2FKTFlnYXRBQ0VFa3U5TEh5VXhSZUVSK0JRV1d0dHVVcjJFR1lIL3paL1Nw?=
 =?utf-8?B?SVN2bFdlVVdJZjlqcmhPYjI2VkU4a1BiSFBvRVhHYWhYbCtZQ2ppZ1ord05J?=
 =?utf-8?B?M2ZvTk1qQ2szLzY4OUdoVHBDOW1NVlF5ZkJ3aFo2SW5xR21pQThKRWhGZXZW?=
 =?utf-8?B?TUh6Q0lCcDcxemtkeElBUWhOb1VURmNBbGhlMXl6MGVGeC9EUEdISk4wTGF3?=
 =?utf-8?Q?cdDM=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 10:34:00.6492
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b3e887a-27fb-4be6-d10b-08de4f6a9a56
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5346
X-Proofpoint-ORIG-GUID: SddfUiug6GSDph-cKs-pKBwDbrttyA68
X-Authority-Analysis: v=2.4 cv=d4f4CBjE c=1 sm=1 tr=0 ts=6960d9a0 cx=c_pps
 a=EPyYIxXEWdv0MJe+YDDwbA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=EUspDBNiAAAA:8
 a=5XefeSV3Cr01StwfD0AA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: SddfUiug6GSDph-cKs-pKBwDbrttyA68
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA3NiBTYWx0ZWRfXyErlHxI7emSn
 aGAm4zkO8b84rPXMgd2flY6TP5ZpxS9Y4w1qrwSTYwkqCTkyc53ywfrP9hxOI2SvtPz54iy/oBW
 bhXzi4JraAm3pF1aHO30Awk7+qp+jkG55CWTv8GKF5N4OT3EyGD2rkuQg/BwVs/2ulLMa09XiKS
 473KZbRFJCcHhUft2xnKCWZtTLAgZ6VQ+qdjCQShBnh2xFnuHC7p85Br590nuvyvbRY0/e5QE5J
 DzX8N6q1EVrKWzMtlx9otSi8iWCEtkQyJyCCv6MJkxfotcz1xWlVF21Kv3HEGbjx72/sWqboczi
 49IFH1dEpoXqQUcKaLNgRicXWk8NI0BpQdbWSug7ed9Mmfjl+dzr1GXyfFhbd9Ey/JGCpfgZkPg
 3zy3YeAl7c8Cto4T/Jy/4Z1QiYNwGF4DK/ZJHBt153sbUWFr4jDOwD63fzLv7ii20fqRy8KhJaj
 5K6DbmwoLTU78S/etaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090076

Hello,

Tested on stm32mp135f-dk, so:

Tested-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

Thank you

On 1/5/26 15:36, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Add Rb tag
> ---
>   drivers/bus/stm32_firewall.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
> index 2fc9761dadec..fae881cea9a0 100644
> --- a/drivers/bus/stm32_firewall.c
> +++ b/drivers/bus/stm32_firewall.c
> @@ -241,7 +241,6 @@ EXPORT_SYMBOL_GPL(stm32_firewall_controller_unregister);
>   int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_controller)
>   {
>   	struct stm32_firewall *firewalls;
> -	struct device_node *child;
>   	struct device *parent;
>   	unsigned int i;
>   	int len;
> @@ -251,25 +250,20 @@ int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_contr
>   
>   	dev_dbg(parent, "Populating %s system bus\n", dev_name(firewall_controller->dev));
>   
> -	for_each_available_child_of_node(dev_of_node(parent), child) {
> +	for_each_available_child_of_node_scoped(dev_of_node(parent), child) {
>   		/* The access-controllers property is mandatory for firewall bus devices */
>   		len = of_count_phandle_with_args(child, "access-controllers",
>   						 "#access-controller-cells");
> -		if (len <= 0) {
> -			of_node_put(child);
> +		if (len <= 0)
>   			return -EINVAL;
> -		}
>   
>   		firewalls = kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
> -		if (!firewalls) {
> -			of_node_put(child);
> +		if (!firewalls)
>   			return -ENOMEM;
> -		}
>   
>   		err = stm32_firewall_get_firewall(child, firewalls, (unsigned int)len);
>   		if (err) {
>   			kfree(firewalls);
> -			of_node_put(child);
>   			return err;
>   		}
>   


