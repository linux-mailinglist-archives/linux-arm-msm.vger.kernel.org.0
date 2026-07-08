Return-Path: <linux-arm-msm+bounces-117647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sU8sIjpbTmrgLAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:14:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1F772730A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:14:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=duQJrz6i;
	dmarc=pass (policy=none) header.from=outlook.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117647-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117647-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 79770305EF70
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 14:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F40243DA54;
	Wed,  8 Jul 2026 14:02:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazolkn19012056.outbound.protection.outlook.com [52.103.2.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027E742F6E2;
	Wed,  8 Jul 2026 14:02:33 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783519355; cv=fail; b=k3LDGk4CthZsGYo4IfmdYNbp3xYjHtWL5S3+W+c7x9p/N8rMabHMW6WJ6UPc/caF8wfLmOPmnQ3v2cItrOQ5DdlXbghP4F6ntsfQ9DFGTX+VW6+BoFvHzvlkAqqnXU7v/+UKIwci8l5GbjOwFC0v7XHWBastCejCVsLTQX2li5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783519355; c=relaxed/simple;
	bh=lPN7dOzP21ObA8pwwQ0TjC4q5ZDphs4udITRaKbJtvk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=d+A5IK5R/sLnRh6gSv0Y95/rtb9m4Bkmnx+81QUeh7fbBd/pD/jRip0fk2LPa3V7OJe2hHiWYi5XLqSxzlWOKvZKO3712T8d3v1odd1sbYdciID9KPbqCr1/NWUlPjzHbZpoGxAmnNNd6y6xXVu9SnpMO8Dd4r9J13PFxT3sx6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=duQJrz6i; arc=fail smtp.client-ip=52.103.2.56
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fKrnrmm8KAF9P5kDrg0DHzzVOJ2gUpaij9RYZaRbq4WOCQrtMfupNY+3klPMqvazDSx9I4dBsp5lMNgotNPIfNf2CFn1pTtALkvIgFVefIDorhjIdh+10CkICs55sbkn53NVN1znS1Z8tybuzvU7AnlKXON9CgszMt+PsE9NCiJnkDbQpWBHWRqSn4TMenN8YPckGnEsiPZP8X1syKVAAy8u7W1X3jYleX/uXbBVTrc51XM8igy1xI+w77IzlL1T8PDORKv/fyAh60J9p5UYlnXIIHUieH7OcQpTlhtZtzL4aEzkBkE81+q0zQ6aGdNGJadlU/mwHqbBt2VNgRhpMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YZWTEsOBI3O4NwMkyRUHa58SBz1BZ3S3lL4WqVLHKw=;
 b=lpYiA926ceuXuZxvb7VEpiw8agGdjnruYJ1MpF+w3spxAPP2yfDxQXuP/LEDzuVfRii0I1DyFRm4bkS7JD0ELX7Ss3DE8h6oTjEwNbLupnXeRH3tSmEpPAknCeh+BWbRj8479Si69iOs1cNLnoBsnGChnQb0sljkTpHhZoU+DzTSTB4IvfAu3bjHGGvYV/UAfXc0PrzpmH9/H4jUdeesO1EhzQz2Q2g+5DyQJyA1hiyshkt3HAyKAbh9+gNfAa3mSenvMWXdEQ2ZNGgx6fbOV7FdsdOeWyUqejST+b0nMcbpL6FhA0uSVhbZwHS1ZxOh0i7e6czbk3lR/FNA9/4yJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YZWTEsOBI3O4NwMkyRUHa58SBz1BZ3S3lL4WqVLHKw=;
 b=duQJrz6iU6pOesZNO4lKK6G96DUO16WWJYRC6k2hSOfn2pIBpo0BrVGnN4/GcyxowFCWH89KHnwEZcArIeFPMNyAQt4HW/O+ULI+HdpUBEpeCEzNbXAkkY+JAR6belfeDoqw9BbB6/PWhYWIHmTrUgSqMDKf6cg2+p5TVZ5VXHbn1X+3fM/1xmUc8YaSIIWrcneYF13RvuH4s2zFBMp58/5IvzbzoxcDYbS4De3/BhcLQln6ywb4cOtLHxFpWSgwVUydOlJD0IAIN13hSY87ow5F5DMbbQTYfeDUDghLSR+XDvkfMQZZZwi+GefAkdpkz+v8soylsP1mAF8PU+NB8g==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by SA1PR19MB6599.namprd19.prod.outlook.com (2603:10b6:806:253::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Wed, 8 Jul
 2026 14:02:31 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 14:02:31 +0000
Message-ID:
 <SN7PR19MB6736D59014488112041508E99DFF2@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Wed, 8 Jul 2026 18:02:22 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] Bluetooth: Introduce Qualcomm IPQ5018 IPC based
 HCI driver
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: George Moussalem via B4 Relay
 <devnull+george.moussalem.outlook.com@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20260706-ipq5018-bluetooth-v4-0-350262a30959@outlook.com>
 <20260706-ipq5018-bluetooth-v4-4-350262a30959@outlook.com>
 <CAMRc=Mf3TpJ6hM=LbX6GwztY-rGG66AeGGJ1pxLmWUSSK91Dtw@mail.gmail.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <CAMRc=Mf3TpJ6hM=LbX6GwztY-rGG66AeGGJ1pxLmWUSSK91Dtw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR1P264CA0203.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::18) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <02d534a0-9bba-40b6-94fb-fd9088ea1890@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|SA1PR19MB6599:EE_
X-MS-Office365-Filtering-Correlation-Id: 87818d6b-1efc-4081-438a-08dedcf98d43
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|51005399006|19110799012|41001999006|5072599009|25010399006|8060799015|15080799012|23021999003|24021099003|6090799003|37011999003|12121999013|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TTFyVWliNXl5ZVRmUkNUTGlUSWl3N1I4TTZRVnFHbmUvZVMyWTdoQkZKU0Fa?=
 =?utf-8?B?MCtFblRKb2M3T3BRTzcyRzFVN0xuK2VEWFBTK1htMFZTVTFPL3hhTFpSeFV3?=
 =?utf-8?B?V2V2bmgzU09xSGRiMjUrUjJscmtFdGRnS2dMS21Da1RIN2xVbFhaT0UwQTZP?=
 =?utf-8?B?Y0NXKzNzeUc4YTNlK09vVlNIdnRObXRwSUZMOVdzNFExcUFFSHpVVkZRUlRt?=
 =?utf-8?B?NDRsaXN0M3p5SElwd2tTb25ickZXbG8zNTN4cVBZM2VHQjZ1aS9Xa0QyMjFn?=
 =?utf-8?B?Uzc0Lzg2SUxTcytpaWR1dDNlYzZsVmdsczZHVk9yMi80QlNDNE0zNDN6eEJo?=
 =?utf-8?B?V3loUzd6TGJRZ3BJM0FyUE5HeXJWTmxEVmpWbDYrekl0aDRrbldqMU93VXBC?=
 =?utf-8?B?WFJ1VE1XWkduWnBUaXBaSnpLUnVLRkx0cmRiYkRUMC9hRFBUbmxKbHBJMDhr?=
 =?utf-8?B?cG5iU1hSbm5McmFWRXpuMTdCN1NZUWRRZmJzcXdTcHFZZWIxNTJnZ3BoTkVS?=
 =?utf-8?B?NjN2aUpXakFja2p4REpEeHdRSTJMUGxtOE9PYUl2V29YZWRnRG5BT1RFSFc0?=
 =?utf-8?B?M3dwVlg1Z1Ivb3NyamY1dC9RUUlBUnBvNU9qRjZlbU1TQjgyRFBKNGNJR0dV?=
 =?utf-8?B?QUk2NUJoeTY1M2hpaUFhaFYwaU1Famd4NWNRKzZ5eTRHMzVwY3M3T2ZVdkxF?=
 =?utf-8?B?dFNHUExQZGNja0syeStxSUVCVGlTcUUrTytMMm9MM2RjM3VieW1uNW1qQW8w?=
 =?utf-8?B?NnVCZjBxcVJlVWRDdzJ1UFF6cEZuT2lYbVBtRGU5UnJIWkx6NVFzZUNkNVpF?=
 =?utf-8?B?OWpDSW9iWVU5WExmZkN5dVNBOVJXNThTcWF6eHZoVUJyWlc1bnJVTXIvZ2Qy?=
 =?utf-8?B?Z3NwN1JQRmJhVFZXSmZPbGZCakxZaDlHWUR5VmgzdW9IZ3Y0KzhLd1ZCaml1?=
 =?utf-8?B?c2l2T3RBSmdLWGRHYzIvVUk3NWtyeE9zWVFDK2krOFFaMFpEUExnc1BMNHMr?=
 =?utf-8?B?UHhSWlp0Z0JRMlprZElMTXVxb3VmSnhxc1JJVHhKd09nWUZiKzdrZFIvakhN?=
 =?utf-8?B?N1lEWDRIMHZiQmo2aGF6YTVTbE9yUEhOME9lMjh6SEFEb0pvT1kyeXRnTFcw?=
 =?utf-8?B?Ri80dXVmY3N3N1R3bnFLY3ZPOWllNlE0TmlpNkdvTUFlT1JhL1pveXBZTlEr?=
 =?utf-8?B?eDRTRVNtbkhQZytUbnJzb3NyQVJNQmpWbUM0N09CN3JnbTJPV3BVMW1oZUwr?=
 =?utf-8?B?S2dmK3JUWHVOUU5XM010K1BQV0g5Z3dtU2FRVW5mcnVMNXJIYnROMnBkMWJu?=
 =?utf-8?B?NU5mMUlLVTdyb1pFSTl6S2JGNEZZZEtUZGJyRmJGUDIzTXVjcC9iWUkzSzRF?=
 =?utf-8?B?dFc0R3dCczdUZHVpellrbmpiMHRvclRrT1lOY3QxMU5GT1I3amFBeURDS0hJ?=
 =?utf-8?Q?AKpbRleI?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXo5NXFSK1VIWVJSMi80VW9Ud2tvaDErRGZQRThGeDhadVI5Y0FxNFd0UGZs?=
 =?utf-8?B?WXJDdkllOGc5dXpWdTU3bFRRUjhnNTVqNmZHWjF1U0pTOVR5elVPTjFBWllQ?=
 =?utf-8?B?M0tyUXBERWFqZ2FlTGpyOFNsT3ZSVEFHSUttY0J1WGhESGltbzU2QUU0bFNC?=
 =?utf-8?B?Z2MyWU9RcTF4OU1mZW1iRlhMZVIwU1dib0w3ZFRldXR0WVVNdGxjRW84aE4r?=
 =?utf-8?B?UGxVM25wL2NyV0VuaXd0OXRrTW8yWTFodUtmZ24xbjZhQkFXUzhHNEc5aXIv?=
 =?utf-8?B?SXYzQldWUWVuU1RmdFFhd01UYmovYnFUcndpa1IzTjVZbUpuY2NMdGtob3Vw?=
 =?utf-8?B?b05aL29BdHBJSVNUYjRuMTNOd2JjekY2dE4wRmpFNVNPMllxWVhPQXNncUtB?=
 =?utf-8?B?OTVCWG8zMVRNWDlrTXNmZGhvRlg2cS9odWFBMUdLR2VzRWwzRElMeDhrc3o3?=
 =?utf-8?B?cGpNQVNKSUwrNWRIVXplWHVjbFc3bzlDek1PR3h5TGJSUlAyd0g1NTM2K010?=
 =?utf-8?B?TUVYYjg1Tkg2a252MzVFV3NOTVZSL1pkL2JBMUNqSnJ0cUJOTmF4MkRrbllk?=
 =?utf-8?B?TDAvU0tkd29SZ1NPaXNHR2xPMWZqQWt5cGt3OE1SRS9lVFBpR1J5VFpVaXpG?=
 =?utf-8?B?aFk2KzNLL0FhUjE4ZWR6eWZIRXdhZlRlK2F2SEc3cE5ESncvdTJpYU4xb2VB?=
 =?utf-8?B?Y0NsNVJRbFBhSjVtWXUwY0VQR3NxYTNSazYvYnVvbTJ4UHZxZWhaM3Nmdjda?=
 =?utf-8?B?dWpqclQ4MlVlNndUL2psZ2k4N3BtSy95c1VWcmx1R1FSc3lQZjRZOHp6aklp?=
 =?utf-8?B?TUorRVhPVzdhRmxnNFRYUGZJeG1uQVFSbjErNUpzdUV4Y2xBTmt4K0dEdDln?=
 =?utf-8?B?WEtheG41c2JDbi8wSmlBZ3BHUUlXYmw1R2k2dGZMd0VpQXJpQkkzWG5rY1BE?=
 =?utf-8?B?REkzS1lVcC9Ca2pSTWJRbDNma2FOY2lSYTB5eUE0NnczWmJiRnZ3ZUE1Zzly?=
 =?utf-8?B?RXNIY25sTWpsd3hxL2RsTERQK3pYM0VWeUVHdi9MN0lmbUtOaXUxOE04dnFn?=
 =?utf-8?B?SytVaVQ0WjVHZU42S3hHak9lMkl4TkF5WXgvK0RjU0tkelFrMDExeElwRVA2?=
 =?utf-8?B?Zm04MXlNN0ZsanAzaWl3bTc1Z2ttL0xCQmUyS01CcW41YXFDUUx1TDU0aHZz?=
 =?utf-8?B?c0djOEFzWkVSODlIQk9ZN3NXZDJLRUtzZXllU1poVkNucDRxNU1xT3VVdGFN?=
 =?utf-8?B?NkRvQWVCN0ZGR0NXZDRqUTRKaGJxTE5TdjVaY0drSDI4S1FZb1h4YWRvMFNl?=
 =?utf-8?B?WTMrTW9rTUVaYTlXQkpNTGN2clorUUI4M1JDKzJRVGVNS3RGYTRVb1VGZFMw?=
 =?utf-8?B?RVZvWkxnMkZCMS81ZUZTSHhIb2l2S2hzZ0U2LzJtcUtudFpLS0dGaEd3SUsx?=
 =?utf-8?B?TVpuT281cG53NFZHWVhuR0x0Mk1EMkJxZmwxTmFCT0VwUEZjUThoSXNVSzBW?=
 =?utf-8?B?eTZvQmxPRFY5anRhMjBuaUFCc1E1c3dWRlJpZDZzNU5ZbVpYckpmQ1hERko1?=
 =?utf-8?B?QVhpVWhtbzhsWUtlampBZWlqWFFra1RSbTBXQ1g5Yis0Rm0yaDZyWm95aXl5?=
 =?utf-8?B?V1Z1N3h5QVIvcUJnaDFYMHRPNkFXaE5pVVJ4TmZOQU5KQVozM1ZtRW54ency?=
 =?utf-8?B?K2FHOXZlYjIwdkFBR3RWWlZNa1FjMC91WXp0UHFHTVdTclMxOSsyZkZRcTF3?=
 =?utf-8?B?T1VyTlN1NUhrdHYxUDdrNVZ6cmUvUmRvNDc0aW9Eb2wzVy9XWnlxV3NSR1Iw?=
 =?utf-8?B?amtEdW5zSUZlT3pnbTAyUTlVb2VwSE9UcHVEcmZiblN0MHlvcUtZQzQ0aFky?=
 =?utf-8?B?NWpEYkhrU0hmdUp4Y3RMaURqVnNBbzJTQVN5Z0RudXBZV0E9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87818d6b-1efc-4081-438a-08dedcf98d43
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 14:02:31.7268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB6599
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117647-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:devnull+george.moussalem.outlook.com@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:devnull@kernel.org,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[george.moussalem@outlook.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[george.moussalem@outlook.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,holtmann.org,gmail.com,pengutronix.de];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,george.moussalem.outlook.com,dt];
	DKIM_TRACE(0.00)[outlook.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6D1F772730A

On 7/8/26 16:37, Bartosz Golaszewski wrote:
> On Mon, 6 Jul 2026 19:26:20 +0200, George Moussalem via B4 Relay
> <devnull+george.moussalem.outlook.com@kernel.org> said:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> Add support for the Bluetooth controller found in the IPQ5018 SoC.
>> This driver implements firmware loading and the transport layer between
>> the HCI core and the Bluetooth controller.
>>
>> The firmware is loaded by the host into the dedicated reserved memory
>> carveout and authenticated by TrustZone. A Secure Channel Manager (SCM)
>> call safely brings the peripheral core out of reset.
>>
>> A shared memory ring buffer topology handles runtime data frame
>> transport between the host APSS and the controller.
>>
>> An outgoing APCS IPC bit and an incoming GIC interrupt handle host/guest
>> signaling.
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
> 
> ...
> 
>> +
>> +		/* Check if firmware is split across multiple segment files */
>> +		if (phdr->p_offset > fw->size ||
>> +		    phdr->p_filesz > fw->size - phdr->p_offset) {
>> +			seg_name = kasprintf(GFP_KERNEL, "%.*sb%02d",
>> +					     (int)stem_len, desc->firmware, i);
>> +			if (!seg_name) {
>> +				ret = -ENOMEM;
>> +				goto release_fw;
>> +			}
>> +
>> +			ret = request_firmware(&seg_fw, seg_name,
>> +					       desc->dev);
>> +			if (ret)
>> +				dev_err(desc->dev,
>> +					"Could not find split segment binary: %s\n",
>> +					seg_name);
>> +
>> +			/*
>> +			 * Use the virtual instead of the physical address as
>> +			 * the offset
>> +			 */
>> +			memcpy_toio(desc->mem_region + phdr->p_vaddr, seg_fw->data,
>> +				    phdr->p_filesz);
>> +
>> +			release_firmware(seg_fw);
> 
> I think sashiko is correct pointing out this would be left uninitialized.

yeah, I'm working my way through the issues reported. Will fix this.

> 
> Bart

Best regards,
George


