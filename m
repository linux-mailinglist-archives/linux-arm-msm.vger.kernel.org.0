Return-Path: <linux-arm-msm+bounces-106032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPTME7Nx+mkDPAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 00:39:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A23D14D468A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 00:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF9753032F41
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 22:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B7BE31F995;
	Tue,  5 May 2026 22:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fIOpegEW";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="P683/KVw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Bq5ZJwfZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4F3291864;
	Tue,  5 May 2026 22:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778020784; cv=fail; b=Xma8y4i1dsfabAMfqalsBHcrznR1sIqwGwhK3cWfYGM806u+XZEdK1ClqH6kN+05XmfuyoP+nIzH5QifyZpEh91jxKLBEgYjyOc3PyXkFpk17NvT+oljo6LHeu01nMEyHAQ3AdWG2WR0iLjmwxYKlNMSLmYJPSw6ZcRWyshX6PQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778020784; c=relaxed/simple;
	bh=egtcTSgMghEYYPGlksAv6R9Ar1GzzVg4E4oGyxeNx3s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JVva3hirqmNOLF8uuIrqd+cbB7ma/FxE8t+lF6tb9sqkeIOeORy7rx0XBxLytobveUZSYarbC1Yb1GmOX3GlQmdmHqj+GycallDlEzktCbJcMV0T5bbSqthT6/29kaCiMvhlkmYsuE0CPNLVZz/EmvG5Vsd9rOWn9u+29fJsOQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=fIOpegEW; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=P683/KVw; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Bq5ZJwfZ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645KlIfI518883;
	Tue, 5 May 2026 15:39:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=egtcTSgMghEYYPGlksAv6R9Ar1GzzVg4E4oGyxeNx3s=; b=
	fIOpegEWqqlHyce8/9mg8k9xspgw0r92XTXMcA/xqsY0mb41EcmBRoIAlP3BjRG3
	WnZOf93Y9a2AjrUfmuG0zTcXKkfLvd/KqvCyLrnRE7uDsfUM0mfPZObRxfGXMhZ2
	tIzXStGOCwAszIH2oOkS+9zDueb2FR90oMhk2ATpFC7DbgrZCHOOL3auhkAULK3L
	jQALdGm9mpOs1QMZERHhqhRM296CqX4pbNHEpYhivVHZBeMtIpBHkXy9O0U5BT10
	elDiBdPKa1IeJSn5xju7F8TX0Y/H2+Vi9tOpMbFB6n14zlCz44/Dd7wxhzYjY6RB
	GCV/YyUG95wpzZJ8dOi2XA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4dykents0e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 15:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1778020772; bh=egtcTSgMghEYYPGlksAv6R9Ar1GzzVg4E4oGyxeNx3s=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=P683/KVwH1AZWSwMCsfNbvTNpmE5MkUhdLqArAG+P/GnuQQyjYzfAdRJOKulvHJeW
	 NXWrVXW57HHuZUhCtY5N4bXYswTAI9S+PhNmcP8qn7NYyxwtgIPjwIeGau7gCZfQE0
	 owdaEo3jyTBcO3CJjJf57FxI7iPpW0Tnnwg6Njkvqz7O6W1U97uabcBZsv2Qe5GJsN
	 xuCUmyCEO8QyZ1KY5TpbNJH8B7aL+9Ofw4mxUtzSKUIZ+gy+sjTXpHqUlc9pMTIkED
	 ZPhcjbNQiM80e6VQMSQCdfwZ1+/2IeXUMJ4O8hbvaDUgn//1420KB4ytlob/lEUVyx
	 znpz4AktxkQlA==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 388114051A;
	Tue,  5 May 2026 22:39:31 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id B39F8A006D;
	Tue,  5 May 2026 22:39:31 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Bq5ZJwfZ;
	dkim-atps=neutral
Received: from SJ0PR08CU001.outbound.protection.outlook.com (mail-sj0pr08cu00105.outbound.protection.outlook.com [40.93.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id DE39740685;
	Tue,  5 May 2026 22:39:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=em6CdwEIhprBxRg9UQYaJ8kUXSrabwTMgYFGTtBNCBnnSJSzGyQ8F0DEidnyXLrcrIfajg+vKKUtQ9Bl+MsSanHvs5zLH/qRm6T7Y6qmcvk7iPzyW2qhBlKAmgz65tFQynGosgI4PdmV93wLceit0ewH9/Dfv/VZhulKy81S9zZxxqMJo5m3zzdw3XRPP6g2wegtV9advGF+y+6DkzmWuvOSpvt1J0REzjYlOxdAomaLjQbCHIy5U2aId0IHtXGwR66EXsBZrVrt7nzBZ5wl9rjuAe8FRnd+znhO+9IpqMTmMv2Ft/T7mWJDYMFlvY5IoAnRHwut9r2mlC+84LKKOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egtcTSgMghEYYPGlksAv6R9Ar1GzzVg4E4oGyxeNx3s=;
 b=s0FF9LlcbAZPGjyowquKIdcS1M0QUaqsPPUHtf7nXea7Q3Gqu4NnTyaiS8FOPICa0U+CpwDwjd8gy79y6AS7LCqRITORWpKCNj77udJvA1CfrUZYshnPcQny9RloOpvBKuxy5zJxCjCuPlfAkaA8wkb8qvxFKe4CESu9akfug0dJ7z6FRCow1Jnut9BQxJvxXg6KrxM+Anhzy1XujLLJn3F4Ja46XIRnP2Ns2PEByJtj3jiOGnvDTWi5F9QWtWE8IYHk7huf2mLq4mw1QYkmwBc9jN+Evzx9q9Ufe3l0RiNl5fK+5byFs4xwtQkYoC5GP3BO5MmXZGlFtve3OexmIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egtcTSgMghEYYPGlksAv6R9Ar1GzzVg4E4oGyxeNx3s=;
 b=Bq5ZJwfZ1SbOAx41G2myueZB0AlpQNZKrB5hJQWoifPjqecvWktdoLHzJQdw4k5h01aOfNsPbBGwyN888pPPRAFzLFeBTzv6dUekzn2dEiWDngh9z4fHjqQhmmjMsr7YYGcJ9K/QheKm7chFLtJqk9O/QvoXG5wCrANoXV82S/E=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SN7PR12MB8130.namprd12.prod.outlook.com (2603:10b6:806:32e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 22:39:22 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 22:39:22 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] usb: dwc3: qcom: Modify interrupt handling for eUSB2
 Phy targets
Thread-Topic: [PATCH v2] usb: dwc3: qcom: Modify interrupt handling for eUSB2
 Phy targets
Thread-Index: AQHc3Mdgyp7z0ntLdECFnZ2Esa74ybYABncA
Date: Tue, 5 May 2026 22:39:22 +0000
Message-ID: <afpu6eF9lDy4KfTN@vbox>
References: <20260505194242.1947891-1-krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260505194242.1947891-1-krishna.kurapati@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SN7PR12MB8130:EE_
x-ms-office365-filtering-correlation-id: 45718966-08da-4c8d-dcc1-08deaaf72740
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 TyuWazilJiaP/wbROW25rGToVtRFDSwxVmUCbYwkqppjMhn9BlnRI/n6WIvI92rGeFJvcwi2r6yBHT4JX/yNTRKDpvRDFOqxJY3S9SNkVevDfw/drvP0/iQU+FjOlV+dmDPuQzA5bkDdubNI8NBgh3Ph/g/mGoHiBAIBVVYUbQDu9Ji8F2l01B98BKS4iE0nH5Z2PtrMd1dULOQhCzGp8jIQeyvsO9sTbRf82V7/VO1uOWQDxHpomaLn/ESdQAnvlJgf6kFTaEr5tCOXa/AxEpeviu+sXbBe3n9UQAsToLfHV8yJONNprP7RHqTDrSKfM6Ci9seyxTbg6wtxZRVJ6dmvoM0A+vkk+jPivAv89pY8dAtfU3AgLEJvVxA1QzRaoW8E9GSVTnEop3atZCgluSH9gp5JPO+YhQ0OuSIPFgnb04xmGHCFzwHLqJJP8Uu5gwCAfzJQYzN1kJ0q+gL6QpcG/K0hWQkchGQ4vDYh1oQP64JgYuGnWLnNJzI7D3eyz5WT5mODdYw17jOVxznjro89KizvGBHqa2TRuEbn4NQGs2yaq8CMDXnNsCDGGxuSCs+dPonltZ8Z4rofAaRDobCdTkbwgLfcU87FDLBiYp6c0r0p3/EyTZDjl5nFxBZK/v05PBOTmGGRMDedAmwSPKkcWmG8AdwuUySRxbU1ek0DLp4VticdEusMxutITs8eFemSbTaaW90zmcqbDHZ/tADqtck2RtlZXsAqT/IzRBH9H5I/DdMS6uFwT8aaZDSh
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YW9HWElZbHAvVjRETmxaVmgyd1V6WFFJYnUyV0ZZaFhGSVVoVmpaR3NHbXRU?=
 =?utf-8?B?bG8xYmhES2FmWVQ4ZFhiU0VXekxrWXROT3ZBMVlGQU1pRk1BWHAvbFlDMS9z?=
 =?utf-8?B?Rmh5N096MGMySklUUWxleXZ0YnEyYm1RbVJrQmtyK0NFcGd2Zm00U0JNU1Fx?=
 =?utf-8?B?azFWOUdEbFVoUTRMeXlzM3ZMY0U1cDRJR0dsVnFraXlGYjFNaTdLR0xIMnBh?=
 =?utf-8?B?QkloNXhla3VvbVJmeGdWY3RQR0tuYWNGaFhjNFcrNmFuRHhZSWNXbWF2Q1hy?=
 =?utf-8?B?alMvck9sY0w1ay9uY0NFNUVudDEyWHBqbTBGNkZOK2k0YWxZdEkzQ1JZMTcx?=
 =?utf-8?B?UHBsTU5HM2hoZkFoaEwwTTh4OWFRMlZ4K0Q1N3psWjJRbmZvZnRSanpTeS9V?=
 =?utf-8?B?Z2hPWXZSWllKWTVUbkZ6dmpqbm1IUFhsSGZXTDJVdktJQW9kZDBCZFZmOTQ5?=
 =?utf-8?B?a1JPY3pURzNTOG1jQ2NrS3U3cGRaUUxrd3BhY3h5Zklib21WOHloTW04TDVX?=
 =?utf-8?B?emU3alZ6NU9HOWNhOGZSNzlCcFpYRkg0cW9zUkVlODQrME5mWVdWRUtUT2do?=
 =?utf-8?B?Z1Z5QldudXZrNjJ0SkJaUUhpQkd3cVo2d2xVSFVGbWdRdzQ0N0hLcEJxcnhu?=
 =?utf-8?B?OEJBNUdIdmpjOUxqWW8vSU0zQXlzZVZjMnV5dE1EdXZZKzgrN0p3aTNoMXo3?=
 =?utf-8?B?N3NMSG1yQk1qNXFjVHA2ZFRMWjcwQ1lQcXgyMGFFVm9YL2hDNXVrS2NyYUh0?=
 =?utf-8?B?YnN3WFh3MkhBZnhHQ0tDRHVSUlB3azVsSDlETWVSeGFTcE5FYktCQ1ZCeGNT?=
 =?utf-8?B?WGZNbmh0dXNhczFOMEp3UjlYb0ttZXREQjRINGRhbEI5d1BsSDhObHZMS09i?=
 =?utf-8?B?WWJJYXJuWlZVUUNBRFZQb1NuK240bmZzTSszd0xRd1ovbHI5Z3pTbHE1NnZw?=
 =?utf-8?B?NGtnNG4yaGFUU2tHT2ZsM2pYNWZNNkFNN3JGbitmY0xjMEt3TXhyNy9hUHgy?=
 =?utf-8?B?MWorK1hFKzl4K01wUDlveENhcC95Tm94SkxveTRkcE1Lb0tTMDZocE81VHdC?=
 =?utf-8?B?NmtnRU5obTNhcFZOYWtvSFpmbHB0NW12OFM4S1Q0ejh1LzRKMUtRQTVvVmFk?=
 =?utf-8?B?MGtTcnQ5T2UrQW9NSjZNWTRxS3dlYU15eHFURktMVllERSsrNjBpYXhGR2k2?=
 =?utf-8?B?eEUyN3hhNEVJRytYc0JJQTU2NjY1NTV1dkJDelllZ1UzUnR3VmhabjJ4WW0r?=
 =?utf-8?B?R2VpRVhhb1VLZ3Z1c2xPa2U0bEJKc2t1bDAzd3I5MlNEVWdBNFBhdFdYcTJQ?=
 =?utf-8?B?dFRQenNCdW1qelZZWWU3UGxyaGhaakY1eEVrVUZRRFlNaWhCRFppWDdyR284?=
 =?utf-8?B?Qi9BZXBLTnlnemxDNHJiODZWOTBkeWxvSUdsRjRoaXB5RFh2RUJrVDJLYWY1?=
 =?utf-8?B?ZzNWazdQc3h6emxYZnBLclZDK0xQNlFMVHJoa2JobVNQRXlZb2h3YXFUd3ZJ?=
 =?utf-8?B?b2lsQzZIaU9IYytlTEVlWkZzTC8wKy9jYm01aFM0WWxRd3Q5R3NYTHNidGJS?=
 =?utf-8?B?RXE2ZzB3dkdxMkxCWVFtRjk5VXF1UVFKeVgvZUp6MWpMeERiZkFuczJKNmls?=
 =?utf-8?B?SEg1UGUvUFBVL1daSzJQaVR0Q08xVFlKZDM4WGp0Yi9HYnhSUit2Y0l5QzI1?=
 =?utf-8?B?S2J2c05hMnk4NlNSdy9yNFJHaWZ1VmdmNTFnTEM2WTg0cUZldkZJLzh4ZmVn?=
 =?utf-8?B?ZHd5VUdXNVBTZDJ4WG9STkxmandKbU9WOWJoVVFwYmRER01uV3ZycTlEbnZ4?=
 =?utf-8?B?N3NrT2E2aEpNUVY2R09kVHppZGluc1oyeThZZ3NQdExFNzRmaUMraktYRTJp?=
 =?utf-8?B?bnFHcnFHelNndERrbWhnaUVyTXNXUldLYXNRdlZJQlc3VWU4WllFOE40Rk9F?=
 =?utf-8?B?YUJYc1BTQVJhdXFXVVA0VjRoR1JWU3hPMVFsWHRYby9JMXgvMmpCRGY3WjRq?=
 =?utf-8?B?bzVmcS83bGU5dkdqWHBmSFVCWkZRU3ZzY1NVN2lSeThWT1RkVWgxcHdqelVT?=
 =?utf-8?B?M1VEVDl1YXp6eU1DVTlERjFtR3ErS0FLa3phaWE2OWozYkFEN3ZFVmxiR042?=
 =?utf-8?B?MEFPVlBGR2VXdFplOGZ3SkVBTU44VEJhcTVWN2xaMXVrOHk1YTN3S2dUeElm?=
 =?utf-8?B?bGNZMWFsT21xL1BVMWRCN00zWFZZSFVibVNldU5RaE9jNUtWMG1lbTRMT0ZK?=
 =?utf-8?B?bk9KcXBtdjI0WUU5Y05CemJSL0Q4TXFYUGdGQzA5SW0xNTJ2NDdXbmlVTDhZ?=
 =?utf-8?B?eVE1bjJGdWt1QU9OQkFaVzZhc3hiTlUrVmxRY2lvQWhPRVVEUlloZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1CF52517EAF4D044BA72934963C0E116@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	aw8tAAE1AF75Lv4o0egH+AJeocfKtPCJKQq4sE7xNFwhW95HueYxzENfVH/fu1a6oDC3lfpirQ5jKsiolAnMMSxhfcyJIzfoXnxQj6Th1K6Bgw+kgR7eVrKHyb9/56PvpYBulqNPbFusuZhzBqutIajj9CcqACnhCc5WlDY2UmnSzy+Vqn9HG/wv5UgYP4DHJMWQzNJaELmHHUULgF5uGQ+ISC/hxak7Uvityqa6jvpQGtcMsNNommrAWKQwhGYmEXwBD550FfLqKMIXxSHxsQuRXVQoKqhl3wr52yBxpM8PUNnDPYFmuyAC+VQe/JOz6KqEFlOjQbAHVHemuOyPSw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bO/dYotxYrZ7EvDqiT1bI37tyRihaoz/8xh33o7Mv9YPoEteTJJNPKn3tm5gM+jPJfEhPcv1CX2NyuJMVSMyaEVJQ9jRohYsj1hxJhGw7Z7fqImNMNPAF2ARd3KNXY6+dLhnW374PDQU8UNS6HGKHSiEw1fsRO/98+Fwyd5JWokgDI9lYYfUPSqo5ZhxvJ0pfg7gQdM0HZ+EmCXVNAvRO8E2XJz7/UtBwyK8pI037TmX9X3Zp7ObzAS3xf3aEI5jNKW1ONuszdTbRvspU0MbCpuUcJmflfxr2yTLOt71SuHBjadMkOhq2qu2tF/isIFlPiCDRPvWj3BwWF9gh/5wCI2aHm8+zpyDYoddg/uWopQwRDrrwI2roo5PvJ7iFeZp0SBxdbSj7bPN7c4PwWoKe+c2xklYAiQ2UWFtBgogmzDF048vCp+DRxEiEo/CK3FchpH12y38HxP1B27VfigACxI9mYNLIpWInB3ybfXIakzqyubjWn101xu2VDhsPJf02HUhGmvzyXeRGQQLUO758kW4s80goIuefGNW+E0lrHekpr4JYjcgIOs4sDf1QYi1EbLgwQI5GYouvnbcISOXPUg3uiyytbWmzdLZx+/LRXYqQ/0rV0nkZmeAxk9GvKrOxwGQgtozUJx0VFCy5zOLmA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45718966-08da-4c8d-dcc1-08deaaf72740
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2026 22:39:22.4771
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7u8Cf6WahGmnEyYlX9+fFX7zFSmWLR/QvUxlYMBizRl6wmrBdj/et9YZ4Wuhg4KPGoSGKJdBXuerdfu1Fc0WOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8130
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDIyMCBTYWx0ZWRfXyLSM04dlr13b
 R/9+xMwp2Cud5P/NhFmSI/2jHMDcmBTqgsZ9kxmoC7YA3fq+VRppgaR5GsC9KDeKfn3cMXmXzTL
 Nh8wEY0iJ+QhnSRpnCLyr15sdQlWcfrnEtoq/R2ru2+cdaoF9t5zLy4j69bXnFgsEAjqWEQE4hc
 aqTzcv+ZQuKVL23vhKO4qJ2VLZCBMk5fngUZ+F8hqDvo2nqOpxQHCg924Ei+5Xrdnv5YGImY27t
 83i57JnlaffAxXGQ1vFnSo5XIMhsw+4R1oH3kU/bpeBQkrJyfLUjfJhlxKQiwsy5GuR5xUH0TXP
 Hcp5zax8UjgfmMUpi2kp5g8S5m0ZDh14GLZArSsegq/Hy9MZnHYIj2zxtJQ2Vb8iRr/NKPgGgUb
 oTumIgRw8YOg+dCoGKwInSKyGsLgEQyi/0oSTcuibkECZqIA9OPXRfqAOm/YX70ol4iGcBH+jgV
 8+LX0SgW4+bOVoCAZnQ==
X-Proofpoint-ORIG-GUID: 4MMppUELSbYY8vhFewWmezDIOQ4XoR5B
X-Authority-Analysis: v=2.4 cv=cIbQdFeN c=1 sm=1 tr=0 ts=69fa71a5 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0BcM_a8esD4ivOiPuZUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 4MMppUELSbYY8vhFewWmezDIOQ4XoR5B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 impostorscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1011 malwarescore=0 adultscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2604200000 definitions=main-2605050220
X-Rspamd-Queue-Id: A23D14D468A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106032-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,urldefense.com:url];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	RCPT_COUNT_SEVEN(0.00)[7];
	REDIRECTOR_URL(0.00)[urldefense.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]

T24gV2VkLCBNYXkgMDYsIDIwMjYsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+IGVVU0IyIHRh
cmdldHMgaGFuZGxlIHdha2V1cCBpbnRlcnJ1cHRzIGRpZmZlcmVudGx5IGRlcGVuZGluZyBvbiBk
ZXZpY2UNCj4gc3BlZWQgd2hlbiBvcGVyYXRpbmcgaW4gaG9zdCBtb2RlLg0KPiANCj4gQWNjb3Jk
aW5nIHRvIHRoZSBlVVNCMiBzcGVjaWZpY2F0aW9uLCByZW1vdGUgd2FrZXVwIHNpZ25hbGluZyBp
biBob3N0DQo+IG1vZGUgaXMgZGV0ZWN0ZWQgdmlhIGRpZmZlcmVudCBkYXRhLWxpbmUgYXNzZXJ0
aW9ucyBiYXNlZCBvbiB0aGUNCj4gY29ubmVjdGVkIGRldmljZSBzcGVlZC4NCj4gDQo+IFdoZW4g
YSBsb3ctc3BlZWQgZGV2aWNlIGlzIGNvbm5lY3RlZCwgdGhlIGhvc3QgcmVwZWF0ZXIgZHJpdmVz
IGVEKyB0bw0KPiBsb2dpYyAnMScgdXBvbiBkZXRlY3RpbmcgYSBLLXN0YXRlIG9uIHRoZSBVU0Ig
bGluZXMgZHVyaW5nIHJlbW90ZSB3YWtldXANCj4gKGVVU0IyIHNwZWNpZmljYXRpb24sIFNlY3Rp
b24gNS41LjE0KS4NCj4gDQo+IFdoZW4gYSBmdWxsLXNwZWVkIG9yIGhpZ2gtc3BlZWQgZGV2aWNl
IGlzIGNvbm5lY3RlZCwgdGhlIGhvc3QgcmVwZWF0ZXINCj4gZHJpdmVzIGVELSB0byBsb2dpYyAn
MScgdXBvbiBkZXRlY3RpbmcgYSBLLXN0YXRlIG9uIHRoZSBVU0IgbGluZSBkdXJpbmcNCj4gcmVt
b3RlIHdha2V1cCAoZVVTQjIgc3BlY2lmaWNhdGlvbiwgU2VjdGlvbnMgNS41LjE1IGFuZCA1LjUu
MTgpLg0KPiANCj4gU2luY2UgdGhlIGVVU0IyIFBIWSdzICJEUCIgYW5kICJETSIgaW50ZXJydXB0
IGxpbmVzIG1vbml0b3IgdGhlIGVEKyBhbmQNCj4gZUQtIGxpbmUgc3RhdGVzLCBjb25maWd1cmUg
dGhlIHdha2V1cCBpbnRlcnJ1cHRzIGFjY29yZGluZ2x5DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBL
cmlzaG5hIEt1cmFwYXRpIDxrcmlzaG5hLmt1cmFwYXRpQG9zcy5xdWFsY29tbS5jb20+DQo+IC0t
LQ0KPiBDaGFuZ2VzIGluIHYyOg0KPiAtIFVwZGF0ZWQgY29tbWl0IG1lc3NhZ2UNCj4gLSBhZGRl
ZCBzdXBwb3J0ZWQgZVVTQjIgdGFyZ2V0cw0KPiANCj4gTGluayB0byB2MToNCj4gaHR0cHM6Ly91
cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDUwMjA5
NTYxNi42NjY5MzgtMS1rcmlzaG5hLmt1cmFwYXRpQG9zcy5xdWFsY29tbS5jb20vX187ISFBNEYy
UjlHX3BnIWVyYWVXWERUX21qUjJpXzN2LWM3TWVsVU5oMWI0SzU5alR5MXBORmgtWVdwZDlKUTN0
VUJET0M1TDhKVlRuUE43VV9kTER0UkJfcVVLeXlob3FqZUVkWm1pcHZtRlhzMVRPXzYxdyQgDQo+
IA0KPiBUaGlzIHBhdGNoIHdhcyB0ZXN0ZWQgb24gR2x5bXVyLg0KPiANCj4gIGRyaXZlcnMvdXNi
L2R3YzMvZHdjMy1xY29tLmMgfCA5OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA5MCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMgYi9kcml2ZXJz
L3VzYi9kd2MzL2R3YzMtcWNvbS5jDQo+IGluZGV4IGY0M2Y3M2FjMzZmZi4uNGZjMDAxN2M2OTdj
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jDQo+ICsrKyBiL2Ry
aXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMNCj4gQEAgLTYwLDYgKzYwLDEwIEBAIHN0YXRpYyBj
b25zdCB1MzIgcHdyX2V2bnRfaXJxX3N0YXRfcmVnW0RXQzNfUUNPTV9NQVhfUE9SVFNdID0gew0K
PiAgCTB4MjM4LA0KPiAgfTsNCj4gIA0KPiArc3RydWN0IGR3YzNfcWNvbV9wbGF0Zm9ybV9kYXRh
IHsNCj4gKwlib29sCQkJdXNlc19ldXNiMl9waHk7DQo+ICt9Ow0KPiArDQo+ICBzdHJ1Y3QgZHdj
M19xY29tX3BvcnQgew0KPiAgCWludAkJCXF1c2IyX3BoeV9pcnE7DQo+ICAJaW50CQkJZHBfaHNf
cGh5X2lycTsNCj4gQEAgLTg1LDYgKzg5LDcgQEAgc3RydWN0IGR3YzNfcWNvbSB7DQo+ICAJc3Ry
dWN0IGljY19wYXRoCQkqaWNjX3BhdGhfYXBwczsNCj4gIA0KPiAgCWVudW0gdXNiX3JvbGUJCWN1
cnJlbnRfcm9sZTsNCj4gKwlib29sCQkJdXNlc19ldXNiMl9waHk7DQo+ICB9Ow0KPiAgDQo+ICAj
ZGVmaW5lIHRvX2R3YzNfcWNvbShkKSBjb250YWluZXJfb2YoKGQpLCBzdHJ1Y3QgZHdjM19xY29t
LCBkd2MpDQo+IEBAIC0yNzIsMTUgKzI3NywyMSBAQCBzdGF0aWMgdm9pZCBkd2MzX3Fjb21fZGlz
YWJsZV93YWtldXBfaXJxKGludCBpcnEpDQo+ICAJZGlzYWJsZV9pcnFfbm9zeW5jKGlycSk7DQo+
ICB9DQo+ICANCj4gLXN0YXRpYyB2b2lkIGR3YzNfcWNvbV9kaXNhYmxlX3BvcnRfaW50ZXJydXB0
cyhzdHJ1Y3QgZHdjM19xY29tX3BvcnQgKnBvcnQpDQo+ICtzdGF0aWMgdm9pZCBkd2MzX3Fjb21f
ZGlzYWJsZV9wb3J0X2ludGVycnVwdHMoc3RydWN0IGR3YzNfcWNvbSAqcWNvbSwgaW50IGkpDQo+
ICB7DQoNCldlIHNob3VsZCByZW5hbWUgaSB0byBwb3J0X2luZGV4IG9yIHNvbWV0aGluZyBtb3Jl
IGRlc2NyaXB0aXZlLg0KDQo+ICsJc3RydWN0IGR3YzNfcWNvbV9wb3J0ICpwb3J0ID0gJnFjb20t
PnBvcnRzW2ldOw0KPiArDQo+ICAJZHdjM19xY29tX2Rpc2FibGVfd2FrZXVwX2lycShwb3J0LT5x
dXNiMl9waHlfaXJxKTsNCj4gIA0KPiAgCWlmIChwb3J0LT51c2IyX3NwZWVkID09IFVTQl9TUEVF
RF9MT1cpIHsNCj4gLQkJZHdjM19xY29tX2Rpc2FibGVfd2FrZXVwX2lycShwb3J0LT5kbV9oc19w
aHlfaXJxKTsNCj4gKwkJZHdjM19xY29tX2Rpc2FibGVfd2FrZXVwX2lycShxY29tLT51c2VzX2V1
c2IyX3BoeSA/DQo+ICsJCQkJCSAgICAgcG9ydC0+ZHBfaHNfcGh5X2lycSA6DQo+ICsJCQkJCSAg
ICAgcG9ydC0+ZG1faHNfcGh5X2lycSk7DQo+ICAJfSBlbHNlIGlmICgocG9ydC0+dXNiMl9zcGVl
ZCA9PSBVU0JfU1BFRURfSElHSCkgfHwNCj4gIAkJCShwb3J0LT51c2IyX3NwZWVkID09IFVTQl9T
UEVFRF9GVUxMKSkgew0KPiAtCQlkd2MzX3Fjb21fZGlzYWJsZV93YWtldXBfaXJxKHBvcnQtPmRw
X2hzX3BoeV9pcnEpOw0KPiArCQlkd2MzX3Fjb21fZGlzYWJsZV93YWtldXBfaXJxKHFjb20tPnVz
ZXNfZXVzYjJfcGh5ID8NCj4gKwkJCQkJICAgICBwb3J0LT5kbV9oc19waHlfaXJxIDoNCj4gKwkJ
CQkJICAgICBwb3J0LT5kcF9oc19waHlfaXJxKTsNCj4gIAl9IGVsc2Ugew0KPiAgCQlkd2MzX3Fj
b21fZGlzYWJsZV93YWtldXBfaXJxKHBvcnQtPmRwX2hzX3BoeV9pcnEpOw0KPiAgCQlkd2MzX3Fj
b21fZGlzYWJsZV93YWtldXBfaXJxKHBvcnQtPmRtX2hzX3BoeV9pcnEpOw0KPiBAQCAtMjg5LDgg
KzMwMCwxMCBAQCBzdGF0aWMgdm9pZCBkd2MzX3Fjb21fZGlzYWJsZV9wb3J0X2ludGVycnVwdHMo
c3RydWN0IGR3YzNfcWNvbV9wb3J0ICpwb3J0KQ0KPiAgCWR3YzNfcWNvbV9kaXNhYmxlX3dha2V1
cF9pcnEocG9ydC0+c3NfcGh5X2lycSk7DQo+ICB9DQo+ICANCj4gLXN0YXRpYyB2b2lkIGR3YzNf
cWNvbV9lbmFibGVfcG9ydF9pbnRlcnJ1cHRzKHN0cnVjdCBkd2MzX3Fjb21fcG9ydCAqcG9ydCkN
Cj4gK3N0YXRpYyB2b2lkIGR3YzNfcWNvbV9lbmFibGVfcG9ydF9pbnRlcnJ1cHRzKHN0cnVjdCBk
d2MzX3Fjb20gKnFjb20sIGludCBpKQ0KPiAgew0KPiArCXN0cnVjdCBkd2MzX3Fjb21fcG9ydCAq
cG9ydCA9ICZxY29tLT5wb3J0c1tpXTsNCj4gKw0KPiAgCWR3YzNfcWNvbV9lbmFibGVfd2FrZXVw
X2lycShwb3J0LT5xdXNiMl9waHlfaXJxLCAwKTsNCj4gIA0KPiAgCS8qDQo+IEBAIC0zMDMsMTEg
KzMxNiwxOSBAQCBzdGF0aWMgdm9pZCBkd2MzX3Fjb21fZW5hYmxlX3BvcnRfaW50ZXJydXB0cyhz
dHJ1Y3QgZHdjM19xY29tX3BvcnQgKnBvcnQpDQo+ICAJICovDQo+ICANCj4gIAlpZiAocG9ydC0+
dXNiMl9zcGVlZCA9PSBVU0JfU1BFRURfTE9XKSB7DQo+IC0JCWR3YzNfcWNvbV9lbmFibGVfd2Fr
ZXVwX2lycShwb3J0LT5kbV9oc19waHlfaXJxLA0KPiArCQlkd2MzX3Fjb21fZW5hYmxlX3dha2V1
cF9pcnEocWNvbS0+dXNlc19ldXNiMl9waHkgPw0KPiArCQkJCQkgICAgcG9ydC0+ZHBfaHNfcGh5
X2lycSA6DQo+ICsJCQkJCSAgICBwb3J0LT5kbV9oc19waHlfaXJxLA0KPiArCQkJCQkgICAgcWNv
bS0+dXNlc19ldXNiMl9waHkgPw0KPiArCQkJCQkgICAgSVJRX1RZUEVfRURHRV9SSVNJTkcgOg0K
PiAgCQkJCQkgICAgSVJRX1RZUEVfRURHRV9GQUxMSU5HKTsNCj4gIAl9IGVsc2UgaWYgKChwb3J0
LT51c2IyX3NwZWVkID09IFVTQl9TUEVFRF9ISUdIKSB8fA0KPiAgCQkJKHBvcnQtPnVzYjJfc3Bl
ZWQgPT0gVVNCX1NQRUVEX0ZVTEwpKSB7DQo+IC0JCWR3YzNfcWNvbV9lbmFibGVfd2FrZXVwX2ly
cShwb3J0LT5kcF9oc19waHlfaXJxLA0KPiArCQlkd2MzX3Fjb21fZW5hYmxlX3dha2V1cF9pcnEo
cWNvbS0+dXNlc19ldXNiMl9waHkgPw0KPiArCQkJCQkgICAgcG9ydC0+ZG1faHNfcGh5X2lycSA6
DQo+ICsJCQkJCSAgICBwb3J0LT5kcF9oc19waHlfaXJxLA0KPiArCQkJCQkgICAgcWNvbS0+dXNl
c19ldXNiMl9waHkgPw0KPiArCQkJCQkgICAgSVJRX1RZUEVfRURHRV9SSVNJTkcgOg0KPiAgCQkJ
CQkgICAgSVJRX1RZUEVfRURHRV9GQUxMSU5HKTsNCg0KSSB3b3VsZCBqdXN0IHVzZSBpZi1lbHNl
IGFuZCBzb21lIGxvY2FsIHZhcmlhYmxlIGhlcmUgaW5zdGVhZCBvZiB0aGUNCnRlcm5hcnkgb3Bl
cmF0b3IgZm9yIGJldHRlciByZWFkYWJpbGl0eS4NCg0KPiAgCX0gZWxzZSB7DQo+ICAJCWR3YzNf
cWNvbV9lbmFibGVfd2FrZXVwX2lycShwb3J0LT5kcF9oc19waHlfaXJxLA0KPiBAQCAtMzI0LDcg
KzM0NSw3IEBAIHN0YXRpYyB2b2lkIGR3YzNfcWNvbV9kaXNhYmxlX2ludGVycnVwdHMoc3RydWN0
IGR3YzNfcWNvbSAqcWNvbSkNCj4gIAlpbnQgaTsNCj4gIA0KPiAgCWZvciAoaSA9IDA7IGkgPCBx
Y29tLT5udW1fcG9ydHM7IGkrKykNCj4gLQkJZHdjM19xY29tX2Rpc2FibGVfcG9ydF9pbnRlcnJ1
cHRzKCZxY29tLT5wb3J0c1tpXSk7DQo+ICsJCWR3YzNfcWNvbV9kaXNhYmxlX3BvcnRfaW50ZXJy
dXB0cyhxY29tLCBpKTsNCj4gIH0NCj4gIA0KPiAgc3RhdGljIHZvaWQgZHdjM19xY29tX2VuYWJs
ZV9pbnRlcnJ1cHRzKHN0cnVjdCBkd2MzX3Fjb20gKnFjb20pDQo+IEBAIC0zMzIsNyArMzUzLDcg
QEAgc3RhdGljIHZvaWQgZHdjM19xY29tX2VuYWJsZV9pbnRlcnJ1cHRzKHN0cnVjdCBkd2MzX3Fj
b20gKnFjb20pDQo+ICAJaW50IGk7DQo+ICANCj4gIAlmb3IgKGkgPSAwOyBpIDwgcWNvbS0+bnVt
X3BvcnRzOyBpKyspDQo+IC0JCWR3YzNfcWNvbV9lbmFibGVfcG9ydF9pbnRlcnJ1cHRzKCZxY29t
LT5wb3J0c1tpXSk7DQo+ICsJCWR3YzNfcWNvbV9lbmFibGVfcG9ydF9pbnRlcnJ1cHRzKHFjb20s
IGkpOw0KPiAgfQ0KPiAgDQo+ICBzdGF0aWMgaW50IGR3YzNfcWNvbV9zdXNwZW5kKHN0cnVjdCBk
d2MzX3Fjb20gKnFjb20sIGJvb2wgd2FrZXVwKQ0KPiBAQCAtNjA5LDYgKzYzMCw3IEBAIHN0cnVj
dCBkd2MzX2dsdWVfb3BzIGR3YzNfcWNvbV9nbHVlX29wcyA9IHsNCj4gIA0KPiAgc3RhdGljIGlu
dCBkd2MzX3Fjb21fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIHsNCj4g
Kwljb25zdCBzdHJ1Y3QgZHdjM19xY29tX3BsYXRmb3JtX2RhdGEgKnBkYXRhOw0KPiAgCXN0cnVj
dCBkd2MzX3Byb2JlX2RhdGEJcHJvYmVfZGF0YSA9IHt9Ow0KPiAgCXN0cnVjdCBkZXZpY2UJCSpk
ZXYgPSAmcGRldi0+ZGV2Ow0KPiAgCXN0cnVjdCBkd2MzX3Fjb20JKnFjb207DQo+IEBAIC02MjQs
NiArNjQ2LDEwIEBAIHN0YXRpYyBpbnQgZHdjM19xY29tX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpDQo+ICANCj4gIAlxY29tLT5kZXYgPSAmcGRldi0+ZGV2Ow0KPiAgDQo+ICsJ
cGRhdGEgPSBkZXZpY2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsNCj4gKwlpZiAocGRhdGEpDQo+ICsJ
CXFjb20tPnVzZXNfZXVzYjJfcGh5ID0gcGRhdGEtPnVzZXNfZXVzYjJfcGh5Ow0KPiArDQo+ICAJ
cWNvbS0+cmVzZXRzID0gZGV2bV9yZXNldF9jb250cm9sX2FycmF5X2dldF9vcHRpb25hbF9leGNs
dXNpdmUoZGV2KTsNCj4gIAlpZiAoSVNfRVJSKHFjb20tPnJlc2V0cykpIHsNCj4gIAkJcmV0dXJu
IGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgUFRSX0VSUihxY29tLT5yZXNldHMpLA0KPiBAQCAt
ODM4LDggKzg2NCw2MyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgZHdjM19xY29t
X2Rldl9wbV9vcHMgPSB7DQo+ICAJLnByZXBhcmUgPSBwbV9zbGVlcF9wdHIoZHdjM19xY29tX3By
ZXBhcmUpLA0KPiAgfTsNCj4gIA0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBkd2MzX3Fjb21fcGxh
dGZvcm1fZGF0YSBkd2MzX3Fjb21fcGRhdGEgPSB7DQo+ICsJLnVzZXNfZXVzYjJfcGh5ID0gZmFs
c2UsDQo+ICt9Ow0KDQpEbyB3ZSBuZWVkIHRoaXMgcGRhdGEgZm9yIG5vbi1lVVNCMiB0YXJnZXRz
Pw0KDQo+ICsNCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHdjM19xY29tX3BsYXRmb3JtX2RhdGEg
ZHdjM19xY29tX2dseW11cl9wZGF0YSA9IHsNCj4gKwkudXNlc19ldXNiMl9waHkgPSB0cnVlLA0K
PiArfTsNCj4gKw0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZHdjM19xY29t
X29mX21hdGNoW10gPSB7DQo+IC0JeyAuY29tcGF0aWJsZSA9ICJxY29tLHNucHMtZHdjMyIgfSwN
Cj4gKwl7DQo+ICsJCS5jb21wYXRpYmxlID0gInFjb20sc25wcy1kd2MzIiwNCj4gKwkJLmRhdGEg
PSAmZHdjM19xY29tX3BkYXRhLA0KPiArCX0sDQo+ICsJew0KPiArCQkuY29tcGF0aWJsZSA9ICJx
Y29tLGVsaXphLWR3YzMiLA0KPiArCQkuZGF0YSA9ICZkd2MzX3Fjb21fZ2x5bXVyX3BkYXRhLA0K
PiArCX0sDQo+ICsJew0KPiArCQkuY29tcGF0aWJsZSA9ICJxY29tLGdseW11ci1kd2MzIiwNCj4g
KwkJLmRhdGEgPSAmZHdjM19xY29tX2dseW11cl9wZGF0YSwNCj4gKwl9LA0KPiArCXsNCj4gKwkJ
LmNvbXBhdGlibGUgPSAicWNvbSxnbHltdXItZHdjMy1tcCIsDQo+ICsJCS5kYXRhID0gJmR3YzNf
cWNvbV9nbHltdXJfcGRhdGEsDQo+ICsJfSwNCj4gKwl7DQo+ICsJCS5jb21wYXRpYmxlID0gInFj
b20sZ2x5bXVyLWR3YzMtbXAiLA0KPiArCQkuZGF0YSA9ICZkd2MzX3Fjb21fZ2x5bXVyX3BkYXRh
LA0KPiArCX0sDQo+ICsJew0KPiArCQkuY29tcGF0aWJsZSA9ICJxY29tLGthYW5hcGFsaS1kd2Mz
IiwNCj4gKwkJLmRhdGEgPSAmZHdjM19xY29tX2dseW11cl9wZGF0YSwNCj4gKwl9LA0KPiArCXsN
Cj4gKwkJLmNvbXBhdGlibGUgPSAicWNvbSxtaWxvcy1kd2MzIiwNCj4gKwkJLmRhdGEgPSAmZHdj
M19xY29tX2dseW11cl9wZGF0YSwNCj4gKwl9LA0KPiArCXsNCj4gKwkJLmNvbXBhdGlibGUgPSAi
cWNvbSxzbTg1NTAtZHdjMyIsDQo+ICsJCS5kYXRhID0gJmR3YzNfcWNvbV9nbHltdXJfcGRhdGEs
DQo+ICsJfSwNCg0KRHVwbGljYXRlIGNvcHktcGFzdGUgaXNzdWU/DQoNCj4gKwl7DQo+ICsJCS5j
b21wYXRpYmxlID0gInFjb20sc204NjUwLWR3YzMiLA0KPiArCQkuZGF0YSA9ICZkd2MzX3Fjb21f
Z2x5bXVyX3BkYXRhLA0KPiArCX0sDQo+ICsJew0KPiArCQkuY29tcGF0aWJsZSA9ICJxY29tLHNt
ODc1MC1kd2MzIiwNCj4gKwkJLmRhdGEgPSAmZHdjM19xY29tX2dseW11cl9wZGF0YSwNCj4gKwl9
LA0KPiArCXsNCj4gKwkJLmNvbXBhdGlibGUgPSAicWNvbSx4MWU4MDEwMC1kd2MzIiwNCj4gKwkJ
LmRhdGEgPSAmZHdjM19xY29tX2dseW11cl9wZGF0YSwNCj4gKwl9LA0KPiArCXsNCj4gKwkJLmNv
bXBhdGlibGUgPSAicWNvbSx4MWU4MDEwMC1kd2MzLW1wIiwNCj4gKwkJLmRhdGEgPSAmZHdjM19x
Y29tX2dseW11cl9wZGF0YSwNCj4gKwl9LA0KPiAgCXsgfQ0KPiAgfTsNCj4gIE1PRFVMRV9ERVZJ
Q0VfVEFCTEUob2YsIGR3YzNfcWNvbV9vZl9tYXRjaCk7DQo+IC0tIA0KPiAyLjM0LjENCj4gDQoN
CkJSLA0KVGhpbmg=

