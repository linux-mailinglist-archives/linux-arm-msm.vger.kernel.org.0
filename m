Return-Path: <linux-arm-msm+bounces-100038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OyhKvrexGnz4gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 08:23:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F0233061E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 08:23:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CC5F3019069
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 07:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11E330CD82;
	Thu, 26 Mar 2026 07:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="ZylcS890";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="QRbAcH07"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223261A6805;
	Thu, 26 Mar 2026 07:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774509496; cv=fail; b=beFo5+YOUOuKAPmyz3vaG5LnGI7sQfs/5h6bmCW+7QcKwuinmCICeLfRBmGm7dAwtwvaCQV8s7sZr9KfNj74BTKzibAIgsDKWw3DQKRuroohVhR83WsdzsUGmoJQ3h/Tfow+6e+4kUMpPE7oolJFXmgQks+c66oXg1z7eMPHnlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774509496; c=relaxed/simple;
	bh=P+66VjZB4wUi1VZNX0NNVaLJcyhoiK9zb8ldIv9RhK4=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=gqqEvd0ItwSZCcgWGe+VjseCrezJH7bywvlIluT4x/9j1A2YhI3uXc3UyZ/XLOZvB6/AMDsg6Lpw/Ps2CHIdW9RBtHCPUADCe5sqYwrSi5fknMnHqsOS3VuNbtr/rhcBJQaRU5VntgqyTu0twUBGrO5KBaRJ5eWOEztwunTPg/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=ZylcS890; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=QRbAcH07; arc=fail smtp.client-ip=205.220.184.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q6BktW3770347;
	Thu, 26 Mar 2026 08:18:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=270620241; bh=eaHbRQbtNjbMio9b/CV/qW
	FKnQMkJLqJC8XHPjBABUk=; b=ZylcS890xLmekTlnxnQ7iP+O/QnuB6mJ+oiq2H
	eb5m0Pbc4RZFYi1N7AnFxYcR0zNNqS8R9cVT8irpUT/reyI2DwDNnh42xVmpz4v0
	GAUJVCii/D7pqBuG9JIP5qVE1psRU/kT46Ca8oRA+AEvGWRnY9g0OVeYIKkofpdp
	K6JEVVqck7ZWuUSZwu4q9+p9ispUVq4qn5y9X2TQVTMmpGqDKdewBPU3Coe90OwN
	nj9d1ipef0UGbL06kZIb1nErQ7z0oDJ1cm1/vjqXe5Jl3S/df6vqk0yBXHAA3JBR
	xR8vwqb0egpj+N7B3gQ2XTFPkDHpoDSPyR38rZAoZ3ff9j2Q==
Received: from mrwpr03cu001.outbound.protection.outlook.com (mail-francesouthazon11021084.outbound.protection.outlook.com [40.107.130.84])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4d1gjdd2q7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Mar 2026 08:18:01 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hKodsCBsH+icinzqq6q/LAT4Y6wjstQ2KcYRXvTHlhYwGk/FIsa5rtU939T+yqkOJM3d5qlozHotRRx0Yv+ORUUAY7GoRfEnrbIIR0HjEgwe4LYujdQQ48iDSbbSGx4P/ArXfSU5rq//p9jBy13ZeCiMoN5aHIJmPpA4Fr1gRHB2GG9biMV/wJjyGi5zBmWfSOMsdp5PRh5whnkklnQc+9MaKQ7SvBqZI/bZ1ESEsPz8AAgTfm7qpnUTdBYfZqUCZMu6BgMHGjIh5w0ZBbuYhI+QSV6CfOQAGNcVhZspT2dIjnuAdsYurH9jSOaw2/ZPSDHCJ6oPTh3dbBfV+d0OuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eaHbRQbtNjbMio9b/CV/qWFKnQMkJLqJC8XHPjBABUk=;
 b=GW5fEfvti/p1I989wX4+6eYfmgRUdvyc4ydTY0vdv/SsVYFZ7OInnOlGCV4k81/z4dL5cmArKKVvwdHmKPkhC0P+QmfvBggSwKIH+1d5ikz637gK17WYJMkygysDClSbCc2hvDyeYBeLusSbT/EArPCvQSwrCTVD2tp1edugdraoosEkmnBT2cEivjFjIZlkSYAGfEelAZEl1CoR5IupsroebSXsK3kj5VJYT5fiF/OMFLYkXy7PcIz4Q7m09v2eE6sjBoJO1qiYZzHOhT3xqv8CaTwx/8VaLlpLzpB6A4KvxZBgCProUz6k5kjIqY9yldaR1mlwPe672H5j42lTDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eaHbRQbtNjbMio9b/CV/qWFKnQMkJLqJC8XHPjBABUk=;
 b=QRbAcH07A1Cn4Ok7rEOGzQu4DMcgdlV0mU+JQe6lzoZZqM4r531A9uK4kCeC/BbMd1v+fmP39MFIVguvvQAidWrXZbTqexiSggHQwRJ1kpDed9rjv0fGdsx3584ZxV6GluT2nXr0h7AsFunQIJlcdU+NovS5USxx7WIwv1z45AQ=
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5e2::11)
 by VI0P192MB3127.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:2d7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.21; Thu, 26 Mar
 2026 07:17:58 +0000
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b]) by DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b%5]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 07:17:58 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Date: Thu, 26 Mar 2026 08:17:52 +0100
Subject: [PATCH net-next v3] net: qrtr: fix endian handling of confirm_rx
 field
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260326-b4-qrtr-fix-confirm_rx-on-big-endian-v3-1-9ea3c855ce39@westermo.com>
X-B4-Tracking: v=1; b=H4sIAKDdxGkC/5WNQQ6CMBBFr2Jm7Rhsoagr72GIoTCFWdDqtEEM4
 e423MDly/v5b4VIwhThdlhBaObIwWfQxwN0Y+sHQu4zgyqUKbQq0Zb4liToeMEueMcyPWXB4NH
 ygOR7bj0SKXs1uu6VqSBfvYTyfs88wFNCT0uCJpuRYwry3fuz2v1/qVnhGU1dOqtdeTGVvX8oJ
 pIpnLowQbNt2w8bXoK35QAAAA==
To: Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-ClientProxiedBy: GVZP280CA0011.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:272::16) To DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:5e2::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P192MB3090:EE_|VI0P192MB3127:EE_
X-MS-Office365-Filtering-Correlation-Id: e91562e3-8303-4064-d159-08de8b07cee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	GtIInYdta0R0WD7AcApaKD9N9l2qgJ15pGlA2K29/Ny5aCxOzLBtxMQj124LKYTsGpmfI4PLjmuaDdcILC0rm3kxAUc95Yg69fFTELvUS9W3TdC5yWLC6qw7MOcm5qqmakmOPaNhzVEAbhvNtwHgA8dIa4VjPq2gZnZSZg8z1hYmKkluJIuJZ2+VcIsxwNpbvaaFqEMZ4oqYQyA5pIMkNTKK4WyCwi+TW7KqWEbCAjBkK+uKsRd8nL5gVurKDy85kDAmw/Va6lsLCkOE/qX8lLvmvmnikUCN+6pTrAEvCk5WTMzoqQdaM58+Tx+xv8buROy6XD6LRmxCCgywz9LfqBtngAgmD354ayknt8J6y5Z5CWO9TRWFAVeUdwfGKSJDvpQ3zCNBioPzjuF3J84ZPFTjikHIFJXXPLTQemtxRCBJVDyxMQumLYl3mX6EQV1o+3b4MMXHy6Ny8CyilN7v6TXkE7Sd6YgXDVJLfGGRLsYailSWm33xioX22bbpTd/1VHBh5jfGnFHE8mXwc2xXlf3IAuJqwcojXCWBaCXiRRKwaenqOkgyPwgHlkriIMDWony6GHXbQiezg0g3PN5y/VDA/EjbifrCIDm6AjHzqqD/WpAsF7S+O4b+vXeFL3zLiE+YGD+qcgxxXC7OJ/RZvEsyy+wbnDCW3E15BfiTgPFMVpI5kYiv3YJUNnD63+eWW7aSVnl8yef3J5Sz/V2jW9iTOAcLU/IX2S4s/zWyE8Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P192MB3090.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejVDLzF1Qnc5QXo5NVpmMzNOb00wc2JnRklDc3JGeXJ6cHFtS0cxamZGYWFk?=
 =?utf-8?B?dmhmbHFUcXBxUzQ5cW00Ui9mb1oxQkdlNnQxN2hBa01FYXY1WEVBeG5tVTA3?=
 =?utf-8?B?WG1LVlJYNlAzL0dPN3ZDUVZLUzY4OFpSTjJ6ZHJ0UFBtbG5vR0lnczJRbGha?=
 =?utf-8?B?RWsxQmdzZWpsWFFoUi93RUJHaFJkNzM2dE5SSStub1JnaXYyYmJQWFF1ckQz?=
 =?utf-8?B?Nmd0alYwcmc5U3JIOWRzVnliS3FQSkpiVEVZL0JPL1IyZm0zRXZ0VDB3TC9S?=
 =?utf-8?B?K3UydVJoRjNZTHhzZk1DeG01VjVLNTA3N2tMV1JOdUFFUC9FRnZjOWg4aTFS?=
 =?utf-8?B?NmtVQ29nczFFZDkrb1pNMG5DSk82TElJV29zditnaGFrdXJnUHBOczFsaDBU?=
 =?utf-8?B?bXZWb1EzYmE4eHlMRDArNHkxNDRnck95T1dTQjlWSE11VGYvVTNHbFQ5cXhs?=
 =?utf-8?B?REVQMVNwQzI5eTg1S013cFZlZ2hkeU9aVmNCUVkwbXY2ZHg1eUJKNXNrdFIw?=
 =?utf-8?B?OE9oeTF4cVJBMFNlT2RjVXlPT1FtaWJkTStyUlplMlo5SCt5MUQ4d1ZxczVk?=
 =?utf-8?B?dXQybjdTd0FJVEdNODVyenZncWxuQTFzMVBjekNFb3NHMnBSMUY3Ym54aXdZ?=
 =?utf-8?B?VWJhZWNqWmYxSDNUUE44ZWh2czVMN1AzbE5qZDNSMmZKOHR0cUorYVhQZUtj?=
 =?utf-8?B?bGlBMHhVakFNdVl0akYzK3J5QmNGS0dxd0lld05UUFRBdUF6UVVJWmJ2dXZ4?=
 =?utf-8?B?R1YzNDZuc3ZSL29YYXhzc1VpNTZlZXNOQlhEbUd0NlVlaXNlSUllODRYVmdz?=
 =?utf-8?B?cXhKR0VoMEhFRFcvZ3lYMFUxbkZES1RvV2hXREhaeEVUU0Mrb05Vc1hrK01X?=
 =?utf-8?B?ZGIvbTg3OHN4eEVDTkcwa3hOTEgvMlRadXhFSmhwWXp2cUhEVnVXTVU2amVG?=
 =?utf-8?B?TzdDRXBOYVprUkNzQ1Q3UTJ0ZVViUHFpcUNPS3ZNUEdLUU9LT3N3c3o0cStG?=
 =?utf-8?B?WXFsRjNMMU5JK3NCaGsyOTR6b01HSkVlZGVZK3kwRUpuZk8wTS9lOVhOU0ZF?=
 =?utf-8?B?aS9ZZ29lcW5mRlRCRVZwT1dVQk5VMXI5dzl2NzJSQUwyUUFYRUdtbTM1SUYy?=
 =?utf-8?B?MExqaEE3eVlJL0JIb0ZaSkg5d1lJU3Vhc0hkZFVRUENZSzNPWER0RUV2QUVY?=
 =?utf-8?B?UlNBOVlCT0U5bGtXSDc2UDJJUnJBK3lOYi95d3NKbDJoNE50cHA2SEpyTjRQ?=
 =?utf-8?B?ZFh5VVRpWVUyazUwNENhblAwNEtnQkFsT3dzekMxc3BpOEtabXlLcExhRGdx?=
 =?utf-8?B?YnZBcENNeFg2ZlBvVGk2UXM1QTVZanhYSk01RzVteHM3cXdod3RmNlB5dStX?=
 =?utf-8?B?NmI0WFRTY0Yxamp6RVpxbTZCTW0xWUxxajQ4ZGdVSmxXb2lLajJ2Sko2Z3E5?=
 =?utf-8?B?VDJEL0hRL3JxUE9lZmpZMGlVODNmZStITEFjT0hJdk9PelVVcml2Q3c1NFps?=
 =?utf-8?B?ZXVJODh2MS9RWDRwTWNnWFAzUVZyV3hjZUxWWjN0SWZxV0VkQ0xOTjZ4Q2Jx?=
 =?utf-8?B?NUY5eTM0VGZDWEdKZWFXS1VwM3dZTnp2SE55aVRjRGV4TmhEc1lFWm9hTDZR?=
 =?utf-8?B?eFdnc200YStTcWQwRS9KdGRPTkpTU1YwdGlJSld2dGZvNEFJYXV4YTAwVk5i?=
 =?utf-8?B?S0RwbkI3UGx4Vk92ekJGV1FhVjdSZ0VvYllFN3BsYjRLcWNYclJiMWVOOXpu?=
 =?utf-8?B?OUdzRnJVeDFKQzJVbDI0WEEyYmFTQllTaE4vUXZjbEIrQVZuRHpuSEFoaHhn?=
 =?utf-8?B?UWt3MU1vVTBYS29ldVFQQllDN0x2N1pkWEtHMjQ1aDVaS242Z3NUci9heXlz?=
 =?utf-8?B?VGJZVmdoRytxQ00rZkNyWDJUNGNFSWpuSmJrRVhOSTlTUjNQbXF4YnJhVElp?=
 =?utf-8?B?bjJuSXdOVUd0TlN2VUFKWDV0a3QxUkVtOWNjU2Z5UjhIL1lmbm1vUGxwTzBI?=
 =?utf-8?B?ZXJycFE0dDBMOVYxQXV0YzEwRjFYSFJlcEg0WkUxTWJKOUVtQ2kxMGtldVd2?=
 =?utf-8?B?U00yNURrTGJBRzkyM0hHbUpnWjNYclo5cTd2aXRCd3V0ckNCcW14N3h1SHNY?=
 =?utf-8?B?MnczeisrU09ldVJ3dWpPOEtFUkVmbzJkWGNFYkEvQTdXK0txVHpiMDhvampS?=
 =?utf-8?B?SU5PWGVjQWM5WTZJUDd6VC8wRndreVlpek40eDRhTnNHR2gycTg3OVFCZ3dq?=
 =?utf-8?B?TmhSZ0xHdFg1T2hKYmJKVWN1aloweW14T1dJTEVmYWkreng0RHVFNXRVWXdC?=
 =?utf-8?B?MDlBcmhCRE1hU3Q4cnhzcUMwT2ZHWENvdFZKNW5BMEFCMjhVZ0RhZz09?=
X-Exchange-RoutingPolicyChecked:
	t74ESJj5KRpwqWgaI1nlT7JfLoB+/h9naryaUmjq8/x9Y8nkotybvUbNnwZYWKpfG1vxJMXDlhpMUkWvNFvlMqveoqpRYl4z30XDLcpZpRm7DqRZ1pa/JSy6AFZg1q7Pk9zheRU8MZEE/QRXxJveHfOHehj3mz6gA1cYWY4HCX/kx+hWKmz0gAVTH/fj28BE5L6kbmrPTUOY80rwcZN/9tlRszBUTEuH4B2BzODPU0o10swCZrDSqkYxCz1MWsufmc+7wo2j2Hi4wJTWWQX6QLqNfaiT/Ky36pOuW2CYdIUxINnewtnfz1qyxQNk6hKeYzF0WK/KJA6XcrA68GA06Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4VO7xXJ/nw6hJqOHthOPjOx+xaVGNuJiS23YQChPww+MSApq2YH/6qclFzi9gezgmx4F2au78guuZVSxV0UR7QTOIL7xJ39ohyUOKmimrXdDPh2hVMFrRXT24cfXgbf6TpF2B8TSH+FR+6FOy2zpcr65WXpYFZmfzx3rE54k9RmqxM4R8oDJ9JqxYPnuczvjfxFabqAB/4OcBhgv99//hx/KqHS6KdjDHnM0nGEQOHwV54wanFKJMnXj+RYErri46PHiKOBS16+zNHCHCQaNGzwGYBMSgBnODijnttfJGguxp2RtkZmIKUBk1TTiZnwIF4a9xbofy+giC22lwxMy4Mzy+WjJNf4FCjcTo9KFwoh56skM9Qcs0mhegfGbjfonqAoAb5ybE+7e/sxbFuLezcJaxym+Qn0h4VSfgJkVvmMSpaHpHaTvH+PXbmgN5uy4uPp5BOsS3IRxPOn39QgTd+7OlwuuPkgw6qPCAxhTB6y+Ch/w4hyuk3jprpftVuTgLtzA+FiN+ihc9Iw6vP+3bOOTJh+MqqYxUfRom2fQlQwZfYsJFeRo/A89KoyyMks4BQMZ7A+pRIiEWp+kX0bjRX2tK86dhoPVv1OQ+9ELLHjR/8uUyaFshnpn83hDTqkP
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e91562e3-8303-4064-d159-08de8b07cee5
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:17:58.6501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: koLtEQkjQVvsnXNVJ/3ioIfQSN7e4Ok2AMyk5npUlP3wRIzPjZhm9HkQEWR/Z7E1HJUMhvQnJZcDlqZW1UvWAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P192MB3127
X-MS-Exchange-CrossPremises-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 14
X-MS-Exchange-CrossPremises-Mapi-Admin-Submission:
X-MS-Exchange-CrossPremises-MessageSource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-OriginalClientIPAddress: 104.151.95.196
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-Antispam-ScanContext:
	DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-Processed-By-Journaling: Journal Agent
X-OrganizationHeadersPreserved: VI0P192MB3127.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA1MyBTYWx0ZWRfX/qxSzdGRtzOL
 lf1TSR818KTSbPEObSIz8Tpt6Z96JSTQF4KNEJB+R6Vg5HQJitn9ugN0C1/R6UB3UZNlSJaK3Jb
 1EWwx7LsIJydTcOzLNRcbRcKLn5iswvibMugk2/YmSn61IAB69q9AeDeNTDCjphERZG2vSbOhln
 lCVVZ1I2ff3kRwoF3BNXOmacbHIXoUkA0qNz1CEpdZS4ujaD9Q2ffonjvXHDpNp2suenZ1IaoeP
 ssbWW4rMva4eKwSJCgVUPSZNQbuBr/MgkxZVyr5hby1i5Ffy8/c4Typ9ZD1I0yYr0XkRw9fK7E7
 Ogak2+vMLTbS22E5yD0hW/Ujr0Gg/yeD50fvFIiPzrHQWRZ3dEQK1sZdW490tkYi4zfLbYzF11h
 aRNLC4eNpYmX7PHFUnV/xSfSU4Qj8HGQmUVLRA/5Pz6uliyTbJoTy/UZR7jxpqC8hXC5qn+H5O8
 IniWADN1Jbw+XOx7SKw==
X-Authority-Analysis: v=2.4 cv=G6YR0tk5 c=1 sm=1 tr=0 ts=69c4dda9 cx=c_pps
 a=fbPVt1xG9+UdfIHa6CgIsQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tr3XZvuDWTETL0Uaxejn:22 a=8ys4xmT3Mru1TjC2zVq1:22
 a=VwQbUJbxAAAA:8 a=N9GNhs4bAAAA:8 a=DLFHCGdtuXt7S8B3h2wA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-GUID: tQGUN2gQpROKljQuhU2NEbTLr1zNdy24
X-Proofpoint-ORIG-GUID: tQGUN2gQpROKljQuhU2NEbTLr1zNdy24
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[westermo.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[westermo.com:s=270620241,beijerelectronicsab.onmicrosoft.com:s=selector1-beijerelectronicsab-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100038-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[westermo.com:+,beijerelectronicsab.onmicrosoft.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[beijerelectronicsab.onmicrosoft.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.wilhelm@westermo.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 51F0233061E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert confirm_rx to little endian when enqueueing and convert it back on
receive. This fixes control flow on big endian hosts, little endian is
unaffected.

On transmit, store confirm_rx as __le32 using cpu_to_le32(). On receive,
apply le32_to_cpu() before using the value. !! ensures the value is 0 or 1
in native endianness, so the conversion isn’t strictly required here, but
it is kept for consistency and clarity.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
---
Changes in v3:
- Rebase on latest net-next tree
- Remove "Fixes" tag
- Link to v2: https://lore.kernel.org/r/20260324-b4-qrtr-fix-confirm_rx-on-big-endian-v2-1-674fb3f4865b@westermo.com

Changes in v2:
- Rebase on latest net tree
- Improve commit message
- Link to v1: https://lore.kernel.org/r/20260320-qrtr-fix-confirm_rx-on-big-endian-v1-1-e1a337dc1a38@westermo.com
---
 net/qrtr/af_qrtr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index 55fd2dd37588..bea1f1720e7f 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -365,7 +365,7 @@ static int qrtr_node_enqueue(struct qrtr_node *node, struct sk_buff *skb,
 	}
 
 	hdr->size = cpu_to_le32(len);
-	hdr->confirm_rx = !!confirm_rx;
+	hdr->confirm_rx = cpu_to_le32(!!confirm_rx);
 
 	rc = skb_put_padto(skb, ALIGN(len, 4) + sizeof(*hdr));
 
@@ -466,7 +466,7 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 		cb->type = le32_to_cpu(v1->type);
 		cb->src_node = le32_to_cpu(v1->src_node_id);
 		cb->src_port = le32_to_cpu(v1->src_port_id);
-		cb->confirm_rx = !!v1->confirm_rx;
+		cb->confirm_rx = !!le32_to_cpu(v1->confirm_rx);
 		cb->dst_node = le32_to_cpu(v1->dst_node_id);
 		cb->dst_port = le32_to_cpu(v1->dst_port_id);
 

---
base-commit: d1e59a46973719e458bec78d00dd767d7a7ba71f
change-id: 20260324-b4-qrtr-fix-confirm_rx-on-big-endian-ee2b9637d265

Best regards,
-- 
Alexander Wilhelm <alexander.wilhelm@westermo.com>


