Return-Path: <linux-arm-msm+bounces-77648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C4FBE5B30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 00:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8700E4E2C19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 22:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495A4255E34;
	Thu, 16 Oct 2025 22:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="nLNgdNW3";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="T4sPBP5m";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ERe2z0uh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBE23BB5A;
	Thu, 16 Oct 2025 22:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760654187; cv=fail; b=FRJJ+CtjDSt1Qdp2Z44zNrkU+QO/um7ULx//KZXaJdmzAUg9xfglju1mDnbfMI0qEi/A7w4IzcRXwoUebA1CDrbhs/cqfSaQPqXTD4N5EPlv8kCByIGlVs9HBlGzEEO3FaHiv7kOD3/dN6JkNLMVIPM/FjmtG4GCHyJ8Y7lgRbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760654187; c=relaxed/simple;
	bh=MbKchlVWsf0JLGq34qZnq4WzCcVatt5VxcUXW31HUDY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Nst1wNU28NP/m/dOB7bZehIJLqBPYH+/Y8Bi0tXSVxuPsW5EgZMubdzYXBJG2gVjEWTVUutdqf7Gwhd3hHr9DJPdyWpG0KRRXmcDDTj+tMOo+B+ApL/W2/pl5H81Cky1EsI1YLjlmAdI7q9cuaikGhA4Y9S52fonGYwcKXT1ers=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=nLNgdNW3; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=T4sPBP5m; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ERe2z0uh reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GLmTQW002325;
	Thu, 16 Oct 2025 15:35:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=MbKchlVWsf0JLGq34qZnq4WzCcVatt5VxcUXW31HUDY=; b=
	nLNgdNW3RHJ/YaA2vl6aIlq2imFWjZolERqa+HmvFoAjBh0PXFlA+Wam6z65Cni7
	qc7j2Tb68xDaTaMnynThRDwp8zmBvkxndRO7peFTG9AIT18g9XZaT4DJK0vyDOgr
	5xD1P803twdqzRAGmYQqj9pZoEYr3mUlPuQUSz3OGcJZskGOFYbMte47spHDk2vL
	DH93WZOQtOuA994gXe/ED+/o7qw27I+c+CKQOZ71gW4xms5DE3TC4i5bvOxgkt7z
	Uv6C69UHt4b5uFehUDvK6Ev2m1KEZAtH44/9/CMjvLEWe6pESBtCOzvb5yFhU1jJ
	Kk2g2r9Y6BxSEjOoy0WdfQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 49qp8jmegv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Oct 2025 15:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1760654156; bh=MbKchlVWsf0JLGq34qZnq4WzCcVatt5VxcUXW31HUDY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=T4sPBP5m56l4OejgJoTvenpgsQVpIrZLb8KR6maRfhotb74k8n213Ju5me3Ii6puy
	 Oq7hz93Y4WMRY0nOEdgvQrQCtFPUtXWJKAn50WXuA9GIkF6epGbz82EfRBYtW2uTjP
	 h1cz2q453XzPNdO+M9bBgNokKu3BNF3e7f400JNGUD/OCKud41yGWdPibUFVDSQ/7W
	 /Pw9RkCA98254k3yWxbWHLR0Fjw2T2AHxJN/4pKBdtkE1L/JqZ4hcwnrX/tniKGVUB
	 tyS2UREXRlFscoCELS1ZyYn9v6qf7IL27z0SIkr5eBpH0366zVC7ZOzpjrU30qb4QA
	 guICZP/Sb6ZnA==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 677844045D;
	Thu, 16 Oct 2025 22:35:56 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 375BAA0078;
	Thu, 16 Oct 2025 22:35:56 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ERe2z0uh;
	dkim-atps=neutral
Received: from SN1PR07CU001.outbound.protection.outlook.com (mail-sn1pr07cu00107.outbound.protection.outlook.com [40.93.14.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 35D4040826;
	Thu, 16 Oct 2025 22:35:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fgcK2XO3cEz2jg4GrO/LVGGg8hMnRMySZY1WqA7OcPN1MAjzwbJrCd/2dCe5J1pFLwOkZhHI7mUgufaBQMPQ242vI49c6/UVe++86A0mYzfcNKRIFZiKayT+nDMRkukrTYRm6YYdlGXJqG0ISXwgCtU0S3FJ53FjVoj/0KTYZkjiSrW292YzLXkoWXqkixBl/JU9vrg+ZKpSrSGZBHwDbB215Xs1L4GDA9no4+99P/8yHT/193sF8sj0Wpv7Q8aC/lBqfxi7uSBKMINlA19N9IZJrSp5n23l38SYaVB9ds1gfPV/XrW3pUrc0oOr7D2pVt7iGjpdnMg2HoE2W/DtOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MbKchlVWsf0JLGq34qZnq4WzCcVatt5VxcUXW31HUDY=;
 b=ebDYWkl+agmeo17WYE+xgk4M27r0/NWty/qbdob/cJvZYucvO3VVxnzd+T/l0Bqyz4dn7oJsHALsY6FmglIA/q2f6nj3UyN+tPowozbBL+zhF1QMzJZ/ItN3fXtgHUmlmgSYt/XRSpa96UCXI5eVjpJDrKaO/S6HVIEysLzJKIezMxuJfY4v/9eTEsIyA9Q2gN/nf5ijRM5MJ+fFNfU8H3DJwnwNvKRdfdHjL96AXINkCUm2nhEH7FtheU44Iod4qVg4cZNB8n4frQerY6uB8VF6jL1C4zkenj7Q2B3MzwyTmi+zM3kPr39kc8w7k1L17f4Ttqx6s2dakMX7w2nGEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbKchlVWsf0JLGq34qZnq4WzCcVatt5VxcUXW31HUDY=;
 b=ERe2z0uhVXQWrN/sg92Oq9t6ckn0N5YI8yvAZLGfUQpMf5mC5kHkZLuVsKX322PkTFYOTDH7SObSkIeWx8It5t6J3JRelX0Zj9jhDM3hOa1kQYfCT0CLerJ8pJ+pi53b1f891vvCNvaFj1VX2Voys4+5tMw8tWxnSahQZh8FmO4=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH7PR12MB8156.namprd12.prod.outlook.com (2603:10b6:510:2b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 22:35:51 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 22:35:51 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
CC: kernel test robot <lkp@intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "dmitry.baryshkov@oss.qualcomm.com" <dmitry.baryshkov@oss.qualcomm.com>,
        "konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/2] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
Thread-Topic: [PATCH v5 2/2] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
Thread-Index: AQHcICNEvjCESpFQw0WLPjECsnplHrSJm70AgACmigCAO1fiAA==
Date: Thu, 16 Oct 2025 22:35:51 +0000
Message-ID: <20251016223548.7nkkkew5gbarsk4m@synopsys.com>
References: <20250907181412.2174616-3-krishna.kurapati@oss.qualcomm.com>
 <202509090115.dVhd78BE-lkp@intel.com>
 <8d8fe2c8-6b56-43a6-8a28-5150514da691@oss.qualcomm.com>
In-Reply-To: <8d8fe2c8-6b56-43a6-8a28-5150514da691@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH7PR12MB8156:EE_
x-ms-office365-filtering-correlation-id: 3f1e1b81-05f1-4baa-ef80-08de0d045c7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?TDljUW1Mb3N0ZlpzRkhtS1d3QzRiYjdoU1lTOWZpMTd1QmdSaWdjbS9IZ29z?=
 =?utf-8?B?QjhTODl4Z2YxSzlsZnQ1WnRTaTlEZmdHOS80c3JMV0xrMkx0V3VTcHBQNUto?=
 =?utf-8?B?ZFlGRE9QckVwZXhoMU1Wa25PRGRqZ3FRTFFWaUZ2cmlJTFJtdk9JWkZ3YkZi?=
 =?utf-8?B?R0NnWHV4ck03NGdYQXluenBTRjRqUW9zS1VGMVZYYlV1ZlVZeDVTK0k0ZlNE?=
 =?utf-8?B?S0NaamlmbjdOYWRoU3FoUnB5Nm9FS1FyTmZ5SkN6QkJ5V3hFektiWnNueDIv?=
 =?utf-8?B?SGpMSVhmWFpUUTk5Z3Y2ek5KcU8yN2RJYVVVMHRZaVVtVldEVUJCVWw2R3BW?=
 =?utf-8?B?dFJDTkxLZWs3S1BnajhWdHkzSzUwRnk0TWhzWXpMYkFuRjhRV1p2WUo4SWZs?=
 =?utf-8?B?T2JJRUZoZVRhbThoWGtYdVY1cldXM1JFZnlJeWZQRy9rZGE3dG9RTkJvK2NL?=
 =?utf-8?B?WVVvdHdub2lmbWFnOFJuTWdaTnNQdkxpOEtkWE5kenl3akxhK2h4dDgrcFFG?=
 =?utf-8?B?U3RsTXQzTlpFMEFwNzQxZmFDQm9OWlVFY1hxdHBPRW5JaHhMS0hGa0t2cGdi?=
 =?utf-8?B?MlVEOVJLZ1psWHI0UVFCTlNwNU9qNnhWYXRDTXNxb0NFLzFpZmZTRjl2WTVF?=
 =?utf-8?B?RGdZUVExVlNjNVFDbEpOTmw0Z2NKbldjaHp5SE5hOXQ1RzBtM3c3NUZSVzFX?=
 =?utf-8?B?RDNndUVpRk1wR1ZuUUtsMVZqTFI3TkpHZnJQcEVPcG9WcE1ybm5JRWN4cWk4?=
 =?utf-8?B?dWRvQXg5S1ZzdmdXVVNWYnlTa2FrdFpCcmJmT21mSkNQZEtpSVFuZTZZWmRk?=
 =?utf-8?B?R1V5bitGdEgxWW9ja1BsZ1d1dVF2ZktIRWhkY3B4cisxcWFDSUY0TXNHQzRW?=
 =?utf-8?B?aFoxVmRVQUhLWDY0REZGbHhtYWtTZnFOYWFUZ3o3bWplMTlQTlgxc1g0aGxl?=
 =?utf-8?B?TFA0QjVtYktjNU45dEY5SkZCRkZEc3YzNTBCQkduN3k4QmhtT21ydGZjMVgy?=
 =?utf-8?B?QUNXSUljeVdsejlVcGlHMU9wTVBFWkNJMmJhNWo1bGVBbFQ4cHZjSktWS0lD?=
 =?utf-8?B?SzNYOWJWZy9ZOUZIVi9ScS9UdWVRMkovazVIWDBLcW8zbGRGZytkYmhZaWcv?=
 =?utf-8?B?bE5YR0I4ZGt0QWlnT2IzZGNPaWJ0d2hXYkp5QU52bVU5dXlMamxpTlcyRkl5?=
 =?utf-8?B?ZVZnakZIcTA4aWcwcUh0LzFHMnQrR3ZmQ0dvb0YvSjc5VjgyUlhtMzFTU3lQ?=
 =?utf-8?B?eWkyVTlOcVp6aEZDMHVHaWZXaUlQcVV2VVRCdDhLdlhXUjE5VmtGdWdqVHBH?=
 =?utf-8?B?R01wNTZmdGZwa0tuN2NNUkpzMC83QTJGTkxIOHZsSklFMnkxL1NleXBEL2RG?=
 =?utf-8?B?ZUE1KzNZbldjMU9nUGZqeFFvelNVS09iZDRkRCtncGlFMDFmY25yamt1ejlG?=
 =?utf-8?B?UEZYVUdNMHQ3UlRnS0xzd0E3OHp1UDdDcGkxbWthZTdCclNqZmttZ2xpWklB?=
 =?utf-8?B?NkdPWEZHTDhlSld3Q0dxbHNyVS90QWVJRVRRZWx0ckFZa0hLRG1rWTlRdmdj?=
 =?utf-8?B?NnZTcnV6QklpcUhlSW1QWEpEWDV0c3ZabWZhQnF0ZW5SSlJGUDZ3bnVibHNa?=
 =?utf-8?B?djkrSkpENWtLdTFCamtnMHBsVnc0cW5jNEFPOVhZSitNK3FuSkNhQ3IrNzNS?=
 =?utf-8?B?NzBOKzE1SzZOZzBNcGhsYVk0NSt2akpSK0V5dHplOHNTbjd6bm1zQjc4eVU2?=
 =?utf-8?B?cHViS1Y1RUFXbW1hSGZvcFVvZkVLZm5IeEFBWUNCTGh4UW9QN2oxWjc2VVFT?=
 =?utf-8?B?TmxuV3NHQzFLMWVrYTN3cjNTdU8rMUUwbXlod3N1MUtlUWpxbVAyYlBzRXhh?=
 =?utf-8?B?d0VWcmRNMU9tTVlYUThTclJhenpQV2M5QkMvamxPRXlRU1JrYlFvQW5rWTFY?=
 =?utf-8?B?WUoxYlQ5aWcrNjBnQlR6Z2dTRkRWdm9LOFRpQlFhekowbVNJR0I5cmhvSnFx?=
 =?utf-8?B?bUYzUWZDOUtBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U3BLaFVrY0docHJHZWxpR3lIOXdNMC9TSWUzbnJwZmhCbUtqOGxEb2dKWWFj?=
 =?utf-8?B?Z3hUZ1pNUEp6UXBKNnFBcjU5clVPU2pKUC8xMUtpMnJXcDdMOEI0TnRkZ09Y?=
 =?utf-8?B?Zk9YT1RaazNPWURpSmQwOUdvY2hxK0JrVjlkTnJZR2Uxb1Rueit1aGgwTDFt?=
 =?utf-8?B?M3lhOUkydWp4WHU5UllnNEdoY0tkYUNIQ21HK1VHUXZLc1JDSmRGcitqSU9U?=
 =?utf-8?B?eld1YzByS3k4eGdrUk5PWlZDTUt1MFZmS2srbUgwdHF5RlNHT043bjdLeWYv?=
 =?utf-8?B?UVBoYU9LMFlrTUp3bGV2eEoyOUYvcG5mY3IzWlBnUGtvMGNhSGc0UU83b0dS?=
 =?utf-8?B?b2dTa2o0ZDFLTFBnWVQ3bjR3ZGlMRWRmSDdaMklvQUk5emswY1prNkVqZXpY?=
 =?utf-8?B?UHMxNERSbGxmd3BXRHZhZWZSdlZoZmJaWURlTndubXhtM0tKb3Z3VUx2VUNH?=
 =?utf-8?B?YmZCaFAvY0t2dUdBL25LRnJYUVMxY1NCak5TV3ozbUhSKzdWOUJGRWdkOEFC?=
 =?utf-8?B?TUFjdkVVNzY2czFTN0xvZDR3aHJ6a3l2UytmVGJyd1o2eVo4TCsvNFlkODR6?=
 =?utf-8?B?MHYvYTlhSWROWGwxaHJtQ3orVnY1eHpsZjlUY1hWNkE0d1IyRFBFelc5RGpU?=
 =?utf-8?B?OEtZTEQ4K3psNUQ3NmRkTkp0aTl3YU5nM3lDRUc4U3FORUo3QnNmcWtYd2E4?=
 =?utf-8?B?Q3NwUjhMdG1aaC84QnZFNm5nckV3Zld0Y2JpckZHVFZFRUtZM21SSjh5Z3A2?=
 =?utf-8?B?elVXV3V3NlBaeXpuTnhycjBsT2lWVHFRZXNucEVoRFRkQ0lDQmh5Q0lvd0xk?=
 =?utf-8?B?TnNUVEdyZTFQRHJmK2dQcDlybWhsQkozQ2ZuR1hDaXM0MklwZk01cXdlMVB1?=
 =?utf-8?B?K3N0ZjRBY2RiRXRFQXAzSHoxeXNSOExvN0RrV2tESFBSbkMzQjV3eDdrZ3Vj?=
 =?utf-8?B?d0pickplOTBUTkFHTjFRblNpbkFOaUdaVlQwM01FcS9aVmw3UGVobGVKZlRZ?=
 =?utf-8?B?N1VSMVkzRUFrd2ZVZ2tOeG81VURjNlY3bGErRUJQK0lqYTFVNFlLeE1yWTBB?=
 =?utf-8?B?NmZmaml6YThXSlcrdVhLc0o5L2ZERUdHK3RLZDFqdnVpcXA3cmJLckRjWGtM?=
 =?utf-8?B?QzVpYnhjQm1vRVBwN1V6Ykh5QkdqRlZTc3JmQ205U3dZMzJmckwvQldRaWFW?=
 =?utf-8?B?RUtWOUswcVp6NG8yZ0tHZm1TQkhvV2ttMmdmSk1KYXJ5bisza1FrUytCSVF3?=
 =?utf-8?B?Sktma0tYVXlCYzJFU0FkcXBEaTBkYm9ETmlvZXhiU0lWblN4TXlOWG5qR0Rp?=
 =?utf-8?B?ZHRlTGViZGs4Qlc1L2hIVGVFS1BZcTR4MmJ0UlM0ZVhybVpyeURCdGZJN29S?=
 =?utf-8?B?cFBqbG5tdXZMV3ZCZGlWeGZneFQyMUpFWDlKM2xKV2N6V0hnRkVzOEJKU1lE?=
 =?utf-8?B?L1ZZdTNVQXAvbjl2Z0lZNDB3dUxzSWI2cC9lN0pyejZGMHhqSG9HZEdHTVpE?=
 =?utf-8?B?MCs1LzA3YUF6T2NxbmRidkNJbnRGaGtkOTdCemR0MmZ4VGdzeEVObXE0SzFj?=
 =?utf-8?B?UVpTU1FzVDNJNUc4bHU0QkZQS3dEQ25icXFKUDdjUVhiUDNUeDRpc2pWRHZr?=
 =?utf-8?B?MnlOQjhjL1JNRS9NZWYweHhyRnNOUjIza3l0WFE5VmZXNjdzZERMcGE2RVNB?=
 =?utf-8?B?YytMS2JZZHNHak1rZW1CRWkzcnllTXJ1N3lpa09RV1doTHlXYjN6WGRpZEt1?=
 =?utf-8?B?WGl3KzZlZjFqZGR3dFV5aHVLN1NiVGN3QlZlcXA2OTRVNnR2UTV1ajJ0dG1r?=
 =?utf-8?B?YlBaVGkzN05CMlB4TDF1Q3pkb1ozSGRqa3hoaG9hVjd2a21oSVlHcmQ5T1c5?=
 =?utf-8?B?VFkyN3RkQnpGcHg2bEdKSzc3ekxZbklubng4bjJIcEpESFRGSC8rQnM3aWMv?=
 =?utf-8?B?YVZUNHJQeXBqc0d3QzRnTlUrazZmRkVBWko2SDFBZjdTWmd0L01PekVBcm42?=
 =?utf-8?B?cUJZMUhHMzU1YkEwNEpMTHV4ODFmWHUyRW4zMm1ST04rTjJCUWNoVEc5SWpq?=
 =?utf-8?B?RU5IK1NjL2NJMk1KeU9oanQ3czRITWVpMmp1Y2t5KzRsMlhTU3VVV0tyMGpK?=
 =?utf-8?Q?vfI5mlu8T+Lf6ZytnsIAhN5Nq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A7A6E4534ABC964A9668B08AE28DA523@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WBmP9EJIIa47H99YTptFbXS88reHQuN5NpC/BrRsstIWzmyxhRGZ/XZ6n71Pe9v57dPUw7Uf6LsR375zn6jI0VzXbAc10YKDrxce9I6mAXgIJmHU6s2ebWRDi9KeW9CKh71m5Q+DamhDC2j/lsbulKqcjUMdPdSVlYcNtp7r11EAe6LVk7mxG9ghW83sn00LwaG7AugHUBkbVAZxbiu5vmL5G+m5mfX3Z/cVcUF+e8tLvUbH7EOW880eytNre+V+8bFNtAxqNDv4DRa4VaGDhZ0zlTc3mP+i+iSVQU7HqAa4POWUfUpQ1s2dpEgmEPx2c54aP45ndzyXCa6RvNt3eIgo9aL5LzMYfICBj6+NLnRd0DpYirGthXwIQ4Jd85nSTbFIuQpECL1d6ha8pzZa9nktP7ewmLOoiFo3gSxNOpYFEulnG8v2kXKuGBbXRu4NtKKz9Mi1Ae5ISv/ZN60S2Nr54x/r+PUf+UoyWIes07QebzgN6CSl6zDWcWJ9qlOqtKHQ1aGXxzf72jRqI4y8qSjKE+V6Gj/SyxbKndSK7fSFXsUcGJAM9Vz0sLFTmdow7bztbXWD1+xTKmd/BlfGOfq+iJWOgmzhgbCat+R5XtgmgeTaMhmvN/b/Pg5se7AOSlHPcAvrWlKMs03DGSnC0Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1e1b81-05f1-4baa-ef80-08de0d045c7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2025 22:35:51.5556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8AMS7iq1yJcqTjIyUo1pka5/pgT/jaQQtEP2nlvdf7hAc7+O3UHxFOw/hEphqP83zDxSi1X0TxDj9LQKxqz6Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8156
X-Authority-Analysis: v=2.4 cv=BN++bVQG c=1 sm=1 tr=0 ts=68f1734d cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=anyJmfQTAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=kNCpD3tSWBPSbC8pD88A:9
 a=QEXdDO2ut3YA:10 a=mmqRlSCDY2ywfjPLJ4af:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDA2MiBTYWx0ZWRfX4upMMWcn0sge
 3D4AFgDilxkSbUtNCH4KrKwX1ThAtgN5gqBERL8Jrd37O5tkiXBGLXudzcXbddXvoUl4Nxwbqio
 bdkphix97BiWLrv3pxOx6fTxg9kVq85sBafSN8tmCEXKULjFWtePhk8gRfy+mQSnAUv1Biv31y0
 jYvar9IiZ56lwkXC8/x5Y8tm+jOYm03rpKFYphea8QD7uecQ8awT1L4GxAu72L0U6tPKS7rV/Cv
 Bbbn316ibCdF26RRvUgSj7gS9J64OuciOlFPNC6kMoqpJwKCb5iTbU4NTjtFt1itpq1CnXirimR
 Erb5yhAzvU0HckxmGGSkAnE4NgpOiYFkR4RdVkBOIFnMiSYCG/J4/9YW+wS2mBUgwzSKvaru2QJ
 aBc49xmTxC+A++INAm07sLk9yROi0w==
X-Proofpoint-ORIG-GUID: _VQH2Ng0NSXshG89xMcpxjRYxMn-ot-n
X-Proofpoint-GUID: _VQH2Ng0NSXshG89xMcpxjRYxMn-ot-n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1011 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2510020000 definitions=main-2510110062

SGkgS3Jpc2huYSwNCg0KT24gVHVlLCBTZXAgMDksIDIwMjUsIEtyaXNobmEgS3VyYXBhdGkgUFNT
TlYgd3JvdGU6DQo+IA0KPiANCj4gT24gOS84LzIwMjUgMTE6NTUgUE0sIGtlcm5lbCB0ZXN0IHJv
Ym90IHdyb3RlOg0KPiA+IEhpIEtyaXNobmEsDQo+ID4gDQo+ID4ga2VybmVsIHRlc3Qgcm9ib3Qg
bm90aWNlZCB0aGUgZm9sbG93aW5nIGJ1aWxkIHdhcm5pbmdzOg0KPiA+IA0KPiA+IFthdXRvIGJ1
aWxkIHRlc3QgV0FSTklORyBvbiB1c2IvdXNiLXRlc3RpbmddDQo+ID4gW2Fsc28gYnVpbGQgdGVz
dCBXQVJOSU5HIG9uIHVzYi91c2ItbmV4dCBuZXh0LTIwMjUwOTA4XQ0KPiA+IFtjYW5ub3QgYXBw
bHkgdG8gdXNiL3VzYi1saW51cyBsaW51cy9tYXN0ZXIgdjYuMTctcmM1XQ0KPiA+IFtJZiB5b3Vy
IHBhdGNoIGlzIGFwcGxpZWQgdG8gdGhlIHdyb25nIGdpdCB0cmVlLCBraW5kbHkgZHJvcCB1cyBh
IG5vdGUuDQo+ID4gQW5kIHdoZW4gc3VibWl0dGluZyBwYXRjaCwgd2Ugc3VnZ2VzdCB0byB1c2Ug
Jy0tYmFzZScgYXMgZG9jdW1lbnRlZCBpbg0KPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMv
X19odHRwczovL2dpdC1zY20uY29tL2RvY3MvZ2l0LWZvcm1hdC1wYXRjaCpfYmFzZV90cmVlX2lu
Zm9ybWF0aW9uX187SXchIUE0RjJSOUdfcGchWnN5bWp5cVQzcmI1VmVneFhvQkZzVFhmekNoTDBQ
SjZGRlNZZW85WkVTcjRRRVpYaEZFYW5SQUt6VTg2VE1RRktzNWRyMHJMd00wUnhXeklxeDZIdFVZ
aGRLSUx2dUNVczA2OVRRJCBdDQo+ID4gDQo+ID4gdXJsOiAgICBodHRwczovL3VybGRlZmVuc2Uu
Y29tL3YzL19faHR0cHM6Ly9naXRodWIuY29tL2ludGVsLWxhYi1sa3AvbGludXgvY29tbWl0cy9L
cmlzaG5hLUt1cmFwYXRpL3VzYi1kd2MzLWNvcmUtSW50cm9kdWNlLWdsdWUtY2FsbGJhY2tzLWZv
ci1mbGF0dGVuZWQtaW1wbGVtZW50YXRpb25zLzIwMjUwOTA4LTAyMTcxMF9fOyEhQTRGMlI5R19w
ZyFac3ltanlxVDNyYjVWZWd4WG9CRnNUWGZ6Q2hMMFBKNkZGU1llbzlaRVNyNFFFWlhoRkVhblJB
S3pVODZUTVFGS3M1ZHIwckx3TTBSeFd6SXF4Nkh0VVloZEtJTHZ1QkhfdlpDdEEkDQo+ID4gYmFz
ZTogICBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZ3JlZ2toL3VzYi5naXRfXzshIUE0RjJSOUdfcGchWnN5
bWp5cVQzcmI1VmVneFhvQkZzVFhmekNoTDBQSjZGRlNZZW85WkVTcjRRRVpYaEZFYW5SQUt6VTg2
VE1RRktzNWRyMHJMd00wUnhXeklxeDZIdFVZaGRLSUx2dUJKT3VlOVlnJA0KPiA+IHVzYi10ZXN0
aW5nDQo+ID4gcGF0Y2ggbGluazogICAgaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA5MDcxODE0MTIuMjE3NDYxNi0zLWtyaXNobmEua3Vy
YXBhdGkqNDBvc3MucXVhbGNvbW0uY29tX187SlEhIUE0RjJSOUdfcGchWnN5bWp5cVQzcmI1VmVn
eFhvQkZzVFhmekNoTDBQSjZGRlNZZW85WkVTcjRRRVpYaEZFYW5SQUt6VTg2VE1RRktzNWRyMHJM
d00wUnhXeklxeDZIdFVZaGRLSUx2dUFDLXBWZlBnJA0KPiA+IHBhdGNoIHN1YmplY3Q6IFtQQVRD
SCB2NSAyLzJdIHVzYjogZHdjMzogcWNvbTogSW1wbGVtZW50IGdsdWUgY2FsbGJhY2tzDQo+ID4g
dG8gZmFjaWxpdGF0ZSBydW50aW1lIHN1c3BlbmQNCj4gPiBjb25maWc6IGhleGFnb24tcmFuZGNv
bmZpZy1yMTMyLTIwMjUwOTA4IChodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9k
b3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjUwOTA5LzIwMjUwOTA5MDExNS5kVmhk
NzhCRS1sa3BAaW50ZWwuY29tL2NvbmZpZ19fOyEhQTRGMlI5R19wZyFac3ltanlxVDNyYjVWZWd4
WG9CRnNUWGZ6Q2hMMFBKNkZGU1llbzlaRVNyNFFFWlhoRkVhblJBS3pVODZUTVFGS3M1ZHIwckx3
TTBSeFd6SXF4Nkh0VVloZEtJTHZ1Q1IwTE9IT1EkICkNCj4gPiBjb21waWxlcjogY2xhbmcgdmVy
c2lvbiAyMC4xLjggKGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2dpdGh1Yi5j
b20vbGx2bS9sbHZtLXByb2plY3RfXzshIUE0RjJSOUdfcGchWnN5bWp5cVQzcmI1VmVneFhvQkZz
VFhmekNoTDBQSjZGRlNZZW85WkVTcjRRRVpYaEZFYW5SQUt6VTg2VE1RRktzNWRyMHJMd00wUnhX
eklxeDZIdFVZaGRLSUx2dUFmYXYtWXFBJCAgODdmMDIyN2NiNjAxNDdhMjZhMWVlYjRmYjA2ZTNi
NTA1ZTljNzI2MSkNCj4gPiByZXByb2R1Y2U6IChodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19f
aHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjUwOTA5LzIwMjUwOTA5
MDExNS5kVmhkNzhCRS1sa3BAaW50ZWwuY29tL3JlcHJvZHVjZV9fOyEhQTRGMlI5R19wZyFac3lt
anlxVDNyYjVWZWd4WG9CRnNUWGZ6Q2hMMFBKNkZGU1llbzlaRVNyNFFFWlhoRkVhblJBS3pVODZU
TVFGS3M1ZHIwckx3TTBSeFd6SXF4Nkh0VVloZEtJTHZ1QkNGd0E5VXckICkNCj4gPiANCj4gPiBJ
ZiB5b3UgZml4IHRoZSBpc3N1ZSBpbiBhIHNlcGFyYXRlIHBhdGNoL2NvbW1pdCAoaS5lLiBub3Qg
anVzdCBhIG5ldyB2ZXJzaW9uIG9mDQo+ID4gdGhlIHNhbWUgcGF0Y2gvY29tbWl0KSwga2luZGx5
IGFkZCBmb2xsb3dpbmcgdGFncw0KPiA+IHwgUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90
IDxsa3BAaW50ZWwuY29tPg0KPiA+IHwgQ2xvc2VzOiBodHRwczovL3VybGRlZmVuc2UuY29tL3Yz
L19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI1MDkwOTAxMTUuZFZo
ZDc4QkUtbGtwQGludGVsLmNvbS9fXzshIUE0RjJSOUdfcGchWnN5bWp5cVQzcmI1VmVneFhvQkZz
VFhmekNoTDBQSjZGRlNZZW85WkVTcjRRRVpYaEZFYW5SQUt6VTg2VE1RRktzNWRyMHJMd00wUnhX
eklxeDZIdFVZaGRLSUx2dUFmMmZ4a0FBJA0KPiA+IA0KPiA+IHNwYXJzZSB3YXJuaW5nczogKG5l
dyBvbmVzIHByZWZpeGVkIGJ5ID4+KQ0KPiA+ID4gPiBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNv
bS5jOjYwNToyMjogc3BhcnNlOiBzcGFyc2U6IHN5bWJvbCAnZHdjM19xY29tX2dsdWVfb3BzJyB3
YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPw0KPiA+IA0KPiA+IHZpbSArL2R3
YzNfcWNvbV9nbHVlX29wcyArNjA1IGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMNCj4gPiAN
Cj4gPiAgICAgNjA0CQ0KPiA+ICAgPiA2MDUJc3RydWN0IGR3YzNfZ2x1ZV9vcHMgZHdjM19xY29t
X2dsdWVfb3BzID0gew0KPiA+ICAgICA2MDYJCS5wcmVfc2V0X3JvbGUJPSBkd2MzX3Fjb21fc2V0
X3JvbGVfbm90aWZpZXIsDQo+ID4gICAgIDYwNwkJLnByZV9ydW5fc3RvcAk9IGR3YzNfcWNvbV9y
dW5fc3RvcF9ub3RpZmllciwNCj4gPiAgICAgNjA4CX07DQo+ID4gICAgIDYwOQkNCj4gPiANCj4g
DQo+IEkgc2VlIHRoYXQgdGhlIHVzYi1saW51cyBpcyBtaXNzaW5nIHRoZSBmb2xsb3dpbmcgcGF0
Y2g6DQo+IA0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzIwMjUwNzI5MDkyNzA4LjM2MjgxODctMS1rcmlzaG5hLmt1cmFwYXRpQG9zcy5x
dWFsY29tbS5jb20vX187ISFBNEYyUjlHX3BnIVpzeW1qeXFUM3JiNVZlZ3hYb0JGc1RYZnpDaEww
UEo2RkZTWWVvOVpFU3I0UUVaWGhGRWFuUkFLelU4NlRNUUZLczVkcjByTHdNMFJ4V3pJcXg2SHRV
WWhkS0lMdnVDYi1XR2pOUSQNCj4gDQoNCkp1c3QgY2hlY2tpbmcsIGFzIG5vdGVkIGJ5IHRoZSB0
ZXN0IGJvdCwgbWFrZSBzdXJlIHRvIHNwZWNpZnkgdGhlIGJhc2UNCmNvbW1pdCBmb3IgeW91ciBw
YXRjaCBjcmVhdGlvbiBzbyB0byBoZWxwIHRoZSBib3Qgd2l0aCB0aGVzZSBraW5kcyBvZg0KaXNz
dWUuIFlvdSBtYXkgbmVlZCB0byByZXN1Ym1pdCB0aGlzLiBQbGVhc2UgcmViYXNlIGFnYWluc3Qg
R3JlZydzDQp1c2ItdGVzdGluZyBicmFuY2guDQoNClRoYW5rcywNClRoaW5o

