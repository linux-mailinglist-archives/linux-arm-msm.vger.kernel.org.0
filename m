Return-Path: <linux-arm-msm+bounces-61513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9528DADBE90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 03:30:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 959CC3A3DA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 01:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62AB51C4A0A;
	Tue, 17 Jun 2025 01:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QYm2QYfS";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="URaypljS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="wqG4/ztY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4B01662E7;
	Tue, 17 Jun 2025 01:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750123810; cv=fail; b=RuDjf/XlYZoydPxAPtrl98tnY8u+4fWxxnYY4PJ3GkdlxBBlrcVmiC9/zEOpiYusuUh2rX9FJvg4/mHyR1QnxGRnRB/owExOrv6RiGVuhAuDTBRWEwGQ9BOXXsCh7qH/Vnk8DUQw7g+PeUIT6IwwhbJt01x3T4fsqcJXNFtvgZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750123810; c=relaxed/simple;
	bh=UNprpFmAJOcwOWrIlM4gKrg7JO15nE8fxp0xoBC0GTE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jSG3JcfZeA770xX0oBSEXGglc9ivUFCmqibIlhUM25f0rBQRnoSIebSTznPUA5lV1t77NROElFNzd4ML+zVIFmmQsAWb4vfkKiPFD+2X69UWriQtHEPCukS9GYTbwLlxmiCY//VDlluII2pIUH/pk54CCHJu9F1Kwm4+xxiX4mc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=QYm2QYfS; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=URaypljS; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=wqG4/ztY reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GJYAnA010295;
	Mon, 16 Jun 2025 18:29:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=UNprpFmAJOcwOWrIlM4gKrg7JO15nE8fxp0xoBC0GTE=; b=
	QYm2QYfSEy17rNkE5Wk0oHQt/DQk/Nwrqe2wwTLOqx7cxgDHCic0RV0szgQjLsFq
	1iJgxzWt4tJxC76N4CpNXWuaICiSH0tomfeNWzB9sbjBWUgdPz86URlim+dxoF3p
	9Iyki5Yn304HFgqCEITDNyqLSmaPMQLWWRSaOnRRjJv749xEUBop7/Gs7/mKX2Ou
	E4/r/KG4wQjYEMmb+7sdf37KZ5DNRyfjYahohicHUstipruPfD0e3SMxJtvCF0rY
	HUjowLcxVGGesyO72iIMg+ffA+G3BdHCOjsGyhim63Gg25PmNxo1tlc2tnLk6MiA
	l1ONsvudC93//w22kSZGOw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4797qfgqt0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 18:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1750123797; bh=UNprpFmAJOcwOWrIlM4gKrg7JO15nE8fxp0xoBC0GTE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=URaypljSdOsHMGfDMxNX0maZqc06ZXGw9d/oUZChAjk5O7lYGoAkD3XkdBx/Jmtaa
	 HPanRSKc8/W1Mq38afqywOO/CozDw1vnoJCEsleSjyKcDI+Qldnpp/JFpPFA/mWwPJ
	 hAdcY9gZfb82x7ku+8gDYHnT4JfOdMl6l3l/Szo1vD4slaKF1WBIB+HndFbnXo1ZDk
	 McZoaK2wrG7KNXZZDdhl4z1cOYCLyzn9hw+Gx/sCI7ukfPwfQb8nGK+gws0d6WA2tx
	 RrvnsF0fgcpQ95sT9DlZ1VocNpZojZh71wfGMOC/nAo6OlRYV9GNhXBpYIP/zcXe2C
	 oJvVeRwsqnwQQ==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3E87F40107;
	Tue, 17 Jun 2025 01:29:57 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 0CAFBA0070;
	Tue, 17 Jun 2025 01:29:56 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=wqG4/ztY;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 55DAB401C7;
	Tue, 17 Jun 2025 01:29:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJbpVy3sr2jHruxC6ZMIc3w7wFqWntmsbfZuRuxfwmWvXQFyceu8nlG4kyKLWPi5ke6uoXYRSvenAaCbdjBDA8BQgxZEEG5nTzAwduS5zIRv+IK+jQ9k90ZTuDuloxUTnWd8OjWlQ7Gd6pqQl2ORZE+FCfxGSROPoYKyBoa8jCSsdxdtMtPe0RsaRt7fNrMU1XdSsX6IINuOz0cz70XGWzVSW7VmGol49g9/Rz6H0HAxKVVSyhRnwWS2U1K/Xd9b6sJtat3V/fEzBiYsvG4ZKmXcsDFlkBFUnwVSMiU1tElLhFoPB783ozjI/rF8ZAn5cWXfbROdY9jNjytNLNECyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNprpFmAJOcwOWrIlM4gKrg7JO15nE8fxp0xoBC0GTE=;
 b=f6wjGXb9gINKFheVBo61fudTZr5R9UcsnR0iK/hyiumCUL3vB11P90ufUk+Gmo3ENvuvi0T6P2xA91Uq8BeSHiZqaR1zI9tADNPfMO/h1T/NDUB+n8eRT7Op6/hcXdQwJ5FZER5Z1ahJxR45ZSndttFc+aRCbeghnKMuhnLrhMToW0TuU6tvVOS4v/9rwhmzXTTQGxbRIr6LZVEO5aGLo0WU6D5Dj6xlrOJ13lfPITbzB1NPiAZ+hnAqFiynSLxX2zhM+anVS42KVbN/97Eq0yKgGs0XWwNzvcuqBnWFEz72G+DajoPlXhWvDqNtMIweqZzoM3hvyJkLA3cbuZ+6cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNprpFmAJOcwOWrIlM4gKrg7JO15nE8fxp0xoBC0GTE=;
 b=wqG4/ztY5Gs3i6iMHcNJFs5AkPOsTt84KmoY2+hdSA8KN88WFrBLwGZENwsmB9NSy5y2FpNdG34IWrbDKjY4MQjq0OlXhpa4A7VdQB4aUZ++dTjr6S6J6pXQvRuR/rksrpFFQqGXSxSj2sztq18I84t14GUdHnnT0cMkMiYpzQg=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ1PR12MB6267.namprd12.prod.outlook.com (2603:10b6:a03:456::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 01:29:52 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%6]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 01:29:52 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] usb: dwc3: core: Introduce glue callbacks for
 flattened implementations
Thread-Topic: [PATCH v2 1/4] usb: dwc3: core: Introduce glue callbacks for
 flattened implementations
Thread-Index: AQHb2egKJtlrelB7lU6Yt8ediWYrnLQGmtAA
Date: Tue, 17 Jun 2025 01:29:52 +0000
Message-ID: <20250617012948.hw7koyx55gj7n7a7@synopsys.com>
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091357.2983085-2-krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250610091357.2983085-2-krishna.kurapati@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ1PR12MB6267:EE_
x-ms-office365-filtering-correlation-id: d16c82d9-98b7-416b-4651-08ddad3e7556
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bnJyR2FrclB2WndKS3ZsUHlad2FrZlcwTkJOU01Ickx1WHF2NkN6RHY5ODJu?=
 =?utf-8?B?VVJjeUpENVRFWWJLb3pnK2tNeDRIZGIrN1RvNnZtcWdsRXpsZnhnT0lJaSto?=
 =?utf-8?B?UWtGRDRMNlAwU1RMRy9WQ0kzZXNheFhicS9ZSnV0OE9EY1JTZkN2a1dJZkV2?=
 =?utf-8?B?cngxZC8yelNaM1EwcW0zN1E1MTNqWEJQNm12Mmc1elBsVk9iSnAxbEpkOERM?=
 =?utf-8?B?RHNVeGYzMG9TN0pYazJwMW5Sb0xzNXNZSzVNNHZhM1UraVZVSnpZSHRCTGNJ?=
 =?utf-8?B?VUNpb0tvS0ZwTDFqYTVzYWZvVzcwOHVRQnFhby9Ya1pBcURlWlYxOUF5K3Zk?=
 =?utf-8?B?bUpQQUxjcUxEbzNySW9PNG1qZ2JGTVR3dFk2aVBmb1ZYeXFHUHFmc0EvdkZU?=
 =?utf-8?B?UzlmbkhiTEtUSTR5S05Fbm1HdW9pOU4vRWVmVWpyYk9VeTRvQ3hjRHBjdDZp?=
 =?utf-8?B?SmUvZ3liYzdsOGk0aVlqaDlDT1lJNXQ3M1VSLyszdFhITk56L1hWQUFjYXAz?=
 =?utf-8?B?TW0zTk1tb2FiUUhxYisyczdET3JVMUtYMmJVenhxdzZCTEw5dGZObVVWMmdv?=
 =?utf-8?B?bmsyRTVacms2dWhWeUt4UlVDNXFUYVVMTi83dG9DeVEyMmRpNit4VHVoNE5h?=
 =?utf-8?B?TTNZamowVFhrdWp6a25YNDVvc0MvQnIweEI2ZjlhOWdENjE2UDQxMVJ6SEpF?=
 =?utf-8?B?NDAwMUNKSkFaRFpwaDZHSlVwOEZ0clcwTFZWRjFlUCtXSFYwdFlyUGVMOWdW?=
 =?utf-8?B?SlhZb051MEl4Qk1mOW1lQ0xuNG90STFnQzNqR09BdmFTelUvVkdxdXZBNFdP?=
 =?utf-8?B?eHh1QnFaUEVyREMvSEp2N1NxMnBiSmZraHBFVlBkZEpGNzI3VSt1WmkweW42?=
 =?utf-8?B?b1BOSnlQYXh4K3draGhTUlJmM3dGVHJNK0ZiWE55d29EeDMzU0czaHJBZkxm?=
 =?utf-8?B?YklyNTlsaTNUNjNUbzRXWGREVmVEZ1pWWVNpN1ZGTkIwaE0rTjROTGFkeVEy?=
 =?utf-8?B?b2ZKWXRpa0hJRU8vRWxVYlZxNjZYbHJzZGYxUUYwUC9QS2hMMTh0RTAwZnIx?=
 =?utf-8?B?Rlp3OWZyUE80OS9Vb204MTNscTM1cEh4VENBWXQwZDBYWXROZnpqZlVmWlU0?=
 =?utf-8?B?WjBaQlEwdDVUdjRPRnZ5cjFvZzRUODkzRWowNFhlZDdLRE51MzdUUmxvOXdN?=
 =?utf-8?B?eXpULytxbk5kS1VCMVJoN3BLc0VaaTQ5RWNaWUE5czdaVWIvRHlEbFo2Y0Vt?=
 =?utf-8?B?NDcrMlZiUUk0ankvVGtxZVl5Y0JncWE2Y1RQUlNPVXI0eXBiR1hYNStBYzZ5?=
 =?utf-8?B?b295VVhTSGd6WUw1VWd4bHZhUFFSaWswWEZNT1RVRThGQ0VuOWNVL2NmanlG?=
 =?utf-8?B?Y0hSNkZCcWxnYTFRU200bGpxYzFmQ3hyWVJOQmhhVDMwd2V0Uy9zQ25pRDVO?=
 =?utf-8?B?OC9BcldYZk5NM054QldpaHFpUXVLamNmNC9XZVlzRDJVczFCSm5CL043blli?=
 =?utf-8?B?ejBkUEFoUHpRc0FaV3BEaUxlcndyVklzTlh1VktlUGJ3aUdJSnROTDF2anlq?=
 =?utf-8?B?MGlsS1dCaGlQZ00xVUk5K1dLKzQvYUFOMW1yUUI3dEJEZ29FWVNNNTdSSnNl?=
 =?utf-8?B?VnR1VERjRDliaWN6OU9ob1BpVDExQmt4cm4zTkpFaFlaOW9oaHRtanlTeFM4?=
 =?utf-8?B?VDNPM3hZV2svZS9JeEtIbEM2WXhIbm96TGVhbzdGMzdreEk4bm50eHJlVjB4?=
 =?utf-8?B?Z1dhdmJRcDdVakRLanlrSllWeklMN3N0RFphNS80RUJIODIzd3pMV2dKZ0gr?=
 =?utf-8?B?VWpkV3VyYThmbHRJWW1OVkVDV1VQN09ndVkyYko2RndGMGJjTXFkOVhlMEpn?=
 =?utf-8?B?dk0rajdEQTFNb3ZtZlIxbUVrL3p5RG9UcnVWUm5ZaGpKaC9sREhxNnhqR3JC?=
 =?utf-8?B?VithNm9POXFFdEpySUZlWTFyVXkxRTE5Qks2N3dxalhwM3NQLzUwR2MyYXNJ?=
 =?utf-8?Q?jQti7/UWevOsp87fV2em8SR1rGROd0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OXVYMmtKSlBFeFh2Y2RDdzhVbGwvRmZFL2dQWjRCT2RodVdudEw2VHFzSUVo?=
 =?utf-8?B?OGpVY0JkZFd0d1p5Z3hyVGYyeURDVmVCd0JRSDQzYXJ3VjRQOEdPTXdlVHJm?=
 =?utf-8?B?MGdGMTRDaGtocVM4M3htRWdYOCtLMXE1Z091aFpsZ3U4YVBBa3lxVVpBNlEy?=
 =?utf-8?B?TExVM2NFV2hRaWFPS2NLeUJlblV0RjlOYzZYYUpXOFRFNDJjYXdCV1ZNTXQz?=
 =?utf-8?B?YStkQjlJbVBMMVNoN2kyWVgxeWNxWjBlREdkenhNcHRreXJTMnV6V2pPU2F4?=
 =?utf-8?B?TXRYVW5vM0V5QmFTYTRPbU5ES284cTN5N2hXakpSVGx5Q0xmNEZpdG1CWUQx?=
 =?utf-8?B?UVBka3Bpd3JYWi92bmg2Q2U1YW9jTFRNTXU4UHg0Si9GZXBtQktld0ZMd0RI?=
 =?utf-8?B?Rmo0Z0Y3bjk1ZmJ3RVQxeDhkR0hvQVI5d3FNb3Q2OE95TGhiOUVucnBjem1v?=
 =?utf-8?B?cHFGT0FNVVlXQTJtTmZyaTRGQjVYbVhCckVzZVQwdWxWdVFLVmlGWWZOTjdt?=
 =?utf-8?B?YzhTRkZHaUd3L3NmS3U3Y2J5Znd0NnpuUC9lTjdtVlp0T3UxOVJFaXUzcG9K?=
 =?utf-8?B?VGpJelVROHZzcWl6MytWay9TT1RIcVpTK0RaQUo3K0N3dTZVeFpMTlFJamx0?=
 =?utf-8?B?Z1dkNEk0QnlFazBrcUM5cEpJeTd4NUVTSWZ5dTY2ZHBLNlNGWFBxbVFsTnIx?=
 =?utf-8?B?d2RINGhuS2JOa1lJSHdzbWhNMUFkZGZ4UXBGaUtTUktrVHlhTmo1ZVgvQW5S?=
 =?utf-8?B?OW1uSjViSFRpM3pzaklnOHl0QlNveGVuVWdWb1AybmloOTJ0OW5MVmx1YVNQ?=
 =?utf-8?B?YjA0TVRMeTY0eVdnWW5wckFJMGxrSHlTQ3RiME14VmdpVnpNSVM3bFdYeUFF?=
 =?utf-8?B?endGeG80SGNGeUlJSHNvMzlDczBac2dKTk1naml6NksrR1IzZ2JoaUJrZk5X?=
 =?utf-8?B?dlNGcXZ3b0FNUVZaT0ZicEhML0VyZHRseFdiZy9hd09ubDZxMzZGUExCUlpj?=
 =?utf-8?B?NHh4a3pmL1BzNldJVmIzd0xVbHQ2bHFwMHQ1d0Q3UGZDZHg1MGZ0UUJhVEhE?=
 =?utf-8?B?QXd5SWg2WTRubkhLbnBJQml4OHl0VjZRUzBQQXJaZXZKc2NEMEFZYVJTSFZl?=
 =?utf-8?B?NmJKNW5WR2RsWjlidkltLzN1MnVNVVlSQTdVYWhtUVJHbVBzaUFaV080QkdH?=
 =?utf-8?B?V3lOaGN3dE1NVUxWRFRpUmJxMnBxS1Fvb3ZNOXpUV3BvanZnZlRhcVNZM2pI?=
 =?utf-8?B?ODNzNmZJS05mcmlZZ0hwd1htWkE5OFNLSVR4dDQ3Mmw1YlFKUjZIZklBcEJ3?=
 =?utf-8?B?OHZTYllYcDlnS2dFeWZSS2sxOXJkL0psM2pBL21scHZxUm5WbkJQV2lZelNQ?=
 =?utf-8?B?QVU3MW1MYkxuaXVGZHZJRkxDcFNkMlllK0xSTG96ZjFvTGMwZEx0bzA2YTEw?=
 =?utf-8?B?L0VMRDB6UysrRHpRYmxlYy92M1QzdjZSQ0FwM1pCZForSExoSnhnRUFHMThR?=
 =?utf-8?B?MkFKdmVPTjNOdFRvVzFXRzZXQzlCWmVhUTJmQlp0U0t3anJsd2pTMGQ0bUpk?=
 =?utf-8?B?aldJLzhLTmZOVTdUcU1QQnNHMHlyVEE4aFJYSnJweVlQUHVDUDBoeGMrSjdu?=
 =?utf-8?B?Mk84a3oyZmI5aWJiak9oam9rNXpBZFl6MnI3aFFvaitHUEdsVTNUWTFGcXJL?=
 =?utf-8?B?djBFV1ZrV2FhZWkvTVYzSnNXcGpybWFqL1NXVTAwK2hIVWNFa0EvdGdvclkr?=
 =?utf-8?B?UDc2QzRiajNKZFVVRUdzY1RIK25mcG1oMDBpeXNZdFdVK2hlcjRjZUFjM2w3?=
 =?utf-8?B?ZzFBWi90UXBIZy8rWTMzQ1Ird01tSmFYM2VXS1lhd2p3L05PMW1EelZlcDVa?=
 =?utf-8?B?U2x5REtScW55YTdIeE90WjNWdytHM042ellHTlhZRktTNU9XeDlKYUltVVcx?=
 =?utf-8?B?ZzZuckhYb09OcW1jcVdoS1YyK3c1N1B0bXIrVVNWMXBDd2NQS3c0VGhQUzhX?=
 =?utf-8?B?WmxScHlIeUZ0dFh2cllOU29kcDZWU1pnNnVIdUhSQkdXOUt4Wm5NaUJlNWFF?=
 =?utf-8?B?aEZYWW15Z0tSL290MW5SMUl3bVV6dk5TRWpnb3NkdjZMN2RORWd6blU2WStR?=
 =?utf-8?Q?KMgPNu6v9y2CeNlTtmis4M42m?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B7C3F6286320B94D9897F6ED80D9630F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/rre83by9V9ffavwdHljsI6a9Dpx59w9Wc6Zv6B2yPNo8jcfQK0hUR6j8z1PCXZSqZSbngU7uaGCScnvO587jrLDbu7uSrxtC2m8jbY9rZY7+14n8r7A9Af7Wn34YnOjn6bDSoIyb6sTLkZP/RpCD4knV05GI6pMfJvCfvBkHYMA8jz17v6psFNOHPh5aQ1FgB4v00U8PHglPIUZ++WcjDAf5vtBE0LCT48l9uoRccRZcNzp2RoARFjRvi2b7kE8cSBJepBMg9BKFP4TPT1/wwo6oMfZxgjoFUwdXNi1MPoxSDE/avVKigoA3TezA6SPEVPFUfyYGoLnu0SMpwmx/tIaB0vMaGieHByuUDXLwobpfY9lQkQCg6NvxMAIct/PW1t6zBTDvaJoVI+eKs2mJln2Y3yFYXV3EBc2xUjGgnE5AOQ0JQdLMbUruyu0/Iwz7WP1cqrHyHWFpe7f7iKLLfALsr00mqhzi8741gBjyRG7F87WN+dc4O8mdtMzHsBuGBzjY2uPQRZDOkmiJzii7aWWM/mfYuPI+TA/NSx4RES6cxhPGYDxpjCU5EB1dJJcP3ylWsoT0O4loR65pMyEmIq2U82apabXHQAPPESwOC35RR/zC3NDc5acN7TtjWVqG3RO0OdAYmimz80HhjkDLQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d16c82d9-98b7-416b-4651-08ddad3e7556
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 01:29:52.4425
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CUXCav6RZIElgtNfKL22IKEwOzk+xezxKJg4UghZKL6TxoCFSVh5Q08WGXikfM6Pom8xHbyn7EGjVwFMEJsjug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6267
X-Proofpoint-GUID: _RZSXcnytmLLFBlEJ2uOVXgS4N7hlA-E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDAxMSBTYWx0ZWRfX6mWs3sVCH/vf
 +6BGj8FzpHts9AHFBSPP0uYbNVFGSlwageWxO8wnO3yZbBZDMoiTyZyZ3bjnLGjIBq1bvfdvpmo
 8WIGI3XXY3NFA1NguJ3wMVfi7d10j3TM0nJM7tKk49OBdYthNBhHRG/AoHw9mRRlgceraDMpm9R
 ATqvO8kSrTxGOYiaqAIOGrOjfhK4ceHIoOO3VzTnCkh9qxZomI16gUYygp6sYTUrgyPGoSu1rcI
 rzEcX5smJu8wZnMOUYL8qT6VLHFFWECO49qboDAPJj2C4Z8++e5WaE71HNH550cLQt9iM88DSw4
 s3rE3Hw+GP7SICaaaDZ0KOWC7gTtkz/fxFAiWk8WAEF9mbCaqnHz3/QrOVRbm7L8LO6Eu1SNCPY
 31k7D6Bc811l5LR8j9AXqS3cl6feNAgs9HbMwtxSQP3GCA6ia1+GsbulDrFE9jmzm1ExWeKh
X-Authority-Analysis: v=2.4 cv=bpxMBFai c=1 sm=1 tr=0 ts=6850c516 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=qPHU084jO2kA:10 a=EUspDBNiAAAA:8 a=Dy-b44A9MPNgWeKJDGUA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: _RZSXcnytmLLFBlEJ2uOVXgS4N7hlA-E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_12,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 phishscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 mlxlogscore=948 spamscore=0 priorityscore=1501 bulkscore=0 classifier=spam
 authscore=0 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170011

SGksDQoNCk9uIFR1ZSwgSnVuIDEwLCAyMDI1LCBLcmlzaG5hIEt1cmFwYXRpIHdyb3RlOg0KPiBJ
biBjZXJ0YWluIHNpdHVhdGlvbnMgbGlrZSByb2xlIHN3aXRjaGluZywgdGhlIGdsdWUgbGF5ZXJz
IG5lZWQgdG8gYmUNCj4gaW5mb3JtZWQgb2YgdGhlc2UgZXZlbnRzLCBzbyB0aGF0IHRoZXkgY2Fu
IHRha2UgYW55IG5lY2Vzc2FyeSBhY3Rpb24uDQo+IEJ1dCBpbiBub24tZmxhdHRlbmVkIGltcGxl
bWVudGF0aW9ucywgdGhlIGdsdWUgZHJpdmVycyBoYXZlIG5vIGRhdGEgb24NCj4gd2hlbiB0aGUg
Y29yZSBkcml2ZXIgcHJvYmUgd2FzIHN1Y2Nlc3NmdWwgcG9zdCBpbnZva2luZyBvZl9wbGF0Zm9y
bV8NCj4gcG9wdWxhdGUuIE5vdyB0aGF0IHRoZSBjb3JlIGRyaXZlciBzdXBwb3J0cyBmbGF0dGVu
ZWQgaW1wbGVtZW50YXRpb25zDQo+IGFzIHdlbGwsIGludHJvZHVjZSB2ZW5kb3IgY2FsbGJhY2tz
IHRoYXQgY2FuIGJlIHBhc3NlZCBvbiBmcm9tIGdsdWUgdG8NCj4gY29yZSBiZWZvcmUgaW52b2tp
bmcgZHdjM19jb3JlX3Byb2JlLg0KPiANCj4gSW50cm9kdWNlIGNhbGxiYWNrcyB0byBub3RpZnkg
Z2x1ZSBsYXllciBvZiByb2xlX3N3aXRjaCBhbmQgcnVuX3N0b3ANCj4gY2hhbmdlcy4gVGhlc2Ug
Y2FuIGJlIHVzZWQgYnkgZmxhdHRlbmVkIGltcGxlbWVudGF0aW9uIG9mIFF1YWxjb21tDQo+IGds
dWUgbGF5ZXIgdG8gZ2VuZXJhdGUgY29ubmVjdC9kaXNjb25uZWN0IGV2ZW50cyBpbiBjb250cm9s
bGVyIGR1cmluZw0KPiBjYWJsZSBjb25uZWN0IGFuZCBydW4gc3RvcCBtb2RpZmljYXRpb25zIGJ5
IHVkYyBpbiBkZXZpY2UgbW9kZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEtyaXNobmEgS3VyYXBh
dGkgPGtyaXNobmEua3VyYXBhdGlAb3NzLnF1YWxjb21tLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJz
L3VzYi9kd2MzL2NvcmUuYyAgIHwgIDEgKw0KPiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmggICB8
IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2RyZC5j
ICAgIHwgIDEgKw0KPiAgZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyB8ICAxICsNCj4gIDQgZmls
ZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dXNiL2R3YzMvY29yZS5jIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gaW5kZXggMmJjNzc1
YTc0N2YyLi5jMDFiMTVlMzcxMGYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29y
ZS5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+IEBAIC0yMzUxLDYgKzIzNTEs
NyBAQCBzdGF0aWMgaW50IGR3YzNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikN
Cj4gIAkJcmV0dXJuIC1FTk9NRU07DQo+ICANCj4gIAlkd2MtPmRldiA9ICZwZGV2LT5kZXY7DQo+
ICsJZHdjLT5nbHVlX29wcyA9IE5VTEw7DQo+ICANCj4gIAlwcm9iZV9kYXRhLmR3YyA9IGR3YzsN
Cj4gIAlwcm9iZV9kYXRhLnJlcyA9IHJlczsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3
YzMvY29yZS5oIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gaW5kZXggZDViOTg1ZmExMmY0
Li5hODAzODg0YmU0ZWQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+
ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+IEBAIC05OTIsNiArOTkyLDE3IEBAIHN0
cnVjdCBkd2MzX3NjcmF0Y2hwYWRfYXJyYXkgew0KPiAgCV9fbGU2NAlkbWFfYWRyW0RXQzNfTUFY
X0hJQkVSX1NDUkFUQ0hCVUZTXTsNCj4gIH07DQo+ICANCj4gKy8qDQo+ICsgKiBzdHJ1Y3QgZHdj
M19nbHVlX29wcyAtIFRoZSBvcHMgaW5kaWNhdGUgdGhlIG5vdGlmaWNhdGlvbnMgdGhhdA0KPiAr
ICoJCQkJbmVlZCB0byBiZSBwYXNzZWQgb24gdG8gZ2x1ZSBsYXllcg0KPiArICogQG5vdGlmeV9z
ZXRfcm9sZTogTm90aWZ5IGdsdWUgb2Ygcm9sZSBzd2l0Y2ggbm90aWZpY2F0aW9ucw0KPiArICog
QG5vdGlmeV9ydW5fc3RvcDogTm90aWZ5IHJ1biBzdG9wIGVuYWJsZS9kaXNhYmxlIGluZm9ybWF0
aW9uIHRvIGdsdWUNCj4gKyAqLw0KPiArc3RydWN0IGR3YzNfZ2x1ZV9vcHMgew0KPiArCXZvaWQJ
KCpub3RpZnlfc2V0X3JvbGUpKHN0cnVjdCBkd2MzICpkd2MsIGVudW0gdXNiX3JvbGUgcm9sZSk7
DQo+ICsJdm9pZAkoKm5vdGlmeV9ydW5fc3RvcCkoc3RydWN0IGR3YzMgKmR3YywgYm9vbCBpc19v
bik7DQoNClRoZXNlIGFyZSBub3QgdG8gc2ltcGx5IHRvICJub3RpZnkiLiBUaGV5IGFyZSBjYWxs
YmFja3MgcmlnaHQ/IFBlcmhhcHMNCnByZWZpeCB0aGVtIHByZV8qIG9yIHBvc3RfKiBpbnN0ZWFk
IG9mIG5vdGlmeV8qLg0KDQo+ICt9Ow0KPiArDQoNCihBcHBvbG9naWVzIGZvciB0aGUgZGVsYXlz
LCBJJ2xsIGdldCBiYWNrIG9uIHJldmlld2luZyBtb3JlIG9mIHRoaXMNCnNlcmllcy4gSSd2ZSBi
ZWVuIGZsb29kZWQgd2l0aCBvdGhlciB0YXNrcyB0aGVzZSBsYXN0IGZldyBkYXlzKS4NCg0KQlIs
DQpUaGluaA==

