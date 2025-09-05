Return-Path: <linux-arm-msm+bounces-72351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC45FB45FD3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 19:19:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98FB21B224C5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 17:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C09D259C83;
	Fri,  5 Sep 2025 17:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b="jPEvI/QM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b="WIIFsYsj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail1.bemta40.messagelabs.com (mail1.bemta40.messagelabs.com [67.219.247.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C4821ADCB;
	Fri,  5 Sep 2025 17:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.219.247.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757092758; cv=fail; b=a2eH8pOsdTtMAfgDjiXf624e2G9iTkH4CKLUpLkTNVjiNbWEuwCDZEQFIoN2wrR1BVrHeid0QeXN+dT3jX45NpDnBXDrMfFoPxX8MJDayZMDENZU9pWq+yhfKWCDinTnJrKnEL4TiTeQlmbwczTJrCC4BaZbmdK5wJl5rUAFIgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757092758; c=relaxed/simple;
	bh=Ar1eqVuEH5VNN+ld+/+OG+mK3T27IxSiu8YvAwOYbVM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XZaPiu0SUMVg+S4k9TpvFBFgDfRfqwWaE1x4voxN3bC3BubTl+cssrNu2d0wk5Fv/VZbKD3dXLImT3NtvS5tA/hQwbQIvVP9H2Xne//HFTQCUQZk/xxpaJm7bb5VkYWOIL8uojhqN0vi+qoSjXykYq7/d/q8+n9HFGvrVKy3zBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com; spf=pass smtp.mailfrom=semtech.com; dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b=jPEvI/QM; dkim=fail (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b=WIIFsYsj reason="signature verification failed"; arc=fail smtp.client-ip=67.219.247.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=semtech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semtech.com; s=k1;
	t=1757092754; i=@semtech.com;
	bh=Ar1eqVuEH5VNN+ld+/+OG+mK3T27IxSiu8YvAwOYbVM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=jPEvI/QM2K2Mo2T3U2aOjGiNkYsDqZyB0D97Y10IZAinOToTi3maC5ZJ3tzL/XVHq
	 xDBhyH4cFe/go4WI44g7+PBHiK4b8LFrzGwT0Vu02SgBfuUJJowJ3jqJUFQfjBNjux
	 CWDkCXcV2qkouFv1AcbyMIyBCrbb9bLavJBK5Egy4+ufACugYxGP6sbJlW8qW/51QF
	 zew/vtElbkcU2XtyQrRBErked/U5bulrZej5L9Rok1uuTHtNIZ+mVostf+It3IuzKR
	 2S8Wn0c456JSSvpmAIU4W1Nzxe17t7SIedt7rjKt2fiqRl7PhdbcdmYuXpDoQ0SFQZ
	 RBGOXfnG+MwhQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSfUwbZRzHeXrX46hUjxbKs2PD0DDFl5ZiMm3
  UP4aurE4dSIwiycKOcbSnbSF3hbTqJmgY481QWVYgsDmYw1VeXEeA8TI3BJVVZQHZJnMvaEOg
  kY1Jlawis9eDTf/7/n6f7/N7vs+TH47IrmEkTtusNGuhTEpMgia9k2NWOeIGjJr++Ye0ns+Gx
  dqeS4uIdvJQPap1fPVDuHayvwnTnl10AW3N7ROYtvVbB9DWrThFWyP0blcFpu8uW0X0c6cagP
  6s7x+gdwzu0y+54zOwbDFjyS2w7RYbTwbq0cJOpe3cnB8rAf6ESiDBAXEcgU0t9UAoWsXwtHt
  FLBSnANzfVBoiKNGLwKlfukJERhwVwVFfz1pxDcDT19uCtggcIxJgmd8j4nU08QR03j0j4k0I
  EUBg88AnCA/khA7Odu0PrwR40JQGLx3YKchn4ffO93kHSiTCutovxbyWErtgVVudiLfICBv0D
  Efx7QhiJ1xw/ITxGhAKuHy+PXQrQsTCae+RkIYEAY8NjiOCjoHzv62KBX8R9MwvoEJ/E5w4Ug
  UEnQqdvhtr/Vdh9911HQ9dNTNr+mF4qOVWKDwMZii9vZF/ICSuyOHYn0tiobgKoHd0BhMOaOD
  hv0YwAVyOhpNXvRh/GiEeg139ybXgycb/5G68T4R2AjxYNRPeGPqJKDjW4EU/BagLbOFotphm
  VSkp6lyWMRitZooxqal3VbnqIk5FU5w1RW3YU6imOU7N2c17THlqC211g+CqSRazWvuA/7uPk
  ofBBlykjJEmyweMsgdzC/LsRooz5rBFJpobBhtxXAmlBBlkUSxtoG35jCm4sOsY4pHKaOny0X
  6jTMoVUmaOMQjoPFDhy+fGhhAZaimw0GSsNJWfQfAmY5Hl3oj1tZ8Am0i5FISFhckiC2nWzFj
  /z30gFgdKufQtfkokY7Heu8kXDCEKhtjm7eVDWKn7iCwR2W0l9uWAYS76GZRr06Wwz194O30q
  e/rgB8yLGlBFVt9kjWc0bzy6ypTt2Kb8MX9zQUfPluMK6Yk+i0FD+tOrk/7uGB3rXToQM5jud
  wZe2V6p2LX9m9qMoTfb983+Xkc1g0TsWHWmjqwMpA5WbJ5e9u5VzIsnih946jC2UNSgY/Vphh
  pn+od06eTLlfE5acVLc+UVnZqsl5iyzIsXdHnezKGEcU1On0vNWG7EKj2S6aSL5RNfZ2hWxr9
  o2j1weVZWbpoacf9Mvh75a1xcp+SRk+Sd90Y7fIoNNzN25IP25zr33onque78AwOJaVuftr8W
  f2XExXzc/MItqrvFl5X9uRLljFTK4wjLUf8C4OyQtHEEAAA=
X-Env-Sender: zxue@semtech.com
X-Msg-Ref: server-21.tower-929.messagelabs.com!1757092751!33122!1
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received:
X-StarScan-Version: 9.118.3; banners=semtech.com,-,-
X-VirusChecked: Checked
Received: (qmail 31807 invoked from network); 5 Sep 2025 17:19:11 -0000
Received: from mail-dm3nam02on2109.outbound.protection.outlook.com (HELO NAM02-DM3-obe.outbound.protection.outlook.com) (40.107.95.109)
  by server-21.tower-929.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Sep 2025 17:19:11 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vfgQWhgv/LVzF7/GIV9MGGlpVEIGPNm2g4h40a84DpzTTElZBqR0Fdvzgu+i1PPBQkIPZ2TLUWalpb/+2Sq3sL+1T3w+v5ny860aZtEn056AE6pQ4UmC3Mh7i3B7uE4cr0i5noxOMTe6RGUz0d7ZQxcZtY2EUMxg+1m4fzsmDCygEQ17xpHkEOcQMPS0zngxJLXbTpyYk3j3MlMut+N80fkOG7vioeOBbLtgTgdZgGy1WnrSSCu66wwePBRB4ueLDOKJ6CJVYuQXwHZ+y/VxrFN2W54ndl9estjGWs4Xwyu0oM6dJ9aZfTOAhEUrfDM1h0j92uJZeOc5p1x1Tt2i6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qkwtkyB/SvLuTxoHrlkc5I+G1eQNHxfBd4wTdvdbjc=;
 b=jsHWxzxV98cuY417ynxK4VezlVZMKUa/NDNTVuM2n1kKwfcFN2idv41O87SedkzGoDdBVavsvKJF55tqtLBDZdH/ylsSVVXmg8+8MV6xoCN5CzIiLkf8CFN3fRNB/cWmdf70hSZw1U/KktOpcUonipmW1fwya+BvThREx/ZlateQckpQE334WX8tpba5L2Audl/7ExZQ/66+8dTFeNt3N0hRJsGHjtnsQ5j/r+uE0uRqkG0CbbcEWooytbDd2UxaRhtS91ZDZKQ8ytOIJeGd5I4b0gfb8Vj/3UbvRoTmuY8Wrd45W6nP4RNFCJnSQoUsdOX4kOkHDGERC60+ZDWVXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=semtech.com; dmarc=pass action=none header.from=semtech.com;
 dkim=pass header.d=semtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=SemtechCorp.onmicrosoft.com; s=selector1-SemtechCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qkwtkyB/SvLuTxoHrlkc5I+G1eQNHxfBd4wTdvdbjc=;
 b=WIIFsYsj/IJXnQbFqEunTSsjrQcTvAMfCxDzc5DEgnWeiHWFRl70DYrzbV1sWxFHfV2mRPGpjGD2Go/p7xYwQiiqOJDFcfmJSNzIIqT7ojw5Fx/LmCFMwoAx5jGvTgE2m7I6A8C0CZPRcQoebBiXeQDtDKNIkHS9CCNQc8X5uTc=
Received: from CY5PR20MB4867.namprd20.prod.outlook.com (2603:10b6:930:21::18)
 by DS5PPF77BA5F823.namprd20.prod.outlook.com (2603:10b6:f:fc00::818) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.29; Fri, 5 Sep
 2025 17:19:05 +0000
Received: from CY5PR20MB4867.namprd20.prod.outlook.com
 ([fe80::1107:de62:e17d:a1de]) by CY5PR20MB4867.namprd20.prod.outlook.com
 ([fe80::1107:de62:e17d:a1de%3]) with mapi id 15.20.9094.017; Fri, 5 Sep 2025
 17:19:05 +0000
From: Adam Xue <zxue@semtech.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: "jeff.hugo@oss.qualcomm.com" <jeff.hugo@oss.qualcomm.com>,
	"quic_yabdulra@quicinc.com" <quic_yabdulra@quicinc.com>, "chentao@kylinos.cn"
	<chentao@kylinos.cn>, "quic_mattleun@quicinc.com"
	<quic_mattleun@quicinc.com>, "krishna.chundru@oss.qualcomm.com"
	<krishna.chundru@oss.qualcomm.com>, "mhi@lists.linux.dev"
	<mhi@lists.linux.dev>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Iulian Mocanu <imocanu@semtech.com>
Subject: RE: [PATCH v3] Fix potential kernel panic by calling dev_err
Thread-Topic: [PATCH v3] Fix potential kernel panic by calling dev_err
Thread-Index: AQHcHcrXVT8vieDPcE+KjJsklwiUvbSEzWIAgAAIc/A=
Date: Fri, 5 Sep 2025 17:19:04 +0000
Message-ID:
 <CY5PR20MB4867370342138E3BE5319CD3C603A@CY5PR20MB4867.namprd20.prod.outlook.com>
References: <20250904183405.32986-1-zxue@semtech.com>
 <6lge6p5e3ulcy5pbencvhjfhcwrfsptvclxyu53z3t7anwyrj6@bxbidmvaiql5>
In-Reply-To: <6lge6p5e3ulcy5pbencvhjfhcwrfsptvclxyu53z3t7anwyrj6@bxbidmvaiql5>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR20MB4867:EE_|DS5PPF77BA5F823:EE_
x-ms-office365-filtering-correlation-id: 5421789c-be4d-4b5c-0864-08ddeca050cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VmRzaWM3c0VSRll3eWt4dExsajBFL1BOZEhBNWZMQUsvYkZCR3dIbnJDTldo?=
 =?utf-8?B?VHg3TWhwQU5xeWV5RG05a2N3NTIzQlp2VzN4M0s3Tm9xQ2hIT1YwR2c4QXQ1?=
 =?utf-8?B?OUlyaWFhTTdwTy90VVNYMUZmdC8yZDFkRUg0czdhdXNYbzY0OW55MVp6L0lo?=
 =?utf-8?B?QTh5WFhzYkNQL0x0cUN3MTZSWnhCU2taTkxpM3hyY1VKc1Flbnptc01KSGp3?=
 =?utf-8?B?OGxXODF3NElBR2lYRGJaQkN6Q0F3RGsxVzJDMG4vNTV3MnBaRTNERkIxZnZ6?=
 =?utf-8?B?YVJzQStORXpuVk0rczQ0YlU2anRaSkdpajJEQ2RiS29iNGdoVmFYS3htZ0ZP?=
 =?utf-8?B?ZEZPc2N6MzNjR09vdDZDMEVhZnMwS0lKZlZFUmdhQjUvYlpjM2xxNmdaUm1W?=
 =?utf-8?B?aUVNc2NRSndQN1Y2Zlk1Y2lWUWp6RmdnOFJjUkVlSTM2WmxIWEtrNmE2TnhF?=
 =?utf-8?B?eFRhV1dsNlJTRXpYUU1rdVllREFNaE1XVEdtRG1kVzM1aDFRK0tTV2dyaW5s?=
 =?utf-8?B?dXRVMkpSeHZaMEFNVHNFRFk4SUJ1TmhkM3pucEx6UU4yWjI3RXFxczZTWGk0?=
 =?utf-8?B?amtTYU9UTkY2QTMxY2QvMWtCNUxKOFgrbkNKZGRnZzZPTDYzUGtpOTI1RXRM?=
 =?utf-8?B?N2NWSThWRVN6UGYycno4V0JXaXVRMFhtOVF3UlpOV1VNRndqNmNyR1dUcExy?=
 =?utf-8?B?T2pKV2dqSlUzS0JTUGExSklKMUxoTjhoMGloN0Yxd0VhWVQxeXFpdVY3Mk9Y?=
 =?utf-8?B?bjk1cndMV2l0T1lVTEp5QUtTMjJnRGh5UFpzczVGdjQrNGNxcEJzdXl1Q1Nz?=
 =?utf-8?B?RWZOR3d4WDdjdGJFdHh2ZnkvV3NkVXNIRWtnT0lJRkxNckVndUFURmh1aUd5?=
 =?utf-8?B?MlpKc1BJK2lqcHNaVlM1OTRUa2lWa1FTVnlVS2ZSRUZLbDFPRldwRUJzeFlt?=
 =?utf-8?B?akVJenU4OUhtcU9NT1dxckdyVEE0QjM4bUo0RzltV3kvQmM4cXRWNzFiYlh3?=
 =?utf-8?B?c3dIMzY1V0tnYW9zbW94UHJsWUlQQ242cFpFOWZVcjBrUk9WeXVPT1J0dDBK?=
 =?utf-8?B?RituRlFaTGNkM2FYMGh6OERWMXBVUkRaeWVMczROb2NEVlA2OWtOZ0xDVkla?=
 =?utf-8?B?NTVpcllTT2xTYWVyeDF0L3Q3M2xnWnRRYUR4NnpOSTdFRGlVYlBvamZYRzNL?=
 =?utf-8?B?aEQ5Y1g4dDU4N29HZHp5TGw4aTNXd1dWaXQ2YWdYbWhKMkdlNG5MSDZNZXZL?=
 =?utf-8?B?QkQyYlA0R2RjOWJ0cHdhL0dTY1krb2l4dFBWTXlvWWVNNFZnczhyeDIrS05N?=
 =?utf-8?B?RWpOaGNWMThRQm4vcHlMTDZyVk1obk90clo1ejdzd0JGaHpabElUMXdDQmRV?=
 =?utf-8?B?dmN5SzhJemNWMEs2WlBJNU9lUTVienJaWTNncEMxb3ZUR2I3M2RHSnNDUnow?=
 =?utf-8?B?amdVSTJkWklzek5HS3VzNFJITGdZTUpxd1Fjeld3V2xpL2tFMzVqaGljL3BJ?=
 =?utf-8?B?aDkrNHlvSFhDaUJlNTVYNDBIQ1FmM0xlYkxDT3h0RU9laUUwY3Fmd1E0c2ht?=
 =?utf-8?B?RzBqeUc0MC90R2NES3BEY3NiN0lKU040b2hJSWxtU1VzVXVMQk9PSHptUmlr?=
 =?utf-8?B?TllnV1dYblhVN2FjQnh6Tkh3NURmUUNOZmFFYWFRQTgzeS9yMCthRFdtblNO?=
 =?utf-8?B?cVNVdzhuU25EcFhXNmN4M1R3WjZReUYxOE1FUjM5MWRyTTVjS2pOMG5WbWRE?=
 =?utf-8?B?TVJnZU1qV200dUN0Z3lVRXprUlB0UDhNaTZMTUcwR2E3Q0tYTk5rSENGWmUz?=
 =?utf-8?B?bHF0Q3p2S2FWTkxxWktvQUZSMEJ4UmZDQm1mRU5zK3hKUDZ1YjErRWpjUXpC?=
 =?utf-8?B?OUFocGdNei9rV1E2aVh5cFUwd1U1YnoraEYxQmNYWk52aE5qdXEvbkttRDJ3?=
 =?utf-8?B?S0lCbG1aRS9lZ2ZScWlLQ0tlYkpuREh5SnVCalMxdWh5SFVmRXE0clFiak43?=
 =?utf-8?Q?qsLMK/JhVwI98roQuEyAZ8N1ouU7RQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR20MB4867.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OTEwT2NQMXpRV2NJMENESXZpampqaDRMWENWNnNlYVRsVEtFdmhNQmNtd1NT?=
 =?utf-8?B?VDZOc3liVWVlU25FNTI2aXVrNUs0cVV3NlhtY1FtZU8yeGp1VmxMb3hhV3pl?=
 =?utf-8?B?Ri9YbmdvTEc1RVN5MjE1MGwwaGEyb2ZVc0p6YUxJL0JPZkppNDN0YkN6Q25h?=
 =?utf-8?B?TXVpWkYwVk5pMFVQWXV5OCtMQStvWlRna1JUcVRzNldPZmZ0Qnd5KzVUS2pY?=
 =?utf-8?B?cG9kOXp3VjlRMjhncS9ZcnJHTXIzVDIzUHliRndvUGVmODZidlNRTFU2dmpp?=
 =?utf-8?B?cGJVSXZCRDExSXBEdi9tSFIyMXpSMzJMUDdiYnMvTVRsdTFZcUEvTUZRRnZO?=
 =?utf-8?B?cHNkWldwTE5GVlFMSEZtdGx5Y0I3djl5R3BtMjVNamxYMGpzcmtiMnNZRUY2?=
 =?utf-8?B?SFV4UmZnTW92MnNUT3RtaW5nVy9rbHJ5WHN3TFVTZWkzR0hEQ1V1UXNKaFM4?=
 =?utf-8?B?ZlNGVEltVHVSNU50QkpoNFRhc1p6anVtMUlrYzRnb2MxemJ1VXRtS1pQSHMv?=
 =?utf-8?B?Q3hYZzdmZVF1cVYwTGZnendpdHVPZEtrajFTaU9CQ3RwSFpGTEQxSmVEbkhC?=
 =?utf-8?B?b09ITXVYOWNmQnVJVE9DT0g3b1VZK1J0NWdRcW9oNThGc1pUdlI2eTMzRVBC?=
 =?utf-8?B?VlcxdlJjVTd2eHYvRmVYa0orUWgxT0oxU05kNlk3Y2IxblM0S2hlbDd1WXhN?=
 =?utf-8?B?aDgyU1JWRllOV2trM3NZY3FtRUttbzI3eGJ4dENLZnZ1V2Q4Wi9hVGpqRWpQ?=
 =?utf-8?B?cWlQa3ptaVVROVc2dnJIdmpPZytMQ0w0NStDaW5DbGV4cTZNQ1ErcUVqcC9M?=
 =?utf-8?B?V1JsbmhZK0lIUWxyYnNlM3lWTDhjNTYzMjVDck9JbVpvdWFWVzIzVWZzVjVE?=
 =?utf-8?B?UFhlSElDd1BzZkpWTXNrQUMxU1YyWWpIRnMvdzQ0K2V6NVFNYWgrYU44dGVs?=
 =?utf-8?B?TEE0MlVUTkJZZ3Y3c2JpZmtJYWJFWkdWaGtJVENrVVRUaWFCVVg0T3ppY2g1?=
 =?utf-8?B?RkcvT1FBRSsxeFc1allaT0VaNUpIZXZnSUhOVjZuTnJYREVVRlQ5TmR0VXFV?=
 =?utf-8?B?WElsTlZ0Njlrc1FPZjNwbytzc0NvZ0VMMmhyNXVldFI2NUYzWnlaTWttSFRw?=
 =?utf-8?B?R1RRVFFPcDdZK0JyL0E5VkVzbGZ4MVZzT1h3bldhWVdXc05SL3RwUHZ5UlJ5?=
 =?utf-8?B?aVF0cTc0NTB5MjNHNDFXMUFJdkxQMEFPajV5RE9ZVGpwb1ZYSFZiS0FmOUla?=
 =?utf-8?B?dmVNRlJlVXhxZGU0S3o3NWs2b0lIZTZMTUxudTlGclpmY1NkVXJvUnZnVzN1?=
 =?utf-8?B?MWJUNjh5c21UMnlnRWtkUHlsWk41ckwzbG1GU3BqTlRHcmcrczBBcC9lcUhr?=
 =?utf-8?B?Z1RUT2FiYXFkb1JFWko2dTNEbUFENjVTalBLQTFIdmlNdER2bkNRTVdKUUNh?=
 =?utf-8?B?VjlkNnNCU0Q2eVpuSCs5QWtpOHFLYmY5SmthaHhrSXVrWm9jWlpiS1hpeSth?=
 =?utf-8?B?SS9hajdiNG5WeW5OVVhFcTVuTkc1QytZMkYvNTg4UXVtWEgxMXpKM0ZmUzRy?=
 =?utf-8?B?TFhrMi85YWNMem1lbkszNWVHTjNjTUJ5cjYrQThsNFhudzJ2bWpDdjFvcXJm?=
 =?utf-8?B?VHJMbi82OWtRbzE4MW9BYXFhWHAyUTdyQkh0V3Q4N21GakFpMFR0S3VUVHda?=
 =?utf-8?B?TWxlT0tjYXQwUGZzQXBCT1pIeEpsUnkwbm9xcXlkQVlRcEd2ajQyeDd1QTl1?=
 =?utf-8?B?bG5QcmFxN3hLODlEWTE4V3M2MHZKOXl3cjExQ0dYSU5uK280NHZFVmxoRCtD?=
 =?utf-8?B?SGNwa3I3UDNXMWEvY0V5aVdBTlRpQitlV0Fyb1RDeGFEU2NydEpuQlZrSGFG?=
 =?utf-8?B?Q0pMc1Z4QktUTVJGakFuNmJnS08vWW5DV2FsdTdDQ0VoczZpTEFWS2FIZklS?=
 =?utf-8?B?N0JsZER4TngwaVlHZEFpdDdmNmg5Mk5kWDc5cTJNSEowUklPOUxvTTZ6Q2Fn?=
 =?utf-8?B?R1pERktucXN4Y01WMWJlTmpPRHBLNUNpOVBKQU55QVd4a1hhMkVkWE00OHow?=
 =?utf-8?B?NXU1WmJnK2hmTjcrOGt2ZDU3YlF4SHNzay9acUVFKy9IQUE1UXU1MlNzODBS?=
 =?utf-8?Q?lpyo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: semtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR20MB4867.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5421789c-be4d-4b5c-0864-08ddeca050cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2025 17:19:05.0844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b105310d-dc1a-4d6e-bf0d-b11c10c47b0f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d7FVH5PDWauSbjhAdwbN3ejoNcXbN/fTOOHRYL0fc3wOvdWTNYSNiM3cwY7DKxKjg/lS5QgymhBhCuljMB3/7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF77BA5F823

SGkgTWFuaSwgCgpUaGFua3MgZm9yIHJldmlld2luZyB0aGUgcGF0Y2guIEkgYW0gc3RpbGwgbGVh
cm5pbmcgdGhlIHBhdGNoIHN1Ym1pc3Npb24gcHJvY2Vzcy4gCkkgZ290IHRoZSBlbWFpbCBhZGRy
ZXNzZXMgZnJvbSAuL3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwuIFdoZXJlIG1heSBJIGdldCB0
aGUgc3RhYmxlIGxpc3Q/CgpSZWdhcmRzLCAKCkFkYW0KCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tCkZyb206IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaUBrZXJuZWwub3JnPiAKU2VudDog
U2VwdGVtYmVyIDUsIDIwMjUgOTo0NSBBTQpUbzogQWRhbSBYdWUgPHp4dWVAc2VtdGVjaC5jb20+
CkNjOiBqZWZmLmh1Z29Ab3NzLnF1YWxjb21tLmNvbTsgcXVpY195YWJkdWxyYUBxdWljaW5jLmNv
bTsgY2hlbnRhb0BreWxpbm9zLmNuOyBxdWljX21hdHRsZXVuQHF1aWNpbmMuY29tOyBrcmlzaG5h
LmNodW5kcnVAb3NzLnF1YWxjb21tLmNvbTsgbWhpQGxpc3RzLmxpbnV4LmRldjsgbGludXgtYXJt
LW1zbUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEl1bGlh
biBNb2NhbnUgPGltb2NhbnVAc2VtdGVjaC5jb20+ClN1YmplY3Q6IFJlOiBbUEFUQ0ggdjNdIEZp
eCBwb3RlbnRpYWwga2VybmVsIHBhbmljIGJ5IGNhbGxpbmcgZGV2X2VycgoKQ2F1dGlvbjogVGhp
cyBlbWFpbCBvcmlnaW5hdGVkIG91dHNpZGUgb2YgU2VtdGVjaC4KCgpPbiBUaHUsIFNlcCAwNCwg
MjAyNSBhdCAxMTozNDowNUFNIEdNVCwgQWRhbSBYdWUgd3JvdGU6CgpNaXNzaW5nIHN1YmplY3Qg
cHJlZml4OgoKICAgICAgICBidXM6IG1oaTogaG9zdDoKCj4gSW4gbWhpX2luaXRfaXJxX3NldHVw
LCB0aGUgZGV2aWNlIHBvaW50ZXIgdXNlZCBmb3IgZGV2X2VyciB3YXMgbm90IGluaXRpYWxpemVk
Lgo+ICBVc2UgdGhlIHBvaW50ZXIgZnJvbSBtaGlfY250cmwgaW5zdGVhZC4KPgoKWW91IG5lZWQg
dG8gYWRkIHJlbGV2YW50IGZpeGVzIHRhZyBhbmQgQ0Mgc3RhYmxlIGxpc3QuIEJlbG93IHRhZ3Mg
YXJlIHZhbGlkIGZvciB0aGlzIGZpeDoKCkZpeGVzOiBiMGZjMDE2N2YyNTQgKCJidXM6IG1oaTog
Y29yZTogQWxsb3cgc2hhcmVkIElSUSBmb3IgZXZlbnQgcmluZ3MiKQpGaXhlczogMzAwMGY4NWI4
ZjQ3ICgiYnVzOiBtaGk6IGNvcmU6IEFkZCBzdXBwb3J0IGZvciBiYXNpYyBQTSBvcGVyYXRpb25z
IikKCi0gTWFuaQoKPiBTaWduZWQtb2ZmLWJ5OiBBZGFtIFh1ZSA8enh1ZUBzZW10ZWNoLmNvbT4K
PiAtLS0KPiAgZHJpdmVycy9idXMvbWhpL2hvc3QvaW5pdC5jIHwgNSArKy0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvYnVzL21oaS9ob3N0L2luaXQuYyBiL2RyaXZlcnMvYnVzL21oaS9ob3N0L2luaXQu
YyAKPiBpbmRleCA3ZjcyYWFiMzhjZTkuLjA5OWJlOGRkMTkwMCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2J1cy9taGkvaG9zdC9pbml0LmMKPiArKysgYi9kcml2ZXJzL2J1cy9taGkvaG9zdC9pbml0
LmMKPiBAQCAtMTk0LDcgKzE5NCw2IEBAIHN0YXRpYyB2b2lkIG1oaV9kZWluaXRfZnJlZV9pcnEo
c3RydWN0IAo+IG1oaV9jb250cm9sbGVyICptaGlfY250cmwpICBzdGF0aWMgaW50IG1oaV9pbml0
X2lycV9zZXR1cChzdHJ1Y3QgCj4gbWhpX2NvbnRyb2xsZXIgKm1oaV9jbnRybCkgIHsKPiAgICAg
ICBzdHJ1Y3QgbWhpX2V2ZW50ICptaGlfZXZlbnQgPSBtaGlfY250cmwtPm1oaV9ldmVudDsKPiAt
ICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmbWhpX2NudHJsLT5taGlfZGV2LT5kZXY7Cj4gICAg
ICAgdW5zaWduZWQgbG9uZyBpcnFfZmxhZ3MgPSBJUlFGX1NIQVJFRCB8IElSUUZfTk9fU1VTUEVO
RDsKPiAgICAgICBpbnQgaSwgcmV0Owo+Cj4gQEAgLTIyMSw3ICsyMjAsNyBAQCBzdGF0aWMgaW50
IG1oaV9pbml0X2lycV9zZXR1cChzdHJ1Y3QgbWhpX2NvbnRyb2xsZXIgKm1oaV9jbnRybCkKPiAg
ICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4KPiAgICAgICAgICAgICAgIGlmIChtaGlf
ZXZlbnQtPmlycSA+PSBtaGlfY250cmwtPm5yX2lycXMpIHsKPiAtICAgICAgICAgICAgICAgICAg
ICAgZGV2X2VycihkZXYsICJpcnEgJWQgbm90IGF2YWlsYWJsZSBmb3IgZXZlbnQgcmluZ1xuIiwK
PiArICAgICAgICAgICAgICAgICAgICAgZGV2X2VycihtaGlfY250cmwtPmNudHJsX2RldiwgImly
cSAlZCBub3QgCj4gKyBhdmFpbGFibGUgZm9yIGV2ZW50IHJpbmdcbiIsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgbWhpX2V2ZW50LT5pcnEpOwo+ICAgICAgICAgICAgICAgICAgICAg
ICByZXQgPSAtRUlOVkFMOwo+ICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGVycm9yX3JlcXVl
c3Q7IEBAIC0yMzIsNyArMjMxLDcgQEAgc3RhdGljIAo+IGludCBtaGlfaW5pdF9pcnFfc2V0dXAo
c3RydWN0IG1oaV9jb250cm9sbGVyICptaGlfY250cmwpCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBpcnFfZmxhZ3MsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
bWhpIiwgbWhpX2V2ZW50KTsKPiAgICAgICAgICAgICAgIGlmIChyZXQpIHsKPiAtICAgICAgICAg
ICAgICAgICAgICAgZGV2X2VycihkZXYsICJFcnJvciByZXF1ZXN0aW5nIGlycTolZCBmb3IgZXY6
JWRcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIobWhpX2NudHJsLT5jbnRybF9k
ZXYsICJFcnJvciByZXF1ZXN0aW5nIAo+ICsgaXJxOiVkIGZvciBldjolZFxuIiwKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBtaGlfY250cmwtPmlycVttaGlfZXZlbnQtPmlycV0sIGkp
Owo+ICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGVycm9yX3JlcXVlc3Q7Cj4gICAgICAgICAg
ICAgICB9Cj4gLS0KPiAyLjQzLjAKPgo+Cj4gVG8gdmlldyBvdXIgcHJpdmFjeSBwb2xpY3ksIGlu
Y2x1ZGluZyB0aGUgdHlwZXMgb2YgcGVyc29uYWwgaW5mb3JtYXRpb24gd2UgY29sbGVjdCwgcHJv
Y2VzcyBhbmQgc2hhcmUsIGFuZCB0aGUgcmlnaHRzIGFuZCBvcHRpb25zIHlvdSBoYXZlIGluIHRo
aXMgcmVzcGVjdCwgc2VlIHd3dy5zZW10ZWNoLmNvbS9sZWdhbC4KCi0tCuCuruCuo+Cuv+CuteCu
o+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KClRvIHZpZXcgb3VyIHByaXZh
Y3kgcG9saWN5LCBpbmNsdWRpbmcgdGhlIHR5cGVzIG9mIHBlcnNvbmFsIGluZm9ybWF0aW9uIHdl
IGNvbGxlY3QsIHByb2Nlc3MgYW5kIHNoYXJlLCBhbmQgdGhlIHJpZ2h0cyBhbmQgb3B0aW9ucyB5
b3UgaGF2ZSBpbiB0aGlzIHJlc3BlY3QsIHNlZSB3d3cuc2VtdGVjaC5jb20vbGVnYWwuCg==


