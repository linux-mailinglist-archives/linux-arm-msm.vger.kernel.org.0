Return-Path: <linux-arm-msm+bounces-51078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB5EA5D36D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 01:00:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 159EF3ABF87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 23:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D35D5235368;
	Wed, 12 Mar 2025 00:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LiOIqWnn";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SF6zFsJA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hMvrB8Ef"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13264225764;
	Tue, 11 Mar 2025 23:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741737601; cv=fail; b=nJsCoPGfyvDPmMO2YJiuFh3edceduK39uq1CR4LLOQGFsgqXSlnS22biKWdrHCTFAJYmRDYQNaeOWG53U/Vhn3Or/I4Mi3izW952ecHny8rUUu6jqP1khX/cqNlcImvm7n/uC5ubg/axOiD8ifsuuK3NbtDc0Fe+F1/fLWN17Tg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741737601; c=relaxed/simple;
	bh=GuyqTjMU0lHlzQhUYvl6VE9+Emv3K+GLwDKr3g9JnOY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XtzlxHJEUOekPFhcxrDXCGzjR52Xdy90oKs/vlpnSEkH2ye5Kgh74WtApaELxi+510oe/9btjDdDCYCKeQt014fm1gmEHawiPXRHqQHM0TqxD77t3iAnKkQFNf4TESRt8IPVNq2DUQwaPZ9QCm6kDzqBK0Bb6BPzXgiwykpCDTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=LiOIqWnn; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=SF6zFsJA; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=hMvrB8Ef reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BJBWgP011183;
	Tue, 11 Mar 2025 16:59:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=GuyqTjMU0lHlzQhUYvl6VE9+Emv3K+GLwDKr3g9JnOY=; b=
	LiOIqWnnpXQul0cDMSfWBdLZ7hs88PGQ3hzrlOynJISVc3CqlAtqoDCdcELx8D9p
	0DZXuTqKFK2R7jikq3DNN174kQdAPOi5f7ryOYux1OJfwZtDSH5zaQMq6m7Suxe7
	j620C4Flw0oshFnrGaqocQ0+Rh24/LY6ydBwrXPtay29YxobnUgnTIpdM2UpAaD9
	5nTEXX2zrUAu1YtH7lvIim5SaFCLHBjE2L6uthVXr8sQHmIA+JNYRv8+vO+jc4dL
	t8rudcAoM2neZV7Os0ojxSngU6w3xkko2QgGxdI5o5bUaSN1fCuuPwPofw9KmIcY
	CofSSj/Rbxb49TXNer11Zw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 45au469d93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 16:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1741737569; bh=GuyqTjMU0lHlzQhUYvl6VE9+Emv3K+GLwDKr3g9JnOY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=SF6zFsJAlw3QsYkRHUrgJ5CjIXb7s+EQyeKeJGecEsxfPhq8KJhpC1nANm+BofswE
	 HLTqLMtRtpqcFUhZl27Dt1xX1UrL8idDFmRAMJZrJ1JqDhMDaOOKjenSqj1RQq24US
	 kzd249lU8Rf4zGDtjsK06J1iuO7qXwkXy1QWQP0itQhVT1HCwqG+g1OoIEgapoz+dn
	 aoVApCpBeP9rmoMVgmBBNoqYT+rVV1rpi8IrI6zOe4cy7GzzF1mOTTVZvfBwBXzjtf
	 1vN8ZeRrQijYoE2NJM4yVYSHpOlyNMNf8WT3VzS4xBIPrxIuIrEvhegh+EARwuX0Mc
	 nmWPwzTUU18ug==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BEAE14056C;
	Tue, 11 Mar 2025 23:59:28 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id A9B8DA0278;
	Tue, 11 Mar 2025 23:59:27 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=hMvrB8Ef;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4F08340149;
	Tue, 11 Mar 2025 23:59:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQPK857HfY9pn8QET8H36a09GDBZ6XHmFeclskipXvA6QmO2PGVB4F0r95GOi/PVM0LkSNCciJTLQzCkBW/3cw5nepncRKIGIF0MeHjXs2/kT4JeeXf6CjY2+KaqHztpNJ91Nl6np6mHavFElaaQzLRN7SrKCVjeILk13ONWMfZsG+XrAy6cu7MVQLpXRzPje4+TNeItp9ZbJ8oW5xVsqBrlA9ilVNgi9QBbho1HxhvCMcE5+r+x1BxY1+rleyPff3tWSXtNJ+VWVNa2V67MCsH7iNd7pn1H9COBcckP4cfVnb0p3fqEDV6StahylwhFioQpmOagjrDC+Lm4uyWH0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GuyqTjMU0lHlzQhUYvl6VE9+Emv3K+GLwDKr3g9JnOY=;
 b=c+Ifhk2xDndDlz4rEhkcI4b0gdlDOkv23uVTrNPt6l3Yt3b1JQcAzM7c1ucOTibk/WFLjWeTSqPZH0ganUcbY3q/EK/qYcZT5aJyTXSgtUj4nyuOw4W9No8vd2V7o+96eAJ2jQqeIPAQ9pf9YMBtc44+1yeFmdNIGOwCqRb5euuzviwgxSvLbHKyMRC6f5JL+ZkA8oSJ3mb6NBhFj3HBvJBV9weZ6lV8t4R5l4KBLtThW8TzjUVlxm0GUVVNtDEbLHmkLA0QRQE57UwJ0M8G+DoVftQ2pq6bZ2qiZVqEOfw0+G+VFVNvWJ9Oq9VEUQukAkqvXhgE2GbY5X4m92hZAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GuyqTjMU0lHlzQhUYvl6VE9+Emv3K+GLwDKr3g9JnOY=;
 b=hMvrB8EfaRjZqLB6eDs2vDFa4/IXA+m5cFOu868PtBUXPmIq1AahbiAT1W8zzRFCCUGDvIJT+RnfwbI1aVISDU6Try8zu9EM6Qhn6W2Yeo6swamDdCcr3qpU6cKGkJLKb3laDbSxOnLGNeqWw7QgOZduc03/13Yx5w21JkJ8XGo=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 23:59:20 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 23:59:20 +0000
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
 AQHbiKw5KJl/2rSglECIEFO5G8n187NiIOyAgAAJb4CAACsKAIABZTgAgAMIEgCAAZVhAIAE+8SAgAFd+YA=
Date: Tue, 11 Mar 2025 23:59:20 +0000
Message-ID: <20250311235907.wzkbgwr72hzegnop@synopsys.com>
References: <20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com>
 <20250226-dwc3-refactor-v4-5-4415e7111e49@oss.qualcomm.com>
 <20250304000527.ybxfdjx5xzypcals@synopsys.com>
 <20250304003913.bsn5sucnofq6d6jo@synopsys.com>
 <zr6qdi3gtjaj3gyalpspzej33q356bs5ynchcmtr73765gjel5@c5ijv7czkhqt>
 <20250305003148.mahxupphkaiizpbh@synopsys.com>
 <o4n7p5b5zlgstmkn5hbvdqfe4tkhwidgvtqmcfwtr5yhrvix24@an7xdurug6mm>
 <20250307230022.w6fignlsmzcg6k4e@synopsys.com>
 <nccztzjoqokmyszvp2o7zvp33zztfucmhk2n65pacqrj4p7cwf@ahrt3bmciwea>
In-Reply-To: <nccztzjoqokmyszvp2o7zvp33zztfucmhk2n65pacqrj4p7cwf@ahrt3bmciwea>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH7PR12MB5596:EE_
x-ms-office365-filtering-correlation-id: 34f2a720-4b1f-4306-396e-08dd60f8bd55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TlR5eVNEOXF4N0N0SGpubjFYa3lxc1JwQVRoTGFaWHo3L21xSkpQck5sY0ZJ?=
 =?utf-8?B?OHZQYzMvL3FIZ2xKcjdWYjdKUHMvUHdDQ3ZHZnl0K2VPTHlzaWtjajV3REd3?=
 =?utf-8?B?VGJjU0NWYnpqSTZnam5sZG9HUllaQmVUaGFEWFl0b1lkaGUwRG5laHNDRXlX?=
 =?utf-8?B?bERweHcxWkZNSkFVcW0wWFBDWkJDaSs4WmxieTVONng0NEJPZUt0Y0dWYjZn?=
 =?utf-8?B?WHJiUmEydkZFa0VmNmpabW5xaThqQU9JdmQ4ZHkzQjhoNkVvRndnTkE1VTRO?=
 =?utf-8?B?bytUNk0vdzl3NFlSME92OGdZdEZCZVBuaVZJd0N5WWR2MEMwU0hMREwwcVlB?=
 =?utf-8?B?NnA3QU1HcjFKYm82SHFCVEc3OXVnTDFZMDhWTnE3bFhoeXVkdXo1dmRKU25t?=
 =?utf-8?B?QjJhQjlDTUxuem9LK3BaWDRQZmNRbDNpcEh5VWl1RFRwdGZTSkd3MlJyYno0?=
 =?utf-8?B?RzdPUnRuMlluemg1SUhobktpLzBhRGRWUTgybXJwSnpiNHRXbGhpYjM4NE1K?=
 =?utf-8?B?Mnk5NHZqMXlRbUxxR0UvcW5qbVAzV2NUTG8wQjVuU1R1OFZHRTNZc0RySEVk?=
 =?utf-8?B?ekRqUFA4NG96bFdOR2JLRjZ4UFEwMDN5WjExczdHR1lEeFhkL05CdlhabE5X?=
 =?utf-8?B?M0lQUFVmd3FlOXNDRC8zTlhNTVhMZ05GWk5JVFJwZ1RmK1hKUDBFUThyMmFh?=
 =?utf-8?B?cXoyZFZuWWVDYzdwSEpMWllNY1RZU1Q4NHRIZStickdrSEpmUTY5dWsvVzhP?=
 =?utf-8?B?ZnpmN1dIUmpzUHdQVExHL05Na0dGaGxLUy9uU3Y0UTBRbExBbEdqbnI4NU1W?=
 =?utf-8?B?VU9iZlNqMGZudm1lZ0hFbXNjUEdtYWd0MUZIeWFuT1VQY3ptMWpGK01vK0xS?=
 =?utf-8?B?eHhnWG44QXFGeVpMWEFta3d4U2ZJb2tZSGtBWXpnc2tEREdxZ1EwRWJOZnVJ?=
 =?utf-8?B?TExPdm5FZ1RHRytmSEk5SStYejB5QlVXNzh0eHU5NXNnU3dNVGNtbTNqZWVE?=
 =?utf-8?B?dnROLyt4RmxqT1dwUlRLSjVGQkc2NDc4NEZ3SEIzZEZXbHM4Q05VYzBTQjRz?=
 =?utf-8?B?cTZ3Zml6cDJwMVFPbWhUUEJuUkI4TEhkRGg1TjdWL0VqYjJ5RkJqd3BwV2w3?=
 =?utf-8?B?ZzFEWGh2U1JaS0JRNkFQd0xxZ2Q3OWRHK1pIcGFIM2RRcy9ZeVFodnVBUW5U?=
 =?utf-8?B?UTg4NER2VG5VYm1lNU8xZnU3NWl2YnpFRHUwK3pKVlBTUkJCS3RZb3NmdGFh?=
 =?utf-8?B?M1F2akk5RGJDZTBnNTh2RUI5MUVSc0VuWGJMaHkybTZTR1o2Y1hKTWV4djBW?=
 =?utf-8?B?MW9NMllqR3RBaGQzWGdndFkvcEFKbnVKaENJMi9KcVV1VTBYNWc2UlQzMk54?=
 =?utf-8?B?N0dMSWd4NjEwZHNvbzVwNGF2TGkwZ0NFZHZVcXVrc1ZEYzBJempHY1JaOE5p?=
 =?utf-8?B?RkRuTllGSzRsOThFbk9MSzlvSlpXbEtMaExRdjdwRi91S29CZmc2NjN4TURZ?=
 =?utf-8?B?Rnd6NmI1VmlGWlg0Q2NONHVSVTZhQVZJdEVhNitNa1JhcTEvMjRJVmg1THN0?=
 =?utf-8?B?aU0xb3JZY3EvSWhGSTU5cmJnekI4cUZ5TmR1V1U2N1lnb0FOZDVWb1NnMnZD?=
 =?utf-8?B?NmN5RWplLy9NbTNJZTZtRXBoWk95cWR6NW5EYTN5YXkxZUZhNFduZUJNblRF?=
 =?utf-8?B?dmVNZi9CYlB2QzVvb3prMjFoR2U5ejBoaVd1SVBGTU93S21yTGFxMERwZzBu?=
 =?utf-8?B?Tk5OeXpYNVhzVmR6MHBNeHVUR1VkVUVxdVpLNFFCdWl6MHlSUWFkQm85cUhh?=
 =?utf-8?B?eGZ2dVR5d2QyV09yRDNaclIrTVFUQm9YQ0l3ZFkwTlFJQUNEa0svb00rdmow?=
 =?utf-8?B?V2hxZTNkMnJOMUIyR0JFTFpjVWFXcVg5OVowZEJFWklabXBjakU3RlErNS96?=
 =?utf-8?Q?MrnuDokj+DIo+nASgQenLlnHbdHvz+j/?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aXZ3MFZFZkRKYkN1emFwaU9xcmlwTUlzTzZpNEhxbzRzZFBmU2NPeC9lek1Q?=
 =?utf-8?B?bjczeFFmTTZQU1ZoUnQzTXVDRHFMVkJRSUVrNzlKZ0pCTzY1OWhqSUhaaDAx?=
 =?utf-8?B?OVJZYmMxZDJma05sMVBVNVNFTU56d0k3cGtLYytGZ0xNbzMzYzVpcXlleHJp?=
 =?utf-8?B?cHFYcDhtVGxEaTRBMEpCakZoaktZKzNHS2dnWDdXMXFSN1NJOXpVV2dvM2l4?=
 =?utf-8?B?a1NBWHhEaXlNdVZSaVB6dEo5OWt4Z1FHL3Zzb2hqVzlJNkVMTzI4TjRoVEUw?=
 =?utf-8?B?bENLbnFCeEU2VS9FWXZNQSs5L0x6Z1pxL1Rmbm1tZXJ1a0lCZ2xwTndLTkF5?=
 =?utf-8?B?WDg4dlVOUmdKZWVRRmNyMUZQOHA3OVdiMGduUHlHYy9iNVZJZVNWWUZORVBz?=
 =?utf-8?B?RWRtQmZTZ0ZpZ3o5SVdXZkFXYU9odEVmL1J1b0xDYjRqOXNuU1VRRzJyZnZG?=
 =?utf-8?B?YXdObmhEcTJQcHZMei9mYzZBYXZiNWFhdkUxbm13dHNKOWhYdEJmSmt6R1Nt?=
 =?utf-8?B?a3dqQUg5MlFmWVhSSFZhdytNV0x4aGo2Vzl3eTJJVGtGM1B4dmpaeG5jYWNL?=
 =?utf-8?B?MkVNLy9Udk1UQ0s5UVMwTmVtRWJHMmZqM0RUcGdGamxXM2t3d1JpQzJvOCtL?=
 =?utf-8?B?TEVEL1creDkxK2FGTDZ5dzlCMDVSUWRPUzlYL1lwTG9MUzFoUkpIamloMmNY?=
 =?utf-8?B?VUZFVXVZTHMzVkFqSDdZZUdUQkd0VWFhSy9YYzJsTzI1dW5NUzNnNitndThU?=
 =?utf-8?B?VWhHSTNsT1BpR0ludEwwU2FRU3NyYXM1Ky9GUDg0QnB4YTBkR2o2c0x5ZG9Z?=
 =?utf-8?B?TlB5WS9EZjVBSGY2WnI0QnN4cDRTdjNGU0pOS0wwZ25ZNlBTckJmbU9iYThr?=
 =?utf-8?B?WVNuN0JxbVA3UnFpNXdhTG02eFh6Wk5JTDJnUEJpRlJzNzcvTFBEMXhqcG5B?=
 =?utf-8?B?ZkZVbmpDWW1Wd0hDaDRMV2tvU3ljZ05MU0pYQStwd3ZMMndpYlE3WVR5VHpw?=
 =?utf-8?B?bm9KS2F3N1A2em50NWJPRjdtT1NKemVCZENIelFYdFdFVHJqTXpBZU11N0tO?=
 =?utf-8?B?UjlxNTcvUXZBN0wyWUJ3cHMrUmxkMU14MGpvWStxZVlySFc1Ui8yeEJkNTBV?=
 =?utf-8?B?MjdHaXU5clVxd1pTMG56NzhOMUhBSU9zV2JGUzIwdEFJM3BFT0dGR25nZnpo?=
 =?utf-8?B?YUI1UzlJL2VYVStZZjk2aHhQTkxpdk5BK0JEbVN6ajcvVjZHKzNuMy9uK3dG?=
 =?utf-8?B?eUpCK0JUZ1Y4VmJQaTdJemlPU09VbHpVbnh4dE0yTXc0N2pSR0wwSFdKdWVQ?=
 =?utf-8?B?MjVlbEhlbWM2RnFGNVM5dVI1Q1ZLS0FlQnBwMmlZODhDQTY5MzVTbW9VTldC?=
 =?utf-8?B?TVNzcDRBMnJ4dkIzNndrYWhvVFM2YnNrVnpWN2U3dkVzT0lZOElQY0hwak1L?=
 =?utf-8?B?QmF5VFl4NzBSMENvK1cxQTJQZzlZczNUSEZTcmNwbjBQdHVXR2hVYWRjektE?=
 =?utf-8?B?QnRabEQvT0ltcUhVQ0E3ZnRIRzJGRUtXMnluTUJqZTVzanZUbmM3MTBWT3ll?=
 =?utf-8?B?VEFueGg0Y1BiSm1sU2YvMmVqdjB0enNCVnRQL3AxWXM0aUxuWmEvdUJwcFND?=
 =?utf-8?B?ZUdhTG1ybDh4SXF5VUQ3azIxWUZtei9ENktpUnZycFJBTkJMMU1ZK1ZXZEtz?=
 =?utf-8?B?Y3BpWTBIL1UwYWcwMGk3VzZIMXRQLytTTEkwQmM3VmUrOGs3N1VqNUJCbEpv?=
 =?utf-8?B?N0RGWnU2UFN4eU16M2tQN0dJUHBTb24xeUtzc0JraEhUa2lmRDVEaTk2NlVx?=
 =?utf-8?B?bGc5OWRtL0dyMHNRVDBISGRRMjN4a3IwSW5rR2xubnRTUmpDS2NOV0xmZk43?=
 =?utf-8?B?ck56dUt2bnRLaHVCUHRDMWN0Sk5qWGRvVkNHNUp1ZVBZSnFpR3NkWlFUc0dX?=
 =?utf-8?B?RmFQQVlKVTZTc1VLMjk1azh3QVZYaWhjOHdHNDJ1TXZKRkdTV3hGZnZOY1pU?=
 =?utf-8?B?RXRUUUpNWEdGUUwyRXY0Vy8raDRrNDhaTzUyYkthNW5TcEJLRmpRYzhSaGlQ?=
 =?utf-8?B?MytnZUxjVU5HalJUQXVEV3F5WmZ1NEhSd1JUd1dXMzFoOCtVNzVHTFZqVHM2?=
 =?utf-8?Q?iJzaSZZhOxKfb4YdZxfn41FhI?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4880ECEC8F84E140A9C0757915ED223B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gniUv/OvhKoU4ytfvEwwrTtcHMazS33Hm+W7ubMRcg2qHpSdSnCAc+cJhVc707YZxtEnzxCZDkbfZqZVOOzC/Bv31sHf1G5YJuSNglpJYXG8o9rVOLRhRGDXjwPgqdTW0J4TsfBqtmca4WgAFQnrM+h2WmoNda6QxGQ54Q8Xm5sT9/R9AJQtaRR+0rHZgYxqBvF9aGSD43w8e4VwkFcXfoUjGfaYQsg3x67y/zWz67Nfi+68ZYuhqDv7P7hg6mr5VWQkRjvIrOmVnpo1ZfldjNZZAc4d7xlR1NcKgcxH3cGD13fBQ1oRFbnwjIUDfRtYcbHIlLT9jqTYTs4IMdfvktJepImgleZ2rWPZBri3qH4QOgJKTQR/qBXRJPkLgosRWVHsmC9w6e8CXzWh1fIeVlXGed4cVbqLobJ6uM9dLYUDmBzJuqKsTmEMY9wwmM4OkJlDWSFA+MuuzmtW1wb6c2B5sIktnKKO770lt4DEFm14VV+cVLXPKimtEV1LsyEIpLZ/int3fTp0eCdbSEo7SThfAZs5S70LpSkqQqY0u4a8MtTETjV15E2HZy+vjBqnMjGo7YHqNb6c/HAkCjkicm5hUZgrfWRBGYOcaqvUs1Knra3R8ILjTXqSqkZTghCnPqt0y8rOwyLtS+Rw0SlPzw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f2a720-4b1f-4306-396e-08dd60f8bd55
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2025 23:59:20.0971
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k1V/XWdgofn7WE4Y3sk5OrZcFzivlPd9M1xBEQHbQWkRtLa2HbIHB3Ngsq/B6ahjqfPPQFWQsK0J3EBy7aza+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5596
X-Authority-Analysis: v=2.4 cv=AtLu3P9P c=1 sm=1 tr=0 ts=67d0ce62 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=qPHU084jO2kA:10 a=EUspDBNiAAAA:8 a=Gxef5bGL29KcGT7d0jIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: pI5cNE1SmLOPDosu0QQOKSEzTg8314uf
X-Proofpoint-GUID: pI5cNE1SmLOPDosu0QQOKSEzTg8314uf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_07,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 adultscore=0 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 priorityscore=1501 classifier=spam
 authscore=0 authtc=n/a authcc= route=outbound adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2503110159

T24gTW9uLCBNYXIgMTAsIDIwMjUsIEJqb3JuIEFuZGVyc3NvbiB3cm90ZToNCj4gT24gRnJpLCBN
YXIgMDcsIDIwMjUgYXQgMTE6MDA6MzJQTSArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+
IE9uIFRodSwgTWFyIDA2LCAyMDI1LCBCam9ybiBBbmRlcnNzb24gd3JvdGU6DQo+ID4gPiBPbiBX
ZWQsIE1hciAwNSwgMjAyNSBhdCAxMjozMTo0OUFNICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6
DQo+ID4gPiA+IE9uIE1vbiwgTWFyIDAzLCAyMDI1LCBCam9ybiBBbmRlcnNzb24gd3JvdGU6DQo+
ID4gPiA+ID4gT24gVHVlLCBNYXIgMDQsIDIwMjUgYXQgMTI6Mzk6MTJBTSArMDAwMCwgVGhpbmgg
Tmd1eWVuIHdyb3RlOg0KPiA+ID4gPiA+ID4gT24gVHVlLCBNYXIgMDQsIDIwMjUsIFRoaW5oIE5n
dXllbiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gT24gV2VkLCBGZWIgMjYsIDIwMjUsIEJqb3JuIEFu
ZGVyc3NvbiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gPiBJbiBvcmRlciB0byBtb3JlIHRpZ2h0bHkg
aW50ZWdyYXRlIHRoZSBRdWFsY29tbSBnbHVlIGRyaXZlciB3aXRoIHRoZQ0KPiA+ID4gPiA+ID4g
PiA+IGR3YzMgY29yZSB0aGUgZHJpdmVyIGlzIHJlZGVzaWduZWQgdG8gYXZvaWQgc3BsaXR0aW5n
IHRoZSBpbXBsZW1lbnRhdGlvbg0KPiA+ID4gPiA+ID4gPiA+IHVzaW5nIHRoZSBkcml2ZXIgbW9k
ZWwuIEJ1dCBkdWUgdG8gdGhlIHN0cm9uZyBjb3VwbGluZyB0byB0aGUgRGV2aWNldHJlZQ0KPiA+
ID4gPiA+ID4gPiA+IGJpbmRpbmcgbmVlZHMgdG8gYmUgdXBkYXRlZCBhcyB3ZWxsLg0KPiA+ID4g
PiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+IFZhcmlvdXMgd2F5cyB0byBwcm92aWRlIGJhY2t3
YXJkcyBjb21wYXRpYmlsaXR5IHdpdGggZXhpc3RpbmcgRGV2aWNldHJlZQ0KPiA+ID4gPiA+ID4g
PiA+IGJsb2JzIGhhcyBiZWVuIGV4cGxvcmVkLCBidXQgbWlncmF0aW5nIHRoZSBEZXZpY2V0cmVl
IGluZm9ybWF0aW9uDQo+ID4gPiA+ID4gPiA+ID4gYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3
IGJpbmRpbmcgaXMgbm9uLXRyaXZpYWwuDQo+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+
ID4gRm9yIHRoZSB2YXN0IG1ham9yaXR5IG9mIGJvYXJkcyBvdXQgdGhlcmUsIHRoZSBrZXJuZWwg
YW5kIERldmljZXRyZWUgYXJlDQo+ID4gPiA+ID4gPiA+ID4gZ2VuZXJhdGVkIGFuZCBoYW5kbGVk
IHRvZ2V0aGVyLCB3aGljaCBpbiBwcmFjdGljZSBtZWFucyB0aGF0IGJhY2t3YXJkcw0KPiA+ID4g
PiA+ID4gPiA+IGNvbXBhdGliaWxpdHkgbmVlZHMgdG8gYmUgbWFuYWdlZCBhY3Jvc3MgYWJvdXQg
MSBrZXJuZWwgcmVsZWFzZS4NCj4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiBGb3Ig
c29tZSB0aG91Z2gsIHN1Y2ggYXMgdGhlIHZhcmlvdXMgU25hcGRyYWdvbiBsYXB0b3BzLCB0aGUg
RGV2aWNldHJlZQ0KPiA+ID4gPiA+ID4gPiA+IGJsb2JzIGxpdmUgYSBsaWZlIHNlcGFyYXRlIG9m
IHRoZSBrZXJuZWwuIEluIGVhY2ggb25lIG9mIHRoZXNlLCB3aXRoIHRoZQ0KPiA+ID4gPiA+ID4g
PiA+IGNvbnRpbnVlZCBleHRlbnNpb24gb2YgbmV3IGZlYXR1cmVzLCBpdCdzIHJlY29tbWVuZGVk
IHRoYXQgdXNlcnMgd291bGQNCj4gPiA+ID4gPiA+ID4gPiB1cGdyYWRlIHRoZWlyIERldmljZXRy
ZWUgc29tZXdoYXQgZnJlcXVlbnRseS4NCj4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4g
PiBXaXRoIHRoaXMgaW4gbWluZCwgc2ltcGx5IGNhcnJ5aW5nIGEgc25hcHNob3QvY29weSBvZiB0
aGUgY3VycmVudCBkcml2ZXINCj4gPiA+ID4gPiA+ID4gPiBpcyBzaW1wbGVyIHRoYW4gY3JlYXRp
bmcgYW5kIG1haW50YWluaW5nIHRoZSBtaWdyYXRpb24gY29kZS4NCj4gPiA+ID4gPiA+ID4gPiAN
Cj4gPiA+ID4gPiA+ID4gPiBUaGUgZHJpdmVyIGlzIGtlcHQgdW5kZXIgdGhlIHNhbWUgS2NvbmZp
ZyBvcHRpb24sIHRvIGVuc3VyZSB0aGF0IExpbnV4DQo+ID4gPiA+ID4gPiA+ID4gZGlzdHJpYnV0
aW9ucyBkb2Vzbid0IGRyb3AgVVNCIHN1cHBvcnQgb24gdGhlc2UgcGxhdGZvcm1zLg0KPiA+ID4g
PiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+IFRoZSBkcml2ZXIsIHdoaWNoIGlzIGdvaW5nIHRv
IGJlIHJlZmFjdG9yZWQgdG8gaGFuZGxlIHRoZSBuZXdseQ0KPiA+ID4gPiA+ID4gPiA+IGludHJv
ZHVjZWQgcWNvbSxzbnBzLWR3YzMgY29tcGF0aWJsZSwgaXMgdXBkYXRlZCB0byB0ZW1wb3Jhcmls
eSBub3QNCj4gPiA+ID4gPiA+ID4gPiBtYXRjaCBhZ2FpbnN0IGFueSBjb21wYXRpYmxlLg0KPiA+
ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+IFRoaXMgZHJpdmVyIHNob3VsZCBiZSByZW1v
dmVkIGFmdGVyIDIgTFRTIHJlbGVhc2VzLg0KPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IEJqb3JuIEFuZGVyc3NvbiA8Ympvcm4uYW5kZXJzc29uQG9zcy5x
dWFsY29tbS5jb20+DQo+ID4gPiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiA+ID4gIGRyaXZl
cnMvdXNiL2R3YzMvTWFrZWZpbGUgICAgICAgICAgIHwgICAxICsNCj4gPiA+ID4gPiA+ID4gPiAg
ZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20tbGVnYWN5LmMgfCA5MzQgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+ID4gPiA+ID4gIGRyaXZlcnMvdXNiL2R3YzMv
ZHdjMy1xY29tLmMgICAgICAgIHwgICAxIC0NCj4gPiA+ID4gPiA+ID4gPiAgMyBmaWxlcyBjaGFu
Z2VkLCA5MzUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4gPiA+ID4gPiA+IA0K
PiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gVGhpcyBpcyBhIGJpdCBjb25jZXJuaW5nIGlm
IHRoZXJlJ3Mgbm8gbWF0Y2hpbmcgY29tcGF0aWJsZSBzdHJpbmcuIGllLg0KPiA+ID4gPiA+ID4g
PiB3ZSBkb24ndCBoYXZlIHVzZXIgZm9yIHRoZSBuZXcgZHJpdmVyIHdpdGhvdXQgZG93bnN0cmVh
bSBkZXBlbmRlbmNpZXMNCj4gPiA+ID4gPiA+ID4gKG9yIHNvbWUgd29ya2Fyb3VuZCBpbiB0aGUg
ZHJpdmVyIGJpbmRpbmcpLg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBJZ25vcmUgdGhlIGNv
bW1lbnQgYWJvdmUsIEkgbWlzc2VkIHRoZSAidGVtcG9yYXJpbHkiIGluIHlvdXIgbG9nDQo+ID4g
PiA+ID4gPiBhYm92ZS4gSG93ZXZlciwgdGhlIGNvbW1lbnQgYmVsb3cgc3RpbGwgc3RhbmRzLg0K
PiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBXaGlsZSBJIHVuZGVy
c3RhbmQgdGhlIGludGVudGlvbiwgSSdtIGFmcmFpZCB3ZSBtYXkgaGF2ZSB0byBzdXBwb3J0IGFu
ZA0KPiA+ID4gPiA+ID4gPiBtYWludGFpbiB0aGlzIG11Y2ggbG9uZ2VyIHRoYW4gdGhlIHByb3Bv
c2VkIDIgTFRTIHJlbGVhc2VzIChhcyBzZWVuIHdpdGgNCj4gPiA+ID4gPiA+ID4gYW55dGhpbmcg
dGFnZ2VkIHdpdGggImxlZ2FjeSIgaW4gdGhlIHVwc3RyZWFtIGtlcm5lbCkuDQo+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gVGhlcmUgYXJlIG5vIHByb2R1Y3RzIHNoaXBwaW5nIHRvZGF5IHVzaW5nIGR3
YzMtcWNvbSB3aGVyZSBEZXZpY2V0cmVlIGlzDQo+ID4gPiA+ID4gY29uc2lkZXJlZCBmaXJtd2Fy
ZS4gVGhlIHByaW1hcnkgYXVkaWVuY2UgZm9yIGEgbG9uZ2VyIHRyYW5zaXRpb24gaXMNCj4gPiA+
ID4gPiB1c2VycyBvZiB0aGUgdmFyaW91cyBsYXB0b3BzIHdpdGggUXVhbGNvbW0tY2hpcCBpbiB0
aGVtLiBCdXQgZ2l2ZW4gdGhlDQo+ID4gPiA+ID4gcmFwaWQgZGV2ZWxvcG1lbnQgaW4gYSB2YXJp
ZXR5IG9mIGZ1bmN0aW9uYWwgYXJlYXMsIHRoZXNlIHVzZXJzIHdpbGwgYmUNCj4gPiA+ID4gPiBo
aWdobHkgY29tcGVsbGVkIHRvIHVwZGF0ZSB0aGVpciBEVEJzIHdpdGhpbiAyIHllYXJzLg0KPiA+
ID4gPiA+IA0KPiA+ID4gPiA+IFRoZSBvdGhlciBvYnZpb3VzIHVzZXIgZ3JvdXAgaXMgdG8gbWFr
ZSBzdXJlIHVzIHVwc3RyZWFtIGRldmVsb3BlcnMNCj4gPiA+ID4gPiBkb24ndCBsb29zZSBVU0Ig
d2hlbiB0aGluZ3MgZ2V0IG91dCBvZiBzeW5jLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IA0KPiA+
ID4gPiA+IFRoYXQgc2FpZCwgaWYgdGhlIG1vZGVsIGRlZmluZWQgaGVyZSBpcyB0byBiZSBmb2xs
b3dlZCBpbiBvdGhlciBjYXNlcw0KPiA+ID4gPiA+IChvciBteSBvdGhlciB2ZW5kb3JzKSB3aGVy
ZSBEZXZpY2V0cmVlIGlzIHRyZWF0ZWQgYXMgZmlybXdhcmUsIHlvdXINCj4gPiA+ID4gPiBjb25j
ZXJucyBhcmUgdmFsaWQgLSBhbmQgaXQgbWlnaHQgYmUgd29ydGggdGFraW5nIHRoZSBjb3N0IG9m
IG1hbmFnaW5nDQo+ID4gPiA+ID4gdGhlIGxpdmUtbWlncmF0aW9uIGNvZGUuDQo+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gPiA+IElmIHBvc3NpYmxlLCBJJ2QNCj4gPiA+ID4gPiA+ID4gcHJlZmVyIHRo
ZSBjb21wbGljYXRpb25zIG9mIG1haW50ZW5hbmNlIG9mIHRoZSBtaWdyYXRpb24gY29kZSBiZSBo
YW5kbGVkDQo+ID4gPiA+ID4gPiA+IGRvd25zdHJlYW0uDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4g
PiA+IA0KPiA+ID4gPiA+IEknbSBzb3JyeSwgYnV0IGhlcmUgaXQgc291bmRzIGxpa2UgeW91J3Jl
IHNheWluZyB0aGF0IHlvdSBkb24ndCB3YW50IGFueQ0KPiA+ID4gPiA+IG1pZ3JhdGlvbiBjb2Rl
IHVwc3RyZWFtIGF0IGFsbD8gVGhpcyBpcyBub3QgcG9zc2libGUsIGFzIHRoaXMgd2lsbCBicmVh
aw0KPiA+ID4gPiA+IFVTQiBmb3IgZGV2ZWxvcGVycyBhbmQgdXNlcnMgc2hvcnQgdGVybS4gV2Ug
Y2FuIG9mIGNvdXJzZSBkaXNjdXNzIHRoZSAyDQo+ID4gPiA+ID4gTFRTIHRob3VnaCwgaWYgeW91
IHdhbnQgYSBzaG9ydGVyIGxpZmUgc3BhbiBmb3IgdGhpcyBtaWdyYXRpb24uDQo+ID4gPiA+ID4g
DQo+ID4gPiA+IA0KPiA+ID4gPiBNeSBmaXJzdCBjb25jZXJuIGlzIG5vdyB3ZSBoYXZlIGEgbGVn
YWN5IGRyaXZlciB0aGF0IHNob3VsZCBub3QgYmUNCj4gPiA+ID4gY29udGludWVkIHRvIGJlIGRl
dmVsb3BlZCB3aGlsZSB3ZSBhbHNvIG5lZWQgdG8gYWRkcmVzcyBhbnkNCj4gPiA+ID4gcmVncmVz
c2lvbi9maXhlcyBmb3VuZCBpbiB0aGUgZnV0dXJlIGZyb20gdGhlIGxlZ2FjeSBkcml2ZXIuIFdo
aWxlIEkNCj4gPiA+ID4gd291bGQgZW5jb3VyYWdlIHVzZXJzIHRvIHN0YXJ0IG1pZ3JhdGluZyB0
byB0aGUgbmV3IGRyaXZlciwgSSB3b24ndA0KPiA+ID4gPiByZWplY3QgZml4ZXMgdG8gdGhlIGxl
Z2FjeSBkcml2ZXIgZWl0aGVyLiBJbiB0aGUgbmV4dCAyIHllYXJzKywgbXkNCj4gPiA+ID4gb3Ro
ZXIgY29uY2VybiBpcyB0aGF0IEknbSBub3QgY29uZmlkZW50IHRoYXQgd2UgY2FuIGVhc2lseSBy
ZW1vdmUgdGhlDQo+ID4gPiA+IGxlZ2FjeSBkcml2ZXIgYW5kIHRoZSBEVFMgdGhlbi4NCj4gPiA+
ID4gDQo+ID4gPiANCj4gPiA+IFRoZSBwcm9ibGVtIGF0IGhhbmQgaXMgdGhhdCB0aGUgZHJpdmVy
IF9uZWVkc18gYSBidW5jaCBvZiB3b3JrLg0KPiA+ID4gUm9sZS1zd2l0Y2hpbmcgb25seSB3b3Jr
cyBzb21ldGltZXMsIGV4dGNvbiBpcyAoZm9yIG9sZGVyIHBsYXRmb3JtcykNCj4gPiA+IGR1cGxp
Y2F0ZWQgaW4gYm90aCBnbHVlIGFuZCBjb3JlIC0gd2l0aCB0aGUgaG9wZSB0aGF0IGVhY2ggcGFy
dCBkb2VzIGl0cw0KPiA+ID4gdGhpbmcgaW4gYSBzdWl0YWJsZSBmYXNoaW9uLCB0aGUgbGF5ZXJp
bmcgdmlvbGF0aW9ucyBjYW4gdHJpZ2dlcg0KPiA+ID4gTlVMTC1wb2ludGVyIGRlcmVmZXJlbmNl
cyBvciB1c2UtYWZ0ZXItZnJlZSwgUE0gcnVudGltZSBpcyBtYXJrZWQNCj4gPiA+IGZvcmJpZGRl
bi4uLg0KPiA+ID4gDQo+ID4gPiBXZSd2ZSBsb29rZWQgYXQgdGhlc2UgcHJvYmxlbXMgZm9yIGEg
ZmV3IHllYXJzIG5vdywgd2l0aG91dCBjb21pbmcgdXANCj4gPiA+IHdpdGggYW55IHNvbHV0aW9u
IHRvIGFkZHJlc3MgdGhlc2UgaXNzdWVzIHdpdGhpbiB0aGUgY3VycmVudCBkZXNpZ24uDQo+ID4g
DQo+ID4gVGhhdCdzIHVuZGVyc3Rvb2QsIGFuZCB0aGF0J3MgdGhlIGluY2VudGl2ZSBmb3IgeW91
ciB3b3JrIGhlcmUuDQo+ID4gDQo+ID4gPiANCj4gPiA+IEZvbGxvd2luZyB0aGlzIHJlZmFjdG9y
LCB3ZSB3aWxsIGJlIGFibGUgdG8gd29yayBvbiB0aGVzZSBpbXByb3ZlbWVudHMuDQo+ID4gPiBG
b3IgdGhpcyB0byBoYXBwZW4sIEkgaW50ZW5kIHRvIHRyYW5zaXRpb24gYWxsIHRoZQ0KPiA+ID4g
YXJjaC8qL2Jvb3QvZHRzL3Fjb20vKiBwbGF0Zm9ybXMgdG8gdGhlIG5ldyBiaW5kaW5nIGFzIHNv
b24gYXMgcG9zc2libGUuDQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gTG9va2luZyBhaGVhZCwgd2hl
biB3ZSBoaXQgdGhlIHBvaW50IG9mIGRlcHJlY2F0aW5nIHRoZSBkd2MzLXFjb20tbGVnYWN5DQo+
ID4gPiBkcml2ZXI6DQo+ID4gPiANCj4gPiA+IFRoZSB1cHN0cmVhbS1iYXNlZCBwcm9kdWN0IHdl
IGhhdmUgdG9kYXkgZG8gc2hpcCBEZXZpY2V0cmVlIGluDQo+ID4gPiBjb21iaW5hdGlvbiB3aXRo
IHRoZSBrZXJuZWwsIHNvIHRoZXkgd291bGQgdXBncmFkZSBib3RoIHRvZ2V0aGVyIGFuZCBnZXQN
Cj4gPiA+IHRoZSBuZXcgZHJpdmVyLg0KPiA+ID4gDQo+ID4gPiBUaGUgb3RoZXIgZ3JvdXAgd291
bGQgYmUga2VybmVsIGRldmVsb3BlcnMsIGVudGh1c2lhc3RzLCBzcGVjaWZpYyB1c2Vycw0KPiA+
ID4gd2hvIGZvciBzb21lIHJlYXNvbiBpcyB1cGdyYWRpbmcgdGhlaXIga2VybmVsIGJ1dCBub3Qg
dGhlaXIgRGV2aWNldHJlZS4NCj4gPiA+IFRoZXNlIHVzZXJzIHdpbGwgd2FudCB0aGUgbmV3IGZl
YXR1cmVzIGFuZCBzdGFiaWxpdHkgd2UncmUgYnJpbmdpbmcuDQo+ID4gPiANCj4gPiA+ID4gQ29k
ZSBjYW4gYnJlYWssIGFuZCB0aGF0J3Mgbm90IHVuZXhwZWN0ZWQuIElmIDIgTFRTIHJlbGVhc2Vz
IGxhdGVyIGFuZA0KPiA+ID4gPiB3ZSByZW1vdmUgdGhlIGR3YzMtcWNvbS1sZWdhY3ksIHRoaW5n
cyBjYW4gYnJlYWsgdGhlbiB0b28uIFRoaXMgbWF5IGp1c3QNCj4gPiA+ID4gYXMgYmUgcGFpbmZ1
bCBpZiB3ZSBuZWVkIGZpeGVzIHRvIHRoZSBsZWdhY3kgZHJpdmVyIGR1ZSB0byBzb21lIHByZXZp
b3VzDQo+ID4gPiA+IHJlZ3Jlc3Npb24uIEFsc28sIEknbSBzdXJlIHlvdXIgdGVhbSBkaWQgYSBm
YWlyIHNoYXJlIG9mIHRlc3RpbmcgdGhlIG5ldw0KPiA+ID4gPiBkcml2ZXIgcmlnaHQ/IElzIHRo
ZXJlIHNvbWUgbWFqb3IgY29uY2VybiBpbiB0aGUgbmV3IGRyaXZlciB0aGF0IHdlDQo+ID4gPiA+
IGhhdmVuJ3QgYWRkcmVzc2VkPw0KPiA+ID4gPiANCj4gPiA+IA0KPiA+ID4gVGhlIG5ldyBhbmQg
b2xkIGRyaXZlcnMgYXJlIG1vc3RseSBpZGVudGljYWwgYXQgdGhpcyBwb2ludCwgYW5kIGV4cGVj
dGVkDQo+ID4gDQo+ID4gVGhpcyB3YXMgbXkgZXhwZWN0YXRpb24sIHRoYXQgdGhlIG5ldyBhbmQg
b2xkIGRyaXZlcnMgYXJlIG1vc3RseQ0KPiA+IGlkZW50aWNhbCBhdCB0aGlzIHBvaW50LiBUaGlz
IGlzIG9uZSBvZiB0aGUgcmVhc29ucyB3aHkgSSBzdWdnZXN0ZWQgdG8NCj4gPiBkaXJlY3RseSBz
d2l0Y2ggdG8gdXNpbmcgdGhlIG5ldyBkcml2ZXIgYXQgdGhpcyBwb2ludC4NCj4gPiANCj4gDQo+
IEkgZG8gc3VnZ2VzdCB0aGF0IHdlIGRpcmVjdGx5IHN3aXRjaCBhbGwgdGFyZ2V0cyB0byB1c2Ug
dGhlIG5ldw0KPiBpbXBsZW1lbnRhdGlvbi4NCj4gDQo+IEJ1dCB0aGF0IHN3aXRjaCBoYXBwZW5z
IGluIERldmljZXRyZWUgYmxvYnMgKC5kdGIgZmlsZXMpIHRoYXQgYXJlOg0KPiAxKSBFbnRlcmlu
ZyB0aGUgdXBzdHJlYW0ga2VybmVsIHRocm91Z2ggYSBkaWZmZXJlbnQgbWFpbnRhaW5lcg0KPiAy
KSBJbiBzb21lIGNhc2VzIG1hbmFnZWQgYXMgdGhyb3VnaCBhIHNlcGFyYXRlIHNvZnR3YXJlIGRl
bGl2ZXJ5DQo+IG1lY2hhbmlzbSAtIHNvIGl0J3MgcG9zc2libGUgdGhhdCB1c2VycyBydW4gdjYu
MTUgd2l0aCBhIERUQiBmcm9tIHY2LjEzLg0KPiANCj4gPiA+IHRvIGRpdmVyZ2UgZnJvbSBoZXJl
Lg0KPiA+IA0KPiA+IFRoaXMgaXMgd2hhdCBJIHdhbnQgdG8gYXZvaWQuDQo+ID4gDQo+IA0KPiBV
bmRlcnN0b29kLg0KPiANCj4gPiA+IA0KPiA+ID4gVGhlIG9uZSB0aGluZyBJIGhhdmUgaWRlbnRp
ZmllZCB0byBkaWZmZXIgaXMgdGhhdCB0aGUgImxlZ2FjeSIgZHJpdmVyDQo+ID4gPiBzdXBwb3J0
cyAyIGV4dGNvbiBoYW5kbGVzIGluIHRoZSBnbHVlLCBidXQgdGhpcyBpcyBub3QgY29uc2lkZXJl
ZA0KPiA+ID4gYWNjZXB0YWJsZSBieSB0aGUgYmluZGluZyBzbyBJIGhhdmVuJ3QgZm91bmQgYW55
b25lIGFjdHVhbGx5IGV4ZXJjaXNpbmcNCj4gPiA+IHRoaXMgY29kZSBwYXRoIC0gdGhlbiBhZ2Fp
biBleHRjb24gYW5kIHVzYl9yb2xlX3N3aXRjaCBpcyBvbmUgb2YgdGhlDQo+ID4gPiB0aGluZ3Mg
dGhpcyBlbmFibGVzIHVzIHRvIGNsZWFuIHVwLg0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IFRoYXQg
c2FpZCwgd2hpbGUgdGhpcyBtb2RlbCBzZWVtcyBzdWl0YWJsZSBmb3IgUXVhbGNvbW0sIGR1ZSB0
byB0aGUNCj4gPiA+IGN1cnJlbnQgc3RhdGUgb2YgdGhpbmdzLCBJIGRvbid0IGtub3cgaWYgdGhl
IHNhbWUgaXMgdHJ1ZSBmb3IgRnJhbmsgTGksDQo+ID4gPiBwZXJoYXBzIE5YUCBoYXMgYSBicm9h
ZGVyIHVzZXIgYmFzZSBhbmQgbmVlZCB0aGUgbWlncmF0aW9uIGxvZ2ljLg0KPiA+ID4gDQo+ID4g
DQo+ID4gVGhpcyB3YXMgbm90IGV4cGVjdGVkLiBJZiB0aGUgbmV3IGRyaXZlciBkb2Vzbid0IHN1
cHBvcnQgY2VydGFpbiBkZXZpY2VzDQo+ID4gd2l0aCBleHRjb24sIGhvdyBjYW4gd2UgZXhwZWN0
IHRvIHJlbW92ZS9kZXByZWNhdGUgdGhlIGxlZ2FjeSBkcml2ZXINCj4gPiB3aXRob3V0IGRyb3Bw
aW5nIHN1cHBvcnQgdG8gdGhlc2UgZGV2aWNlcy4NCj4gPiANCj4gDQo+IFRoZSBvcHBvc2l0ZSB3
aWxsIGJlIHRoZSBjYXNlLiBUaGUgbmV3IGRyaXZlciB3aWxsIHN1cHBvcnQgZXh0Y29uIGFuZA0K
PiB1c2Jfcm9sZV9zd2l0Y2gsIHdoaWxlIHRoZSBsZWdhY3kgb25lIGNhbid0IHN1cHBvcnQgdXNi
X3JvbGVfc3dpdGNoLiBUaGUNCj4gbGF5ZXJpbmcgdmlvbGF0aW9ucyBjYW4ndCBiZSByZXNvbHZl
ZCBpbiB0aGUgb2xkIGRyaXZlciwgc28gdGhlIGlzc3Vlcw0KPiBzdGVtbWluZyBmcm9tIHRoaXMg
Y2FuJ3QgYmUgZml4ZWQuDQoNCkFoLi4gdGhlbiB0aGlzIHNob3VsZCBiZSBmaW5lLg0KDQo+IA0K
PiA+ID4gPiA+IA0KPiA+ID4gPiA+IEluIG15IHZpZXcsIHNldHRpbmcgYSBmbGFnIGRhdGUgd2hl
biB0aGUgZHdjMy1xY29tLWxlZ2FjeS5jIHdpbGwgYmUNCj4gPiA+ID4gPiByZW1vdmVkIHdpbGwg
cHJvdmlkZSB1cHN0cmVhbSB1c2VycyBhIHRyYW5zaXRpb24gcGVyaW9kLCBhdCBhIHZlcnkgbG93
DQo+ID4gPiA+ID4gYWRkaXRpb25hbCBjb3N0ICg5MzQgbGluZXMgb2YgYWxyZWFkeSB0ZXN0ZWQg
Y29kZSkuIElmIHNvbWVvbmUNCj4gPiA+ID4gPiBkb3duc3RyZWFtIGFmdGVyIHRoYXQgZmxhZyBk
YXRlIHdhbnRzIHRvIHJldGFpbiBzdXBwb3J0IGZvciBxY29tLGR3YzMNCj4gPiA+ID4gPiB0aGV5
IGNhbiBqdXN0IHJldmVydCB0aGUgcmVtb3ZhbCBvZiBkd2MzLXFjb20tbGVnYWN5LmMuDQo+ID4g
PiA+IA0KPiA+ID4gPiBUaGUgc2FtZSBjYW4gYmUgc2FpZCB0aGF0IHRoZXkgY2FuIHJldmVydCB0
aGUgdXBkYXRlIChvciBhcHBseSBmaXhlcykNCj4gPiA+ID4gc2hvdWxkIHRoZXkgZm91bmQgaXNz
dWUgd2l0aCB0aGUgbmV3IGNoYW5nZS4NCj4gPiA+ID4gDQo+ID4gPiANCj4gPiA+IFdlJ3JlIGNo
YW5naW5nIHRoZSBEZXZpY2V0cmVlIGJpbmRpbmcsIHdoaWNoIGdpdmVzIHVzIHR3byBwcm9ibGVt
czoNCj4gPiA+IDEpIERldmljZXRyZWUgc291cmNlIGNvZGUgYW5kIERXQzMgZHJpdmVyIGNvZGUg
YXJlIG1lcmdlZCB0aHJvdWdoDQo+ID4gPiBkaWZmZXJlbnQgdHJlZXMuDQo+ID4gPiANCj4gPiA+
IDIpIFRoZSBjb21waWxlZCBEZXZpY2V0cmVlICguZHRiKSBhbmQga2VybmVsIGltYWdlIGFyZSBp
biBzb21lIGNhc2VzDQo+ID4gPiBzZXBhcmF0ZSBzb2Z0d2FyZSBkZWxpdmVyYWJsZXMuDQo+ID4g
PiANCj4gPiA+IFNvIHdlIGFic29sdXRlbHkgbmVlZCBzb21lIG1pZ3JhdGlvbiBtZWNoYW5pc20g
dG8gbm90IGp1c3QgYnJlYWsgVVNCIGZvcg0KPiA+ID4gZXZlcnlvbmUgZm9yIHRoZSBjb21pbmcg
MS0yIHJlbGVhc2VzIC0gYXQgbGVhc3QuDQo+ID4gPiANCj4gPiA+IFRoYXQgc2FpZCwgdGhlICIy
IExUUyIgaXMgY29tcGxldGVseSBhcmJpdHJhcnkuIElmIHlvdSBwcmVmZXIgdG8gbGltaXQNCj4g
PiA+IHRoYXQsIHdlIGNhbiBjZXJ0YWlubHkgaGF2ZSB0aGF0IGRpc2N1c3Npb24hIEUuZy4gSSB3
b3VsZG4ndCBhcmd1ZQ0KPiA+ID4gYWdhaW5zdCBzZXR0aW5nIHRoZSBmbGFnLWRhdGUgYnkgdGhl
IGVuZCBvZiB0aGlzIHllYXIuDQo+ID4gPiANCj4gPiANCj4gPiBJIGRvbid0IGtub3cgZW5vdWdo
IGFib3V0IHRoZSB0aW1lbGluZSBzbyBzdWdnZXN0IGEgZGlmZmVyZW50IG51bWJlci4NCj4gPiAN
Cj4gDQo+IElmIHdlIHBpY2sgdGhpcyB1cCBzb29uLCBhbmQgdGhlbiB0YWtlIG9uZSByZWxlYXNl
IHRvIGNvbnZlcnQgYWxsIHRoZQ0KPiBEZXZpY2V0cmVlIHNvdXJjZSwgd2Ugc2hvdWxkIGJlIHJl
YWR5IHRvIGRyb3AgdGhlIGxlZ2FjeSBpbXBsZW1lbnRhdGlvbg0KPiBhZnRlciBuZXh0IExUUywg
aS5lLiBieSB0aGUgZW5kIG9mIHRoaXMgeWVhci4NCg0KT2suDQoNCj4gDQo+ID4gPiA+ID4gDQo+
ID4gPiA+ID4gVGhlIGFsdGVybmF0aXZlIGlzIHRoYXQgSSB0cnkgdG8gZ2V0IHRoZSBtaWdyYXRp
b24gY29kZSBzdWdnZXN0ZWQgaW4gdjMNCj4gPiA+ID4gPiB0byBhIHN0YXRlIHdoZXJlIGl0IGNh
biBiZSBtZXJnZWQgKHJpZ2h0IG5vdyBpdCdzIDZ4IGxhcmdlcikgYW5kIHRoZW4NCj4gPiA+ID4g
PiBrZWVwIGludmVzdGluZyBpbmRlZmluaXRlbHkgaW4gbWFraW5nIHN1cmUgaXQncyBub3QgYml0
LXJvdHRpbmcNCj4gPiA+ID4gPiAoYWx0aG91Z2ggUm9iIEhlcnJpbmcgZGlkIHJlcXVlc3QgYSBm
bGFnIGRhdGUgb2YgdGhlIG1pZ3JhdGlvbiBjb2RlIGluDQo+ID4gPiA+ID4gdjMgYXMgd2VsbC4u
LikuDQo+ID4gPiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiBBbGwgdGhhdCBzYWlkLCBpZiB5b3Ug
YmVsaWV2ZSB0aGF0IHRoaXMgdHJhbnNpdGlvbiB3aWxsIGJlIHF1aXRlDQo+ID4gPiA+IGRpc3J1
cHRpdmUgd2l0aG91dCBwcmVzZXJ2aW5nIHRoZSBsZWdhY3kgZHJpdmVyL2R0cywgdGhlbiB3ZSB3
aWxsIGRvIHNvLg0KPiA+ID4gPiANCj4gPiA+IA0KPiA+ID4gV2UgYWJzb2x1dGVseSBuZWVkIGEg
dHJhbnNpdGlvbiBwZXJpb2QsIHBlciBhYm92ZSByZWFzb25zLiBUaGUgbGVuZ3RoIG9mDQo+ID4g
PiBpdCBpcyBhbiBvcGVuIHF1ZXN0aW9uLg0KPiA+IA0KPiA+IE9rLCBidXQgYmVmb3JlIHdlIG1l
cmdlIHRoZSBuZXcgZHJpdmVyLCBkbyB3ZSBoYXZlIGFueSBwbGFuIHRvIHN1cHBvcnQNCj4gPiBk
ZXZpY2VzIHRoYXQgdXNlIGV4dGNvbiBpbiB0aGUgbmV3IGRyaXZlcj8NCj4gPiANCj4gPiAoQXBv
bG9naWVzIGlmIEkgaGFkIG1pc3NlZCB0aGlzIGRpc2N1c3Npb24gcHJpb3IuKQ0KPiA+IA0KPiAN
Cj4gWWVzLCBteSBpbnRlbnRpb24gaXMgdG8gdHJhbnNpdGlvbiBhbGwgZGV2aWNlcyB0byB0aGUg
bmV3IGJpbmRpbmcgYXNhcCAtDQo+IGluY2x1ZGluZyBwcmUtdHlwZS1DIG9uZXMgdGhhdCB1c2Vz
IGV4dGNvbi4NCg0KT2suDQoNCj4gDQo+ID4gPiANCj4gPiA+ID4gQ2FuIEkgcmVxdWVzdCB0aGF0
IHlvdSBtYWtlIHRoaXMgc25hcHNob3QgYXMgb25lIG9mIHRoZSBmaXJzdCBwYXRjaGVzIGluDQo+
ID4gPiA+IHRoZSBzZXJpZXMgc28gcmV2ZXJ0cy9naXQtYmxhbWVzIGNhbiBlYXNpbHkgYmUgdHJh
Y2VkPw0KPiA+ID4gPiANCj4gPiA+IA0KPiA+ID4gQWJzb2x1dGVseS4NCj4gPiANCj4gPiBUaGFu
a3MuDQo+ID4gDQo+ID4gPiANCj4gPiA+ID4gQlIsDQo+ID4gPiA+IFRoaW5oDQo+ID4gPiA+IA0K
PiA+ID4gPiBTaWRlIHF1ZXN0aW9uOiBmb3IgU25hcGRyYWdvbiBsYXB0b3BzLCB3aXRob3V0IHRo
ZSBjb3JyZXNwb25kaW5nIGtlcm5lbA0KPiA+ID4gPiBhbmQgRFRTIHVwZGF0ZXMsIGRvbid0IHRo
aW5ncyBicmVhayBlYXNpbHk/DQo+ID4gPiANCj4gPiA+IEl0IGNlcnRhaW5seSBoYXBwZW5zLCBi
dXQgbWFpbnRhaW5pbmcgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkgaXMNCj4gPiA+IHNvbWV0aGlu
ZyB3ZSdyZSBzdHJpdmluZyBmb3IuIEFzIHRoZSBEZXZpY2V0cmVlIGJpbmRpbmdzIG1hdHVyZSwg
dGhlDQo+ID4gPiBlYXNpZXIgdGhpcyBpcyB0aG91Z2guDQo+ID4gPiANCj4gPiA+IE9uZSBleGFt
cGxlIHdoZXJlIHRoaXMgaXMgYSBwcm9ibGVtIHdpbGwgYmUgY2xlYXIgaGVyZSwgdGhhdCB1c2Vy
cw0KPiA+ID4gYXR0ZW1wdGluZyB0byBib290IHRvZGF5J3Mga2VybmVsIHdpdGggdG9tb3Jyb3dz
IERldmljZXRyZWUgYmxvYnMgd2lsbA0KPiA+ID4gbm90IGdldCBVU0IgLSBiZWNhdXNlIHRvZGF5
J3Mga2VybmVsIGRvZXNuJ3Qga25vdyBob3cgdG8gbWFrZSBvZiB0aGUNCj4gPiA+IGluZm9ybWF0
aW9uIGluIHRoYXQgZGVzY3JpcHRpb24uDQo+ID4gPiANCj4gPiA+IFRoaXMgaXMgdHJ1ZSBmb3Ig
YW55IGhhcmR3YXJlIG9yIGZpcm13YXJlIGludGVyZmFjZSB0aG91Z2gsIHNvIHRoZXJlJ3MNCj4g
PiA+IG9ubHkgc28gbXVjaCBvbmUgY2FuIGRvIGFib3V0IHRoYXQgKGFuZCB3aGF0ZXZlciB0aGF0
IGlzLCB3ZSdyZSB0cnlpbmcNCj4gPiA+IHRvIGRvIC0gZm9yIHRoZSBzYWtlIG9mIHVzZXIgZnJp
ZW5kbGluZXNzKS4NCj4gPiA+IA0KPiA+IA0KPiA+IFJpZ2h0LCBmb3IgdGhvc2UgdGhhdCBtaWdy
YXRlIHRoZSBEVFMgYW5kIGtlcm5lbCBzZXBhcmF0ZWx5LCBicmVha2FnZQ0KPiA+IHNob3VsZCBu
b3QgY29tZSBhcyBhIHN1cnByaXNlLiBBcyB5b3Ugc2FpZCwgdGhlcmUncyBvbmx5IHNvIG11Y2gg
d2UgY2FuDQo+ID4gZG8uIEkgd291bGQgZXhwZWN0IGZvciB0aGVtIHRvIGFsc28gaGF2ZSBjZXJ0
YWluIHByb3RvY29sIHRvIGhhbmRsZSB0aGlzDQo+ID4gd2hlbiBpdCBoYXBwZW5zLg0KPiA+IA0K
PiANCj4gTm8sIHRoZXJlIGlzbid0IHJlYWxseSBhIHByb3RvY29sLCBnaXZlbiB0aGF0IGluIHRo
ZSBEZXZpY2V0cmVlDQo+IGNvbW11bml0eSB3ZSBnaXZlIGEgcHJvbWlzZSB0byB0aGUgdXNlcnMg
dGhhdCBzdWNoIGJyZWFrYWdlIHNob3VsZG4ndA0KPiBoYXBwZW4uIChJbiB0aGUgc2FtZSB3YXkg
YXMgeW91IHNob3VsZG4ndCBoYXZlIHRvIHVwZGF0ZSBCSU9TIG9uIHlvdXIgUEMNCj4gdG8gYm9v
dCBhIG5ldyB2ZXJzaW9uIG9mIExpbnV4KQ0KDQpJIGRvbid0IHRoaW5rIHRoYXQncyBhIGZhaXIg
Y29tcGFyaXNvbi4gSXQncyBlcXVpdmFsZW50IHRvIGNvbXBhcmluZw0KdWJvb3QgdG8gTGludXgu
IEl0J3MgdW51c3VhbCBmb3IgdWJvb3QgdG8gbm90IHVzZSBhIGNvcnJlc3BvbmRpbmcgRFRTDQpm
b3IgdWJvb3QuIFJlZ2FyZGxlc3MuLg0KDQo+IA0KPiBUaGF0IHNhaWQsIEknbSBhcmd1aW5nIGlu
IGZhdm9yIG9mIHN1Y2ggYnJlYWthZ2UsIGFzIHRoZSBwcm9ibGVtIGlzDQo+IGxpbWl0ZWQgKGFu
ZCB3ZSBnaXZlIGEgbGl0dGxlIGJpdCBvZiBncmFjZSBwZXJpb2QpIGFuZCB0aGUgZmFjdCB0aGF0
DQo+IHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIGlzIGEgZGVhZCBlbmQuDQo+IA0KDQpJIHJl
YWxseSBsaWtlIHlvdXIgcmV3b3JrIG9mIHRoZSBkd2MzIGhlcmUuIFdlJ2xsIGdvIHdpdGggeW91
cg0Kc3VnZ2VzdGlvbi4gSSdsbCBsb29rIGZvcndhcmQgdG8geW91ciBuZXh0IHZlcnNpb24uDQoN
ClRoYW5rcywNClRoaW5o

