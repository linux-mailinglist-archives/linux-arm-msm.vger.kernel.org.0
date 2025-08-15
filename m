Return-Path: <linux-arm-msm+bounces-69306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7C5B277A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 06:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD5C0565164
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 04:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239491DDC3F;
	Fri, 15 Aug 2025 04:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BHvDsAwG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741A378F4F;
	Fri, 15 Aug 2025 04:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755231135; cv=fail; b=Ps1g4BzNRYamjSnndtgQ0eO3kApSwCnisedm7C63Znmksnf4E3ImeajNH1f+jRHsHzt2T1tlAt20I7c4SGDtrYoI2fyTabz1J9lxKyp9yz1V38Ouq4jm/30ImXJwvO5EBZwH8ZXjs/yC6Fb5e5n49LOHxY63HIQHOPGKPrEEsWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755231135; c=relaxed/simple;
	bh=0I6nWXFrcYxGdspzQxJl+5epbZIekZ2DuUjcbZO3EoM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Un3aboIsC1+HON2pNmaevs2aYjWCU0Ar0XE86FOqznvuMAUQ7vuNBUTW6QmHdxlMUa2GiiygGbf72gfimMY9J5rANr2/U//ZbFA/QboKY8cxT/nQzad9z2mHsgSxt0fP3rQwfL/FCpUhfe18SDG+TD1hzbC4jO4W3qhA4aSLNhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qti.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BHvDsAwG; arc=fail smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EIUSMl029114;
	Fri, 15 Aug 2025 04:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0I6nWXFrcYxGdspzQxJl+5epbZIekZ2DuUjcbZO3EoM=; b=BHvDsAwGk3zTe09Y
	m4JK+XH3/mE7LEF8T7j6q0vA+n73SP2UL0MfGwEnx1pzJjNBGs/pgtuDABa7EPse
	N1KCP4SeUrwG7WHmCxYAjZbPwBBh/ylR0CJBiuUr8kWbE2Uv3Q6Q3jykz2hgAJJ2
	pyN8OZ4PJyCszHfuoCu6Aklc15nQw+k5DwclOIrc38QS9EErrkYYiwJclAud6PBa
	URqH5LQIywO02356IxOIYzA0wJ2heR14nbIUTkbrH3oUg8c9bDUgNZx9KcIL2E/y
	QGb+5qCFOX2xWba6OdC5kj+tlNc08MJ6H1m7pCl+Vh4eHByvDShex2BFr9Cs2sG2
	cmpprA==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9qa11ng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 04:12:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MX5uJO4ioSdcADmrpkGKJ9RkaVInTBG3XBjEV0NgwvZqI1lQKtX8WDGzbxkU2I/f6LpHbMVVdikrPXuz7dJg7qEKNiEHNbTctVfVo+bf0DHFfbBovQTsAmYHgHVl3xwA7A4G+STSotlVpLYHegQLqVKntq66or/+dJ206RegM4XdAL2HvhSoUNlLCW1LMhYXgtdiOIzSW8mNZzOEPOYAuKfSKNwOvKYb5ersjN4WOp6Ls4ZxbbMgQAy+7ZQujuuLwK5goZsTPYF2CGLKvDRnCxNL9W02kZ9ixMOhrN5wgf1xSfR8YozBpqSzuKJSTMSbdEMzv6QpsIaZ2jwQFEGdgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0I6nWXFrcYxGdspzQxJl+5epbZIekZ2DuUjcbZO3EoM=;
 b=XqjgwqYFRCKJT87tjOMIn287cDWJnHv8ijxMnMqNbJx7eSLsN1uq82YVDCRuLaKNrEyFG71yEQLXJtP9DKXjpvqVYLaRja48fBj5Ko4WKys3QykvRHsoSfnf2e15aDGkhjwaLV1tHNd6aC3cBcCjpqjGlR6YPveqH12NQcNav9wJACwHYVlGdLAyIxuXDV6FZhKf19eApHnUQCN72YhBPAJ8DPv0fw6UejV9yclyxJ7D+yXcEJla4xC6b2kpdBrgNEvufkblwqm+G9wc9HSmcKgaGz/AK0zOw2oPY4fDXrY9HLlH3CDHsRzTlfOSnNL/FDZlBCS2TkMC2sPVsoZN0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from MN6PR02MB10629.namprd02.prod.outlook.com (2603:10b6:208:4f3::6)
 by MW6PR02MB9864.namprd02.prod.outlook.com (2603:10b6:303:244::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 04:12:04 +0000
Received: from MN6PR02MB10629.namprd02.prod.outlook.com
 ([fe80::786b:71e9:584:fa3c]) by MN6PR02MB10629.namprd02.prod.outlook.com
 ([fe80::786b:71e9:584:fa3c%7]) with mapi id 15.20.9031.012; Fri, 15 Aug 2025
 04:12:04 +0000
From: Quill Qi <leqi@qti.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: Add initial audio support for
 Hamoa-IOT-EVK
Thread-Topic: [PATCH v2] arm64: dts: qcom: Add initial audio support for
 Hamoa-IOT-EVK
Thread-Index: AQHb/4+LLEN6JHBSw06gYWiH00Kh+rRHYOKAgBqOlYCAAA4iCoAAHWqAgAEZNuA=
Date: Fri, 15 Aug 2025 04:12:04 +0000
Message-ID:
 <MN6PR02MB10629C8869AA877625A768982E334A@MN6PR02MB10629.namprd02.prod.outlook.com>
References:
 <20250728-initial_audio_support_for_qualcomm_hamoa_iot_evk_board-v2-1-58aa30b60c7b@qti.qualcomm.com>
 <172f1a38-d7a8-4799-ad44-f3eea69f297a@kernel.org>
 <e6e06ab1-6744-4730-a2a7-be8c66bf74a3@kernel.org>
 <MN6PR02MB1062943D66036348728930990E335A@MN6PR02MB10629.namprd02.prod.outlook.com>
 <71ad3354-15ab-48b4-9e13-ea497d4fdd79@kernel.org>
In-Reply-To: <71ad3354-15ab-48b4-9e13-ea497d4fdd79@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR02MB10629:EE_|MW6PR02MB9864:EE_
x-ms-office365-filtering-correlation-id: 98f2bfca-9a6d-4be3-89e2-08dddbb1e437
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?oReR4HEn787GzBvZUEhdQZ3BpEkUIfJQmlWWFxHZvhM/498uhGiDTB6bzy?=
 =?iso-8859-1?Q?E8z9sFnQKLW464vKcZ8xDa/P/VS2i++DOdpstHK2jEQ+5XbYlDJI+NYvqm?=
 =?iso-8859-1?Q?rF5d3fCQ2yXJyCCqRu0zZXvr/BvcMStp6c/uV0Jx/XmfRLkelAosdkV2D9?=
 =?iso-8859-1?Q?RHJ3DTQWxge6NsD/+s4XAinuRVnkVfcu+zDGz5LyBzEcDDuFUdu0+SNRq3?=
 =?iso-8859-1?Q?nIGgsSAZJIOisTRnLVoKF1VgdoEYy3lmRlGmhPwolPBP7qVHaojbutBo+z?=
 =?iso-8859-1?Q?D9xChhJyX/vStWUsND+86p/YcPdnJHQqDcxYolNL/Sv2TPuICRd2x2KmLf?=
 =?iso-8859-1?Q?kOHo+Iq+4pPVif3i+sl1T9ndaLTkqA0pEDiBgXnc2Z9eH6122G2W4xlJR1?=
 =?iso-8859-1?Q?cy4n/0BLfIsAECVMYWcDOdTuO0/h7JAplqgWJyOUVbarFsFfClanJQdAaF?=
 =?iso-8859-1?Q?lHvTBXzFYsmqJwbWyEYqQaXWXbP81T2VfM1FrNJ2d0pEXLK2YA/snM1OvP?=
 =?iso-8859-1?Q?gJ5+32aawyOCnVnJHdIxbEwKFv/Z/ZidL0W2lLfHUi2K0uOh83/sEf97xm?=
 =?iso-8859-1?Q?tsGNB2EI+YQUO5janbhdNyZB2t844iolWRtKaHyU9OzWkq4b4CneeooV8j?=
 =?iso-8859-1?Q?wY0aZpEVGs/S35I6zBJqx7IxQSZ15ijDv1vcIDRwLlp4SUC/uNfAx1hDQu?=
 =?iso-8859-1?Q?hZJqpu/WOm4hS8ZiyTGxF0Ot6MFkmV0Pxz5tmXc/yyU2u1+pQLF+H/bGtL?=
 =?iso-8859-1?Q?IiPS1jv81YMy/Yb3+p3Kr/oftIrHo51guNw7IUfBeEr/R5whP9Iu7rkplI?=
 =?iso-8859-1?Q?oGLFaWUxZg7n8fO56V2YOFjhP3Bs6ff6FCEbTfbjq+3fIyBB8MWPZOzjb8?=
 =?iso-8859-1?Q?JS3oxAQgkmp5cAeDMSYUEZcPObJnCQss1qoDgu83TuFe/+COJpCtOqJ/PT?=
 =?iso-8859-1?Q?1ZtPbVEru10Gj0WacjA+q+L2RhdcxqUfZGzgkcifHn1D2maicJvAXGJ1UT?=
 =?iso-8859-1?Q?aZWv5Eoz5NiYSutFm4DOk18VnG6WaraHPGqGjARxr6s53yBPsk2pyP6l76?=
 =?iso-8859-1?Q?gUjE4K6xtknsWKAvtChwwGw3fDofTK4pjTkrqMfkiB7goBnRCX78W8jhSd?=
 =?iso-8859-1?Q?Encwa+ldhTdn8LLJA+Xmjd3zFPAXwH5gbft0yLBjlB2QFdWT3kDVicQiBp?=
 =?iso-8859-1?Q?xOkGAw0nhiWmZRUuy8w2jIZ+lasVXgAevQA+KLGB9Amlu7ls0oXEGolOgs?=
 =?iso-8859-1?Q?lWWvTGF2GCILwNAe/ZXFGFTGzPAKItYl8V+jwakkKImvXe8NJIvKfRp/Wx?=
 =?iso-8859-1?Q?wcJmbBtKTdg9HAkilmIWdv6LrkmugCtfHOg2sb6ny+sDSn/QDVwZdaFwOu?=
 =?iso-8859-1?Q?0IIrkrLf2XCZMUtqEd5iFnS5/yUqaFXj4gahchRaVCdw3OTrritX4bDltT?=
 =?iso-8859-1?Q?xXW/QjOZxjna/9zm2tNh69jqWY6cAsiDQZoUsU/lrali4XN4k1iJ5yxJbk?=
 =?iso-8859-1?Q?xaIwwvzyQ6jwlUkpg4KP2miqWkHCPnOAjDzt9xe94jT7rGbjERrK34y0Mn?=
 =?iso-8859-1?Q?B84hPrM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR02MB10629.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Cseb2PEmXF+vb01ydmX3ib03P7LEve+UmEoTa6CncPC2yGW5z9AiyJfv6Y?=
 =?iso-8859-1?Q?srG6mbqjyc2iP3AalqwkmHSJ8UoOAIt7P1Z4uHJKm4k1YN93d1IWheRe7i?=
 =?iso-8859-1?Q?bSE0aUNyTHs4FEyztxoclutLJkR4mJsZdFMXxmEgC0YpyjdH4BRbUStPls?=
 =?iso-8859-1?Q?dR7cllLLt4NQxbWb4BoudTrjPxMHJziXoVzpUuCQl4/nzl38m9n1c2sthu?=
 =?iso-8859-1?Q?5fDZQynhMu2bbLJsI9ZmPfqwr3gi8UHPdeN+9fXl7qpu/ir58+Q+avDKoV?=
 =?iso-8859-1?Q?jSrS2w0gBRppR+7UygNMqjOJsFuSEsVTMR7rWaFVIasyJW0hY4H7TLux8e?=
 =?iso-8859-1?Q?yTwl3I+iDXkOz0s0bYSfeQGBIJ0/jCuTb/h/gWmmzo50DB6SRerZJxx9Ba?=
 =?iso-8859-1?Q?7G50/ttqDZx4cLLVaVohfCuSk2I79dSGhBmc3XiOuhNFSpZzMIX596ovJF?=
 =?iso-8859-1?Q?PdMEynuat4djC199pwbGWHzfYZf1TXdHF2CDUkKxMSpOkWnVQVJH49vIjl?=
 =?iso-8859-1?Q?H4khvZ1SDbun/7/naTMTJob5fpl9RR8IaACGf8D6vlrLWC1OzLyiWQd6p9?=
 =?iso-8859-1?Q?RDqMlUqDy+0F/RWpQlN5hGxsn2j+6zCn2d2q88zhwYRW0I1ckIr0QBCb33?=
 =?iso-8859-1?Q?02EwoO7zzhVkHmSnJ1mkbGDjb+5x//bBI07wwTThebwUipHskboOOwkQGr?=
 =?iso-8859-1?Q?+0gnqNJrr3jUXPwt7YcFvB8lWqPbgN/mIJy0eJNXNJVn9tdFdmcLOt1miN?=
 =?iso-8859-1?Q?a2AQe7wUnO3TJceIXIU5/z/fbtAnGldxSJvUxtvGT46JHZniALK84TWAr0?=
 =?iso-8859-1?Q?2A+8zbM3h0tHXrsXBL65Up4dU6O9q9KG6UL7IfOsvhVjceKBdHqMW/AerB?=
 =?iso-8859-1?Q?cJITgNSqCWO6OQCihmGTe1W7ts5kc6YfYrLaUEIHIzVNyELkPix9mmMOFq?=
 =?iso-8859-1?Q?N5DjjTfa/IWCGH/RC9nFleRp904kc07QC952PsHwhVzkwS0/L8OzjqPEuB?=
 =?iso-8859-1?Q?0BP5yUKamN7jSm8f+byDa08DG35LsoBx7EyaF66d4sZzNwOe2STNWKI/Cn?=
 =?iso-8859-1?Q?sNJDwrf5u2M8U54rmJFh/nK3J4KF9fnXQ18sMfMJ2ZcDP3maIhFT6gTCds?=
 =?iso-8859-1?Q?QQBfq5MYOPrsZ78/ti25Lx94ZwFNhAeMjjDiQ4TRw/eJiQS+NwklW0Ip2X?=
 =?iso-8859-1?Q?5W2jHAWjmPZnBGUtgC710jZ6OzY65a9faTAONsnmxmKMNpB624TYcJsecr?=
 =?iso-8859-1?Q?/v0zjE/PBCeoD6LkODZ21HxtYa/aplUIu3KhCAaV3Y5OzxWiavMLSg7KOe?=
 =?iso-8859-1?Q?0Tvei7N7QpddVa/lrdQM1ZCjc0Wxrx7E20rmq61Y28i5qcu0EVCirWDrNK?=
 =?iso-8859-1?Q?XSrrWGhDdOJRzP/h2RYssraWQkYsRmZ8zTHwz0IqDwimnyNCt2IXijNuIJ?=
 =?iso-8859-1?Q?Qv6jPj509mWpMWMBnH/ZJplj5Q3gzOSKmCF84CBlvyxJfM3ZlH0K+mGCLs?=
 =?iso-8859-1?Q?IcPs8dftW3NntTPlsKWeWtQ5GPqxdxbPD8yc2Ivv04q5ntbyCm1o3tPW2u?=
 =?iso-8859-1?Q?HjCnoyZGpL6XRkse3P2oMxDegqNP841N8qeOfjoIrnzAuL63ccN1VS1G5i?=
 =?iso-8859-1?Q?vsi982ju/tzvMqQe+BF3L+lI/ViBWV1g/B?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nSn9hmq/M9bZBGzH48296TR84+isHben/FpddQiBeuHqD4QDr1RrbnZg4z9cCGTlNaEN/DQaAso2jVvZyohFSwUaaKyQQKmHd+y2Cel3kOY1Xb6xd+WD/k1zEK6ntflCG05ylegZAS0FSsP2lt4D+Dv++17bfx7P9dv1AnY7ng/xcLIu8nagO7IBfsoaM2JWHcokmuJeJU2u89VCISf2MzQkuJknF57rgtivBAxzjt2d5vQblU5Zb5GfmgDcDu1P56JYSNAfDu1Q2bPf4wBVggtDrq1XVte4xP2G9z4sUZom+kQ01/OvDBx1Yf5Tn+vm0U4bRA8WFuKt1nRvBfFWgFCmiAoxN52Z/KUE/9MTObn7S0Mfm1Vkt07uFK5X5VgaWkp5Su5a8Gs1QaVTtVlyPj3YlQEf2Nqbl+CsKNBif7wVWYLEOJRlU8390ThWGYbtvxSSKI4ay1tykaYyGe6j+JAVEiNIKTnO8iOQ7SoVzg9q7QuSuoJla4DF9qk9QN+MkguqLeSJCEr1DMyks82RsB6grE8z1177SSVjdPM4CrHs+HpJl6enbpHWIq05tfWF78/2uP9gm3z3iMQ/9AiT3zaDSXsuP7Mf03xxMMN5IRG1m4syAinS+FsFqchL8QgP
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN6PR02MB10629.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f2bfca-9a6d-4be3-89e2-08dddbb1e437
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 04:12:04.0608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JHzN2tuwtwdivBVMTfoZert+IMOAm2eMvGwYb5sIR9d8plGE0Mqx7/FWtTcbKcETHxcpdLkm4+G4zfw1t/1Tuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR02MB9864
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689eb399 cx=c_pps
 a=ynuEE1Gfdg78pLiovR0MAg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=et-ueJBdMx8H-l3GT74A:9 a=wPNLvfGTeEIA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4NlD8Th_aOyhbUQSLMk7GOZofmq0Wa44
X-Proofpoint-ORIG-GUID: 4NlD8Th_aOyhbUQSLMk7GOZofmq0Wa44
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfX16Ta5raG/Tux
 QmGUa6jbz+MV4XeXm+w1WSeSuFysXg2JfJCmRgxUd3EHvAvQV3kdy8w/TYphhUsdc24vtU8Nhrr
 akbjlrWdnJKxXDZnKO+j//YJmcte3rqtgjcDGdOfeqXbeZ5j+fthxpyyMx7ZBE9VplKI7gt5XvH
 FQ33vTZyH+n7PVHCpCPYnm3IMuQnpO8Jpb1BXw0YYqi5j79fw9awbhEml2lubR5vQNfPpye+yLe
 XLkfoF16OYB+CHkW8QpIYqQ3NzD3Y8QZsn66TNvQYwVTT/iC1bVOMBHPfvYjtBVz72JmwU1nog+
 ICJjQ47rWnPhIH5BlYGZi/0XJ8MUQ5RT4v8CT9wUHVycXybPRKXnWVmwu5DUBjhoDijEZJIJe/k
 5b/oH8St
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164

From: Krzysztof Kozlowski <krzk@kernel.org>=0A=
Sent: Thursday, August 14, 2025 7:17 PM=0A=
To: Quill Qi <leqi@qti.qualcomm.com>; Konrad Dybcio <konradybcio@kernel.org=
>; Bjorn Andersson <andersson@kernel.org>; Rob Herring <robh@kernel.org>; K=
rzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>=
=0A=
Cc: linux-arm-msm@vger.kernel.org <linux-arm-msm@vger.kernel.org>; devicetr=
ee@vger.kernel.org <devicetree@vger.kernel.org>; linux-kernel@vger.kernel.o=
rg <linux-kernel@vger.kernel.org>=0A=
Subject: Re: [PATCH v2] arm64: dts: qcom: Add initial audio support for Ham=
oa-IOT-EVK=0A=
=0A=
=0A=
>On 14/08/2025 11:48, Quill Qi wrote:=0A=
>>From: Krzysztof Kozlowski <krzk@kernel.org>=0A=
>>Sent: Thursday, August 14, 2025 4:41 PM=0A=
>>To: Quill Qi <leqi@qti.qualcomm.com>; Konrad Dybcio <konradybcio@kernel.o=
rg>; Bjorn Andersson <andersson@kernel.org>; Rob Herring <robh@kernel.org>;=
 Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.or=
g>=0A=
>>Cc: linux-arm-msm@vger.kernel.org <linux-arm-msm@vger.kernel.org>; device=
tree@vger.kernel.org <devicetree@vger.kernel.org>; linux-kernel@vger.kernel=
.org <linux-kernel@vger.kernel.org>=0A=
>>Subject: Re: [PATCH v2] arm64: dts: qcom: Add initial audio support for H=
amoa-IOT-EVK=0A=
>>=0A=
>>>>On 28/07/2025 13:08, Krzysztof Kozlowski wrote:=0A=
>>>>>On 28/07/2025 09:16, leqi via B4 Relay wrote:=0A=
>>>>>>From: leqi <leqi@qti.qualcomm.com>=0A=
>>>>>>=0A=
>>>>>>This patch adds initial audio codec support for the Hamoa-IOT-EVK boa=
rd,=0A=
>>>>>>including WCD9385 configuration, micbias voltage settings, GPIO reset=
,=0A=
>>>>>>and power supply bindings. It enables basic audio functionality for=
=0A=
>>>>>>further development. Basic test is good in Hamoa-IOT-EVK board.=0A=
>>>>>>=0A=
>>>>>>Signed-off-by: leqi <leqi@qti.qualcomm.com>=0A=
>>>>>>---=0A=
>>>>>>Changes in v2:=0A=
>>>>>>- Updated author email address to leqi@qti.qualcomm.com.=0A=
>>>>>>- Clarified that audio is validated with this change.=0A=
>>>>>>- Link to v1: https://lore.kernel.org/all/20250723-initial_audio_supp=
ort_for_qualcomm_hamoa_iot_evk_board-v1-1-816991701952@quicinc.com/=0A=
>>>>>>---=0A=
>>>>>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 232 +++++++++++++++++++=
++++++++++=0A=
>>>>>> 1 file changed, 232 insertions(+)=0A=
>>>>>>=0A=
>>>>>>diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/=
boot/dts/qcom/hamoa-iot-evk.dts=0A=
>>>>>>index 843f39c9d59286a9303a545411b2518d7649a059..91618e22e86c46c698b36=
39f60bc19314705b391 100644=0A=
>>>>>>--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts=0A=
>>>>>>+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts=0A=
>>>>>>@@ -124,6 +124,94 @@ pmic_glink_ss2_con_sbu_in: endpoint {=0A=
>>>=0A=
>>>=0A=
>>>This was not merged, was it? Same comment as other patch, when you have=
=0A=
>>>entire code ready send entire board. Not chunk by chunk.=0A=
>>>=0A=
>>>You are not following properly release early, release often.=0A=
>>=0A=
>>Why this is still not included in initial submission which happens now?=
=0A=
>>Either you work Linux style (release early) or, if you decide to wait=0A=
>>till everything is ready, you submit board as one patch, not everything=
=0A=
>>as 100 different patches.=0A=
>>=0A=
>>Hi Krzysztof, this audio change initial test is good with sound output an=
d record fine. But with further test in Ubuntu gui only=0A=
>>2 speakers have sound output. I am still seeing why this issue is happeni=
ng. I thought to solve the issues before replying=0A=
>>and merging this, thanks.=0A=
>=0A=
>Does not look like problem with kernel, though. If arecord and aplay, as=
=0A=
>you imply in your first sentence, work then the code is fine and should=0A=
>be squashed here.=0A=
=0A=
Hi Krzysztof, when running aplay only 2 speakers have sound output. I will =
try to merge this after issue is solved.=0A=
For now this is not good to merge this, thank you.=0A=
=0A=
>Best regards,=0A=
>Krzysztof=0A=
=0A=
--=0A=
BR=0A=
Quill=0A=

