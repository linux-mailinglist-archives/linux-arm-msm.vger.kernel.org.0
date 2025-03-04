Return-Path: <linux-arm-msm+bounces-50091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8840A4D04A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 01:44:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9169A1894BF4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 00:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9B418C900;
	Tue,  4 Mar 2025 00:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="qmkzIcok";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Tmy5bAN3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UHyAVEZn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A7478F2B;
	Tue,  4 Mar 2025 00:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741048782; cv=fail; b=sKrZYccUVRmenJ6Vv48Rw9VTkbHf89l7IZdM5R0obImcFeaiL7oskcWLVzqrjf1TPUkbE1T0J292T2jJXZ0jftPWeIlA8qmQBfex8NYEtlx5wnUFa6HR+IlL78Dsez7eUztXu4XCuLTZ2zNDcNFFoWAndWZ1Rwd51UQfNgUXlDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741048782; c=relaxed/simple;
	bh=tt0ZtFv3Tvina083VCMN0hUXoTrrksVMC4jf6wXwnX0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HfIs3cRQYhXwU0LM+xJPunnJLqYd2o9zMXFO5Ck/TBZafBa51C6ZKWd6GdLflsLnT82OZUGjr9kBaKjVzZnmRD1EgEYMSKAP92dtBEpUmEuSQrSXDHwWv+X4kpyUZ9j6G4ZoKtNC8zwz8tm+FD0evIhUiTvA6HDGIYRrgffAqw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=qmkzIcok; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Tmy5bAN3; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=UHyAVEZn reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523K8roG030681;
	Mon, 3 Mar 2025 16:39:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=tt0ZtFv3Tvina083VCMN0hUXoTrrksVMC4jf6wXwnX0=; b=
	qmkzIcokD0vKSBk0aNdXj/bm0dsz0FuQoXwK2E5pNtVP9pcz67ZjfjQ0Kq5WfkT+
	H4ZoqxjzwrgsngUuK9U61BPCRiQ/teyzJmyces4UeZcjq3rv1aPHMozxkRi51d7v
	iw60XZkAxZB5O5PMV4VWUik7u8Ask/NT8UR5xTWieXELm6+JO4EL7ArZmLEo44Bq
	bI58yV9KAX0JInFLHORsrbxGeZgP6uAXOyoXEI+GyMD1RG6pGR+5Oik97+5mXF7N
	jprkrflCJcaOzve+afO/EknCdTih59Lt1HVHH0oyEOVxxjpJ5wfXS+PFuBKY992n
	6uHGlZHq8JLyLu/0WnbKjQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4542cbbhy0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 16:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1741048757; bh=tt0ZtFv3Tvina083VCMN0hUXoTrrksVMC4jf6wXwnX0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Tmy5bAN3vJkvMlGrg7KrE8W0tiDRptM4Jnbi7e58bCf15Df7S0xWHiy7QiwngHjI5
	 Ih01QvPH6UxAl/u3+vf3ZUP1UyaRN+kzS+k8PRxC35QGJso0jXyX7KVbbFR8DV/GEZ
	 TmhOu6pQOESPilj4JlbEz6T4XoDg86Sjp8RNpbzMimTZwnZjj95p5ioR7Cw2DCFz91
	 le5KkAGLXTYwqPp4eI2Soa1ANjMD866zVyH0FvQ3Kg8xcX1P6KqO+Qn1ECE3p+qKST
	 ue5TdmFRo593P2S0Z1v0t8DQQ7xDvTvXI+V6T/sPhTRhZ7kNxNDVyU5RbL2DT02M4S
	 BjDge42OuJDhQ==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6DB1D40226;
	Tue,  4 Mar 2025 00:39:17 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 77A74A00F5;
	Tue,  4 Mar 2025 00:39:16 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=UHyAVEZn;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A2CB840110;
	Tue,  4 Mar 2025 00:39:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lgJLheLScks0fXoapRaN/TQUXiIKYzTMTmbYvhUh01r+oMzy7PmKk78Xje8yFPtSna6hspTEb2lEN4uGKZC0zryc2+az1jM2DDGNzq4i0TLqcaTrnJwlpXBHdFkd3RvTbaBFkGn8vYzYbnsSOP0rf2piXRz6hw2oQKm8CVCk2Uj9SdwySHrPn33Y9vIhnJv++Tpqu7MzMOPJ2l0uoyVh8gcCw4fz6BWwFNrtWy/8R8kAfEtJQqBwIAo1UaXxpHyd9IBXTDYolRGdzW+hGE3Ym7nM5VqCjcqz1SIzP/3NJz6GjyY+WhYvB1fAVBeBsOE3CTL/FkjLWGS8vnirGzbXRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tt0ZtFv3Tvina083VCMN0hUXoTrrksVMC4jf6wXwnX0=;
 b=SvwW9+klx+ht9Yk3Ds0BG7K4tRDTjqVj4qCLit9euOGsH7t69ern+GWS1MtQVE3KNaB19Q5Pf1nvpEu1R9yfnuOh5ym41QEN+G31Wy1/syk21MnR9x0jSStIrjqQUbzsP9ML+F6ygUcTnSh2S9WFrMGucKMQk65Vs7GaamLDNce49B+4zti3n+PJadEmTQVXCoJfIHTJfB5N+Xk77rThESAjlaq/9cC7VXwC/DH8EcUzuZoFfewjn3hI3tIgdKUGbsoIAXOePtUhzFr8FTGOIKmdVDXR58xJoSNhiTJWghN7o76HJTE2UFHFuBh8sTaVO/OuLfMxoC+3Fxvq7ncxWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tt0ZtFv3Tvina083VCMN0hUXoTrrksVMC4jf6wXwnX0=;
 b=UHyAVEZnaMHcxWIPbJrtRaGYcPNDt7I8i7a4bFzLe1SQSz1na01aSEebyJVQMVfLsIe5X8N3KEGtTfdB63uqaON/5hZoyTG7bObSnIszcz6x99WEpZiO7lITpdezLgm+fpbdTf+268ThADS5JmHkpc1JYyRgSvnfZr0v6rmbWQM=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ2PR12MB8183.namprd12.prod.outlook.com (2603:10b6:a03:4f4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Tue, 4 Mar
 2025 00:39:12 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 00:39:12 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>,
        Saravana Kannan <saravanak@google.com>,
        Philipp
 Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 5/7] usb: dwc3: qcom: Snapshot driver for backwards
 compatibilty
Thread-Topic: [PATCH v4 5/7] usb: dwc3: qcom: Snapshot driver for backwards
 compatibilty
Thread-Index: AQHbiKw5KJl/2rSglECIEFO5G8n187NiIOyAgAAJb4A=
Date: Tue, 4 Mar 2025 00:39:12 +0000
Message-ID: <20250304003913.bsn5sucnofq6d6jo@synopsys.com>
References: <20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com>
 <20250226-dwc3-refactor-v4-5-4415e7111e49@oss.qualcomm.com>
 <20250304000527.ybxfdjx5xzypcals@synopsys.com>
In-Reply-To: <20250304000527.ybxfdjx5xzypcals@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ2PR12MB8183:EE_
x-ms-office365-filtering-correlation-id: 221b59f4-0010-423f-e1e6-08dd5ab4fbd7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ckE1ZENtQWVmbm9VaUpQY3puU1MrNE9vZS9PK2hNd2dqY0JxTFVvYlBRd1Zv?=
 =?utf-8?B?N2xxcmF3a3FKdGRqQ2JjK0JMWnVFR0hVVWN3R3o0d0NSeitHQVNvNjRqN0l0?=
 =?utf-8?B?Sm12Szh2M2pxU3ZQaHFnYjBLVFRlclo4SW5JRVo2bG11T3dMQlNKL1hRSHpH?=
 =?utf-8?B?Wk51TDhnYkxOYk4yZlJJWXYxQUFjdmR1ZXNsbUsvUCt4Ty82U3BpaklvaWtT?=
 =?utf-8?B?czNsZDdzTGFwKzhhMUpCRFNjZGVNVEo5cUNkOTRuTXpnbVVGWkRYc3l0dm0y?=
 =?utf-8?B?RU12N3FVZWYwTXBlOVpVNFFXWVhiR1NYc095aDFEdjE5RS9GT3FWUktzZ3N0?=
 =?utf-8?B?QXh2blBqb3NmWUZQRUpkV2J0d1VpVGtvNVhCeFpKRlorc2Jac05RakZnRWxI?=
 =?utf-8?B?STk0eW40eG9DaTZIbTRNL2U2VVEzN1RDWHN0ZzFmVTFsZjVMTGNySnBoclpU?=
 =?utf-8?B?eVFQVmVveERVQlA2cWI4M3VvTDBGNEYyRHM4SkpTS2pldXJaMjlFK3dpSERG?=
 =?utf-8?B?V3FXVklOcDVqdTd2MHUySnZUOTFKdmRkZmtOWnZIQUlhNlU5bSt4NC9NcENK?=
 =?utf-8?B?SGpIMExyZURqS3VmdlZGQWNNTk5sTzZ6ZVkybHlsbXRJN2Z0TXZlVi9FVVB0?=
 =?utf-8?B?RTdjQVMzL0JoNnN1S1RBN2RTQXdQN2IxTCtaL2lkckRSRDNWOEpnRnNCTFlu?=
 =?utf-8?B?OG9RNVdLQUhKYmVlVm03c1JQejN4d3JMeWtvL0V5UXFCMVFTM2RKZGQvTUVS?=
 =?utf-8?B?QmYxYkQrSm5hNTU4dDFqd2d1dVFUYTZKc0tiZU1tRXEyb2dsS2NSYUVoaXpS?=
 =?utf-8?B?NU5OTmF6VnMwWjhkZHB4VVNOVzdCeXlqWkRIWWxUUzlQRjVjMUVKVDA5QUZR?=
 =?utf-8?B?SENDNmdoRUhpeWRTRHRpM3QrbTg0SUZGUERpMFc5TWJXT3ZuNU5YZGhzN3hD?=
 =?utf-8?B?UGMyNzh1b3EzK2RDV1pVT3hTamVqVE1zT3h4ZnJwdkZEU1R1RHlkNHlHMFA2?=
 =?utf-8?B?eUtiSUUxL2FDYURuNXA5dzdGQm0xYjN5a2V4SVBIZi9ZNitQN3B2UHJ5ZHRG?=
 =?utf-8?B?OXZucXNYNWtjczRnZlhWR2h3WGNsUHNYanV6bVoyVFlrVFhkMXU5b05tQXNh?=
 =?utf-8?B?WC9jYWR0dmplWUEvUk1VV25ia21RRlhIYnkwamRlNmJhVXNGeVlabTZMVVo2?=
 =?utf-8?B?Wnh5YWJIOFFlaVhzRUpjK1hjRnZiUUVwd2ZNY09DQy9OandNcmt1dE9jcnNn?=
 =?utf-8?B?anpJWTVmbFpyaWNWbVB5YloxKzQzTEVxbkVQVU9zU1lqRDVXR0tHcFZlR0Uy?=
 =?utf-8?B?dEU3WHpjOU1ZWElZbytDcGVBcEtSaU9WMU1VdmRGWWJZWWg3V2xBMWREM3Vj?=
 =?utf-8?B?cEtKZFpzT2NoRWdlajc2T0hmMm0rZ1BnTjBIUURCTkNyUVptb09jYTJTbWZj?=
 =?utf-8?B?NFdycnROTXVVMXhzVWZkQ0lwUzJnSDcreHFWL0U2anVsY2FsTCtJN0E1WW1X?=
 =?utf-8?B?cDJ5dVNoWE8xQzk3a1VRbjZwSUZJTS8xc2V5TlNxWVNWbWMrcmZZZ1gxUk04?=
 =?utf-8?B?d1czSmEyaTdlakdoWGxBNVVlUmNwTytiM0NhR1llY00yMkpzSk9zRHRxQ05t?=
 =?utf-8?B?aFF3a2NybGlRLzVmTlRWRFI3WFF4WVV1cDV4Ky9uTDlKdEZmSDIzajVaTGNo?=
 =?utf-8?B?R0FJbXAyTTlTbytQUzFScUJRSHdDdDdrdUhJWk1zbENMa2RiMURDRDZZd0Jl?=
 =?utf-8?B?aHlIYUJGNDQzTWNSOGRRNWV5bzNVV3R4RHlBcm50VEpKYmNiUzdzcmFtWVA3?=
 =?utf-8?B?d3VHSGV2WFhQcmlCQnRYWlJDaWRneENER0xwNG9jWFFtbUQ0WEI1V25US0Vp?=
 =?utf-8?B?VzMraDZ0ZDFTNVVpNFFiaWI0MTNrMHIxdXZVSjkyQ1pIekx3MUZoWnVMUUlM?=
 =?utf-8?Q?zNXRECeNmNjNVJtWJpllaYN8Xc+BYrA3?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U2RlTGIvTkFpWWFtTEsyNFRNQlNVV3RDaDlUQStIdXE3NjBWakxlUi81SUJX?=
 =?utf-8?B?VFl0Z0RIOVZKT2ZXL3IrNnpiODQ3TGh3czRRcTVreFRtZDlQREloMWphWTJw?=
 =?utf-8?B?NUtJeitZSEZwRXNSWnVEZ2xxWG5wanErVVAvSGlTMmVoTkFPQWorL2RXNEJD?=
 =?utf-8?B?WWVabGJ1dWY2L2lrekE5NUdFc2QyQzFGZHIyY3BrYXJoeUtqSkNMVEg0Tk1H?=
 =?utf-8?B?aDB3K2trVVFKcThqMmhBdWlUMkdVaXYvMms4RjdtbjVqMXJBZVRzaWw0aUZL?=
 =?utf-8?B?bUsyQ1ZVaTcwVmlkNlpjRDhBRVh4bHk3VGhwRDVWZUVpMHRpOFJSa2JtVEV0?=
 =?utf-8?B?V3YwUjBKOFN2NHRRMkFhYk11LzYwdXpNOWROWmtNOE5zRS9FVHh4OU9FemF0?=
 =?utf-8?B?Rk5IRy9kdjdDR3I1cEU0VS9iOWNxV2taQ3VhZVB2UThDZVdLQjc1R2UxdEtR?=
 =?utf-8?B?QzF6bHpMaTdSNFp2V0JQUHFwVkhIWHBUQnJsTkNlZ2dkSGxaQnlla2xIb2ZU?=
 =?utf-8?B?SHBIdzM0UDZtYVBqOFpKWkJVZ0I0SFRhc3JkaGJqMWd3TkVKallnYS9xTmVo?=
 =?utf-8?B?VUxKaHo1OWVpVVhlaGZ3WHpncGRkcDhHeC9sc0J5WHpiNkx6dFpNeXMyZWVz?=
 =?utf-8?B?QjVsOG03MkFpVUJZeWpyaHhUYTRKUzZkL3Vvalg5bXY3VmtuMWtmb0lGTkFo?=
 =?utf-8?B?ZFh2NkVzOURJNmNyWTZtMnJ5Mk05c0VHdWhBNUk0a1N5dWtUUGhnK2pxYk1x?=
 =?utf-8?B?dGpnVkpybGlTa2RkSUJrdzU5VGVjdXdvUTRGRjlBd2lrSGxnRkJ2RU1OaGsv?=
 =?utf-8?B?SzBHd0REWEpwT2cwOEVldVduem5jN2orbzU3MHNvTklnWmRIZGJZYlZUcVM5?=
 =?utf-8?B?a2YrdVdQaWJxdGJ4YUZnTWJoNEFGNlhkQTVGYU9KVTk4Vm5KM0M4S1J0VFN5?=
 =?utf-8?B?MzdMUDFjWm4zY2JlTWFxVWVLWUhpdHEwSTVVV1EwRUUrTUE3WjZQRVlPa0pw?=
 =?utf-8?B?eGZpY05hZWI3cncxL0RuWXNBQ2hKbHZSQnBSTXVPWmduMy9RNm01N2lKek1G?=
 =?utf-8?B?K0hDZ0h3RmxhdzRDQXNmWE5XTU5OVng4eFpGVTJ5MmREM2RnRnJJS013ZE1I?=
 =?utf-8?B?NENzd3p2UldFNmNXeWVXT05mZjB5R3ZZSkE2a1FCTlNvVFFTMGxhbDJOcThw?=
 =?utf-8?B?VEhhTGttb2pVVWQyTW5BUk8rdENvc3R4QVZibG5zNDFzUTA0Vzk0SnBzWmNX?=
 =?utf-8?B?MXBIM284WUk0YmFnSkxmLyt6cVFxTXNKdDlpdGtYU0M1WW5ZcEU4d1Z2dXFR?=
 =?utf-8?B?enRJK2djRjE0dHJQUVhQSEorUG1GMzd3RTUrYWRIZVdtcVdXT2Y0U2xManF3?=
 =?utf-8?B?T2lqREVtOUtWcFdQdHdxS20wKzZJZmFvU1paMVZPMnBoeEJSNnprWUFCcXVy?=
 =?utf-8?B?Zy9rZ2k5b1VsNlNON0xualJTYkZyWjFodW1jZXNKMW0rSVkxQ1ZYc3o0MnVM?=
 =?utf-8?B?dHNyNkJwQTl1eEpvSmVpRVJodWliSU9kckZhMFlxRDNDOVl6cEFmZHM5ZElh?=
 =?utf-8?B?eVpWeEp6VXRDM2FJeUM4VlFmN2w3dlpTNFkxVGlteGFJY1NqTUswS0dVSUNj?=
 =?utf-8?B?VWl6SG55THY3bVh5Nkpwb291VDFOU3VTU1lxTTJweERVcEhyUzJrSzByTzFY?=
 =?utf-8?B?Z3ZGRUNrQzY5UTRBbTVCUGsrWmIzejlGZktkMmREK2ZJaGR2VStmM24rMVN6?=
 =?utf-8?B?UVB0d1ExWTdidnM0TElqcVRwT2xmRGt2Qk1TZkhFa3lBZzdCWks2OG5OMTJz?=
 =?utf-8?B?OHRaQjNqRVphYUNhV0p1aFpwQWdPRVBnU2R0dTdUYVBMTXpoNmp4WnZ5UHJ5?=
 =?utf-8?B?a3ppbWNuSkpqbFR1NXpyQkJSUk4wSUFlejBINEVtbjg0K0xwRlNJMnZHcDQx?=
 =?utf-8?B?NG5yNSszdGhQWjhzc1lWNjVod2MwaU9SVk1JOFpVSEN5OXlQdXlqVmdsTmVV?=
 =?utf-8?B?cmkxRWlZckJuZlR1YTJoNjV6R0NYQnBzWjk3ZFJYSy9WejNDaFFIeFBzQ0Nh?=
 =?utf-8?B?TS9tSjFVZkRtaERzSEpaZTlqYmVVNkV0c2h1azdSa2ZOUng4OEtVR0VralhX?=
 =?utf-8?Q?INmNlIWHInuv0VsfGcg/LuJR2?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B089E059ADA23F42A02DB5CD54D03A09@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vIS18vvlMF4NrpRWkEZRdTRFUDmiAgEvTItl+pxKPuvQzZjFye4K3mMyHwgv+edm42Bf22+S3Se+9YWjY7Op++s/P8+yHmiWxD6aoMqpc7ro8mVHN+OLze0sL3mruUva5NfPogUPlGn1TEOQnyEEkl9Fb9cWa+HG551MYWCwm+mvQ9n7eY0hlBtExg/2b6MDxOEl2MLyvsROg7nechjrNZp2L1KP9v9P8pCvmGIl6Ma+cUs84rpj+AR1k/JglNN0A/miKO7XVH3NjGXndQdGRKUtjbMLilc1yGYsJAjP4o4febU0jfkpiWRKII6jSvz9fKfEKJKgHrM+5nwrkefEnR33+zLUo1BJvWAZ8b2xPe/HGsNhfM3QacTh7p5Oamv6TR2M0HMb2u0IyvX0yhuTRN9/qORsmgu1M1/57Vd4IFv7sAz+XjPvBfVC+cLvPotsluvvn1LZhQ8LoWkL2FcfF3Zv9hc1I5vp3xuCpGQz0OyUpyH+gBNX/Kbv32Zn+z5MPOXs/3HtHWGwBKIIudqcvls0NxJAJtegGNQ6d2Gb8JlKa4Jzn2eZ2gcxS4itKsyj+vLZcqIaPYZKiBU4wRQKHJJU9xHgLvalsRUrlGZIs7+q2va6BmUP3NYx5h1Kdkc/HXznOV8V+0IJU88A2xg1Uw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 221b59f4-0010-423f-e1e6-08dd5ab4fbd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2025 00:39:12.2147
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rxCF+yeVaPJ/+3eKqkQcikNpMUp6u/eOwrR0wukAaqz3AgHBdjai59VdeA7WevILzva2kYhm/TLgNOkVQKv8UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8183
X-Proofpoint-ORIG-GUID: mxu89xa_ie8wlhkD9tPKHNDPaI5aZzCH
X-Proofpoint-GUID: mxu89xa_ie8wlhkD9tPKHNDPaI5aZzCH
X-Authority-Analysis: v=2.4 cv=YeJH5xRf c=1 sm=1 tr=0 ts=67c64bb6 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=qPHU084jO2kA:10 a=EUspDBNiAAAA:8 a=ffwIhCDrODrBsOJKMLMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_11,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 phishscore=0
 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0 classifier=spam
 authscore=0 authtc=n/a authcc= route=outbound adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2503040003

T24gVHVlLCBNYXIgMDQsIDIwMjUsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gT24gV2VkLCBGZWIg
MjYsIDIwMjUsIEJqb3JuIEFuZGVyc3NvbiB3cm90ZToNCj4gPiBJbiBvcmRlciB0byBtb3JlIHRp
Z2h0bHkgaW50ZWdyYXRlIHRoZSBRdWFsY29tbSBnbHVlIGRyaXZlciB3aXRoIHRoZQ0KPiA+IGR3
YzMgY29yZSB0aGUgZHJpdmVyIGlzIHJlZGVzaWduZWQgdG8gYXZvaWQgc3BsaXR0aW5nIHRoZSBp
bXBsZW1lbnRhdGlvbg0KPiA+IHVzaW5nIHRoZSBkcml2ZXIgbW9kZWwuIEJ1dCBkdWUgdG8gdGhl
IHN0cm9uZyBjb3VwbGluZyB0byB0aGUgRGV2aWNldHJlZQ0KPiA+IGJpbmRpbmcgbmVlZHMgdG8g
YmUgdXBkYXRlZCBhcyB3ZWxsLg0KPiA+IA0KPiA+IFZhcmlvdXMgd2F5cyB0byBwcm92aWRlIGJh
Y2t3YXJkcyBjb21wYXRpYmlsaXR5IHdpdGggZXhpc3RpbmcgRGV2aWNldHJlZQ0KPiA+IGJsb2Jz
IGhhcyBiZWVuIGV4cGxvcmVkLCBidXQgbWlncmF0aW5nIHRoZSBEZXZpY2V0cmVlIGluZm9ybWF0
aW9uDQo+ID4gYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGJpbmRpbmcgaXMgbm9uLXRyaXZp
YWwuDQo+ID4gDQo+ID4gRm9yIHRoZSB2YXN0IG1ham9yaXR5IG9mIGJvYXJkcyBvdXQgdGhlcmUs
IHRoZSBrZXJuZWwgYW5kIERldmljZXRyZWUgYXJlDQo+ID4gZ2VuZXJhdGVkIGFuZCBoYW5kbGVk
IHRvZ2V0aGVyLCB3aGljaCBpbiBwcmFjdGljZSBtZWFucyB0aGF0IGJhY2t3YXJkcw0KPiA+IGNv
bXBhdGliaWxpdHkgbmVlZHMgdG8gYmUgbWFuYWdlZCBhY3Jvc3MgYWJvdXQgMSBrZXJuZWwgcmVs
ZWFzZS4NCj4gPiANCj4gPiBGb3Igc29tZSB0aG91Z2gsIHN1Y2ggYXMgdGhlIHZhcmlvdXMgU25h
cGRyYWdvbiBsYXB0b3BzLCB0aGUgRGV2aWNldHJlZQ0KPiA+IGJsb2JzIGxpdmUgYSBsaWZlIHNl
cGFyYXRlIG9mIHRoZSBrZXJuZWwuIEluIGVhY2ggb25lIG9mIHRoZXNlLCB3aXRoIHRoZQ0KPiA+
IGNvbnRpbnVlZCBleHRlbnNpb24gb2YgbmV3IGZlYXR1cmVzLCBpdCdzIHJlY29tbWVuZGVkIHRo
YXQgdXNlcnMgd291bGQNCj4gPiB1cGdyYWRlIHRoZWlyIERldmljZXRyZWUgc29tZXdoYXQgZnJl
cXVlbnRseS4NCj4gPiANCj4gPiBXaXRoIHRoaXMgaW4gbWluZCwgc2ltcGx5IGNhcnJ5aW5nIGEg
c25hcHNob3QvY29weSBvZiB0aGUgY3VycmVudCBkcml2ZXINCj4gPiBpcyBzaW1wbGVyIHRoYW4g
Y3JlYXRpbmcgYW5kIG1haW50YWluaW5nIHRoZSBtaWdyYXRpb24gY29kZS4NCj4gPiANCj4gPiBU
aGUgZHJpdmVyIGlzIGtlcHQgdW5kZXIgdGhlIHNhbWUgS2NvbmZpZyBvcHRpb24sIHRvIGVuc3Vy
ZSB0aGF0IExpbnV4DQo+ID4gZGlzdHJpYnV0aW9ucyBkb2Vzbid0IGRyb3AgVVNCIHN1cHBvcnQg
b24gdGhlc2UgcGxhdGZvcm1zLg0KPiA+IA0KPiA+IFRoZSBkcml2ZXIsIHdoaWNoIGlzIGdvaW5n
IHRvIGJlIHJlZmFjdG9yZWQgdG8gaGFuZGxlIHRoZSBuZXdseQ0KPiA+IGludHJvZHVjZWQgcWNv
bSxzbnBzLWR3YzMgY29tcGF0aWJsZSwgaXMgdXBkYXRlZCB0byB0ZW1wb3JhcmlseSBub3QNCj4g
PiBtYXRjaCBhZ2FpbnN0IGFueSBjb21wYXRpYmxlLg0KPiA+IA0KPiA+IFRoaXMgZHJpdmVyIHNo
b3VsZCBiZSByZW1vdmVkIGFmdGVyIDIgTFRTIHJlbGVhc2VzLg0KPiA+IA0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEJqb3JuIEFuZGVyc3NvbiA8Ympvcm4uYW5kZXJzc29uQG9zcy5xdWFsY29tbS5jb20+
DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvdXNiL2R3YzMvTWFrZWZpbGUgICAgICAgICAgIHwgICAx
ICsNCj4gPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20tbGVnYWN5LmMgfCA5MzQgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIGRyaXZlcnMvdXNiL2R3YzMvZHdj
My1xY29tLmMgICAgICAgIHwgICAxIC0NCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA5MzUgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiANCj4gVGhpcyBpcyBhIGJpdCBjb25jZXJu
aW5nIGlmIHRoZXJlJ3Mgbm8gbWF0Y2hpbmcgY29tcGF0aWJsZSBzdHJpbmcuIGllLg0KPiB3ZSBk
b24ndCBoYXZlIHVzZXIgZm9yIHRoZSBuZXcgZHJpdmVyIHdpdGhvdXQgZG93bnN0cmVhbSBkZXBl
bmRlbmNpZXMNCj4gKG9yIHNvbWUgd29ya2Fyb3VuZCBpbiB0aGUgZHJpdmVyIGJpbmRpbmcpLg0K
DQpJZ25vcmUgdGhlIGNvbW1lbnQgYWJvdmUsIEkgbWlzc2VkIHRoZSAidGVtcG9yYXJpbHkiIGlu
IHlvdXIgbG9nDQphYm92ZS4gSG93ZXZlciwgdGhlIGNvbW1lbnQgYmVsb3cgc3RpbGwgc3RhbmRz
Lg0KDQo+IA0KPiBXaGlsZSBJIHVuZGVyc3RhbmQgdGhlIGludGVudGlvbiwgSSdtIGFmcmFpZCB3
ZSBtYXkgaGF2ZSB0byBzdXBwb3J0IGFuZA0KPiBtYWludGFpbiB0aGlzIG11Y2ggbG9uZ2VyIHRo
YW4gdGhlIHByb3Bvc2VkIDIgTFRTIHJlbGVhc2VzIChhcyBzZWVuIHdpdGgNCj4gYW55dGhpbmcg
dGFnZ2VkIHdpdGggImxlZ2FjeSIgaW4gdGhlIHVwc3RyZWFtIGtlcm5lbCkuIElmIHBvc3NpYmxl
LCBJJ2QNCj4gcHJlZmVyIHRoZSBjb21wbGljYXRpb25zIG9mIG1haW50ZW5hbmNlIG9mIHRoZSBt
aWdyYXRpb24gY29kZSBiZSBoYW5kbGVkDQo+IGRvd25zdHJlYW0uDQo+IA0KDQpUaGFua3MsDQpU
aGluaA==

