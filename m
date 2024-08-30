Return-Path: <linux-arm-msm+bounces-30243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C89965F9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 12:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B98D289C91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 10:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D476918FC67;
	Fri, 30 Aug 2024 10:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="fAup+M+i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2065.outbound.protection.outlook.com [40.107.215.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA04D1428E2;
	Fri, 30 Aug 2024 10:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725015144; cv=fail; b=JyRfQk/EWaig6CChKoapKkV3sJFJFGXwdpvKgYZFkTHsTTuv4EEmXNe266pF0N9Sg5eHqg8W/Z09WVGBry1prF0hQQ3Xjo5ynhxwkpgc8GRoAxMNGC3tTrnSawB3TcmYazmsLmSrDnFEF++VHdD21RtnihfcP0b5ukqgkfRjiqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725015144; c=relaxed/simple;
	bh=8mIs14/EVCNUc0UaiQgcKSzbUehZU7MfvcNOJkVdCd0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d6N8iEVnVZpC7SfqBe+8NmgqQRhKLAWtt2sy3IyPHjBUJ0rcwkLoduo5JLj4LklR/+GUdmqyvP78r6VSpZ3j8GyiPCSePwfKTHjG2I2RG9QBt3V+TP2hENBtNB8JrCg4aOG4u6eWx/DtCbAzZl/ubbrdMRVfw8DXgTnat9cc1g0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=fAup+M+i; arc=fail smtp.client-ip=40.107.215.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFxtEzylMAbmH/Qsb6a9oE0buWCQKghYwE2Ojakz6Nb96RxyRMHH0I3X0L8YKq88wIHzloiM4L2kE6xxjimxaTgxCnqZI0bPhUgaDXXgHh4ccGnhLX012+E/PcZXYJBT7Qfb4vSBsh31SdT6+KoJInPXq2xAYoZoWTUyzhnIFFbI5jyk8z/FwrYQmpUvhfpSMd5k8L6kGM92tUyH8VKL9HjS3DWYJzyf8tGoDszsKgrLjkl1pjuuj7pTOCAoVZAUdc7vFT7kENuyVy+wJ/nVS2S566ai6zyNYYCTjgCElrjenmpXfgWg3DZ3ObVBDoKiDbEr9tI17gMq8FY4gbj30A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mIs14/EVCNUc0UaiQgcKSzbUehZU7MfvcNOJkVdCd0=;
 b=ovvOgGzQeANMHQdxh95Bvuv/mVfZ2wkKVWFkRuX/i0LH2vMUs9QO+GXZQ0VKxSJk0TUVCs6raZHTYKgkVb6JFjCLpm3XLIZpmtCmGAhK1XccudZQOhoButJavcmEffoBGaYNezlVyrTsZ0QLxDsHCfaAgnbxloQXAqqRwCwzbozSbT9iYS99EPaV1o52rnqAeK0aKNCIo3LAV589Sk5R6Q2FMU3wU1Ysc29AxWDJWX1KNpH5siFZVrsgt7Nzg98uWqWRrZggF9CDnfKuO3Ba8se/tfFb2TaWZYh6HsEQ13w6lKEpV3TSsLhR6ITR4hbh69OkW/tQ8P0Qii9lkPWZJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mIs14/EVCNUc0UaiQgcKSzbUehZU7MfvcNOJkVdCd0=;
 b=fAup+M+i22Hwp25zYnCZpNiEieC2j/GuuA8QwvWs+vPJqcqUrYfE7CqvE/4u4CaerO+blpjzgdGlrwBHLtFp4fZ/CvUaJGDPa+7Q8BM2ZHCCmRRu2sC1wQItmbqEN7u20u4giTCGkTN5O4pZxr+7HTSHBo9dzOXUXSBHb40h7COcYIGl4oXQjyL35frKBecNC2DepuXdn7iOK+VWOHFkydn3n6FM/i/W36dhZGqY6Y9iSSRfMkJQuuLSXrvMR5q2Pt2uMEabc2yCK4BVQHYV6Jn7C0qxgQZvu11oMmnWqAlcVlaXdprEz2yGOfJtnMnsUZJ2u5ST7tmmh/mKbMTg9A==
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by SEZPR06MB6928.apcprd06.prod.outlook.com (2603:1096:101:1ea::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 10:52:18 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%5]) with mapi id 15.20.7897.027; Fri, 30 Aug 2024
 10:52:18 +0000
From: =?utf-8?B?5LqO5L286Imv?= <yujiaoliang@vivo.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: opensource.kernel <opensource.kernel@vivo.com>, Bjorn Andersson
	<andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] soc: qcom: pbs: Simplify with dev_err_probe()
Thread-Topic: [PATCH v1] soc: qcom: pbs: Simplify with dev_err_probe()
Thread-Index: AQHa+hG8MwKzS5RcXkKSqhFwc1S8yLI/c4KAgAAttoA=
Date: Fri, 30 Aug 2024 10:52:18 +0000
Message-ID: <5c558e3b-2d65-4045-816a-5e9415d26b8d@vivo.com>
References: <20240829124813.3264437-1-yujiaoliang@vivo.com>
 <894145dc-46fb-451f-a461-d0b9ff1e50dd@kernel.org>
In-Reply-To: <894145dc-46fb-451f-a461-d0b9ff1e50dd@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB4461:EE_|SEZPR06MB6928:EE_
x-ms-office365-filtering-correlation-id: 16b0668c-d84e-4a71-4f1d-08dcc8e1d144
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?elhhYUFidFo0SHg5RVRLSEdueURzZEU1S3lxc1JFNVFlcy94U0MvcS85dmJk?=
 =?utf-8?B?N3EvK3dFakd3SUNnNERDbWZFTjJuWTZzOUpNSFM1ejE3V2k4M1hzZTdmdm9L?=
 =?utf-8?B?b0hoMGVSTnl5dFBmSWJIeVQ1MzlYcHM1UFJPUnNKYTloeWlHSW03aE5YakR1?=
 =?utf-8?B?bE5wWjhhMFdQUGZWUFJ4bEllV1kwYWlCd3ZUUk40Sm5FQXlWTTAzb2dHV212?=
 =?utf-8?B?K01nUWNna0xpVXhSbDIxT0s1KzNPRVhQaStpVGZyWEpuQmZpU3FRWlRhd2xW?=
 =?utf-8?B?b3pMWkNpa08zS21iQkluQmV0VFVUaTJFbWh1N210Rm4zTU1HNDhta2Nyc1Jy?=
 =?utf-8?B?NzdLdkVQeHROaGRaUXpIbWxxdU9aczJlOTcweWQ2VGhrQlV4NWh4VGljb0VJ?=
 =?utf-8?B?TmRiK0E4QUJDd2YxTkNOSEI4R2JrNkRsa1BBRkNiaGZzUSswRFppY2paWnlz?=
 =?utf-8?B?UnIvRHBkOHpFSkxwcEJrdGRNTkRVZ0Q3TGxkYlNqQ21EL1pFdE8yTEkwNWtL?=
 =?utf-8?B?NmlLV0dpSDNnTVpBMmxtODFuY0JaMm9hOXM5disrNFNDVC9IWXppVjBncjBj?=
 =?utf-8?B?eDNaZ29YdDBGVGpQalBtdGJ4KzJCVlRzNnZIcnFrMDNjVjZoRlRQbkJiMlVj?=
 =?utf-8?B?SEFhUnlHZ2J2ZGRvVG5jV2tpaEpScHFTRHlXRnIweWI5WnB3V1gxOWVHYStO?=
 =?utf-8?B?bzhVKzRZSWZsNW9WZ21JTmxNeWtESVVqcEdVc3ZqUHlPRjFsMVk0V1FSeFBa?=
 =?utf-8?B?ODRzUkdXbjg4THVSNFFLS0RzU3JSMEtuZzQzR1F5emcxaEpBR3pyYjRNUDNa?=
 =?utf-8?B?YVVVQTFhaFN6Y0IxeUNnbjRuTkFYU1lZb1BSeS83cm5ObGczelRBcmR3NzY0?=
 =?utf-8?B?YU8yNzEyOVVaeVlHUHhRVHQyckorakt2QmZOWVd5MzRpT0QySHFpTFRqYTRE?=
 =?utf-8?B?RVNadmp4bm83WFBuQkZuRjFReFRkOHVicUhoTkkrODc3eGpSZ2tZaVVxUWxm?=
 =?utf-8?B?MllKSDNFVm55dXRmK3luUHV0QjFHSjBvZ1lNM0p3VmJEalViMkRTQnJCWGRY?=
 =?utf-8?B?K29Gb24yVVpKWS9YSjFOdFZhQ3ZSOTFtM1ZpeU5NdzF6NlQwMnl6a2x1bkR5?=
 =?utf-8?B?YjBjcWxyL3BlV3ZkVWE2NUlCYmdqS2R4eWp4ZGxuSHdTVEh2OVFMRXMvRG0y?=
 =?utf-8?B?cDZwTFdIdmRBOGFNV2NjalQ2MEZYU3dZVk45WDJnbnFrT0kydUxsTWRqMGFz?=
 =?utf-8?B?bHVZQ1Urd3lyRkljTFhIb3U3UlBVNTdDbmZSRHFhQmV6YXJnZ0J1dHZtZnFR?=
 =?utf-8?B?MURMOGdkUC9qT0Vodk1JdE50eGhjR0tSc1N0U3JLbU1idkVmbkNhL2pKQXVn?=
 =?utf-8?B?aHh5NzM0UVJ6bGJhYnFQRktFSDRpUlN3UlpybXd1Y3lVL3Q1SzltZHJQMEkx?=
 =?utf-8?B?ZnpiTkxFNXlmVTcyMDJSb0ZIWFdTREE0TkM2UTdnZllNckIvU2V2NVlFS3JP?=
 =?utf-8?B?dlpxK010TVppU0lBYm5CWnE2eTVNVlVub05MdzRBeHpaakhhNCsxOExjTERE?=
 =?utf-8?B?TURXbkFPWXF3OXZ2NnU0OGgxS2c4NmRTT2Q4RXQvdnQ1MnRSYUJoTUVabkZk?=
 =?utf-8?B?cXpoR1pXeHV1UWhtaEtpSk1ZaGcyRmlJbWFNTk9zMHlQZkZPcW10bCtWMjBa?=
 =?utf-8?B?ekNGcThpZmJuUHNsdFdncVdoSXBXZVYwZTliSHlNOUFVL1J6eTFKYjlRR1dS?=
 =?utf-8?B?TDE1dnUzREFLVjJ0Y05tM2pVS29saXR3UDdUTkxFSk5PYkJZcFNSNlJxblp2?=
 =?utf-8?B?VDJhZ3JIRFJ4ZUxQbEM2MDhOSG00VmdoOHVOeXZMbDBBSkpEcXBobFNqTVFV?=
 =?utf-8?B?WHd2a0NndXE3WUFqMmRUZFFXclltVkFJTC9nNTN4VFhaVFE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4461.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U3JwcG81anhpdzErYncyUGZRY1JWN2d1d0M2MlhaRXdZVGRKRm44UDRoT3J2?=
 =?utf-8?B?WkZ2VEJrOEh1QmEvVU9BNGd1QXRqUzkrZVVrMTZwZmhPUWFTQ3Y2TlRydUh6?=
 =?utf-8?B?bDdaU0d2ekk1dXBlVFF2dTQ2aFdnWC9lczR6NUxQTDI0RTRPMlJkbUpGc1ox?=
 =?utf-8?B?cDJmejlaWmVJNTEvd284TlhqbkxRd0w4R0I5S3l3d0lYVzRIaEtVZU5CL2tj?=
 =?utf-8?B?MkRDMlI1MU9PUFF5di8xSU1GNDFkenZqdVUvV1JLRE14cHRoL0M5UEE3eExE?=
 =?utf-8?B?U1hBVzdMcU0zZ1BvbWIzTEJFNktrcS8rNUh0L2I3ajE3Nmd4SHhvK21qSmlC?=
 =?utf-8?B?bS9ZZWhORlZIb2R6UjVRVG1RZEdRLzk2YTNmeUxRTmhrNG92SHRweGJkUG8z?=
 =?utf-8?B?dms4NUNXL3VtL0FzdGZYSVY2SEtyRG1va1hXSGlHSUduMElOcFR1eXp4UzEx?=
 =?utf-8?B?Y1Z5OHI4Ym94TlQrNU9oQi9MQUt1UGtyQktLRWFSMGZUbEhCZUJpK0xEVmph?=
 =?utf-8?B?T0c3Q2Y5MEUzY1diaFBJMFo2SnJaNmVuWGdCdnFFakdnSmt4ZjVKbmtzdjdZ?=
 =?utf-8?B?anVPMnNmQmthbnlBcjQzem5KZTVTcmJ2ZEs3QnozcmFZcEJUWTFJeUQ5SkNr?=
 =?utf-8?B?SzlYZ3FxUldKSU1OSHV2SEZSUE11RXNQTkVTRTZrNUY3Ty82ZVZvL24vRHVv?=
 =?utf-8?B?a0pzZjYwL3JrQUV3RHJ0QURhU3hNR0I1emh6NVBIOS9vZ216K0NmT08yZ212?=
 =?utf-8?B?ZE5scHB0ejBSU1BZVE42Z2VCZlpwbGR6WkZ1YjVDRlgyYmhocWM4dDk1V3dO?=
 =?utf-8?B?dVJuZFpsY2F3Y2hjcllINlI2NVhKTG9uVmUvaGIxYlBPRHF4dDA1a01DcThM?=
 =?utf-8?B?cVNZSmE3YTVXTk9mNFpuVzdxdGFOTHFEZllrMFpPRDlTVS92TGloblI5aVh5?=
 =?utf-8?B?N0h5MHVYYy9VRThRN2NBZk5lK0RNeWtpMHdqNkMzbysyckkvb05NS1BwYlBB?=
 =?utf-8?B?cEd2TTdFQ2RYWnRPTEJVcmUrdlBQaFZpMFRVYVMxZ2RrWTJVeTJxNlFSUTRl?=
 =?utf-8?B?NGxtNTVhazR2MzIwMGhMcUg5L2dBMDFMQzhtTUZtMm40QzFYNU5LcDdQTjh0?=
 =?utf-8?B?aUppYmZzMGhQSHRpelBMdWJKV24zNjdQVHdjRXcrSVRXOEN2MEJGbExlMzBI?=
 =?utf-8?B?bGJJY1lDamcxcGtDS0ZoYzFzQmRwS0FuY01iNytjc0NEYzBPL0V4Y1FBcm9P?=
 =?utf-8?B?akh5bGdkRXl4TU0xa3NOeitINGRMRW5pWHNPL0paMTl2QVBwYXVCRitpUzlF?=
 =?utf-8?B?SjBOSjV3WGtDNDZFUVBnZlFkQTNubzdvZ1h0UnFoSEZocTVNVi8xV1BKNGpv?=
 =?utf-8?B?T1hoeS9JYkNYTGYzRVptNU16eUJKUXFtcDIzS08xTk1aOVNsbitqYVNMZ1Zl?=
 =?utf-8?B?YXN3TGlpMWhIR0ZjS3JtUXNuc20veVhuaDdzVE0rTG1SRWxNRnZjK0lhV2Zi?=
 =?utf-8?B?cGtlTUtIbWlram00WFBGK1VTQ0xvL0pjQm9OdjROUkFsL3ppY3IxemQ3R3o3?=
 =?utf-8?B?OUE1OE5YU1pPQk1ZcEpPTGVIL1RGNzFnc1ZNWWx1UU1jZTRqUElvdlNGczRt?=
 =?utf-8?B?ZStrWEY0KzQvd2p2U3haZW9qMWFJV1hjOXpOSzVtYVRzQSt2S2FSUGJXMHRB?=
 =?utf-8?B?bVB6azNMMFhNaWJ5c3J1b1Zjb0xQZkloM2NGMVZwbGJLa2xqOWNBTFJad3RJ?=
 =?utf-8?B?R1VLcllkSmxtYzdqMzVDZGI3VEFza0VrZFJwaVVPNlJMOU1jQ0svME4rTm9t?=
 =?utf-8?B?VWs3SE1iRHp6TzYrUVdHVDZlWVVzT1pyVFJ0QnJKN3F4U1FYUVdsaGVtRDBY?=
 =?utf-8?B?VWdpSHpvUi9LSkZpSCtVZW1kTEVmb3JzakpGMU1LaVdzNjJCMzZaN1gyYnRQ?=
 =?utf-8?B?S092NE9QWDBOUTZzNFc5NDhKaVplMzBTeVNuMW0wRCtYVzZTcEtFeEZqTFp3?=
 =?utf-8?B?bk9kNkg1dUh2bmthcXgrZ2U3NWp5TVRlY1prMloxSXNXY3JKQUVnYVdsMkJR?=
 =?utf-8?B?aSthQmRXQkd4SVpBb3VkQnZKY3hMNE0rR2FmbTBqRzV4RCtRV1I5NTlibmJF?=
 =?utf-8?Q?g1XQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <803A4C5ADCD31D46BCEB1C101BD2B77F@apcprd06.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b0668c-d84e-4a71-4f1d-08dcc8e1d144
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2024 10:52:18.3728
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R6WFDItFQHtFkzEmw2HuJ9Ub6mlNm89VRODkQcs7ZgRSDetLIHLt4OAjKycFbzcO8b4ZYP0lktWVgmH22YiBLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6928

T24gMjAyNC84LzMwIDE2OjA4LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiBPbiAyOS8w
OC8yMDI0IDE0OjQ4LCBZdSBKaWFvbGlhbmcgd3JvdGU6DQo+PiBFcnJvciBoYW5kbGluZyBpbiBw
cm9iZSgpIGNhbiBiZSBhIGJpdCBzaW1wbGVyIHdpdGggZGV2X2Vycl9wcm9iZSgpLg0KPj4NCj4+
IFNpZ25lZC1vZmYtYnk6IFl1IEppYW9saWFuZyA8eXVqaWFvbGlhbmdAdml2by5jb20+DQo+PiAt
LS0NCj4+ICAgZHJpdmVycy9zb2MvcWNvbS9xY29tLXBicy5jIHwgNyArKystLS0tDQo+PiAgIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvc29jL3Fjb20vcWNvbS1wYnMuYyBiL2RyaXZlcnMvc29jL3Fjb20v
cWNvbS1wYnMuYw0KPj4gaW5kZXggNzdhNzBkM2QwZDBiLi5hYjlkZTEyZWM5MDEgMTAwNjQ0DQo+
PiAtLS0gYS9kcml2ZXJzL3NvYy9xY29tL3Fjb20tcGJzLmMNCj4+ICsrKyBiL2RyaXZlcnMvc29j
L3Fjb20vcWNvbS1wYnMuYw0KPj4gQEAgLTIwMSwxMCArMjAxLDkgQEAgc3RhdGljIGludCBxY29t
X3Bic19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPj4gICAJfQ0KPj4gICAN
Cj4+ICAgCXJldCA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX3UzMihwYnMtPmRldiwgInJlZyIsICZ2
YWwpOw0KPj4gLQlpZiAocmV0IDwgMCkgew0KPj4gLQkJZGV2X2VycihwYnMtPmRldiwgIkNvdWxk
bid0IGZpbmQgcmVnLCByZXQgPSAlZFxuIiwgcmV0KTsNCj4+IC0JCXJldHVybiByZXQ7DQo+PiAt
CX0NCj4+ICsJaWYgKHJldCA8IDApDQo+PiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShwYnMtPmRl
diwgcmV0LCAiQ291bGRuJ3QgZmluZCByZWdcbiIpOw0KVGhhbmsgeW91IGZvciB0aGUgZmVlZGJh
Y2suIEkgYXBvbG9naXplIGZvciB0aGUgb3ZlcnNpZ2h0Lg0KPiBUaGlzIGNhbm5vdCBkZWZlciwg
c28gbm90IG11Y2ggYmVuZWZpdHMuDQpBcyBub3RlZCBpbiB0aGUgZGV2X2Vycl9wcm9iZSBkb2N1
bWVudGF0aW9uLCB1c2luZyB0aGlzIGhlbHBlciBvZmZlcnMgDQpiZW5lZml0cyBsaWtlIHN0YW5k
YXJkaXplZCBlcnJvciBjb2RlIGZvcm1hdHRpbmcgYW5kIG1vcmUgY29tcGFjdCBlcnJvciANCnBh
dGhzLg0KDQoiVXNpbmcgdGhpcyBoZWxwZXIgaW4geW91ciBwcm9iZSBmdW5jdGlvbiBpcyB0b3Rh
bGx5IGZpbmUgZXZlbiBpZiBAZXJywqAgDQprbm93biB0byBuZXJ2ZXIgYmUgLUVQUk9CRV9ERUZF
Ui4gVGhlIGJlbmVmaXQgY29tcGFyZWQgdG8gYSBub3JtYWwgDQpkZXZfZXJyKCkgaXMgdGhlIHN0
YW5kYXJkaXplZCBmb3JtYXQgb2YgdGhlIGVycm9yIGNvZGUsIGl0IGJlaW5nIGVtaXR0ZWQgDQpz
eXVtYm9saWNhbGx5IChpLmUuIHlvdSBnZXQgIkVBR0FJTiIgaW5zdGVhZCBvZiAiLTM1IikgYW5k
IHRoZSBmYWN0IHRoYXQgDQp0aGUgZXJyb3IgY29kZSBpcyByZXR1cm5lZCB3aGljaCBhbGxvd3Mg
bW9yZSBjb21wYWN0IGVycm9yIHBhdGhzLiINCj4gQW5kIHlvdSBpZ25vcmUgb3RoZXIgcGxhY2Ug
aW4NCj4gdGhlIHByb2JlKCkuLi4gVGhhdCdzIGxpa2UgYSB3ZWlyZCBwYXR0ZXJuIHdpdGggYWxs
IHlvdXIgcGF0Y2hlcyBjaGFuZ2UNCj4gc29tZXRoaW5nIGlycmVsZXZhbnQsIGJ1dCBsZWF2ZSBv
dGhlciBwbGFjZXMgdW5jaGFuZ2VkLg0KSWYgeW91IHRoaW5rIGl0J3MgT0ssIEkgd2lsbCB1cGRh
dGUgdGhlIHBhdGNoIHRvIGluY2x1ZGUgYm90aCANCm1vZGlmaWNhdGlvbnMgaW4gdGhlIHByb2Jl
KCkgZnVuY3Rpb24uIEkgcGxhbiB0byBzdWJtaXQgcGF0Y2ggdjIgd2l0aCANCnRoZXNlIGNoYW5n
ZXMgYW5kIGhvcGUgaXQgd2lsbCBiZSBtb3JlIGFjY2VwdGFibGUuDQo+IFRoYXQncyBwb2ludGxl
c3MgYW5kIGNodXJuLg0KPg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPg0KPg0KQmVz
dCBSZWdhcmRzLA0KDQpZdQ0KDQo=

