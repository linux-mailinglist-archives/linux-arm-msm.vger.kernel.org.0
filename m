Return-Path: <linux-arm-msm+bounces-28446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D12A1951151
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 03:01:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86B57281BA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 01:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A518C04;
	Wed, 14 Aug 2024 01:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GUP2QgPi";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gbDEXncf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JhcDcUKz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB69BA46;
	Wed, 14 Aug 2024 01:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723597285; cv=fail; b=a5k76s+nthVFOiI/ue4+vwWYJhyLZHbNcl/mXzUX9Qdn0xw7hiHSGJWFSizUspFQZ4dS6KTzcHwQnr7zcxdPu/f7gyIQ9Yx3wRowv9MVO4mWIZWcshFHb9xzwI9/Me9U1jvHqAfdwYUmJkRwTYyaAeBXjGVXR7XaM6Qax0mUbKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723597285; c=relaxed/simple;
	bh=8VKMl/wGHD/BsOF7lAMBQ0MGzrNjluVvPhe+eKNMN00=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VgEctYJ8kRwOKTUDgZvT6Ez1VIAVYz0jC3M8WGkhmaEEz8gY+ys1pqWEG8AF+6N397Rg+eA2WKfP+zMyPM+yQTF40wZnAnls+cOpC/QbPvSK1SqImKdWzpWFeDPBpgQjFiuIeVOWjicmvatL+ln6ysflqJgr5bAol2DTRzvVCUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=GUP2QgPi; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=gbDEXncf; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=JhcDcUKz reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47DNbQiG022307;
	Tue, 13 Aug 2024 18:01:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=8VKMl/wGHD/BsOF7lAMBQ0MGzrNjluVvPhe+eKNMN00=; b=
	GUP2QgPiZiJZm/WGVmHoK/O472AFSw13H4D71Bh6OnWs6ewqwk7j9lZuFJ++xMH6
	UE87OGU6UM5Z0ClcITAdDOdEQr6hggF+rz2Z+wPPU2iN9n5NwMFzl8L44XNRUD+u
	p+NDcL6+aXgv03ug5mg264nWoReAvupLnVCIWlQED6NyrXMe4z0bUS671KykZ40y
	MZPPE9xtOUydkxJCsAI0HdwrcHbUJEZbWlwRyxDS4fUpUP6HCRp3Qbjpe0PUc3C1
	yP0JlQ7tROn+Oj3KHURjriaZJQvwFfgq/52LjjQ5bNvxMN2F0i8XV82C0IYcr5cw
	mf/Uct+KjY/55ybdUMpXYg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 40x7f3r2au-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 18:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1723597266; bh=8VKMl/wGHD/BsOF7lAMBQ0MGzrNjluVvPhe+eKNMN00=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=gbDEXncf6tU1+7JhGhXqlRh7zqEO2tqXF2cmVJoYaVq3qtXz81LzGmCT+0Zbm90zW
	 v3NXAZtgUCbbRIEh/odDLwAaSjv/adNjbeRQVHsSc/FZPwoGtmr1aO1iqZsfyWJwuW
	 xF1EYV88TOzsU4mx5nXLol2nDrecqTSyMvG89Fj6I3UKyRvE5tdt0AM/Qi12dZ7LEz
	 sNIbUHk56jt2iCJMM9llmMBXzHJEmXKXqKy49SBZrw+WKPYorgU6hVNF3m9UMa8pnH
	 BHCYg/Q6QknEubJ9dfwf2ZFBsiWS6ByawB7CxWcPycaPzL7vP8hhQpIAf/2QRSo6Eq
	 1drv+E+DEuUUw==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 72E9E40351;
	Wed, 14 Aug 2024 01:01:06 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 6550EA0099;
	Wed, 14 Aug 2024 01:01:05 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=JhcDcUKz;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 29984401C4;
	Wed, 14 Aug 2024 01:01:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IiZfiDyIK/m/y22PlLuE+HOz1OYuDnbs6yz5ef+ILPsxP/5WxUe3bAPr1h/lrTPAIVxCuXT5BM8ERsPAQg/3OHISzhLtyl2K9mBWjAGlxXP+3pBeXGGVGaGTu6EiWda9IIlHGs6saVF6vzx0eITuAhIgq7MqTK9xSFNDSIusrCUh2VvFjVDns6vOwokXf6oywFxBPB0riX/RhaYTORQj6AvMT3h7sHhngKiTgt+YU2Cy2lXyR3kJrv+egOqTjKImFss9PjV0v6qeuVTm2ZDAH1jgGAkgk8msqsb8efeYh+7x9Ce/unezxOEhhYi4mYmAjhiYv5P0oHXK4Y4EpWeJ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8VKMl/wGHD/BsOF7lAMBQ0MGzrNjluVvPhe+eKNMN00=;
 b=cDQBS3ZQ7pkqfU1S8zpSXpc4bphwkZKQO2Rfb+gTnJ07Mvn8/N1UpDv2nX9MJmECR4X8pH5UIOSDI0anUKH55x6CFAeYQt0+m8GoPMSgcROXiJGrE5La1SNud2Db+7/l93648ZVnCeAGN3YNsCaQ3sxkMSVsERg/EV+Joz7na6MSYbZTcFlaP40QLldgAyT8pIijgOO4azC7Yp9cQ1jq0vlYqD04Ge7LGt8Pvnlf+VRkKRls6/PYEIr7iIvDzc+wRdtHzgCvlwWnh6pbRW0JY1ziYtgu+8pVBIgqFbgwJs7D3m62BFkWrMHjcFTRxQGVslOfxbKoml+vFuhiXpQU8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8VKMl/wGHD/BsOF7lAMBQ0MGzrNjluVvPhe+eKNMN00=;
 b=JhcDcUKzvuQkCZta1zdMYNl63fClkOtxPv5ezXrBg56yvzTSI40soc+lrs6tbcT6AGgu+Gq58QH0cQ0SmH3AI5Vf+a2uoD+dT2WSPBIQyA8qR0N82lewHtzzEV8kG3d+A1Pm7yZw4cXzbTQunJOSJ7S3N8Pqvo9MZiY5A8BJddA=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DM4PR12MB5868.namprd12.prod.outlook.com (2603:10b6:8:67::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Wed, 14 Aug
 2024 01:01:01 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.7849.021; Wed, 14 Aug 2024
 01:01:01 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Frank Li <Frank.li@nxp.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Saravana Kannan <saravanak@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH v2 4/7] usb: dwc3: core: Expose core driver as library
Thread-Topic: [PATCH v2 4/7] usb: dwc3: core: Expose core driver as library
Thread-Index: AQHa7GTQwqN3AeRauUKAxhIolGjIHrIlgMuAgABxRYA=
Date: Wed, 14 Aug 2024 01:01:00 +0000
Message-ID: <20240814010059.4ghi6kasmijzhyai@synopsys.com>
References: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
 <20240811-dwc3-refactor-v2-4-91f370d61ad2@quicinc.com>
 <Zruix+aadUL2F2jY@lizhi-Precision-Tower-5810>
In-Reply-To: <Zruix+aadUL2F2jY@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DM4PR12MB5868:EE_
x-ms-office365-filtering-correlation-id: 8c5828b8-5363-44b3-768c-08dcbbfc9073
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?K2R5dEhkeU5oTFlyejV2YXNhQ25PRXVCUmxOUmlSdlRkREV5MmFuY21wa1E2?=
 =?utf-8?B?WVZkMEoxSVk3T2hlaXdiSFVMQUIrL3krSVZVOFMwcDFSSHY4cWVYOEgyUklt?=
 =?utf-8?B?SVdLQ0tEeFdmRitBS1JmNDdYTWNaNk5GeHpTTFI5eUJYVytIMjZETzE3MjVP?=
 =?utf-8?B?K0lJWk5UaytKd3NueldEWW9zclJQd1VSWStlay9QYzR4cklWK1hhMitsM201?=
 =?utf-8?B?cnBRYUV6SGdMUmF0OUthNmpla3hzcm9nclpoRVFZSDdVTDVqV0UybE1RNHIy?=
 =?utf-8?B?ZitVWEJpMjNRSXBvOWh0dVVwWWwwbjBlemlpUEM5NTlvQVNMdlhnVldZSU1U?=
 =?utf-8?B?a0xldnl6SUxmQWx0M0x2ekd2TDRtT1hDMWw1QU50UFNmZXkvUjgyK3o4K0ph?=
 =?utf-8?B?MkR1V1NzdFBSeGhCalp5dW9XL2hiTGpEQzhTM0hjUy93MFdZTGpYT3paa1BQ?=
 =?utf-8?B?Zkk1SUpFTEVERjJ6eWdvUldGb1NFWTFiMWRHQmllOXlra29NMGVqUkpBWEhQ?=
 =?utf-8?B?SnNhcEFvS2VsVjY3enpMQVJnWUxTekRaLzRaZXdRbWtsWmVJV1F5NlhSbHhq?=
 =?utf-8?B?U1NGdTQybUpZMnBGMlhHbUR0eWxIYkIwSDhoVG9KRDRKUUJkQjliTUJmM1pw?=
 =?utf-8?B?VHExWDdRT3Q0a2V0YjQxaG9meGxvbVpYWVJ1Rk9nY05rbDlLbFF2dkdGbGhl?=
 =?utf-8?B?Z1g3Z2QzZUdlbDdEY2t2eVZmaFhLc0xMdHRTQ0NnUW94a2xoU1E0M2hkc3FN?=
 =?utf-8?B?SUs2YS9Fa2QwTjJvUFd1L0I0bkRlTy8rSzN5bW5zYUl2SmxpaC95V1pkdGNq?=
 =?utf-8?B?TUNnV1JRcG8vWkRBRlU4dEd2U1o1MjZOdm9mTmVTTDNRMCsxTVp2d3RxeGJG?=
 =?utf-8?B?bUJwckt0ZWZpU3JZR3ZzTjhXSVRlTWUva3I5dG50V2NEZ3Rvd1J4ejlIMlNU?=
 =?utf-8?B?UmRWYXNWTkJacm5sazJhbkRMajBYaUMyTklrNG13ZkVmRnN3L01xR2lJckMv?=
 =?utf-8?B?ZURyYzlqbzJzTmRVVTRCR1NETkdseEZZVHczSFVoc0loU1p4S2JwSEhYUEVF?=
 =?utf-8?B?d1pya2VKeXBKOHMzUGMwUzQ0UFBvV0svM0tNVkxtZVRQa1NuRVVEU2FCbnJ0?=
 =?utf-8?B?S21JQkNCeUFzMStZeGtjNFF4V3crNlN4QlJZUHVBRW9tMjZ5dG93dVZrbGRL?=
 =?utf-8?B?Uk9yMG1DMDd3VHd0WkVvbnlzdFdGTENuWFJqTVRMY1g5bVJyRml4L21GcDAv?=
 =?utf-8?B?eVYxZk56MlJNUnZac2RZdGN2SnUyajFDMmc2Nit3bkt4V1pOYklGb3RJMjFp?=
 =?utf-8?B?WHRNUVNKRkJ3OVUrZ1JmSWhJRDNPUkE5Zmd4dFFaMU11Zk9ROUNqd3M3OFM4?=
 =?utf-8?B?d1lTb2FwUldXRk4ySWIyZDRUelRSZVNtS1hpL3pzOXBqcWVvQW9WVnZDZzdX?=
 =?utf-8?B?Y3JzVWZjaHNnWVRPTk9kOEg2dW1IZE8xL1V1YXZBTW54UnV5cThHNXlMNVBW?=
 =?utf-8?B?YXZ4MmpocDJWYWZ1WEdybkgyRU9XdmpucVpJT2dyZGMwL1ZGaHo4NVZNejBE?=
 =?utf-8?B?VnRRMlQ5TUlWRjN4MFo0ZzVHSGVYdVhLS0lDRjU2Z3BKZ1pJWGJ3UUdPM3Jl?=
 =?utf-8?B?YnJmN0pwT2U1aE1PTzFhZjNuVTdvRTBuTk5LQkdOYkVLZXdqZVV0RVNtM0I3?=
 =?utf-8?B?T3FJMjNwRE51ZVNFZG1iazUrTnJsRlMwd3AraEtOL2gxaERVQ2dCQ21vU1B5?=
 =?utf-8?B?K0dnTTc4a0NOdVp3ZTR0MHJ1SWNDTkRMcVQ4RnY5ZWd6bEFJT3BnTWFhQkx2?=
 =?utf-8?B?c2JrNjVXMkpMNFBCNU0rMTNlTUJEMHczaDkxell3dytET09XbS9SeTlucWNP?=
 =?utf-8?B?b0ExL2tVRGkrSDhKU2N3Q3lGK2JkWTJvUFNYYXlXdjJjOVE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZzJHY3hnOEtmOFprdUxETkQ2S3RXek5YVmVBMmtPN1J3dE5NWjdEMlJUamdF?=
 =?utf-8?B?bWRuNThpR0tLWUNvbURCZ3BZSGt0NGtKL0w3bDJYa3BScUZXYlhrWDkrS3Yw?=
 =?utf-8?B?RzRRSG04NFRuTXhXdTV1MGtuZ2duTFVnZjl0YVY5czExY0pXOEZiUFU1c2JK?=
 =?utf-8?B?RW84dTl5VnArZTd0Q1pUYi9lRUdCd3U4WUthb2Mxd29zMVNqa28vSUgwMUVu?=
 =?utf-8?B?a0xOVzEyNXRwQkhma2NlZEdJKytIc3NVYUV2TVp0U3JuRlFRcWFUN3UyVEhY?=
 =?utf-8?B?Qmk5blVuZjd0RXU2UjZjMW9ZRlJZOUdpaU9nMnJvM0FIeEkvY1B4RU50RHdx?=
 =?utf-8?B?QzM5a2tMcXJVZUNBTWhGTll4M2NSQ3dibktJZ1Nzb3U3OG43SVlKK0RpT0Rr?=
 =?utf-8?B?TkljQ2lXMFdsdHpyUTcrRWJneTl3ZXd1RHFFS0pFWXJWVDB3VFN0cjNyS0di?=
 =?utf-8?B?MjBZMDRuS21SNlEvWUhlYk04YlpKcTRFNi9rdDRzeVcwVGpBUS84Y0Rnb1Ax?=
 =?utf-8?B?dnpqeWdvSEEvdlZTZ0ZVWTk1NDV0Wi9nVTFFRnp1aUpUb00wNzZIbXFXQnVi?=
 =?utf-8?B?L2JBK2piOXQxWkY5TjJ0b0lBRzFSSHNTdkcrWlNkVS9DZHU4TW5PbE1DNWFW?=
 =?utf-8?B?c0FYWlh1MmdISzhIVlZ6a29rNFpSMGkxOE5ja3E4OGIzbmF2Sm94WFZQRGpJ?=
 =?utf-8?B?QnVFbGduWVB5WkVSTUlreXp0YTBXUmVEazI4Zko1QW9qR09lVXNRK0l5eVNj?=
 =?utf-8?B?NGlWMm5MbWdQMGgxZTJvd2ZnUkNwaFp4QkhodWpVKzdSVitxUE9ubDl6RlBm?=
 =?utf-8?B?V0FQNHpVeURoTmEyY1NhbFEra0hFclgxV1lRSDZQa0FXOHppWGlyR0V4Ly9K?=
 =?utf-8?B?eVRMMEhMWjd2cXhDREcyMHdGYWRFdlNiakNGU0syaVU0RytxOS9QeXF6VGxW?=
 =?utf-8?B?ejFwMysyb1d2OUhwUWY3bG5sMmdqWFBsZCtGSjJ3WkF4SjBqL25MTkpIdVRZ?=
 =?utf-8?B?b3laeTBmOEdGK3JhbGFTMC9peUkzUU0zcTNodDJkalFIZ2VPZFR4U081MVpn?=
 =?utf-8?B?QllIQ2JyZjBuZUlCVGlaL0hGSFlRUEwweGUwTEpNSHVpWk56Ykpvd3NGZ05m?=
 =?utf-8?B?YjBEVkY1KzZZb2JHeTN0SldhN3g5dEcyUXY5ME5Sd2NnbUVHTGFpMVduREFl?=
 =?utf-8?B?eFd5bVo1eXlNSzVpVDEvM1RrU3FnemIxMktHOUd1RjY4UFNyU05xcGdHdkZD?=
 =?utf-8?B?aXpXbzg5L1A4Wkp3Z3ZEajl3NzF6T2dNSU5lSi9ZaTg3akJhbVZXTGdUTjJu?=
 =?utf-8?B?Qk5qTTlJekdYdGZzb1BvZEVuMWNoVTdhWlNJOU5hL28wTk83Uk93ci9IVzhj?=
 =?utf-8?B?RktnUnBnaHBIbFpObk9aL3EvVHBHSE4wZVRJNTE3bjVXYW5mN2lhcmZPOW5p?=
 =?utf-8?B?dkVkMU1jaGxFUkNKRWNmNDRQcHlYYk1lc0dPczdFMWdtY3NwRGE3REVMRWdH?=
 =?utf-8?B?MjVjZFpWa2x5L00wRnloSmJESjdIZXpNNHJZQnM0WG95WW9SVDlEcktsU2Zo?=
 =?utf-8?B?TnV4bElwcnhWNDhDTEJ1eFlZait1VVNJZE1hbFo0MFZndk9iQ1ZEemc5OWlV?=
 =?utf-8?B?TUZ0QWZibkUzY3RRQzQ2WmZMd2kzRm5uTlRhQy9WVVk3dzUrb1ZtdEp2bkRo?=
 =?utf-8?B?cU9EbGhtZ3UzWDVvYS9paEcrZ251UTFoRDVXNEUvc3lPdjExcHpMeUdqMC9j?=
 =?utf-8?B?NXdvWTJBREtEZ3NRaXltbFdjSXNrMnhqZ2ZWbHF3WXNnU1crNmFpQmVYU0F3?=
 =?utf-8?B?SDlzdWhJZE1XS2Faa2F3OVplbU96eWlSaW93bmZHU1lBSEIyaGtuUlRwV2hP?=
 =?utf-8?B?UWg2aHRENDlscUk3eSt1cVRqTURlQ3BDQlJxNjc0cGJyQkNXWlZHeHR0dkox?=
 =?utf-8?B?cGRlc3JBTlJMMlNSQ0N3Z0tvQ3J1MzlMNDVnclV1N3Z3RFRTNWc5M05rby9H?=
 =?utf-8?B?eklVOUlPdEREdEJ2bDNCdzJQcVU2OTkyT2tjSG1VWWxuVGxkLzk5d2NITEJo?=
 =?utf-8?B?VlJoRWVDVlBFa1JnVTY4ZnNSa1h3akM1aTFKbGZEWnduanVHNk51T2tYMVZm?=
 =?utf-8?Q?X8NOvRp0Gcdh5mQLUcQDTm1LL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E861F2F3644B5748A6B9A8A6DAB665EA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	das6HkimVR9tmNo94oA9//DNn1rKEFw8Rtw4+M1HI+q02irvwyEU4JwSmC/HHlUey1xyQ2oWqcuWHyKEYDVeV9W68gJBEHaFbw/OGGGneeKQnZCr2XEKJ8HilmwpniSiELl1ZEMA8NcToBYYF/6LrKQF7epeDvT3y6+OQzyHMNb7j4+UBiSNYYzoPWHMhC1pBMvLrs4PWmOjChul943oPJGhevwvXJ+C9dauFf7493L9Nzu8QH/hp8FQtCkyhwyrGuUALMVbRR4K3+IFXqg4iKN6ZyuikSX2P2edeJ6Y49zml2u+aKaiUxrTGZQujQ1YFpH5evy7ZN3jLfjWxsysMB39DsS5Aarr3IWJG993bkJDyWrb8ef0eZR9tQL888afsxwXAQqdBDbBFk2J/qIQtmB/bgfANnMaBWG1dn3bmmDbyQlZ4jqo9p0ckV+rfcr5oBToYHl44I8C/3HdYlOTsYTlcnWfjXyast0p0WT6sxnMQEVv4bTdxiH2UZIlbs8+OIBeUJAcEsUr7UhWyonRj1vw3J+cTQhgKKpGtrsNWBBzBSIHErHqcxMFd9CCCxGSxmUJZg2NTeQzsERXeSIRNlniEX8MU7XuKforB5RSmyQ0efFBf1GxIqhWx32mD2zPFuskjyPiEmD0Ju89FaqeDg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c5828b8-5363-44b3-768c-08dcbbfc9073
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2024 01:01:00.9024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hMvb20KsBhVHwA4WwhIeBABFKx2+95DWf6yKv/Wl71aqep6sfi6wsK8ydk+KpyCpgCEa/sPNGLuxwRt8g676BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5868
X-Proofpoint-ORIG-GUID: 4azgF2Pl3crXcxH0UQOpjsMOA7vbcD2B
X-Proofpoint-GUID: 4azgF2Pl3crXcxH0UQOpjsMOA7vbcD2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-13_14,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=953 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408140006

T24gVHVlLCBBdWcgMTMsIDIwMjQsIEZyYW5rIExpIHdyb3RlOg0KPiBPbiBTdW4sIEF1ZyAxMSwg
MjAyNCBhdCAwODoxMjowMVBNIC0wNzAwLCBCam9ybiBBbmRlcnNzb24gd3JvdGU6DQo+ID4gRnJv
bTogQmpvcm4gQW5kZXJzc29uIDxxdWljX2Jqb3JhbmRlQHF1aWNpbmMuY29tPg0KDQouLi4NCg0K
PiA+ICt7DQo+ID4gKwlkd2MzX2NvbXBsZXRlKGRldl9nZXRfZHJ2ZGF0YShkZXYpKTsNCj4gPiAr
fQ0KPiA+ICAjZWxzZQ0KPiA+IC0jZGVmaW5lIGR3YzNfY29tcGxldGUgTlVMTA0KPiA+ICsjZGVm
aW5lIGR3YzNfcGxhdF9jb21wbGV0ZSBOVUxMDQo+ID4gICNlbmRpZiAvKiBDT05GSUdfUE1fU0xF
RVAgKi8NCj4gPg0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgZHdjM19kZXZf
cG1fb3BzID0gew0KPiA+IC0JU0VUX1NZU1RFTV9TTEVFUF9QTV9PUFMoZHdjM19zdXNwZW5kLCBk
d2MzX3Jlc3VtZSkNCj4gPiAtCS5jb21wbGV0ZSA9IGR3YzNfY29tcGxldGUsDQo+ID4gLQlTRVRf
UlVOVElNRV9QTV9PUFMoZHdjM19ydW50aW1lX3N1c3BlbmQsIGR3YzNfcnVudGltZV9yZXN1bWUs
DQo+ID4gLQkJCWR3YzNfcnVudGltZV9pZGxlKQ0KPiA+ICsJU0VUX1NZU1RFTV9TTEVFUF9QTV9P
UFMoZHdjM19wbGF0X3N1c3BlbmQsIGR3YzNfcGxhdF9yZXN1bWUpDQo+IA0KPiBzaW5jZSB5b3Ug
dG91Y2ggdGhpcyBsaW5lLA0KPiBzdWdnZXN0IHVzZSBuZXcgU1lTVEVNX1NMRUVQX1BNX09QUygp
IGFuZCBSVU5USU1FX1BNX09QUygpIGhlbHAgbWFjcm8uDQo+IGFsc28gQ09ORklHX1BNX1NMRUVQ
IGNhbiBiZSByZW1vdmVkLg0KPiANCg0KSWYgd2Ugd2FudCB0byBtYWtlIHRoYXQgY2hhbmdlLCBw
bGVhc2Uga2VlcCB0aGF0IGNoYW5nZSBzZXBhcmF0ZSBmcm9tDQp0aGlzIHBhdGNoL3Nlcmllcy4N
Cg0KVGhhbmtzLA0KVGhpbmg=

