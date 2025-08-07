Return-Path: <linux-arm-msm+bounces-67957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B25AB1D000
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 03:09:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8003C5671A4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 01:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC127199385;
	Thu,  7 Aug 2025 01:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="pqu+vOdF";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MuUlSrp1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="IvVnbTJD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3A2191484;
	Thu,  7 Aug 2025 01:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754528959; cv=fail; b=vFMm8tRThlLNGbsBJzhq8nTmSoa44pHoIq14usDkuhgqVv7lIuiUEMyJSM63UX4U6+txBSDTv6ojL8vqxz2LU0uTTJbKWLF6AFDlShVXrJcDOyGHSL2vbsk6A6F7J27WdxyrmhGy35kYxcw8AVVt1UmXYErGfq5bHiVRuO2QOHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754528959; c=relaxed/simple;
	bh=Klz146L8zE0W+mwrXI4YAl2ufAYh2AnJsayaU3khRD4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=vDtegVbADOuqHvWiSfOVHQfCvrmV4fOywZ4lkTkl5nPYWSoMssxGJzXzHXXCTemADXt50n0MzgVxUMP0HrkywlRYnEwynuea4mkox6Sz53u11AkE8EJCNCOUT0KGZhmk8jIN79lsRCSHXVaNxDRO3IYl6U4dj10gFbm5J1yTS/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=unknown smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=pqu+vOdF; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=MuUlSrp1; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=IvVnbTJD reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=tempfail smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576JVlQ4015865;
	Wed, 6 Aug 2025 18:08:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=Klz146L8zE0W+mwrXI4YAl2ufAYh2AnJsayaU3khRD4=; b=
	pqu+vOdF/tKW/GixKMjxbE31CmgyfRcW82H8DTQmMknp46Svwbt6hs/2+Fr2HllJ
	raGac4SebPx/X0ZPo+Z/cT3jznsuFmfRmq9vGSbGAOBzzjqYX7KCDnZm2ERWetGs
	w0JkXjFWhcGP8+9tTca9IvZD6GVBsYvOZftvURb7yMvNLWaprIx0o8IXIHRgzVhK
	jO2wAnbw3t45nN4SEiNREKqizzw9RTZQ59FN6PYfPFB8I0TesDYTvdjNMOskGLK7
	xoEAl6CYShx6mNxnXAr1ojZUOVQGMfTnOXmP0OavWNygnE2RCVqaXW0wb0mI3POA
	0YjOYND24VaDeBA1uUqEGQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 48bq0wgd9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 18:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1754528928; bh=Klz146L8zE0W+mwrXI4YAl2ufAYh2AnJsayaU3khRD4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=MuUlSrp17x/bCPKf0iZB06r+TP6/kkMGaSdO3BAgiGfXsNMnC8lM3eceP38iXe+88
	 nxSMXjT9hpubGK+qwZ/81bviIOrnBDcP4vSzqA/5FJ1/Sl7HLa0X5mRct+kKXWWcrn
	 DSh9MpbEsrTxXE1blBVJ0z0RUtJmMyqPrRkqqhLjOKeGnX0z3ap+4lhKVRGSldzqUm
	 wj3EeZPUqVaHPuy04NXUlBE0KvXteR2bb6vrm9HonId140WgujvWSlPALVRv6SMQpO
	 nGuMxDAA0NnNJkJ472hvQhMAObzgLQiHEVQJ2vGa1eWq33hdmV/opxxmPdpsJr4oPA
	 z4FfTryLI3JRg==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CF52340343;
	Thu,  7 Aug 2025 01:08:48 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 5CDCBA005D;
	Thu,  7 Aug 2025 01:08:48 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=IvVnbTJD;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2045.outbound.protection.outlook.com [104.47.58.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1E19C405AE;
	Thu,  7 Aug 2025 01:08:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isE6N459bCjwHbaNb02ScJg1HWXZbR+gzhKHT2iSudZHXt1B3rnQdyEfHQTvJ65nP6DVHDjRygnr5e+secR0KYjQxTI381lPIzqw5Gz0FbjMyYBLCxp2QXbDLdlCZ3Tw4MWAIQPnyrsR+fjOYNx4gdwiC4kdvRbJBuDaeNuJUWdtAtfQ9VvJ6JWFNXzVPo1a1d1SxJbou2KnHeCANq8wl/PqBctaZhMrW98a5qorQiLBulqgGNuL8YDHuMQecxoiqLAITUp/HkAdCYGHBPSmtauWtAU4npSWROKKxM3M01xu1Qbz2V4MhiiF5yl24RqcUSaX6WE7j3J1TBt3a1Xj5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Klz146L8zE0W+mwrXI4YAl2ufAYh2AnJsayaU3khRD4=;
 b=qeqQ2HvLIIfXlgGC6xnF6ZYEi4MH1K+2fT+JFiKhGZY/800hNAcYjoHz/4i4PC8qfksBv+3KwzMU8bfZVBn+VfQCk1mzkCvHdGq7nsxjhNxpCOWkTYQeWnGu2t8JnQJKkFeiYa1DWhFH2efmtP06dF66M2H8BTTR9ysCCry7tcMrMDgChtkjhbEllyVYCd9v+rcu7tHxCVGPBx+MH2RcQ9ags6iLmwThDmffwtupjSSZ6aaRoYaHOZeC7tMLmlNlkRfhZjhq5uig025HfCydfqF/C6MgbhCZmKVtkfHdfy7AuCPC2B/N5x25QIho37Kj4KhX3A1lHWdWa1K7OCwMOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Klz146L8zE0W+mwrXI4YAl2ufAYh2AnJsayaU3khRD4=;
 b=IvVnbTJDDeS9klbaw+LcAcOtqZUYtRJnUEkk0zz3RfZDI3pask19vkSXByb58N35o46v+o0/7us69qqhWyH5wQie+z7slEEd9ui2IQDPU7p78satooy4clrr9FFnr4uQL0aWzHE4Jr7PHl23u54EetjslY67HMup0a+DUV6xSeE=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DM3PR12MB9288.namprd12.prod.outlook.com (2603:10b6:0:4a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Thu, 7 Aug
 2025 01:08:45 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 01:08:45 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] usb: dwc3: core: Introduce glue callbacks for
 flattened implementations
Thread-Topic: [PATCH v3 1/3] usb: dwc3: core: Introduce glue callbacks for
 flattened implementations
Thread-Index: AQHcBri0clPZWVSKbEWy3Wb1LsZyq7RWYjIA
Date: Thu, 7 Aug 2025 01:08:44 +0000
Message-ID: <20250807010844.sudnpnule6k7vdn4@synopsys.com>
References: <20250806095828.1582917-1-krishna.kurapati@oss.qualcomm.com>
 <20250806095828.1582917-2-krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250806095828.1582917-2-krishna.kurapati@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DM3PR12MB9288:EE_
x-ms-office365-filtering-correlation-id: 3c63b696-18a8-4e20-5cb6-08ddd54ef4ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Si90ZnMwUzhMbGdQblBaMmozb1VhZkpvNklnb3N3U0h6YUxpVGMvU1kyZmlE?=
 =?utf-8?B?d0dtL1BTYXZtNFJBTER2YnJzZTdpU1JmWi9CcDlSb3VIRTdMQ3h0STF2U2lR?=
 =?utf-8?B?VjVlQmtXVVVla2RlUFdtOEVldnJhVlc1N1lNc0xHTE9yK0VYd3Z3b0ZJTFVn?=
 =?utf-8?B?N3YzOTJRcmJDNTlueUQvWUhmQkNrcVZwTmNkM1pYajVFTXNDb1JCWjJSdzNi?=
 =?utf-8?B?c2o5OTExcDVvT0hHakpTeWpnVUFhbjFOOGdJZ2Q1Qnc5TWVrODY1OG5CZlV5?=
 =?utf-8?B?aG81d0UyWmV2cC8wbUwxdkw3OGw4NlFUbnBNTXR1V09OZ3hzREpMTFZ2ZXQr?=
 =?utf-8?B?UHJOdjA0Rmh2MjJUZ21ldlJHWjg5dEJkY1NoZlBwWEZBbFZiNm03WEZPUStS?=
 =?utf-8?B?OUpRVFltYm9Bbnd3WlZKYjI1aE03WTV6c3YvSXFXeFVJNGgySlQrSzREQmR1?=
 =?utf-8?B?TDlyVHhzYmgvNUJnUEcvWmNRMUdiVEd3SEVIYmM1QzJjc1NTa3hnSFgwb1FF?=
 =?utf-8?B?NVA1K2RDYjhQQWZ6VnV6Ky9RbG9mWVVpZ3JwMFFuQWhPNzJ2TURjbnNrRmNQ?=
 =?utf-8?B?R2pIdEFjNWQ3UVZudTMxc2xoSkNDdlhoUDR5TENYdVNSVWdXcmxWTnJ2bEFa?=
 =?utf-8?B?ZUdHaElLV1VrcTV1aGNCN2RhZGtXWVBBZ3dvTDd3bTR4TlF3VTZjL0c3cHcw?=
 =?utf-8?B?Qnl2TVQ3R25VUFNWU0dGdWtTQTYvQ0U2R0lLczlZMlloQkFIUFE1dlJSYnRx?=
 =?utf-8?B?eHE2VUtmRGNvNmZHWWpVWXVibmlEQnBKaWpqaTZYMWlFcXNJcFlOZ2dCZ2dl?=
 =?utf-8?B?WlhmNjA3Q0pMbWFNLzZxRGxmamdsWEQyTWlxcFZtZFVXWkE2dDUvSktYdy9B?=
 =?utf-8?B?WXlYMEZ1aGxNUTM5Yk5KRXowUmdmcTdUMlIrd0ZmUXhUWDV2Rlp5OEJvcWp5?=
 =?utf-8?B?bWVjdkFRbVh5bU12TmtzL0R2b1JUaUFsVEppd0JhaTN4ZzY3Sit2TXliNVBV?=
 =?utf-8?B?NlJES3dmZlErejlwQXJEQlhaRlhjaS9NeFR3Vk9DMzFYMEZjL2dZenB4VDhP?=
 =?utf-8?B?b2YwS3JMN3RnaWdzMjFaOG9aaFNKMUdnb25yT1FncHRTZWoyQ3lOcTVLa3Yx?=
 =?utf-8?B?L0NHMlFCZUJpMDZ1NERNZkFKWnpqVnl1Z2xoVWZIdTh5bDBzR3RkQ1VSTDlr?=
 =?utf-8?B?VThUd2ZmS3FiZTIraytjVVJKWGExOCtHUDN6aGJUTk44cUViYTA2VG56enBo?=
 =?utf-8?B?alV1N0NTblV2Uzl3TkZCNXU5T0tBMS9JbkpBVzVsVWVxNHZ6dTdZeGs0aHln?=
 =?utf-8?B?QXJXckpMeUNrc2hIc0NRUkR0V3JRLzBncnUvQkM2U3hmTitPTmREWE8yeWcy?=
 =?utf-8?B?MWt3WG13ektsMGdHTXFQV2sxKzg0emdPbnFxRHhEUE4wWXczckQzNDcvakh5?=
 =?utf-8?B?OElJNDNzMHp5VCtjekp1U1VmeHpGQVcxMGs4eTV1U3N2NWRSaVlsdGpUTngx?=
 =?utf-8?B?RlBFelp3YWN1Q3lkRVlIZ00xNzdzcFQyRnBEUkVPbS9KbnZJSDMrWVFhLzMx?=
 =?utf-8?B?UGRXVE5hUVlNSWxMdFZqYzYyQk9OWkFyR1FhQ1NWVGh0c0JCbmc2SnV6cEwx?=
 =?utf-8?B?RXF2QVlXcDU4SFNaMlJnQkE1RUNkYWlaV203UmhmMmJPYXIwc20zYzRRM2JE?=
 =?utf-8?B?K1AyNzN5d08xQit0RFpFWlZWbXFqMHVDYzNXNWRUZm9FU1lCUlNXK3ZJUzFx?=
 =?utf-8?B?b25FSnpWa3JGekFPeFUzOHlWN1hJc1R5N3pmS0t6Z2hKUWVRRUFDN1RsaUlM?=
 =?utf-8?B?dGZCc215TjJSS2NzZzk5QkZTcmNSQjVsWGlkVzdMSXZFYlpjVFJIYmRqMk9k?=
 =?utf-8?B?bGU4Mm1UN1RnWC9udS90a3h3a01nVWFCcFVaUE1WSDU5M3o5d1lPbll6dUF5?=
 =?utf-8?B?a2NCQitIN1AyZlFDclZuZURRQXBuZnRKRllqbDJLMU9PNE5lRDM5SEYybURz?=
 =?utf-8?Q?DgY2jXZ4gG4ChV4poXAcums2bjeL3o=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MUNzSnNxWHJUNHVPdGhrOUIwcDUwYVBxSnplTWwybkZralA0Qmw3WUdySldi?=
 =?utf-8?B?dGFyUkNtVmZzZ3BUaHRrTnFLY2lGcVdVN0RvekcxNktpaU1kcDdScWRDdjho?=
 =?utf-8?B?QmNnRFp3T0QxQnhpTEIrbDZQeGh6bDByRFBXSjNVTUN0WEJNR1ZBekNIRFN3?=
 =?utf-8?B?cHhKRjNLbnozcDlNZ0I3T3FoVlR6eEFTTGhJN1NtZXZXUnVZZVhjZDZ6a3NM?=
 =?utf-8?B?Ymg3T2FUQzB6THBZWlYyeGx1UlVYYkJSQkNybGNjTFkvMjdxRG1UMnBNVzQz?=
 =?utf-8?B?clJlMU1tb0NsU3h1UDM1SHVVRkFIa0Zaai9rOXg1b2l2cjdvQlJ1Vkt1R1ds?=
 =?utf-8?B?ejhVaGhKd1VBN1Z1YzhHSDFhKzRPVHZPdG1kckZRU055NFpyc1NNOGtEOXU4?=
 =?utf-8?B?bDZRZ1dYN3czVFBIcCtRd1piMGt6b28zT0RTNVNVTWNaQW5IaDZkS1dXVEpy?=
 =?utf-8?B?UU5hNHFsYTZUN3ZxUklFV0ZYZnZXaitEQ3hzOGNDd2UzcnE0d0d0OGk3VmhW?=
 =?utf-8?B?WlAwYXk4SjV6ZUQ4QjFjdVFnY28veVpIZGlRbzhqTWREc1ltaVl6S3hrSm0w?=
 =?utf-8?B?QzdQNEZFUU05b1c4YjUrMnFWS0J0OEdKWWlWRzd1eWhBcUdmOEI1d2tRRlpE?=
 =?utf-8?B?NHNnRGlZdlFTYlo2S0RoTFpqTlhUWGFLYmh3bEd4STVhRExZMXJpakdibzdB?=
 =?utf-8?B?WmhZQmJ2UFE5MGo3ZDdXYi96d0NueSt3ak9Id0s0YjlqamdwOG5DSVo5aUQ4?=
 =?utf-8?B?ZFh3akNtallSWXdDTEJMb1dTL2tJUUZUVWZ6MVAzQm5tdGRBRE1GR2hpYXBv?=
 =?utf-8?B?VDRXbDcrRjMvV2Y2Z2F2MWNkSk1TRFNyMmNtTEJTOXFtaEt4UXphNHFRcVlY?=
 =?utf-8?B?V010TklqdFFDSXFQTFI1L1YxRFZEWFM2RjkxQWlmcnFRWVNyYUlmUGk4TmdO?=
 =?utf-8?B?M2tmZHp6T0svcllxQjNnQXhlTTJEM3RLSHNlUHJUdWM3RVRjQXZ4Ym1YVmlC?=
 =?utf-8?B?NHBNa2tGb2d6N0JsZmFvN0NUa29vcTZ3dHRRckd2S1NtTVdTdHdzUGlseGtp?=
 =?utf-8?B?Y1Z5SUpGcVdhUUFyeTI1N0lNRXlwNnpwcXlSL1A4YzR3YWZ3UFo0VUZVRVdr?=
 =?utf-8?B?dldTQlp4OGxTUm9NeWQ0RWNEVEVpMU1RREdPZUR2bkNmcmduN3NtaXNtazl0?=
 =?utf-8?B?aDJ3YlhiTkc3WmRPcCt4Ui95Q3ArVnA3Q0dwODdOQk4xWEM4TVNlWUpydmlv?=
 =?utf-8?B?SXNIdThFcCtmMkVEMFFqODJMRWpac1paaHo4YlJubUVESnNEeUlHZUNZWC9X?=
 =?utf-8?B?dFBQNXFlbUpIWTNsNWJkbVRFdkFBL3V4WldvbXVFWWZuaFIwbDNlNFQwV2t2?=
 =?utf-8?B?eUVTNjNsR2pKU2VaRnBLcFBGQlpnMktOVjY4RG45WW9jZGR0ZXptK2ExTm0w?=
 =?utf-8?B?TGU2ZDNSVW1NS05wc1oxM0FxRXFPSlhBRGRscWtCdnFrYzV4RytjZzZubCtB?=
 =?utf-8?B?cXd1ZzlyRGZtd1dkeHpNRE1PbVJDbFU2M3RGNXR1cGtYVTMvMFhBZUNjWEY4?=
 =?utf-8?B?VGtxL2lROUVJNW8xOVMvZlFENy8wZVJSY1NibjF6eW02Wk1hNDRyaWRBc2lC?=
 =?utf-8?B?OUMwMHdXSTRPaWxYdUJkRlFUdnQwcTA3MkdCRjZxcHNvcTFhRTVxcStpL2lC?=
 =?utf-8?B?aTJpSjVFaWt4NURCdm5ybGtyTFFPSkJ6M3RlWjlPek5yTlRSb2YzUnh1M2pk?=
 =?utf-8?B?WHNUOWFkYUVQWDNlY201dStRT3ZTUElnMVdXbnRweUl6WVMwaDBOVlBmb1Uv?=
 =?utf-8?B?cGwySW5YL0JSWUFuWExMZ3RhaTJJOHZ4blhCbnNocmdBUS9RYmNjZXkrczRw?=
 =?utf-8?B?Q1J6K2kxaW0rN0U4LzRYLzlseTJTZ2FRR0R2bDdhSG1WaUJPTnI0YjMxN1lD?=
 =?utf-8?B?aXczdEpIaGgxVkxmYUxJemgxeHJ0OCsyUmQvMDRsQ3o1M1dCUHNOcUp3a2sr?=
 =?utf-8?B?VWxLUXJIZ0RPUll0cUR5OHhkUEZYM1o4SzBhMTVWeU8wQ3pId0Y3Y0dLcGFK?=
 =?utf-8?B?bGgzVzdiSVhtcHlVdVFYUlZlL3hCVXlRMHc3UExsMVZxTW9Kc29Bd0VtZ1BP?=
 =?utf-8?B?ZUVVTDVsYXlLdnRHcVZoZXl0aGF2MVZXa09ZcUhPSEhTR25pOXRXcmkyeDNZ?=
 =?utf-8?B?ckE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFCF37AE528A1740856415BB641A3D9E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Y2H1LpjKBiOnY6CLqVFVKCUZIkH/mJF4drg1XMLKp4I7AFPsHhGPCxDc4FsiGMuu+fxvrKuEx7Gy3RrWLdaVJK1VR2hveuefhQmOmznGPGgd/y+jBFlVc4BBb2EwyHA84J3w6MDhpxEDdN6VypOM4OpMueBRDXwK9XAtresr+7Ah/NecwEQKweXKJ2FOxW9T8HuybCn9Y2LsqJafCrZvQ7H8716lOI2jXLiaCRarDHjbqvOTjVymeFu7WymNeYD1E2dUJzE6NSJ7863nGAb7ToMw7WH83RyfJLXfIE5Mtr92mThaCcoAxvHlCMFOBuVoYB+j4pY2kxctMewuSzjQvT1fwc5sirehpNA08JT/RCW7wfntCDqH2Pa+RWHWdOGYAwh7zyye3SMARIwjpKJFzoVRmTyxmVFlrRyglogx1/tkaaxdMUOqKiyStFMhFP0JoUqW/t1sP/AVqa0ZAHpfYDhWVPK2o7QFGBtkMYVgH0dLMrNMezAHk5bLrHSCQZ70iFDp/eZ6eSIyvGX6jHSVrMYXKPACnDZnVeBqj0tTqZofQf7bS6ox7F0E1z2+ugGuKwTQikgp50uYS6XDvkprh1vx67BlMIQiuzxEZgZOFRgVdEqmBDdAjNvM8pK2PBfK4e81JugAgdGFHhkzijgsSg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c63b696-18a8-4e20-5cb6-08ddd54ef4ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 01:08:44.9275
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 73oLpi0jCUFPFRwGH2qTS1Itj82bzAI1fIUvWy3RQDW7C5C175oM5x6hKBf/c8/Ew/aUk7S5O8nzd2xxHGcIpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9288
X-Proofpoint-GUID: h-BDd9hM9gjXSJhSLJebD67JBW88sctj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEyOCBTYWx0ZWRfXz/fPo7MIoE0f
 6zKEUgetICptmTi9sBNQ/+WLGCL2BQjRwow9hgcrBNgtXqF28iuGVHlxsGDGvVjh3DvMrpbzM/p
 rS7TLqyXK3ufdH5klumVvYvjDQowXRA9yoYWtgSCeDp0LsWfeoRlcpvALrfpnbBj39p25YvmNen
 ilgZJcoiMZu2sDh4xsjmQZ3mLe8+RLU7doV+IMA0OGSFzjVMXcse+bL8OhEL6XOwhiq1L+a9mwH
 1tlX81qXHwSJjiRIMpERSfPZFpHnJPyTEK2z3dtbClfkMPYVvZybFLCq8zvxCcS5QZOyIdNdgYq
 uXIb1iuWuJ4ShGiaQMBeMYO/U+VDzteM5M2l7gEqt/LY/qJ5m9FiJminqP1XzztyuqA6YBtHZXC
 xhNhsDeJ
X-Proofpoint-ORIG-GUID: h-BDd9hM9gjXSJhSLJebD67JBW88sctj
X-Authority-Analysis: v=2.4 cv=HYMUTjE8 c=1 sm=1 tr=0 ts=6893fca1 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=qPHU084jO2kA:10
 a=EUspDBNiAAAA:8 a=EnLnMFUhpNnZi6Ekn30A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 clxscore=1011 phishscore=0 spamscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508050128

T24gV2VkLCBBdWcgMDYsIDIwMjUsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+IEluIGNlcnRh
aW4gc2l0dWF0aW9ucyBsaWtlIHJvbGUgc3dpdGNoaW5nLCB0aGUgZ2x1ZSBsYXllcnMgbmVlZCB0
byBiZQ0KPiBpbmZvcm1lZCBvZiB0aGVzZSBldmVudHMsIHNvIHRoYXQgdGhleSBjYW4gdGFrZSBh
bnkgbmVjZXNzYXJ5IGFjdGlvbi4NCj4gQnV0IGluIG5vbi1mbGF0dGVuZWQgaW1wbGVtZW50YXRp
b25zLCB0aGUgZ2x1ZSBkcml2ZXJzIGhhdmUgbm8gZGF0YSBvbg0KPiB3aGVuIHRoZSBjb3JlIGRy
aXZlciBwcm9iZSB3YXMgc3VjY2Vzc2Z1bCBwb3N0IGludm9raW5nIG9mX3BsYXRmb3JtXw0KPiBw
b3B1bGF0ZS4gTm93IHRoYXQgdGhlIGNvcmUgZHJpdmVyIHN1cHBvcnRzIGZsYXR0ZW5lZCBpbXBs
ZW1lbnRhdGlvbnMNCj4gYXMgd2VsbCwgaW50cm9kdWNlIHZlbmRvciBjYWxsYmFja3MgdGhhdCBj
YW4gYmUgcGFzc2VkIG9uIGZyb20gZ2x1ZSB0bw0KPiBjb3JlIGJlZm9yZSBpbnZva2luZyBkd2Mz
X2NvcmVfcHJvYmUuDQo+IA0KPiBJbnRyb2R1Y2UgY2FsbGJhY2tzIHRvIG5vdGlmeSBnbHVlIGxh
eWVyIG9mIHJvbGVfc3dpdGNoIGFuZCBydW5fc3RvcA0KPiBjaGFuZ2VzLiBUaGVzZSBjYW4gYmUg
dXNlZCBieSBmbGF0dGVuZWQgaW1wbGVtZW50YXRpb24gb2YgUXVhbGNvbW0NCj4gZ2x1ZSBsYXll
ciB0byBnZW5lcmF0ZSBjb25uZWN0L2Rpc2Nvbm5lY3QgZXZlbnRzIGluIGNvbnRyb2xsZXIgZHVy
aW5nDQo+IGNhYmxlIGNvbm5lY3QgYW5kIHJ1biBzdG9wIG1vZGlmaWNhdGlvbnMgYnkgdWRjIGlu
IGRldmljZSBtb2RlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogS3Jpc2huYSBLdXJhcGF0aSA8a3Jp
c2huYS5rdXJhcGF0aUBvc3MucXVhbGNvbW0uY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3
YzMvY29yZS5jICAgfCAgMSArDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCAgIHwgMjYgKysr
KysrKysrKysrKysrKysrKysrKysrKysNCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHJkLmMgICAgfCAg
MSArDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIHwgIDEgKw0KPiAgNCBmaWxlcyBjaGFu
Z2VkLCAyOSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdj
My9jb3JlLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiBpbmRleCA4MDAyYzIzYTVhMDIu
LjM5MmJhODZjNjlmNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4g
KysrIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gQEAgLTIzNTEsNiArMjM1MSw3IEBAIHN0
YXRpYyBpbnQgZHdjM19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCQly
ZXR1cm4gLUVOT01FTTsNCj4gIA0KPiAgCWR3Yy0+ZGV2ID0gJnBkZXYtPmRldjsNCj4gKwlkd2Mt
PmdsdWVfb3BzID0gTlVMTDsNCj4gIA0KPiAgCXByb2JlX2RhdGEuZHdjID0gZHdjOw0KPiAgCXBy
b2JlX2RhdGEucmVzID0gcmVzOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3Jl
LmggYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiBpbmRleCBkNWI5ODVmYTEyZjQuLjA5NTMx
MWU2MzZjNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gKysrIGIv
ZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gQEAgLTk5Miw2ICs5OTIsMTcgQEAgc3RydWN0IGR3
YzNfc2NyYXRjaHBhZF9hcnJheSB7DQo+ICAJX19sZTY0CWRtYV9hZHJbRFdDM19NQVhfSElCRVJf
U0NSQVRDSEJVRlNdOw0KPiAgfTsNCj4gIA0KPiArLyoqDQo+ICsgKiBzdHJ1Y3QgZHdjM19nbHVl
X29wcyAtIFRoZSBvcHMgaW5kaWNhdGUgdGhlIG5vdGlmaWNhdGlvbnMgdGhhdA0KPiArICoJCQkJ
bmVlZCB0byBiZSBwYXNzZWQgb24gdG8gZ2x1ZSBsYXllcg0KPiArICogQG5vdGlmeV9zZXRfcm9s
ZTogTm90aWZ5IGdsdWUgb2Ygcm9sZSBzd2l0Y2ggbm90aWZpY2F0aW9ucw0KPiArICogQG5vdGlm
eV9ydW5fc3RvcDogTm90aWZ5IHJ1biBzdG9wIGVuYWJsZS9kaXNhYmxlIGluZm9ybWF0aW9uIHRv
IGdsdWUNCg0KVXBkYXRlIHRoZSBuYW1lcy4NCg0KPiArICovDQo+ICtzdHJ1Y3QgZHdjM19nbHVl
X29wcyB7DQo+ICsJdm9pZAkoKnByZV9zZXRfcm9sZSkoc3RydWN0IGR3YzMgKmR3YywgZW51bSB1
c2Jfcm9sZSByb2xlKTsNCj4gKwl2b2lkCSgqcHJlX3J1bl9zdG9wKShzdHJ1Y3QgZHdjMyAqZHdj
LCBib29sIGlzX29uKTsNCj4gK307DQo+ICsNCj4gIC8qKg0KPiAgICogc3RydWN0IGR3YzMgLSBy
ZXByZXNlbnRhdGlvbiBvZiBvdXIgY29udHJvbGxlcg0KPiAgICogQGRyZF93b3JrOiB3b3JrcXVl
dWUgdXNlZCBmb3Igcm9sZSBzd2FwcGluZw0KPiBAQCAtMTE2OCw2ICsxMTc5LDcgQEAgc3RydWN0
IGR3YzNfc2NyYXRjaHBhZF9hcnJheSB7DQo+ICAgKiBAd2FrZXVwX3BlbmRpbmdfZnVuY3M6IElu
ZGljYXRlcyB3aGV0aGVyIGFueSBpbnRlcmZhY2UgaGFzIHJlcXVlc3RlZCBmb3INCj4gICAqCQkJ
IGZ1bmN0aW9uIHdha2V1cCBpbiBiaXRtYXAgZm9ybWF0IHdoZXJlIGJpdCBwb3NpdGlvbg0KPiAg
ICoJCQkgcmVwcmVzZW50cyBpbnRlcmZhY2VfaWQuDQo+ICsgKiBAZ2x1ZV9vcHM6IFZlbmRvciBj
YWxsYmFja3MgZm9yIGZsYXR0ZW5lZCBkZXZpY2UgaW1wbGVtZW50YXRpb25zLg0KDQpVcGRhdGUg
dGhlIHBsYWNlbWVudC4NCg0KPiAgICovDQo+ICBzdHJ1Y3QgZHdjMyB7DQo+ICAJc3RydWN0IHdv
cmtfc3RydWN0CWRyZF93b3JrOw0KPiBAQCAtMTE5Nyw2ICsxMjA5LDggQEAgc3RydWN0IGR3YzMg
ew0KPiAgCXN0cnVjdCB1c2JfZ2FkZ2V0CSpnYWRnZXQ7DQo+ICAJc3RydWN0IHVzYl9nYWRnZXRf
ZHJpdmVyICpnYWRnZXRfZHJpdmVyOw0KPiAgDQo+ICsJY29uc3Qgc3RydWN0IGR3YzNfZ2x1ZV9v
cHMJKmdsdWVfb3BzOw0KPiArDQo+ICAJc3RydWN0IGNsawkJKmJ1c19jbGs7DQo+ICAJc3RydWN0
IGNsawkJKnJlZl9jbGs7DQo+ICAJc3RydWN0IGNsawkJKnN1c3BfY2xrOw0KPiBAQCAtMTYxNCw2
ICsxNjI4LDE4IEBAIHZvaWQgZHdjM19ldmVudF9idWZmZXJzX2NsZWFudXAoc3RydWN0IGR3YzMg
KmR3Yyk7DQo+ICBpbnQgZHdjM19jb3JlX3NvZnRfcmVzZXQoc3RydWN0IGR3YzMgKmR3Yyk7DQo+
ICB2b2lkIGR3YzNfZW5hYmxlX3N1c3BoeShzdHJ1Y3QgZHdjMyAqZHdjLCBib29sIGVuYWJsZSk7
DQo+ICANCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBkd2MzX3ByZV9zZXRfcm9sZShzdHJ1Y3QgZHdj
MyAqZHdjLCBlbnVtIHVzYl9yb2xlIHJvbGUpDQo+ICt7DQo+ICsJaWYgKGR3Yy0+Z2x1ZV9vcHMg
JiYgZHdjLT5nbHVlX29wcy0+cHJlX3NldF9yb2xlKQ0KPiArCQlkd2MtPmdsdWVfb3BzLT5wcmVf
c2V0X3JvbGUoZHdjLCByb2xlKTsNCj4gK30NCj4gKw0KPiArc3RhdGljIGlubGluZSB2b2lkIGR3
YzNfcHJlX3J1bl9zdG9wKHN0cnVjdCBkd2MzICpkd2MsIGJvb2wgaXNfb24pDQo+ICt7DQo+ICsJ
aWYgKGR3Yy0+Z2x1ZV9vcHMgJiYgZHdjLT5nbHVlX29wcy0+cHJlX3J1bl9zdG9wKQ0KPiArCQlk
d2MtPmdsdWVfb3BzLT5wcmVfcnVuX3N0b3AoZHdjLCBpc19vbik7DQo+ICt9DQo+ICsNCj4gICNp
ZiBJU19FTkFCTEVEKENPTkZJR19VU0JfRFdDM19IT1NUKSB8fCBJU19FTkFCTEVEKENPTkZJR19V
U0JfRFdDM19EVUFMX1JPTEUpDQo+ICBpbnQgZHdjM19ob3N0X2luaXQoc3RydWN0IGR3YzMgKmR3
Yyk7DQo+ICB2b2lkIGR3YzNfaG9zdF9leGl0KHN0cnVjdCBkd2MzICpkd2MpOw0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy91c2IvZHdjMy9kcmQuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHJkLmMNCj4g
aW5kZXggNzk3Nzg2MDkzMmIxLi40YzkxMjQwZWI0MjkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
dXNiL2R3YzMvZHJkLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kcmQuYw0KPiBAQCAtNDY0
LDYgKzQ2NCw3IEBAIHN0YXRpYyBpbnQgZHdjM191c2Jfcm9sZV9zd2l0Y2hfc2V0KHN0cnVjdCB1
c2Jfcm9sZV9zd2l0Y2ggKnN3LA0KPiAgCQlicmVhazsNCj4gIAl9DQo+ICANCj4gKwlkd2MzX3By
ZV9zZXRfcm9sZShkd2MsIHJvbGUpOw0KPiAgCWR3YzNfc2V0X21vZGUoZHdjLCBtb2RlKTsNCj4g
IAlyZXR1cm4gMDsNCj4gIH0NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0
LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+IGluZGV4IDI1ZGIzNmM2Mzk1MS4uOTk5
YjJlNDM2NjIyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+ICsr
KyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gQEAgLTI2NTgsNiArMjY1OCw3IEBAIHN0
YXRpYyBpbnQgZHdjM19nYWRnZXRfcnVuX3N0b3Aoc3RydWN0IGR3YzMgKmR3YywgaW50IGlzX29u
KQ0KPiAgCQlkd2MtPnB1bGx1cHNfY29ubmVjdGVkID0gZmFsc2U7DQo+ICAJfQ0KPiAgDQo+ICsJ
ZHdjM19wcmVfcnVuX3N0b3AoZHdjLCBpc19vbik7DQo+ICAJZHdjM19nYWRnZXRfZGN0bF93cml0
ZV9zYWZlKGR3YywgcmVnKTsNCj4gIA0KPiAgCWRvIHsNCj4gLS0gDQo+IDIuMzQuMQ0KPiANCg0K
VGhlIHJlc3QgbG9va3MgZmluZSBoZXJlLg0KDQpCUiwNClRoaW5o

