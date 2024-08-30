Return-Path: <linux-arm-msm+bounces-30183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1F2965A1B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 10:22:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A352A1F24546
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 08:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B8716C68F;
	Fri, 30 Aug 2024 08:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="gQ9EBAXi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2040.outbound.protection.outlook.com [40.107.215.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F0B16A92F;
	Fri, 30 Aug 2024 08:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725006088; cv=fail; b=f3BQgdLHdOjZs2TdWOZbEIIZa8ZzM5h/SfoThKSygfrYYzRUrlthZO5PUL+pJpGdwzXwKDvNUrkt5fs+N5QCGcGy8OxMK98bpBcrq8mzqRkGOYJbFm5Iw2m2ifN9k8OTthJRhNotpJa87Z+e5A7NiEdrh1s2YVb/eOedSYi/rJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725006088; c=relaxed/simple;
	bh=aIKMrQIhwCd2pVJYWl3ORfQDs2kxEr+DY0soykheJ6A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Spxlmf3olPr+onITAPsh153ArKSKBvkJQBcsxDYC3U+OM3BavaYZuFbqBK/FcqtKj41ygGXlHE44f03TTL3sn8xY/tLUNuRmv1f97QlAp05FOCsKyoDPXCqzo0CpOnsR1yRT6eT/uFbRyl6BA7nnyc2l0LERGP4G4Mh5ShGZCRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=gQ9EBAXi; arc=fail smtp.client-ip=40.107.215.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+XRm2NIrLSpR1LSiixAVphHViV4HbCo9vhC3j6rUKlKfR7l08Rhdc36oXdADUWPFqcyoWYT1kexOwYN3FxI8/iqS47B2Yvt1IPcn1QUxj1dsklIJk1rrhREop2KPS0+MMTXKcXYpgSGtAyTe4SQXihzu09yF+j8ejxo2atfuF0My/eJryrSiNkXOqOBWLTasUzG3muOVeIrp2Q64doiAfADDaGHFH1P08iwFitG3QPJgYKAQ9gISsHWWdAPD+oVb60txdmaJwNiEOIlBcyhyYwOFE7f4R/mlt3IJz1wv8w8DZckfOjdRFIEQmfYt/dnhvn4QgDpmr9uM3AR4xeyFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIKMrQIhwCd2pVJYWl3ORfQDs2kxEr+DY0soykheJ6A=;
 b=jaTKQ+zjPixMpl39LaQDC8R7Gs/sTjdeSei3w8mmqxtzDHTsObuRUZyYJhQs0+RXJk95ZCE+e5HYOngoaQKZZ47xJGaHZYXPFdL5JSGiVGo8Hm2VpALLemhKkvH9SAZLqHt0qB5ulhrYFKwy3zL5sEiPsqZC1H5X9Df26+M9514SA/vlP0onoQYQ91yBIhQPHu5OI2hI5D2n2xXbkcYkGQQup+7NMyH+UhepenpAy/QXQ2tvxXXpE/Rh7gEK6sd/TRp84enp5b9w7yDU9/y8BOEc859MDuVJjz0VoE19sveG6OwSyIFOGXBU1M0JIws/LWsxQlxTfHP0t21B23W3lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIKMrQIhwCd2pVJYWl3ORfQDs2kxEr+DY0soykheJ6A=;
 b=gQ9EBAXilTIO/mbVS2eoZpjDvLZ3OmhtkJCbKYkZa/y2qb+ODoEL1jFfkZ+XQC/ZSl9UBo7xiDwWHRy3xxtWcoUhjItArWUxIfQmh+0Bull+kpPA6ehQoRhKYfwR9kxd+ye43gKl1RMgE4TB1aW33ZDrkiLODXgo3wuCzasTMuHjuZUIlyHX/4Gq1WHAYPTck+KvXf5F2LaJZyn0TqmCtqA9k1iVYLdZ7k7vApPj7hen+IJhowJeEhKMad6l88L4jZED5w7F5nQMruCKurT1Z6GUT0sCDNZHm7SilgCNQc206C1GiDyIdczxXhxmJT5euu07RXePd/BlfJf3+ciqQw==
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by TYZPR06MB6859.apcprd06.prod.outlook.com (2603:1096:405:1c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Fri, 30 Aug
 2024 08:21:21 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%5]) with mapi id 15.20.7897.027; Fri, 30 Aug 2024
 08:21:20 +0000
From: =?utf-8?B?5LqO5L286Imv?= <yujiaoliang@vivo.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: opensource.kernel <opensource.kernel@vivo.com>, Bjorn Andersson
	<andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] bus: qcom: Simplify with dev_err_probe()
Thread-Topic: [PATCH v1] bus: qcom: Simplify with dev_err_probe()
Thread-Index: AQHa+hDFyzcg/+/oCkWvY1XSxP5rp7I/c8CAgAADTIA=
Date: Fri, 30 Aug 2024 08:21:20 +0000
Message-ID: <3a79f02e-2da2-4b6f-a00e-7511a21f72e3@vivo.com>
References: <20240829124118.3256437-1-yujiaoliang@vivo.com>
 <76fb94fb-abb9-4cb7-a477-9839d1bc6287@kernel.org>
In-Reply-To: <76fb94fb-abb9-4cb7-a477-9839d1bc6287@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB4461:EE_|TYZPR06MB6859:EE_
x-ms-office365-filtering-correlation-id: d27c921c-13b0-44ed-445f-08dcc8ccba14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?S3k3aFlSdyt5bHJzcjU0MHdzYmpuNlJ5eFBLTWlCWDVUVFRVclBRb0VuM3ZU?=
 =?utf-8?B?c1htL3hvaHN3bTNKZ1lMQks5emN0aFROdjFpdWpPUjU4TVhSQ3M3cEwzSW9r?=
 =?utf-8?B?ZDJKZXJkSVpsQ3ROVzlDOEVOOHZHMCsxSEZQNXBlM2pRem1neEJMWWpNLzBy?=
 =?utf-8?B?ZDdYanBBakhuWHBTTnBsaW9HZjk2ekZLSFYyYkY5eUNVUTBXYnl5UHlIeWJE?=
 =?utf-8?B?WThubWhlQXlaQ0J3Q09YN2l6K3MxdlUvN0hnUWJiNXJnS2RCWFBVQlQwenFX?=
 =?utf-8?B?TFNrQ0N3V1hKYkdacURTTzFPdVo5ZWhsRnpoODRxdlNsN210NFVtSWxnZmtP?=
 =?utf-8?B?cWJVYW1GR3NTc3ZlaW9aS3FlTkRMQ1hpa09sUS9OZ0hneW4zZFM2ZlNuNmha?=
 =?utf-8?B?V01PZWNydDNOQVJPeENmWUlvaGdYTWJhNFp3SGUwQUFYUlNDYzVtVEFZNy9E?=
 =?utf-8?B?YVJrT09hcmdhbStGUEJva1BrckVBYkcrcW5TU0dBMHFFVklUT3pxSisvdDVQ?=
 =?utf-8?B?bk9PN3hxQ3RrVng3ajViYUNvbzJJaWNkTnExaHhkb2JrQzd2WDRhaG1pT21t?=
 =?utf-8?B?QUxSMitBbGFvR0Npa2E0SzNERzRQUFNSR0kyNWFPL2NIbzNzeUw5RW55RWJu?=
 =?utf-8?B?dHdKNVN1VDgvYytaVExHV0Q2cGJZaFpyMmc4U25tTWI1eEJncjZmbnlnVTNE?=
 =?utf-8?B?NmpiVE90dUJnVThhY2gyb2xxVmtnc3lEQkdBMnFleFFaSExpSjVLZi95bjJL?=
 =?utf-8?B?WDFOcXJwY3diTGNvNE5mQmFoWXJwa1lFS212WlNsTERDVDdaMEpqMmhRYm4x?=
 =?utf-8?B?Rlp0TnNJVVUzVExsdGQ4NG1majRzNmVMZS9tZHpFZjVUWUJHSUl5RitYbDRa?=
 =?utf-8?B?SEpYcUFEamhFZ2xDMU9Ebk5WMUdkODRwVDlReUoycEI0SE94NUd0WnFBcmFJ?=
 =?utf-8?B?aW9KVU9CRGNDbEVkVGI5MVpzNU1ZQjlyK3pVRlJYZnF6eWU1MDcyOHNJSFUy?=
 =?utf-8?B?ZkF3RXFIZlJ6NlBIT3JTSEFrTjVORG1PTWlNUjB1OEFzS3JFN3RmNjRWVEJZ?=
 =?utf-8?B?RGxiTWd5ck5TWFAvemUzdUpnd0I1SWlacDZnZ1RxN1hyZkhrT0pFM3VaOXlO?=
 =?utf-8?B?VzMyVDNHU2JMN1dRWWdyZzJrRTF5bFM4bERQQ3ZnQTRVZWdSNHhyRFBlUEZo?=
 =?utf-8?B?TzBqTFpWUHpjaEg0Vmh3UTN6K3E1RXBqeHE1OXdHSFdDbnhPZjAzRmI1WHFz?=
 =?utf-8?B?bWdTUUlBRW04ckZCWmIwbjhmUVhnS0UveXVWVWlyRkY2Q2dYUERESWJQZDky?=
 =?utf-8?B?amEycGZHOVJRYjF5c2wyRWh1QlNwS29IbWNBckNCemhsQmdPaFhNaEdiVGFz?=
 =?utf-8?B?djBMNVJLdjZydFJ3TzBJcmRBSUltU3lNcnB6MkZybEJvRmloNmQ4STZrVFJo?=
 =?utf-8?B?dFFEbXNwck96M2lJYkw3Z2tUa2dtclVPdnJaWkRjWTVQbjVETlBNTFJUWGhh?=
 =?utf-8?B?SUdrdWY3TmFGNnpyNW9GK0FHQ1dwY3IweU40TjJtK1lOV0JpWkl5TUlFMEhu?=
 =?utf-8?B?WXQwTlBDQ0hKZVR6M1Z0R1JoV3cyZ0FwK2dCNXhIVUw2aVlFdWo0SHAyMWNO?=
 =?utf-8?B?cUx1UU40M24xeXdiWHFWQndiYU50L1hXMUV1c1hZTDVLbk5tWEFEdHRlejhP?=
 =?utf-8?B?VHprQmptZlRLc2tiVTlCOS9CeDY1bXd1a3F1VEZGUUQzOGlxRnRnM08xT1c3?=
 =?utf-8?B?OGxvWjdLMWM4R3U2dXE4YkovZXpoQ3UyaEwvUUZXVDI3M0dhcjRKbHBsNnRp?=
 =?utf-8?B?RXgzVXdNSVpEUDZpNlhQRFNZUlVMYytUQURITEVMVlk1YmJ4SkdmNHd6Nk5u?=
 =?utf-8?B?Ym00V3JKVEpXNEZaazUvbHdLakQxU1k0anNLSGdYTFhPQXc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4461.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NjZmeW91a1dqNjJHYmJLeGI0dlA1YzdKMkFMUnh0MDVEalJUcWVLM20rRmNC?=
 =?utf-8?B?aVU5QVVBaXBMYytDa1FST1NHSU0zejl2Zzg3TVZ1NVlmdGtSSEtTd0tVTEYw?=
 =?utf-8?B?UktSbjEyRVF0cjJuZW5zYXV2Z0dwd29KblFGYnpZejNSZmx3RmtSYWt2UUh3?=
 =?utf-8?B?dzE4ODJUVGNuQnM1aGdSUW8rc0hHTW9WRVd6bEhZT044S01OMFdvWTJGZFNm?=
 =?utf-8?B?VmtSWk5ITzkyeU0rTmNjN2dKNFY5bzBjb2xTWWFXa3gvY0p0dFdCTU1lbkZl?=
 =?utf-8?B?N0R5QWJtUG1MdzdRenZ3RmpRb2gzNkIwWkF5YkhDU21VQmtCb3IwV3NKVGZM?=
 =?utf-8?B?S3p3czVYNVlPNUVYdHZGbkJTYWxUdXNsemZWMnZXY0N5V0kweFpkcC9BNXBs?=
 =?utf-8?B?MFFWb2ZZaUwzSEZydmNlWWNqU3RZY2JhbzV4ajVtZVhWaGxiaU96dThKeWRZ?=
 =?utf-8?B?ais2Z1pKcXAxd3VJcWNzaXI1UWlFejdaSHJzTWZzajFUWVh2SzZBcXp5Z3pO?=
 =?utf-8?B?SFdaSHhndldDQkZxTFVFaldtSk5Bb1NLTnhtS3gwbEJVdXF2NzZYTGQ0eU1w?=
 =?utf-8?B?QUdKVzlKQnA2ZW9PTjZWNWhGVEZ2cWV6V2ZpcGZhM0RQWHA5bzNBUUxTNUds?=
 =?utf-8?B?cURDNEZwMnREVHY2dmFuSDZSTXNhcHJlaTZ5akt5U2gvWUltRWo2aXZld0pm?=
 =?utf-8?B?c0RuU21LbXo1ekJ4bTlkQ2xDa0hQcXRUSWVvR1JWb1pjRCt1VU5SVnM4VlBU?=
 =?utf-8?B?UUU4QUI4eXBtMUV1ZHhxWmhMS1FabUxxT1lIWENSRngxZmN5WnVuc1dVSTRk?=
 =?utf-8?B?a0FQck9VMFppM1hrQThJV3E3Y284QzRwL1Q2dGVBdmk3aHR3bnRYcFdKQ3dC?=
 =?utf-8?B?bTJpc25JbzBYMDE5bWVlaEw1U0pPWHZlLzNFN3Fob2VuR1pDUUFWcFJIWGxy?=
 =?utf-8?B?TWEzNTVWV25TTjhmVUZENXVlQy9lL1dDYllaNTkyR05JWWZwZ1pZbTl1dGNG?=
 =?utf-8?B?QWVvVmhxd3VwYndFd0lrcC9Rdi9peHdCZ1k3L1hOY2NOYVBQVTM3TlViQlhz?=
 =?utf-8?B?eWRDd3Z3OU83ejRUeTAxOFZ6VlRuKzNnWkpPbG1TQ2xGaDJ5b1JCZVlEYmMz?=
 =?utf-8?B?UFFJNG13YUd4ZnlJTDMrVDcxWVZFU1VzU1JRWXZrb01yTHdXRXpVTGVoKzFo?=
 =?utf-8?B?ZU5oZUxlRWZmSWg3Yytmb1FZOFd3TSt5Q3hkOUpUakxWZjNGQjJ1aWxoUGhI?=
 =?utf-8?B?NTNwUEZSQjN4Q1dzc3FyODZldk1QQmxoYVlwS3htTWh6QXUwS0pNQXVCOU1G?=
 =?utf-8?B?emtTYzdVaGxhYndoVDJwSWZNUFRQNDNVczdWRFJXQklpYko0MnJ1dmVTWkw0?=
 =?utf-8?B?ajkwWUZGUXNQR3BEalcwbXdUZGw0RkpacUVhVTk5ZlRrMEJXQVZTZW8xVDFz?=
 =?utf-8?B?YzN2KytzVVB4YktQbi9reUoycTBWTCt6REFDT2VLbDUyY3czK05mNXZRMm9Y?=
 =?utf-8?B?MzVEckFSYVJUTkl2dUsyQklHazliaFU2LzdOYWFnaUh3OVlvYjZ0akhkM2ZM?=
 =?utf-8?B?dUVMaWRWZDk2dVRWVUhtMkxrNkhPNks0MkxTdUU5aFhYTVAvNGtnd1ZPaEp4?=
 =?utf-8?B?eVpEK2hIRm9pclQwdnVpcHg5djVCVXNQbXFUalBuL3JOQWFQbmVxZTNkVFI1?=
 =?utf-8?B?bDBreXNqZVpwMDc1N0l5dGhPNlR4K3FRVTlEUE5MRVdSMXZUWnpkZFpLdmJ2?=
 =?utf-8?B?d3k0Z241MWRsU1krRzlpTTg2aVRIcjBiNTBhU2FJUWFHSjZMdC85dFRNSXpx?=
 =?utf-8?B?dDRBM3V1ZzhEOEdHb3BuMWNINXM5NVR0ZmxkSlRhNW1LTTBIVThXbFlISkNR?=
 =?utf-8?B?aVFid0ZXTEFtcUpka2pDK09RaDRCZlRhVEJGSENpZWUvWGlLWW9zSk53Zldh?=
 =?utf-8?B?eWNPSW1xTHY4eTJxQkdNUU9KdnJOaG5Cb0dyWXlCOSsyenpEOWNLYW1PTVNJ?=
 =?utf-8?B?NFo5amFjUWtEKzJVSTlNRmRPY2p4YkJ4WWYyb0k4UTc5UWd3RTN3b2ZGNzda?=
 =?utf-8?B?V2l4U01YT09NbDF6ZTQyVCtXS3pSL0ZtV05mWjdmSzAxbk8rZ2czaEFONkpu?=
 =?utf-8?Q?9yec=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <97A807B096C9D14C8F5B494D1B4781B2@apcprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d27c921c-13b0-44ed-445f-08dcc8ccba14
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2024 08:21:20.0492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zHET+NErFKydrdyo15PVk3Z/UzRi0CrSePeSUQkfbWhZRk8YJhWRj/v7Z2L3abUPMPzHAj4wpNJNVkHXhclVaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6859

5ZyoIDIwMjQvOC8zMCAxNjowOSwgS3J6eXN6dG9mIEtvemxvd3NraSDlhpnpgZM6DQo+IE9uIDI5
LzA4LzIwMjQgMTQ6NDEsIFl1IEppYW9saWFuZyB3cm90ZToNCj4+IEVycm9yIGhhbmRsaW5nIGlu
IHByb2JlKCkgY2FuIGJlIGEgYml0IHNpbXBsZXIgd2l0aCBkZXZfZXJyX3Byb2JlKCkuDQo+Pg0K
Pj4gU2lnbmVkLW9mZi1ieTogWXUgSmlhb2xpYW5nIDx5dWppYW9saWFuZ0B2aXZvLmNvbT4NCj4+
IC0tLQ0KPj4gICBkcml2ZXJzL2J1cy9xY29tLWViaTIuYyB8IDYgKystLS0tDQo+PiAgIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvYnVzL3Fjb20tZWJpMi5jIGIvZHJpdmVycy9idXMvcWNvbS1lYmkyLmMN
Cj4+IGluZGV4IGMxZmVmMWI0YmQ4OS4uZGJkNmE5OWJjYzk5IDEwMDY0NA0KPj4gLS0tIGEvZHJp
dmVycy9idXMvcWNvbS1lYmkyLmMNCj4+ICsrKyBiL2RyaXZlcnMvYnVzL3Fjb20tZWJpMi5jDQo+
PiBAQCAtMzA4LDEwICszMDgsOCBAQCBzdGF0aWMgaW50IHFjb21fZWJpMl9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPj4gICAJCXJldHVybiBQVFJfRVJSKGViaTJ4Y2xrKTsN
Cj4+ICAgDQo+PiAgIAlyZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUoZWJpMnhjbGspOw0KPj4gLQlp
ZiAocmV0KSB7DQo+PiAtCQlkZXZfZXJyKGRldiwgImNvdWxkIG5vdCBlbmFibGUgRUJJMlggY2xr
ICglZClcbiIsIHJldCk7DQo+PiAtCQlyZXR1cm4gcmV0Ow0KPj4gLQl9DQo+PiArCWlmIChyZXQp
DQo+PiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgImNvdWxkIG5vdCBlbmFibGUg
RUJJMlggY2xrXG4iKTsNCj4+ICAgDQo+PiAgIAllYmkyY2xrID0gZGV2bV9jbGtfZ2V0KGRldiwg
ImViaTIiKTsNCj4+ICAgCWlmIChJU19FUlIoZWJpMmNsaykpIHsNCj4NCj4gVGhpcyBjYW5ub3Qg
ZGVmZXIsIHNvIG5vdCBtdWNoIGJlbmVmaXRzLiBBbmQgYWdhaW4geW91IGNoYW5nZSBvbmx5IG9u
ZQ0KPiBwbGFjZS4NCj4NCj4gVGhhdCdzIHBvaW50bGVzcyBhbmQgY2h1cm4uDQo+DQo+IEJlc3Qg
cmVnYXJkcywNCj4gS3J6eXN6dG9mDQo+DQpJIGFwb2xvZ2l6ZSBmb3IgdGhlIG92ZXJzaWdodC4g
SSB3aWxsIHJlY29uc2lkZXIgdGhpcyBtb2RpZmljYXRpb24gYW5kIA0Kc3VibWl0IHBhdGNoZXMg
YWNjb3JkaW5nIHRvIHRoZSBncmFudWxhcml0eSBvZiB0aGUgc3Vic3lzdGVtLg0KDQpCZXN0IFJl
Z2FyZHMsDQoNCll1DQoNCg==

