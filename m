Return-Path: <linux-arm-msm+bounces-118080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aKGzNUvoT2pMqAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 20:28:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BD3734458
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 20:28:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=F4F927Ss;
	dmarc=pass (policy=none) header.from=outlook.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118080-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118080-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40304300D95F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 18:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06354DC542;
	Thu,  9 Jul 2026 18:26:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazolkn19011031.outbound.protection.outlook.com [52.103.13.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876904DC520;
	Thu,  9 Jul 2026 18:26:10 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783621571; cv=fail; b=fxf+i/HeOIN7y2fWinYVdcDSrbNpvprhkrkZwheeT+tr3W2hGCedLhgcbusmxgUFZMKGHuUgXWLR6h8w5kSNh9c4+wrYq/L7KmydQSP6gfGiylMstM79TfAgs+KhppiRyEK0Wurwg9FN8UZmUGrVA95IZQeHEqjrbpg2RGgzXEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783621571; c=relaxed/simple;
	bh=iAWZf1CrHD6FdVGigUMCW9v0zlpMv1kawJMRvfsQ8FQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HK1yrXdx7UJjwE/93sxU5Jvj93KAHZFhpJpokTU+L9ER99/ydFQKoDCJrob5iYgbU9pi/nXgR6JU0EMCy45qSGe1+K8e2uPpyyKGaBn+LGOjk6EWJx0QxA15CgT8qxxBXMBX4tlWmhKn7Bv0yNpBbh2AWjlhoThZALGsbpU07zg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=F4F927Ss; arc=fail smtp.client-ip=52.103.13.31
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CV5Hk90Q7R1AiwCWLLIGyMQsigp/r/OJ2dKrVy0YGgpeb8WSEz8lWgru1XBb/EofyIkKYhHbERyyAi6b9fvRrHw49SkTpIOl+l+U9RuDBc+5xqWWbs03SF15BDR4gTfx8ynkN/Sou4WhkjlKhjMNuXkkWL2pXn6BqUSJOMkj/JSWFgOpIieucY6Ihldss8fvyEy2RhC9//pNF/abUT/1crIb01sTPwdHTIStQkZwV0jrhTPD1rSSW4yZ8z3SzhhlzCDj/dq+nE65tv6W9onWzwHXGjbO/tWSL3qitZjFhXNxH8a1pF+DZ/jIHnEeEpzQSMGPs7M9UR2OfV2feZPe5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkfIGPgX8rvykWraBbXaVAh1FxSp9zEZh/wRfYUg69Y=;
 b=huLtf829EKXAeA9lEMpE1HWXQf55sgWI6NvE5DE4v5xnFraU+or4mdYyRofSNKs8sfUrH+x9Wz6nPKWlZLj+rIuTGuDLc6tTXRxJbBo8OitvxkcD1G5lZXGWmZ34SLBZlZGSl+/SNm44oSVXlknRyeSbr/Ncx4C8+PqOb06ZkfE7DYen9JigV3qd5SZLlczRnLeZG6nurM1t/l/L1eo4ig1MTI/UyWJqZn6p0LgE7TKHGK7MichyPgzXIW+llRY4XeInDfbgz7tj8ElyRqpKFS2Ec0q9zFIzTP+7hd6FLHbDDrhWI0ctE1jJA0D6TciH+te2ud85oMRV/WuKlUtD3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkfIGPgX8rvykWraBbXaVAh1FxSp9zEZh/wRfYUg69Y=;
 b=F4F927SsexDf554ODaMPns/8xPXptQsrWeulVp4kUWSSpVVoVtFnTYhKPocIJ6MrBFLsWwW5E3w4pAnnwoB+Ta3o3OM3aId/gCQWaTD1IcVnXT5quzLmiMlPQx6C9x6OhHF9E/B7aWCyEuxL9vWXZSP720xs8kudbWwoA32pDzrkFatZuyrvmMhn4XXeBf0F2nqNZpOZ7Rbzqh4a8yZetds8E2JaPRUHivgHC+oJcJssqBQThhoUsGVYJXMAx+oDzNYB/2xlHyd4J2ljAYqg8SxaQt1X01pDeOA3ewg9uLBK0WKfmgaZj1sYEzNlUVr9xUKnesBGGq9atx+R/72gWw==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by MN6PR19MB8767.namprd19.prod.outlook.com (2603:10b6:208:4f0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 18:26:05 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 18:26:05 +0000
Message-ID:
 <SN7PR19MB673648D6C15A8E15D35F1E5E9DFE2@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Thu, 9 Jul 2026 22:25:56 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: ipq5018: add node required for
 Bluetooth support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann
 <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260709-ipq5018-bluetooth-v5-0-e476c41f03b8@outlook.com>
 <20260709-ipq5018-bluetooth-v5-5-e476c41f03b8@outlook.com>
 <11796dd7-11c8-45e3-8f9e-1dc27da0b229@oss.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <11796dd7-11c8-45e3-8f9e-1dc27da0b229@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0174.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:344::18) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <602ed4c7-4ecf-4465-bb2f-9b4e5d7ff63a@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|MN6PR19MB8767:EE_
X-MS-Office365-Filtering-Correlation-Id: 73e946c5-010f-43c9-ee5b-08dedde7895b
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|6090799003|5072599009|19110799012|8060799015|15080799012|37011999003|51005399006|23021999003|24021099003|4302099013|3412199025|440099028|10035399007|40105399003|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a1M0OHd0ZnEybDdMZGJENzdvS1BKam16YUxGVFpLWVNnUWRGa1VVZzhZTnVG?=
 =?utf-8?B?c0VOVjdMMjJKaUZMWTh2ekdpZ3FERzNST0JNTXBpLytiK1VCeHhoWC9BaWpX?=
 =?utf-8?B?ZkxOZUZ3dlErTlRXVmNwR2JVVXhiRGNnc1V6emhYdGQxSEYyK3NLTW1sMnFt?=
 =?utf-8?B?WkhFWlVZSnlqeGxzQUEzTy9aMERtQUpKaHNpTlBSMFh6Um5jZkpITXloLy9p?=
 =?utf-8?B?S1VteEJnU2E2c3FkK0tOMGRjSkZTbUVHa3Q4OC9md3FhcDAwWDdMNE9aOFFF?=
 =?utf-8?B?ZWpRdXMzQWNqaVA3NUtmeGhoY25iM3B6RitPWGlYdjZIRVIvNU9LYVZHUEFm?=
 =?utf-8?B?dGNONk1NcFpxaTU4aStDcFJoQ0s1OWNqKzF3M1hOZTlzekUzdTFKWEFhZFRK?=
 =?utf-8?B?dHhCWnkyQlpWWG1lWjJQWnNSS24xdHpiNldmK0w4RHRYRS9NRytPZUlqeXZm?=
 =?utf-8?B?Qld1QkxMQlB2ODNvWXFSRkt6b0FPUHhTeDVmb3lONTAxOTY5eUF6NURRQkR6?=
 =?utf-8?B?a2g4cngvQ2E0a1pJZU1jOEVEdVpCUWZtTVpaVER3dlZ5OXpkV1ZQSkdSR3p1?=
 =?utf-8?B?U2UwV2o4bVZlQ1ZVZTRncnBJMEtMOFVScDhnd3FNbjZQQSszK2MzNS83MW9N?=
 =?utf-8?B?aFNuMUcxLy9QODJrZjFrZnFHU2ppYVFEdjdKUnpMQWRqNUsrVFBKbklnVUph?=
 =?utf-8?B?VmxubW1qUjdDQVBTTUhNSnNudFBrTVdiRDZMVGREZXZlVFZkMHFOQTVGWEJF?=
 =?utf-8?B?UUZiVGVKa2ZhaDBJRlNyWHA2U0RCVU5iNTVhQ200TUFUR2hwSTlnU3VGVTJl?=
 =?utf-8?B?TDFrSnljODJqWlk3L2M1cmJJbGpKekFVcndKWlhPbVZkL1UyT2E1Wi9rR3BB?=
 =?utf-8?B?NHgwT3pJVXVrZ1AvYUFZU25PdXVCV3JCUUJMZmIzckV4REpyNDh3ODBMeU5q?=
 =?utf-8?B?Ni9VbjdNcWhOaC9iUFljdjVtNnhDV1JUclgyZlY3Z3poV3FnTVVnTVNzTkoy?=
 =?utf-8?B?R05BZGxuMFZHWlE1S1ZsNmxvSCtNZkk3WlhGZmJKVlFKc0g4UE9xYm5kQ0Fj?=
 =?utf-8?B?aElwTXpQQ0tjYWZ1TmdNL01IaUd1NzVTTjB3OU5lenh3SHdPU3l1WklydFBJ?=
 =?utf-8?B?M3AyZ2JISEd6VTJCV0w1RUZjOC9NbWtpRzZtWllDL0g5VS9SMGVxOUk3Q0Rt?=
 =?utf-8?B?WTVlV05qVzdjYTNLbS8vaTg2WTV4U001QXU0RFhqeldjWjQ5SUt1TlJ5dWd1?=
 =?utf-8?B?bzJpREdQMW5xTTRqTDlCQndlcTFrM1YxNDU0NHkwSlZSMTR4Rm9MTUNWSWxq?=
 =?utf-8?B?NC9lNmE4bm4vOHRtZlhaaVF0UlFOTVdTYVJsY3RHaUhYSHRlYmV2V2tuSFNY?=
 =?utf-8?Q?N1A88/8T5LWbnmgsj5n2KGEeAQ9WB6Tw=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXV6b0l3Y3YvYmhhNVpBNy9aSGlBVXgwakx4QUdUVEZ0RWo0KzZRQmtUeUhB?=
 =?utf-8?B?c0Rtei9LYmF5Nks0VEZyZmNCZWxLOFRkQTU0dVBmcXdKWFVTVUFrSXc2OGZn?=
 =?utf-8?B?YlArVEhQL0xaVmV5bys4U3dUNldSVGUwaXdCczV1bGxGUC9qaTdPdk5iVTJn?=
 =?utf-8?B?TTNXZFRKdk05TGNmOGJtY3ZGb01CNGVEKzF6ejcvTlVtaXg0b1JJNm03aWRj?=
 =?utf-8?B?TTlUbWI1L29lVlRWandpT083MkUrK0gvcVdPOENqZzVtOFQ5T1NVRTE5NEZS?=
 =?utf-8?B?dzMySGpkcVNBWTJza0dwK1B5aHNlUnFNLzdNSjJOQksrMnMyY3Q2R2FMQzJt?=
 =?utf-8?B?SWZkK21SSGFPYjdDc3ZOTkJGRVVCSHVYcWE0VUw3ZFI3SjQ4c2dnb2FXam4y?=
 =?utf-8?B?VCtlMFNUZVdLR2VRTVBUT2dQdE0yNVZWQXlVQi9PVW96TFJDcVhvQzhjaTN6?=
 =?utf-8?B?NlJMSGNHa0RUSUczM0dpRFR0YVNZQ0ZrMGp5NjRncDQ5YnlVOWtWMzNDait5?=
 =?utf-8?B?Q2RxTERHZlV4dlp0anhFb1VXNkVMRmRZckZqZ1ZHUW40L0VxcFdtcm45eW9Z?=
 =?utf-8?B?cW95K2t6a1NydmhlK05vT3JocS9qU1g5WDBFN3Bnb1N2aGVRUkljQ1plOGNH?=
 =?utf-8?B?SjJoN1hqQXNaVm81QUZqU3RMOHdMcEpkdGpPalZrcCtXanphOGVXUXFramIz?=
 =?utf-8?B?c01JYjhmMDgxcElSYkgrd3BCT1BLMlFpTENkOFpVQVVHN21lWEtQNGk4eERm?=
 =?utf-8?B?MTQ3dXZPNVFjb2NXelc4YzMvSmVXYjliQjVkM0NoRXBLNGFZWDRiaGtNRld5?=
 =?utf-8?B?eCtuMTFFcU5TVHo4Sm9kOGcwK0ZGMkN4dHRRQ092TkQ5ZU5NYVFGMlVoK2d4?=
 =?utf-8?B?YjhpcGpIVVJ0SkNHdTk0QzJrTit5cGRody9SSmxvMElrUkVBVmdoaEtkQm9l?=
 =?utf-8?B?c05UVzN0aHRuellKMjVyRkR5Z3BqUjNpU1dPS3NxbFFtcXhMMVhSV1lRUHR6?=
 =?utf-8?B?TG9mc2ZaenYydjF2TnBCNENyOUFTMDRqRG9qZGg2SXVlU2g5ZzJ4S3Y2ODh0?=
 =?utf-8?B?NndsR1JlM1R3QXhhV2crMkpmN3FDdFZVNjh3NEtKcTYweTJxVnAzSjc1ZHo5?=
 =?utf-8?B?OUMxekZnYnFKME5XMTBYK3FrL0JvemgybjVLSFhNL3BIcEN0ZTRpYlpsOHlK?=
 =?utf-8?B?Qlo1NzBNU2lZWk5Oc29xRkFqZUJENVBWeERES2l4YUgveUR5andBeU1HUFBG?=
 =?utf-8?B?VUtsajR6SlMrZ1NWYTU3WW5zZGZGaERNQjltbkpxM29GUEhBaHVrdjhrTkVl?=
 =?utf-8?B?NXFyRWZEdFlSbUsrbHpYcEM0c05Ud2c5S2wyYVpUUkFXdlovQ05HRm8zNXpY?=
 =?utf-8?B?SGRmQjBBZ09CbC9LWGhMOGtSaVg4MlAwemZLMzVSNDJCSHFyVngvY0xJOHdh?=
 =?utf-8?B?NGh5VVhVcEh1TmFWTEIyeXUwRGF2UU9GRmc3cGlJNk0ydHJVTmlnVG55THBo?=
 =?utf-8?B?Mm5mQlBacHhyWXNtdmZ5U3NsdVBoTlJFV2ErSDN2TXZlcC9FVHlYN01McDVD?=
 =?utf-8?B?cFNnaTZ0MTVEQU05aEpaOEdQelFyZTJGVWhrTjhRbURXTm1yTDljQzVySTRy?=
 =?utf-8?B?VytpbFVnNmV5VmZJNnhmdGdqWjVBZVpCSmVUQzhNTGQ1czZCUzNJNkIwQkhz?=
 =?utf-8?B?aGE4UkFPbmdzR2I1T1BtTVJZYVcwRFU0dU1iOGhUbnVXSXdPWWQzRTA4OGtn?=
 =?utf-8?B?TXJwd09nNmhqOHNBSFdzdG5yUWJqSmhWYkVCNzNIMCtEUWgwTWZJY2RDSzlK?=
 =?utf-8?B?cE9SVXZyZExrUUtKK0lKajR5azVkbkNxeXlZdXc0KzRNS0pFUGVzNjlzWFVl?=
 =?utf-8?B?NXEvamNxbDlIVGh6QzlLRDlUTGdZeGlJN0l1NkVEOWJYaUE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e946c5-010f-43c9-ee5b-08dedde7895b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 18:26:05.3444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR19MB8767
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[george.moussalem@outlook.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,holtmann.org,gmail.com,pengutronix.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118080-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[george.moussalem@outlook.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[SN7PR19MB6736.namprd19.prod.outlook.com:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,outlook.com:from_mime,outlook.com:email,outlook.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 31BD3734458

On 7/9/26 22:17, Konrad Dybcio wrote:
> On 7/9/26 11:18 AM, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> Add node to enable Bluetooth support on the IPQ5018 platform.
>>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
>>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>> index 6f8004a22a1f..8c252fa3ff5b 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>> @@ -453,6 +453,22 @@ tcsr: syscon@1937000 {
>>  			reg = <0x01937000 0x21000>;
>>  		};
>>  
>> +		bluetooth: bluetooth@7000000 {
>> +			compatible = "qcom,ipq5018-bt";
>> +			reg = <0x07000000 0x58000>;
>> +
>> +			firmware-name = "qca/bt_fw_patch.mbn";
> 
> Hm, rethinking this, it must have ipq5018 somewhere in the name

I agree but all QCA BT firmware and rampatches are published in the
/lib/firmware/qca directory, see:
https://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git/tree/qca

> 
> Konrad

George

