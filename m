Return-Path: <linux-arm-msm+bounces-29531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0B295FE9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 04:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A34451F21D20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 02:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369389479;
	Tue, 27 Aug 2024 02:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dyDpRwWW";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LvwRArG3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="TkB32XQF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D414C83;
	Tue, 27 Aug 2024 02:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724724005; cv=fail; b=NqP+5N8gmcjaEIXGI/9YBEeO6n7xmWUOutYbgOcbyZ7wURD3aDXw98str4pE3etRWLBiWTiwztXEQCKL+Q1ycnkgIwfOM2xXXZpMVhOXrBlyo61j/iK2gP/Ne3h+DgQ71hLcsQnBpYKHuFyxFglmC1sO/qm7b87crLFQ5Oum880=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724724005; c=relaxed/simple;
	bh=6yYwaSqGxv66gByOl6M1Qoogl+fWRe0H7tuClHmH7T4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pcJP6PQuRwbML9Sen0Vx1QQ2EpdGHmXbKAVNgupD3MNhPmkswF7kXwFp5qT2xg/ovSm7ibJR8uzf3+JtWOWVen9F5MhWGWuoxwo6txOD4bHFrxTSG/XdIG96MBLoXLcrVCTd8R53KrEFheC1/AP1905+PV+N0YZ3KSM0065GkOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dyDpRwWW; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=LvwRArG3; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=TkB32XQF reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47QKQ9Mq019939;
	Mon, 26 Aug 2024 18:59:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=6yYwaSqGxv66gByOl6M1Qoogl+fWRe0H7tuClHmH7T4=; b=
	dyDpRwWWUj5xit8C8iKs2/rwj40KZQYd9PK/bCiLuF8swrC9aVZ4EOY3xbPPFPH1
	WfYV2SfdMYx55uuF/Wu8S4IVq4+9IQ6Wz3QK8mr5hUuOhUICfdugpr6rSe+e38/D
	oKubB+M/qc5VeEusQ1qlFpgcI2cgIGb8u/wyuY7tQriTZSSTc9fwrdNa7b0VLQw7
	qPG+K/29yrTzklddz8tGNc/a+VcOQkuW5lWpwygOMtHPJxVN2LlpvYmd7Mafrvlt
	x0p1gjnbkZvWcN+i6tcV/ZlSYcZ8htXzfB06IoOarwS1SLKNBkkk6vCrHaa43YO2
	T4Y5NbeNeWMjLPaRCIDqLQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 417ehq2hpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 18:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1724723983; bh=6yYwaSqGxv66gByOl6M1Qoogl+fWRe0H7tuClHmH7T4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=LvwRArG3kEMHqcLJngAF4IjW9+PcvBXJ+kmWdE4SSj/0Nym0MBR0Fu5WaY10d/yse
	 9sUk3EOUk+YTBA+0B1UkInJIjmFFcOhv09xjylVyTmdsq0sgwPCrQ54QEGxJHTD7CE
	 lFQhaITj1U8P3f63MkOMPJIdoHzDQ8Giza63n7+FEG/O3VepQNPOH4c7YKKBZokMXK
	 jxFevK60331s5tC6YkSW/HsoinxDw5pKOtsmlQA0C+4d36q4Mm7pXO22rxjw8YwgxA
	 BADHbAQuQTBlQRxTb5IrUeHaaUILi/DyaEr72bb2+D9lcq051+ooCq23fujdEKB8DT
	 H5s7x66utTC4A==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 340D440351;
	Tue, 27 Aug 2024 01:59:43 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id D0394A00B3;
	Tue, 27 Aug 2024 01:59:41 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=TkB32XQF;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 684A1404D0;
	Tue, 27 Aug 2024 01:59:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pAjweK4/Wp9gJTXjRnekG2sI/IjH51xiGcdFB8xX0Vp90hdEQnI7yk9IkRPu/mEs5KE21g0bv8hhtkbCIVp9PQVAuaj/DHZeuBQekYL/vQ679h6nNr3Pye1uHRcW0HvYvzjN4idn+wfmC3mrTIww4RvMiyQ9u80v8pPKo/W/53HOK8JESWwUNtQVJkfP/N7puauRsDcHYV0Un/INcAG6cNRotdo6WymPsx82TF9UvyrSai4zihCzIcfT2sB3Zmy9Md0Qgkk1LizBUzBgCBaC9st4SCkfyEBWMJ6g4SspFhxDpI3t28hFuDYgnDLJ/aetYXBburCpqNn2gDZ1LJ8bCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6yYwaSqGxv66gByOl6M1Qoogl+fWRe0H7tuClHmH7T4=;
 b=Z/kZ82kYcFiq7jehUXQQ5enQoc+8QqfLvShODc3N83ZEQZT09SfzUfKJQyXdcSGjUDUNIxpJW9XFOvSAnIpMz1xaSG/uovHQ6EbVkkc05WotFaDm9uxb6KpYXihqlAW5JdWwEBchyAsRkutkM2MagKMZdNRq/bN+jH654vu0HsOjRMci9PHFeAyPYabxjKBwLlmdDZiAmfUXj05XZjtl5oOKJ2APsUQBAQ6DhuCuKCeLF7SEOqZLuR051dJy+J9xJ4n0cXnrwFtYTbRjIjJT3kj98GldTxg+j0Fyo+xLiEC3L+giR5U3txXv6ZS8xbevv20CwivzRZWwHZmjIGix+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6yYwaSqGxv66gByOl6M1Qoogl+fWRe0H7tuClHmH7T4=;
 b=TkB32XQFTYhDE6ILHMy+FDY+bhd4zaP0LO/utFqLI9RfGR86+Go2M06KY4Z2An3k5nuoNI/mewaIgatnydUvn+pwuYOdIGWumZk8Z8AWYXcPo+RuRpEEl0mjJ5jnAhASBt/IlmNu5wTiFalKEIl9L8tf/vt86mystc0/8mQ/Gtc=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH8PR12MB7135.namprd12.prod.outlook.com (2603:10b6:510:22c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.23; Tue, 27 Aug
 2024 01:59:37 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 01:59:37 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Patrice Chotard <patrice.chotard@foss.st.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Michal Simek <michal.simek@amd.com>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 00/11] usb: dwc3: various cleanups
Thread-Topic: [PATCH 00/11] usb: dwc3: various cleanups
Thread-Index: AQHa7jXDHduLG5TQ00KMcUORIuy3G7I6bRyA
Date: Tue, 27 Aug 2024 01:59:37 +0000
Message-ID: <20240827015935.bzv6nevcd7ec2uu2@synopsys.com>
References:
 <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
In-Reply-To:
 <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH8PR12MB7135:EE_
x-ms-office365-filtering-correlation-id: b6713352-454f-4dc8-14fb-08dcc63be7fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Zkl5SDZDWE5qSWhBWWpqK3hFRVN4dTIza2o4WmRoNWRRaEZUUGhqU2dwVDhS?=
 =?utf-8?B?alU5MjVLaGZ0ZVpsczhBRGZNcHlYQ2tTY2RCQW5BazMvTlZjRHFqU0Zncksx?=
 =?utf-8?B?Z0xIK0RoZWszL0pYOXNwTEVuMTd6R3ptZVRsUDFBUENSTHgxN0swbmozVGw4?=
 =?utf-8?B?Yll0VDZMR1lqTElJZzVNVllUMXNwYitSV2szeTFIcGhiNWtPNWU5QzdKb3Bu?=
 =?utf-8?B?MkJUR0phaVdQM0g4SHI5aDZpcStQU25qbG12Mk0yckJhenlPYjdnZzJHUXRQ?=
 =?utf-8?B?Mll6Vkp0VnRnU1dmMEY1RDhnR2oxU2VnZXZZajJ1RHV2QmF4d1VGZERJRDR2?=
 =?utf-8?B?REQ4YitmTXovb2RDa1NTbGZQTWNzaGxuVkRmcXVQUzlqS0RuWVYrWmZkdzJ1?=
 =?utf-8?B?anJGTXhtb3p0WHpGa3Qzc0NEVDFuTzFIQ1FzbWk4K0JVWVZFK1hRNUJNTy9E?=
 =?utf-8?B?blJxWEdUc2w2TTVtekpmbzduNzJOZndnQm9WYXV3b3NYa3o2UmRNbWtVcTBz?=
 =?utf-8?B?bWFVdnlWWDZwN1B4RklKaXVWYi9pUmk5bFdsUzNGUVorbjJpR3JUT3RFWjdF?=
 =?utf-8?B?R2FXZTRsN3FORXErcU1OeWttMk5Pc1ArYytaOTNsenkyRnZiUkhCRlphbmxr?=
 =?utf-8?B?ZGQvelVrdXVYb28yOVM3ek5Ybi9PY1dWK1daeDh2VzZxUUl6b1FFTHZqZEQy?=
 =?utf-8?B?MDBlNjYwMU56dERDMktkMSt3RkF1bFQ5dkpJQm5XWUtYZ0tCSDJLOFBGV0c5?=
 =?utf-8?B?OXBMZkk1WDdFbHRvOWU0VlU3cnFlalVtQXZ0dys3azRGeDlvNFhJY1VIVGRn?=
 =?utf-8?B?OVJVV0xHOHpkU0o4ZFo3bHJKL01BMWhhZW9tNndOYTI3WU82S2JqN2tWVGdD?=
 =?utf-8?B?SVBYR1dicWxqd2lWbTdaWWVIbGN5U1daNWtSME92RGdMQ2Myc1RDUkZBU2tW?=
 =?utf-8?B?UFdBVldmTWMrczEvMWowOVNVaFdlMk1Id3NSSitGWW10c3BLTVR5dUFzNUhF?=
 =?utf-8?B?b2dEOUdRczlpMVB3K1dEcTlMSlpVVnRzcjVHcUNXNTFWcDZGdERndDZ0MFl0?=
 =?utf-8?B?dUJCbVFyVFRSWUFnZmswOTNLeUpZTmcrL2Rab2JyaWdLOTVZZnE4S0s2YkRp?=
 =?utf-8?B?TVEzV29yNEt5U01sVldtNzVrL1Jralgza2REbEVZMVFCVkhTSVFCd3JwY1Rw?=
 =?utf-8?B?VW1qZXpUdTk3V1hGSE15Q0w2MGs2ZUJJWitQeEkwNFlBUkM0eFZHUncva2Np?=
 =?utf-8?B?K2MxZlA5U3ByYXhyT2ZrUVNBeUZsaEZCMGpiL25nMURhMURtNUt1ZU52SzZZ?=
 =?utf-8?B?dHNqL2puMGJhZ0NvMmpIbzlCTkQ5NHNUald2ZUI3aDF1ajhoS3YrRDdKMlN5?=
 =?utf-8?B?V1dmVXM5RHF5MHp1L0FhdkUzMkxDa3l0MjFaNUR1WTcyK1VNYmpHZ0dDYnBt?=
 =?utf-8?B?UUFzWndVNFkrQzlqYytPYUs0N1QraGFCbVF5QnhDU3hZNVRqQTc4TlRHVmFp?=
 =?utf-8?B?U21STUFzWW9ZSWJRVjhEelVOZFhmUWlpZThUa1l5bDdxYURrUVlpLy9VNytV?=
 =?utf-8?B?WjRJSzRucStTeWVLUC9ETU1OSXJhd0hLUWY4YnU1MjJpdGx5UVEydVdlQzkw?=
 =?utf-8?B?UG1PM0M3K0wvU05KNWNWZktxTWpjYUVSRlR5aEhDbVdDYVFBdDhUUEU3T2ln?=
 =?utf-8?B?U2JWd2loWCtubWl1Y3U5b3JROEV5REo2VUdYTmJlUnhnN0VWcG1SMDhVUEg3?=
 =?utf-8?B?RWRzSk44eXYrL1E1SXNnNk5hWmc2V3phOE8vdGR2bUJ1czJoM3ZwK05vb0FY?=
 =?utf-8?B?OWNqYXlNNFFCa0tTZ2xsL1VqSk42V3BmdkpFOTVGYmJEU080THpRcE13K1Q3?=
 =?utf-8?B?dmJsNC9JdllkZnFKMi81aFJoMTlSM0ljK2JTbmRleGo0d3c9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VjljbE9Wc2VVb3FrRWdtcnE3MEJGK0s2SzdENVlrQitmZDRjb2NxaUp2ZEov?=
 =?utf-8?B?K3pkVGZBbEwybmdYSnMrblErT2Npb25DQ0pidGpkS2hrdXFuRGhwa1ZKSGlw?=
 =?utf-8?B?SHpLbkZHckRocHdrSTh6am01alBGcENESjZOTmJjdVM4dG94NFBhY2lWUUx5?=
 =?utf-8?B?ZVFBa3hNZzVVR0tuYXY5QjhhQU5BZ2ptNEoxYW5UZEl6WTg5TW1uelEzUjRi?=
 =?utf-8?B?MWtBMjJNWFVyVlBrMWdwUENNUm95YlNJamkxbldRZE4rYnhxSFREVzdqeEMw?=
 =?utf-8?B?ZXRiRjdIMDJQVmQrZURNZ2h5L0x2NXZKK09HTjdOOENxTmVTTEMxUWYvbGhY?=
 =?utf-8?B?NjczZkVXaldUWG82NDBneitkZE81Ni8wVmRkZzVORkhEaW94UDBkZHV1RTZk?=
 =?utf-8?B?NjFITytyOUxrQjJDQjdMa2dBOFJ3U3hmNXE5Q2JCTUFYZ3JQYlRoaWxRUmY0?=
 =?utf-8?B?NlNwMlA3VTMwM3Z4UkVoR0Z3bnRxcC8wbCtJRjBha1ZqRDhiSDhxV1BYOTc5?=
 =?utf-8?B?OG1Db2VtOFRRVjMycC9RMnAzSm5VS0FRMUZqMnFmWGt1cUpzWVdEcWJaTlBH?=
 =?utf-8?B?bWZBemROZk9Tbm5kU0N6YVAvYUZGelg1YURDajZiNXg2UUhyRW5KWWsrUE00?=
 =?utf-8?B?WkdvL1ErTlk3dlQyL2FRR3VvZk9jdHplODdyLzBFM013NG5uZmc1K05hQ1c4?=
 =?utf-8?B?V0dVUTg1SEttdFJWaUY3VVJ0Vmo1Zk5TODlQVjl5UXEyQ0d2c3c2UURxUk0z?=
 =?utf-8?B?TU5iZGtkd2M4SmdENzdrcW8vcFBQU29BNE5iZGRybGVGVzB6TnBrWnNQRTZz?=
 =?utf-8?B?dzFNWkNKVms5SlJ3VFc0UzhOek1tOGk5TUVTWitVd1FGeDlibWdOQjY1eTVC?=
 =?utf-8?B?Qlp4bGd2Z1RkYWFTMHlUdkdRdzFGRE5DaVVIT1N0WHYrNllCbmMzc1FOMTBU?=
 =?utf-8?B?RStkZnRDaERjQUZUSDN4SzIrNVdNU3BYUDIzOFBHUEhGc3JMNDZvUzJGUmdv?=
 =?utf-8?B?dDNoUVJoN0RQM0NidU9vbHNGWWJZMWQ2b3RZN2dWVFVMMU56MHY2Zmc0d2dE?=
 =?utf-8?B?dFRoNDlNL0ZoQ2RpeGw4TXNQS0x3anhQNjBzTUMrOUNHUEJIVFZxdUQ1eFl5?=
 =?utf-8?B?VVVUeXlqdzdJRktEQU8vSk1LMXQ3Sk5mWlZrSGRNSFZqNDV0ejhua1Fpb045?=
 =?utf-8?B?M0prWEx1dEwvNmp3V0wzZTJiQm5qOThwckx4NmFhVGwrN2VldzMrSkR2UVhU?=
 =?utf-8?B?TG1mSDVNdGhYUExDRHFDK3Q4NGdiU3pNeW01cjNYc3N5MFZtRzBFOGFmMHhh?=
 =?utf-8?B?UUVCMHloaXpYV1pGMzQxc3d1bnFTYzgyTWF5YU92RHlOTk9IS2x5aytBRjlI?=
 =?utf-8?B?OFVqYUpQSktwQTNhM1hvWk9keUpZWVBYR2JkbFdVNERlQ3JuaVNtQnBQT0xM?=
 =?utf-8?B?TjZqWmxyWVA4dU5YQ094QmkzQ25VTjJPb1B1L0JNajRGbFAyTVl1dCtNd1FC?=
 =?utf-8?B?bE1MalgzN05CWFNPUnBnb0JsWkdyNVV1WUkwV0srTXFtaDNuMzhRRWJJS095?=
 =?utf-8?B?dXMwNmpTS0wrZ0pPUVE0QzdxbHZERDREVFFCSDFMSXdZMTZXVnE1dDhLV2l3?=
 =?utf-8?B?dW1ydU9BdVR6a29LRGNjTWQzSmcyQjFxWno1bDQrbVk4em9DTnJndFpnRnpp?=
 =?utf-8?B?TFFveW9Dc0RvY2h3d3ErenJDRHJTV3pjUXhTYk1qVGNtUEc1NzVrbzYwOE9s?=
 =?utf-8?B?c1JUSmgySFkzN05pdEsyUzFjaWgzWEVSR2lnZWRRSk0vVHdOL1JaVWF6c3RR?=
 =?utf-8?B?OHhzeVd6elk1TmI2L01KL2sxOHdOUUM3T0hEWGg0a216YldzK0kzK1Z4RXVW?=
 =?utf-8?B?aEhnUC9vZ2dFVHJVNElneHpLYXEzL0FKemIvNTVqdjF2OEFsdHhrMXJWOFdH?=
 =?utf-8?B?TUZ0RWRqV2xZS01paVNnSWxJbU1mTWNYQWI1MFZ0aFMwTTRlTnBBcUc5V2hT?=
 =?utf-8?B?SDREV2JKVkR3YWlONWp6dWc2QkY3RGwwTjF1ZlFJWFlmc1Z6VjF5SHNydXdX?=
 =?utf-8?B?VFlqTWlONHhTeldRZkFzWTVPdHlOTXpPQ2dGNE9KYW01Q3FMcWlFVjhvM2Fo?=
 =?utf-8?B?dW12Q2JqYTVsQXJCaG1ZcmhSbXVuWHhRellBRGRiVGFEMkI2RGl3UWdwTFJh?=
 =?utf-8?B?UlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C5E56A3C09B0404C9AD2C0145FA017A8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PR/8eoU0DFJnvmpBM+Yj9GkED+hNmdcqa9IcSGF7lwOblQPON23t7NxIFbxdbann5c5lH+qC0k5reRgsB6+W8qAKxznR4Bcvy6c5KGgLeGJ5VAeeGHCYMjc1oV1UyRIF+R9Er95Jwh/PkB0nkl9HLRhtz7ZOWyQ2TS08XXsV8cknHabl7XkoJSBp0CzYkxIOXl2dHZtUYGNUJlbJs/6kK0q5PQcosHuEtxm2F55nFA/kZmDkCN3r0SJS3+RYuCQlYD5j4h8W3SaNujwpNf985Tny4VJdnsufJF5FbqLrvVIm+J3WQT2vAqv6pDpqL9mkX9ZvGiYhvXrKz8jIJIJcRqbzBRnYuR7F/A4DVaAPQCvcXn2+8h9DnfbCk+yjSogKwbA+bMDfn0ZWdWr/EksyhfqThfHJkLEzx0jbSAdCVwkAl8+Nv+m0CKk6+pqDuRLNQfKJWVk1TmPOP8pqkgu57a7/Eb4+k+LeOXb7U2mtX5tJibCFysofxvajQcj7A/U+Fhu1TBvgBgx2oiU8WKk6uDDYnfZ/9sE7AP6HJvuaiiaHK8lJGWxTkO0h4Odo0QnY4rbVubFcxEFNX7+jLDtcd74ZlYT4LqHQe1aRE5dxpuB8iCq19W/6DVp5tAOCEwmt+Uz69mhjyG1vRoR85ZCbRg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6713352-454f-4dc8-14fb-08dcc63be7fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 01:59:37.6536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8I1FHy+MJjBJTFSTar0KbYYYfgrYzdeLOwKf9JAg5G6sDMBHI2Db/OF4Tl2fPoFV0y93s5p3Idu91abhNPf9lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7135
X-Authority-Analysis: v=2.4 cv=YIHNygGx c=1 sm=1 tr=0 ts=66cd330f cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yoJbH4e0A30A:10 a=nEwiWwFL_bsA:10
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=SX5xuYQnC9Zz6yTCQkgA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: MgwqbrNP7yEcJ3IavSqLmcAyIG2bcdmb
X-Proofpoint-GUID: MgwqbrNP7yEcJ3IavSqLmcAyIG2bcdmb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_18,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 mlxlogscore=238
 lowpriorityscore=0 adultscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408270013

SGkgS3J6eXN6dG9mLA0KDQpPbiBXZWQsIEF1ZyAxNCwgMjAyNCwgS3J6eXN6dG9mIEtvemxvd3Nr
aSB3cm90ZToNCj4gSGksDQo+IA0KPiBUaGUgZmlyc3QgU1QgcGF0Y2ggZGVwZW5kcyBvbiBteSBm
aXg6DQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvMjAyNDA4MTQwOTM5NTcuMzc5NDAtMi1rcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5v
cmcvX187ISFBNEYyUjlHX3BnIWVGenQ1NHBZU0VsOHdydnJIN3lRU3dGUnpib2puUlN5ZWxuWWp4
bFk4UlphVTZvWkNWZXVpMmYtREhRMGJrOEZkeTZndkpvU1dMZUFQejJ3XzNGOW93bk9GTEdVb3lI
ZCQgDQo+IA0KPiBTZXJpZXMgbWFrZXMgc29tZSBjb2RlIHNpbXBsaWZpY2F0aW9ucyBhbmQgY2xl
YW51cHMuDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPiANCj4gLS0tDQo+IEty
enlzenRvZiBLb3psb3dza2kgKDExKToNCj4gICAgICAgdXNiOiBkd2MzOiBzdDogdXNlIHNjb3Bl
ZCBkZXZpY2Ugbm9kZSBoYW5kbGluZyB0byBzaW1wbGlmeSBlcnJvciBwYXRocw0KPiAgICAgICB1
c2I6IGR3YzM6IHN0OiBzaW1wbGlmeSB3aXRoIGRldl9lcnJfcHJvYmUNCj4gICAgICAgdXNiOiBk
d2MzOiBzdDogc2ltcGxpZnkgcGRldi0+ZGV2IHVzYWdlDQo+ICAgICAgIHVzYjogZHdjMzogaW14
OG1wOiBzaW1wbGlmeSB3aXRoIGRldm1fY2xrX2dldF9lbmFibGVkDQo+ICAgICAgIHVzYjogZHdj
MzogaW14OG1wOiBzaW1wbGlmeSB3aXRoIGRldl9lcnJfcHJvYmUNCj4gICAgICAgdXNiOiBkd2Mz
OiBpbXg4bXA6IHVzZSBzY29wZWQgZGV2aWNlIG5vZGUgaGFuZGxpbmcgdG8gc2ltcGxpZnkgZXJy
b3IgcGF0aHMNCj4gICAgICAgdXNiOiBkd2MzOiBxY29tOiB1c2Ugc2NvcGVkIGRldmljZSBub2Rl
IGhhbmRsaW5nIHRvIHNpbXBsaWZ5IGVycm9yIHBhdGhzDQo+ICAgICAgIHVzYjogZHdjMzogcWNv
bTogc2ltcGxpZnkgd2l0aCBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UNCj4gICAgICAg
dXNiOiBkd2MzOiBydGs6IHVzZSBzY29wZWQgZGV2aWNlIG5vZGUgaGFuZGxpbmcgdG8gc2ltcGxp
ZnkgZXJyb3IgcGF0aHMNCj4gICAgICAgdXNiOiBkd2MzOiBydGs6IHJldHVybiBkaXJlY3RseSBh
bmQgc2ltcGxpZnkgd2l0aCBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UNCj4gICAgICAg
dXNiOiBkd2MzOiB4aWxpbng6IHNpbXBsaWZ5IHdpdGggZGV2X2Vycl9wcm9iZQ0KPiANCj4gIGRy
aXZlcnMvdXNiL2R3YzMvZHdjMy1pbXg4bXAuYyB8IDY2ICsrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYyAgIHwg
MTYgKysrKy0tLS0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLXJ0ay5jICAgIHwgNTIgKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMt
c3QuYyAgICAgfCAzOCArKysrKysrKysrKy0tLS0tLS0tLS0tLS0NCj4gIGRyaXZlcnMvdXNiL2R3
YzMvZHdjMy14aWxpbnguYyB8ICA3ICsrLS0tDQo+ICA1IGZpbGVzIGNoYW5nZWQsIDU4IGluc2Vy
dGlvbnMoKyksIDEyMSBkZWxldGlvbnMoLSkNCj4gLS0tDQo+IGJhc2UtY29tbWl0OiA2NGI0Mjll
YWYyMWJlODg4Y2M4M2U5MDEzZTI1ODk3ZDVmYjAzYTc1DQo+IGNoYW5nZS1pZDogMjAyNDA4MTQt
YjQtY2xlYW51cC1oLW9mLW5vZGUtcHV0LXVzYi05M2ZhZGZjNzdkMzMNCj4gDQo+IEJlc3QgcmVn
YXJkcywNCj4gLS0gDQo+IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lA
bGluYXJvLm9yZz4NCj4gDQoNClRoYW5rcyBmb3IgdGhlIGNsZWFudXAhDQoNCkkgd2lzaCB0aGUg
bWl4ZWQgZGVjbGFyYXRpb25zIGluIGJldHdlZW4gc3RhdGVtZW50cyBmb3Igc29tZSBvZiB0aGUN
CnNjb3BlZCBkZXZpY2Ugbm9kZSBoYW5kbGluZyBjYW4gYmUgY2hhbmdlZC4gQnVncyBtZSBhIGxp
dHRsZSB3aXRoIGhvdw0KSSdtIHVzZWQgdG8gcGFyc2UgdGhlIG9sZCBzdGFuZGFyZCB3aXRoIG15
IGV5ZXMsIGJ1dCBpdCdzIG5vdCBhIGJpZw0KaXNzdWUuDQoNCkJSLA0KVGhpbmg=

