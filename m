Return-Path: <linux-arm-msm+bounces-36830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FE29BA004
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2024 13:28:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A41DF281F11
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2024 12:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC898189BB4;
	Sat,  2 Nov 2024 12:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b="fOB8pYE2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11021133.outbound.protection.outlook.com [52.101.129.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF2516DED2;
	Sat,  2 Nov 2024 12:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730550486; cv=fail; b=YnTUia2aPimH1L1Np/rGXr/uxUNarG8w0/RfRkNiN//PENYUxAQ7cJ0yoWoFw53ZLIk+LTC4XK5N8rezl/jiIuIEyTZVLhMMJTLVSl6JqhxL0ESfUq/y5SwGaB7HqWhxuufoLqyY8lXXyscrLA9PRYUIlr6hV+eVpy/szerDsM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730550486; c=relaxed/simple;
	bh=k2DNf9xwBl+kIZ5Bcqtx6M1sZeyEEH/JUaho0NvWO4A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CzVkPr+PeXOgpv1x8vt0QUDtfj2FWxp23WYb1/ib0UESVTrAgAd1x5uRkD2x+sZUB6VjoVgvkUZolMMExGGG8YeoZRi2F33MyS5SUehAeNMkvs5h+lxNuMwaPGrMbOAUi2MOjDZETwciAFayUaNp6hiKF2qXOtzcQyNcE6rn588=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com; spf=pass smtp.mailfrom=jaguarmicro.com; dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b=fOB8pYE2; arc=fail smtp.client-ip=52.101.129.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jaguarmicro.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6+rpxnoOwc2T62BGPNjc/jyKyItFELjlg5tfI85tQxB0mWQ3jY4Pfy60SQVg4ZwlHjmI+MXrCbRMnTm3OAFDanxM6DmBSuibzvv1tgWxN/1Aswe2fxOLDOxTtAyblt15QL6P4eoYiAyCBjDfn0S8/zNjc5oRkT6oFGV1j1sT58qOdaBHDnRY3K36Qu+EXohlvhQBbDsG8V8aUViHsm0JPCnzUK4GOh/Wi3sXZeCx2GgsPOF6Qqdwk70qoEDF6OmTKSiUJyrLjwF4OwewIJ6kDyRBWoPat4hmLd5/mFVJmz62GMmEIECjeJ5a42KF9GuXP6Ykj0J/qxCS4j3znCzVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2DNf9xwBl+kIZ5Bcqtx6M1sZeyEEH/JUaho0NvWO4A=;
 b=yKicjngbkleq/Zdpo6uTNQBx9S5Umhdiq6L2Of0217PE4lQW9R8/2FkGee6qyYC2JvXXtzWfl0k9jaLBnifNXi1pTXJ4+l84wIDRzKp9qYpA9rUW0rH5FD08PCp7VWFi6bp7z43Imj0dUvWnZq8LNO/Fc7ZD17tPqW3PnwGgodhI9S82qbZt4RD/jVMRmEwmUtShUmuM+Kk/1mqus0Ls7e9Ty4heNuanSlD0zF29CwMW2qB9097TWW+2EkC5yq9KtR5G4XZz9t5Wy0vSttPh5m36YJvaWf9IPHMadXry+WHg2GWWeXxFj/D2xOncyqvA/Yu64wKSa68rkhPx2pHNRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaguarmicro.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2DNf9xwBl+kIZ5Bcqtx6M1sZeyEEH/JUaho0NvWO4A=;
 b=fOB8pYE2Zzjut5M9VooptJuENeMhd9evZS6o8QmhPakiqVCcU6jy1OU+HS7phI3UxY9nPe2Q6FyACCjuW3sG67ipuS31bf0aG57meMRC3l5kLPQt9yziI3U6ezLhowp5Usl3bLrTGpautdPT5ehcxQI3FnBgryCdL6tOm8uWA4YdxZBAQwnIyp/rvF+zm7Euu2T6jSIgcw3Ea9ng0GGLXyuZNBTbKjNpJx6s9KVZ5L/lvW2nVvlvWdHlCt4KoGDhCQoNyfyL1LxuxKSmf9IcKmwSn26wTvbMUo+CePA2oZndFykuxuknApnXuD9/XwgkrM7b4Tg0cvRfLJsjv2on+w==
Received: from KL1PR0601MB5773.apcprd06.prod.outlook.com
 (2603:1096:820:b1::13) by TYSPR06MB6694.apcprd06.prod.outlook.com
 (2603:1096:400:472::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.12; Sat, 2 Nov
 2024 12:27:56 +0000
Received: from KL1PR0601MB5773.apcprd06.prod.outlook.com
 ([fe80::b56a:3ef:aa9d:c82]) by KL1PR0601MB5773.apcprd06.prod.outlook.com
 ([fe80::b56a:3ef:aa9d:c82%4]) with mapi id 15.20.8114.015; Sat, 2 Nov 2024
 12:27:56 +0000
From: Rex Nie <rex.nie@jaguarmicro.com>
To: Bjorn Andersson <andersson@kernel.org>
CC: "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
	"heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux@roeck-us.net" <linux@roeck-us.net>, "caleb.connolly@linaro.org"
	<caleb.connolly@linaro.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Angus Chen <angus.chen@jaguarmicro.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject:
 =?gb2312?B?tPC4tDogW1BBVENIIHY0XSB1c2I6IHR5cGVjOiBxY29tLXBtaWM6IGluaXQg?=
 =?gb2312?B?dmFsdWUgb2YgaGRyX2xlbi90eGJ1Zl9sZW4gZWFybGllcg==?=
Thread-Topic: [PATCH v4] usb: typec: qcom-pmic: init value of
 hdr_len/txbuf_len earlier
Thread-Index: AQHbKtDJlTHKdi2mTUul2df0ufbWhLKilHEAgAFazBA=
Date: Sat, 2 Nov 2024 12:27:56 +0000
Message-ID:
 <KL1PR0601MB5773A8E2A93CE724E8F21A75E6572@KL1PR0601MB5773.apcprd06.prod.outlook.com>
References: <20241030022753.2045-1-rex.nie@jaguarmicro.com>
 <20241030133632.2116-1-rex.nie@jaguarmicro.com>
 <cmudnqum4qaec6hjoxj7wxfkdui65nkij4q2fziihf7tsmg7ry@qa3lkf4g7npw>
In-Reply-To: <cmudnqum4qaec6hjoxj7wxfkdui65nkij4q2fziihf7tsmg7ry@qa3lkf4g7npw>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB5773:EE_|TYSPR06MB6694:EE_
x-ms-office365-filtering-correlation-id: 56da57c4-f90c-49ec-ff7f-08dcfb39c7cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?gb2312?B?SmhUVTEyVjJTUkhLOUt1aXVuc1ZBZ0NzN0xWSWlBTEY4bTVseFpXcVdtTzBv?=
 =?gb2312?B?ZXpoMVcyS0FPSm1BT3MweVRnVkR3N3YzTElNNXpwYXY0T1NwYXBwVGlzSmdl?=
 =?gb2312?B?d2Y2djVMN1dmZ1lJMlpSTkpMNlBLY1VXdklNYzVPUW9HM0lsS09VQWpHZHR3?=
 =?gb2312?B?eGZYNE8vb1ZuVENCTWp5amUrT3cwSXNWWVNhcFBiMzdRdmpYMVdFV3BzbU9O?=
 =?gb2312?B?cVhBa2JoeFg5ZGZXSGtSSUFDM2swUGJ1NERLSE9XV0RHR0lONmZxMXk4S1pC?=
 =?gb2312?B?Mi9qZjRxWksrYmh2YkVJRGJMQVBlNG4zNEpLYnh3K2tIMlVvQllTWVRMdGFr?=
 =?gb2312?B?WW5ObUo0YlcvTkltSUVwczkrVVZLand0U0svZHNqOG13b1RKZmtkTUlTbFA4?=
 =?gb2312?B?K0Yzb0J3UEpxMlRCeWVPbkZNM2lLWWZ0ZURDL0xpTFJENUpPOWV3UGVNcXlC?=
 =?gb2312?B?OUtEUlcxeUhjUmdxV3V3dTZ2dlVkc2xkS3lWdTFSWXNaYjRzcXhSOWVRZkpj?=
 =?gb2312?B?ZG1NWkRUZW8rWVQwK01VVlFhdHQyaTc0VDdsL2R6bmd0dGZZV3Urb1JUTTRN?=
 =?gb2312?B?b3JhQm9qV1J6d0tOcFNqRVVNN3V0bi8vZWo2ZHk2TVo0SG0xQnRqOXp0OVVp?=
 =?gb2312?B?YjkzTEF2aTdhUzhUQnJtU2tYZ1BUT3lscWZ3dnFCVWI1WEllbld6dFpvZ2ZP?=
 =?gb2312?B?cERLeERuNU04SmttQVVra1hQd1I0YUVUcHQ4QitRaVhiMVlOeDQyL3AyMkdo?=
 =?gb2312?B?SXJoRHo3a05TU3A5RGY1NkZKalZCd1ZtSHd2TGNzL1BuTFl0N2ZuQTlTL05V?=
 =?gb2312?B?aUhPd1RheUUvdEpJMHpQUzJKdnRrb1llV2o0Vm9BZlpCTmFNN0dVZDlFUU9M?=
 =?gb2312?B?ZHFHY3ZLcWttQWJibTFBckhFRkYvVFpDU2RudW9JcitPNkJUZ2F4K0xVWUdq?=
 =?gb2312?B?bS9BTnVObFhoMVRUSDR6S0U3Snp2OUordDZrTzhHOFdVbWdzVDdvNHdtaklC?=
 =?gb2312?B?WCtkdWZBNDFVVzM2VU1hdm50VmI2ZmJmYU9EZlB4NjRzNnNsL1hYRCtKS1Ri?=
 =?gb2312?B?Z3Nac0VONWlabHFaRjBVU3F1d2RIbGJrN3VOMnB5TmlHdDFqZTdnK3NTSVZQ?=
 =?gb2312?B?SzJmOFViejJhZTV0bklYaWV1Qmswc3l2WWdsY2k5TGRhbHAzMm1NdnFVd0pn?=
 =?gb2312?B?N0s2R1N3TE1SNXhFRTM4Z2YvYVFUTWtxbkV2VENGT0ZBRWxRdmFKaThsK3Fj?=
 =?gb2312?B?aFMxNXVNaFE1WnNFNUFiWWZQRWRBTzdkaTlqS2VKa2g0d3cwTzd6R2k5VFoz?=
 =?gb2312?B?RGdqVFh1M2NFNjdhZjh0NlFMZXRwbEMvWHU2THdKNndjOThvNTVRVVcySHlN?=
 =?gb2312?B?eHoxcll2UEs1aGZ3SFRJOFJMWEphOHVpR3c3YTlxVWY1dHVTNVc4WG1yRHhK?=
 =?gb2312?B?Vm16bUc3dlprOGdjc09UWHFmMk0xWUJ0SGlZOVY2d0I4UGZuc0dxRHRhdEdO?=
 =?gb2312?B?U2w2NXFtQ0pGMXIrQnNmd3FVdndveHVYc09ucUlLQ0RQTzZ1alJidis3OGQy?=
 =?gb2312?B?YkVraXJralhxdjd6dXovRThRS2dTdEcwU0Y1Z0VXYWV4bGlzeG92dlprU1NL?=
 =?gb2312?B?TEROblFNQlJkcFR4UlNMa2dNcytwa3hXS0R5S2xaem9OWG51VUVuSzNOS1Rs?=
 =?gb2312?B?L3Qxa29TNGp3SFdENFIySG1IUmpKbEU5ZTM1V2c2bzMzc3E0a3JUaldzbmhJ?=
 =?gb2312?B?STV0bklDRTZjQVZKWnp1UWpoVGlmWVhHMFIrbXBSOTlLYmdRNjVlcHZnR0F0?=
 =?gb2312?B?TXFUUjNDRGhsQ2g1TjE4cjBrYnc0b1JXTTFlSWhuU1NtRk85dGJ4MDJNN0da?=
 =?gb2312?Q?LNu5pRQ6QTcOT?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB5773.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?MEVLaXZVMWR1cW5RZ1BhOVY1MDAydFlsYjZMVlRLYk1wMEFwTHAxNXI2M29F?=
 =?gb2312?B?cmdSS2hmWU5tR2N0WFNPUFkrOHlnb3doQzN5YzFhVERHem1sb3pvazlMSjlJ?=
 =?gb2312?B?cGtGVGxPenJYa05kYjE1YjBQb05RQllhK3RTc2xFUXVGTXh4aktvYXBQa1ZC?=
 =?gb2312?B?RFprRG5sbU5vTDFZUkd3WStzbWdGbE9PNTFLMWMxOWJpRzg2Lzl5Z3ZEUGFw?=
 =?gb2312?B?ei9BNHhWNVl1ZUlXNjlVK0ZmSjJsOTYwVUxVVUE3UkRiRzlOTFRKN3BFeENj?=
 =?gb2312?B?bEhaSjRTTm9ackkwMW45azdmQTJqcmgwbGlIeFlHUE0wazBQQ3B5S1IyYVRv?=
 =?gb2312?B?Z3ZyQXlNbWJ3RHhYRHBmRnFRdEpadGpycmtrK3NrUE1Yc2czbXUwdHMzZ3dt?=
 =?gb2312?B?UGg4K0VpTmVFUTBQdndOQUZvNCtIekR0MGhQOE9DN0lERlp5dW4vYUtxR09P?=
 =?gb2312?B?N2VTaW5nUmN3TS9ITlZYRm5ZNDF3b2ZETTRvWGxiUkNXWFRWMWJBRXRvcWhM?=
 =?gb2312?B?c0hNVG5aN1BRb2NvRUppMyttb3hvS3RmcC8vazZ0bEQ2NVVuQU9BcGNnenFV?=
 =?gb2312?B?M3RpYXZqM3VGMnhFQnorYXdUL0lKbXpSVVJQVjhudEV1eUVYcHlwb2hRMjVN?=
 =?gb2312?B?YU10T3NZSmtHS3NROE9jalM4aEJWMVhKa0tpR2NBdkhhUkRUeGpsbE1RSkpE?=
 =?gb2312?B?U0hKZlBnMXpOUUg4VFdGdEJKWk9NRmRSc0NUdTcvQ1hyZHRzVVM1NHFDVTFN?=
 =?gb2312?B?OHViYk9GM01sRno3WFVkeUxNYlgyVWVjMnd3SmVEQmRhZHlkNW9pejMyNEd0?=
 =?gb2312?B?UGJqNnl0NzVCUW9VNndpTHVTL0RXdnpQdVJXWlhaQ0NEc3ZTUHZmNVp3Z21J?=
 =?gb2312?B?a3ZRZmN6dUNYQWIxRVJxN0RLQ015N3lyOUhKR29CcXVJR3RKczlFaXdqQlc0?=
 =?gb2312?B?NUFRS1pRZkUrNGNSczJIRDdYRlA4OXNUWHdUQ3VHRmQ3WkxDWjltdW9iMDJm?=
 =?gb2312?B?NmFaTm02RStUSW5mT2EyZ0xESDBnbFcxazBmUVhnL2g4dnFtdW95ZnJkRFlv?=
 =?gb2312?B?OTMvdzVlakxHbzZkcTlXakhRSDlFdUVwam9RenlWbW1xcm9RZHNoZWk0TGlQ?=
 =?gb2312?B?c1BGRXBNckNEMmExN0ZkT3ptZktKV2pJMFlvL3dWaVU2bmtwNk5hUFR0a1Mv?=
 =?gb2312?B?dmRXdVg4emxRVm9UREFFY3p1M1JFQ294Zzg0NE1DSkoxaThwSUhBRXlnV3hU?=
 =?gb2312?B?eDU4TDh0Q0ZlQkFKVGxiWEZnM1lFVkZYT2lIdWJwVktTRUdrbUdQZTJIcHNV?=
 =?gb2312?B?MjZKd0tnZmI3N2p5SWhiQktCZGFTWXlxMkhLYUFzcDhnTEZrWEE0TkNGQnUy?=
 =?gb2312?B?UlRjdUlzTUFtOTNSS25sM3l2ajRZS0Q4UFB1a0tZS3dvcWpWRWZaQmZCR290?=
 =?gb2312?B?TTdINndjZFROUW5PZ0F2UGs1Tkl6VGxmZ2ZubG0rbHdZZzh6aDVNWUVvZHU5?=
 =?gb2312?B?d1AvemgxWUs2aFBFK3I2UGI4WDA1QVBrbE5NMU1WeEZTQTZUQUF4eGNXM2RH?=
 =?gb2312?B?RmhWOWxsZHZWQVprY2JGMzM0WGtpNzR4R1N0THNUZ29aRGJ1QnFjaklVM21t?=
 =?gb2312?B?TjJLZURlMDhVcGlyRnVENFFZSmVReDdWeDdNQThLckc0WFAvaE9PUW0yQmxQ?=
 =?gb2312?B?NUZ6a0M3MkdXY0VuYWFBU2V5RGp0a2VvMlFKYWFVQWFDOTFJMGIxMXMyWE5j?=
 =?gb2312?B?Wldhakd5KytjS3VmN0RsMXcvVlRmdHRpdmZBNjVOeENtSUtJLzlJK3F6Y3RG?=
 =?gb2312?B?RzVHZUtNMlB6VkdHbFhUMzVFZ3JkTnl1cytuekQzaDFlOGxMcGhOSjVVRzBZ?=
 =?gb2312?B?MmdkRXBSN29lei8zNFFnSFVEd0FLaXNEM0ZMbldRcTVNVTFXOFFUR0I5cG9l?=
 =?gb2312?B?QVJMQmZmMG5LSDc3L0JLWThKVFl2STBubTBsc0dIby9aSTZKVzhlY2IwMENX?=
 =?gb2312?B?dzBuMmMrM3FsVG5EZmpScmJzOGFnOHE0Sm1NS0lHUFdIb2Z6RkIzRUEwY0Fr?=
 =?gb2312?B?cXFhSStKdmY4aXdjK01FTlZneC9MUFp1ME9WNzRrcmFadXl6Q3gxRmUrem1N?=
 =?gb2312?Q?/o7dDHu3k1HJbA5Y2hqyleNQM?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: jaguarmicro.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB5773.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56da57c4-f90c-49ec-ff7f-08dcfb39c7cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2024 12:27:56.3283
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TmsW7vHN6HCN5CtIBwmH/6dwjWBLFRBGqtajF+HFaq3KV9nMdbxE16wT0p4Uf+vOmzm0bQMP/fiDIrgfiA6/Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6694

Qmpvcm4sDQoJT2ssIGdldCBpdCwgVGhhbmtzLg0KQlJzDQpSZXgNCj4gLS0tLS3Tyrz+1K28/i0t
LS0tDQo+ILeivP7IyzogQmpvcm4gQW5kZXJzc29uIDxhbmRlcnNzb25Aa2VybmVsLm9yZz4NCj4g
t6LLzcqxvOQ6IDIwMjTE6jEx1MIxyNUgMjM6NDUNCj4gytW8/sjLOiBSZXggTmllIDxyZXgubmll
QGphZ3Vhcm1pY3JvLmNvbT4NCj4gs63LzTogYnJ5YW4ub2Rvbm9naHVlQGxpbmFyby5vcmc7IGhl
aWtraS5rcm9nZXJ1c0BsaW51eC5pbnRlbC5jb207DQo+IGdyZWdraEBsaW51eGZvdW5kYXRpb24u
b3JnOyBsaW51eEByb2Vjay11cy5uZXQ7IGNhbGViLmNvbm5vbGx5QGxpbmFyby5vcmc7DQo+IGxp
bnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnOyBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnOw0K
PiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBBbmd1cyBDaGVuIDxhbmd1cy5jaGVuQGph
Z3Vhcm1pY3JvLmNvbT47DQo+IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4g1vfM4jogUmU6IFtQ
QVRDSCB2NF0gdXNiOiB0eXBlYzogcWNvbS1wbWljOiBpbml0IHZhbHVlIG9mIGhkcl9sZW4vdHhi
dWZfbGVuDQo+IGVhcmxpZXINCj4gDQo+IEV4dGVybmFsIE1haWw6IFRoaXMgZW1haWwgb3JpZ2lu
YXRlZCBmcm9tIE9VVFNJREUgb2YgdGhlIG9yZ2FuaXphdGlvbiENCj4gRG8gbm90IGNsaWNrIGxp
bmtzLCBvcGVuIGF0dGFjaG1lbnRzIG9yIHByb3ZpZGUgQU5ZIGluZm9ybWF0aW9uIHVubGVzcyB5
b3UNCj4gcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4N
Cj4gDQo+IA0KPiBPbiBXZWQsIE9jdCAzMCwgMjAyNCBhdCAwOTozNjozMlBNIEdNVCwgUmV4IE5p
ZSB3cm90ZToNCj4gPiBJZiB0aGUgcmVhZCBvZiBVU0JfUERQSFlfUlhfQUNLTk9XTEVER0VfUkVH
IGZhaWxlZCwgdGhlbiBoZHJfbGVuIGFuZA0KPiA+IHR4YnVmX2xlbiBhcmUgdW5pbml0aWFsaXpl
ZC4gVGhpcyBjb21taXQgc3RvcHMgdG8gcHJpbnQgdW5pbml0aWFsaXplZA0KPiA+IHZhbHVlIGFu
ZCBtaXNsZWFkaW5nL2ZhbHNlIGRhdGEuDQo+ID4NCj4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVs
Lm9yZw0KPiA+IEZpeGVzOiBhNDQyMmZmMjIxNDIgKCIgdXNiOiB0eXBlYzogcWNvbTogQWRkIFF1
YWxjb21tIFBNSUMgVHlwZS1DDQo+ID4gZHJpdmVyIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBSZXgg
TmllIDxyZXgubmllQGphZ3Vhcm1pY3JvLmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBCam9ybiBB
bmRlcnNzb24gPGFuZGVyc3NvbkBrZXJuZWwub3JnPg0KPiANCj4gTmljZSBqb2IuIE5leHQgdGlt
ZSwgcGxlYXNlIGRvbid0IHVzZSBJbi1SZXBseS1UbyBiZXR3ZWVuIHBhdGNoIHZlcnNpb25zLg0K
PiANCj4gUmVnYXJkcywNCj4gQmpvcm4NCj4gDQo+ID4gLS0tDQo+ID4gVjIgLT4gVjM6DQo+ID4g
LSBhZGQgY2hhbmdlbG9nLCBhZGQgRml4ZXMgdGFnLCBhZGQgQ2Mgc3RhYmxlIG1sLiBUaGFua3Mg
aGVpa2tpDQo+ID4gLSBMaW5rIHRvIHYyOg0KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8yMDI0MTAzMDAyMjc1My4yMDQ1LTEtcmV4Lm5pZUBqYWd1YXJtaWNyby4NCj4gPiBjb20vDQo+
ID4gVjEgLT4gVjI6DQo+ID4gLSBrZWVwIHByaW50b3V0IHdoZW4gZGF0YSBkaWRuJ3QgdHJhbnNt
aXQsIHRoYW5rcyBCam9ybiwgYm9kLCBncmVnIGstaA0KPiA+IC0gTGlua3M6DQo+ID4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL2IxNzdlNzM2LWU2NDAtNDdlZC05ZjFlLWVlNjU5NzFkZmM5
Y0BsaW5hcg0KPiA+IG8ub3JnLw0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3VzYi90eXBlYy90Y3Bt
L3Fjb20vcWNvbV9wbWljX3R5cGVjX3BkcGh5LmMgfCA4ICsrKystLS0tDQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy91c2IvdHlwZWMvdGNwbS9xY29tL3Fjb21fcG1pY190eXBlY19wZHBoeS5j
DQo+ID4gYi9kcml2ZXJzL3VzYi90eXBlYy90Y3BtL3Fjb20vcWNvbV9wbWljX3R5cGVjX3BkcGh5
LmMNCj4gPiBpbmRleCA1YjdmNTJiNzRhNDAuLjcyNjQyMzY4NGJhZSAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL3VzYi90eXBlYy90Y3BtL3Fjb20vcWNvbV9wbWljX3R5cGVjX3BkcGh5LmMNCj4g
PiArKysgYi9kcml2ZXJzL3VzYi90eXBlYy90Y3BtL3Fjb20vcWNvbV9wbWljX3R5cGVjX3BkcGh5
LmMNCj4gPiBAQCAtMjI3LDYgKzIyNywxMCBAQA0KPiBxY29tX3BtaWNfdHlwZWNfcGRwaHlfcGRf
dHJhbnNtaXRfcGF5bG9hZChzdHJ1Y3QNCj4gPiBwbWljX3R5cGVjX3BkcGh5ICpwbWljX3R5cGVj
X3BkDQo+ID4NCj4gPiAgICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmcG1pY190eXBlY19wZHBoeS0+
bG9jaywgZmxhZ3MpOw0KPiA+DQo+ID4gKyAgICAgaGRyX2xlbiA9IHNpemVvZihtc2ctPmhlYWRl
cik7DQo+ID4gKyAgICAgdHhidWZfbGVuID0gcGRfaGVhZGVyX2NudF9sZShtc2ctPmhlYWRlcikg
KiA0Ow0KPiA+ICsgICAgIHR4c2l6ZV9sZW4gPSBoZHJfbGVuICsgdHhidWZfbGVuIC0gMTsNCj4g
PiArDQo+ID4gICAgICAgcmV0ID0gcmVnbWFwX3JlYWQocG1pY190eXBlY19wZHBoeS0+cmVnbWFw
LA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHBtaWNfdHlwZWNfcGRwaHktPmJhc2UgKw0K
PiBVU0JfUERQSFlfUlhfQUNLTk9XTEVER0VfUkVHLA0KPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICZ2YWwpOw0KPiA+IEBAIC0yNDQsMTAgKzI0OCw2IEBADQo+IHFjb21fcG1pY190eXBlY19w
ZHBoeV9wZF90cmFuc21pdF9wYXlsb2FkKHN0cnVjdCBwbWljX3R5cGVjX3BkcGh5DQo+ICpwbWlj
X3R5cGVjX3BkDQo+ID4gICAgICAgaWYgKHJldCkNCj4gPiAgICAgICAgICAgICAgIGdvdG8gZG9u
ZTsNCj4gPg0KPiA+IC0gICAgIGhkcl9sZW4gPSBzaXplb2YobXNnLT5oZWFkZXIpOw0KPiA+IC0g
ICAgIHR4YnVmX2xlbiA9IHBkX2hlYWRlcl9jbnRfbGUobXNnLT5oZWFkZXIpICogNDsNCj4gPiAt
ICAgICB0eHNpemVfbGVuID0gaGRyX2xlbiArIHR4YnVmX2xlbiAtIDE7DQo+ID4gLQ0KPiA+ICAg
ICAgIC8qIFdyaXRlIG1lc3NhZ2UgaGVhZGVyIHNpemVvZih1MTYpIHRvDQo+IFVTQl9QRFBIWV9U
WF9CVUZGRVJfSERSX1JFRyAqLw0KPiA+ICAgICAgIHJldCA9IHJlZ21hcF9idWxrX3dyaXRlKHBt
aWNfdHlwZWNfcGRwaHktPnJlZ21hcCwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwbWljX3R5cGVjX3BkcGh5LT5iYXNlICsNCj4gPiBVU0JfUERQSFlfVFhfQlVGRkVSX0hEUl9S
RUcsDQo+ID4gLS0NCj4gPiAyLjE3LjENCj4gPg0KPiA+DQo=

