Return-Path: <linux-arm-msm+bounces-28443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C19279510F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 02:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CADBA1C229DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 00:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67FEBEDC;
	Wed, 14 Aug 2024 00:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DM6XtZoq";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="eUhcKmOB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YQKol/sd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316671C17;
	Wed, 14 Aug 2024 00:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723594676; cv=fail; b=GPKpane6OCam5J00njtcjnRHKN/Xhez3UpEKBAq4ZCN5mp2T28ryFKw/nybj+tqJzLNZ55T7dpLJOsiFS/PrY0ZPybIfS0eOWHmaHI+Sk6yUljak72UJtmcEaZBYQVp3TXC6RTn6jz3nzGjv9x2rUmAgSekg7zKmGtqvpzKh5zY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723594676; c=relaxed/simple;
	bh=dPqb7iKoC7iPFDtyNC1za6qLBAOKL5mrcncyEmYRQ9k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OQcXJJQFl0EVl8kmyHYg3gBtm/8W++TCTBLIP9tQJK0E+ClQb5UXI2pO3dxTbhGV1brYBImHswMgtrLGX6xh9jxTGJoTqdfg1naHiNXHBRrXCDszxIbNzukzmreK32d3TNa3kW71LgImmW/SkHdfs3WMyXMiUwDd6qVIJKg1h/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=DM6XtZoq; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=eUhcKmOB; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=YQKol/sd reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47DNbNfi006604;
	Tue, 13 Aug 2024 17:17:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=dPqb7iKoC7iPFDtyNC1za6qLBAOKL5mrcncyEmYRQ9k=; b=
	DM6XtZoq8XkClI0Q6Bv2eyAQ4daSuoVJc7Q67Ws6byj2yhc5IWVzJ7NpyogFcz00
	ECf0bDez8Ovx6gnAVWJg5LjdFzl1CIu6hauTDF5M0ND1tAn/hAC8Zos5IVy4XK8X
	EUdZfIIf4HEhZWu+Cs9W5+6sCquuBUMFGvAfmpGzTOWI+bOGaiHzm1r+muHhPeG7
	zLLrdUc6mozjlGZnB/C8ozzB5gikL085xXdDQPxH2Xl1u2QhNKzHGGDsPaPQBNjh
	NsxVJUZPYOgeH7kDyvnbsU9XmbS/EzxhVP16bw1Vda9zFfqwheDcSQoPtMaFPCVF
	bW28Vk2dxqUM95VVRXuKbA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 40x74sqs2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 17:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1723594670; bh=dPqb7iKoC7iPFDtyNC1za6qLBAOKL5mrcncyEmYRQ9k=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=eUhcKmOBuYK4wzwNSx+hRQYY6WpUF8oezv4DtmXxp7dG03h41PReQEzqddCqAChXV
	 UnDdglCpPuOW2TeDCIIqDEHuNjFjo7nGVnDscq/Po9D5e77J5LqNDJ7/gSwMJnzlq4
	 zlU17YKwudUSW28NAOT8ez63TQ6HWD44DwuFae1YiiNQW98TrDznWlRVeRh96XHyUG
	 9hald9/1y3GYPUK873jCFnQ3Sb8vm5NwChlel2PgR9INr6RLelqAuCJ+IcPRRu93T0
	 h6DSa5GyRQGW0L3zsBtzLCiXBegqmmZZvcd8u+n6QVM8dRQ8dqGQBpSd9d8aRwYnD9
	 L5qRRArPgCQmQ==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DC8D940408;
	Wed, 14 Aug 2024 00:17:49 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id C3CEDA005F;
	Wed, 14 Aug 2024 00:17:49 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=YQKol/sd;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 76BED401CB;
	Wed, 14 Aug 2024 00:17:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lF6rj7PElb/ogpAWoydlQ0GXFADI9p8+JB27qhrrKsFaUcFUWnJ2ana1VUZKcFVvUyocbnjBfMlsF4HZej4zPnC6VEkilRN1rfoq6KVQH5JSieFyfP/RkmlMbhNfiL1Vr3rDvewlsS6p3o1CaemtFWq2aLT+tjpa3+E3kDwPlAVCxLGcsARdVndVTN7l6VaDj9Q6mhGOTdt9Yi473zRR8PYcdSmrW1DRZHjHsydIASk6xi8udTMdVxk4Uh7OJSk9wHo90gHFJc5gl8kivA6gm1GG63YDYR31sNYKzFoNsckxaAEeTYmcdT26X212afQJY186s5Uhlmz974WWF2Tavg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPqb7iKoC7iPFDtyNC1za6qLBAOKL5mrcncyEmYRQ9k=;
 b=JK0b4cUBD/wapQFw/GQgiPMtjscOeAUAINL1BgXNWyDRjGqdS7dsR7awkzRyCtkqhvlOExUM7ezyfAgrmdF7K3qCELRUbvHr3u5+jWYP9BLYQjau/XolAB/khV3K0wvGYRr8LWaSlsAyCmWzjyLtfya2cMt/Stcq4BZ7LWESr3xuJJup1M3OElpRBM/Tq2l1U1w7/pSgG4zVDwGv8HSuHqATncsh1ppGXTm/+FXFjyc2RVdga5KMMBdz1pFHBCcYzFy3eaxNTZGtcqpmRjt6fhUb7mBIQxqLWVojz41xs44YB4XFtD6iACuxW+l0r5pBFS1+B9YHsNnIWrb7Kyprcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPqb7iKoC7iPFDtyNC1za6qLBAOKL5mrcncyEmYRQ9k=;
 b=YQKol/sdhSYXYkiD+lCF7tXMJofRM9swlWKePuNq75v9IudrILm7dOchOW34hwhz33A0q+hg7G2luUrELNyiZZQ3pT696ksisdaBt8ucXk2SrgVLTPE2N0cmt2562CVAdCKfL+I6wyaB9uRZtW5qL7FoNZXI8opxeX59OdlOhUE=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DM6PR12MB4202.namprd12.prod.outlook.com (2603:10b6:5:219::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Wed, 14 Aug
 2024 00:17:46 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.7849.021; Wed, 14 Aug 2024
 00:17:46 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Faisal Hassan <quic_faisalh@quicinc.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: qcom: fix NULL pointer dereference on
 dwc3_qcom_read_usb2_speed
Thread-Topic: [PATCH] usb: dwc3: qcom: fix NULL pointer dereference on
 dwc3_qcom_read_usb2_speed
Thread-Index: AQHa7XKiyJackif7S0av8/ScMK7yh7Il49iA
Date: Wed, 14 Aug 2024 00:17:46 +0000
Message-ID: <20240814001739.ml6czxo6ok67pihz@synopsys.com>
References: <20240813111847.31062-1-quic_faisalh@quicinc.com>
In-Reply-To: <20240813111847.31062-1-quic_faisalh@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DM6PR12MB4202:EE_
x-ms-office365-filtering-correlation-id: 2f69dbd6-c44b-4f66-b610-08dcbbf6860a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eWRsOWR6U3V2eFVIOXZhNWpvc0NHSXhSS0J6ZGlySThNWUgycnhTeWtBeXJV?=
 =?utf-8?B?RmFlMEdENnBBRVJhaHd0WFZ1aEdKSWI3ejBDTjU4V2crcTVjNzlWUUt4MWtu?=
 =?utf-8?B?dkM0QlVJY3dVYTdub2FwOThJMWc2ZTh6T3lKOFpvdlB0d09Ec0Z3dWQ2Z0Zp?=
 =?utf-8?B?WG8rSFM0VXhGamlReFV5b0xKbFovNG8xVUlJNW9vdmpDR1VXWFRJYVdOSHVH?=
 =?utf-8?B?R05lMU1yeEpEdk5NV05zMG81dmxtT0thRlhrMitScmlvM0dldUxUYjROb2lN?=
 =?utf-8?B?Znc5OVNsYU0rMllUclo1bGVKMlMvRnFTSjVmV0czVlZ5YnZUVXNIRURsNDJZ?=
 =?utf-8?B?QWUzWVJRci94UERhcXB4L0dyOTVpZkVIbEJodGJrNyswVVArLzJRU2xRR0cy?=
 =?utf-8?B?QnJ2QUhhNC9XSUs3U2JtVzZxTUhuaHh6ZEdVUVliK0oxUzJ0L04xSW5RU3Y2?=
 =?utf-8?B?eXJSTzlZSFIxQlFlNlJZSnd3dkpic2lKN2ZCQ1E2YUZYOXF0ZmhFb1AvNlBi?=
 =?utf-8?B?eVZWZllwOFJiZ3p3TDVSTElwVVBFdGFnSllhOG90bkh1NUpUb2xhMkpXWVM0?=
 =?utf-8?B?L2JVN0NSbXk1OXZXQVJiVld1bVlDeDc0R2hiaVF0R3B6dUVueHpQaDJUZlUz?=
 =?utf-8?B?UWhoR0N5OFNlQ2N1V0g1UHYyUjYwTGhoMHo4NkFNSnhQRjQ4TTZtaXRiMllO?=
 =?utf-8?B?L1pReVZQQi8vTVdDbTlVemQ5b2s3M2k4MUMwQ2tvUEVueldKaUVoVTdUZnNz?=
 =?utf-8?B?L2dkL2x0cjhXeERqd2pyUDVnMHZHd3dQaHY5a25uWDFHRmpXK2U3Z1RFOUNa?=
 =?utf-8?B?S3hia3FWK29CR1pud2hxUXBVbXVMUy9ubks5cTc0TGhmZTR6RGg3YWo1T09j?=
 =?utf-8?B?UGc0NTV3cFk3Wkc3T2dabVNpQ0FDSzdyaEpvQlBGT0ROaFUxbktIR1BwdmRm?=
 =?utf-8?B?QjhrQ3gxYnNaaEIrNXFxbnM5bjgwaER2ZkEvcjRvNTV3YWlzVkEzdGtFc0Jl?=
 =?utf-8?B?Zmt6S3dQV0thdnk0SGFxQUVEK2FMbXhFSkhtRCtPRTZSUVZBNXFLR0ZYdlR1?=
 =?utf-8?B?cWpNaDlXOGpNV2F1YXdvV2wwVVlmaHFIWllIck56REtZVUtaN3ZQNFdxb0NZ?=
 =?utf-8?B?eW41SWpwdDVwZkhhdjJ5S1RoNnNOZVk2RWRtSUQ2K2hraFFyU3ZSRUVnd2ZB?=
 =?utf-8?B?TjU4M0JITzRNNE1jQkNjMmpNcEdKUEZrY3oyc0Q2UDNYK0lrcjl6ZFg0NnZh?=
 =?utf-8?B?Umc5d0NpdzhpNVNaMUtlUm9oOWpyUDBXS3ZnV1Rpc2ZsTjZwcGxDVzFHLzd5?=
 =?utf-8?B?anlKaWVtcUhhSVBRclU5b2RMaXFzbElySEN6SHVLcm0rdWE1RVVuL0JGRFZx?=
 =?utf-8?B?RTFOSDZSVTZVSXpmRjV5OVpERWdVaUJKZm82L3MrMmJ1TEJvWWsyWHRxOFdO?=
 =?utf-8?B?WDA4TnFJOUg1RHdxT09DTXBZbUN2M3J0d3NMU0dGdFZvbkNBRU9VVDhaa0x5?=
 =?utf-8?B?cVdzdkZOTndUVjFVY3EwNVJzdC8waTA2TWVIbWlESUFPdkZoeUNXYWZ5M2RY?=
 =?utf-8?B?K1c1bVlNWFpFK284SmlZUm82TFBkSGFYNmRiNkxxQ21TQ3lYT21aN1FVZzV6?=
 =?utf-8?B?cjBnZmo0K1pFM3lzQmpVbEhZZXh0bFNDZVY4dDhoOUViclVjK3ZFK3FuQjlh?=
 =?utf-8?B?RzJOSHNKV1oyM2ZwaVpVdGRNMWV2OXdndmVjdzc1OFFLZEducXN2aFlsT01Z?=
 =?utf-8?B?TU1vdHlWVC82WS9GTUJsUzkrZ2NzMk1pUFU1U1d2TFplTk9BNm1kWUxvNk9r?=
 =?utf-8?Q?Pnq8DHNT7sJoznC3wSoz3I9s1Fc6ngMM7NlNg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TWdGQmdNZnpKWnNNS0FMQTgxNmY4R3hqRCtmbkdiYnc3YzZCamFzWlhQOGZn?=
 =?utf-8?B?Q2ZvZnlyV2xYNEIvMm1DbkVVUDhLVWh1WDM1OVMwNGZ0ak1yUEFha29MMjIv?=
 =?utf-8?B?WTZyZzM0YnMxUzgyQVdXdFNlQVdWcWZIWGM4emNSRWZwN3RWblMwOXhGUkE1?=
 =?utf-8?B?bzVVS0FDdFNXdXQ1bGM4YndnUzI5cFVHNEJFQTFiN3RDRHk4ZjB0QzdoRGxo?=
 =?utf-8?B?VHJnYWdJcUU4ZEJlVFBMRVR5TFNvQzVNNXY0L002cHdhZmpoVk1zeTFhT3M5?=
 =?utf-8?B?Q2J0NGdWWUY4emZXL2xyMlRsd2d0VEpvQ1YrRDNRS3ZEUTdlQWFuVmNpbENp?=
 =?utf-8?B?SWRiRCtaR2ZKeVR5em00M0VVU0lZalc2bUV3NVpXMnRQaWF6YmgvQjJJZmxu?=
 =?utf-8?B?Y0FJQmwwMmdTb3RNK1NjdkpQQjllaGJJVC9ENTVsWk9mUE1tZUpxUTdwN1NQ?=
 =?utf-8?B?bzlibllhQzIwZUVoWlVWWURkMDhGY21LL2ttL2xBdU1NSnFDZjBQd1BxUzdG?=
 =?utf-8?B?Z2YzU2NVQWh3dG1vUjBBRTdxU3RKaDFWemtRTVBORUt3aVVCWTBGbVRwZ21R?=
 =?utf-8?B?dDlVNFphNXE2eHVRZlVSRm9lRVViMXcyTTFwc0NGT3RrRjJRY214eU1jSXhH?=
 =?utf-8?B?MW1aZ0FqS0VpMVQ2RSttUEZzcG9LRnFUc3JEeXVUUTdOeUFCeXBLamQrMnVP?=
 =?utf-8?B?VytQa202dXRwbTBMeEkzNkMwZXhyUE5ZZGlEb3MvcmtrZkVBaFNKS1RJaTVn?=
 =?utf-8?B?Y2hPVmlkUWF5Y050Z2RsOTRkZTV6UncxY2xjT1JVOGlMRytmNDR6WW83MSt6?=
 =?utf-8?B?Wk9uRjltMXAxRUI4QkMvM3QrMlJrL0NKL3JHbkphaXRMeUtrU0ErQmhFQVM5?=
 =?utf-8?B?dVRPSUkwYy9uSGRaSnRmWTFvM3Y1cW5rUmVPZFY4aFJYQms1TDZmdkJGODBk?=
 =?utf-8?B?MVpjR1c1TWN4RWZvbFJ6d2FwNysrckExS21NZm4zem44NExZVzI4WXord21a?=
 =?utf-8?B?NFI1R2hSOTM3eEN3SVR6YUNvekpnWTVWNUU2R2NITWgzVVN4UTF0YktCajRa?=
 =?utf-8?B?TWs2YW9qUVdTZmFMSlAvSFlxV2ZTZFJrRUJSbXM5RHovSHZWb2IyN3d5Tk1p?=
 =?utf-8?B?Y2Urb28vakFCQktoc045bHpVdVFkcGRFQVhMdHh0aURlN24vRVptODRKazlp?=
 =?utf-8?B?MkxoMWJycEcwK0FhSEJPb1pqK2haSUdTcktHT1ZzWmhOV2g0SnhodVhqNHdh?=
 =?utf-8?B?ZGo5RlhhSTRVbzU0L2ZUNkFlbWM2M1NvK2NhZ0tjNmRRZXV5a2tHZG03RWc2?=
 =?utf-8?B?RmZCdzlCNENyUkVGYmhuc0k4d3RITTAxbGEwakJ2L21jV0hGWHpzT0xiNjZv?=
 =?utf-8?B?T3R4ZHdlZi9QYnZYajdzRUNRSjhDZEREa2liakhuUVh1cFA4VUgxRjJiSm4r?=
 =?utf-8?B?cktBWmdlS0FNdzFWUFQxMkM0TnV3VUowd1Jxb3A5cHVtWUs1b3lQYlhJazQ5?=
 =?utf-8?B?d3VHUzhxZElFNjZvZ0lwaWJKcE1Wbm4wbGUxajJqNUNYVC9BdEl2ZlNxNUMx?=
 =?utf-8?B?L0xmZWpyQnVMVDhWUDlqbWVjdlM1d0V4RUplU1NxeXUzWUFDaVo2VlF0VTNw?=
 =?utf-8?B?dXdBSVVXNkExMVFQU2ZKRzNRWnpXczlZdzh4RmJpNUY5ejExRWdaSnVVclEr?=
 =?utf-8?B?VUF2OHJMNTVrYzZCZ1h6djVMaTJKMThOV1AzM3lDelkyUE15RGFKTlRSMmxC?=
 =?utf-8?B?OHRXQzRKVlI3YW41bDRnVyt4cGRZV2pXU1J1eTlvb2ZVcVJyZTYycXlkYzdz?=
 =?utf-8?B?a0p4eXQzYjRnMi9nejh1KzVqTGViazViSjNlTit4R0lxSkh0eDgyUDg3b3Vj?=
 =?utf-8?B?VVR1Y3BPV3pZL2RqZ2FHTndNNW5iYWE3Z0tJRFpjYVNXMmZXOHJmQXEyOW9F?=
 =?utf-8?B?K0E2YXR2cmhJSWYvam44UDMybzE1OFk3aFRNL0o2eUE5WDN0S0NDSHdhU0N3?=
 =?utf-8?B?VGF6U2lEa2xKd2FhWXFWY1VsaiswcndpN1VkVElCaFpiU0d0U3R4Wk1aSHIy?=
 =?utf-8?B?Um5jVWh6VWpHUVpzNFpIUDc3aFNTLzVFNEovTDMwWCswT3V5OFFoRFlRRWNV?=
 =?utf-8?Q?Cgp2YHDFt4KnOFuXDjwIlBHSS?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4D1E94A3FBA934EBDB402FC0921174E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qHo7uO02SCz/7tLzsEKQEfnicjMI1K/+MTipxDOySJRqXLjYkXofCjpdo/5nOMFjHPs+Zdi51en/VoVFwXNWNpXkLYIqf/HGlfk9R3CLuwRSBz/IUvz3GqCEjdsVk/DNseFQeEwxxRGufB2UFlv3QimwlJ+KrBjw/pKZFfRR3M/ysgV9Ga6LxyLWhly3j6HKvk8V/2d61A8SXSTi14O8gtBLIxlgOK1ylIQHQC+LAxldtCB2nQgS8wheFqPf3ukaxeYBBQXxr/vSCiebqjODD8dTB4oCE9sbo2Ig3eFgxpwRJkfl0MlGbb7hSlv8YMVbvtMNiDiMBwGhVcksQBpud+n6X3BAX4QzJf30Vmv8/r0FNJA8+KjTETubDZSNgknn72l5ZpfOK6JAbD/sSIap3CVrtnex0dcLIX+U1hCgdrNrHklY8A5CCpOw1F6/TYqUN0wOX6FjrSBcKUcppedMxMiEnyqvuteEmA9oeHNhKWUzrculQjlV+ThWZq0ebWUqyknqo9G5U7m3FRMCE7lCvm4+CBpEjPKODqOwJbN8s/Y8eLVZb5Ov3Llut6IIW3VTg8jKOgO5kgW/lVdKsbuhkWg7w+brQPaZNUzLqPdn+5SWFnfOsyuVl45aQDB88mrRbjS1j3KkxmYe/XMo1y33ZQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f69dbd6-c44b-4f66-b610-08dcbbf6860a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2024 00:17:46.4448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bRRyQy3GSp6l2VzEdPh114G3TEqmrmGDd8qfHReqkDajYFYBWOX9JNtTg6INrJ0d9D2Fb/77VBLaqwk4/X6A+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4202
X-Proofpoint-ORIG-GUID: Gji9yECz93zzUXuF3caU9848Ht4A2kwG
X-Proofpoint-GUID: Gji9yECz93zzUXuF3caU9848Ht4A2kwG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-13_13,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 mlxlogscore=998 malwarescore=0 clxscore=1011
 bulkscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408140000

T24gVHVlLCBBdWcgMTMsIDIwMjQsIEZhaXNhbCBIYXNzYW4gd3JvdGU6DQo+IE51bGwgcG9pbnRl
ciBkZXJlZmVyZW5jZSBvY2N1cnMgd2hlbiBhY2Nlc3NpbmcgJ2hjZCcgdG8gZGV0ZWN0IHNwZWVk
DQo+IGZyb20gZHdjM19xY29tX3N1c3BlbmQgYWZ0ZXIgdGhlIHhoY2ktaGNkIGlzIHVuYm91bmQu
DQo+IFRvIGF2b2lkIHRoaXMgaXNzdWUsIGVuc3VyZSB0byBjaGVjayBmb3IgTlVMTCBpbiBkd2Mz
X3Fjb21fcmVhZF91c2IyX3NwZWVkLg0KPiANCj4gZWNobyB4aGNpLWhjZC4wLmF1dG8gPiAvc3lz
L2J1cy9wbGF0Zm9ybS9kcml2ZXJzL3hoY2ktaGNkL3VuYmluZA0KPiAgIHhoY2lfcGxhdF9yZW1v
dmUoKSAtPiB1c2JfcHV0X2hjZCgpIC0+IGhjZF9yZWxlYXNlKCkgLT4ga2ZyZWUoaGNkKQ0KPiAN
Cj4gICBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgYXQg
dmlydHVhbCBhZGRyZXNzDQo+ICAgMDAwMDAwMDAwMDAwMDA2MA0KPiAgIENhbGwgdHJhY2U6DQo+
ICAgIGR3YzNfcWNvbV9zdXNwZW5kLnBhcnQuMCsweDE3Yy8weDJkMCBbZHdjM19xY29tXQ0KPiAg
ICBkd2MzX3Fjb21fcnVudGltZV9zdXNwZW5kKzB4MmMvMHg0MCBbZHdjM19xY29tXQ0KPiAgICBw
bV9nZW5lcmljX3J1bnRpbWVfc3VzcGVuZCsweDMwLzB4NDQNCj4gICAgX19ycG1fY2FsbGJhY2sr
MHg0Yy8weDE5MA0KPiAgICBycG1fY2FsbGJhY2srMHg2Yy8weDgwDQo+ICAgIHJwbV9zdXNwZW5k
KzB4MTBjLzB4NjIwDQo+ICAgIHBtX3J1bnRpbWVfd29yaysweGM4LzB4ZTANCj4gICAgcHJvY2Vz
c19vbmVfd29yaysweDFlNC8weDRmNA0KPiAgICB3b3JrZXJfdGhyZWFkKzB4NjQvMHg0M2MNCj4g
ICAga3RocmVhZCsweGVjLzB4MTAwDQo+ICAgIHJldF9mcm9tX2ZvcmsrMHgxMC8weDIwDQo+IA0K
PiBGaXhlczogYzVmMTRhYmViNTJiICgidXNiOiBkd2MzOiBxY29tOiBmaXggcGVyaXBoZXJhbCBh
bmQgT1RHIHN1c3BlbmQiKQ0KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiBTaWduZWQt
b2ZmLWJ5OiBGYWlzYWwgSGFzc2FuIDxxdWljX2ZhaXNhbGhAcXVpY2luYy5jb20+DQo+IC0tLQ0K
PiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYyB8IDQgKysrLQ0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5j
DQo+IGluZGV4IDg4ZmI2NzA2YTE4ZC4uMGM3ODQ2NDc4NjU1IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1x
Y29tLmMNCj4gQEAgLTMxOSwxMyArMzE5LDE1IEBAIHN0YXRpYyBib29sIGR3YzNfcWNvbV9pc19o
b3N0KHN0cnVjdCBkd2MzX3Fjb20gKnFjb20pDQo+ICBzdGF0aWMgZW51bSB1c2JfZGV2aWNlX3Nw
ZWVkIGR3YzNfcWNvbV9yZWFkX3VzYjJfc3BlZWQoc3RydWN0IGR3YzNfcWNvbSAqcWNvbSwgaW50
IHBvcnRfaW5kZXgpDQo+ICB7DQo+ICAJc3RydWN0IGR3YzMgKmR3YyA9IHBsYXRmb3JtX2dldF9k
cnZkYXRhKHFjb20tPmR3YzMpOw0KDQpXaGF0IGlmIGR3YyBpcyBub3QgYXZhaWxhYmxlPw0KDQo+
IC0Jc3RydWN0IHVzYl9kZXZpY2UgKnVkZXY7DQo+ICsJc3RydWN0IHVzYl9kZXZpY2UgX19tYXli
ZV91bnVzZWQgKnVkZXY7DQoNClRoaXMgaXMgb2RkLi4uLiBJcyB0aGVyZSBhIHNjZW5hcmlvIHdo
ZXJlIHlvdSBkb24ndCB3YW50IHRvIHNldA0KQ09ORklHX1VTQiBpZiBkd2MzX3Fjb20gaXMgaW4g
dXNlPw0KDQo+ICAJc3RydWN0IHVzYl9oY2QgX19tYXliZV91bnVzZWQgKmhjZDsNCj4gIA0KPiAg
CS8qDQo+ICAJICogRklYTUU6IEZpeCB0aGlzIGxheWVyaW5nIHZpb2xhdGlvbi4NCj4gIAkgKi8N
Cj4gIAloY2QgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShkd2MtPnhoY2kpOw0KPiArCWlmICghaGNk
KQ0KPiArCQlyZXR1cm4gVVNCX1NQRUVEX1VOS05PV047DQo+ICANCj4gICNpZmRlZiBDT05GSUdf
VVNCDQoNClBlcmhhcHMgdGhpcyAjaWZkZWYgc2hvdWxkbid0IG9ubHkgYmUgY2hlY2tpbmcgdGhp
cy4gQnV0IHRoYXQncyBmb3INCmFub3RoZXIgcGF0Y2guDQoNCj4gIAl1ZGV2ID0gdXNiX2h1Yl9m
aW5kX2NoaWxkKGhjZC0+c2VsZi5yb290X2h1YiwgcG9ydF9pbmRleCArIDEpOw0KPiAtLSANCj4g
Mi4xNy4xDQo+IA0KDQpCUiwNClRoaW5o

