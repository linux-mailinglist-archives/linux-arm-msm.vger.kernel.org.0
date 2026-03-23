Return-Path: <linux-arm-msm+bounces-99179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBdDId4QwWk7QQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:07:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5632EFAEC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:07:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC88E304C605
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F488388E5F;
	Mon, 23 Mar 2026 10:00:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazolkn19012063.outbound.protection.outlook.com [52.103.43.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998B2387355;
	Mon, 23 Mar 2026 10:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774260011; cv=fail; b=XGfcicx78HwtFMzUPJZXcKtwrsCC6gny2hnVe36CZ0IsQouQpdwc5xfU/bXdtCU3Hazssg9fQtmqbukZRd4BOQEnXJXHwsr5V3dhsH0YOWlQCyLjLVtsCQGIR9zeYaXmEjlYptRPfuztkDakj4zebdzqmUPs96AwxJGWerGHLIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774260011; c=relaxed/simple;
	bh=uG6Ceyz91CZqPrPqfJNbjPfqBI9lBE9duwNO4Kphdtw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PLD9tUMhzmZj1SwL5qJKkbBwZDmWEbvzRy642K7hKxN9E7+m676zmg5B8ztryKnV096cyq3cukZcuoC+gluPHRNqsFwf3ui2ch0MsuY/4/ekEG9cqr3C+Btxh7hoGmVDshU3fZfxvcLZ3fWUnAk4NLZzZ4MiOKNMkReQWiZs0pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sobir.in; spf=pass smtp.mailfrom=sobir.in; arc=fail smtp.client-ip=52.103.43.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sobir.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sobir.in
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6efmVj0SA3GxkREAPJhBlb1U605hsnEQYX/Jg+p4EMl8TZRIi794Ho86g1mTQpf6Y/xsCqP+vJjMbj4BV6gA5cQX9x/Bf1AVosXP83+AtcMBBMn0sKxVY/PwCoiJ3/X9ZUwpa27E+rCRQBoZH0teJsMpHBIr1Zw7lh5f8er6KgFQiELVh3IBDnadRAj2/JQyoR3sWbag40GAhmdAYZGbeK/XruPw2M2yL1Djfa5Hugh1EZhvdCgKmKjEbXyZlQHCvp5UXtZvSF6p/aZ+zY2J/RD0wdcssN0rvNG3UhFcr5UVo86ZOtx1VihXPPxoaTB10HB38kjpVqQf5VA6XkQAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uG6Ceyz91CZqPrPqfJNbjPfqBI9lBE9duwNO4Kphdtw=;
 b=RpXlpVPqZ8J9MGGb4tHBMNvlaX/le1Vnmstba21Cn0b3Sq8PZDzzuQMPsUUOxeN/TFxkNxvVQOPLKxJtMU69cykLYKKnijSB2B1kTbVj0gsIwWx7ohUI+3vyvPP1hpx6DZbekUqeYLQ9gGOn34S7kgKU3wOCwWLj61pa2yrdOp/tYoPc2+aCamG90uZtox9Hpl0e2xnK8NhFk+XcB3xCWYMEqYLk2H3gFdenJP5+6LFMgCfPa79//ouVULrHk4Jilq2zkvOG8q4foH8jeNLB+vVKA4tf4DwXalC80HVfVAZ+HOlDwVu7wwENkmvdhY5I3rMyb3fcpfILC95pabkkEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TYUPR06MB6099.apcprd06.prod.outlook.com (2603:1096:400:356::8)
 by TYZPR06MB5736.apcprd06.prod.outlook.com (2603:1096:400:26b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 10:00:04 +0000
Received: from TYUPR06MB6099.apcprd06.prod.outlook.com
 ([fe80::14ee:b44a:e644:ca6f]) by TYUPR06MB6099.apcprd06.prod.outlook.com
 ([fe80::14ee:b44a:e644:ca6f%5]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 10:00:04 +0000
From: Teguh Sobirin <teguh@sobir.in>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Aaron Kling <webgeek1234@gmail.com>, Bjorn Andersson
	<andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: Add AYN Thor
Thread-Topic: [PATCH v2 5/5] arm64: dts: qcom: Add AYN Thor
Thread-Index: AQHcsX7EH7g00VtKoUOEw2KbKQhWOLW1xSEAgABpAgCABcBxAIAABhFK
Date: Mon, 23 Mar 2026 10:00:03 +0000
Message-ID:
 <TYUPR06MB6099C25223E694C49DBAB334DD4BA@TYUPR06MB6099.apcprd06.prod.outlook.com>
References: <20260311-ayn-qcs8550-v2-0-e66986e0f0cb@gmail.com>
 <20260311-ayn-qcs8550-v2-5-e66986e0f0cb@gmail.com>
 <16211bef-2360-4bbd-bd2f-72c1d6993a1b@oss.qualcomm.com>
 <CALHNRZ_5_2zypBAeZT=YM6ZUq=wv-8GO+DEJTOgtJ_8nrB2REw@mail.gmail.com>
 <2f801f66-68b4-4515-adaa-092782082162@oss.qualcomm.com>
In-Reply-To: <2f801f66-68b4-4515-adaa-092782082162@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6099:EE_|TYZPR06MB5736:EE_
x-ms-office365-filtering-correlation-id: 4a897766-227f-4af0-3aab-08de88c2f479
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599012|19110799012|39105399006|8060799015|14091999006|15080799012|461199028|31061999003|6072599003|40105399003|3412199025|440099028|102099032;
x-microsoft-antispam-message-info:
	=?utf-8?B?SFVib2psVFEwTk5VcTNmQ1VsM1lodUV2SkxDSjgxZ1JXMHZjemRxQnVYQXA4?=
 =?utf-8?B?M0Fqem5uQjRuL0d1Ni9EakIvSnhmTjUxSUdjdHc4RDcreUhaQU5ITGZFVXZG?=
 =?utf-8?B?MUtqUTZDQVpZUENFWkt1RVhkZmsxK1FpclVEQlhJUGkzVml5aGptTXhYWHlP?=
 =?utf-8?B?dEtaY3pPMldBdTUrVmhOUUhZS2k5NHFldjhpYmo2MVFiVXNMSXZaZHlkLzdw?=
 =?utf-8?B?WElTZ2FNTU9PNVg5Z2IzTFVUY2Zld0Q3aWcxNVpEWDVON2t5UFA1dUFWTFht?=
 =?utf-8?B?djk0WVk5VHI3aFR4Z0FzM3RJcktUZ3pybWVSR1gwS01wMFNSTVVOa04xRUM0?=
 =?utf-8?B?eTlXZE5XL0pFNjFuYVNlSWE3VVI4aDdzeFNRTGxlNlZwOHlxUTVuUXBoY1Uy?=
 =?utf-8?B?L2dyUUhzYXpTVHVoRG4rRi93MGJlWlZaVDZXTmZ4Sjg1aFVlcGJacTJPMkN4?=
 =?utf-8?B?NnZUY01oc1lFbVZMQTlkMmhMSU5ORHVWeFNyNFF5aXhvTHdPVS9xNDVVN2pq?=
 =?utf-8?B?M0JicmVjVnZrNzRGa3FuZitpQUNUTXhPYjVLY2JtbEZpQWo5TDlxWkREYldl?=
 =?utf-8?B?Sm0rZlNPNktpOXRDb09CZ1FMbGk0bEUyU21VTUEzRDM5bkg3THMzUzZidFVH?=
 =?utf-8?B?YnJMZXZ0b1BoQ3UySVVsZ1Q5allMbitLc3g1bW81a29VaE1WR0Jla2UvQkNC?=
 =?utf-8?B?NGpXTC9lRFJVQkM2K09pYk9aOE0yN2czVmRKMXRZQkFIK2NuVFJBNG95dUdS?=
 =?utf-8?B?cFV4QmZuSktoZzJISTVaOWR6TndXMEZFZlkwZlJnNFJBOS94eHJSaEVmVlBD?=
 =?utf-8?B?RThXeHZQYzNtYmVhZkJ3a3lMdVMvQnRRdWRTaHdKSGJFYTZub3BPTEVjcitJ?=
 =?utf-8?B?OHZoZ2tDS1lUYkNBTHlkUGlQZWthdkpacnFwSENYbGJuOEl1UmdwenlpUjNI?=
 =?utf-8?B?MFdmZlU4dHJCWVlLMTU2VHc3OXIrZzNUcWRFNG1QYXVGRE96NzZsdE9UTDlX?=
 =?utf-8?B?emRyZ1dacU85citZY2NnMFh5NUhuTlZBWm04TXVWUk0zanM2YXJ4VFVsczFp?=
 =?utf-8?B?S0ZSZUxRdTkycWxiVFQ5WGZWVDVvbjZOOWFjb1Y4ejlYdmFjNEI1dFFMMDFQ?=
 =?utf-8?B?ZnJ1QU9BL29hbVdaTVhteklnb04vWDRNdncvd2JvT3B3RUUxUmsxa1B2aU1l?=
 =?utf-8?B?Q2tSNGk4NnJjSVVtRkEzN05Ydkw0Qis5STZvMlhhZ05LcEJCOURJTmZBTExk?=
 =?utf-8?B?RmNkUUJuVGgybU5VYTIwUlE2WVRZZjdoNExKQ2ordkRHcmJQUT09?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bWdLZ3IwbTVZRVhqVFdzaEhiZkFiaFowbVVIQVR2ZmRwU3NyNjUzWUFnNDNF?=
 =?utf-8?B?SnFCblYyNWg1NWRGR2lMeWUweEx6MmRlVE84WnV6a0RQd2FycWtMV2JrbHVI?=
 =?utf-8?B?SGtscXpGWjFhZ25IRS9EU1EycU8zVlRRNHBoYVFkZjdNamtEbjBNQjVDa0o3?=
 =?utf-8?B?d3JvZTczbVhBK1I1UUIvS1d1L2s5bENtaEFscXNjUWV3aURHV0h3ZzNuWjd0?=
 =?utf-8?B?QmNzT2h1dFlvczVQWW1USUZ6alpxc0g3U3B2eHFuMEc0bWtFUkdEcTMwRWZo?=
 =?utf-8?B?T1hJdXRLMkRCeEpPVWViMEtMSVo5TU1TZHAzWkh5Q1Fmc3JtUWg3VWkvdnc4?=
 =?utf-8?B?OThiR0s2OGMwR1FYRHJERENMdDB4TDFOL1g5a3dPbjVhd0hkM0RlL09KSk5n?=
 =?utf-8?B?bHFZUUtrYTZIN25qalFyV01rWWhIbVRPZVh4VmZhd1lhTElUcmZxUEp5RnBK?=
 =?utf-8?B?dURWQk81SFFESkw4U2R6RlFBbjc5T3VDVFMvVUMzQVhaUmFEMndZMkhhckdo?=
 =?utf-8?B?MkRyWks2Vk9OWWh6cEtDcXBtc2toUHlzUklybGJXU2RVUEFhSlNidUdlYjlp?=
 =?utf-8?B?cXRyTi9RZXVObGQybk1KWFVnTVN3VDlSVi91MUVtbHdlQ2xRM3VJUzU2ZU9B?=
 =?utf-8?B?MlVIQzJuMFRmSFQzOFhMWkV1Z2I4N0dzVVMxUE5MUWdaUkdtVzl1a3ExZHdY?=
 =?utf-8?B?aktIcGJVVHROYWNGTVdBemIzVDV6NDZ4eEU3ZG9rM3NCbVhDYVhLc2lJWVVK?=
 =?utf-8?B?R3VBNko5c1o1UXpDY0I2MkxVNk9SQlJwQjAvNHB4RmVSWUQ5eHR6NHpzcHg5?=
 =?utf-8?B?bm5YTUM1NU52ekYwM3NyT3pDVWppMWpKNFhXdXNrRmtvekZLSmhIQk05OGZa?=
 =?utf-8?B?NVJxK3o1L2JFSUpCWnMvaHNRdFgwZjJ1M2R0Umk1NlZ1T2JmUWJwUUJ2TTJj?=
 =?utf-8?B?YllWYzd6UFN6N2RsTkYvZlhmR3BXcERKOUkwK3FaZzVTVDY2NEc3WXNxVmtV?=
 =?utf-8?B?ODJhZFh2SGlKOC9zcnlydjJCMGdXeHNpaGFSSGNtTFZBL1NwRFZHZ1NSTG50?=
 =?utf-8?B?UlI1eFAwRHVSbmN6Z0o0bDV3cVp4clpMUnBIWmJ0OGpCM0QvMVkzaSt0aks5?=
 =?utf-8?B?c1RBNnNOUkRDbEdxdXp6V3dlQ2Y1SmI3dlhEZ1dxaGQwVW90aDJHSkNBeGtm?=
 =?utf-8?B?a0NJNHNEN3lodEFVbGRIODA2TU0xdmpDcGZlS3FQRmUrOWRqY1lzVnBEK0ZL?=
 =?utf-8?B?cGlrT0NLNHdsdUY5a1dKd1hOMmkwbTFEZ3JMeTBqMWw3dHBnOGErNUs4YWJm?=
 =?utf-8?B?U0tXRkpCalFVdEh6VUVqemxlbkRjU2VqK29HcTlsT3c3NE51eDhDQTMzdVdH?=
 =?utf-8?B?bFRSS1ZXQ2lQTDRlRm15TVhWQWtQSjdONEg2TVR3MHVnb2RTMHRtSUFGOWNJ?=
 =?utf-8?B?Y01tS0J6QnRTd2l0STAyeE13c0xKZ21xb3R2bHFWNElDK0gzd0p1eFhsRlZU?=
 =?utf-8?B?OEVua1h1a3FZTUs1Q3VvekpXanRUdmVIaVBjdUFWVU5JcEQvNVZnNUo3cjNK?=
 =?utf-8?B?cHZSVUZsVllkK3RtWjV5d2pHYjJuT0VQOWpQNUNpQ2hDbXNHWllTcm1LMTBQ?=
 =?utf-8?B?SDFrMUo3T2plcWhNKzJsa0UxUGhzN2p1RE01VmpGVHBLY2JjZngzbzM1ampF?=
 =?utf-8?B?RE9ZTWFLNXIvcmgwUHVoZDFRNDlYNWhISWNsaWwwSjlVSnBodTNnMEdFa28v?=
 =?utf-8?B?TXVUT1VnaXh4MnptWnhyNmpnd3pJNm8wQ2x3TzdVMlU5UEJqYlVyYnExME8r?=
 =?utf-8?Q?7BObxH6ew8Ao3iBlQAf7Bo8u2gccaGyyt08+w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-25b72.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYUPR06MB6099.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a897766-227f-4af0-3aab-08de88c2f479
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 10:00:03.9494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5736
X-Spamd-Result: default: False [2.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99179-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_NA(0.00)[sobir.in];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teguh@sobir.in,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.006];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sobir.in:email,TYUPR06MB6099.apcprd06.prod.outlook.com:mid]
X-Rspamd-Queue-Id: DD5632EFAEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

WWVzIHRoZSBmaXJtd2FyZSBjb250YWluIERTUCBjYWxpYnJhdGlvbiBmb3IgZnJlcXVlbmN5IHJl
c3BvbnNlIGJhc2VkIG9uIHNwZWFrZXIgdHlwZSwgZGltZW5zaW9uIGFuZCBzaXplIHVzZWQgaW4g
dGhlIGRldmljZS4NCg0KUmVnYXJkcywNClRlZ3VoLg0KDQo+IE9uIDIzIE1hciAyMDI2LCBhdCAx
Ni4zOCwgS29ucmFkIER5YmNpbyA8a29ucmFkLmR5YmNpb0Bvc3MucXVhbGNvbW0uY29tPiB3cm90
ZToNCj4gDQo+IO+7v09uIDMvMTkvMjYgNjo0OCBQTSwgQWFyb24gS2xpbmcgd3JvdGU6DQo+Pj4g
T24gVGh1LCBNYXIgMTksIDIwMjYgYXQgNjozMuKAr0FNIEtvbnJhZCBEeWJjaW8NCj4+PiA8a29u
cmFkLmR5YmNpb0Bvc3MucXVhbGNvbW0uY29tPiB3cm90ZToNCj4+PiANCj4+PiBPbiAzLzExLzI2
IDY6NDQgUE0sIEFhcm9uIEtsaW5nIHZpYSBCNCBSZWxheSB3cm90ZToNCj4+Pj4gRnJvbTogVGVn
dWggU29iaXJpbiA8dGVndWhAc29iaXIuaW4+DQo+Pj4+IA0KPj4+PiBUaGUgQVlOIFRob3IgaXMg
YSBoaWdoLXBlcmZvcm1hbmNlIEFuZHJvaWQtYmFzZWQgaGFuZGhlbGQgZ2FtaW5nIGNvbnNvbGUN
Cj4+Pj4gcG93ZXJlZCBieSB0aGUgUXVhbGNvbW0gU25hcGRyYWdvbiA4IEdlbiAyIHByb2Nlc3Nv
ciBmZWF0dXJpbmcgZHVhbA0KPj4+PiBBTU9MRUQgdG91Y2hzY3JlZW5zLg0KPj4+PiANCj4+Pj4g
U2lnbmVkLW9mZi1ieTogVGVndWggU29iaXJpbiA8dGVndWhAc29iaXIuaW4+DQo+Pj4+IENvLWRl
dmVsb3BlZC1ieTogQWFyb24gS2xpbmcgPHdlYmdlZWsxMjM0QGdtYWlsLmNvbT4NCj4+Pj4gU2ln
bmVkLW9mZi1ieTogQWFyb24gS2xpbmcgPHdlYmdlZWsxMjM0QGdtYWlsLmNvbT4NCj4+Pj4gLS0t
DQo+Pj4gDQo+Pj4gWy4uLl0NCj4+PiANCj4+Pj4gKyZzcGtfYW1wX3Igew0KPj4+PiArICAgICBm
aXJtd2FyZS1uYW1lID0gInFjb20vc204NTUwL2F5bnRlYy90aG9yL2F3ODgzeHhfYWNmLmJpbiI7
DQo+Pj4gDQo+Pj4gVGhhdCdzIHBlcmhhcHMgYSBkdW1iIHF1ZXN0aW9uLCBidXQgYXJlIHRoZXkg
YWN0dWFsbHkgZGlmZmVyZW50IGJldHdlZW4NCj4+PiB0aGUgZGV2aWNlcz8NCj4+IA0KPj4gVG8g
bXkgY29uc3Rlcm5hdGlvbiwgeWVzIHRoZXkgYXJlIGFsbCBkaWZmZXJlbnQuIE1vc3Qgb2YgdGhl
bSBhcmUgZXZlbg0KPj4gZGlmZmVyZW50IGZpbGUgc2l6ZXMsIGl0J3Mgbm90IGp1c3QgaGVhZGVy
IG9yIHNpZ25hdHVyZSBkaWZmZXJlbmNlcy4gSQ0KPj4gYW0gYXNzdW1pbmcgdGhleSBjb250YWlu
IHR1bmluZyBkaWZmZXJlbmNlcyBwZXIgZGV2aWNlLCBidXQgSSByZWFsbHkNCj4+IGRvbid0IGtu
b3cgbXVjaCBhYm91dCB3aGF0IHRoZXkncmUgZG9pbmcuDQo+IA0KPiBZZWFoIEkgd291bGQgYXNz
dW1lIHRoZXkgY29udGFpbiBkZXZpY2Utc3BlY2lmaWMgdHVuaW5nIG9yIHdoYXRub3QsIGJ1dA0K
PiBJIHdhcyBjdXJpb3VzIHdoZXRoZXIgdGhlIHZlbmRvciBhY3R1YWxseSBkaWQgdGhhdA0KPiAN
Cj4gS29ucmFkDQo=

