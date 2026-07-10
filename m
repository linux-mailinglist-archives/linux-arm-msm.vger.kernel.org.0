Return-Path: <linux-arm-msm+bounces-118426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3Fi7BDNxUWr0EwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 00:24:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F0C73F80D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 00:24:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=synopsys.com header.s=pfptdkimsnps header.b="u5mJ1d/r";
	dkim=pass header.d=synopsys.com header.s=mail header.b=VDuPuLaH;
	dkim=fail ("headers rsa verify failed") header.d=synopsys.com header.s=selector1 header.b=EExlu6q8;
	dmarc=pass (policy=quarantine) header.from=synopsys.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118426-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118426-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1042301BA79
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 22:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622CA42EEA3;
	Fri, 10 Jul 2026 22:21:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FF5430CF0;
	Fri, 10 Jul 2026 22:21:49 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783722112; cv=fail; b=pmgH1lWIuRFz3pKymm4EIRUPVuAAtOAnFiy/XD6DHJ/DfDYxpSehdZLDAPkBJ/a/tS9kElmmBGdSG2HDr1k5w1TqvGrWHCQ8o5CNodRFeZKbSs68BSn0WPxcDHV8nBEjGpAKuBxsBycCUbT54J2svIEhMYgW655soPJTzpGikgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783722112; c=relaxed/simple;
	bh=SJvCe13fML4fAJHNS3rKz7d4oSjeGPNbkWfuR1elyuI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EjjhvZhHcQW6ObLUIJpNTDgl1DGzyw/0qjeb15fH80Vgqsn8/FfpI3U/HsnP9fAiSsAlkQF6lk9OivEj4TcFTs14K9Z1yCLMlPLQFVdYZqtK9V/kGj/r8Tg6qRe/Oh+9b9gTQVR7GQOGG5vHoXxy1A+MJK6XBemVTYiG5UA+gzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=u5mJ1d/r; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=VDuPuLaH; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=EExlu6q8 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AK6GJF1553797;
	Fri, 10 Jul 2026 14:02:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=SJvCe13fML4fAJHNS3rKz7d4oSjeGPNbkWfuR1elyuI=; b=
	u5mJ1d/rSUExDOaY0PgRgIEkifZofBdMK/ayZAe9kqUkC1wlqZrYR2ZWY+l+zFZ0
	MOrRJj+sSJbmCDWJksXXw4YZLsdJ1LvY+Rmg0u37qSWh3FNlRa9szRdkjI/FLVVz
	dFsxucXOkrK/rp6cmEoYrHYkmOayaCZRqjOyeke+pwOkHmAivbqUBwST0UorqHOL
	PunqZH6DLYpAKG7XKT3/8zdQmeBEV+K7i51ogXJMIG3d9OHvSJH9Bfm0cQ8+kxB2
	sf7+jZdoPffii+bq8k0zo3gW1QOk7dQ62zskuHNoLdZpemg7AugnZqzr/abt0fF9
	WMJ2VlB7PCm5Kb3BKayPaw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4favwewh4p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 14:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1783717354; bh=SJvCe13fML4fAJHNS3rKz7d4oSjeGPNbkWfuR1elyuI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=VDuPuLaHf15gHLwCUQ+Bc30zdyNN+fydstYU3btVzRGo4X4GzBQOsq7vubIBB1JSh
	 WyvnJZKC3cqg3cpHgfQzmEVrDEZ3YAjd4Kg6bLWLdNcuOj0j6Umi4oAA34Nq032xgH
	 JEu65q9fIg0S6cip4MiffgepU5foF9TRtHtsMXV5mN1rLD2lWNj+U653egq3di7Mzi
	 kpTm4bbg1zE3J33VdqhN++kPT6I5q6Myple0W1vMZL24kWJHAJyZlTYdfG5xQlpXhy
	 bn7TlCRjH9+jRlzoWpfD1I4C80wlHXP3QznizVKRN5OVskkmEVJC3Ba/FXJ5X/24yL
	 a73+OW0MSyyIg==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A187140212;
	Fri, 10 Jul 2026 21:02:34 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 35F78A054C;
	Fri, 10 Jul 2026 21:02:34 +0000 (UTC)
Received: from CO1PR08CU001.outbound.protection.outlook.com (mail-co1pr08cu00100.outbound.protection.outlook.com [40.93.10.96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id DD4C040148;
	Fri, 10 Jul 2026 21:02:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJQClCUGOn2iCn+sDlor+jV6bZ8kMSiQ3gEBYJ7LmrYL4wjbKZKfPfcQ509wqIWeI3pQjyIkJGnZyfxaSwrK2Sh6GmZq/GHdqkTXL9AHG8Nc4FguCtZb8Wqpb5+eQyfGmBItQXNSYrZ2VV54AHgd9qRl3ZOKobXD+1Ee+btV1vgmbCCXC/w3tqkbaihHNSIrp/P2jqRg2YlE9ukWWj30slLA0Xxz3Zwy3AIDbCDU7kjPsziZGLctRFAa+JSncv0OEA4UM6X8cNAJWFhNw67iR/DnQp3B9avztcRIp8IgzntSqgv+9hyo0MfHLgAPUno48i1FsU0za22Tgc2eWIDPFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJvCe13fML4fAJHNS3rKz7d4oSjeGPNbkWfuR1elyuI=;
 b=N8lVOfer9XfDZ2koU231SZptk6an29/zeFDMFewok26Cic0oGHygcf8otosqE59ue0XKrf3fMUdzpo5X0PpHZ4t2Xc0GVIGX5Tj0myiUj3I6AfdD61NakYDl8slFRVycvmfX9Av4dy3AbKsuOEZnGkeREWXd1kOqdBfuIHqk2C1gJDmm6pIrruP00sq4m5RANsfNcKNwxLI2CBEuR+7306AtA3c4dNy1dAyYjKmwOvnt0DSQhSxWQIPbiGL4ksV/+h3fQ83zSaFzviz/b9O+0/ele60Dta/DwXHBwoYwmN62EqCvXZp9jqOQNYr2zfGUbsLuiJpBGozrJbrkUWPqSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJvCe13fML4fAJHNS3rKz7d4oSjeGPNbkWfuR1elyuI=;
 b=EExlu6q818tbPbttHRylZ7P14b2X0oY3zO5TT9XK4fHTLGCROt9P1u3f17cx6ekGnUUicZ0GkSCGkFuwnYzvq2Xb34wQaDC52u/9aB9z/uI2p4VsL5Ti+D0TG0s80olu9QWzC9y4vT/Me0XLajPDOiD8JKh9JNYIJCMI+AVB/1k=
Received: from SJ0PR12MB7473.namprd12.prod.outlook.com (2603:10b6:a03:48d::8)
 by CY5PR12MB6324.namprd12.prod.outlook.com (2603:10b6:930:f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Fri, 10 Jul
 2026 21:02:29 +0000
Received: from SJ0PR12MB7473.namprd12.prod.outlook.com
 ([fe80::fd38:a665:ba4:95d7]) by SJ0PR12MB7473.namprd12.prod.outlook.com
 ([fe80::fd38:a665:ba4:95d7%4]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 21:02:29 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Thread-Topic: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Thread-Index: AQHdD4BaC5hZxDAhAEKCnMd1KCZXEbZlNA8AgADKiICAAFp+AIAAALcAgADmBwA=
Date: Fri, 10 Jul 2026 21:02:29 +0000
Message-ID: <alFTxg0HLyke0gCK@vbox>
References:
 <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
 <20260709-eusb2-interrupt-handling-v5-v4-1-d4f993925608@oss.qualcomm.com>
 <d742u7jrpm7gdoljgiwkfexc47qhprwoibk6fadpm3qilbdpgi@jrkbrwfmqmrp>
 <alBOC18CpkGDhM2m@vbox> <20260710-warping-resolute-wasp-e4b8ce@quoll>
 <7a099224-ea95-40ec-b279-f8834f261e23@kernel.org>
In-Reply-To: <7a099224-ea95-40ec-b279-f8834f261e23@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB7473:EE_|CY5PR12MB6324:EE_
x-ms-office365-filtering-correlation-id: 0f87fedd-eb65-42a9-c739-08dedec68dcb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|38070700021|6133799003|56012099006|4143699003|5023799004|11063799006|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info:
 jyFIgYG4lbDncFcjcLWjfnQyPQ/RRbsCpNjCQZNRIhm9sEKYuVQoBHhLpqH7X8UtN9kTU1gAOOp9lZxc/NmIemTMUrjlU5XFWpfI/7x2pdLYxrvfyKow/gaIGfFAOcfmRavWZiL+k4G0MeZt8mq3fNuXZth+wfaq9o2M0fCl4V9Btj4zgxHQlMB/aL8tTpr+a9OfRVtTfQP1Nzvr+Iq/HyI9B07a6G1DsPklmEBjGpItiKifPLATPeGgNLSROI5hfnp5jqv/nTuqMUFWga4K2IlDVJA4CGTZQVK0LqeeUHMS6dCvtg0+wyC31BiIL3UaTI1crmeAMZi6UyMXbtTnQ5F47JjoRRXWFRY/mR0phQaSBFb2PUrkgFnRHwLy4GmKwit64AozZOmCfy3+rl/f4lP2Spu7+POghfSjGKHAU9NjJX+1gTMEUJRDjExpd4cdsp0Qq+yoQwUeo8oX8SoGq6Z0RY0yJVqjf+vukoOIaSaDj/ZLMlYd2gbNBo18+uLb21F4jgE/0QPDshQbfZzSCjX6hLAgXLzAUenJqVMuemH/iiFv6KvRv8QJ0Ygatydo91DZFiQiFBqzokEdpEHfeG2aUwzoc2FqDTvCeEWqMrLS3CSmbgLY5OnbJNFaDwgvmHQNT25RUWfjlQbyytBAivPHHv2ThXLWVm4XTqvqwODPpO1s7gAYfZYggOOkVvNsSZz0C7ivNp7U8NjhD4ARpa5fPBhiOZ8eoWRONfVbjdw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB7473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(38070700021)(6133799003)(56012099006)(4143699003)(5023799004)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cDREN1dlakptOVBNUDFLN1RXUUY5SXEyL1Z3SjJ1cHQ4K0dLVDd0UFMwMXdC?=
 =?utf-8?B?aWFZT3lEeVFoeDI3eWllTUIwTGN4RWFoWU0vRHpCMVpWZ3BaSThpbUp5VzVK?=
 =?utf-8?B?a3pIbWw5bHA5Z1VsZVBTOS9jaFlyZmtnOC91VkRCVWtZY1NWWmZLV3JHcVE3?=
 =?utf-8?B?dnVaVWpuYUxCZ2FiUDF3ZXRYSVJ3dTlTSzhYTFJCS1p0dkFNbXM2S3ovSjk4?=
 =?utf-8?B?K0QyU05Mclo1bWF0S01zcU9pSkgwbU12RlcvZEFZeGFPQWdHNkxMUTRqcWpE?=
 =?utf-8?B?R3pqa0gxQy9sdTd0NWRUVTQ5WWVFakRpYm5LY1BueEloM3l1RkxkSzFSd2VE?=
 =?utf-8?B?RVY5LzduQ2xGTTlNNitmRW5ySFlXSjdhTWJpU0xzTjhzOFp5NTRFUG80cWhV?=
 =?utf-8?B?MUdKZjIwZDBzMUJ3bWZTQVZpMlk1QzJnNXhWcTRLdmlOck9qRVB4T2FpMExx?=
 =?utf-8?B?R2VXa0p1SlhYOXFTdk9JOVdGbERZYmsxbnFNYllmYTluRFU5RTcrTldWR1VT?=
 =?utf-8?B?dnFnaWU5dS9FbHBOUWRkTk1GRDNORUtINE9MdW1JQ3RsNlZ0MEZuWXlOaDg5?=
 =?utf-8?B?SzFrdkNtaE1yYmkxZHl5bU9QMVBESDlEczFOeU1zR1EyVFRTaGlTOWwvclkx?=
 =?utf-8?B?UXc4WExtR1J5a3REMyt3dWRkMUVFR2s2T282aXZYS2RCZ0xYYXdDNWFtdkdp?=
 =?utf-8?B?MzkzZkI2aFNqVFNJaW4vNks1K0NCRW1md3pmUkpGVWI5MUVucEFSMlhxTnQ3?=
 =?utf-8?B?TW1sZ0l3YS9TMjNnZkVhSk9KOUkxMkMxUkRNY0hDbkh1QU1GZkRid09MMDlx?=
 =?utf-8?B?OTZUY0orK0xuTmo4RVFGNWxWSVNLMEdSY29iK1Z5RElHaFdhVnRwTUlLMTlY?=
 =?utf-8?B?RmpMWlNZWDFmcFpKQkZadDNRRjNCaWlWWXZmZGNhUGtMVk8yWnJZOTBxZklH?=
 =?utf-8?B?K0F3a252WkdpM2NTdzRtUFZielJCMStPWlduRGNQK3RESW00TXBIY0VTN0Ux?=
 =?utf-8?B?Zkh5akE4clk4K3JaV1NSa2R5dEdsUGJnNFJqdzU3TTVEcjVFNEhmcmNtbWlp?=
 =?utf-8?B?bUk2VHdWY2NNbFhiR1JEWFJZWWE4RnBqUVU5NUEvRExjRDBzbWFSKzdwMDV0?=
 =?utf-8?B?NFlqR3RMcld1NmxNVWc4N2FIYkkwTG16K013S3NUNWJGcUxXVGUvM1lRd1BP?=
 =?utf-8?B?SENTMzdBK0lvaXV6VUU3NnJGQjIxaldIbWtWUC9XNkppNG5pLzhkNXZtT1pm?=
 =?utf-8?B?WlRhd2VDajJmbkhtbHVXZWtwaW9jcTlXVU9QclBzbW1LUGVTcVdzOWxVNG5s?=
 =?utf-8?B?TUlCNmpEaVFSekp3VDk3a0FCbVpvR3RFbjYwYlFLZXhaMU9FZS9BME1lODVx?=
 =?utf-8?B?bERKbHBOVEFnQ08xMHBOYTdQWkEzVS9ub0dPN29JZDJWUmVpaFpHUFhYaDF0?=
 =?utf-8?B?SVRGNC96Vk1aZGJGbDJlVTlLY0NjTTJlZGp4Tjh2WGZRaXk3RFlWbDVXd2dW?=
 =?utf-8?B?OGhBdW1qcnk3ZnA3WHpYYXJrUFFxU0E2cG9IaXI1aFlVZ3Y5ZGdiejFmbjF2?=
 =?utf-8?B?bEtLdytlUThXZklQNzAvN3dDZGhBUGU3UGxadXpQbTM3SUhxMFpPNUk5VFV0?=
 =?utf-8?B?UWs4ckZkUFRzUW1qUnBBWms4YUpyMDB1YmhCSG13QUdWS2VoL2dQUVR2ZmN1?=
 =?utf-8?B?RXhnVzR6NXRsbmJSU1RnUE9rMHV0UGNHWUZvU2xsUnNIU3duMUJsYjlaNGRY?=
 =?utf-8?B?V3FRTm56UmxzTmpHR1BzQnF1TkhoTkxKVkdXTmU2SEUzRkVaY1k4NDFCSFpr?=
 =?utf-8?B?SHJPYzRWVm10ZTBEeDhEaU93enNTcXBkVFhjTjB4YWVGNFdMT3NBZS9sWVNs?=
 =?utf-8?B?azdMQkl2blpwQnV6TmdXZlNhZVNmOFRsY3ZmcFluYlhEL3BoSzlxWGVxUFJo?=
 =?utf-8?B?YmVSMVZpMzJHcEJORWRoQUhsaVpCb3Zza3VtdmtJZkFJbVVVYmYwakZBRGlo?=
 =?utf-8?B?bVh4RlowY3lrdWY4QnZkTXF4eGZVVU5xL0NCd25ONG1uamY1TnpMQ20zYndU?=
 =?utf-8?B?SWpsZWNhYURlWGZmcEZPN3g1YUxXRVJ6UHhxNUFFT2VQZGhYYUFkTjNCblJv?=
 =?utf-8?B?T3FVOW1DYTQvc2w4akRrNzJFSDNlQmFPOUJkRmRwWEg4WEI2SGFSalJVUzVr?=
 =?utf-8?B?TitNbjJRS0dDdnZwR1kwV250Snp3ek0yb2ZlRFJGd1BmNmJiYnQxY3pPMWhF?=
 =?utf-8?B?ZVVxSC8zazc3RUthNUdLa2NUNTVJdHRNNDdSb0VhTE42ajNIYXZuekJuNW1t?=
 =?utf-8?B?enVHNld2dkx6dXREMVJ4RVI0d3RuT0ovcGE4UUtoWkFIbGZxeEI1dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <94FB72847FD753468E9EA26DD51D1D97@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	C7ethBdrXFh33QUxsJDECxs/GPe+y+lVZ/y2z24phBpCnEEnw2l2IgX0VF5+bP39Oa7OzKCM2FursffrOzNLhO8m7qNsc6kyXgO+dwezUlxwaRM7qvtI9nzf95oaLi6HyQLfWuejU9VxjxjCvSishmMey4sGltlK2TjZ1k8wIQqWixkkrX+WYcynPgSFTqd1nqHH7dpWZ3OW8KcVcWLsYt/2c41x02zR7hNlxHj1M78wAWABK5LsmTo6WhthvZOZV1sogbild6gSXVJtz8WDnR1dqo2mUlxO//I2JgX9Xwd6A+NSukSlLDt/9pYDo1Z66rq2nDUbX93bbEaSp6QpuA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KL7AncSnG9LynQlXiQpqiQPv8Ouq+O1tfRKaSWJEpGmYcoHNBugTH++NjWJGKCRw1G6VEm0jxjXh0OMi8Xpj5UpJD6S3jTjJ3y/3Ke+iPUREErM9PL3/HrSmMEbUYjhqC6B77OfbCefaq502Wj7SVUFY28teA0YZEGYsic5449dSNwhkcrKTcd0OsvJ9ZP47vI+k7tn8lGAG87HBlB24PFWm8HZHsUTkuajvKdpQRhHpKpsii09Pk1L/nCyicF8CqR5cfQr1uyD/nrgS3G29NgD5PCnOtNFjzVil+I5CH7vBdwf4+XRPKhGbGtEOqFyuq5IeookhrOMxBf4jULgsMIglG/xhtLjGy1axE0aRe3NbGZVSaLgLC7oEoQtiOXgCZiKx1KoQK7t3a79LaCH4i22+SDlwXm7QhBP7TE0HLhHlC7BOEhKKoLlhGXttcZB5N+JIhaqOoWHPPjfmh3m7JJjBwzQjopI/XRii9bcTzBnFGNTV+pIhggONz9GPZKrg7/KpCxZesG9W4vsa1qY/pSqLPt8nhDaDMcPFlcHQkFo1kMhW3yU37yVgeHLxfrDYW59u4AtuE3siJKqnlI3oKz9emsWKndBJN/M7FaSXKj39Wf5eujBwp/KK4qWd7K8+varVL9GuMpJsKJ5bfqYRIQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB7473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f87fedd-eb65-42a9-c739-08dedec68dcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2026 21:02:29.6835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qe0mS0ZqOt3jV0zLyoE6ZIUarhEKV+uVAbY3XIGCgi2fSp8gXElP3ocLpa/3G/vVcvII4OlduYF+6O270m1+1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6324
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIxMSBTYWx0ZWRfX1ymxMRRoNqEO
 4sHSwCLg5pdaE0IhEJMI/j6YjRMOMCdx/Nd6+XkzA3S+52lRdw5A8XFswzlNjYeN8cMwvTWlvjk
 pe/ZCB3CmvyRjch6mK/shUgAcCGno8PXTmHKHv9YsexgWHtH28+sQtqMoH8e358QONLm1C1HxvN
 G6QFi4NQht183XTNHdHFHA2qiAo7KWti/4qu6IWg/5HY9+nRS2uCax1caxTgjetKjliFmPMaNvf
 VUVirf5anNseqtNoB257r8Jn9fiOh5LM52Ns2Xxuj//74dx2fffqefTXkTB2CEooIQBNpMmc/5i
 mPqdX0nZUhAfUu4up/+agFFWNxx/gToV3uXmF9K1KdCXUJkmdOoZrmz89a7yOdkEO+Etw8nN5Lm
 zntMEO2sXM9Gv7j3IhgqstJXp/Z1w7ckWMIJJJb5GCLeFd5QWaUFBnIpJR/X0YsoiNAX3mpppfw
 soE0SM4enxpHHo8tt6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIxMSBTYWx0ZWRfXw1lvYcQnBcSd
 /lN1pblsE3McLzEosuuLbfHzH41n0g4ycC5b/W/MLzIy366sImIbl213M6Ik80Px5GIxlh2s3ou
 dL8LcjfJ0EHQPRRqrHWA/2HqLHynySU=
X-Proofpoint-ORIG-GUID: 1wa1mqYDmDkXbYaCKmdB6gYQvz4DVrol
X-Proofpoint-GUID: 1wa1mqYDmDkXbYaCKmdB6gYQvz4DVrol
X-Authority-Analysis: v=2.4 cv=EJ42FVZC c=1 sm=1 tr=0 ts=6a515deb cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Cj_Kj0yJVDONp0aEjqkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100211
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118426-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,synopsys.com:from_mime,synopsys.com:dkim];
	FORGED_SENDER(0.00)[Thinh.Nguyen@synopsys.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:Thinh.Nguyen@synopsys.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krishna.kurapati@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-arm-msm@vger.kernel.org];
	DKIM_MIXED(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 56F0C73F80D

T24gRnJpLCBKdWwgMTAsIDIwMjYsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IE9uIDEw
LzA3LzIwMjYgMDk6MTYsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+ID4gT24gRnJpLCBK
dWwgMTAsIDIwMjYgYXQgMDE6NTI6NDVBTSArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+
PiBPbiBUaHUsIEp1bCAwOSwgMjAyNiwgRG1pdHJ5IEJhcnlzaGtvdiB3cm90ZToNCj4gPj4+IE9u
IFRodSwgSnVsIDA5LCAyMDI2IGF0IDAyOjIyOjM2UE0gKzA1MzAsIEtyaXNobmEgS3VyYXBhdGkg
d3JvdGU6DQo+ID4+Pj4gQWRkIHByb3BlcnR5ICJxY29tLGhhcy1ldXNiMi1waHkiIHRvIGluZGlj
YXRlIHdoZXRoZXIgdGhlIFNvQyBoYXMgZVVTQjIgcGh5DQo+ID4+Pj4gb3Igbm90LiBUaGlzIGlz
IHVzZWQgdG8gbW9kaWZ5IGRwL2RtIGludGVycnVwdHMgZHVyaW5nIGhvc3QgbW9kZSBzdXNwZW5k
Lg0KPiA+Pj4+DQo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogS3Jpc2huYSBLdXJhcGF0aSA8a3Jpc2hu
YS5rdXJhcGF0aUBvc3MucXVhbGNvbW0uY29tPg0KPiA+Pj4+IC0tLQ0KPiA+Pj4+ICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3Fjb20sc25wcy1kd2MzLnlhbWwgfCA3ICsr
KysrKysNCj4gPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQ0KPiA+Pj4+DQo+
ID4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2Iv
cWNvbSxzbnBzLWR3YzMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91
c2IvcWNvbSxzbnBzLWR3YzMueWFtbA0KPiA+Pj4+IGluZGV4IDgyMDE2NTZiNDFlZC4uMGM2YTgz
OWJlODJmIDEwMDY0NA0KPiA+Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy91c2IvcWNvbSxzbnBzLWR3YzMueWFtbA0KPiA+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvcWNvbSxzbnBzLWR3YzMueWFtbA0KPiA+Pj4+IEBAIC0x
NTIsNiArMTUyLDEzIEBAIHByb3BlcnRpZXM6DQo+ID4+Pj4gICAgICAgIEhTL0ZTL0xTIG1vZGVz
IGFyZSBzdXBwb3J0ZWQuDQo+ID4+Pj4gICAgICB0eXBlOiBib29sZWFuDQo+ID4+Pj4gIA0KPiA+
Pj4+ICsgIHFjb20saGFzLWV1c2IyLXBoeToNCj4gPj4+PiArICAgIGRlc2NyaXB0aW9uOg0KPiA+
Pj4+ICsgICAgICBJZiBwcmVzZW50LCBpdCBpbmRpY2F0ZXMgdGhhdCB0aGUgY29udHJvbGxlciBp
cyB3b3JraW5nIHdpdGggZVVTQjINCj4gPj4+PiArICAgICAgcGh5LiBUaGlzIHByb3BlcnR5IGlz
IHVzZWQgdG8gbW9kaWZ5IGRwL2RtIGludGVycnVwdCBjb25maWd1cmF0aW9ucw0KPiA+Pj4+ICsg
ICAgICB3aGlsZSBlbnRlcmluZyBzdXNwZW5kLg0KPiA+Pj4+ICsgICAgdHlwZTogYm9vbGVhbg0K
PiA+Pj4NCj4gPj4+IEkgc3RpbGwgaGF2ZSBleGFjdGx5IHRoZSBzYW1lIGNvbmNlcm4uIFRoaXMg
aW5mb3JtYXRpb24gaXMgYWxyZWFkeQ0KPiA+Pj4gcHJlc2VudCBpbiB0aGUgRFQuDQo+ID4+Pg0K
PiA+Pg0KPiA+PiBDb3VsZCB5b3UgY2xhcmlmeSB3aGF0IHlvdSBtZWFuIGJ5ICJ0aGlzIGluZm9y
bWF0aW9uIGlzIGFscmVhZHkgcHJlc2VudA0KPiA+PiBpbiB0aGUgRFQiPyBBcmUgeW91IHN1Z2dl
c3Rpbmcgd2UgdXNlIHRoZSBkd2MzIG5vZGUncyBjb21wYXRpYmxlIHN0cmluZw0KPiA+PiB0byBp
bmZlciB0aGUgcGh5IHR5cGU/DQo+ID4+DQo+ID4+IFRoZSBkd2MzIGdsdWUgY29tcGF0aWJsZSBk
ZXNjcmliZXMgdGhlIGNvbnRyb2xsZXIsIG5vdCB0aGUgcGh5LiBUaGV5IGFyZQ0KPiA+PiBzZXBh
cmF0ZSBJUCBibG9ja3MuIEEgYm9hcmQgdmFyaWFudCBjb3VsZCByZXVzZSB0aGUgc2FtZSBkd2Mz
IGNvbXBhdGlibGUNCj4gPj4gd2l0aCBhIGRpZmZlcmVudCBwaHkgYXR0YWNoZWQsIG1ha2luZyB0
aGF0IGluZmVyZW5jZSBzaWxlbnRseSB3cm9uZy4NCj4gPj4NCj4gPj4gVGhlIHBoeSB0eXBlIGlz
IGRlc2NyaWJlZCBzb21ld2hlcmUgZWxzZSBpbiB0aGUgRFQgKGluIHRoZSBwaHkgbm9kZQ0KPiA+
PiBpdHNlbGYpLCByZWZlcmVuY2VkIHZpYSB0aGUgcGh5J3MgcGhhbmRsZSBvbiB0aGUgZHdjMyBj
b3JlIGNoaWxkIG5vZGUuDQo+ID4+IFdlIGNvdWxkIHdhbGsgdGhhdCBwaGFuZGxlIGFuZCBjaGVj
ayB3aGV0aGVyIHRoZSBwaHkgbm9kZSdzIGNvbXBhdGlibGUNCj4gPj4gY29udGFpbnMgImV1c2Iy
Ii4gSG93ZXZlciwgdGhhdCByZWxpZXMgb24gYSBuYW1pbmcgY29udmVudGlvbiB0aGF0IGlzbid0
DQo+ID4+IGVuZm9yY2VkIGFueXdoZXJlLiBBbGwgY3VycmVudCBldXNiMiBwaHkgY29tcGF0aWJs
ZXMgaGFwcGVuIHRvIGZvbGxvdyBpdA0KPiA+PiAocWNvbSxzbTg1NTAtc25wcy1ldXNiMi1waHks
IHFjb20sc204NzUwLW0zMS1ldXNiMi1waHksDQo+ID4+IHNhbXN1bmcsZXh5bm9zMjIwMC1ldXNi
Mi1waHksIGV0Yy4pLCBidXQgYSBmdXR1cmUgcGh5IGRyaXZlciBjb3VsZCBicmVhaw0KPiA+IA0K
PiA+IFlvdSBoYXZlIGEgZml4ZWQvZmluaXRlIGxpc3Qgb2YgcGh5cyB3aGljaCBuZWVkcyBzb21l
dGhpbmcgc3BlY2lhbCwgc28NCj4gPiB0aGF0IGluZm9ybWF0aW9uIGFzIERtaXRyeSBzYWlkIGlz
IGluIERUIGFscmVhZHkuDQoNCkFyZSB5b3UgcmVmZXJyaW5nIHRvIGEgZml4ZWQgbGlzdCBvZiBl
dXNiMiBwaHkgY29tcGF0aWJsZXMsIG9yIGEgZml4ZWQNCmxpc3Qgb2YgZHdjMyBub2RlIGNvbXBh
dGlibGVzPw0KDQpFaXRoZXIgd2F5LCB0aGUgbGlzdCBpcyBub3QgZml4ZWQuIE5ldyBldXNiMiBT
b0MgdmFyaWFudHMgYXJlIGFkZGVkDQpyZWd1bGFybHksIGFuZCB0aGVyZSBhcmUgYWxyZWFkeSAx
MiBldXNiMiBwaHkgY29tcGF0aWJsZSBzdHJpbmdzIGluIHRoZQ0KRFQgYmluZGluZ3MgYnV0IG9u
bHkgMyBpbiB0aGUgUEhZIGRyaXZlciBvZl9tYXRjaCB0YWJsZXMsIHRoZXkgZG9uJ3QNCmxhbmQg
YXQgdGhlIHNhbWUgdGltZS4gQXMgZm9yIHdoYXQgaW5mb3JtYXRpb24gaXMgYWxyZWFkeSBpbiBE
VCwgSSd2ZQ0KYWRkcmVzc2VkIHRoaXMgYWJvdmUgYW5kIGluIG15IGVhcmxpZXIgcmVzcG9uc2Uu
DQoNCj4gPiANCj4gPiBBbnl3YXksIHRoZSBjb21taXQgbXNnIGFuZCBwcm9wZXJ0eSBmaWVsZCBo
YXZlIGluc3VmZmljaWVudCBkZXNjcmlwdGlvbg0KPiA+IG9mIGFjdHVhbCBoYXJkd2FyZSBwcm9i
bGVtIGJlaW5nIHJlcHJlc2VudGVkIGJ5IHRoaXMgcHJvcGVydHksIHNvIGl0DQo+ID4gbG9va3Mg
d2F5IHRvbyBtdWNoIGFzIFNXIHBvbGljeS4NCg0KVGhhdCdzIGZhaXIgZmVlZGJhY2sgdG8gcmFp
c2Ugd2l0aCBLcmlzaG5hLg0KDQo+IA0KPiANCj4gQW5kIERtaXRyeSBhbHJlYWR5IHNhaWQgdGhp
cyBhdCB2My4NCg0KQW5kIEkndmUgYWxyZWFkeSByZXNwb25kZWQgdG8gaGlzIGNvbW1lbnQgaW4g
djM6DQpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC11c2IvYWhqWXdKdGlNc20wQmNDaEB2
Ym94Lw0KDQo+IA0KPiBBbmQgU2FzaGlrbyBnYXZlIHRoZSBzYW1lIHJldmlldzoNCj4gIltNZWRp
dW1dIFRoZSBgcWNvbSxoYXMtZXVzYjItcGh5YCBwcm9wZXJ0eSBpbnRyb2R1Y2VzIGEgcmVkdW5k
YW50DQo+IGJvb2xlYW4gZmxhZyB0aGF0IGR1cGxpY2F0ZXMgZXhpc3RpbmcgaGFyZHdhcmUgdG9w
b2xvZ3kgaW5mb3JtYXRpb24sIGFuZA0KPiBpdHMgZGVzY3JpcHRpb24gaW5jb3JyZWN0bHkgZW5j
b2RlcyBzb2Z0d2FyZSBiZWhhdmlvci4iDQo+IA0KDQpBcmUgd2UgcmVseWluZyBvbiBBSSBmb3Ig
ZXhwZXJ0IHJldmlld3Mgbm93PyBJZiBzbywgaGVyZSdzIHdoYXQgQ2xhdWRlDQpzYXlzOg0KICAg
IFRoZSBEV0MzIGdsdWUgY29tcGF0aWJsZSBpcyBub3QgYSBwcm94eSBmb3IgUEhZIHR5cGUuIEl0
IGlkZW50aWZpZXMNCiAgICB0aGUgY29udHJvbGxlciBJUCwgd2hpbGUgdGhlIFBIWSBpcyBhbiBl
bnRpcmVseSBzZXBhcmF0ZSBibG9jaw0KICAgIGNvbm5lY3RlZCB2aWEgcGhhbmRsZS4gV2l0aCBh
IHNpbmdsZSBmYWxsYmFjayBjb21wYXRpYmxlDQogICAgKHFjb20sc25wcy1kd2MzKSBjb3Zlcmlu
ZyA1MCsgU29DIHZhcmlhbnRzLCB0aGVyZSBpcyBubyByZWxpYWJsZQ0KICAgIG1hcHBpbmcgZnJv
bSBEV0MzIGNvbXBhdGlibGUgdG8gUEhZIHR5cGUg4oCUIHRoZSBzYW1lIHN0cmluZyBjYW4NCiAg
ICBhcHBlYXIgb24gcGxhdGZvcm1zIHdpdGggZGlmZmVyZW50IFBIWXMuDQoNCiAgICBJbmZlcnJp
bmcgZnJvbSB0aGUgUEhZIG5vZGUncyBjb21wYXRpYmxlIHN0cmluZyBpcyBlcXVhbGx5DQogICAg
cHJvYmxlbWF0aWMuIFRoZSAiZXVzYjIiIHN1YnN0cmluZyBhcHBlYXJzIGNvbnNpc3RlbnRseSB0
b2RheSwgYnV0DQogICAgdGhpcyBpcyBjb2luY2lkZW5jZSwgbm90IGEgYmluZGluZyBjb250cmFj
dC4gTm90aGluZyBpbiB0aGUgRFQNCiAgICBzY2hlbWEgZW5mb3JjZXMgaXQuIEFuIGFsbG93bGlz
dCBpbiBkd2MzLXFjb20uYyB3b3VsZCBuZWVkIHVwZGF0aW5nDQogICAgZXZlcnkgdGltZSBhIG5l
dyBlVVNCMiBQSFkgaXMgaW50cm9kdWNlZCDigJQgYW5kIGFzIHRoZSBnYXAgYmV0d2VlbiBEVA0K
ICAgIGJpbmRpbmdzIGFuZCBQSFkgZHJpdmVyIG9mX21hdGNoIHRhYmxlcyBzaG93cywgdGhvc2Ug
YWRkaXRpb25zIGRvbid0DQogICAgYWx3YXlzIGxhbmQgdG9nZXRoZXIuDQoNCiAgICBBIGJvb2xl
YW4gcHJvcGVydHkgb24gdGhlIERXQzMgbm9kZSBpcyB1bmFtYmlndW91cywNCiAgICBzY2hlbWEt
dmFsaWRhdGVkLCBhbmQgcGxhY2VzIHRoZSBkZWNpc2lvbiB3aXRoIHRoZSBEVCBhdXRob3Igd2hv
IGhhcw0KICAgIGZ1bGwga25vd2xlZGdlIG9mIHRoZSBwbGF0Zm9ybSdzIFBIWSB0b3BvbG9neS4N
Cg0KQlIsDQpUaGluaA==

