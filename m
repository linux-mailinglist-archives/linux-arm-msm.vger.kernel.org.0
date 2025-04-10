Return-Path: <linux-arm-msm+bounces-53759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F10A83874
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 07:34:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FA091B65B66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 05:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A651F09B2;
	Thu, 10 Apr 2025 05:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="rX+4OWlr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03olkn2060.outbound.protection.outlook.com [40.92.59.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F83A1CEACB;
	Thu, 10 Apr 2025 05:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.59.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744263286; cv=fail; b=I+Tu/o/AJlZTAm6XlXbXdLLhJE62uXAj1MI1yMicow4pUVtMk1v4vclOSwfabZakVCVCO/AuYXNaWRSeo/5CxKsqBcVdmA0EoqMsh/RRIvPlQSJNyB8wqYOX9TcdignadCC4sTMYzokyTWsOmQzGd6OT4XFPBPCaDsBVWGFQCyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744263286; c=relaxed/simple;
	bh=pDp/8EKGzTUGItKtqqYCEvnbfc0mDsUdrvkk2xNIapg=;
	h=Message-ID:Date:To:Cc:References:Subject:From:In-Reply-To:
	 Content-Type:MIME-Version; b=e3R5Ofkfz4CxA0eOFpKSiodNWZWBYBDV1PobYzjTYAhPlNxOGrGqjtsGZg8+C7161FVxak6eVb1EJngOcosjT22sWgtRoctMzo1/Nww10Cbu69lBAZ5e8Zt/hJtBlAo/bT7fVuWsVJ8jDWTC3UrraJuNB/Kh948BUKLfLai2mCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=rX+4OWlr; arc=fail smtp.client-ip=40.92.59.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOPE294NLh7YNTAzUVMsOuoH454LdCbWbZn9JYP9b17nbjmcwdIDzK4/YkTtdQlROtkdmByKA3a20Poi78oKJoc15QJeRSMD7nSWoe5g885gRo/xuZbYm2oiWTHTUIljNxf+a504K0/8gSMpGhtDQ0uWeeTqImw8V2Kdsbjg1FkNaDgHpnxU3WZANRf8A5DYwCoKo9WySzEUnss/ZGOTlxwPH4O14R8mfmQ82qtdkDmrhSnpw/SWSVN4fvtXJhESTxTLQnHFDVen8ae0TZNpedrm+Fm+JtpmzwWStZyyvEfgmO5yYwgPaiHAnFbgUlqqpmE+ee6Lt+u+TwuQkBSKvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLfYgB3MOInwX05QdUvygxwBuUh+EiQWM+wH/8D9Dzs=;
 b=q0ZJDA7bqKZMeYrovbE2gdW5ipdauc6WIyvBsE2yvdVYabgruHUZRdBAXDinuzoweEa/T+QI5Lcve4Kggl6HQqsJpU5js+1H1pVuk1COLxgwPLBxn+yy5rf6nGJNNG75wTmuvqbVHwsmidkpbL4VWFQKvWdpR49AYqlI4kemgr/9gAQ2Bfc4+Vv2BMcohahY+IWFGs+Z/2Di8VCmtrnBjoEN7Wcqerxrg9xAmuGR1mbSokoddF5nEs8GGvy+PGvewH5i9VSosVRqcF/8jx40eKo3rhGvqhLkirqDs+SNze8R/65cIqNWJ77RAY+N1D2RDyo6aA/tcdXj+gThsB4Qkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLfYgB3MOInwX05QdUvygxwBuUh+EiQWM+wH/8D9Dzs=;
 b=rX+4OWlrBs8Ntmw4U9I41heY90ESi/YK9UIqnoqYJr9Ipz+kiDLNVsw9jJOWe1NJDRKzTo6MO7mhnZa+C8jCvVKVm48hqIYvHxMNfiLgwSU5imIHUj5VAzx06TXCH6KwTyxhz5Wd5VDiLUatv1ckYZyp60aWEMCArLITXuyMA0e9LGxiVHHhbETTTKprlsVjT/SbGtdSifTQkkNSEK6u6X8S8tO8HbY4RrJ9J/g382Gt7GmRz+PXoZEjjTWoYGYA5tXQqG+/YDcbipwbELqIqxYn/NwvMJT7S9U8PwlxbqDtqP9bPhfnkjtmT9OXvEuSJbqnjzYGIRr0gvvKZC2tZg==
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::17)
 by GV2P189MB2211.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:7b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Thu, 10 Apr
 2025 05:34:42 +0000
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a]) by AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a%5]) with mapi id 15.20.8632.024; Thu, 10 Apr 2025
 05:34:42 +0000
Message-ID:
 <AM7P189MB100977CCFD602396E8F01FCBE3B72@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Date: Thu, 10 Apr 2025 07:34:41 +0200
User-Agent: Mozilla Thunderbird
To: juerg.haefliger@canonical.com
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 konradybcio@kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org
References: <20250408145252.581060-4-juerg.haefliger@canonical.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: x1e80100-hp-elitebook-ultra-g1q:
 DT for HP EliteBook Ultra G1q
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <20250408145252.581060-4-juerg.haefliger@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P191CA0032.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::21) To AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:175::17)
X-Microsoft-Original-Message-ID:
 <93243ae4-f438-4b61-9a3f-65e8f01e051e@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1009:EE_|GV2P189MB2211:EE_
X-MS-Office365-Filtering-Correlation-Id: 944a73fc-0f12-4a5b-f1a1-08dd77f164ad
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|461199028|6090799003|19110799003|5072599009|15080799006|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXo2OU5YMTR0ZVhuZHNCcWVOWmdsOWZXdWVEdGxCelBHaDV3NTcwNUhyemh4?=
 =?utf-8?B?S2tDTCtJVVBDWnJuMWZXM2gwcE5Dck4vZm5DVll5YWNuR0g0TGptZDFMSVd1?=
 =?utf-8?B?eDBxTEhBeWFYc2ZwYzZOWnkvREFGNXlXcTJSK3hKVTRMMmJKejREMWxKZXVi?=
 =?utf-8?B?RnJkQXJRM29RWEx4Y1dXUEpzelVBZlVWeFNwN2N6Mmpua3dPWHoxSEZaNFVa?=
 =?utf-8?B?Q2R3VE1XRC90YTZLZ0hoV0dpVTAzOEVSSWdPeTBFWm1RM3B2NVN4UGhtZHc0?=
 =?utf-8?B?UlFac1puOVd3WkExSjZOTHcya1BVNlh1aUpNTHZObDRPK0Y5N1g4Wnl6QlUz?=
 =?utf-8?B?TWg0TXlUa2EvVGNiKzNJdjhtK2lTMGp1N0pWYU0zSFUzelN6OUVLRiszWGs4?=
 =?utf-8?B?czAwdk1GUStXZUdmTm4rbmZOcUNXOEtVNXI0OGxqak9lbkdZU0kxeHFqU0sw?=
 =?utf-8?B?WXd6U2EydjhDdHF6Wk5HY3dnbEE2bTZ2SEl4Q1d1cEVzbTdvSGkwWmhPWWJp?=
 =?utf-8?B?dmxKc0g4Zk84NGJuZDIzM04yby9kMTk4MG1QbVhmUzhDSjlMNXJER010dzc3?=
 =?utf-8?B?Z3hmS3JNLzRUVHltTCs0WkVaSDQ3VVpYNWhNYUxPblF6Zit5VEh1TjdhZVh0?=
 =?utf-8?B?STR0dW5BZG11SnNubWdnS1VOZWdtdjV6ak5JdXpiRFQ2RGxMNVZNMTZnUDZC?=
 =?utf-8?B?WnE0ZGtzZ1hQclhZSGhQaDlKMWVqRnJXY3RJMDhjQzJabG9lcWdreGk4dDlN?=
 =?utf-8?B?bXpzRmZ5SjVTdDFSZFJtczFzRUUzR2FNSmxvRTIyWWVCN2FQOFFRemVUVTZL?=
 =?utf-8?B?L1laNWZPa29EbnFGbFNEWHkvN3ZxMTFXTUVyOGt5TVphamRZeVRkK2s3cVE4?=
 =?utf-8?B?YnF6WWNESmhyZnQvMHh3a011RFBMcXk1dHpFeGxkYy9uVUJnOUxMT1BSVUtE?=
 =?utf-8?B?NW5uaG1FYmtvZDNMSVBKT3hOQ0I0aUFXMjd4NWtiR0t3cGJ4Y1RsdmxucW1L?=
 =?utf-8?B?dS8yRzk2SzJ5bm91STVxQTErRDBBS003K3h5MGp5emgvdGRnTnU4S3dtR0Nw?=
 =?utf-8?B?V0ErcjYxbXVINStSM2JrUTg5VUNIZDdxV24wSWw2R2xkdTdSbzdPMlh3QUFX?=
 =?utf-8?B?WHlVWHVadDRQc29qVjFxV3lod0x4YUhKNEFhZHRTTFZTNXVuNnVxNXAxQzAr?=
 =?utf-8?B?WUJIYXd3ZGdWZkZkREJjZFplWThSNEJGUFNLT1UxeGNIUDBPZ2ZMai9UbHlS?=
 =?utf-8?B?czFBWFRtd2k4SXdLOUliaHk0bGcwWEt4eHFKY3FTRFdqaGRNM0dkdEh1NXdE?=
 =?utf-8?B?cTZtUUxrbzZ5TGxKUDFnVzlrVDBVdEpERzdOOUZMbjdFaFI0TGg1eXd2aEJ1?=
 =?utf-8?B?VXNVNThqUEY5MzN5UHZCekt0dU90alpKRnQ0SUljTXhOayttRWdmbXZLL2N2?=
 =?utf-8?B?N3kxcCtidU4yOC9CWEpBMlBDSjdYTkdJcW5YUVdUQlhUdlFVbHhiL085Kysz?=
 =?utf-8?Q?/5WbHE=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkNENDJKenEyRDJpT3ducmlFV0JwelA4VnJKbG15SWxsQkU1a1FubGNaZ3ZZ?=
 =?utf-8?B?ZWVIYURYVzJ0NjhFdVBTWW1GWG1VbkxOWWZsWjV3bDJzY1gwZ0lmTE0xRmU1?=
 =?utf-8?B?cnhnVTZNZzRNeWZmSndJbGJMZzVRK0tIakNmTFFwREdtazA0djJRc3dWbzlU?=
 =?utf-8?B?VzVPUmtsVGdyeXYvSStGbDlwWnUvdDFyR2RaY1dFUkwveThsN0p4cFRtT2Fx?=
 =?utf-8?B?K2gxSEpiWlBTa3NBN3VneWJZRnhiWHd4WDZleW9vVlhoR3JPWnRlVm0xVUdV?=
 =?utf-8?B?dW94dVVsbHFacDBrL0dkTnA0YXZadjYyMGxsWWprbkQ5bGx0d0ppNEgwbkdT?=
 =?utf-8?B?UDh1b2ZLMjFHRzRTa3hjMDduRDBpaFpHblVqZ0RiUXRxejdKZytzYUNTK3dp?=
 =?utf-8?B?TkR4VURKTEFBRzNPNlJHMEpVK3ByQlZ2OXBXVzgwM0JLSWhueE54dWptbmFx?=
 =?utf-8?B?MEdVM1FnRVdaekVYMDBBRnFTbGI3UC8rNXJqanRPTk12N2FIMExsWWhvdUs4?=
 =?utf-8?B?Yk9GaDRCaTlGdDdaUTFralZQUitOZTQzTkkzUkhldWRDajkzVEJINWpWVktS?=
 =?utf-8?B?UGVaMi9jdzU1NzJra3dkOFVJSUhneG1DVmQzSHhDQVY2SjNjQmpET1B6SVUv?=
 =?utf-8?B?TXMweld6cGVIYXBvZHlTSDNsaUcrZ0ZVY1VIbWpybHRyTm0xQ1hHMEZLSXpV?=
 =?utf-8?B?OHkvM05QTTVGbmhZeld6SXVwQmdnTEs1SGxtODNNci91YUR5ZVBVeDUzb2pq?=
 =?utf-8?B?NXFpTlNGeHM0RGhNSFM2K2ZJVksrWXlsSE5tN0lMUXMrdENUbVFRTmQwNXB4?=
 =?utf-8?B?eGZxL2Z0WWE1WG9ZbWhLM3NBSVRIOVEwdzd5cFltV2V6OFhHM3Fod2oycVk0?=
 =?utf-8?B?Rzc1ZzBFS3U3R2lPWEpZaXc4WE42cUNGeGM0eVliTU1OdGNRN3RKdnFWSGFj?=
 =?utf-8?B?b083eVQ1ZkxEdXNFSURnaytoQ094S0hmVVNrWWdEMHF1TGZlaG8rK292Yy9u?=
 =?utf-8?B?MU02NGpsZWhqamZJYnNqdzZ4SFlCN1V0NEtINEZEMXY0dzZBcEtSZUxySlds?=
 =?utf-8?B?NHZpdm1BcnNVbWdTWitkQWNpSlp2bzdpUytVNUVkUW8xRERqaGVwRzFlQXU0?=
 =?utf-8?B?cVZwVkdTdXhJVmxaWkdBSlZwK1NwdzJYT2ppakQ2bE5ib1RzcVNubm1qTW1u?=
 =?utf-8?B?MzlzZlQ1dmxVdGVwcDBHa0R3SERTMVJ1MERiWkV6WmRGUzlnbFM4QUVzQy9M?=
 =?utf-8?B?RXA5OGZMb2ZhWVZYazJCWi9UdHI5MU5XYTBhSWVUUU9yR0N6WVIwdFV6dnhj?=
 =?utf-8?B?WEt2ZTRWRHV1M2NvZTNHSlExYWJSajh5MnJUbXRIUU81WDlSdFAxRmd5ZUJJ?=
 =?utf-8?B?dzVUM1NnMndZRERnZjVNcnJMaER4TDEvSG5wTm5LOGVNSDZGVEdMekV1Mmlt?=
 =?utf-8?B?b1B2MThWWDRaOFBMV2lqYzRFQndzS255eER4OXh5Q3lVdjJpdFdEenNDSEZn?=
 =?utf-8?B?bmQzdTdIWkhyTVd2bCtZQ003SXQyY0JoLzBFMXFMSUlzdUZXNk5JUFRoVVFE?=
 =?utf-8?B?Y1pQMjhYelVBRC9PQXZGZCtmNlJRSGdzWHEzZ01QUGF1dnpNV21JVTYrRllF?=
 =?utf-8?B?ZFZraE9DVmhxQ2w2OU93RGFjMjIxaWdqUnlWdGtMdUJ5eVBzQTNhNjg3alkw?=
 =?utf-8?B?SkI4R1p4aGJVNGNVM0dMNExqaDdnemFRalQ5V2NRWE00OGVzc0tPZStOc2dT?=
 =?utf-8?Q?58AI1udhJ3SMX7DwsB1KUoD4RuBM1yFXM5fEIrc?=
X-OriginatorOrg: sct-15-20-7719-19-msonline-outlook-3b3e0.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 944a73fc-0f12-4a5b-f1a1-08dd77f164ad
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 05:34:42.0599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB2211

Sorry I messed up and replied to the wrong patch somehow, this comment 
was meant for this patch.

 > Introduce a device tree for the HP EliteBook Ultra G1q 14" AI laptop. It
 > seems to be using the same baseboard as the HP OmniBook X 14 so just use
 > that for now.
 >
 > Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
 > ---
 >  arch/arm64/boot/dts/qcom/Makefile             |  1 +
 >  .../qcom/x1e80100-hp-elitebook-ultra-g1q.dts  | 36 +++++++++++++++++++
 >  drivers/firmware/qcom/qcom_scm.c              |  1 +
 >  3 files changed, 38 insertions(+)
 >  create mode 100644 
arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
 >
 > diff --git a/arch/arm64/boot/dts/qcom/Makefile 
b/arch/arm64/boot/dts/qcom/Makefile
 > index 710879d94c00..3d98bb95e8b1 100644
 > --- a/arch/arm64/boot/dts/qcom/Makefile
 > +++ b/arch/arm64/boot/dts/qcom/Makefile
 > @@ -294,6 +294,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= 
x1e78100-lenovo-thinkpad-t14s-oled.dtb
 >  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-asus-vivobook-s15.dtb
 >  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-crd.dtb
 >  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-dell-xps13-9345.dtb
 > +dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-hp-elitebook-ultra-g1q.dtb
 >  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-hp-omnibook-x14.dtb
 >  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-lenovo-yoga-slim7x.dtb
 >  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-microsoft-romulus13.dtb
 > diff --git 
a/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts 
b/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
 > new file mode 100644
 > index 000000000000..9f3aac1a83fd
 > --- /dev/null
 > +++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
 > @@ -0,0 +1,36 @@
 > +// SPDX-License-Identifier: BSD-3-Clause
 > +
 > +/dts-v1/;
 > +
 > +#include "x1e80100-hp-omnibook-x14.dts"
 > +
 > +/ {
 > +	model = "HP EliteBook Ultra G1q";
 > +	compatible = "hp,elitebook-ultra-g1q", "qcom,x1e80100";
 > +};
 > +
 > +&gpu {
 > +	status = "okay";

status should not be needed as it is already set in the omnibook dts

 > +
 > +	zap-shader {
 > +		firmware-name = 
"qcom/x1e80100/hp/elitebook-ultra-g1q/qcdxkmsuc8380.mbn";
 > +	};
 > +};
 > +
 > +&remoteproc_adsp {
 > +	firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qcadsp8380.mbn",
 > +			"qcom/x1e80100/hp/elitebook-ultra-g1q/adsp_dtbs.elf";
 > +
 > +	status = "okay";

same here

 > +};
 > +
 > +&remoteproc_cdsp {
 > +	firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qccdsp8380.mbn",
 > +			"qcom/x1e80100/hp/elitebook-ultra-g1q/cdsp_dtbs.elf";
 > +
 > +	status = "okay";

same here

Kind regards,
Maud

 > +};
 > +
 > +&sound {
 > +	model = "X1E80100-HP-ELITEBOOK-ULTRA-G1Q";
 > +};
 > diff --git a/drivers/firmware/qcom/qcom_scm.c 
b/drivers/firmware/qcom/qcom_scm.c
 > index fc4d67e4c4a6..e7262ad11509 100644
 > --- a/drivers/firmware/qcom/qcom_scm.c
 > +++ b/drivers/firmware/qcom/qcom_scm.c
 > @@ -1987,6 +1987,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
 >  static const struct of_device_id qcom_scm_qseecom_allowlist[] 
__maybe_unused = {
 >  	{ .compatible = "asus,vivobook-s15" },
 >  	{ .compatible = "dell,xps13-9345" },
 > +	{ .compatible = "hp,elitebook-ultra-g1q" },
 >  	{ .compatible = "hp,omnibook-x14" },
 >  	{ .compatible = "huawei,gaokun3" },
 >  	{ .compatible = "lenovo,flex-5g" },
 > --
 > 2.43.0

