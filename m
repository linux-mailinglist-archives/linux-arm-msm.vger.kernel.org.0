Return-Path: <linux-arm-msm+bounces-29522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D03C595FE42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 03:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50DED1F22C1D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 01:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7A5523A;
	Tue, 27 Aug 2024 01:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cNPG2/Wf";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="TFJXngPB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="d7rhQd97"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8FD4C83;
	Tue, 27 Aug 2024 01:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724722088; cv=fail; b=RJRC8WaECIjl/J8vJjSWj6TtbpbDlkQ0A+EnR4A7Cm9Er5hByoMGyAsIO8dFXhak2TRJ7Y105Axk2mFmR4WiWZ8nGlDCZuGtz5RB31VqUOL4tZzfGMdvJMHUC0pZDoHpC0rZsZU5R9vN8YDkXn2SZf9VVdCUJxaNXp2HJUUk+3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724722088; c=relaxed/simple;
	bh=dpcYP8dcAWR5OiVsFfu9TbcrlqVyymQ436VbfMysbb8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FDDrFOrmBhJ9UV6cE89oggOqCuA2PdEwRHGQOvBPv53NaKsV7wMRsYkuQ2u0BfqYvvQLTAAKn762EQsurAWhRBBdp2vlQ8lXZO3TR1fF8/TQwySzq5ZqNt25yNJB56Ts85G0rs3LMcCf1Vh/emBak3QCXhMhlE+n+/PGu+fMzic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cNPG2/Wf; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=TFJXngPB; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=d7rhQd97 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47QKQ9c2019951;
	Mon, 26 Aug 2024 18:27:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=dpcYP8dcAWR5OiVsFfu9TbcrlqVyymQ436VbfMysbb8=; b=
	cNPG2/WfKdxeFPyT8iOBm6+CMH2EpETnoQhbLk4Y32fBjDGwCfoKzZUK7XMUYiRo
	1NjqPCeBaDSGf587gwGnz1aFUO4vr63cBucXT7nz8gzH5t8j5nslDKq26xcV2rWR
	OMcZ8dabH1PQKmDYF4spxgzVYDLaa8lhxiupt9HAivrQaGduak8B5WyH9t7+D3BF
	9eiqpmF57mTOUwa5mT40sEey17RcZ4OZ0CbyLLYFddaESlUhPTAEDBoEJTyT+G+G
	pPJq3Fg65o1W54pQgoMAs5OKM49wsoQ304tQijHovQSOsRuVCG8LbGZjlU8GM8g1
	NsrK/7/OexYXEGTeKCwgmQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 417ehq2ehx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 18:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1724722069; bh=dpcYP8dcAWR5OiVsFfu9TbcrlqVyymQ436VbfMysbb8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=TFJXngPBioJDPgcxPNx3GcMCrgtrmzw4n7CHZ8rvp8IYQfVS4d1ocU61WYphBP7gV
	 vk0DGHTl10py8L23vScf/20kUImgjNsbRBMqQU/mWzQPjQf47tyvsflFZoS2JUapU4
	 hZ8VsHNcreSL4XapTuXDPG4VqHOsxwo8yHdJqPcYrTPOaBDDxaTgyxekdjn/oPVCm2
	 eh8plG/N3DeDou0wnDQH6tdFDTA3Sax5M1DSmOh2ETGH/X3ZqKRUpoKC1kzCjfokwD
	 E27qX6NmWxLHzjuukLJCAj9b1Ex8S9+ADICrClsKS7VB01TEzB9fjTfXET02vi8obu
	 6/SEa9PZuaGTQ==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2825140340;
	Tue, 27 Aug 2024 01:27:49 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 55B2FA0098;
	Tue, 27 Aug 2024 01:27:48 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=d7rhQd97;
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2047.outbound.protection.outlook.com [104.47.73.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1006E4048B;
	Tue, 27 Aug 2024 01:27:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w2AknX+AiiJvyvZ63hduQjh1JS6C+2c9VAJeED2OnWvLH74CGj4eFidV7y+hsI+nOzCBikVNXRphUDNCqhSt2JLMwPmbtxZQg2j9uNaQuqZ4yKcnnOm3EV99UFBDDRqdCJoj6DNJHZwD1EPPp5bXdRKkRt4XOWs/VgUbp7xpjziya0/JJaFVFW4MRSTVNkRlYxxu6FhDQhrGZz1c+B4kR8tbNUEU2DwGwGCMG8fy3/QDVSO361NO7t3g0629shSEortg7hUOpYf55KlDQSa5erK2f4qhEPPq4r5tMzHzV/0fLSVXgpYMz9krSrqeX+ygr44PtiXizyjFtEmzkAx2SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpcYP8dcAWR5OiVsFfu9TbcrlqVyymQ436VbfMysbb8=;
 b=iVKd2Y6e3tAFSkYIHhmZVm5+h+ruZHq4nzLjhaZ9+jIVMNJ+Foz21M4bJh7y8WBWPRXY6UYhC5P5mvaxcnk+9jIoYxKVKyRvXjMSYMFLJl3WOYHnz1wXyIo/T5J2Y3+w4ch8KosI6Ufcb/ttbBZ0i0G1WEfFq3KUNGPknIVMBtCsg8yW6ZK5A0g4WQw3PRIU8m8KGolVF75fSQHFY0dLzA7FNkiqxvQYIqxJfJZ6SzYBMQWbPuqIUfgYT8swblnZLGwTXcoJMWdam/+yb9W/Lxia1bkOYaMtSuEoOw94USrmwZio0wPdtXHNyaJJvwlnaHEzc55J7Om5uZlq/GS4Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpcYP8dcAWR5OiVsFfu9TbcrlqVyymQ436VbfMysbb8=;
 b=d7rhQd97CmbXkiRHrkIHnN77z6WLbpsUnsr+m+Lf8cRFKLzhFa60IVOnaG/Yhk3Kqn+i/BhykbWKMg1F4dYKdU8NZws0BBW+2ke19i2YOKiZlu7WsHBbd0ceooczH5Rle5k8wAmAi596BCY4z4tHrUyyWSiWHHF4f9cmmYtDEnY=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY8PR12MB7731.namprd12.prod.outlook.com (2603:10b6:930:86::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Tue, 27 Aug
 2024 01:27:45 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 01:27:45 +0000
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
Subject: Re: [PATCH 05/11] usb: dwc3: imx8mp: simplify with dev_err_probe
Thread-Topic: [PATCH 05/11] usb: dwc3: imx8mp: simplify with dev_err_probe
Thread-Index: AQHa7jXIck5vHar490WSNAYMKPzaVbI6ZDKA
Date: Tue, 27 Aug 2024 01:27:45 +0000
Message-ID: <20240827012741.43xkcl5ylbxce46q@synopsys.com>
References:
 <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
 <20240814-b4-cleanup-h-of-node-put-usb-v1-5-95481b9682bc@linaro.org>
In-Reply-To:
 <20240814-b4-cleanup-h-of-node-put-usb-v1-5-95481b9682bc@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY8PR12MB7731:EE_
x-ms-office365-filtering-correlation-id: 3412631d-2968-4b61-e570-08dcc63773f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Y1NlZG9RZWRTU09reVo2K28zdEI3TXpnVGlzMjJpa21CVTFPUWw5ZWpKL2Rl?=
 =?utf-8?B?cEg0R2JSOXF6YUN6MCs2eW9TWVgvZXBEVnlJMjg5eXN2bkwyZEhuQk8zbFo2?=
 =?utf-8?B?Q282N2xqRG40Y1NDWWppUUdKR2J5MnZyeGFwcEZzUk5NVE4rU1R6ZisyQVEy?=
 =?utf-8?B?YlhrZUwwQ0hLVmh3dzhMWG5aRDFZL1l2aFAxR1lXQXg0RjZMdGQycEx3S01u?=
 =?utf-8?B?alV0SkY0WStqUmNxWXFFU0M1N3BkVWNpcldmazgrZjQrR3dwRUhQM2hrNnh2?=
 =?utf-8?B?R3FlVzdjeWxmbHhhOGRQSlBIUWY4ZHQzL2IzRE16bzJGd2VMSXZpU1FwTDJ3?=
 =?utf-8?B?U0xrNE53Q3dOcGN5WVA1ZjlpZmdCOENyYjJoUFAwVVJURjRUQlllVlc4ZzF4?=
 =?utf-8?B?eVFDM2s0emNmTFFDcXBrWVdOVXMyUkZ0WHhCTE9oaVoyM3FyRjlvYmR5d3ZN?=
 =?utf-8?B?VnhDQkFYNHJuQlFNTUxlbWo0cEEvbmpFUnJ5QUdoQWpiU21OMnVKUFp6Q3dR?=
 =?utf-8?B?bVViSGV1ditTUnpkTWpzTk9xWUlOdDdBQldKb2xOdVpaS1BBQUZoVzZaZWFn?=
 =?utf-8?B?aWhiZXRlYXdwTUZMdEJCUFRZVFcxMnN2QXJQVk0yUUR2NnI0MVdWK3NiV2Ro?=
 =?utf-8?B?dm8yTW1FV290Z01KR1hEc0hOZHhvZVZWeGM0Sm1NSEN0WUZtekY3L0U0YzM0?=
 =?utf-8?B?N1QraVlRZGo4WS8wbzUxcm5IU01pa2xxSm9NZGtyclVlTTRDNk1OQnplNmVH?=
 =?utf-8?B?SWxhdTZKdUp5VjFNUGR1bGtFQVd5K1FPTUR3Qk1vK09xMGwwMUlseWtwcW9W?=
 =?utf-8?B?elZFREM2YWxIUjNqVTZNWkc3SUFOdTdiSDMxdGp0T21Nc3cra1IvUVhrVzZo?=
 =?utf-8?B?QzZyQ1pVdlBFRVdSSGhUczM4bmsrUWhaQitkaFNsa2p4YnBXY2ZmbWJyZnhv?=
 =?utf-8?B?R3o5ak42bmZsTzE2bk5WczNFWWlibUlLMStUQ3poTGZOMlhzNU9KUTVEdEtS?=
 =?utf-8?B?eXdkbmtOeVBwdzhWcHJXWG5Eck1uVktzaVdqMFE5bmtobnZXMHFPT24rdGdh?=
 =?utf-8?B?aGpibkZJVGU0cUplOEFlK2s2bHhFNVRsRDZ5NEE3eWtwb0N2UHdSZU5HU25T?=
 =?utf-8?B?ZitvYXJxbExoOGRZWE5HUjZEZzE3Q2VBcVZMdmZjVFV4RHZPMXlDdVJ5L3o5?=
 =?utf-8?B?dUZvSTR4bEtjMjBQL0twN1p6azl4QmthTDArYlZDMkpNVVB3MWV5MWJhbjlE?=
 =?utf-8?B?L0k4clBPZ2JXdXNvMmhpVi9FeWlMYm9DNDVSd3JZNC9HZnducW1IZiszbDU5?=
 =?utf-8?B?aXNVQm5ENnFuZk5YbmlDVGVCSmJVS1Z4T3VRKzJ5bng4dDNOeEFmWW1UamtP?=
 =?utf-8?B?NDhrVXl3RFZQcnliRU9YQ0c5TFY3QTFYaHQySzhQQ2FNOTVEYldHNWFuMG1X?=
 =?utf-8?B?QXlYdFowQTFSVlBWUFB1eG9SeGYxdktPU2FBWnowb21hK2g5QW5kb1hXTHlQ?=
 =?utf-8?B?U2xuWEN0NC9lMVVUWkNKd2ZNaDc3b2VzTzBaQlEzQWZocUFxd1lybEMzTTAz?=
 =?utf-8?B?WlV2RmcwZUZMd1ZTUzlTZ3NyakUzME9wQkZXMGlJRFNBeVFuRGNhd0tDcXRz?=
 =?utf-8?B?WmxEOU5nWG0wYUlJZDlFVjNYYld3OFJ0Uk5lQjVkWmlFYW9rNkd3WjRHUUl4?=
 =?utf-8?B?U0JPK3h6aWxlY3ZqZ2pzZHFKc3M2NTFRUnNYZmg1eWhyTGlCUk1IZWlBRmtp?=
 =?utf-8?B?ZFg1RWxKUkx1Z3dkcVhTVEI4c3ZuaXRzMmtmNTErTzkzMkttTTY3c1MvdFkr?=
 =?utf-8?B?d2VWZlo3cXZZRDhucy80WEpNOHR0NGRqR3JLL2RKeVhFMTN5bWxWSXlObXlj?=
 =?utf-8?B?Nmdma2xVYjNPQ092RWliKzI2aDEzajIrVjlHNHNVN2pMamc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eDliRUdkUng4NmMwdk12RnVraXNpNjZOTmdMS3ZFd3ZQemZZQnp5MWNoN3RX?=
 =?utf-8?B?bXdXYS9OU0dybS9OYTNKR1E4NWxwSzB1R29scWRlU1d1T2pkanlOY3U1T05v?=
 =?utf-8?B?RU95Wmc3MzhXMTBUck4xbFkvVzcwNWpKeUFic1BLMEFiSjhtRlo1TExzcWFP?=
 =?utf-8?B?Y0hVVm16UjY2c1Q5VWRZTzVJOXBBKzlFcVhTVE8waWJFWWxMeVJ6amQ2Tk9w?=
 =?utf-8?B?bDRNSWVXb0ltWTFsa1hkLzlDSlRKV2FucDZwOGJUK3BDTnlqaDJsVFJIeWd4?=
 =?utf-8?B?NGZpQ0V4U0hsN3JlL1NMd1RqblFJMUFZVEVjWVJEdzhJZjdmc1NXdTllcTNt?=
 =?utf-8?B?MnJpQmxibU9idktwQVpidkEwQ3Q2QXRiUlAvYnZDNWlVbks5QjVEOTNYdXVU?=
 =?utf-8?B?R2J1UmhMRDgyNUhGaVY1bC9hMTNGaEdRZWtPYnc2Sk8xV1pCTVpsOXJEenlk?=
 =?utf-8?B?RzArYnZlMmp4ZjBOd0JiWFRnbHg5RDN4alZCODRuK09HWWxkTE5SYldYZzNx?=
 =?utf-8?B?RnIxaDVkS1hqTzAyNVdhUC9OT2RKUURDTGpyWlI1QVJocWU2K2JVOE96UmVL?=
 =?utf-8?B?TWY4OHBPT2tzR1hXei95VSswUE1YV0huRE10akRUVUZsZ2QxL0ZaTytiL3pS?=
 =?utf-8?B?eFRQUFN1T2dOaU52Zk1LdlA1TkF2VDM1UkFST1d4U3lLYXVwR3VlRTYrR3U3?=
 =?utf-8?B?akdwOUQvbmw3eFNGTXVVdjZ1bWMwelBBbGhBTlRMblc0bm5UOU1hQTJyN2s5?=
 =?utf-8?B?NEd0NHJTNU1leUdiU21xL1dXZ0hTM0dZT0d3MDNpbTluenVSaXorS2VMOEhD?=
 =?utf-8?B?MkZKbWdPdkFWaXFBZXlrYWFPU2I5azdWaGw1WlVuY1c4NGgyMnFIcFNsZy9C?=
 =?utf-8?B?bXJxNmo1dm85UFZRQSt3RUw4eThrdndlMEs2ZzlUb0tZY3ZCRUZGcFhGSW1w?=
 =?utf-8?B?NmZ3VWJhTXFScEdzeHd5S0dKTG9RWWVGeDJORnNsdWIwSitOWEZtRldDUURO?=
 =?utf-8?B?VDExUzBpWW1BWkM1REFkcnd5ZVhVUG9uSG85cHdSbkd4UjFncE9vR0tVeklo?=
 =?utf-8?B?Y3lPRUg3Ui9rMS90d3NxL1ZJZXVXVmhmcU5SY2k1eTIxa255VytSNWJDKzds?=
 =?utf-8?B?aG9TWWg3TnZBMlRLMXFEUzFEM0tWUE1hZEpoZzJOMjBvZ2tOUmpNcUpBVkYr?=
 =?utf-8?B?d0xYSG9udlJLYXAzb0J3WnBzOGFtL1NnVzlsd2NVdzExdHpURVZ3cVRkTW1O?=
 =?utf-8?B?dmxQNi9ZNmFSa25QcUZqay9JdmNQUWhuaHJLcmlPcW5TN3dlS2wvdXNlcVpB?=
 =?utf-8?B?Q1JKV2h6dFhWY3B2S1AyNEIvaytKdS9ZeXFvZkpKMXRtbGVadkhaRWpWemJa?=
 =?utf-8?B?MFJOR1djRTN0eFovWDZpVFF6ZTQ0V0RlM0Q0NC9tZXJqc2hhYkdad1N6WEFV?=
 =?utf-8?B?NStRbHBwVVFYMUVCeWlHc0pDbVBEdjVzUGVSaW93bXBvb0NtQ3JYdFIzSGRD?=
 =?utf-8?B?V0hWYUQva3VXR2NidHNLbmRTWHowNmtIWTJ3cUx4aTZ6cnF3czYwcmYyaEdN?=
 =?utf-8?B?OE5BTzc2OE9HYWZadjF4VEtDeGtwdWlES2ZEN0pBSDE3S3JhQ1hvMVpJdjVX?=
 =?utf-8?B?V3VzQ28yV2ljQW5Pa2ZoRDQ0aElVa3BsaHJTZ0dXREU1eE9ONElRa2Y2UEs2?=
 =?utf-8?B?KzJuRnFtOFlKM1Z2dkRKSTlSYjJ5ZEtFeG9PTkxYOW5NaTFqOUc4am9UMFZF?=
 =?utf-8?B?WjBZd0VPVDlaMEl5eVUvWFlHY1dQVnM1MlY2d21nMnovZjBPbG1qMGFiTGpm?=
 =?utf-8?B?Mk4xaG05UU95THVwNDZPNGFGSGJPR1lVMnlnNmdGQWVBbnI3ckdDaXhybUhD?=
 =?utf-8?B?MVN1anNlNm5WUC9zVUtJRHRXcm15Y21GYktLYnE3dC9OVjVlT0NJQzczWVFL?=
 =?utf-8?B?NXpzcXhsNUxNaVZ6U0Z4eFoxcWo2aHg3OGZDVVJSSXMwZzZhSVNlcGRLZXE0?=
 =?utf-8?B?djE2UlB3OUVmWEEyRGlibmRaaVFHSUNVU09QRVowTjNIV3VPNW1xWU11bEFo?=
 =?utf-8?B?eEdFTWVCdEtRMEw0RXBUK29CRHJKTHphbHFaekx5aGRCcVVMY3NqSUlYeTNW?=
 =?utf-8?Q?ZXJVVQh2U1515l6/JwnMhOKS3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A298977C0AD0134EAD3687D62CA872C0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mHlLepXEzkNTSgXQQi14gHsl4x8EAwWoM0Xb9t+io5PgxnRYTMHs1yp5BP07G5IypGrssmJ4eyvxB1IXDaFT6wxibEE3l6DnoUTiwQWB5cq+UeCHERWUF/kGbFNyi2kOc30FHXKsAKgCjNlhJmCc94BFudp82+gpsvSphJWJdZqdDo8yLSS13jRmx1foI2tR0JidpwR4XknRTlhM0MU4fLNqYacMpDUHNA3GKjzx1yguGKZgjTZlgirU6MUzj8yDmVKQQtnJsDNyyLmMxU7Zwg9tVZPNKl5ipLvhns/ZI+pTldIpfj4S66wu5Npp9LY4tf3wQbiZVq7VLxBVQh22kCqJEY3zqdPzzHMzjfiCKvonQ5lqeuOXGdlOzthIU8UWYidiYw+GESZ2is2LW/+B6aHg3qD0Offp5T6EGFdXYWBmMVBivJxG2Rh59iLlZLpndUf5894QIbfWNjo2pi9a1z9KtLLCqlIgB63jNmcHFC38qrq3iTA/QAsZIU9ITQQMhOIrIJEmEpLFtfuGk0h03cS/G7sQj6C/TLx8vO5DP/zcuC5frjdehusqYyh6JimtRh+suWq3TyIGhAW0cym4rlMw6VC256gns1A8MG6MnyPRKDj68rCXQSj/9uPAiR4BhkTGtjQno7JQJApWJpkAfg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3412631d-2968-4b61-e570-08dcc63773f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 01:27:45.0208
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7IbQiQSgch+PhhT4loPSJIkWWNo9PXxlS+hLPvrXxsPcYkr0k1R5U1Oqi+QtrJPAIp/hMA4cCBVxYgolbX6Dpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7731
X-Authority-Analysis: v=2.4 cv=YIHNygGx c=1 sm=1 tr=0 ts=66cd2b95 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yoJbH4e0A30A:10 a=nEwiWwFL_bsA:10
 a=KKAkSRfTAAAA:8 a=jIQo8A4GAAAA:8 a=1jFnd8375uFrJteBb0oA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-ORIG-GUID: Z2MHwopmAVSJ1Ab_zy9minvOUqve0olt
X-Proofpoint-GUID: Z2MHwopmAVSJ1Ab_zy9minvOUqve0olt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_18,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408270009

T24gV2VkLCBBdWcgMTQsIDIwMjQsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IFVzZSBk
ZXZfZXJyX3Byb2JlKCkgdG8gbWFrZSB0aGUgZXJyb3IgcGF0aHMgYSBiaXQgc2ltcGxlci4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dz
a2lAbGluYXJvLm9yZz4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtaW14OG1wLmMg
fCAxNiArKysrKystLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCAxMCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3
YzMtaW14OG1wLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtaW14OG1wLmMNCj4gaW5kZXggOGM5
MWU1OTVkM2I5Li44NjliNWU3YzE1ZWQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMv
ZHdjMy1pbXg4bXAuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtaW14OG1wLmMNCj4g
QEAgLTE3OSwxOCArMTc5LDE0IEBAIHN0YXRpYyBpbnQgZHdjM19pbXg4bXBfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAl9DQo+ICANCj4gIAlkd2MzX2lteC0+aHNpb19j
bGsgPSBkZXZtX2Nsa19nZXRfZW5hYmxlZChkZXYsICJoc2lvIik7DQo+IC0JaWYgKElTX0VSUihk
d2MzX2lteC0+aHNpb19jbGspKSB7DQo+IC0JCWVyciA9IFBUUl9FUlIoZHdjM19pbXgtPmhzaW9f
Y2xrKTsNCj4gLQkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gZ2V0IGhzaW8gY2xrLCBlcnI9JWRc
biIsIGVycik7DQo+IC0JCXJldHVybiBlcnI7DQo+IC0JfQ0KPiArCWlmIChJU19FUlIoZHdjM19p
bXgtPmhzaW9fY2xrKSkNCj4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGR3
YzNfaW14LT5oc2lvX2NsayksDQo+ICsJCQkJICAgICAiRmFpbGVkIHRvIGdldCBoc2lvIGNsa1xu
Iik7DQo+ICANCj4gIAlkd2MzX2lteC0+c3VzcGVuZF9jbGsgPSBkZXZtX2Nsa19nZXRfZW5hYmxl
ZChkZXYsICJzdXNwZW5kIik7DQo+IC0JaWYgKElTX0VSUihkd2MzX2lteC0+c3VzcGVuZF9jbGsp
KSB7DQo+IC0JCWVyciA9IFBUUl9FUlIoZHdjM19pbXgtPnN1c3BlbmRfY2xrKTsNCj4gLQkJZGV2
X2VycihkZXYsICJGYWlsZWQgdG8gZ2V0IHN1c3BlbmQgY2xrLCBlcnI9JWRcbiIsIGVycik7DQo+
IC0JCXJldHVybiBlcnI7DQo+IC0JfQ0KPiArCWlmIChJU19FUlIoZHdjM19pbXgtPnN1c3BlbmRf
Y2xrKSkNCj4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGR3YzNfaW14LT5z
dXNwZW5kX2NsayksDQo+ICsJCQkJICAgICAiRmFpbGVkIHRvIGdldCBzdXNwZW5kIGNsa1xuIik7
DQo+ICANCj4gIAlpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOw0KPiAgCWlmIChpcnEg
PCAwKQ0KPiANCj4gLS0gDQo+IDIuNDMuMA0KPiANCg0KQWNrZWQtYnk6IFRoaW5oIE5ndXllbiA8
VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KVGhhbmtzLA0KVGhpbmg=

