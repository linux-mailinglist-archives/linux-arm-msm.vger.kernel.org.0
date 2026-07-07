Return-Path: <linux-arm-msm+bounces-117181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0fNXMWu1TGoKogEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:14:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E009D718F7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:14:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=JpHNciI2;
	dmarc=pass (policy=none) header.from=outlook.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117181-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117181-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFAA23001B79
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 08:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454542E764D;
	Tue,  7 Jul 2026 08:12:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azolkn19010000.outbound.protection.outlook.com [52.103.12.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D962EA173;
	Tue,  7 Jul 2026 08:12:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783411939; cv=fail; b=F7VMT20e5tpDjqnlprMsk4mbleFE9hgfxDZ+PyGZwMCpwWMcFZip3d96d+qlp83AbknpFRmo59E+6yfSCLqee8oU37Bu1A/DrPnIYJya7T3i41obkN+sfxhqkdbE/7g/PeT/Nz60qMabc5pVRsYnWFgqwDmZ5MijvW7wvhgnnyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783411939; c=relaxed/simple;
	bh=NQMiW5LauZ/ZrIXAMRo8HQdWDwmpbrCgXj17hiHnPuE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DP1ahInAGgmLxQWL7QzJ/Fh9XYBwH9x8qGuHWNSzPhniprIJMdCTtIBQCb92iPDMmMfvLOeZDT7MKko+1FQSNnt3clV4lG9h78MnQQ003ms2UH89x0jOR0L7lz5LkgGcVESM7ATdti70DInNxBp/iEgiB01OxYflVfZgyxYpfbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=JpHNciI2; arc=fail smtp.client-ip=52.103.12.0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A2q7kybDY6Zl/j7klWjqW4kQHFERLcjj+vxpBDQ1/8LrOMGBUV/HXl3CmKgewlhukNhqnnnpxANRFBZQ+XfDMGNX+l7qgq+CRfh6ImUwpFHKrti6UrAOWGZuvFsNV+PstX2v25z86ypO3AePPcS4MvyDErvj6LwW7tBICMCftdaYcShrRvlppe6TnQ+yVp0PSzP6IT1F6aFRLKfYc9r7nSSUvW8vLIyAdxCivPUsd6rWt2A9Yr7gbZ1PAr8MqP/Gh2S7ZLOZ1aREKzr1GQghOs1ejqWbAUUg7dOXWHUGbPWfRAzPBGaFvQmfMTrzoF2tN5uipVMnn18R/LrLzNq2CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klmqHDSlMyW77G4BYBB1MqOAV14ZXKIGttKlu4SFQd8=;
 b=iPmn8BAotDKpketdt1EZdTpOarmOH+GKbYnLzNMizPD67JfytPuekRhj87MMWVZqU/xot+Kpc49U7LNzo3rmJv+cWGBaeuavk4VOQAf8PESlT0WdwqPTvg1r1RTOR2VxtZfcGX/CSVjHMjis6J14oshR6EstphPicPmr4ln3P34j4w8t3rxEFMnxWuclIH6euF7Nboyr4YXrFo1KoeYF8eC19Mt3X13KWMjOPqc3sR0ItrOR3pmEFXTacT5IlCDahHoknqhUt4HbussdLcaxU+6KqfzGJvEg26RqIAijgERnL4Ad/XvHJOn5fh3FDz1W2bFzIjKwwgtHQgiS1xklyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klmqHDSlMyW77G4BYBB1MqOAV14ZXKIGttKlu4SFQd8=;
 b=JpHNciI2dpCTTZtolk7F8nVX82RemeqOQlmufpD/f1nGPITBuw6Ca2Mz7CkCAiKOL+5x+AWyScNe8b33IlXcsVuYkGv1568/SxBM8GpbMXHG67fu6ejwdhn4ui/heipQTS+qjdQhxKlprm0IOK5MNHUsZl2OEQguqEN1kq6cC+CWrtTERbvAFJ2cXG5TMfflZ7orNFYkYVeaesiD2ucbNWxw369EmxL+QKC/qjXKDtaDwynroDJjkEHfTAV7+VJMUn8ltu6kPga8vr1a3DaXulSXB6N5N+Fo93jW30dvTnRuM7R2WmnZ6iWxKUIRs1KvLekCtSf5tJmERRR1eHMWqw==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by SA1PR19MB5117.namprd19.prod.outlook.com (2603:10b6:806:185::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 08:12:15 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 08:12:15 +0000
Message-ID:
 <SN7PR19MB6736F66FB96D6A43C128AD719DF02@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Tue, 7 Jul 2026 12:12:05 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: ipq5018: add nodes required for
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
References: <20260706-ipq5018-bluetooth-v4-0-350262a30959@outlook.com>
 <20260706-ipq5018-bluetooth-v4-5-350262a30959@outlook.com>
 <6d8c0326-1b3e-4eae-b528-22ca77dbaf6d@oss.qualcomm.com>
 <6a312986-49b7-483b-8253-5bb3b842ac34@oss.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <6a312986-49b7-483b-8253-5bb3b842ac34@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0045.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:58::16) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <52a4f046-8888-48d3-9d83-3e7472ea5cb4@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|SA1PR19MB5117:EE_
X-MS-Office365-Filtering-Correlation-Id: 03226b06-60c2-4df7-a8a6-08dedbff7402
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|19110799012|24021099003|6090799003|8060799015|37011999003|51005399006|5072599009|41001999006|15080799012|25010399006|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MUcrS1Rpb0czYW9nNU9Eb2ZWTGZMRUh6ZFFrQk1XNlVKRDh2RkZabGRkbVl3?=
 =?utf-8?B?RkZiTENlRWRpWS9COCtSNlhRSnZXRGlsTlNkQlRQZEttTzc0VDVjcDYzcW1U?=
 =?utf-8?B?bTZUbXBzY3czZlVrMzl3T2NrRk1YeitJWWlnUmtwandpczV2L3hDajcvSzJu?=
 =?utf-8?B?NWo0MnNLUW5YakV2VythQkVqRmlLTDBZb1Z6L3BmV3BCRktEMk1KRk50RDla?=
 =?utf-8?B?V0FxRGoveWFqdmhKK3pweXhPbkozNWEzdWxjeXZteC9rREFTUU9qWFpUcnFP?=
 =?utf-8?B?WFV6K0RoYXVNcnZRbGdHOExTc0NWT3RFd016WHh2a054U3dHVVJMSDJNR2FN?=
 =?utf-8?B?bG5jWUpsNFkzNlNudmRLSHJCTXM1ZXRnZkRPRE95MUVURW5QbkI4eEhtK09P?=
 =?utf-8?B?K0E4VkJxQU5BWGhLQ2d4SXh1b3Yvdms1MjVobEduTWpva2RmT2dPYzgwdDZj?=
 =?utf-8?B?NjFXdkZBRS9GbnJOZk9zdytHcWxRdXpldnpHbG9iYnFndkkzbE5UcXRkYjJM?=
 =?utf-8?B?RlgxYkJmbjVnUUNVWTVPeEtKUnJNNEpzaEF1Q05XZTBPbkYrZlduMzhBT0Nl?=
 =?utf-8?B?b2hjdU9rUjNZQXRQd1dTczVtNFBmS0gzVXg0Z2YxUndoUkRhbTdxOTlQb3lG?=
 =?utf-8?B?NCtsOVZGVEYwcTVDUzBteDB4TjlLQVF0YU9BbnVtVkttcGRYenlITWk3N0o0?=
 =?utf-8?B?YnJYYXVqS1FYbDBKOVpPQmxVaHdXMzdGM29hN08xejB4dzRnZDI1YkE4Sm82?=
 =?utf-8?B?UCt1VVJMaGpNSTdTRXhSOVlQTURpeG9zNXdZQVBCRFIvTWhDaEJ5TWs5WFo5?=
 =?utf-8?B?dGtJQkJhUXMyaGNFWUk4U2pXMllELzdQa0VOK3NyOFJwd01iUFhvMWRjSUdR?=
 =?utf-8?B?bWRZb292MGk3L3JwMm56bDcxTWVjdXRQTG10ZWM2Y0o5ZldtWklLRnl4OFlZ?=
 =?utf-8?B?WFFNRlQ1MGoydDRqRFZhUjd5VFAwOWY3UmdQcFFpZzMwVWhRelZRZ2hJWkZS?=
 =?utf-8?B?TVpUa1owbFdab0lqdXZxZFpGdmlTNmpsejhqbjlpZUtuMkhiWktoL21rZnJ5?=
 =?utf-8?B?QVBvT1NDRksra01CMkhDcHdTbWJsQ3NTNlJRbGtGWkp5TkYvWm13TGY0eXQz?=
 =?utf-8?B?QjF6NzZDRGxQR3ZQUlNDbS91Zm1hSTNvQUZMWkxQaG9QcjhXZlJJbUhrM29w?=
 =?utf-8?B?K3VyTmJHQVNjdk1sOUl4d3kyNzBGMndDZ0lybERGT3VJcnpMZ05mNjZFYVdF?=
 =?utf-8?B?eFRma1hHQlNCYU5vWTlJZ21teHJFdUNRZ29LdG1LK3VEKys5dnlwUGNxQ0xr?=
 =?utf-8?B?MWMwT0I2am93REdOckZCQWtQQmVOdCtuMit0TnNHSmJoTmlEbEFXOUttek9K?=
 =?utf-8?Q?9G1QWcgcDBZtxAsWzssNDdY5xw+82Fz0=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTBsSEtjS0YzSmpBTjc3eWJScTQ0U3hMWlh4NVN2ZjQrK0QxT2k2cHJoaENj?=
 =?utf-8?B?WGpsTWdJbGE2WU1LYWRycTlYR2dRYW5jaGxORVcraHoxWDNZdk9yY0ZFWmxG?=
 =?utf-8?B?MEx6QVdIcitydjZRcnRlbHBaWGx5cEgzYmx4VW9NTFdwZ3JXV3M0amhZRWh0?=
 =?utf-8?B?NHlEVVdRUklLMms1bTV0QzF5aFNZcHF3Ry9DQllGV3dLN0g3eVo3Y2NvL0RB?=
 =?utf-8?B?MXpWL204aTF3V09CU0VPSHpQcXBJeXN1alZQaXBYZFlCYWR3NzYrVFRaaVc5?=
 =?utf-8?B?V3ZTSzA4dU16WW9KOW0zWFYxU3hOaWJ1dGZqbWNFcjJmSndqcmU1bVZMQUk5?=
 =?utf-8?B?YTE2dzY0RXlQcnJ1SUJjQXdhY3ZUZkJ1VUc1V1E1YkYvUitoN0VCdTN1MTB6?=
 =?utf-8?B?UWhGZjNCTmFSTDRpcFhtK3Z5dDduTk5aYTdEQnJ4eCtYNEVSeWpDV0UySHBm?=
 =?utf-8?B?S2lsR3BzWjhSbGl2dTlEc0wvR3c3NDNHQjZuSmpxSHBkZW9OOUU0cUhnMTM2?=
 =?utf-8?B?UlE0RjJpUEhaMVlFdlFibzcwVmtsRk9KQ2FDUDFzMWZpa3Q1YkJ0UVpuY0RZ?=
 =?utf-8?B?T1FSbjIwdnNnclJXVG9keXZkUm1FL2RuV3N0eU82TndROVNhK0tsenNMTERY?=
 =?utf-8?B?NVFwOUYxOE5UcmgrOXRNdEtnTWRvVW1Ob2hpbFVVQXYyQU84cTRDYndyUGkz?=
 =?utf-8?B?ZHpmMW1YbFVqTzNJVDVkajA4S0IvN0swclJHOHQ0M0JEcHBYVk1HWG5jTkZ3?=
 =?utf-8?B?SnlrdzRkL0RPa3BiWFpEdHI4Njdjb1c5bVROVm1CVXRRZllZL2JiSSswbFd1?=
 =?utf-8?B?d1REOG5jZ0xXS3d3cXc0ZjE1bXRadlN4TG5aRGVxeFp3b2RNYkFKTVRFNkZm?=
 =?utf-8?B?STFOa3VRSU9SY2xDOUMrWTZRQmJNeGlqNEZ1TXZWblgyMktiQi95NEdUbXdH?=
 =?utf-8?B?cy8weEgyZEpFblhNNGVhdXlFbG5NZGp1WlJiZk56Vm9RYUdUamhsQWtLWitY?=
 =?utf-8?B?aGJ0K3BlR1V2b2thRkIyeitVOWs0ZGJnVWovUnp3dXNLOEpYR0xyQWtCMCtC?=
 =?utf-8?B?Uk9CWFo4ZUJ6eDFjWHhRRFlKYVF4bkZZSyttRnJHclo0L09hVHJlbHFLWDdR?=
 =?utf-8?B?emxKUVVlUDhwVXQxRHh2R2RUMzlaeXRBeTdIL3c1RGtRSXI0L3lOWlZ4OE5x?=
 =?utf-8?B?d3NiV29aaDJhOHhkWXNxRHIxcE5pTlJJbjRQNmN3MFlnZERpRHVJblExMXFJ?=
 =?utf-8?B?bmVqcFc0TXNlRTFKNzk2WGhXTE1rRGswZHBEcFdTbTl1NjNIQ1ltdHRGZUk0?=
 =?utf-8?B?NnVhSnZ3UUtqNk56Y3NITW1SbjMyRy9XbHZsZW1IczVZeWV4eTlob2QzUXJa?=
 =?utf-8?B?R2hOSGtJYnhDNmdwbTdRd2dqb1IzWnAwMzVsNnNyeVpFV1F2NllVVXM2dTZr?=
 =?utf-8?B?bWlBcHZLbHBaTSt3dWJacXIwUzF5L213bDkxMFdlOTlUamVvRWlSQ2JzSVhN?=
 =?utf-8?B?cU9GNmU4SUdQeG02RWZBTG1SMHM0OXB5akZBQzBXSFhGbzZlTTVyQkJ0bjZ3?=
 =?utf-8?B?TnRIOTVGYWVOQkwwQjVYa0RUdTJUK1ZhTWlMMkRydGZmR0U4NUdlbmR5RTZh?=
 =?utf-8?B?djZTNGxjR1JSRGNhN1pQZGo1NkNvZnRQcmlCOEpFWnRPUW9lOHlRK2FCT3pV?=
 =?utf-8?B?NFpLb0szM2hFMTV2aTlUUEpPcUhJM1dPNHQxVUJJaTVrWlR0Z0RCSjVRNUZE?=
 =?utf-8?B?dURjVUxhR2lERmppN3YzQTFoRzVkYk5HL0Z5SEhJNGd1dVlHQk5iVjNCckUx?=
 =?utf-8?B?U3pqaWpNS3JjMGczR0VVdkR6WFJ6WnA5VjBzSTIydDBtR3c1VmRaZzlDL1BD?=
 =?utf-8?B?dmRzKzhRWnl2cmRvRWFISGtMa21oWmxtK05pN0I4clJTZmc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03226b06-60c2-4df7-a8a6-08dedbff7402
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 08:12:14.8171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB5117
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
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
	TAGGED_FROM(0.00)[bounces-117181-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,outlook.com:from_mime,outlook.com:email,outlook.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,SN7PR19MB6736.namprd19.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E009D718F7D

On 7/7/26 11:51, Konrad Dybcio wrote:
> On 7/7/26 9:51 AM, Konrad Dybcio wrote:
>> On 7/6/26 7:26 PM, George Moussalem via B4 Relay wrote:
>>> From: George Moussalem <george.moussalem@outlook.com>
>>>
>>> Add nodes for the reserved memory carveout and Bluetooth.
>>>
>>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>> ---
>>
>> [...]
>>
>>> @@ -136,6 +153,11 @@ reserved-memory {
>>>  		#size-cells = <2>;
>>>  		ranges;
>>>  
>>> +		btss_region: bluetooth@7000000 {
>>> +			reg = <0x0 0x07000000 0x0 0x58000>;
>>
>> FWIW RAM starts at 0x4000_0000 - I'm thinking whether this should
>> just be the 'reg' value of the bluetooth node. This makes even more
>> sense as you write to this region using I/O accessors

I wasn't sure whether setting the unit address to the memory region it
uses and write to. Perhaps Bjorn/Krzysztof can provide guidance?
So essentially, the proposal would be for the bluetooth node without a
reg property to look like:

bluetooth@7000000 {
...
	memory-region = <&btss_region>	--> which starts at 0x07000000
};
 > FWIW2: The region is called "BT_RAM"
> 
> Konrad

Thanks, I'll update the node name of the memory region to bt_ram@7000000

Best regards,
George

