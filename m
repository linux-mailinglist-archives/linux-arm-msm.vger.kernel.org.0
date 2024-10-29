Return-Path: <linux-arm-msm+bounces-36260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D13489B4264
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 07:28:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15862B2175D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 06:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7192010F9;
	Tue, 29 Oct 2024 06:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b="Pzk40nPy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11020085.outbound.protection.outlook.com [52.101.128.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5319820102D;
	Tue, 29 Oct 2024 06:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730183289; cv=fail; b=pbduiIOVKWig8SXDOdxJ/wIQnC8WQhOZu1uvHGwa/5rxYdjkrb+Bjr2ZzsP5Hjee5gq4iAOjeUmlKQFmXrZAGeKg/xX0YyAYe7wf1CKvkho8S/MSQqYDxyewDS0uDiZFTfLlHZrP7KkU64pFek7POGAyx7PyKpFesZKb/f7LfCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730183289; c=relaxed/simple;
	bh=1LB3+Gw6islUOxSNo0JlmU8hD76o7mtR3tVPuvlZYtM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ttLmhISlBIF7xFjVns/fBizlsnNjWMhn766hcB2uPgRqI46Y7IV0bmMWPB/nGQGtWl4mvVCXKCCZmWZYwrvyZosXtLUIw8CCkrtDmqIaQMErUQiCvO94w27jTFdimCZaTiqTeXAjNnoQg41NeiG1iTHgAuqw0wvbwl1OAFHxNI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com; spf=pass smtp.mailfrom=jaguarmicro.com; dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b=Pzk40nPy; arc=fail smtp.client-ip=52.101.128.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jaguarmicro.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tFcNBrfPstRIEu1W8Y+DM6a2Bj2Zm1b0wdvOUVoKrxTDeSUvARsYW0bMUSq5L2lDa3De3ghSFH1Ws5jDvh0XDgjIGtiDylBUBlrlM2ezc1B3x+x6/g61HqZOt20Xyo08rnfHV9o92CtPS0w/gNuhK6DYBy7O/94rlFUH7TjhE4xR9Ha0dnIj4GoahEV1Vpdb63Kjqib37Nt0bULnJISQwLtVccWV309gIBmuRzaRghFhwH4Ya/dj8QXIUslMhKN5tPCgDytOsny6iNhLFrYRqVgdz+4JoWQIf5PgLbBO6s7iGLgYG6Ezj3Gg7WEss14IXz1Ho/IuvB1qlSsQM7PCvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1LB3+Gw6islUOxSNo0JlmU8hD76o7mtR3tVPuvlZYtM=;
 b=NnWBwbCra3/cOwEKde0nlOvAD/YwWJoplNMWnC5ND3JJuIUbGYhIblmhAW4685BsRpbqe8zok16ZZSrbdDscm3/AFd0VmwWkQrT+5RPg1vPYiw9XBd81zr7KcKXiOIFfgnU0V796TI4L/qnzDFN4bILQx1w6F7TuHTSAw/9MN+fkJISIOvYR8cOU+hQAQXXW7AbbDytbPFft4BDefpugXntU3c9kHWVJKT3/tzKdw40t9bNUAyZHBm+k4SqQdZnNbRpu9A4h9dJsg4qfNkw6qK+ZXwHxKrSlh4f+//N5xcnDHxTAr3HYNwjC0Jhfndpy4kZkkUQjkz6EFnywfI0zUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaguarmicro.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1LB3+Gw6islUOxSNo0JlmU8hD76o7mtR3tVPuvlZYtM=;
 b=Pzk40nPyBfEWRdP8i0j88nFWg6D2ts0JTQceJvfmYJnLoGVsu6ZqVD3ICRYloamkv3CgaSSqWhcVa/zl7qYAJXo2z5cPrJN59kUWxBZoKTMPmaJLZ5ZG7Z/8oMoolZE7m4uK+zjo0VylUfaLZgbbukGyYmOna/5U5KStW01EP1eWkuzetNrktwHoZ0CGESWJSxxzs9kmgm9kf9sDYmDDJw5mua1fWdAOPlV+U9RnZgmjsp4qQhy9+q8xjGBu6sxC7knF6ItA9t1DbASivEzJhXIztNiifEEyfQoda45wtiYuGI6+q9EVRJNpE75KR+r2scDlF1qbdiZZskyfA9UHRQ==
Received: from KL1PR0601MB5773.apcprd06.prod.outlook.com
 (2603:1096:820:b1::13) by SEZPR06MB6909.apcprd06.prod.outlook.com
 (2603:1096:101:1ea::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.11; Tue, 29 Oct
 2024 06:28:00 +0000
Received: from KL1PR0601MB5773.apcprd06.prod.outlook.com
 ([fe80::b56a:3ef:aa9d:c82]) by KL1PR0601MB5773.apcprd06.prod.outlook.com
 ([fe80::b56a:3ef:aa9d:c82%4]) with mapi id 15.20.8114.012; Tue, 29 Oct 2024
 06:28:00 +0000
From: Rex Nie <rex.nie@jaguarmicro.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
	"heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Angus Chen
	<angus.chen@jaguarmicro.com>
Subject:
 =?gb2312?B?tPC4tDogW1BBVENIXSB1c2I6IHR5cGVjOiBxY29tLXBtaWM6IGZpeCB1bmlu?=
 =?gb2312?B?aXRpYWxpemVkIHZhbHVlIGhkcl9sZW4gYW5kIHR4YnVmX2xlbg==?=
Thread-Topic: [PATCH] usb: typec: qcom-pmic: fix uninitialized value hdr_len
 and txbuf_len
Thread-Index: AQHbKajYRsQzuPdlTUii8hxJ2mw0xrKdAcMAgABBgeA=
Date: Tue, 29 Oct 2024 06:28:00 +0000
Message-ID:
 <KL1PR0601MB577347FD66F203A701A4A618E64B2@KL1PR0601MB5773.apcprd06.prod.outlook.com>
References: <20241029021823.1978-1-rex.nie@jaguarmicro.com>
 <2024102927-colossal-shore-0f46@gregkh>
In-Reply-To: <2024102927-colossal-shore-0f46@gregkh>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB5773:EE_|SEZPR06MB6909:EE_
x-ms-office365-filtering-correlation-id: a4b1bd0e-f9d8-4de0-b8d5-08dcf7e2d61b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?gb2312?B?WHJOUFpGaENtNno0MGJ2dGRtVzBlMG1KaC9rSUpvQStETGxGR2d6UzZ5T2Nr?=
 =?gb2312?B?dGplOHp3SXZ2dGpnWC9yTmdvY2w2M0Z2M2tLZ09CUC9ucDNUUTBrS3E0a2Fs?=
 =?gb2312?B?K3BvVTg3M0NGQTM5dUpBUFc1TThsWVorWkg3cngxVUtJT293cTAyYkY0UHVQ?=
 =?gb2312?B?R3BaSDZTZ0R6VlhHMUtRWGVXRzRXSVhMK1RvNmN0em5Xb1QxYkttQU5WOHRW?=
 =?gb2312?B?NHZHWHJaOERXamhZQlpHVHBQT3FHcVRyRUZHaE52b0QzRUNQc3lObnR3UjBF?=
 =?gb2312?B?blJDUVhQdUNYdzFQS2RHNkJDaC90SitpeW5VNlpoQ1UwRHA3NXhKL3hmKytJ?=
 =?gb2312?B?RXZuYXF2VmpqL1FsS3VSbXo5YzZVa0tqVVVZL3BkWjIyRWR0Nks4U2tJZE5i?=
 =?gb2312?B?ZzlYV3VSVFFMVmVMREF6allmOCszbWVGY3pUanloU29yb0lEM3lFdVljMjd1?=
 =?gb2312?B?NVJ0dnBXcTEyWTBzOVlwbGtqOGNJYUhLVG9HTDE2dlJhd0NnS1BkQmRqby9I?=
 =?gb2312?B?MmIyTzBzUnNGWkhUSWltWG9RaHJva2h2YzcrSHJtY1Q0MnhnRWg0Yk0vaktx?=
 =?gb2312?B?QlpkUUJvVVY3RHJJMUNSZUNmWGJCQ1FwaEFnV1lmc0FyWEoxQ3lRQ01ORDFp?=
 =?gb2312?B?KzhBL2VINHkzMU05U2xEdXpBSnNLYUxoNkdNUmV2QzQxNk9pVnZaR1o1ZWRP?=
 =?gb2312?B?WVlvUXNpdzRuSjhvankyc3gxSDhvVUp4dnM2YlcxbGswMXlYOFF1RldOVWli?=
 =?gb2312?B?Y0ttUCs0Zng1TGpFSkRHTE1keSsyYm5pTXFHWWdGbWFCVnUvSjdNUU52MUJC?=
 =?gb2312?B?UFJ1K1pmdGxlZTU1UnllS3ErMDE3ZmNtSkdMWkFJN2NFZ0FlUlFGUmtjMWph?=
 =?gb2312?B?citxWEtjTmpMdi9aRElXbStOYkU1bG9yZFB1NFJoeHdVWUhYNWxXdS9BMEg1?=
 =?gb2312?B?bWIrWG9VNWc2L3VId3lXb09UV2xpT211c3JRUmovUWhUOGhRRzArU1RXVmR2?=
 =?gb2312?B?d0dabmxtZFJwS2hXU01jZUdObzEyNlJwSlk0bTMzS2lWVHNqWmErdkUyU2RE?=
 =?gb2312?B?ZSt4dVh4THRFMFNYVUIwWW5vWVpDSkRKd0pBSHZJMkNrRm5QMlozR1VMT09t?=
 =?gb2312?B?ZW81Z2ZJMEdPdU5XWWJhNGIrd1ZNOFZjYTduR0RENzUvMzh2bW9qMTg5TzdU?=
 =?gb2312?B?Z2phQnNpb2xQWGh2ZkVtWWxaUkcxLzJaZ3ZBTy82UnBSeDFRSWhRaWptQXQ4?=
 =?gb2312?B?VjhKZlh3bUo3RjB4WnJMTWhYRmZTclBtV2hoR3o0My9VM0ZDU1NodHFsQk1P?=
 =?gb2312?B?SkRuSnZTVnJHc0VOcTREZldLRnQrTjBQejlra0pxRzVxRWtBWmkwWEpVSFA3?=
 =?gb2312?B?SHJPUkVSVnBKRTJKVzIxdzdzMVppZzU5d01EL2N2bHNHU3RRK2tYTEtMVk5P?=
 =?gb2312?B?K2V4a3FxVFN0aFFWbHpjTUJUZFBTY2c1KzhmOG4wZVVxREZWZ2RxRzhXZWZQ?=
 =?gb2312?B?aGt1UjN3ckZHLzE0dGdtcXdyQkRwTzBTZXcxVDRzSStKeWlOMVVXOTNwdUFa?=
 =?gb2312?B?WTE3U08wZnhZb2xOay95SWJ2UHh1VU9aMkVxdXhXL1pORC9nNFBoMHR0amxo?=
 =?gb2312?B?dlFTZnNYMExROExrZXpNVGFXVWpxVzFTYkhBbnBXMms5ckpOY1FiZ3N0NkVV?=
 =?gb2312?B?RHhBNWhoVjAzQlM4RzEweDVodkRTYWU3dFJMNktRdkdRb1YzSnVKcm5XNUNn?=
 =?gb2312?B?eFhPUlZQRHZnTUdVbUs2djVqTEZuQjJJT3NpNHgzQnB3Z0VrY3RjaGptREdj?=
 =?gb2312?Q?oTn3ta2u1yR/89mG66AVzs01YUzRZANY7lj1Y=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB5773.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?ck5hM1Z5NHBsN3VGMnBJSmlEbTlOckoyNXZJSmFENDU4cUdhbzRYRGZCdUVh?=
 =?gb2312?B?d2czWU9jNGgxR0h3N1RDR0UwNVlkZnZ0a3Vnd2t2dWxGTDdKNW9ST09Ud3FY?=
 =?gb2312?B?OUpDQXozRUEveXBiNmpmUEtGV1NKcjBWWVo0aEdvSFVSQ3d5czFuWFllRlVR?=
 =?gb2312?B?T0ZqSytlUDQ4bzcvYko5NVZpT0kzZC9JREVEZERTOHEzb20zU0xVczRVdk1C?=
 =?gb2312?B?ODJhZkZoQ3hJQlVkS1BrRXl0d082T2hCL0VXK2NHUFAvUkNlSDlaM0pvZDlt?=
 =?gb2312?B?TFJxN1FVVnRMZEZoTE41OGszZmo0WlROWkRLa21vMmV4U2FjM0c2bUNNNVI0?=
 =?gb2312?B?c3kxdmpRcFJRMGpDRHljTnJpZHBibTRkWTV0YWpvalNpK1RhbVh1ekdoSkp6?=
 =?gb2312?B?WFR2c2R0Lzdxb1JqWm9Ja0dvYTF4cGVUckxkclRCeU1CMmZ1eVBENEJTVGhG?=
 =?gb2312?B?T1lyc0o4dklCYy9ZZXl0YjJZdkFuWURQVUtqZkROTldCVGhDaWticlZjNFhP?=
 =?gb2312?B?MHNKWFdhWWdXZTNsOElHTE5VVzhCanB3SW9MMENvZXFqTmZLbGRmTW1kTERQ?=
 =?gb2312?B?a0ZzSldmcjZPU2NEQlZXQnpIVHBQYWNJUlBtWXNPdzBsbGxUTWlJMzN6UGNV?=
 =?gb2312?B?blNiQ0NHTVhvakoybXJ2YkFZMW1lTVI1T2NYb0p1SkxxRGxuQ2JVVXlMRG9v?=
 =?gb2312?B?TEtPaXEyUENLdkppTWgzSzhZQ09DUTl5L3RVTW9tMWFNckNHOGwxcTVtam5v?=
 =?gb2312?B?WkpkbWZkdExjb1pDbmxQa2k3YkY0MENHM29LTEo2cUNObG94VVVOdHRxbysy?=
 =?gb2312?B?SkhGS2h6Wks3YVZIcHZSSHdQMUhjNXRwaTRUbW5Dc1dXR0lGUjc5aTlJaGlp?=
 =?gb2312?B?YklhMVcxQ3VhanBTalR5MnJHQTc3aFR4VGhwaEhndVJZN2tjZzdrcno0UEFI?=
 =?gb2312?B?V0lxV29sYmFFUjRlY0x1cmtjdStvcWxiMjJVOEN3a2ZEd1ZKdWtSaEptQmll?=
 =?gb2312?B?eEwxY1hlOHdVMzJLOFlERkhhQjNQVFI5cklyblRwbjJJZU5wb0V6L05NUDBZ?=
 =?gb2312?B?dDJiYkpBR3pHZmlEVkU2TDRrVHJKVXBjaUlGcnJLUmpwS3Q5S0xjUU1Zellu?=
 =?gb2312?B?LzY4UHdnT1JLN1RKNmw5YmtTN3JQejk5V29kN3Rkcll4aVNEMmxMNk1DNk0y?=
 =?gb2312?B?WXBPMjhrVWs4WFZIQVp3YlNxT2RrY3RvWFRLUnhZdUxkOWZiUmxMTmR0QVE4?=
 =?gb2312?B?cUFsVVZjcEd0RXdnWGtUbTQycWNPZkpQRTZTczE0WnVrK1lvOGpKNVhBeUhS?=
 =?gb2312?B?UzJxR0hiVkluOWlmS2xzUndaOXQwZlp1NFBVOERiWm1aUlBiMzZsdTVqMDhD?=
 =?gb2312?B?LzNCQ1MwOENzYlJVZktVNXNIMmdYT0xkWERFWnBtUHNoTS9HcXNhalQwWFhV?=
 =?gb2312?B?SkMzUkFHbTNxekRFTGk1WHNKS0x0UU5CV3BlVkR2WVErV0FJaTNjaWg2akRX?=
 =?gb2312?B?NHZ6dW5GUFVEOC9ueVJnU2FIaXk0L2x2dGhvMFpSWXdTeFNacnB2UTM4YmU2?=
 =?gb2312?B?aERVVENEdHlkQ0F1NDBST0REMkEzSU94S1NHTWxaNVNBNGpNVHJVTWlqS0ZQ?=
 =?gb2312?B?R2VPcnNla1ovK01xU0Ewa2JCTnFVMXczdTY3akc2eHp0SDV4Z0Q5Wml5dm5C?=
 =?gb2312?B?S3pJalZKL25jSjRETHJ3UFZJWHo4Y2g2UE9UYTQxeVlTcDN2RjBsZ1BLQkl0?=
 =?gb2312?B?c3NIdnVmK1hDRmQ0V0ZpVFkyMWFONkxXeGJtOGVRc3YrU04xZFdhWkpjczY2?=
 =?gb2312?B?eHduR3JDcDRUZjdiRnMzV1RETzRIS21qdlM4WEdPTklDS01nQ1BqMzRKY0U3?=
 =?gb2312?B?aTM3OHE1bys1c2x6SmpyU0N6YUtzTXl2dm5GSWw0NjVXa3V1VU13VG5EcmpE?=
 =?gb2312?B?TGtzY0QrQUwrVVVHM0diL0hLdVRCSEdIMkpqNGY4OWQvQUcrS3hHMUd1RkZE?=
 =?gb2312?B?ZzhPcTZpUk5zNUthb3lSaXZ3Q3RJODZualhBQzN5a3EyRDl4RXBYQ1p6dFFJ?=
 =?gb2312?B?WktXWEV0MXQ0Q1U5clUyMkc2OCtmeHVPWk50Q2R2aUtCQUg0SVRyN2xUK2dR?=
 =?gb2312?Q?056yk2gMxZZT+Zn/7xXWHul30?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b1bd0e-f9d8-4de0-b8d5-08dcf7e2d61b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 06:28:00.6365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G+0tSSahWy9457DqAaNb1j4NxsqCNGGeZsfJq7X1edtrW7hGOs+6c9zDU+7FPebHVbRvFyLcrriuJbeq9quEsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6909

DQo+IC0tLS0t08q8/tStvP4tLS0tLQ0KPiC3orz+yMs6IEdyZWcgS0ggPGdyZWdraEBsaW51eGZv
dW5kYXRpb24ub3JnPg0KPiC3osvNyrG85DogMjAyNMTqMTDUwjI5yNUgMTA6MzENCj4gytW8/sjL
OiBSZXggTmllIDxyZXgubmllQGphZ3Vhcm1pY3JvLmNvbT4NCj4gs63LzTogYnJ5YW4ub2Rvbm9n
aHVlQGxpbmFyby5vcmc7IGhlaWtraS5rcm9nZXJ1c0BsaW51eC5pbnRlbC5jb207DQo+IGxpbnV4
LWFybS1tc21Admdlci5rZXJuZWwub3JnOyBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnOw0KPiBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBBbmd1cyBDaGVuIDxhbmd1cy5jaGVuQGphZ3Vh
cm1pY3JvLmNvbT4NCj4g1vfM4jogUmU6IFtQQVRDSF0gdXNiOiB0eXBlYzogcWNvbS1wbWljOiBm
aXggdW5pbml0aWFsaXplZCB2YWx1ZSBoZHJfbGVuIGFuZA0KPiB0eGJ1Zl9sZW4NCj4gDQo+IEV4
dGVybmFsIE1haWw6IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIE9VVFNJREUgb2YgdGhlIG9y
Z2FuaXphdGlvbiENCj4gRG8gbm90IGNsaWNrIGxpbmtzLCBvcGVuIGF0dGFjaG1lbnRzIG9yIHBy
b3ZpZGUgQU5ZIGluZm9ybWF0aW9uIHVubGVzcyB5b3UNCj4gcmVjb2duaXplIHRoZSBzZW5kZXIg
YW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+IA0KPiBPbiBUdWUsIE9jdCAyOSwg
MjAyNCBhdCAxMDoxODoyM0FNICswODAwLCBSZXggTmllIHdyb3RlOg0KPiA+IElmIHRoZSByZWFk
IG9mIFVTQl9QRFBIWV9SWF9BQ0tOT1dMRURHRV9SRUcgZmFpbGVkLCB0aGVuIGhkcl9sZW4gYW5k
DQo+ID4gdHhidWZfbGVuIGFyZSB1bmluaXRpYWxpemVkLiBJdCBtYWtlcyBubyBzZW5zZSB0byBw
cmludCBtZXNzYWdlIGhlYWRlcg0KPiA+IGFuZCBwYXlsb2FkLiBJdCBpcyBhbHNvIG5vdCBzYWZl
IHRvIHByaW50IHVuaW5pdGlhbGl6ZWQgbGVuZ3RoIG9mIHJhbS4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFJleCBOaWUgPHJleC5uaWVAamFndWFybWljcm8uY29tPg0KPiANCj4gV2hhdCBjb21t
aXQgaWQgZG9lcyB0aGlzIGZpeD8NCkhJIGdyZWcgay1oLCBUaGlzIHBhdGNoIGZpeCB0aGUgY29t
bWl0IGlkOiBhNDQyMmZmMjIxNDI5YzYwMGMzZGM1ZDAzOTRmYjM3MzhiODlkMDQwLCBhdXRob3Jl
ZCBieSBCcnlhbiBPJ0Rvbm9naHVlIDxicnlhbi5vZG9ub2dodWVAbGluYXJvLm9yZz4uDQpUaGFu
a3MNClJleA0KPiANCj4gdGhhbmtzLA0KPiANCj4gZ3JlZyBrLWgNCg==

