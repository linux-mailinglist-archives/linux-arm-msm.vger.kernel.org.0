Return-Path: <linux-arm-msm+bounces-41486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E189ECD8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 14:45:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9318A164039
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 13:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45180236951;
	Wed, 11 Dec 2024 13:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b="q2ZrGd1P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com [148.163.137.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE892368ED;
	Wed, 11 Dec 2024 13:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.137.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733924676; cv=fail; b=WMSIEeyGUKEzjeOBSddWCVBGgBmCXpRGAyUQBGe0GDVizt/boBqcOb5SKmrfNGqXlt11jbrzoaDElWvXPamzHG5LMSJWAXdKTYGISiFEUoiPGoIyxkuSVkZa39IGfaQrYAqWNih2t7gs7vZkyRnbdDLwXJlSI2VLN93zr+zqCjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733924676; c=relaxed/simple;
	bh=ls/SfsqmLBfWYbgqq8KN3UtmDW12PufZ4XcnBIGCjS8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=P/4PEbcfWBocGSjEtQQF2yAlxAZLEc+9gQYOF5LmcB5OHjzOr4o4/XgrWuXeSgwVwVXlHycFEM5vP+5gAONNvWSI18xzXzLSsBQO5RtacVjfjcFyD4E67ywC8T7RYHXv0VcKDEgpkyk53yFi46EAaN+ANrLTY9lG+Pb3dIua1uM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dell.com; spf=pass smtp.mailfrom=dell.com; dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b=q2ZrGd1P; arc=fail smtp.client-ip=148.163.137.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dell.com
Received: from pps.filterd (m0170394.ppops.net [127.0.0.1])
	by mx0b-00154904.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB98Tnn000364;
	Wed, 11 Dec 2024 06:35:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=smtpout1; bh=r
	yb0uwvZ8hBb4a0fHWXypjgVCgETH8yO4/gII5DRhDM=; b=q2ZrGd1PucMN5x2W4
	EhymjR8M7VUiap3DGuzjqtKJZiMzJNLfH3FQ2iW11P0j//EBTuKdxCK7TfjQSWrw
	R8hyDaLIBtn8RsuYlWXlJDA8S0bkmlLWNfzPoADIsmQ80a3SPCm1G4vKQjs5Gkny
	sxdZIRmwJIyEowiMtgVwmGZ9JSDNju3KB73IJdayXozdfUwnp8ySHF/MCii9fzSt
	Wt7twqp1HCtqmGd8GDL51O8Fkjr6wXlKKowW2Zk/A8fyWa4nu3OuDVdq4WCmsz3q
	YP/jFXwqLjkglLTv70EDXGviK8yZAGi+PsbghSDUbQw92V0JMmKZe8PaWpZYAzsE
	4NVbQ==
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
	by mx0b-00154904.pphosted.com (PPS) with ESMTPS id 43chta28gp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 06:35:42 -0500 (EST)
Received: from pps.filterd (m0134746.ppops.net [127.0.0.1])
	by mx0a-00154901.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBBAZnP003399;
	Wed, 11 Dec 2024 06:35:41 -0500
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by mx0a-00154901.pphosted.com (PPS) with ESMTPS id 43f982gnjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Dec 2024 06:35:40 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQeRbF0ghUdEQbl46dyHW1cEVHpyftEuWkt9c5zky0wcZt6N2Edc0L0RKFVb6scvz6KAdec8adSwZ6Kceku1E/SgUxD/cCRl7avwaGP547em1hHynhxJ14ahro45jwlX8grOBvkUD7THLqw8Zlo66n8uarpvgvkTfXxm+sMYAbwukmRX5VpuaFxbpmmUF1oTN+lr46FwwFtZ0eoQvhL2J64BLc+A9ONFodcBE0wuOA2dkGH+WOMuPQRa5DH+Ho+AF88NLzRgqfUsg2fkTvZO8xlBZOxwDMEY8bHfEvMytsxoZSI7VCZo7iIpjNxYspYwKrsDniDafrdmZK5lP14EqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryb0uwvZ8hBb4a0fHWXypjgVCgETH8yO4/gII5DRhDM=;
 b=IEzLIgqQ9sai7jce92+8npDlnWhxwkwFQAR2SZuJjC98EIrRpgp6nO/d2bPHpx2/nQB6z/Jrs9VkIb5c2NyK/lz381oWl401nlCl1AHIHoRsc2+zewlABGwd4yEXzrjWu/0E7EN1uHRJavQxAhUSzYxdzwG/s/6/a+K7WeABftAnkl8HJ/arziBvdeC7UgjroTsUvGTls/lLTKYNI6vvHKUjNbzqnrjPbD3boeKHTTeBZFj0Er50L81yxGioU4r43fmA1PFo1y9MAsNHe/d1WcUhoM1wtK5/W3F2ktChz77Fb3fcw4b5U/oldE4562KO2cGk9Y5+ceeYhxz3IcePKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from CY5PR19MB6147.namprd19.prod.outlook.com (2603:10b6:930:c::14)
 by SA1PR19MB5596.namprd19.prod.outlook.com (2603:10b6:806:238::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Wed, 11 Dec
 2024 11:35:37 +0000
Received: from CY5PR19MB6147.namprd19.prod.outlook.com
 ([fe80::d390:13bd:b078:f743]) by CY5PR19MB6147.namprd19.prod.outlook.com
 ([fe80::d390:13bd:b078:f743%6]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 11:35:37 +0000
From: "Tudor, Laurentiu" <Laurentiu.Tudor1@dell.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Stephan Gerhold
	<stephan.gerhold@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar
	<quic_sibis@quicinc.com>, Marc Zyngier <maz@kernel.org>,
        Xilin Wu
	<wuxilin123@gmail.com>, Abel Vesa <abel.vesa@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>
Subject: RE: [PATCH 5/8] arm64: dts: qcom: x1e80100-dell-xps13-9345: Fix USB
 QMP PHY supplies
Thread-Topic: [PATCH 5/8] arm64: dts: qcom: x1e80100-dell-xps13-9345: Fix USB
 QMP PHY supplies
Thread-Index: AQHbS0RfK+ByFmCJM02775fsjGwRzrLg6pDQ
Date: Wed, 11 Dec 2024 11:35:37 +0000
Message-ID:
 <CY5PR19MB61475B208EC527ED7143B536BA3E2@CY5PR19MB6147.namprd19.prod.outlook.com>
References:
 <20241210-x1e80100-usb-qmp-supply-fix-v1-0-0adda5d30bbd@linaro.org>
 <20241210-x1e80100-usb-qmp-supply-fix-v1-5-0adda5d30bbd@linaro.org>
 <CAMcHhXpvwR50GCkTvtkmWW4mvV5o9vbMvrvqLiEkJpKDHP_REA@mail.gmail.com>
In-Reply-To:
 <CAMcHhXpvwR50GCkTvtkmWW4mvV5o9vbMvrvqLiEkJpKDHP_REA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_ActionId=374049a1-96f4-43cc-8022-5b317cdb5167;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_ContentBits=0;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Enabled=true;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Method=Standard;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Name=No
 Protection (Label Only) - Internal
 Use;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_SetDate=2024-12-11T11:33:50Z;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR19MB6147:EE_|SA1PR19MB5596:EE_
x-ms-office365-filtering-correlation-id: 432b51c6-d728-47fb-693b-08dd19d7eecc
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-7?B?NTFqM0QwSVUzYzBxRlNLMXZKS1FhKy1rd1ZYOXI1RnVpU1RGY3NVSFk4bTZW?=
 =?utf-7?B?UmIzdzZ0QWZRNDk0WDN2Q2JKRVU1TzBjbVkrLVgxQkROaEd2UEV3bDIvbHo=?=
 =?utf-7?B?Ky1zelQ5YnlUeXNBR2toUTFwRjhWVmh4akNZTzVGSTc5c3IwZUtWU1ZBaktl?=
 =?utf-7?B?MndxOGxoWGRYZTZvbHU4U2tzU3JacThoR3puaEk2YXE5OXBIRW9IVGNYdHlP?=
 =?utf-7?B?ZkxRUkVwSEVaT1orLW1OWUg1Y3B5M3JCSC9tN2k3Ky04bTd2MDVTWWhGQndw?=
 =?utf-7?B?bEU0aWs3U1VrNjZHSFhURjhmdnQwKy16TjZkNUhLTUtVN1RhTmlOQ3l2ZVFX?=
 =?utf-7?B?NW0xUzdHM0cxQVdIOElHdlVoSU1RNk9JOHd6ZDhHM0JXdDZka3RKVmtRdzk4?=
 =?utf-7?B?NDBDZ0k0MDNpSjJXMjRTZXBrUmVmN1NtUFhtcWxBcGdSNjQ3aVQ5S2k5SVB2?=
 =?utf-7?B?VjBFT1plekh1MWlnby91WFc2U1RrMzZKMUtLUjB2RTh6SWhEZVJmMlF4N2JL?=
 =?utf-7?B?N1psV2p1bURBN09UUU1iZEtxdWtWZ3ZWTHZXWW1Jei9VdUY3L1ZqeS93TEVO?=
 =?utf-7?B?YnErLXJQejdkNWxITEtKdnFvMHJoUHBMRjRQR1pXS3FYMkVPVWhGY29xNjM=?=
 =?utf-7?B?Ky1iU0xBREpzYUh4TEVnbm9zVHpub2R1REpjNWYyUHNJWnRmZVhtKy02TnZ0?=
 =?utf-7?B?dENnSVhWQ0hmQWs4ZTR3aTBCZG81TmUxbGNXcHBRWXdpa0dVZDJHbDdMQ08z?=
 =?utf-7?B?VlhRdzd5R3pXQVhNNkIrLTY2MzJ5cHc0NE81Ky1XKy1xZjlRSmpNbm5YWkts?=
 =?utf-7?B?dUQ3d1lka2ZRVENDUWovVXdjdzZneUdGenNIclc0ek05d2wyOWNVQnRYeEVy?=
 =?utf-7?B?QVN0YThTTkdOODcrLW8yN21nZkVWMnZlLzJhb0J5dU9kY0kvS3ZEMkJrdXNB?=
 =?utf-7?B?MEVCMU9LYVJjS0VLSCstNUp5akxqMWl0Z3BKcFZsYSstcjNQSlpEWGxHUjJs?=
 =?utf-7?B?VEMzNEVsVG9wL2VJOGZvTTR1S2lWaHpGbEh4VHQ4QjY0U2tLbHloMXhVU2xV?=
 =?utf-7?B?ZVF0YUk1V2E1Y0IwUy9qdjV0WTVQdkVRZUFVM0FlKy1jZ2xrMlVkempuN2dk?=
 =?utf-7?B?UDdreWNqQzE5SW1lMlFmQ1JtcjRrZlFGN0pKZE9Zb1FaTFdiVHA5b2ttM0R4?=
 =?utf-7?B?SGp0MHNKbHZ6ckd3eERWeFZZUHd6ckdFUmo5RWdST0lFalYzNzVRdGphRjB0?=
 =?utf-7?B?SllhQ3dUUTRWRGpZTXNITUJRVUt4eC9DcDgwb1cvR2xveDV5WDFwZGNlV3Ri?=
 =?utf-7?B?QW1zZ1pJalRIbE5GZUpzeHF3RzE4aUF5NC9DS2Z5T0NCeGtSL2RxdENMQTli?=
 =?utf-7?B?MGMwdCstdGwrLXFBTm5PSmF6cmVEblUyeGJIN05vQi9vZXdSaldEbktWc0V6?=
 =?utf-7?B?TnFRSmFyNEd2d01RYVh3T0xSZHFmUktGTWgycistcjBEZDRaVDg2SDdZR1Y1?=
 =?utf-7?B?aEtDd3hmTEtOUUIvM01BMFhKVDFseVZkYXNxNWRRY0VER2VGT0R3aystZ2gv?=
 =?utf-7?B?aFVET3lValQvRVUxaFExNkxUcVc5dDQ5eCsteUdCbWY0Yi94eFcrLTltZDZ4?=
 =?utf-7?B?bnVlbmdZb1h1anNlektSaUpmUnR6QjZISkxaelVEb2xNOTd1R3lUTlRGY241?=
 =?utf-7?B?NjU0TTQ2b1BaYVhFNGdWRHdCaEpxV2kyR2JsRUdrRjBNVkM1REVWN2EzTGNR?=
 =?utf-7?B?TUhrS0xSNVh4R3QrLXJaN1RxYmtjejVUSHZCekliYWNyZ25QTE4rLWxaSHlS?=
 =?utf-7?B?MFFuN1NVMlVyVmljeHVscXFyVmR6aHVYZGhCbWw5SHNtWkg5dk0vcGRoL3VS?=
 =?utf-7?B?OWNNa2ZVRXlXdUVnYTUvZ2VyZHkwdXRyN21SVGRobmlqZEdGbFc4UXhKRHY0?=
 =?utf-7?B?NjNmUVRheHJvcy9RVExXdytBRDBBUFEt?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR19MB6147.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-7?B?d00ycTV2L2ZRYWVLd0djOHd2YVh3TkRueVVqRTMrLXlkekhwR0tHcWdnL0tP?=
 =?utf-7?B?N1NiZHZNMSstL2hwaGYvUlE5VzUzaTRYT2loVmwxSjl3dCstYkI3VjllQXZi?=
 =?utf-7?B?UE1LOFcvS05XTHdvVHFtMFNUTlllM3ZVTlRIRW1CYURPKy1CaEtWZU5UY25u?=
 =?utf-7?B?WDFOZjZNV09DZTQ0dWRXWUFRS0syZEFuVFZqaE1BOThUdVlRS0RBMjlnUHZG?=
 =?utf-7?B?TDVWUEIxMU1NVmRhZHIwL2lKWXUvc09sTTVUb2lBbHhXTjRhOXhzYzdCOUYy?=
 =?utf-7?B?dU9uNFErLVZva3pkL2NwazUvUnRGMHVFKy0zaGZNclVWSnpuR1dsazdKNmtS?=
 =?utf-7?B?UWdxdExZZENyMG5nRm5JQlM1L3MydndUUUovUForLVlUUHF2MEVXeTZMN2J5?=
 =?utf-7?B?aXdrMGZCVFVOSXdmOXZrRmttMDVTSzM0em80TzNtMDllMngwL0IxZ3Q3UDJN?=
 =?utf-7?B?VistS2YybHQ5ajg1dlhlczA1bWl5UWJNdFBCcDZqOWI3ZXVRM2VDOWw4S3JS?=
 =?utf-7?B?Uk40WWUwNUN4OURUdnBhZVVMRlkvTmV3NHprcFRNN21kd1hkWWF3Y0RUOUpN?=
 =?utf-7?B?c1NjemFWcklBblN5R3Z6VHNHRERyQXptdFhtL2wwN002aEVXZlc5QnQ4anZ3?=
 =?utf-7?B?ZlRNQ20zTXQ3Ky1IbWpPRGE0TTd0b2xicU8yQkZGKy1ZR29XRXN6TGFGSjdL?=
 =?utf-7?B?REo5Qnhra0JtOW5UTkRSVXhmaG4yZEthNjJMSnBERUZrTVU0YnNjYkVyTEJO?=
 =?utf-7?B?QlRXUUhTR1hnVVMzYzBkaW1rTnZjczF0b3FHVkhObURBVVRXbFBMVVF2bFox?=
 =?utf-7?B?NXkyT0xubWhxSGVEeFFRNTU3Ky12VXJBZUd6MjlhMEpNcFZFQjR2a3M5dTcw?=
 =?utf-7?B?M2hxTDVRREhxMWorLWdlTE5rNUNFOVRWL3ROTDRyNWhHL1JYaFpSc2JGeXpX?=
 =?utf-7?B?akN6YThjZGM5T3J4QktjeVhsa3YrLUpoRGgwSDNJaWVtbmlPdUhtUHRvWWZM?=
 =?utf-7?B?WnN4TGtOR1RjTXFBTEhiTmVNVG5CVEpEZzJtak8zNmlSVE9QaXhiN3UxeG9E?=
 =?utf-7?B?QUhJdmtDSWdjMUNtY1JYaHQyWXhnSTdSdHVJVzhYODhxZVNHNTJ5WnZuTDhP?=
 =?utf-7?B?eVo4UFZheWdyNS9JeUhNVmNMYjFWcVZyeW5kUEllNjBDejV5WmZRL0dlcnBK?=
 =?utf-7?B?a0tqOXNRU25Sb0wxT3p6cjVxOXQrLVQwRXlNM2dsRFlFRmt6Zm0xNjNSSTBk?=
 =?utf-7?B?dkFVRTU3TDJzbHladG9iRHBHa1AxZ0h0dUtTWk5lV016aVZTMForLTM5OG1K?=
 =?utf-7?B?V01mUGxhWlpXWVUwdnZVM24zWmhQTlM1dGNBOWJUTExYKy1QR1F0d3RSd1hh?=
 =?utf-7?B?MW5KKy0vaFN0TmJQT0cybS8wb2x1ZEltZk5wQmNZM09kZ0R1MTMzSUZzVnVr?=
 =?utf-7?B?T2xJN3VLa3RNZWVLNVd0Y1gvdEZUU3FnZUh6TnRrUWxnZ0RzUnVDYTMwcWRS?=
 =?utf-7?B?aEZnTzBmVHFCYzQ0Yml0b3FTVWpIV3V6elB3aTYybTk3Q1F1dU9URDNVRmNN?=
 =?utf-7?B?bG4vb01wdk5CUHN6anBlKy1zTlVVSlJnYkxiUVBWOEFxN0JmNXh3SDE0b2Rw?=
 =?utf-7?B?NHc0M0h4M0hCRWtNQ0IvQ3YzUVlpV1A1Rlhuc0pkWFVOU0FwWGw4bTFSOHBV?=
 =?utf-7?B?NjZ3UjdxMURqekttZ1JBMXpKQjQrLURaWVJtMFZUYjJacXhBSkptWU5GNU9n?=
 =?utf-7?B?MkR3bDF1ZWRCclNVcUdtdkhsbm0rLWt5ZFFDTE9SM2haMnNxcystbWlhZTZ5?=
 =?utf-7?B?NTdTQkZDWHQvSUpKMUNRMDdsWEdNQzlGdFMvNFpldFBKV21VSlRtelRoUjY1?=
 =?utf-7?B?ZWk4L1E3ZVVrZW1iSDR6VkJSSERjNWNzN2s0NDdrS04xU2IrLTNpOFVRa29M?=
 =?utf-7?B?SmtXaXVnREl4emJIUEwwaDc3ZEFKOERtM2hlTENiWWczSkJXNVdpZmtlSm1w?=
 =?utf-7?B?WlYwMnByWWJDWG9PRmt4b0thV0d2VGt1YVdqZ1gyOE9Yc05LMGducTdhemx4?=
 =?utf-7?B?Vk9hQm1nTXBaM2xBS055L1V3Y214RjhPZmFFSXZuVmFvR091a1AxTEtycEVm?=
 =?utf-7?B?NUE5Ty9oZE1zUHBsVmhGMlBkR3BFNEJiQW1pVHFrZXRBQ3I2Z2xmUlRwZUp6?=
 =?utf-7?B?eDM=?=
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR19MB6147.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 432b51c6-d728-47fb-693b-08dd19d7eecc
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 11:35:37.0951
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yjJjg7zlTrK5lwgFgNtcZCPCd6plbKg82ypO9BwnN8Sg4wS01fUyq/qgW6gHYQpee9393VngcvT29lSsSSGvInTmt68OKkOjvZc5XpuwHDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB5596
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-27_02,2024-09-26_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1011 phishscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110085
X-Proofpoint-ORIG-GUID: 6fkjwSwayfEOWi8GxYToEWKkDxBUGY4E
X-Proofpoint-GUID: 6fkjwSwayfEOWi8GxYToEWKkDxBUGY4E
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=960 impostorscore=0 suspectscore=0 clxscore=1011
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110085


Internal Use - Confidential
+AD4- -----Original Message-----
+AD4- From: Aleksandrs Vinarskis +ADw-alex.vinarskis+AEA-gmail.com+AD4-
+AD4- Sent: Tuesday, December 10, 2024 10:45 PM
+AD4-
+AD4- On Tue, 10 Dec 2024 at 10:07, Stephan Gerhold +ADw-stephan.gerhold+AE=
A-linaro.org+AD4-
+AD4- wrote:
+AD4- +AD4-
+AD4- +AD4- On the X1E80100 CRD, +ACY-vreg+AF8-l3e+AF8-1p2 only powers +ACY=
-usb+AF8-mp+AF8-qmpphy0/1
+AD4- (i.e.
+AD4- +AD4- USBSS+AF8-3 and USBSS+AF8-4). The QMP PHYs for USB+AF8-0, USB+A=
F8-1 and USB+AF8-2 are
+AD4- +AD4- actually powered by +ACY-vreg+AF8-l2j+AF8-1p2.
+AD4- +AD4-
+AD4- +AD4- Since x1e80100-dell-xps13-9345 mostly just mirrors the power su=
pplies
+AD4- +AD4- from the x1e80100-crd device tree, assume that the fix also app=
lies here.
+AD4-
+AD4- Though I can't verify schematics (perhaps Laurentiu can?)can confirm =
USBs
+AD4- still work as expected with this change.

Yep, just checked the schematics and can confirm.

---
Best Regards, Laurentiu

+AD4- Tested-by: Aleksandrs Vinarskis +ADw-alex.vinarskis+AEA-gmail.com+AD4=
-
+AD4-
+AD4- +AD4-
+AD4- +AD4- Cc: stable+AEA-vger.kernel.org
+AD4- +AD4- Fixes: f5b788d0e8cd (+ACI-arm64: dts: qcom: Add support for X1-=
based Dell
+AD4- +AD4- XPS 13 9345+ACI-)
+AD4- +AD4- Signed-off-by: Stephan Gerhold +ADw-stephan.gerhold+AEA-linaro.=
org+AD4-
+AD4- +AD4- ---
+AD4- +AD4-  arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts +AHw- 4 =
+-+---
+AD4- +AD4-  1 file changed, 2 insertions(+-), 2 deletions(-)
+AD4- +AD4-
+AD4- +AD4- diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.=
dts
+AD4- +AD4- b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+AD4- +AD4- index
+AD4- +AD4-
+AD4- b112092fbb9fd955adca1ae8a76294c776fa2d1e..1aec536218bc2c9197410a4
+AD4- 3adec
+AD4- +AD4- 291a31f9beed 100644
+AD4- +AD4- --- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+AD4- +AD4- +-+-+- b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+AD4- +AD4- +AEAAQA- -1093,7 +-1093,7 +AEAAQA- +ACY-usb+AF8-1+AF8-ss0+AF8-h=
sphy +AHs-  +AH0AOw-
+AD4- +AD4-
+AD4- +AD4-  +ACY-usb+AF8-1+AF8-ss0+AF8-qmpphy +AHs-
+AD4- +AD4- -       vdda-phy-supply +AD0- +ADwAJg-vreg+AF8-l3e+AF8-1p2+AD4A=
Ow-
+AD4- +AD4- +-       vdda-phy-supply +AD0- +ADwAJg-vreg+AF8-l2j+AF8-1p2+AD4=
AOw-
+AD4- +AD4-         vdda-pll-supply +AD0- +ADwAJg-vreg+AF8-l1j+AF8-0p9+AD4A=
Ow-
+AD4- +AD4-
+AD4- +AD4-         status +AD0- +ACI-okay+ACIAOw-
+AD4- +AD4- +AEAAQA- -1125,7 +-1125,7 +AEAAQA- +ACY-usb+AF8-1+AF8-ss1+AF8-h=
sphy +AHs-  +AH0AOw-
+AD4- +AD4-
+AD4- +AD4-  +ACY-usb+AF8-1+AF8-ss1+AF8-qmpphy +AHs-
+AD4- +AD4- -       vdda-phy-supply +AD0- +ADwAJg-vreg+AF8-l3e+AF8-1p2+AD4A=
Ow-
+AD4- +AD4- +-       vdda-phy-supply +AD0- +ADwAJg-vreg+AF8-l2j+AF8-1p2+AD4=
AOw-
+AD4- +AD4-         vdda-pll-supply +AD0- +ADwAJg-vreg+AF8-l2d+AF8-0p9+AD4A=
Ow-
+AD4- +AD4-
+AD4- +AD4-         status +AD0- +ACI-okay+ACIAOw-
+AD4- +AD4-
+AD4- +AD4- --
+AD4- +AD4- 2.47.0
+AD4- +AD4-

