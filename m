Return-Path: <linux-arm-msm+bounces-82133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B476FC64EE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 16:44:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id B67C32404E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 15:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622232798E5;
	Mon, 17 Nov 2025 15:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="qJZXStpV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazolkn19011039.outbound.protection.outlook.com [52.103.33.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C08227B324;
	Mon, 17 Nov 2025 15:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763394290; cv=fail; b=Zwk0MAsporOGp5l7eCeRswNNr582iT2Op59NhI7VXFFrrSfyppQ/BH8+eLAtdOVo0p/yHqfSbC4ZtxCwFFWbNrnV3WcGog0ZaozzH55fP4LBq3d37F2fc54CNYVeY/a4SPCY8IQNy2fDZi3r0l42FmhNihCQ/JmnvWeWGgdsCrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763394290; c=relaxed/simple;
	bh=sPlaeZSVntifkLiftwqB7gR3wm2Kn5WAm45iZ1QgyWQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=q0/YnPDMRhf/ACxVCKcHOiR4Qdkl49k3sl6K/tcf8bfwiUXrQg4K2Oe2NppmOhkweyHwXz1m1f5dDaekoEcXpOSTramdbz+QORCO6jG+3THpW6Xo9+ZKDEvzUUVp4IjEFcKpvJ59yCgicnJVckQ3J7/Nih1DpZnT8rS/eFgiJb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=qJZXStpV; arc=fail smtp.client-ip=52.103.33.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qAXq2oG/XhoZwHZJsmLgBVLGfN79lYBDiV6Qiyoqbpz2JsT/i3ylzwe6ZHwFjebtEm6k3TA4e2bnhhW5LdG1z7lPdMmAzlCYlOrzWaAOOnewym8fu09UlMcIp0iIN0/ToPmiM+Cd5yHPz7tkygkCO3HJ/3TCJgrpEvNMED2LSPJKQnqcNA+KmpgKL3IqnzMShDTL67gv86O6uoyQiBqFia9YHtwsRMy8h6gVGzqT8pZ+mi3TllcwF3omL9yZwUz3s6e0pjDRtEvmlh5mhNOUU0QeVnhZbEoPw7bE2McGqZ5pFHlUtpS20/AwfVZQdbTe1d9Lae0viBtP9rG5K/s8ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVm+vaiGf5n+LCe6OI92ibLKksqykNQDlWH627pTRtQ=;
 b=LvctY+hkdSS8lgf8sLlqp+LVCgbc6OPADu3HQdJ4ZbC8vOtXExHKOkOpSDcZJDFGF5Ms98UgRu/tbVmebncSKALWGjtI5Jq8zDxXS0V56nPfxg1XqxHqJr9k18661XbWa07Iq6LIL4MUFebLRMgcLrUXRcWuQFcdjHjONjtBFzjbICmb304IGPcdMbnBZ6NSw/HCRNlBU75hFH5JQVaCqhsFnHbfMLCeag0+mkVDMm8Y8J9WhM1diyGZTOZccpQfZt3G4+VCyhbNsyhq2U2ewaSM2LR4OIYA/MVXVkTCmV2kImkMxw5nv4V/n86ThZNVY3s/ibZz7NkgazBqi7xnBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVm+vaiGf5n+LCe6OI92ibLKksqykNQDlWH627pTRtQ=;
 b=qJZXStpVfYt8/5fisZh3Pu91sbKLXQNu5tTwMAfwmHn9pYy5/1Cc/i3JpzcyeSwAk8izm3b7vDpW/Se7d0CMwJkQwqNrwIk+UHfsN67JQjuXCLR3HXoEb8NMqZ1pvuMv3kK/MU5cU4zw7J+6Or6gNq2u5svu7W5HmcHr549iLvaTKKZ768xHyxHmSTwhM6OOQ9QRwvngD0BoszbG+ALYvN+VjGuRlfJyE6A09cYlVHtbRjZ7MNjIpt4hrZgiFyctmw5KxBJerGXBtnIFhXszp+m/CLEvBigeA8Lws9pDWxKQVf3rR1csMk+i+yf9KMUfRCUsVzdnb674Be0Vw3xCQw==
Received: from PR3P189MB1020.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4e::16)
 by PRAP189MB1900.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:293::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 15:44:45 +0000
Received: from PR3P189MB1020.EURP189.PROD.OUTLOOK.COM
 ([fe80::89e2:ab64:8c13:9c68]) by PR3P189MB1020.EURP189.PROD.OUTLOOK.COM
 ([fe80::89e2:ab64:8c13:9c68%7]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 15:44:45 +0000
Message-ID:
 <PR3P189MB102003218DCCE87EEB69A0E4E3C9A@PR3P189MB1020.EURP189.PROD.OUTLOOK.COM>
Date: Mon, 17 Nov 2025 16:44:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: x1e80100-vivobook-s15: add
 charge limit nvmem
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
 <20251116-asus_usbc_dp-v2-5-cc8f51136c9f@hotmail.com>
 <378c611b-f8c6-4f89-a3b3-6d8c22445e83@oss.qualcomm.com>
 <PR3P189MB1020E7393F72B285173137A2E3C9A@PR3P189MB1020.EURP189.PROD.OUTLOOK.COM>
 <ff773af3-d843-42ff-b4dc-e5a9d85c2285@oss.qualcomm.com>
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <ff773af3-d843-42ff-b4dc-e5a9d85c2285@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4PR10CA0015.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::11) To PR3P189MB1020.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4e::16)
X-Microsoft-Original-Message-ID:
 <cf098b6a-e09e-40e0-8de2-5c6b7c754274@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3P189MB1020:EE_|PRAP189MB1900:EE_
X-MS-Office365-Filtering-Correlation-Id: a0ba8ff7-d240-4378-05a8-08de25f03b74
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|15080799012|10092599007|461199028|51005399006|8060799015|19110799012|5072599009|6090799003|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWRTcGxoOTVlclViaWNrektZR01FWlBUbTQvcW85dDZRUXZvWVZ1SWxXeEpp?=
 =?utf-8?B?UWNxQTl0S25tSEFEdUVMWEVVSmZPcHp5VW1GVys1NWd5czhoTGtkc2U0VDlq?=
 =?utf-8?B?MHp2R2lMSDJXY0d4cTgvWEVvdlQrL1kxNklrM2FGOXJKZURSRUVvQVFIU3Bu?=
 =?utf-8?B?aEpMdlMvKzlHSkpDc2F4MUJGT3h3dEpPZDR4N09aaDBFUnorbm9SUE1aMlVp?=
 =?utf-8?B?WmRGTW52dno4aExLQ09PRVg4M3hXYnVET2dpYWhCWk9DVzg1QTBaY3ltVytS?=
 =?utf-8?B?V1htZ1YvNHpjdjE3Wm9taEdZeFlXK2VHK2hLcU1OSmdxNm9seEE0bWFVUVBD?=
 =?utf-8?B?WnlVRnpuWi9DV2RPRE1WNSt1N1psSHlZekVhZmp6MWoreERsdG5Ca0o0OGxo?=
 =?utf-8?B?QzhQbmNuWUJhLzNuUlRjaTZQQVprUXAzS3hRVFYzOXpDVkVVVTR0M3FTVVVJ?=
 =?utf-8?B?UHpwK1hhZHdIL0pOVjQzUDFHeThhUXBtbitSeHd6d2RKRk80WXcvbm16L0t6?=
 =?utf-8?B?b2lGZVZqRDRsTmw3NmJqUm4rS2R0cm5STGVsODVzd0JoVlE0MzNCUmExekZu?=
 =?utf-8?B?R2wwbnBlRlpkQXJ1bW92dXM5N0xjRnoyK2ZmQUtsalNlOGE0Sm9ORlFuaXBQ?=
 =?utf-8?B?azFGR3pWRWE2QTNsMUR5NitBdVhRRHNtcVY1bW1yTld2eHdnbFBnY3dUbXRh?=
 =?utf-8?B?VnliS1BIVDRSUmphQlh5SStMeEdkK1hBNlFDZUdTR0tOQjlqMTNpYjhPYTlS?=
 =?utf-8?B?VmEzNXZKb29xL1dxK2dCeEFqOWpUdUx2d0k2SWJzdjF6WnN2SHk3QlVYRXB2?=
 =?utf-8?B?MUg1S0psbzVCcEk1K2NwaFdEMERxY3BmTE1ZNzM5Y2JPbU5LUTY4UTkrNlVl?=
 =?utf-8?B?Ymw2SDRtNHVPVjk5OFhUbzU5a1NSSjdvYUpEMlZ2U0NWaktMQjltVUE4cDVS?=
 =?utf-8?B?eXZzYjdUa2N6UE9rSytlZnJwdGk2WUtmMGxRQUFnN0dTNCtYeHRKZVo2OS9x?=
 =?utf-8?B?bjFzWHFMVzNWYkViSXlvZmx2WlhmN0tIUHgvUjRDU2pCemswYUlXM1BnVWVY?=
 =?utf-8?B?d3BnTFIwNmRlQlJ2V2wvYXROT1ZIT0p6T3hCU01GQ3BtUktDWHNUa3RPcS9q?=
 =?utf-8?B?VGorTDdCeFI5N1pqSjROVGtqdnF3VkZ3M0diMyt1Nm5URWVtbHZIMWMzQ2Zj?=
 =?utf-8?B?S0RjRUs3SDZNOXZScksvMHdReTBrOGpyVng0WGNTU2tUN2pza05YQTN6U245?=
 =?utf-8?B?NjN3Ym96Wnk5K0NsNEpPMytwMWE4Q0JUS2VWckpZeWhUSHNEMEFmYWMzMDl1?=
 =?utf-8?B?RHZjaSt3Wmk2WWIyVkhGMVJKbmJnNjJmbDVpb3JiTUZkdEE3YXRrYnQ3cTFC?=
 =?utf-8?B?L1FRWkpQUGw1REhlSWo5UXBhd0Q1WklvdWVLSEhaeW1MV3MxSzRNNE0vZ0lo?=
 =?utf-8?B?RVBic3NXQzlzMUQ3SkFWZjRPU0JDRnI0bC9ZMzQ5emlBeDVDWDFCVnNLdXUr?=
 =?utf-8?B?bXdUS29xQ3JETytKQ1BMR0pRNkppcEtYWitHZ3N4K2dQc3o5UHJIa1A1RjNF?=
 =?utf-8?B?a2lCcVJWeEtJMXF1bGM5dUl0TGVUc3hZdW90Zkc1bHYzL3J5UFczRXRDdTIz?=
 =?utf-8?Q?Nrvt4/ndvjm/dSoDM5gsq6txauIdELwARocPc1GfQtWo=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFVVdEVnTXdCaElzNlJhdExhQ2U2STZ5cWFTR0k3OWMwS1JMZTZnZmJUckxS?=
 =?utf-8?B?ZGVXUklLU040RzlkOUF0bUpCWFBReW94UGE5K0crWnY0WWwyTkFMbnZLMHRC?=
 =?utf-8?B?MDIwY0VTamJWd21ZN1h3bXlCVU94UzJwVE9ESGF2QUJ2eUVlK1BqTDZ0czMr?=
 =?utf-8?B?YkJGaDcvSWw2U3ZVYW45RTc1aEt0dTN0ZzgwVVlaeTJTcVFzcm55QTBIemU2?=
 =?utf-8?B?QW5vR1hUakVjYjNzOU9VRE9nQ2dQR3V5d1hta1lUSTBjYmRscFNPbUtpam10?=
 =?utf-8?B?NU54VlIxcVg4VzdFYjhsZ2YybFIrSEQ0TjZuOGViNzdFejN3WlYxUloyVXEw?=
 =?utf-8?B?YjdMQVg2MnU5NmlSd2hHQzFEemlEMnJBNDR3N2RpS3BZbmV0elU0L2hwWXB4?=
 =?utf-8?B?OEUra1RZbFBHQmM1TjE1OHIrcUQ2R29mYVZhZGtKTkJKL3NGOE5HVmhlekJF?=
 =?utf-8?B?alZ6UmJ6c0hkclgyL3J6UUdYc0ZCaUZseUV0cGF4WlgzTFVORGdJS3djQytY?=
 =?utf-8?B?ZWZ1d3lzTXp6b1pHQTF1Zk1ORjJlcDdnaGdsVmpCeTJXUGt2eHN5NVJNUHlC?=
 =?utf-8?B?TmpaaUkvMFNHQWc0OC9NOWRlanR6V1dmUHNXbnVReUxZMnNMVVdEaWplTnlw?=
 =?utf-8?B?ajNOeThGbUJFdkxaOG5aaFh2SWk1bDhKSzJHYXFYYjVGVFZ5SUZ0TEdxWUlJ?=
 =?utf-8?B?cFRIQ3ljdWZ0clZtVWpmdmRLYlkzMVBpNFgyWGhVSmx0NGh6VTVoZFFzbGpr?=
 =?utf-8?B?SkFNcE52cXY3WDdRdk1wQWxPMCtlZzA1RTNQY0N3U3FsNzNHWU5NcmoyOXRS?=
 =?utf-8?B?ZzA1bnM1UUZWMlVyaElQOTNPNFhXRmtjTUJsbEI3YmR3Q1hCTXJFVy8zcmRz?=
 =?utf-8?B?eEJpVkhNZDNLemJrSnNYTzVwS1lFSlZ3aG9BWFhrU0ZaaExnTjN2dkdVOHBR?=
 =?utf-8?B?WUlCVGs3aVliZFJaOEF3cTVmVzBQeHgxNHFmTHh5bnlQOXJpclhHR1dHK0NP?=
 =?utf-8?B?SG1raHJZbmo2Vkl0TTB0SUQwSkxhYStsczQ1VmNzNFVKZ0E2WUFCTnR3cWMr?=
 =?utf-8?B?azY4K2FxS1I3YWNhc3JSMDE1SkJVN0haSVZPUXFYR0NQdGNYZFpxWUxZM1N4?=
 =?utf-8?B?RVJvb0M1akh6NmtGSDNlL2RPaFdHekg5WWZEWExoL2hmZFBxUUpSL2lqN0Zp?=
 =?utf-8?B?TGlYYXJLUUJFNWxqeFVVbzVvQjNpVlBnY09FSXA4b2FCcUxNQlh5Zkw0SWNl?=
 =?utf-8?B?dHlTOUNBaXhhTFRpUWZSanZ3RmxyVW9KZjQ4My9lTzlvRUFmV2lyQitDTjRu?=
 =?utf-8?B?dFhXbk5rMUNEaDgvNm12YklCcldRZXpIc0pvc2NVT3lhTU1ZeFphWmpJeWxU?=
 =?utf-8?B?d1RCNm0wNStkYmtMYXhULzJSWE9lOHNjd3VjMmx1TGM5bVNScTJscmVHdnVD?=
 =?utf-8?B?dU9WblE4VFJlcEJQNVVQL29HU29vQ3VwRlVCRDM0ZDg5cVRRWGJJVzJxNFRL?=
 =?utf-8?B?ZEg1MlZpaGtlN0xOV2hORDFmeGU4cW56K0JyVUFuNHJNUklyZFRBMjJJSDRx?=
 =?utf-8?B?VGhxTzk4QlI5NlZ3V2l5TlRJVElRaEVoQmM5ZXVBR3k3dUVBeS9Ua2tucjMw?=
 =?utf-8?B?dUpuQnVybUVrSTdZbWJiZExzbDVoTTkvbk1EM29SN3o4VmZGZ3hEa0R3Yk03?=
 =?utf-8?B?N0RwUmVJNEM4RXNMMDhEVDQyQy96cWtidnFVU1hWNDBjSm9lWW1qcUJRelpC?=
 =?utf-8?Q?dT+DsF9C3eI7bnnxZ1mSRUFYkpYpoLaZBMNdWrL?=
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-2ef4d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: a0ba8ff7-d240-4378-05a8-08de25f03b74
X-MS-Exchange-CrossTenant-AuthSource: PR3P189MB1020.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 15:44:45.5748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP189MB1900

On 11/17/25 16:35, Konrad Dybcio wrote:
> On 11/17/25 3:13 PM, Maud Spierings wrote:
>> Hi Konrad,
>>
>> On 11/17/25 13:59, Konrad Dybcio wrote:
>>> On 11/16/25 11:52 AM, Maud Spierings via B4 Relay wrote:
>>>> From: Maud Spierings <maud_spierings@hotmail.com>
>>>>
>>>> Add nvmem cells for getting charge control thresholds if they have
>>>> been set previously.
>>>>
>>>> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
>>>> ---
>>>
>>> Have you verified that e.g.
>>>
>>> connecting the charger
>>> setting the charge threshold
>>> rebooting to windows
>>> rebooting to windows once more for good measure
>>> rebooting to linux
>>>
>>> still has the settings persist?
>>
>> Hmm I have tried several things but I can't seem to get the values to stick. I the spmi-sdam driver is compiled in, I am not quite sure if I might be missing something.
> 
> Hm, I wonder if Windows/UEFI overwrites these values or whether they're
> used by something else..
> 
> Can you set a threshold in windows and see if Linux can read back that
> data?

the values in /sys/class/power_supply/jada-jada/ are zero when rebooting 
from Windows into Linux after enabling charge limitting in the Asus 
application.

I remember my old vivobook (x86) also forgot its settings each boot, but 
given the nvmem cells that should not be happing here I guess. It is odd 
that there seems to be no collision between Windows and Linux. Maybe the 
Windows mechanism is doing the old trick of writing it in there every boot?

Kind regards,
Maud


