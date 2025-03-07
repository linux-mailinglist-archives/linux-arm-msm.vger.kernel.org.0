Return-Path: <linux-arm-msm+bounces-50658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBA5A5759A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 00:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A5B0170AED
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 23:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B4662054F1;
	Fri,  7 Mar 2025 23:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="f7k4WE1h";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ARCw1sdH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="J7C3olAL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F60C19006F;
	Fri,  7 Mar 2025 23:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741388471; cv=fail; b=Pr0Ix4n2ElfjrIlwpnX81DwlegFR8tWTmI5lB3W2qedLAHUFCzt+yHwmDat+TzfZvOB+bvKvDRSab6JbcZXBhj7oQrbID+4Z6vY8ftAS1qC2cK1/44uuAzG7WBNn8d1E9aEC525qpD2q7lKDode+qLS4aA0zuUl7o3/4ci6/FGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741388471; c=relaxed/simple;
	bh=C5aQlP4CzVSssjnD4NJvDb8pZKzIy0kIwmQt5o24OlQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QovBW6HVpmSApnMasY7MrxirkPEnLcHL4e+m39x/9rgZIxzzo16HKyfRWHARr8JgXt000IFcCOc8E78wRTf4pezBA9yUDdKE+KGdsgGU/84VN6gLESInBSOqBNKLmfgMskNeXs+q3U1YavJ217WUYs8nQiMCK0eZNYmMLmN2gJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=f7k4WE1h; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ARCw1sdH; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=J7C3olAL reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 527JETM0007764;
	Fri, 7 Mar 2025 15:00:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=C5aQlP4CzVSssjnD4NJvDb8pZKzIy0kIwmQt5o24OlQ=; b=
	f7k4WE1hqZoxKDJtkG+vGNJg/vnNTiHKh7CS23HZTTUmRyxf9g0/+CuoRYD7io59
	KDijffj7Ti7bsvok3MUu+1Lib/v+RDqxuu0gkj2/mpMU4rUf1L7usCGaCqQHSpNc
	8mj4pGIHfbHQkvwcbaJiHXPbxjs0KW8xApRx3bPZMlWkJT/tw6J5rM1XWG8ldMFS
	2m1zIcIIzWM5R0Jss3h9b1uhRZu1TkRXvMGe/cZPmTepocMmQRLMtsz4eIcvkGR+
	Mj6x0sdYcTZU3FS80r/u6HW9CFRnROK87I2ZKVb22KqSi8Mk/CA4r1pACNGan0cq
	piQgbbA76l+rWoG94TXdww==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 45424twba2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Mar 2025 15:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1741388440; bh=C5aQlP4CzVSssjnD4NJvDb8pZKzIy0kIwmQt5o24OlQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ARCw1sdHf7JnRicfx4+4msavhnSit7aEdpotQ2H26IKM05RsHVZXe7E/rxRy5CYDs
	 M20k1qp6IbpSAs/IqhqO0k9F1A55pR/kYTyKeWvkBHLpZLvx+7Yf759GHOhINTZG2p
	 /JN5hgwFawt3HmbU5ozN7+Nom9hibXmmkgVrIV7RTMhBphb3+tUZB7dGCHVarOwhSS
	 uPm3Ztr+u9YNyI1fWvBSq+UsQ/6MO5qXNhvQsl51xxjy8fbHKdhGUi/qbO9encB3d3
	 93FAW6o5Q7G1XeS6yptWgP7Y1GwXiISpfI5D6qPteRhLri5ktTEMmwrzLJzoqJRVJI
	 Q5TjgM8vV4NBw==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EFEC140352;
	Fri,  7 Mar 2025 23:00:38 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id A9D68A00D9;
	Fri,  7 Mar 2025 23:00:37 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=J7C3olAL;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2044.outbound.protection.outlook.com [104.47.70.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3D41940347;
	Fri,  7 Mar 2025 23:00:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTAR/co9InI78PAHRS/+Uwqswz8hxEayF1Eu2iHTu1mxzZ12i5tZBkTgrdRnyoyM0VpXD97/A5tQTApYUB998rN8nDTG+zqiZQUI3d7ZakOXVla/zCgaMItF8WTDpzczYGda+7FzbCK6e9+HfxNNIcnXwZoZeu9+RH32ePVAhod3ZCtd2BxsXhVRTOcVmLXe7U/X1r+RnClclFELWots6M8aCjOA6+gY7Vc5v5zooIGfCwVJ7keraRBml0H/YbCan4jMr4Cmj4HlJI4k7/BI6l8pD9QGh2McA1aHWHNlcIhCYIGbHie3iIf1FgsCnItWYe2ZkQMGrxAxq0pytHKPzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5aQlP4CzVSssjnD4NJvDb8pZKzIy0kIwmQt5o24OlQ=;
 b=HCTtp7uItSwlWOuXjyGz11h5/dqjuzkHLo+eW5Htjx70cIJGrfYIacZL2M/XB21lsEseWsOZeItwAthcxa3D5k/mAaqJH8btT2T/rF5nZFxG86gSZaIwjDE6mwpmB+mWAowXdlUttf7dqZoot6vsfH6BiOjMT05jguLv+BsGbe1jnxzngcMICovUF2zqdJl13gJT/uqek1BkQ2RpyKFjWAUtTHWf5WvWHEEsmJZusYfzUgjqMAfXoC8HH4iY5DjnQOOCyJoBEK5blFxvl2sW8adhorl4w774gwfEjPKW+Nepci88hKiUaQ43GoUCYfY98veRaOL48zDRusNZ6JkYDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5aQlP4CzVSssjnD4NJvDb8pZKzIy0kIwmQt5o24OlQ=;
 b=J7C3olAL/lMVDDe+2JJCTVgp+ugwPtTpUw9du1EvxnMHSzx3tJoSO9qr5fQx++8+iE+wgu/2rrMHKM1Xty8fHkig4Wk+NXKjiurID+0mzUOiF/TVfZYuUdSqhF8sDfXw9EVsiWWWa1a4TSImWtFJ2EqbPI/Q1Y6A7wfnJDGedCo=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH0PR12MB7929.namprd12.prod.outlook.com (2603:10b6:510:284::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 23:00:32 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 23:00:32 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Bjorn Andersson <andersson@kernel.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Saravana Kannan <saravanak@google.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 5/7] usb: dwc3: qcom: Snapshot driver for backwards
 compatibilty
Thread-Topic: [PATCH v4 5/7] usb: dwc3: qcom: Snapshot driver for backwards
 compatibilty
Thread-Index:
 AQHbiKw5KJl/2rSglECIEFO5G8n187NiIOyAgAAJb4CAACsKAIABZTgAgAMIEgCAAZVhAA==
Date: Fri, 7 Mar 2025 23:00:32 +0000
Message-ID: <20250307230022.w6fignlsmzcg6k4e@synopsys.com>
References: <20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com>
 <20250226-dwc3-refactor-v4-5-4415e7111e49@oss.qualcomm.com>
 <20250304000527.ybxfdjx5xzypcals@synopsys.com>
 <20250304003913.bsn5sucnofq6d6jo@synopsys.com>
 <zr6qdi3gtjaj3gyalpspzej33q356bs5ynchcmtr73765gjel5@c5ijv7czkhqt>
 <20250305003148.mahxupphkaiizpbh@synopsys.com>
 <o4n7p5b5zlgstmkn5hbvdqfe4tkhwidgvtqmcfwtr5yhrvix24@an7xdurug6mm>
In-Reply-To: <o4n7p5b5zlgstmkn5hbvdqfe4tkhwidgvtqmcfwtr5yhrvix24@an7xdurug6mm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH0PR12MB7929:EE_
x-ms-office365-filtering-correlation-id: d7eddd88-3f3e-4bf0-9fd8-08dd5dcbdd03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WS80MEFLZWZueVZFWGtoaGhzcmVSSm9WN0xlTkc0dytaR3hPN1FhTkw3ZWY3?=
 =?utf-8?B?bUt4TUtVbjlPdDVlQlU4ZXRCdHliaDdpVElvcy9CZ3Zna1dZK3RIT2hmUU9u?=
 =?utf-8?B?VGh6Y05JNzUvZ3R4alhBb2NlYzBOOHNqTGp0cjBoME02Y1oxWWxzRG5ZZ1hy?=
 =?utf-8?B?MVorbFFmUkdMWGFnNk4wRTc1akx1bjAwZGxlbjl1K0FqR2RlMWg3YU1ZOW43?=
 =?utf-8?B?aHVpd052cC9QUDhFUmtNcWxJR2o4enlMeGpGbzZMYVd2Tmp1V0JTL0NlZDRy?=
 =?utf-8?B?Y2dHQVpvbDk2MDQ0eDJiMHY4RWVjU2RGRHNvVGlXZlJLelNBaUorb3FZN04z?=
 =?utf-8?B?Y0ZBdmZaVmVpdTlFSmxRRWdtazc3TnRxSHhJdzh0Y0JacFlNa2lFMTRta0tX?=
 =?utf-8?B?UUpNZTlHbEhIaTlORXN5cVBDNDUwNVJwSWFkTEMvZHNBTmhMVitwdzRvMW5C?=
 =?utf-8?B?RWhwOE1MS0V4TWR1UXNvTzZrTmZieHVHS0NqTDBSNHZvK0xjc21vT2NzRzUy?=
 =?utf-8?B?MjBWTGE1cXYxREFRZnBLb0Z6bnEreHpXMW03RXptOVNzeHVTY3JtQnhPRDR6?=
 =?utf-8?B?ZTgzYzNIRGNWcTcrYjA4R1lyanM0ZHNhZ3VBdWMrVU9GWHl3b3RrWVdlNmNF?=
 =?utf-8?B?T2pISllxSHpGTGsxcC9aSm5lOGFVMUJHSytxMll4bERNWFdxN09ka3A5Tko2?=
 =?utf-8?B?bm5DZjcrVFJzTC9JZk55cThnN1gyNENEbDBSM3VpbVpHKzgyUVpVWFpGKzMx?=
 =?utf-8?B?QXo1L0FxZ2JnZUVxOGt5YmhiWlR6UzA2RU5kVVRvUVJqZ1o4VWhWQzVNUEpF?=
 =?utf-8?B?cEhCUHovNVV6WTdxYVFkQVljY0hiTWUyd1luMzZJSFhkTEx5ME5ZT3RrMTdw?=
 =?utf-8?B?WDJJWVUvU1ZqdU9STmRhYy9TZ0ZpdXZxcjN6RmFQbWJiQkwzNWhlTE55QUFI?=
 =?utf-8?B?NkVRaDAxUjZwL2dEd2FyVXlCaXJiZERidUs1R0Zsb2FIR1ZsekRaOFRJbmRp?=
 =?utf-8?B?bUMxL1F3RnZNcklaekRsRlhOU3lIN0oyRTdHSjcxbnBBaU9zVStqcjYzM3BK?=
 =?utf-8?B?VzRTazAxT1lsNnF4U011T2RBQUs0dGc2d3VzYkFQQlZoMFBRaUlXWXJKSU9Y?=
 =?utf-8?B?YnVZQmEvUXBCRlFXR3hKRis2UDlqbDh5b1crZVZkY1BhbFkySWVGV2FtZHhW?=
 =?utf-8?B?TXRKbWtST3dpa2gzWmx2M3ZJTlhIcENtR0xWM3lhKzRUSmlWTDV5ZXBRQTdP?=
 =?utf-8?B?SDRiUmxSc0g4VWYxTkk3MS8rMk8rd0NnYmRNbk90QnNQUFdZL0xDRHptbE0y?=
 =?utf-8?B?TWJBRXNma0dPUm9Wb0RiT3ZJTTdlVEpwOFI1S0hZeDZISERDWWRwRURETW1h?=
 =?utf-8?B?QmUzKzRYbTJOeDNJTmVXcDZEL2JVSzR5SUxlbTUrVUtXQkZPdjNnbE9vL1Ir?=
 =?utf-8?B?R3JWRUR5MDBHcUU1a1Q1R2lPSFo3ZlJEVmhpanZXd0ZKamlZejk2dVJVSmFV?=
 =?utf-8?B?eWszRzhRdnBneEpBTHlIbzQvSVdtM3A1ZWN5NU96ZWJsS05TRnRSbFI5RSs5?=
 =?utf-8?B?ZE50TTBxcXh3WFdCMllwb2VMN0dzY0ZMUFR5aldKTWp3V21RQXgrMkNCLzRC?=
 =?utf-8?B?L3F2eHRLK2J1bkgyZEU0WHlTMlZ2T3YwY1FuQUxtTnZXeWYrRy8xWTVJb1hI?=
 =?utf-8?B?QmRjUFpXZkp1RDdDMmlwNWZtNTFqbytHT3FvazlKZGRCQzdqTUlIWEU2b3lW?=
 =?utf-8?B?RzlhZmJMblc5U3cvVmZPaWVkYkVKVVB5VFhVckk4L3NLY0hZc3JqWE5rOXlj?=
 =?utf-8?B?aGFRMERGcTZhNGVkZ1E1VmFEM2VoaTd1UkJ5Um4wN2lodlVPMFdmbmRtVGhw?=
 =?utf-8?B?S3lNRUlSQVo4Wmh2ZllqSExpNkl0cGR0UnUvMHdtZ1VPRTQrL2ZCWFhac0Z4?=
 =?utf-8?Q?hV5fi0/+E+SdjC6zIqQIylpRPwuPVXie?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UzdXSXpqUGZ4Qmx0akpNMUlmQ1BjSm5ML0VWRzdxRmZEdnBZTHNlYWJXbWI1?=
 =?utf-8?B?SFhBNXlocGs3L1cvZm56emNUd0lxckhOZUFudXBKOHk1ZzZDTlRucllhOTNz?=
 =?utf-8?B?QUpGbGxKcnFxdE00NDZlb2MvOHlwU2xpMzV0OE5tUW9TQ3VrN05xNW95MzRn?=
 =?utf-8?B?V2duS0xKTXhIS0grcEJvdFNIdDdQa3YvNFRxZGZuU21pUHlEWlhLczFIUTd5?=
 =?utf-8?B?OFlCZ0JBQ3hpY0doYTVreFZ0N2x5NE01SkQ3TUlTd3A0NHgvNXB4VktacGpD?=
 =?utf-8?B?YTZwcGk1anR1ejIvYmo5VWVZdlJPWm5HRUNDSmpJaDVWbGRUWmppYXMrTEph?=
 =?utf-8?B?R2x0MGx5RmVCeGl2dDRTRnlHMW14elVEWitOcFk2VUQvbzhmWU40ajRXMXhU?=
 =?utf-8?B?eTBRanhaT3M0ZzhoZWVIb2lQendlKzVtODU5QjRmYm1SU1lSZWdPRVlGMEp2?=
 =?utf-8?B?czNWbVFuOHFXOFU4U0g5dWJDc2l1WmtaQWExdmdlL0Z3VGNmb3FtajErYnVm?=
 =?utf-8?B?MW1ISE9MRTg0NWhKV1NRbHlEV2xqekExdU53cTBqbkUzZDR5OGRSeDFtdHll?=
 =?utf-8?B?ZCtWRVJwY3VVVzl5T1B3dW9vZTA4UnB6N29KeEtsOVhVOGw2Y0FWUEZ0clV0?=
 =?utf-8?B?ZElVRzdFMkQwUEFuVSt3TGhxbTNvbURiMzdtRTNQQXdpY295SVFhUXB4TXcz?=
 =?utf-8?B?K21OOHh1UWtUWlV2K3Y2czQzaC9UQk1zZkFXWnNWSlVuTHhtQmU3RmZ4eUZw?=
 =?utf-8?B?MEtEdnhFQU1ycjllTlJFNDFXSnZWVzBibEk4eDZaL04yMHpqSFFyUkFrWVRH?=
 =?utf-8?B?M3RXb2s4Q3YxMjdvbnlUbFZRMXBMUEgza1lrZ1duTStrNng0ZjBhbUJIcnpn?=
 =?utf-8?B?ajlnZ1k4Z0hNU1VqSjRWNjlpUktLdFVieG5KRjhHUFBFbmxxSFVhZmF4RTds?=
 =?utf-8?B?WUhpTmVnbmhIdXhBcElhREo0RXk1U05Ncm9qa1dWQnMvNmRuVUFhVmZLUzJr?=
 =?utf-8?B?V1R6VysycmhRa1ZjUTFScnBFem4yWHpnYmdjeGM5My9pV3VaY1BmYW9EazlM?=
 =?utf-8?B?V1JtYjhjREJkYmVNUjFBV0o2SzNMWmZTUkhNN3YzTklXejRYSnJOV1F3UGxR?=
 =?utf-8?B?cDBRT0p3YnlsalZFVHRWbmEvN2FLSkR2dFZIUUVqOXVZQVk2TnNqZGo1TkhO?=
 =?utf-8?B?NC9MaE5WTHVVSXBhcnJjaWZRNndsYUpqazU5aGplRVV6L0ZydTZaYzZmTUdM?=
 =?utf-8?B?ZitQaGtUVDVmV3dOelVXb3JubzhSWERqa0pqL2RhbHVnUWc1RTR4RkxxVlFN?=
 =?utf-8?B?a3Z0QUJnaFR1Ny9zT09OTzA3b1JsSUdRUmZ2aUUza3Nsb3pWSnFnaDBib1Zz?=
 =?utf-8?B?WnI4b1NLQlRiWkFtbGtDSDNMa3R5ZDdFdWF2NXRYVTdGQUFNb0Vra3lWRlo0?=
 =?utf-8?B?cTdQSjFUdWttTzJkSGdHanZvcklNam04bjVwZW1CWFdvaWNqZnhsTWtIVUp3?=
 =?utf-8?B?SDN3cWQ4RmxQSkNZYXkzaUJZZnhEais4czF1NVluZWRYSHFMZGdWcFNjNWpF?=
 =?utf-8?B?TURNaXhaWGQ0UGFoZEhzcmVaSklDNVNhZ0NINHcvdXQzZ1ZwQThIaGJMNFdF?=
 =?utf-8?B?andXbFRUeXJJUGhWdkMwQldWdllzblduUkRSWHZ0U0UrZjNxVENOR3VOUzR3?=
 =?utf-8?B?MXVCLzViWVhpZVhVa1FXbnIwVnJmYzcwbllmUkxIbml5TTZiRStiRUlPQ2k4?=
 =?utf-8?B?d3RLN01NMHYrd2NPQ2lGdkpCak1QNFVkMHc0Skc2TFhROS9QUHJNVFZ2bFAv?=
 =?utf-8?B?ZlNLaHdZUjY4YUt2UUJ5azQ3WTlGcDVNTTNBcS9tNzY1STJvcEk2blNGa0kw?=
 =?utf-8?B?b2xWdlhRV1hlRGJ2dDJvT0ZXU1pSalBPR3NyQWZxWmMvaHFuZWF2VUM0OGZ4?=
 =?utf-8?B?VFNwOXlBVXhQVVQzZXFESVhiUW9obTFzbENzQWhCL0IrV3VjaVdoTmp4bW4z?=
 =?utf-8?B?RGxYNlcrbGdRbG8vVURSRklqMFFPQmNPeUNkNlk2YldCYXJzczlzQ05uTFdv?=
 =?utf-8?B?SFF1K1o5aWVmbzdpeUVobU9hK1lKcWtuRXJaL0FUNjBYazhsVE5FVjhHNnhp?=
 =?utf-8?Q?FdhvGo785jHX7Bv5vtWBnBI0d?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <311BB1675EBE5C41B8B64E55DDBF6476@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fMmOYRRXRGaFeR4DTEwQ5I4ScuHWnmTYEz8oJalUufp3CZAbJQ4A7u6v5vg8WnN36xTlfOSSfLiPKqTv2gRFCAf5bSTQaIGh49k1b6QP6vO3yl98bbgkd3BQ5EMJMyShpRpJ+Ru5j3aPDK+PSx7EwceXHpZ1tl8Oe4kHZ0wrFu8uqEAXuM/dZkdDuIIBG1/4Kp8YIsw70v3Ai4WL9dbVpAlA1g5uJAmVMWY6RQfs1xqAdeRHIFmc7OQ1Z0UEAw8Gq2sM5kVCuqQJPS5bU2V/Dws4CXK2q2lveWkSHpLGnMHyvpyIpxWhbLmIzZqXhc+NTSGDMXJZIVIbY3z8/4zh6yyTCI/JG14maLDMaYuM9OAjbIdRSKIWeC71fdMzg2GKn1PNFbGTf4Gb+/BIVKKA8pyVA32NuXWVaTKijp+6uRNSmDyP8W/mxLGbgvbRj9T5Xa1sT/7FBdMnvEk2BEKx9xhRbke1PbRA+QHSmeMEifRaPI0DuJhjXvKRYsgh1LsAs6r4icdICNbhFQSAQgiJ8QggTdriCOGOE6Kxt3XpVkjBGv+cMODOC9jzHo8GSYCedjG8VIcpPwmLUFM7HPlVu/A0NwP+2BHJ1pBPuUk7MoXZSoHym9p8cOA3/O3HwVsTFp3gWBRANhSQuFaoNT+acA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7eddd88-3f3e-4bf0-9fd8-08dd5dcbdd03
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 23:00:32.4101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 30uYb0cFBsOUIUndt4NzeM+mUeG4ViRrpod3pe4AwYRu6Q4ZKO33VV+69DOllJ8iIQTsL12jz0le8djgrCoVFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7929
X-Proofpoint-ORIG-GUID: p6g17lGZdP9aMLftBbgcw14iKybt38c3
X-Proofpoint-GUID: p6g17lGZdP9aMLftBbgcw14iKybt38c3
X-Authority-Analysis: v=2.4 cv=NPgv+16g c=1 sm=1 tr=0 ts=67cb7a98 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=qPHU084jO2kA:10 a=EUspDBNiAAAA:8 a=rCDClJybgSGgXRKwaBAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_08,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503070173

T24gVGh1LCBNYXIgMDYsIDIwMjUsIEJqb3JuIEFuZGVyc3NvbiB3cm90ZToNCj4gT24gV2VkLCBN
YXIgMDUsIDIwMjUgYXQgMTI6MzE6NDlBTSArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+
IE9uIE1vbiwgTWFyIDAzLCAyMDI1LCBCam9ybiBBbmRlcnNzb24gd3JvdGU6DQo+ID4gPiBPbiBU
dWUsIE1hciAwNCwgMjAyNSBhdCAxMjozOToxMkFNICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6
DQo+ID4gPiA+IE9uIFR1ZSwgTWFyIDA0LCAyMDI1LCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4g
PiA+ID4gT24gV2VkLCBGZWIgMjYsIDIwMjUsIEJqb3JuIEFuZGVyc3NvbiB3cm90ZToNCj4gPiA+
ID4gPiA+IEluIG9yZGVyIHRvIG1vcmUgdGlnaHRseSBpbnRlZ3JhdGUgdGhlIFF1YWxjb21tIGds
dWUgZHJpdmVyIHdpdGggdGhlDQo+ID4gPiA+ID4gPiBkd2MzIGNvcmUgdGhlIGRyaXZlciBpcyBy
ZWRlc2lnbmVkIHRvIGF2b2lkIHNwbGl0dGluZyB0aGUgaW1wbGVtZW50YXRpb24NCj4gPiA+ID4g
PiA+IHVzaW5nIHRoZSBkcml2ZXIgbW9kZWwuIEJ1dCBkdWUgdG8gdGhlIHN0cm9uZyBjb3VwbGlu
ZyB0byB0aGUgRGV2aWNldHJlZQ0KPiA+ID4gPiA+ID4gYmluZGluZyBuZWVkcyB0byBiZSB1cGRh
dGVkIGFzIHdlbGwuDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IFZhcmlvdXMgd2F5cyB0byBw
cm92aWRlIGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5IHdpdGggZXhpc3RpbmcgRGV2aWNldHJlZQ0K
PiA+ID4gPiA+ID4gYmxvYnMgaGFzIGJlZW4gZXhwbG9yZWQsIGJ1dCBtaWdyYXRpbmcgdGhlIERl
dmljZXRyZWUgaW5mb3JtYXRpb24NCj4gPiA+ID4gPiA+IGJldHdlZW4gdGhlIG9sZCBhbmQgdGhl
IG5ldyBiaW5kaW5nIGlzIG5vbi10cml2aWFsLg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBG
b3IgdGhlIHZhc3QgbWFqb3JpdHkgb2YgYm9hcmRzIG91dCB0aGVyZSwgdGhlIGtlcm5lbCBhbmQg
RGV2aWNldHJlZSBhcmUNCj4gPiA+ID4gPiA+IGdlbmVyYXRlZCBhbmQgaGFuZGxlZCB0b2dldGhl
ciwgd2hpY2ggaW4gcHJhY3RpY2UgbWVhbnMgdGhhdCBiYWNrd2FyZHMNCj4gPiA+ID4gPiA+IGNv
bXBhdGliaWxpdHkgbmVlZHMgdG8gYmUgbWFuYWdlZCBhY3Jvc3MgYWJvdXQgMSBrZXJuZWwgcmVs
ZWFzZS4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gRm9yIHNvbWUgdGhvdWdoLCBzdWNoIGFz
IHRoZSB2YXJpb3VzIFNuYXBkcmFnb24gbGFwdG9wcywgdGhlIERldmljZXRyZWUNCj4gPiA+ID4g
PiA+IGJsb2JzIGxpdmUgYSBsaWZlIHNlcGFyYXRlIG9mIHRoZSBrZXJuZWwuIEluIGVhY2ggb25l
IG9mIHRoZXNlLCB3aXRoIHRoZQ0KPiA+ID4gPiA+ID4gY29udGludWVkIGV4dGVuc2lvbiBvZiBu
ZXcgZmVhdHVyZXMsIGl0J3MgcmVjb21tZW5kZWQgdGhhdCB1c2VycyB3b3VsZA0KPiA+ID4gPiA+
ID4gdXBncmFkZSB0aGVpciBEZXZpY2V0cmVlIHNvbWV3aGF0IGZyZXF1ZW50bHkuDQo+ID4gPiA+
ID4gPiANCj4gPiA+ID4gPiA+IFdpdGggdGhpcyBpbiBtaW5kLCBzaW1wbHkgY2FycnlpbmcgYSBz
bmFwc2hvdC9jb3B5IG9mIHRoZSBjdXJyZW50IGRyaXZlcg0KPiA+ID4gPiA+ID4gaXMgc2ltcGxl
ciB0aGFuIGNyZWF0aW5nIGFuZCBtYWludGFpbmluZyB0aGUgbWlncmF0aW9uIGNvZGUuDQo+ID4g
PiA+ID4gPiANCj4gPiA+ID4gPiA+IFRoZSBkcml2ZXIgaXMga2VwdCB1bmRlciB0aGUgc2FtZSBL
Y29uZmlnIG9wdGlvbiwgdG8gZW5zdXJlIHRoYXQgTGludXgNCj4gPiA+ID4gPiA+IGRpc3RyaWJ1
dGlvbnMgZG9lc24ndCBkcm9wIFVTQiBzdXBwb3J0IG9uIHRoZXNlIHBsYXRmb3Jtcy4NCj4gPiA+
ID4gPiA+IA0KPiA+ID4gPiA+ID4gVGhlIGRyaXZlciwgd2hpY2ggaXMgZ29pbmcgdG8gYmUgcmVm
YWN0b3JlZCB0byBoYW5kbGUgdGhlIG5ld2x5DQo+ID4gPiA+ID4gPiBpbnRyb2R1Y2VkIHFjb20s
c25wcy1kd2MzIGNvbXBhdGlibGUsIGlzIHVwZGF0ZWQgdG8gdGVtcG9yYXJpbHkgbm90DQo+ID4g
PiA+ID4gPiBtYXRjaCBhZ2FpbnN0IGFueSBjb21wYXRpYmxlLg0KPiA+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gPiBUaGlzIGRyaXZlciBzaG91bGQgYmUgcmVtb3ZlZCBhZnRlciAyIExUUyByZWxlYXNl
cy4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQmpvcm4gQW5kZXJz
c29uIDxiam9ybi5hbmRlcnNzb25Ab3NzLnF1YWxjb21tLmNvbT4NCj4gPiA+ID4gPiA+IC0tLQ0K
PiA+ID4gPiA+ID4gIGRyaXZlcnMvdXNiL2R3YzMvTWFrZWZpbGUgICAgICAgICAgIHwgICAxICsN
Cj4gPiA+ID4gPiA+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS1sZWdhY3kuYyB8IDkzNCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiA+ID4gPiA+ICBkcml2ZXJz
L3VzYi9kd2MzL2R3YzMtcWNvbS5jICAgICAgICB8ICAgMSAtDQo+ID4gPiA+ID4gPiAgMyBmaWxl
cyBjaGFuZ2VkLCA5MzUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gVGhpcyBpcyBhIGJpdCBjb25jZXJuaW5nIGlmIHRoZXJl
J3Mgbm8gbWF0Y2hpbmcgY29tcGF0aWJsZSBzdHJpbmcuIGllLg0KPiA+ID4gPiA+IHdlIGRvbid0
IGhhdmUgdXNlciBmb3IgdGhlIG5ldyBkcml2ZXIgd2l0aG91dCBkb3duc3RyZWFtIGRlcGVuZGVu
Y2llcw0KPiA+ID4gPiA+IChvciBzb21lIHdvcmthcm91bmQgaW4gdGhlIGRyaXZlciBiaW5kaW5n
KS4NCj4gPiA+ID4gDQo+ID4gPiA+IElnbm9yZSB0aGUgY29tbWVudCBhYm92ZSwgSSBtaXNzZWQg
dGhlICJ0ZW1wb3JhcmlseSIgaW4geW91ciBsb2cNCj4gPiA+ID4gYWJvdmUuIEhvd2V2ZXIsIHRo
ZSBjb21tZW50IGJlbG93IHN0aWxsIHN0YW5kcy4NCj4gPiA+ID4gDQo+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gV2hpbGUgSSB1bmRlcnN0YW5kIHRoZSBpbnRlbnRpb24sIEknbSBhZnJhaWQgd2UgbWF5
IGhhdmUgdG8gc3VwcG9ydCBhbmQNCj4gPiA+ID4gPiBtYWludGFpbiB0aGlzIG11Y2ggbG9uZ2Vy
IHRoYW4gdGhlIHByb3Bvc2VkIDIgTFRTIHJlbGVhc2VzIChhcyBzZWVuIHdpdGgNCj4gPiA+ID4g
PiBhbnl0aGluZyB0YWdnZWQgd2l0aCAibGVnYWN5IiBpbiB0aGUgdXBzdHJlYW0ga2VybmVsKS4N
Cj4gPiA+IA0KPiA+ID4gVGhlcmUgYXJlIG5vIHByb2R1Y3RzIHNoaXBwaW5nIHRvZGF5IHVzaW5n
IGR3YzMtcWNvbSB3aGVyZSBEZXZpY2V0cmVlIGlzDQo+ID4gPiBjb25zaWRlcmVkIGZpcm13YXJl
LiBUaGUgcHJpbWFyeSBhdWRpZW5jZSBmb3IgYSBsb25nZXIgdHJhbnNpdGlvbiBpcw0KPiA+ID4g
dXNlcnMgb2YgdGhlIHZhcmlvdXMgbGFwdG9wcyB3aXRoIFF1YWxjb21tLWNoaXAgaW4gdGhlbS4g
QnV0IGdpdmVuIHRoZQ0KPiA+ID4gcmFwaWQgZGV2ZWxvcG1lbnQgaW4gYSB2YXJpZXR5IG9mIGZ1
bmN0aW9uYWwgYXJlYXMsIHRoZXNlIHVzZXJzIHdpbGwgYmUNCj4gPiA+IGhpZ2hseSBjb21wZWxs
ZWQgdG8gdXBkYXRlIHRoZWlyIERUQnMgd2l0aGluIDIgeWVhcnMuDQo+ID4gPiANCj4gPiA+IFRo
ZSBvdGhlciBvYnZpb3VzIHVzZXIgZ3JvdXAgaXMgdG8gbWFrZSBzdXJlIHVzIHVwc3RyZWFtIGRl
dmVsb3BlcnMNCj4gPiA+IGRvbid0IGxvb3NlIFVTQiB3aGVuIHRoaW5ncyBnZXQgb3V0IG9mIHN5
bmMuDQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gVGhhdCBzYWlkLCBpZiB0aGUgbW9kZWwgZGVmaW5l
ZCBoZXJlIGlzIHRvIGJlIGZvbGxvd2VkIGluIG90aGVyIGNhc2VzDQo+ID4gPiAob3IgbXkgb3Ro
ZXIgdmVuZG9ycykgd2hlcmUgRGV2aWNldHJlZSBpcyB0cmVhdGVkIGFzIGZpcm13YXJlLCB5b3Vy
DQo+ID4gPiBjb25jZXJucyBhcmUgdmFsaWQgLSBhbmQgaXQgbWlnaHQgYmUgd29ydGggdGFraW5n
IHRoZSBjb3N0IG9mIG1hbmFnaW5nDQo+ID4gPiB0aGUgbGl2ZS1taWdyYXRpb24gY29kZS4NCj4g
PiA+IA0KPiA+ID4gPiA+IElmIHBvc3NpYmxlLCBJJ2QNCj4gPiA+ID4gPiBwcmVmZXIgdGhlIGNv
bXBsaWNhdGlvbnMgb2YgbWFpbnRlbmFuY2Ugb2YgdGhlIG1pZ3JhdGlvbiBjb2RlIGJlIGhhbmRs
ZWQNCj4gPiA+ID4gPiBkb3duc3RyZWFtLg0KPiA+ID4gPiA+IA0KPiA+ID4gDQo+ID4gPiBJJ20g
c29ycnksIGJ1dCBoZXJlIGl0IHNvdW5kcyBsaWtlIHlvdSdyZSBzYXlpbmcgdGhhdCB5b3UgZG9u
J3Qgd2FudCBhbnkNCj4gPiA+IG1pZ3JhdGlvbiBjb2RlIHVwc3RyZWFtIGF0IGFsbD8gVGhpcyBp
cyBub3QgcG9zc2libGUsIGFzIHRoaXMgd2lsbCBicmVhaw0KPiA+ID4gVVNCIGZvciBkZXZlbG9w
ZXJzIGFuZCB1c2VycyBzaG9ydCB0ZXJtLiBXZSBjYW4gb2YgY291cnNlIGRpc2N1c3MgdGhlIDIN
Cj4gPiA+IExUUyB0aG91Z2gsIGlmIHlvdSB3YW50IGEgc2hvcnRlciBsaWZlIHNwYW4gZm9yIHRo
aXMgbWlncmF0aW9uLg0KPiA+ID4gDQo+ID4gDQo+ID4gTXkgZmlyc3QgY29uY2VybiBpcyBub3cg
d2UgaGF2ZSBhIGxlZ2FjeSBkcml2ZXIgdGhhdCBzaG91bGQgbm90IGJlDQo+ID4gY29udGludWVk
IHRvIGJlIGRldmVsb3BlZCB3aGlsZSB3ZSBhbHNvIG5lZWQgdG8gYWRkcmVzcyBhbnkNCj4gPiBy
ZWdyZXNzaW9uL2ZpeGVzIGZvdW5kIGluIHRoZSBmdXR1cmUgZnJvbSB0aGUgbGVnYWN5IGRyaXZl
ci4gV2hpbGUgSQ0KPiA+IHdvdWxkIGVuY291cmFnZSB1c2VycyB0byBzdGFydCBtaWdyYXRpbmcg
dG8gdGhlIG5ldyBkcml2ZXIsIEkgd29uJ3QNCj4gPiByZWplY3QgZml4ZXMgdG8gdGhlIGxlZ2Fj
eSBkcml2ZXIgZWl0aGVyLiBJbiB0aGUgbmV4dCAyIHllYXJzKywgbXkNCj4gPiBvdGhlciBjb25j
ZXJuIGlzIHRoYXQgSSdtIG5vdCBjb25maWRlbnQgdGhhdCB3ZSBjYW4gZWFzaWx5IHJlbW92ZSB0
aGUNCj4gPiBsZWdhY3kgZHJpdmVyIGFuZCB0aGUgRFRTIHRoZW4uDQo+ID4gDQo+IA0KPiBUaGUg
cHJvYmxlbSBhdCBoYW5kIGlzIHRoYXQgdGhlIGRyaXZlciBfbmVlZHNfIGEgYnVuY2ggb2Ygd29y
ay4NCj4gUm9sZS1zd2l0Y2hpbmcgb25seSB3b3JrcyBzb21ldGltZXMsIGV4dGNvbiBpcyAoZm9y
IG9sZGVyIHBsYXRmb3JtcykNCj4gZHVwbGljYXRlZCBpbiBib3RoIGdsdWUgYW5kIGNvcmUgLSB3
aXRoIHRoZSBob3BlIHRoYXQgZWFjaCBwYXJ0IGRvZXMgaXRzDQo+IHRoaW5nIGluIGEgc3VpdGFi
bGUgZmFzaGlvbiwgdGhlIGxheWVyaW5nIHZpb2xhdGlvbnMgY2FuIHRyaWdnZXINCj4gTlVMTC1w
b2ludGVyIGRlcmVmZXJlbmNlcyBvciB1c2UtYWZ0ZXItZnJlZSwgUE0gcnVudGltZSBpcyBtYXJr
ZWQNCj4gZm9yYmlkZGVuLi4uDQo+IA0KPiBXZSd2ZSBsb29rZWQgYXQgdGhlc2UgcHJvYmxlbXMg
Zm9yIGEgZmV3IHllYXJzIG5vdywgd2l0aG91dCBjb21pbmcgdXANCj4gd2l0aCBhbnkgc29sdXRp
b24gdG8gYWRkcmVzcyB0aGVzZSBpc3N1ZXMgd2l0aGluIHRoZSBjdXJyZW50IGRlc2lnbi4NCg0K
VGhhdCdzIHVuZGVyc3Rvb2QsIGFuZCB0aGF0J3MgdGhlIGluY2VudGl2ZSBmb3IgeW91ciB3b3Jr
IGhlcmUuDQoNCj4gDQo+IEZvbGxvd2luZyB0aGlzIHJlZmFjdG9yLCB3ZSB3aWxsIGJlIGFibGUg
dG8gd29yayBvbiB0aGVzZSBpbXByb3ZlbWVudHMuDQo+IEZvciB0aGlzIHRvIGhhcHBlbiwgSSBp
bnRlbmQgdG8gdHJhbnNpdGlvbiBhbGwgdGhlDQo+IGFyY2gvKi9ib290L2R0cy9xY29tLyogcGxh
dGZvcm1zIHRvIHRoZSBuZXcgYmluZGluZyBhcyBzb29uIGFzIHBvc3NpYmxlLg0KPiANCj4gDQo+
IExvb2tpbmcgYWhlYWQsIHdoZW4gd2UgaGl0IHRoZSBwb2ludCBvZiBkZXByZWNhdGluZyB0aGUg
ZHdjMy1xY29tLWxlZ2FjeQ0KPiBkcml2ZXI6DQo+IA0KPiBUaGUgdXBzdHJlYW0tYmFzZWQgcHJv
ZHVjdCB3ZSBoYXZlIHRvZGF5IGRvIHNoaXAgRGV2aWNldHJlZSBpbg0KPiBjb21iaW5hdGlvbiB3
aXRoIHRoZSBrZXJuZWwsIHNvIHRoZXkgd291bGQgdXBncmFkZSBib3RoIHRvZ2V0aGVyIGFuZCBn
ZXQNCj4gdGhlIG5ldyBkcml2ZXIuDQo+IA0KPiBUaGUgb3RoZXIgZ3JvdXAgd291bGQgYmUga2Vy
bmVsIGRldmVsb3BlcnMsIGVudGh1c2lhc3RzLCBzcGVjaWZpYyB1c2Vycw0KPiB3aG8gZm9yIHNv
bWUgcmVhc29uIGlzIHVwZ3JhZGluZyB0aGVpciBrZXJuZWwgYnV0IG5vdCB0aGVpciBEZXZpY2V0
cmVlLg0KPiBUaGVzZSB1c2VycyB3aWxsIHdhbnQgdGhlIG5ldyBmZWF0dXJlcyBhbmQgc3RhYmls
aXR5IHdlJ3JlIGJyaW5naW5nLg0KPiANCj4gPiBDb2RlIGNhbiBicmVhaywgYW5kIHRoYXQncyBu
b3QgdW5leHBlY3RlZC4gSWYgMiBMVFMgcmVsZWFzZXMgbGF0ZXIgYW5kDQo+ID4gd2UgcmVtb3Zl
IHRoZSBkd2MzLXFjb20tbGVnYWN5LCB0aGluZ3MgY2FuIGJyZWFrIHRoZW4gdG9vLiBUaGlzIG1h
eSBqdXN0DQo+ID4gYXMgYmUgcGFpbmZ1bCBpZiB3ZSBuZWVkIGZpeGVzIHRvIHRoZSBsZWdhY3kg
ZHJpdmVyIGR1ZSB0byBzb21lIHByZXZpb3VzDQo+ID4gcmVncmVzc2lvbi4gQWxzbywgSSdtIHN1
cmUgeW91ciB0ZWFtIGRpZCBhIGZhaXIgc2hhcmUgb2YgdGVzdGluZyB0aGUgbmV3DQo+ID4gZHJp
dmVyIHJpZ2h0PyBJcyB0aGVyZSBzb21lIG1ham9yIGNvbmNlcm4gaW4gdGhlIG5ldyBkcml2ZXIg
dGhhdCB3ZQ0KPiA+IGhhdmVuJ3QgYWRkcmVzc2VkPw0KPiA+IA0KPiANCj4gVGhlIG5ldyBhbmQg
b2xkIGRyaXZlcnMgYXJlIG1vc3RseSBpZGVudGljYWwgYXQgdGhpcyBwb2ludCwgYW5kIGV4cGVj
dGVkDQoNClRoaXMgd2FzIG15IGV4cGVjdGF0aW9uLCB0aGF0IHRoZSBuZXcgYW5kIG9sZCBkcml2
ZXJzIGFyZSBtb3N0bHkNCmlkZW50aWNhbCBhdCB0aGlzIHBvaW50LiBUaGlzIGlzIG9uZSBvZiB0
aGUgcmVhc29ucyB3aHkgSSBzdWdnZXN0ZWQgdG8NCmRpcmVjdGx5IHN3aXRjaCB0byB1c2luZyB0
aGUgbmV3IGRyaXZlciBhdCB0aGlzIHBvaW50Lg0KDQo+IHRvIGRpdmVyZ2UgZnJvbSBoZXJlLg0K
DQpUaGlzIGlzIHdoYXQgSSB3YW50IHRvIGF2b2lkLg0KDQo+IA0KPiBUaGUgb25lIHRoaW5nIEkg
aGF2ZSBpZGVudGlmaWVkIHRvIGRpZmZlciBpcyB0aGF0IHRoZSAibGVnYWN5IiBkcml2ZXINCj4g
c3VwcG9ydHMgMiBleHRjb24gaGFuZGxlcyBpbiB0aGUgZ2x1ZSwgYnV0IHRoaXMgaXMgbm90IGNv
bnNpZGVyZWQNCj4gYWNjZXB0YWJsZSBieSB0aGUgYmluZGluZyBzbyBJIGhhdmVuJ3QgZm91bmQg
YW55b25lIGFjdHVhbGx5IGV4ZXJjaXNpbmcNCj4gdGhpcyBjb2RlIHBhdGggLSB0aGVuIGFnYWlu
IGV4dGNvbiBhbmQgdXNiX3JvbGVfc3dpdGNoIGlzIG9uZSBvZiB0aGUNCj4gdGhpbmdzIHRoaXMg
ZW5hYmxlcyB1cyB0byBjbGVhbiB1cC4NCj4gDQo+IA0KPiBUaGF0IHNhaWQsIHdoaWxlIHRoaXMg
bW9kZWwgc2VlbXMgc3VpdGFibGUgZm9yIFF1YWxjb21tLCBkdWUgdG8gdGhlDQo+IGN1cnJlbnQg
c3RhdGUgb2YgdGhpbmdzLCBJIGRvbid0IGtub3cgaWYgdGhlIHNhbWUgaXMgdHJ1ZSBmb3IgRnJh
bmsgTGksDQo+IHBlcmhhcHMgTlhQIGhhcyBhIGJyb2FkZXIgdXNlciBiYXNlIGFuZCBuZWVkIHRo
ZSBtaWdyYXRpb24gbG9naWMuDQo+IA0KDQpUaGlzIHdhcyBub3QgZXhwZWN0ZWQuIElmIHRoZSBu
ZXcgZHJpdmVyIGRvZXNuJ3Qgc3VwcG9ydCBjZXJ0YWluIGRldmljZXMNCndpdGggZXh0Y29uLCBo
b3cgY2FuIHdlIGV4cGVjdCB0byByZW1vdmUvZGVwcmVjYXRlIHRoZSBsZWdhY3kgZHJpdmVyDQp3
aXRob3V0IGRyb3BwaW5nIHN1cHBvcnQgdG8gdGhlc2UgZGV2aWNlcy4NCg0KPiA+ID4gDQo+ID4g
PiBJbiBteSB2aWV3LCBzZXR0aW5nIGEgZmxhZyBkYXRlIHdoZW4gdGhlIGR3YzMtcWNvbS1sZWdh
Y3kuYyB3aWxsIGJlDQo+ID4gPiByZW1vdmVkIHdpbGwgcHJvdmlkZSB1cHN0cmVhbSB1c2VycyBh
IHRyYW5zaXRpb24gcGVyaW9kLCBhdCBhIHZlcnkgbG93DQo+ID4gPiBhZGRpdGlvbmFsIGNvc3Qg
KDkzNCBsaW5lcyBvZiBhbHJlYWR5IHRlc3RlZCBjb2RlKS4gSWYgc29tZW9uZQ0KPiA+ID4gZG93
bnN0cmVhbSBhZnRlciB0aGF0IGZsYWcgZGF0ZSB3YW50cyB0byByZXRhaW4gc3VwcG9ydCBmb3Ig
cWNvbSxkd2MzDQo+ID4gPiB0aGV5IGNhbiBqdXN0IHJldmVydCB0aGUgcmVtb3ZhbCBvZiBkd2Mz
LXFjb20tbGVnYWN5LmMuDQo+ID4gDQo+ID4gVGhlIHNhbWUgY2FuIGJlIHNhaWQgdGhhdCB0aGV5
IGNhbiByZXZlcnQgdGhlIHVwZGF0ZSAob3IgYXBwbHkgZml4ZXMpDQo+ID4gc2hvdWxkIHRoZXkg
Zm91bmQgaXNzdWUgd2l0aCB0aGUgbmV3IGNoYW5nZS4NCj4gPiANCj4gDQo+IFdlJ3JlIGNoYW5n
aW5nIHRoZSBEZXZpY2V0cmVlIGJpbmRpbmcsIHdoaWNoIGdpdmVzIHVzIHR3byBwcm9ibGVtczoN
Cj4gMSkgRGV2aWNldHJlZSBzb3VyY2UgY29kZSBhbmQgRFdDMyBkcml2ZXIgY29kZSBhcmUgbWVy
Z2VkIHRocm91Z2gNCj4gZGlmZmVyZW50IHRyZWVzLg0KPiANCj4gMikgVGhlIGNvbXBpbGVkIERl
dmljZXRyZWUgKC5kdGIpIGFuZCBrZXJuZWwgaW1hZ2UgYXJlIGluIHNvbWUgY2FzZXMNCj4gc2Vw
YXJhdGUgc29mdHdhcmUgZGVsaXZlcmFibGVzLg0KPiANCj4gU28gd2UgYWJzb2x1dGVseSBuZWVk
IHNvbWUgbWlncmF0aW9uIG1lY2hhbmlzbSB0byBub3QganVzdCBicmVhayBVU0IgZm9yDQo+IGV2
ZXJ5b25lIGZvciB0aGUgY29taW5nIDEtMiByZWxlYXNlcyAtIGF0IGxlYXN0Lg0KPiANCj4gVGhh
dCBzYWlkLCB0aGUgIjIgTFRTIiBpcyBjb21wbGV0ZWx5IGFyYml0cmFyeS4gSWYgeW91IHByZWZl
ciB0byBsaW1pdA0KPiB0aGF0LCB3ZSBjYW4gY2VydGFpbmx5IGhhdmUgdGhhdCBkaXNjdXNzaW9u
ISBFLmcuIEkgd291bGRuJ3QgYXJndWUNCj4gYWdhaW5zdCBzZXR0aW5nIHRoZSBmbGFnLWRhdGUg
YnkgdGhlIGVuZCBvZiB0aGlzIHllYXIuDQo+IA0KDQpJIGRvbid0IGtub3cgZW5vdWdoIGFib3V0
IHRoZSB0aW1lbGluZSBzbyBzdWdnZXN0IGEgZGlmZmVyZW50IG51bWJlci4NCg0KPiA+ID4gDQo+
ID4gPiBUaGUgYWx0ZXJuYXRpdmUgaXMgdGhhdCBJIHRyeSB0byBnZXQgdGhlIG1pZ3JhdGlvbiBj
b2RlIHN1Z2dlc3RlZCBpbiB2Mw0KPiA+ID4gdG8gYSBzdGF0ZSB3aGVyZSBpdCBjYW4gYmUgbWVy
Z2VkIChyaWdodCBub3cgaXQncyA2eCBsYXJnZXIpIGFuZCB0aGVuDQo+ID4gPiBrZWVwIGludmVz
dGluZyBpbmRlZmluaXRlbHkgaW4gbWFraW5nIHN1cmUgaXQncyBub3QgYml0LXJvdHRpbmcNCj4g
PiA+IChhbHRob3VnaCBSb2IgSGVycmluZyBkaWQgcmVxdWVzdCBhIGZsYWcgZGF0ZSBvZiB0aGUg
bWlncmF0aW9uIGNvZGUgaW4NCj4gPiA+IHYzIGFzIHdlbGwuLi4pLg0KPiA+ID4gDQo+ID4gDQo+
ID4gQWxsIHRoYXQgc2FpZCwgaWYgeW91IGJlbGlldmUgdGhhdCB0aGlzIHRyYW5zaXRpb24gd2ls
bCBiZSBxdWl0ZQ0KPiA+IGRpc3J1cHRpdmUgd2l0aG91dCBwcmVzZXJ2aW5nIHRoZSBsZWdhY3kg
ZHJpdmVyL2R0cywgdGhlbiB3ZSB3aWxsIGRvIHNvLg0KPiA+IA0KPiANCj4gV2UgYWJzb2x1dGVs
eSBuZWVkIGEgdHJhbnNpdGlvbiBwZXJpb2QsIHBlciBhYm92ZSByZWFzb25zLiBUaGUgbGVuZ3Ro
IG9mDQo+IGl0IGlzIGFuIG9wZW4gcXVlc3Rpb24uDQoNCk9rLCBidXQgYmVmb3JlIHdlIG1lcmdl
IHRoZSBuZXcgZHJpdmVyLCBkbyB3ZSBoYXZlIGFueSBwbGFuIHRvIHN1cHBvcnQNCmRldmljZXMg
dGhhdCB1c2UgZXh0Y29uIGluIHRoZSBuZXcgZHJpdmVyPw0KDQooQXBvbG9naWVzIGlmIEkgaGFk
IG1pc3NlZCB0aGlzIGRpc2N1c3Npb24gcHJpb3IuKQ0KDQo+IA0KPiA+IENhbiBJIHJlcXVlc3Qg
dGhhdCB5b3UgbWFrZSB0aGlzIHNuYXBzaG90IGFzIG9uZSBvZiB0aGUgZmlyc3QgcGF0Y2hlcyBp
bg0KPiA+IHRoZSBzZXJpZXMgc28gcmV2ZXJ0cy9naXQtYmxhbWVzIGNhbiBlYXNpbHkgYmUgdHJh
Y2VkPw0KPiA+IA0KPiANCj4gQWJzb2x1dGVseS4NCg0KVGhhbmtzLg0KDQo+IA0KPiA+IEJSLA0K
PiA+IFRoaW5oDQo+ID4gDQo+ID4gU2lkZSBxdWVzdGlvbjogZm9yIFNuYXBkcmFnb24gbGFwdG9w
cywgd2l0aG91dCB0aGUgY29ycmVzcG9uZGluZyBrZXJuZWwNCj4gPiBhbmQgRFRTIHVwZGF0ZXMs
IGRvbid0IHRoaW5ncyBicmVhayBlYXNpbHk/DQo+IA0KPiBJdCBjZXJ0YWlubHkgaGFwcGVucywg
YnV0IG1haW50YWluaW5nIGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5IGlzDQo+IHNvbWV0aGluZyB3
ZSdyZSBzdHJpdmluZyBmb3IuIEFzIHRoZSBEZXZpY2V0cmVlIGJpbmRpbmdzIG1hdHVyZSwgdGhl
DQo+IGVhc2llciB0aGlzIGlzIHRob3VnaC4NCj4gDQo+IE9uZSBleGFtcGxlIHdoZXJlIHRoaXMg
aXMgYSBwcm9ibGVtIHdpbGwgYmUgY2xlYXIgaGVyZSwgdGhhdCB1c2Vycw0KPiBhdHRlbXB0aW5n
IHRvIGJvb3QgdG9kYXkncyBrZXJuZWwgd2l0aCB0b21vcnJvd3MgRGV2aWNldHJlZSBibG9icyB3
aWxsDQo+IG5vdCBnZXQgVVNCIC0gYmVjYXVzZSB0b2RheSdzIGtlcm5lbCBkb2Vzbid0IGtub3cg
aG93IHRvIG1ha2Ugb2YgdGhlDQo+IGluZm9ybWF0aW9uIGluIHRoYXQgZGVzY3JpcHRpb24uDQo+
IA0KPiBUaGlzIGlzIHRydWUgZm9yIGFueSBoYXJkd2FyZSBvciBmaXJtd2FyZSBpbnRlcmZhY2Ug
dGhvdWdoLCBzbyB0aGVyZSdzDQo+IG9ubHkgc28gbXVjaCBvbmUgY2FuIGRvIGFib3V0IHRoYXQg
KGFuZCB3aGF0ZXZlciB0aGF0IGlzLCB3ZSdyZSB0cnlpbmcNCj4gdG8gZG8gLSBmb3IgdGhlIHNh
a2Ugb2YgdXNlciBmcmllbmRsaW5lc3MpLg0KPiANCg0KUmlnaHQsIGZvciB0aG9zZSB0aGF0IG1p
Z3JhdGUgdGhlIERUUyBhbmQga2VybmVsIHNlcGFyYXRlbHksIGJyZWFrYWdlDQpzaG91bGQgbm90
IGNvbWUgYXMgYSBzdXJwcmlzZS4gQXMgeW91IHNhaWQsIHRoZXJlJ3Mgb25seSBzbyBtdWNoIHdl
IGNhbg0KZG8uIEkgd291bGQgZXhwZWN0IGZvciB0aGVtIHRvIGFsc28gaGF2ZSBjZXJ0YWluIHBy
b3RvY29sIHRvIGhhbmRsZSB0aGlzDQp3aGVuIGl0IGhhcHBlbnMuDQoNCkJSLA0KVGhpbmg=

