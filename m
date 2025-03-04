Return-Path: <linux-arm-msm+bounces-50214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC7DA4E659
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 17:41:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C0DF168BC0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 16:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 367E927C14C;
	Tue,  4 Mar 2025 16:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nYXfU+Cu";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nYXfU+Cu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2070.outbound.protection.outlook.com [40.107.20.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5832512C3;
	Tue,  4 Mar 2025 16:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.70
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741104682; cv=fail; b=CtY0gBKipTs3Pq+9UKqCdWgEGkbuC2+7ZjHz80HL2LJLe51nAAH7Kdgl7Z84ECqZdGNjHX/32hEYzkBE1oeoXVqnIxhcmh3E3QiMkuUr0aZ9lvWgQ2C4Pu/sKwxRtagqdj6pnDdBBe04hoZal8lDc/CzkbSD6RNcckcbAvygwiU=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741104682; c=relaxed/simple;
	bh=zlM8jh1lI6nPA/2/4WeCgA8q9W5f92pbj+kjXAtJQWY=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eqxKWGjXRMxY+aRVR/CnC6OK3V0D5mXl9XIlfYsZ+HivarStboWx+gq+/JXHe7mfdZNv62uVrgyTjJf5sVwdTYyZjF2lQLHh1Q4BeRsWxOsGmASOzuzROihcPlvDV5bo0/WGKFff2NQMS4bATogjl/JnyqUJh9otn9sOoUTwwQk=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nYXfU+Cu; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nYXfU+Cu; arc=fail smtp.client-ip=40.107.20.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mqLIXkVyoOstTfphxex7U6SS8COZ8nSG+pOJWo5h4v9Q4evyNh074Cm0M1OJ6oh4wU+wnROiIbjOhFvkY0h+BaE+3HPB42DSWW2shAiLq/RhWUAyGeG7l/bdB5T2cCY3VaOcu7Up/IZkdxIqNov3rjwZQE4QQY78nFgfQZhC5hfDEC3b93lFxFo2rkMuD0JzxXmRChLydvzfhOFz3vgaCsu7WG28z2bJ+BIoMdxdfg0HXFEK2SrW8Ef0TGHl+bf1++Wc3+l+vFLchKGttox0xeOeVLdpAGpab9VXmgCRrhKeF6ERjCdnb5fHH1BndtCB3iOnrdmqjJX29KcLSSMKbw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZHmSVz6uK2uMfG+roJHK1PyFmS0ZcFG/mtG50FhAWY=;
 b=rpgBCOEf5FQpXA9vySZxgiNscEcMpnWc7PfdhZhwFvgPO+IQQrBa2gkYMAydWMJc5ges52Z8JBi0/q/hSJ9yPO+BquAyP7J9dycSUqe9rgHCyLjN7P+tfNtBRZba1lJGmNYcE0FZ2kesnn1+HOnatwLPeYDlepZmGXiIZ3vJCurp13Nu5OzRhKt2Ll0HX13Wbrz8uQJ4RuPhYCr7Tt0kQbPOhhiSIG9Lbjmz7dyQCUaoywTd1mfO8fIPicHh5C3ByAon21ci5hD8W4l3xPrMbfM1GeQ6GehQyvDecF2XNjWtPvsKIMvtWAqs2Fm/gkk8Yi37M9devD/x2K7S0otXpA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZHmSVz6uK2uMfG+roJHK1PyFmS0ZcFG/mtG50FhAWY=;
 b=nYXfU+CuTLJEmoC5dby8zYmZ809Pfxj9aTrjbX6N9rndbErMMc0suPmvE3rtW6Gu2i3ya8Emg2gCoUWiKAJpsNKV3LfrgopbJLLfD+U7UqNGg1UBBfUcPbvOsp3QnaMkdvKUadux4e9QqGbIxgZgRgvjxvmyBPGLZursKIQnmb0=
Received: from AM0PR01CA0175.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::44) by GV2PR08MB8653.eurprd08.prod.outlook.com
 (2603:10a6:150:b9::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 16:11:10 +0000
Received: from AM4PEPF00027A6C.eurprd04.prod.outlook.com
 (2603:10a6:208:aa:cafe::67) by AM0PR01CA0175.outlook.office365.com
 (2603:10a6:208:aa::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.21 via Frontend Transport; Tue,
 4 Mar 2025 16:11:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A6C.mail.protection.outlook.com (10.167.16.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Tue, 4 Mar 2025 16:11:10 +0000
Received: ("Tessian outbound 0a056dca8bdd:v585"); Tue, 04 Mar 2025 16:11:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ab2c3f558ed2b790
X-TessianGatewayMetadata: ZM1owvzes7hdsnGp3gAbWUwVEiC5DxCzzQcxxNNNG4R1ZUJSa+0udjexHLjlWbWlR0R1fhBgQyeS3STYMpV2iJ/EOJb7Rw9qaDqRRBdStut5bfY/OkzhbGJ7sPNr6UWHEmWdcKUHxQlYelUJH9Gffglrie16SXqUFQhlclKq5E0=
X-CR-MTA-TID: 64aa7808
Received: from Lcee1ae4d5ef6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E282C6D3-AF08-4B01-989A-80132F211615.1;
	Tue, 04 Mar 2025 16:11:02 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lcee1ae4d5ef6.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 04 Mar 2025 16:11:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=shtb1ZGgkHCCVQUB8fl7k0R8uwjmJEMTDnym2AYaIEMgnkxOpZmkUMpNVO2tcZ8cmM74w8BH6VE6ASmeBpLiefT4E2VpV7lR6aQNtHm6gMgpoWvmREmAe3Lv440JmBmTf3ff5P8dHSj+qiYphregJ9aD/CGEidljo9XxC9NSDjW0YbHkcYj1ZVeKl29L/tycf5yAKvjs9mqvcuwiRGQvupGGos6tDXMcNdFUn5WJ2+cYuoCZk2PgWbj3tRy4YU1YKvjBPQ23uRSeb4/ackZ8/a4vUVL+NlYlNmjkZyPR3COJCKi84mnTU2rqujKy+0aI3sLEsUwSDATwqgxTPQmxLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZHmSVz6uK2uMfG+roJHK1PyFmS0ZcFG/mtG50FhAWY=;
 b=K0uA/rNaHp9WYSoJyDpMuIWvY4WRXtC1dN2PEQATFDd3aNFV1iTcXIHN/phgF3TH/8rKdPbZCNL7fZoQyslQgZezO0Xtu9FhMNIfjkQaxhnmPagKv/jCWigfLnkL9NlAT1cmgxg8I0vymGV6s7m/znJqZkm3d2CDV8aXIg2FMDj3oXHAI9QUEOsLsaQ2pRKMnGuDNYAvsMTKEfBZt9M1ICzYi71cOnfsChBwl+ZxvGZ3DpWpBZTG+tGoXO6D2JZ/jhMI7I1qgRBhDdOECSj9myPf+G09Rt66ys4aQw/cbu0UdvUn/f9VZGIAukr+8C1WNAZYY55iK71c/9Uo19oaDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZHmSVz6uK2uMfG+roJHK1PyFmS0ZcFG/mtG50FhAWY=;
 b=nYXfU+CuTLJEmoC5dby8zYmZ809Pfxj9aTrjbX6N9rndbErMMc0suPmvE3rtW6Gu2i3ya8Emg2gCoUWiKAJpsNKV3LfrgopbJLLfD+U7UqNGg1UBBfUcPbvOsp3QnaMkdvKUadux4e9QqGbIxgZgRgvjxvmyBPGLZursKIQnmb0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GVXPR08MB7727.eurprd08.prod.outlook.com (2603:10a6:150:6b::6)
 by VI0PR08MB11061.eurprd08.prod.outlook.com (2603:10a6:800:257::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Tue, 4 Mar
 2025 16:11:00 +0000
Received: from GVXPR08MB7727.eurprd08.prod.outlook.com
 ([fe80::9672:63f7:61b8:5469]) by GVXPR08MB7727.eurprd08.prod.outlook.com
 ([fe80::9672:63f7:61b8:5469%7]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 16:11:00 +0000
Message-ID: <4e0959e7-cb66-41f1-b686-a274b6cbfd2e@arm.com>
Date: Tue, 4 Mar 2025 16:10:58 +0000
User-Agent: Mozilla Thunderbird
From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v15 04/10] Coresight: Introduce a new struct
 coresight_path
To: Jie Gan <quic_jiegan@quicinc.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
 <20250303032931.2500935-5-quic_jiegan@quicinc.com>
Content-Language: en-GB
In-Reply-To: <20250303032931.2500935-5-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0065.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::19) To GVXPR08MB7727.eurprd08.prod.outlook.com
 (2603:10a6:150:6b::6)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GVXPR08MB7727:EE_|VI0PR08MB11061:EE_|AM4PEPF00027A6C:EE_|GV2PR08MB8653:EE_
X-MS-Office365-Filtering-Correlation-Id: 2957acef-7bb5-46da-9e8b-08dd5b372db1
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|7053199007|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?aVFGbURoV2RjODI4a0hra2NIRFFheUE2NFlOS082TUxrdzhPMFJUMFJXRTdn?=
 =?utf-8?B?WVhpZTlPZVVKazdaUTRZc2d1dnZvOERPQ1A0YnZwWklYdjVZVjlqOTd3UGUv?=
 =?utf-8?B?L24rakQyR2l4c2lvdVMrNEdmOFFuZE9TV2tKNm5SWmVVUG8vTlVLMFAwZGx6?=
 =?utf-8?B?UDlVNzYrQk5WRVhEek4vdlRMS0hQcEV4ZUs2UDM0NGw4M013NUU3c3ExVTV5?=
 =?utf-8?B?ZE90ZjFXcllUcU8wTE9vT0hpQ3lRMTBRWm8yUVFFQS9SZDJYUEhjYURFMjk4?=
 =?utf-8?B?b3phWFZ5bEFSTXVUMkFZYVJuWkZnbmtrUkY0TEdoZTFZYjMrNXoxWlNNZ1lO?=
 =?utf-8?B?YVJKT0ZuMWlIRWRBem93SFAxZGppc0VEVDdnbHo5SkFNZ2QwdVk4N2hwYTVP?=
 =?utf-8?B?SEpJUTgxakZLVUFJY0thaU1RYlhiSVRQa1llRmRmTlFUMDMvVFNZV2lzaHdt?=
 =?utf-8?B?c2E3QUtsb1lpMGZrU1ZLOVlqNlVjRHNWZlZDQ0pYTG51K1Z0R0xNT0ZobnFv?=
 =?utf-8?B?cTNaVXRnUjRCVm5iT3E0WnlObDc4WEluem5rZ0IrdTc0bnJ0Y2twMU5HTXFB?=
 =?utf-8?B?dFR1NVJqanB0b2htNFBka3NSeENQZ1FBWFY3SzJkUktMRk5DTVY3UXJXSlQv?=
 =?utf-8?B?bnI2YmZxdWk1R2dKdFhCRWwxTUdsa3FWcW5pVGkveWtFWUZDclg0Q3MxV01y?=
 =?utf-8?B?VnNhMWxRc1Y2cGJydzNmQmQ0RUFTMXVxZGlrcnhQZFQ4MG5US2FKV0tKV2FY?=
 =?utf-8?B?b0RJWnhZWmtHK2h6SThncVVGNVhlbG9tbDRvL0FSWjJpVTFtR3ZlNCtDZFFk?=
 =?utf-8?B?dzR6R1N0eGc3NHNVczdwMmtpN1VKaHlNVGMwcEVhK1U5aEZtTitELzNZY01G?=
 =?utf-8?B?TnRFS3ZLZjAzTEVvaTdxVVRVWHRnR0lDc0pUM2NiZTgyRzJpTDhzTGZOaTEy?=
 =?utf-8?B?RHhqZ3NoeG5YU3JETWVSaWxrdmNzVHFWNDBCMFNjdzJGb0tOdjkxam0rVWhR?=
 =?utf-8?B?OWRZcEhpU2xhR3JzbWhTUXdKMHk1MndKbTV1TkJBYzBIZ3NaV0JFVU91SlpN?=
 =?utf-8?B?dTQyNTczcTNGUnE3UVJ2cU5hMHVLMlpQdmZDWm5FV2ZqNFF5a3R5bVNWSGlD?=
 =?utf-8?B?dDBUcGxmSUNBdUl3RWdKYXhFTnJIc1JlWHh3bGZoc0ZweS81UG5FTDZWdDVN?=
 =?utf-8?B?SlBpZFcydEgzRm5iVzlkUWVKU0U5T1M2YStLWjZnQ3FMR3E3b3R4bGZrQnQ1?=
 =?utf-8?B?d1JVTk14YTA3eGU1OWpvV2xkVWQ5WnR0Q3lHTWoxcTlodUNNdnljcjJaOUJK?=
 =?utf-8?B?bU8xcm95NE8rMk1JS3ljT1dubmZScHFXall0Z25HZ2lJdUpsQXI2dGVTQlRO?=
 =?utf-8?B?NEgzQzh1bEVOMHhoRVJkOHNkS3hKK1FxQVJVTUZETXpEWXAvdDB6VTFYeHJr?=
 =?utf-8?B?Z0ZSek5ueTVWK0VBV3QwN0lwTVFmVmdDTUdONVRuTWtQQmFCR2RrYXcrRW5i?=
 =?utf-8?B?dnRzV1JJZ0l2czdXUTV4eFdNWmtNeGlnTFFWanlqZTcrL3U4S2RXc0tsbWkx?=
 =?utf-8?B?K0QvRWpTemVvdVQ0SWlUOEtRUFBlUmZoeUdoT05JZHBWQ1VqSk1tb2hwcTY1?=
 =?utf-8?B?VUNRbXBlR0xkcnBORHlESkdLRG9pWTNZZC9UQS9RNlVBaTNUdkh6RTZ3VVQr?=
 =?utf-8?B?amRsSkZIZ3UwZGg5bmY1MUJsNVRUcDhsQTg3dW5hWlNBRUk1YndseExscG55?=
 =?utf-8?B?SllBYzd0cVBnZTh1WmUrNEVWZlFFN2F5Z3Z4YWI1NDRFTEEvcnJDVzB6NGZ0?=
 =?utf-8?B?RU1LMXMwdVdReTdrMEVOVitzejFlTmFWV3V3UTZZQ0xzRVZTN1VUSE95TUZE?=
 =?utf-8?B?ekpKaEdnZDdkYWx5bkdmNTl2bUtQamNRVFZuaFB6bDBRdE1pZGV4MEw3cE1R?=
 =?utf-8?Q?8b/bhDw2LIo=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR08MB7727.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11061
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:150:6b::6];domain=GVXPR08MB7727.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d796dd75-28b9-4788-a101-08dd5b37279a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|14060799003|36860700013|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y2JpMG5aeEcxNTZNNStNQ2hvWVhIVlNDeGkvWVkxZmZEZDFBWWhVQ0JRMGtD?=
 =?utf-8?B?YXpUSlRNVU5SYm5pVi9FSURqZXhUUnhUa3NaZG1Ec2p1ajYyeVZUSFJla1Zy?=
 =?utf-8?B?VVErV1RrRG9CUUZDNmVVKzBudThkK1BmNUt5eFFqclY2OUdiNGlPTk5KT2NH?=
 =?utf-8?B?ZkxEekZrdEFLNUpHb0NhOGxzcTlad0NDbUpENExqR1lER1VhWEZyQnNZMTh4?=
 =?utf-8?B?dGdtSFRJYmx6U281WFdXaEtmYVJJMzdablhEdk44aVQ4cDJBU20wY2o0Uklu?=
 =?utf-8?B?bmJaVWhUUjJuZnJadWR1Q0ErRExSTW5maTFyK25sYnlUL3ZYcU9MbFJGSE9G?=
 =?utf-8?B?c2wrcHVLK0IvdnBqMzlxeTJTaWptbEJPYlpoSHVOdGw2dm1LWDc3NDlwOWph?=
 =?utf-8?B?cG51bmF0djRxaWIyUW9YLytoSFpUTWhpOHpvVXhabE0rSlhUREE2RzJCNnlH?=
 =?utf-8?B?UHVmbGc4QVFXa0doRXlndm9zVEJnNlVYU1dmaVR5SWlnV09LVDFORkhlZlZK?=
 =?utf-8?B?OHFhZW5ibE5DOUJRbDBIT2ViSUxWTUdDby9GU0JEUyttUTVTVEMwRVN5cW42?=
 =?utf-8?B?RnpRZnAxU25ZRmRuRUZvQ1pBM0ZRd1ZqNGZkbFVTUkY0OExxZW1kYmpzU0Rr?=
 =?utf-8?B?dEhET1BkQksyWFo2TkpZRG5FeTF5ZVBKTkJ6RFVrV3IwT1Q3RU9EZStyT29v?=
 =?utf-8?B?WDEycUc3Rit5VjA2cXBRVndCNUlsTFRpY0ZpaVUwUTQ3VWR5WExaRVpDV3No?=
 =?utf-8?B?eTlwMWMxenJYUWFJVzJFbXVlNXl4SU1NbDI5Tk4wVG9SQnpKRm9RK2wyOGxk?=
 =?utf-8?B?aU9qT3dJSGRSVW8rM1VjMUpOOTcydFpLZE01WGJISG90UG1GS2d3M3RTWEVH?=
 =?utf-8?B?aHNYelhaR1BRWjNVNDE1MU9xeGIrbXRiZ3NCYUIzMmhUQ3hEODkyb1R3Wk0r?=
 =?utf-8?B?U3RtRC9HaEZuRlJZWWFYRUZFKzFQM1FsdnNNeUs3YXhhQ1NYNzYzclZCbmJG?=
 =?utf-8?B?MFUwRFhmQS9xMFNRQXNnZWxxM3ZmNjd2OE45YkRwMXp1cHpWWStkYzFWaXlH?=
 =?utf-8?B?YS9rZlAyS0dpa0xwc3g4RnJVOE1Va1JSNjBSZ3RETGdxWTRQZk9MREFNZEll?=
 =?utf-8?B?bzliTzdNUy9BZTFEL0F1TkhOYmE5c0FwRndrR0tDT2dwS1ZENzdncUg4dnNr?=
 =?utf-8?B?U041azRTdlNqWXkzNkJZVnpXTWpiYVp2bUF4VHptZnF0T25QWXdsMGFpdW4v?=
 =?utf-8?B?L0NNakZlbmVzcjlXTllBSUVyUk1LU1JJTWdTTTF2MFY0R3YwL0RMSG9oMjlU?=
 =?utf-8?B?cTdReGtGWldUQ0FZMndZdGFCUGpEMDE3aWpZMG5rNGJqUDUvNkRtT0VxdndW?=
 =?utf-8?B?QmJnQUJlSmpTYVNPLzFTNHBRZVpBWFBrZ2NMR2xtdnF6ZkdiMFFtMGRpSlZR?=
 =?utf-8?B?c0JvTWNLT3BzWEFEbFA4Q2ZYOWs4ZGpvTksrS2JzRWh0TGJQNmFFOHJLdmVw?=
 =?utf-8?B?ejBIV3FRbS9RdVhQOUt4dDVqeDJMcittaUtwQy9GM3FsdFJvUzBsQVNhQjE3?=
 =?utf-8?B?MjRZUTRhcVNMaFZOaXhHaFI0NHVLeDQ0aDc5ZnZiVUFLYmRjYlJNWGVrWUJh?=
 =?utf-8?B?ckZLRXJEUFNRNWxIMUgyY2U0SjFMY0l4a05ldG5UR1BIeUN4N0VPMlVmZWR3?=
 =?utf-8?B?Uk9xU2dqbC8rYytrcHlTeDNUc1ZZYWJaaGdleFRSYmFTc3dqd2Nvai9FQ0NS?=
 =?utf-8?B?WFpqSlhiM1AzQzh1eWJkUDA0MHE2YURib3l0SGFNNUhudkZVTW5PVzFIOFlE?=
 =?utf-8?B?WCtTRkgydlJYTE11VTJqVkt6TTl3S2VxL1J5aW1lMGpQeElvcHZhaEVqMWtM?=
 =?utf-8?B?NHBrc3pDSTZUMVd6bmhKNjhTV3NmdFRMOHBwbVVYekRVNlUwUyt5RUd0aGpV?=
 =?utf-8?B?ai9nSEdGZ1ZzSGlGZ0hCSjlvSkViRkJSSnJlV2txRlErY0xVS2dNWHRmL1ly?=
 =?utf-8?B?N21xTTZIOEx2bGU5d2xtU0J5NXdwRXhkckJUenhXOWgxU05yaEJiU2llL1Uw?=
 =?utf-8?Q?j0VcY6?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(36860700013)(1800799024)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 16:11:10.3641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2957acef-7bb5-46da-9e8b-08dd5b372db1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8653

On 03/03/2025 03:29, Jie Gan wrote:
> Introduce a new strcuture, 'struct coresight_path', to store the data that
> utilized by the devices in the path. The coresight_path will be built/released
> by coresight_build_path/coresight_release_path functions.
> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c  | 16 +++++-----
>   .../hwtracing/coresight/coresight-etm-perf.c  | 30 ++++++++++---------
>   .../hwtracing/coresight/coresight-etm-perf.h  |  2 +-
>   drivers/hwtracing/coresight/coresight-priv.h  |  6 ++--
>   drivers/hwtracing/coresight/coresight-sysfs.c | 12 ++++----
>   include/linux/coresight.h                     | 10 +++++++
>   6 files changed, 44 insertions(+), 32 deletions(-)
> 

...

> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index ce9a5e71b261..67cf8bdbe5c0 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -329,6 +329,16 @@ static struct coresight_dev_list (var) = {				\
>   
>   #define to_coresight_device(d) container_of(d, struct coresight_device, dev)
>   
> +/**
> + * struct coresight_path - data needed by enable/disable path
> + * @path:              path from source to sink.

This doesn't match the actual variable below.

> + * @trace_id:          trace_id of the whole path.
> + */
> +struct coresight_path {
> +	struct list_head	path_list;
> +	u8			trace_id;
> +};
> +
>   enum cs_mode {
>   	CS_MODE_DISABLED,
>   	CS_MODE_SYSFS,

Suzuki

