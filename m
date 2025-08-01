Return-Path: <linux-arm-msm+bounces-67288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 146A5B17B22
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 04:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BBAD18936D7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 02:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9829C3B29E;
	Fri,  1 Aug 2025 02:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="tH5YPMNy";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XghRGunF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="wljNXAn6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6789023A6;
	Fri,  1 Aug 2025 02:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754014555; cv=fail; b=k9VxDuOwWOSW8qlpqYovP2fKbokTML1D/8vYl8OCHeojAPoG1Bvj551m5Dlu30NYzF4XnIRYqdp3kc9U6RTu2N9FcZ3JTyzArMl9Hk0OhexuykcH1hAxVnRwhQWBOaipMhXT9OQFBvFUKzQBwc0q7noVwrxEEOf2GImkh5bg7Vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754014555; c=relaxed/simple;
	bh=9U7G5KuciNwpQCRhO9G5F7j1jdEQiJilcFhfb2pmZ0s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QQ79OYCtNSnsE4M6RKd/H3QWxynrAj6V8sL7szBwVNiBI11hR2tAOuZMsJssiDgQW34+g00dJQ2xfSSoE3BTR6quuEfjSt/Hoqdmu9NgeJ3mMnpHu61/z18tMcAZdJDdVuj80kvhA8umzx5tpNHKlE3z0VTKxrd4a4d+fSJcg4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=tH5YPMNy; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=XghRGunF; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=wljNXAn6 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56VJc3us006010;
	Thu, 31 Jul 2025 18:01:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=9U7G5KuciNwpQCRhO9G5F7j1jdEQiJilcFhfb2pmZ0s=; b=
	tH5YPMNydtVEw48ySoOQl2nxCWOEX2zee0quI5zfxmE91ZNewtjAq9J8snV0BWoy
	L0dUL7ifoDm/xZQzSAcgW+1aRuPhRF7y1hVGNHnmMZRd04Lw7J/Sr/O2laSSiNQk
	a/1NAC2/B114C4+yQjs+nMnvcekKmcnrWSJTlfQOOaTbRbqiUMhIkJH37cxS/uEx
	j0p+6zGKJEh/20TXyC+anHHZj7OeVIn6+G9tADkWzs+/dzbbM0QdN6jqtfMHp9Ca
	WpogXOuEfzLC6y4jVp1O3+O+uabt8B6IN2Rm8z1GtQwqa0gjwWxS+M/+sQTbuYMq
	JqVkLUVXsPy+JhscJdSP8Q==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 484x96jsf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Jul 2025 18:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1754010091; bh=9U7G5KuciNwpQCRhO9G5F7j1jdEQiJilcFhfb2pmZ0s=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=XghRGunFiCs0t7PXc4B1iA5UbVZ0MPRB482E7fM1SMw+sTsmxbbmy1/3xpRqWpaCt
	 cjdEkSCLwdU43PoS47T7BLUG4biosXbIhr8nFN0n6xMhaT6myvjbfwTBOHKcwGKyBS
	 BMSn0OSeK85JWw1VGRzduCCMPAVMvAHvh3OsdjgPXJNkLNj+Fz6icllT/LDQRlXMeT
	 XOLh/TlAYmfUpbRrc7oETbUQ4LGKhsd0UjcNwGZn3B9MxCzU9gk/8glQl/gQkX9UcV
	 DN5HKF+tDo3fTV4pT1l30FIu0ybE79JpU98Spnp5hgDc5cgzvPa4puiFoEezlBNXmY
	 cUy2ebtcQgQ/w==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5A2C140349;
	Fri,  1 Aug 2025 01:01:31 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 3CE8FA009D;
	Fri,  1 Aug 2025 01:01:30 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=wljNXAn6;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4CB3940144;
	Fri,  1 Aug 2025 01:01:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HyLGEa++BfxjAgstGiW5snUki67w6K+2W2ylX2MjJALlowjWQb/fN4d24t3duztOihhngsu7xKZmtkSAbWlr2XhprGx5jNcivQLPnQGtOt6BPd/UXjWDHItr1rC6BVdDPyUPJQeKJtXa5mxX0cAymTNKrLiIFOhpQT4JJa9Cvj76HKv2nTCI+Y2rLWbP73ur4YtioGSIBEorT1Mm1/RmKj28lne0v5XR7o4VinkVtM0l0D+5yiU/r3sy8j1vTajh/Cx4lcrzOTfaTG70arWy5cbX49FpQsBPqbFy9IfYGLzqA/P8u1OdL/0r4Oj/0BnPFidZpUaqmRjEEpFTgzcFBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9U7G5KuciNwpQCRhO9G5F7j1jdEQiJilcFhfb2pmZ0s=;
 b=DxievuGXWeudwwSAHGEz0jRetDSfhYrAdUULO9f8EbyvTmC80Lep8L1qxHPbog+ucz2bQWEpfUhEOh8qX6d5MVxu8mHP6rDUBPiLsLafb7sqBACDVtM/+UBawF4Py+4zem8sSSMWxduynLJ/sefYWky6PwMl9u7OdrPZ+w9TqjlU1w0zGRWZhScFxta1l0HM7jivzQ63YwXog8YOtRkxXUq4TbM+AzbQ842NTo4E+CnlEtvGR+ZljERQyp1Z4m/gOgxeYnl5UOpDiVKraqBtqZCg/XEeY7B05KaTdPb6poDQxmYiJvC6XlU67G3QOL285TT5817wQhx+/YY8lAgcWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9U7G5KuciNwpQCRhO9G5F7j1jdEQiJilcFhfb2pmZ0s=;
 b=wljNXAn6CrYMpodabiGtTLdFpKBcJu4Def/dSphDWQoZdbxY9OAsnzhVtyMMqj2XkuG4kKqrNiJ3JAwr69ALOgteW65R8rxZ3XNh8ZyBHEy31XU7epDhTb25RXTA8gN9h5+mMZzlKSf5MnZtSDx+WnNMSzLV4qsuXc3fMgs/NYI=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA0PR12MB8893.namprd12.prod.outlook.com (2603:10b6:208:484::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Fri, 1 Aug
 2025 01:01:25 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.8989.011; Fri, 1 Aug 2025
 01:01:25 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
Thread-Topic: [PATCH v2 2/4] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
Thread-Index:
 AQHb2egLqR4/q5MDhUq3kRsaRsZtEbQRekWAgADi4gCAG2ZUgIACOgUAgBovsYCAAA7YAIADD7uA
Date: Fri, 1 Aug 2025 01:01:24 +0000
Message-ID: <20250801010119.tvhb6tjlf4fq7zhg@synopsys.com>
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091357.2983085-3-krishna.kurapati@oss.qualcomm.com>
 <20250623233211.aeehndz2nxqovepd@synopsys.com>
 <a46b9870-207b-45a1-b3e6-5c13e1857640@oss.qualcomm.com>
 <20250711232929.5oukafed5lnvsu2v@synopsys.com>
 <27ff2c46-9402-47e6-b5ea-8a1f783220b1@oss.qualcomm.com>
 <20250730012307.7rwh3lzz4ohd4mob@synopsys.com>
 <ac7212fe-5c22-46cf-ac3b-ac6b93cb1384@oss.qualcomm.com>
In-Reply-To: <ac7212fe-5c22-46cf-ac3b-ac6b93cb1384@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA0PR12MB8893:EE_
x-ms-office365-filtering-correlation-id: 826767d0-364f-4bdb-86ce-08ddd096f034
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eTVmM0pMbjVtUDJodkpvSDBQOVdwUDNiUEluZGFmVE5SRVFBR0wvZklMckJS?=
 =?utf-8?B?dnNSTzNwWG5DdGhNS3RHSzRVRVBYWk1LdXdmYTFZdlR1RUFaVlkva3BLTitU?=
 =?utf-8?B?Ky84ZlNKc1FSekppek5xN1VMWHpIMnZuUkxtcGhQY043Q2tES2JNQ3JVU2di?=
 =?utf-8?B?TXlla2dHTmNiZ1JTcEFHcWQvbnlWazdLMHcwSVgyWi9mbDA2a1ZWb0w4cStp?=
 =?utf-8?B?WmlCT2tHVkhNTGF0TUFaLzZWMEVBMXNnS0E5T2JUUFNIT2JISEcwRy96c1Nm?=
 =?utf-8?B?ZS93Uk9sRG9rVUZFQm9ZVFdsVkVSNHhsL2p1am1SVy80WTlYVmpITU9xVVN2?=
 =?utf-8?B?OXZmVlEwSklJRFFwL1kzMjFVTjlKZS9LVFd5OVVJZmpHbEtWMEZhYW9CQU1k?=
 =?utf-8?B?alMxRDNnMkhKQndiQTl1MDdTRnpIV25wTkJyQ0I2VSthVURISmNTNjQ1YnRv?=
 =?utf-8?B?cUNUU0Y4OFlDOGVBcjg3VlVtOEhRT1UxNHVjbUNjM3lzWkxWcCtSZ3JxZFE1?=
 =?utf-8?B?RFRoZy8wSDA4SnFlSUVEazZUZUVxMTdwU3dtR0p2R0s2eEhVUFFLUWNNMVNK?=
 =?utf-8?B?b245TlZNK0lUU2NRUllnd2hrQVA0WlZ5WlBLSElwa0xPYzh3R0ltTFVNLzBP?=
 =?utf-8?B?TUxlanp6V3dSUi9sSnladm9ucy9tUHVuaVptK282REZIVlJ0a2FNRjhHK2tZ?=
 =?utf-8?B?OFlBd25Zc2lrblFKVmVuMUFQeDd5Vmd2ZVFBSDVqTTlvWEdLRm1YeHdBaEdF?=
 =?utf-8?B?dHo3Unp0cllSdHZ2SWRtSU1GVkw3SlZIZFM2QjZFNzh1U3dGVlVtSWxER2hE?=
 =?utf-8?B?b2tENGEvVytTSlNrMUFaSVV2Nk1vcE1COFVDK3EyWE1IM2NsSHBnUlhsTm1r?=
 =?utf-8?B?SHJXSUtGTk9oaElJUmxyOHVsMnpHQWlob0JOMUZVcENrWDVxWDlvMHJ6bTdL?=
 =?utf-8?B?TmZIeXpGMVNGaWtuNE9VN1FOUzFsaXlBVFZVaHBJb0R4RG03NzFWU2N6d0RQ?=
 =?utf-8?B?cmVJa1NLN1ZRMGd5WTJQaE5NVFhrWkdtWXFWaWtDTFp2Qk9JVDZDamEvUWoy?=
 =?utf-8?B?OUM1bVVoalBocHZkSFVpZURpQmRBcVc2SVpPWWF2Sk10bktHbnJHS05oZ2NK?=
 =?utf-8?B?ajQ5MjlNUkdCNkkrQkl1Tkh5cEhxOTZpZ2M3eFpTaW8yVXdoek1OQW1xZDZX?=
 =?utf-8?B?SjdFVUpuNjJNTmUvcHFqMmtLRkpTNnBNcW15dDlhSldLa0VoUlYrbTlXZzhi?=
 =?utf-8?B?Vk9OVEY2K3ZERy8yNTlMcnRjVytqbXJ6MnZjZHFuK3BjN3JuTnNwSTUvcDkx?=
 =?utf-8?B?TFc3Q2NjM2E4aGo5dTVzZE85QU5COGdPUDA0U3BYL3ozZkR5UXIrSWlmSDNm?=
 =?utf-8?B?OGorU1dXVVAxWHF6U015UkV0TDJGOU1NaEVuaHpFY3dKL0JzRThnLzRlUVdJ?=
 =?utf-8?B?MmtpaHR2VXViNHV6bitUeEVoTElqOTJaZGU0ODBBdGc2V0FrMGdWN093TnJB?=
 =?utf-8?B?d2JnSTAxWnlaRFRxcEJVVmtqQVFRWDQ3TUdCenZNUFpwWHNiSXREdHluOFVv?=
 =?utf-8?B?S0h6cVZkT1BqbHRtTXRCemxPWGRzYkJBOHhhSE9MZmpFN0E2TGpGaW56am1p?=
 =?utf-8?B?dWN0alZPVWxSdFR4Z2ZySnIyTGtCOTVMS2JCakF6MW1XcWVKTEJXN2xTSGNn?=
 =?utf-8?B?VU16RmNoOEpsMTNtcTdROVNTL0FJS1BEUEJ0dlIzYURwQzVjK1NYcDZwY29W?=
 =?utf-8?B?WUpOUzBZd2gweDFuOFdnNnZHSWlEbGZoNkFjSFF6MW9oKzYyT3JMTU1TOGJ4?=
 =?utf-8?B?SzluQWxCTWlwZHZZbDZTZ0R6WWpkRUFtVXVRRS8xZitSZkhoRGQ2bmJmVktZ?=
 =?utf-8?B?dDROQ0d4SC82d1ptZW5kU0hqb2RPV3pXN2E2TFB3YTRack85V1p1T3FkaVYy?=
 =?utf-8?B?VmMvNGw3eGRHS2s2V3V1WkdRT0Y1bWpOVzhCak9WTFhwQ2ZtSllPSnJzbnJy?=
 =?utf-8?B?QXNjck9aTWl3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NU8ra0R5MzM5STFuOFJkV0pXVzVMbzRJT2p6UlV2NTdaMUxvZFU1b3AwYmxv?=
 =?utf-8?B?NHRwemN6Ym1SSHk3dUNmVTJPa2dUbFVqREVLVkUrZU8zUSs4RXpCWERQcHUr?=
 =?utf-8?B?TkxuTytKMlFPa09HMHR1aFhzejY0b08wTmkvTkZIZG5ySlMxOTJmYlUrMVNq?=
 =?utf-8?B?L2d6Q3NjU2k2U3ArazhTT3pwUDdrTE1CZGV4YkkzcVFFZml3cTVEc0h0N01p?=
 =?utf-8?B?LzRzUERDc1IxTm5UZkg1OTBYK2dnUDgzbXZkN3dtTmF2dWxFQ3Q0S3RtUHdo?=
 =?utf-8?B?dmVLYmphWThxOTM4TnJ0SkFxeVlPdGNvamRxRzY2dmRrZTBOZFFnZTJxMFhF?=
 =?utf-8?B?Rmw3bTBycjVOMlluUG81THU1Z002czdNNC9uTjliWERqY0ZLdkFaTlZtS2lY?=
 =?utf-8?B?ZGhuTEgxdHhXcEJab21jYnhtNGxnT1laWnVONWN4WW5XK3NCalpMWnh3MmIx?=
 =?utf-8?B?Q1lyWHdobW8xaS9LMEl2Y0VwaTFBY0lod0w1OWN5NTRuM1FPWUxoZDRXcE1W?=
 =?utf-8?B?NWZQM2E3ZEZVNU5weDdRQnlzSVlVSnY5Qlg3UWw1cWV2M1F4ckM2emtRUm01?=
 =?utf-8?B?WDBPZW02OC82WlkrN1JQK255UWVLbjFuQ0JBbkJRZlE5SzRyMXViY3JwUlAz?=
 =?utf-8?B?cTNVMm5Yd0lsYmdYSzEzSzZ4MTBISDdpVjR5S1hpVkZFS0ZML21nNmhEWmhm?=
 =?utf-8?B?OTk1REFLaXBXYWV4ZU5KeE9SSncva1BJaEhiTTZxdTRkdmxzZElNcHNzMkpU?=
 =?utf-8?B?Y3MwSW9LK3dITkQzMFAwRjhKT2ZtbUFnMjB1L3dhZFpJN2JtSHJnOXVhaFNt?=
 =?utf-8?B?dWZlZWFuaU9IdmxiOXNEZmZPTmM0ZStlbUl2ekZqZ2dlSmF5WUdVMXliU0w1?=
 =?utf-8?B?VmdTK2RoR0xCUzFLeXd3eVFCb21lbVpQa2QxR2diUmpGajlRZTdWbFdWTEE1?=
 =?utf-8?B?SXUyWk52N1o3RU9PMU54c0F3SldiUElRQjBaMy80L3I3aGlZdkpTVCs4SUxn?=
 =?utf-8?B?NnFsRCtTaENlZU5CaG04SzIwZUlJMGFZZEhEOFp6Qm0vc014MHo2djhPeGor?=
 =?utf-8?B?Y1hGZ2FQWjFzZTAvSkltY3RjVnBHVHdjeVVKeDE3WVIyVUFBRzRJWXdiY3FM?=
 =?utf-8?B?TmE3K0lpV2RidEtxazRWVlg5blRRS3NKQlVCSU5mQ0xHSHI3Zng2WWdHV1l5?=
 =?utf-8?B?Rk9DZ0VaZ01Oc0dtRWRiQTlpV0Zac0VXdzI0OEx1eVVMYUg0V2pIRFgzSEpR?=
 =?utf-8?B?amNodDUxZUpTVUhuTTBqY0JMRHZEelo5NmM2eEpBc3JKMXhlZDlLVG1hWUFn?=
 =?utf-8?B?YkdyRU1vQ3lKY09XNEo0WTlDV0o5THV1d1RjbkducUN5cHdJRmVkM2RKQXNF?=
 =?utf-8?B?WG1ZOVNqK2lHNTE4ekNYYjhQUGZFUE45dDhVNjY4VHFXOGVJajVqOG5HTW9p?=
 =?utf-8?B?YWhRcytRMm9WQzJiSHAzeXZBT1YvQThxdXVHSzRqRUE3eVoyQ2pQNFRpR2hp?=
 =?utf-8?B?T0wxdEwxTGhxcG1jakVLbjllOU05eWorK0tsSEg2Qm9ONERWVGZSTy91Q1Ex?=
 =?utf-8?B?RkQxMm9KT3pEWWVyRC9SYmxMcUUvS0dBby9TZlJVcHFvakRYN0QycFR1ajNE?=
 =?utf-8?B?aURBWmd5dVdrNW5DYUN2MGZ0aFpVMjVveVhGcTVMeU0vTmtPY0tGMDJrRHAv?=
 =?utf-8?B?UlJqL1ZHWjZxRzJLZXFTSlF1c3paVG9rQTJ2VVdQdGlTUjNjVEV3SDI0M1Zh?=
 =?utf-8?B?QnF1L2dPN1I5QjNEeDRQRnJIOFFqZWpSQkR3eW1wSlo1TDBYS1pkYnJ1MjRX?=
 =?utf-8?B?ejQvanpTcThjN3NzODdrWDZzMTl4a25sMXhlblpybXZ6aGZ5VndZS1JycGtQ?=
 =?utf-8?B?SUYzU0dqZ3F3WEYvd0VnUkh1S0hCQTllWFhjcW1yNjYzWUVNM053aGxmSG1h?=
 =?utf-8?B?K244dGtSU3ZWTVJaVURVQXl5clhMU1JCSWVKcWg5bkczUG9wc3RBNVRhNzVj?=
 =?utf-8?B?cG1SeHJDUDk0cXlKSmpMQTdBKzZ3Mm5yVzFuaGR2bFE4aTZXbGU2ZThqWW42?=
 =?utf-8?B?VjdGb08wdjFhQUNTdmRRTU9Kd2FYNEJ0cTc1YXgzejlvUzY5TzFkdXpxeVNr?=
 =?utf-8?Q?Degj2H30pa9O+xl41NCzzT9ll?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <81E522AB7A0F1949A10EBAF90A797A74@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+LYnFzcfozlwGQ68QdB1ayxb4hPPlYk0Ns8uyIgHFH5ZeYSpcBsNg9r6nuuhdFgqQKyTBfjiRoUe0cbXXBkcv4ga+ZKfQ088Qg9uNDIOWY+b90E618T69GLr7CYvi2rvJ4XqXQMMDMArxkULMzG5/jXZLbQBdiXiAP4NFy1xcjgRgPb+g+ot2dHNfB/pIS8DW9B89wLhKElEZqDedVjhA8WqsNGtHJQu+22SeSJaD1SP7360QeNdAPG47ywQBC0iLM/d/Z0utNorPm/Xnta/Zx06orwxdR++Vt6tP9rypyRCk09zyLdOIzJlXEI1yqZAknpSxXCpuT3qhyMxk3Wz4ECNlDKuWHXZ03A32jWUFoGo8RGDe6FkHe9BcsZJwuisBecP982/35atu+fWyR5N4rBVZeo7kpOJW6AR8OC8jQi3UlzOU96O8JGk3hLPb4exB20RdM7dbyHrWZgclyWOTAuk6nnBbr5eO94YjP8sqGZr8/+uIw8N8VQTmxcjxMOMftyeIKizlEJZ5BYeD4zz3cywAitBFcnW1xN1kJh1tUzKi9Tw5M4ItYcwzmjeTyIn3Xw9b6Rtx3g9oORsgzRNRtMpCXrDw+IxuuxYQpe9iKlIaDv6rQ3ctPMWJTrbTcnaBVx5z+e4vhZN9qW45x4F8Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 826767d0-364f-4bdb-86ce-08ddd096f034
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 01:01:24.9635
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: azSiHdzfC4f1RseQTJJQP96CJcwg5WEnULBMgrQTHB/IzaYCqudzWoeTRWWg9jh7OPpnLHiRuj/MPJFfkYdQjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8893
X-Proofpoint-GUID: zGl5IMINKNZJwPBtlZDaSQZw8drMhWiZ
X-Proofpoint-ORIG-GUID: zGl5IMINKNZJwPBtlZDaSQZw8drMhWiZ
X-Authority-Analysis: v=2.4 cv=Z8TsHGRA c=1 sm=1 tr=0 ts=688c11ec cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=qPHU084jO2kA:10
 a=EUspDBNiAAAA:8 a=oSCnQbLdIDCdDk6lPBwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDA5OSBTYWx0ZWRfX+1zF7+bi118y
 +QlQ1/TFYpaUxfwkbyDuAYs9qQpk6Vq4gMPee0Ow2hwIf3SHdllRsoWYxhMQK/CSOevlBu72Et/
 eok2MRRNYlVq5KdW0m6PYp27evbU8NQfjgiQlMtR8s/ZvdEr+f8yKRFvMCnJQ7a41v66mfES4qP
 39SK6OoO3aQfO5/T2Ntpa+VhEz20KUvNNhCSfOYEjYt3FcCVH5E6MA8PXNyaG/ix3J52O/0tyBY
 AJOq4y2UkHEse1sFnkU3hyYSUNHXdl1DIx2U8XVf5KuRGvoTCbTlW0T8qtRkLJuoOy+P23zJJcZ
 hymlPM0cCNRGf7a77pQyP8w9lCXWKosdWx1cFskuIbIOUR7yzI6QzzUPmnzR7CHBYFMjeB5q9Cp
 VjTKdcGq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_04,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 adultscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0
 malwarescore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507260099

T24gV2VkLCBKdWwgMzAsIDIwMjUsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+IA0KPiANCj4g
T24gNy8zMC8yMDI1IDY6NTMgQU0sIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBTdW4sIEp1
bCAxMywgMjAyNSwgS3Jpc2huYSBLdXJhcGF0aSB3cm90ZToNCj4gPiA+IA0KPiA+ID4gDQo+ID4g
PiBPbiA3LzEyLzIwMjUgNDo1OSBBTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+ID4gPiBPbiBU
dWUsIEp1biAyNCwgMjAyNSwgS3Jpc2huYSBLdXJhcGF0aSB3cm90ZToNCj4gPiA+ID4gPiANCj4g
PiA+ID4gPiANCj4gPiA+ID4gPiBPbiA2LzI0LzIwMjUgNTowMiBBTSwgVGhpbmggTmd1eWVuIHdy
b3RlOg0KPiA+ID4gPiA+ID4gT24gVHVlLCBKdW4gMTAsIDIwMjUsIEtyaXNobmEgS3VyYXBhdGkg
d3JvdGU6DQo+ID4gPiA+ID4gPiA+IE9uIFF1YWxjb21tIERXQzMgZHVhbC1yb2xlIGNvbnRyb2xs
ZXJzLCB0aGUgY29ubmRvbmUvZGlzY29ubmVjdCBldmVudHMgaW4NCj4gPiA+ID4gPiA+ID4gZGV2
aWNlIG1vZGUgYXJlIGdlbmVyYXRlZCBieSBjb250cm9sbGVyIHdoZW4gc29mdHdhcmUgd3JpdGVz
IHRvIFFTQ1JBVENIDQo+ID4gPiA+ID4gPiA+IHJlZ2lzdGVycyBpbiBRdWFsY29tbSBHbHVlIGxh
eWVyIHJhdGhlciB0aGFuIHRoZSB2YnVzIGxpbmUgYmVpbmcgcm91dGVkIHRvDQo+ID4gPiA+ID4g
PiA+IGR3YzMgY29yZSBJUCBmb3IgaXQgdG8gcmVjb2duaXplIGFuZCBnZW5lcmF0ZSB0aGVzZSBl
dmVudHMuDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBVVE1JX09UR19WQlVTX1ZBTElE
ICBiaXQgb2YgUVNDUkFUQ0hfSFNfUEhZX0NUUkwgcmVnaXN0ZXIgbmVlZHMgdG8gYmUgc2V0DQo+
ID4gPiA+ID4gPiA+IHRvIGdlbmVyYXRlIGEgY29ubmVjdGlvbiBkb25lIGV2ZW50IGFuZCB0byBi
ZSBjbGVhcmVkIGZvciB0aGUgY29udHJvbGxlciB0bw0KPiA+ID4gPiA+ID4gPiBnZW5lcmF0ZSBh
IGRpc2Nvbm5lY3QgZXZlbnQgZHVyaW5nIGNhYmxlIHJlbW92YWwuIFdoZW4gdGhlIGRpc2Nvbm5l
Y3QgaXMNCj4gPiA+ID4gPiA+ID4gbm90IGdlbmVyYXRlZCB1cG9uIGNhYmxlIHJlbW92YWwsIHRo
ZSAiY29ubmVjdGVkIiBmbGFnIG9mIGR3YzMgaXMgbGVmdA0KPiA+ID4gPiA+ID4gPiBtYXJrZWQg
YXMgInRydWUiIGFuZCBpdCBibG9ja3Mgc3VzcGVuZCByb3V0aW5lcyBhbmQgZm9yIHRoYXQgdG8g
aGFwcGVuIHVwb24NCj4gPiA+ID4gPiA+ID4gY2FibGUgcmVtb3ZhbCwgdGhlIGNhYmxlIGRpc2Nv
bm5lY3Qgbm90aWZpY2F0aW9uIGNvbWluZyBpbiB2aWEgc2V0X3JvbGUNCj4gPiA+ID4gPiA+ID4g
Y2FsbCBuZWVkIHRvIGJlIHByb3ZpZGVkIHRvIHRoZSBRdWFsY29tbSBnbHVlIGxheWVyIGFzIHdl
bGwuDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBDdXJyZW50bHksIHRoZSB3YXkgRFdD
MyBjb3JlIGFuZCBRdWFsY29tbSBsZWdhY3kgZ2x1ZSBkcml2ZXIgYXJlIGRlc2lnbmVkLA0KPiA+
ID4gPiA+ID4gPiB0aGVyZSBpcyBubyBtZWNoYW5pc20gdGhyb3VnaCB3aGljaCB0aGUgRFdDMyBj
b3JlIGNhbiBub3RpZnkgdGhlIFF1YWxjb21tDQo+ID4gPiA+ID4gPiA+IGdsdWUgbGF5ZXIgb2Yg
YW55IHJvbGUgY2hhbmdlcyB3aGljaCBpdCByZWNlaXZlcyB2aWEgcm9sZSBzd2l0Y2guIFRvDQo+
ID4gPiA+ID4gPiA+IHJlZ2lzdGVyIHRoZXNlIGdsdWUgY2FsbGJhY2tzIGF0IHByb2JlIHRpbWUs
IGZvciBlbmFibGluZyBjb3JlIHRvIG5vdGlmeQ0KPiA+ID4gPiA+ID4gPiBnbHVlIGxheWVyLCB0
aGUgbGVnYWN5IFF1YWxjb21tIGRyaXZlciBoYXMgbm8gd2F5IHRvIGZpbmQgb3V0IHdoZW4gdGhl
DQo+ID4gPiA+ID4gPiA+IGNoaWxkIGRyaXZlciBwcm9iZSB3YXMgc3VjY2Vzc2Z1bCBzaW5jZSBp
dCBkb2VzIG5vdCBjaGVjayBmb3IgdGhlIHNhbWUNCj4gPiA+ID4gPiA+ID4gZHVyaW5nIG9mX3Bs
YXRmb3JtX3BvcHVsYXRlLg0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gSGVuY2UgaW1w
bGVtZW50IHRoZSBmb2xsb3dpbmcgZ2x1ZSBjYWxsYmFja3MgZm9yIGZsYXR0ZW5lZCBRdWFsY29t
bSBnbHVlDQo+ID4gPiA+ID4gPiA+IGRyaXZlcjoNCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4g
PiA+IDEuIHNldF9yb2xlOiBUbyBwYXNzIHJvbGUgc3dpdGNoaW5nIGluZm9ybWF0aW9uIGZyb20g
ZHJkIGxheWVyIHRvIGdsdWUuDQo+ID4gPiA+ID4gPiA+IFRoaXMgaW5mb3JtYXRpb24gaXMgbmVl
ZGVkIHRvIGlkZW50aWZ5IE5PTkUvREVWSUNFIG1vZGUgc3dpdGNoIGFuZCBtb2RpZnkNCj4gPiA+
ID4gPiA+ID4gUVNDUkFUQ0ggdG8gZ2VuZXJhdGUgY29ubmVjdC1kb25lIGV2ZW50IG9uIGRldmlj
ZSBtb2RlIGVudHJ5IGFuZCBkaXNjb25uZWN0DQo+ID4gPiA+ID4gPiA+IGV2ZW50IG9uIGNhYmxl
IHJlbW92YWwgaW4gZGV2aWNlIG1vZGUuDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiAy
LiBydW5fc3RvcDogV2hlbiBib290aW5nIHVwIGluIGRldmljZSBtb2RlLCBpZiBhdXRvdXNwZW5k
IGlzIGVuYWJsZWQgYW5kDQo+ID4gPiA+ID4gPiA+IHVzZXJzcGFjZSBkb2Vzbid0IHdyaXRlIFVE
QyBvbiBib290LCBjb250cm9sbGVyIGVudGVycyBhdXRvc3VzcGVuZC4gQWZ0ZXINCj4gPiA+ID4g
PiA+ID4gdGhpcywgaWYgdGhlIHVzZXJzcGFjZSB3cml0ZXMgdG8gVURDIGluIHRoZSBmdXR1cmUs
IHJ1bl9zdG9wIG5vdGlmaWVyIGlzDQo+ID4gPiA+ID4gPiA+IHJlcXVpcmVkIHRvIGVuYWJsZSBV
VE1JX09UR19WQlVTX1ZBTElEIG9mIFFTQ1JBVENIIHNvIHRoYXQgY29ubmVjdCBkb25lDQo+ID4g
PiA+ID4gPiA+IGV2ZW50IGlzIGdlbmVyYXRlZCBhZnRlciBydW5fc3RvcCgxKSBpcyBkb25lIHRv
IGZpbmlzaCBlbnVtZXJhdGlvbi4NCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEtyaXNobmEgS3VyYXBhdGkgPGtyaXNobmEua3VyYXBhdGlAb3NzLnF1YWxjb21t
LmNvbT4NCj4gPiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiA+ICAgICBkcml2ZXJzL3VzYi9k
d2MzL2R3YzMtcWNvbS5jIHwgODIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0t
DQo+ID4gPiA+ID4gPiA+ICAgICAxIGZpbGUgY2hhbmdlZCwgNzMgaW5zZXJ0aW9ucygrKSwgOSBk
ZWxldGlvbnMoLSkNCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20u
Yw0KPiA+ID4gPiA+ID4gPiBpbmRleCBjYTdlMWMwMjc3M2EuLmQ0MGI1MmUyYmEwMSAxMDA2NDQN
Cj4gPiA+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYw0KPiA+ID4g
PiA+ID4gPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jDQo+ID4gPiA+ID4gPiA+
IEBAIC04OSw2ICs4OSwxMiBAQCBzdHJ1Y3QgZHdjM19xY29tIHsNCj4gPiA+ID4gPiA+ID4gICAg
IAlib29sCQkJcG1fc3VzcGVuZGVkOw0KPiA+ID4gPiA+ID4gPiAgICAgCXN0cnVjdCBpY2NfcGF0
aAkJKmljY19wYXRoX2RkcjsNCj4gPiA+ID4gPiA+ID4gICAgIAlzdHJ1Y3QgaWNjX3BhdGgJCSpp
Y2NfcGF0aF9hcHBzOw0KPiA+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiA+ICsJLyoNCj4gPiA+
ID4gPiA+ID4gKwkgKiBDdXJyZW50IHJvbGUgY2hhbmdlcyB2aWEgdXNiX3JvbGVfc3dpdGNoX3Nl
dF9yb2xlIGNhbGxiYWNrIHByb3RlY3RlZA0KPiA+ID4gPiA+ID4gPiArCSAqIGludGVybmFsbHkg
YnkgbXV0ZXggbG9jay4NCj4gPiA+ID4gPiA+ID4gKwkgKi8NCj4gPiA+ID4gPiA+ID4gKwllbnVt
IHVzYl9yb2xlCQljdXJyZW50X3JvbGU7DQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IENhbiB3
ZSBqdXN0IHRyYWNrIHRoZSBjdXJyZW50IHJvbGUgdGhyb3VnaCBkd2MzIGNvcmUgaW5zdGVhZCBv
ZiBhbg0KPiA+ID4gPiA+ID4gYWRkaXRpb24gZmllbGQgaW4gdGhlIGdsdWU/DQo+ID4gPiA+ID4g
PiANCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBDb3JlIGNhY2hlcyBvbmx5IG1vZGUuIFdlIG5lZWQg
Uk9MRSBOT05FIHRvIGlkZW50aWZ5IGNhYmxlIGNvbm5lY3QuIFNvDQo+ID4gPiA+ID4gYWRkaW5n
IHRoYXQgaW4gZ2x1ZSB0byBrZWVwIHRyYWNrLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiANCj4gPiA+
ID4gVGhlIGNvbnRyb2xsZXIgaXMgYWx3YXlzIGVpdGhlciBob3N0IG9yIGRldmljZSwgbm90IHNv
bWV3aGVyZSBpbg0KPiA+ID4gPiBiZXR3ZWVuLiBZb3UncmUgdXNpbmcgUk9MRV9OT05FIHRvIGlu
ZGljYXRlIGNvbm5lY3Rpb24sIHdoaWNoIGlzIGENCj4gPiA+ID4gc2VwYXJhdGUgc3RhdGUuDQo+
ID4gPiA+IA0KPiA+ID4gDQo+ID4gPiBZZXMsIGJ1dCB0aGVyZSBpcyBubyBmbGFnIHRoYXQgaW5k
aWNhdGVzIHRoYXQgaW4gZHdjIHN0cnVjdHVyZSB0b2RheS4gQWxzbw0KPiA+ID4gc2luY2Ugb25s
eSBkd2MzLXFjb20gbmVlZHMgaXQgYXQgdGhlIG1vbWVudCwgSSBhZGRlZCB0aGF0IHJvbGUgaW5m
byBpbiBnbHVlDQo+ID4gPiBsYXllci4NCj4gPiANCj4gPiBIb3cgYXJlIHlvdSB1c2luZyBST0xF
IE5PTkU/IERvIHlvdSBzZW5kIGEgcm9sZS1zd2l0Y2ggY2FsbCB0byAibm9uZSIgdG8NCj4gPiBp
bmRpY2F0ZSBkaXNjb25uZWN0PyBMZXQncyBub3QgZG8gdGhhdC4gQ3VycmVudGx5IHRoZSBkd2Mz
IGRyaXZlciB3b3VsZA0KPiA+IHN3aXRjaCBiYWNrIHRvIHRoZSBkZWZhdWx0IG1vZGUgaWYgIm5v
bmUiIGlzIHNlbGVjdGVkLCBidXQgdGhpcyBpcyBub3QNCj4gPiB3ZWxsIGRlZmluZWQgYW5kIGlt
cGxlbWVudGF0aW9uIHNwZWNpZmljLiBJdCBjYW4gYmUgbm8tb3AgYW5kIHdvdWxkIG5vdA0KPiA+
IHZpb2xhdGUgdGhlIGludGVyZmFjZS4NCj4gPiANCj4gPiBUaGUgcm9sZS1zd2l0Y2ggaW50ZXJm
YWNlIHNob3VsZCBvbmx5IGJlIHVzZWQgZm9yIHJvbGUtc3dpdGNoaW5nIGFuZCBub3QNCj4gPiBj
b25uZWN0aW9uL2Rpc2Nvbm5lY3Rpb24uDQo+ID4gDQo+ID4gPiANCj4gPiA+ID4gSSBmZWVsIHRo
aXMgc2hvdWxkIGJlIHRyYWNrZWQgc2VwYXJhdGVseSBmb3IgY2xhcml0eS4gVGhlIGR3YzMgYWxz
bw0KPiA+ID4gPiB0cmFja3MgdGhlIGNvbm5lY3Rpb24gc3RhdGUsIGNhbiB3ZSB1c2UgdGhhdD8N
Cj4gPiA+ID4gDQo+ID4gPiANCj4gPiA+IEFyZSB5b3UgcmVmZXJyaW5nIHRvIHRoZSAiY29ubmVj
dGVkIiBmbGFnIGluIERXQyBzdHJ1Y3R1cmUgPyBJIHNlZSB0aGF0IGl0DQo+ID4gPiBpbmRpY2F0
ZXMgY29ubmVjdGlvbiBzdGF0dXMgb25seSBpbiBnYWRnZXQgbW9kZS4NCj4gPiA+IA0KPiA+IA0K
PiA+IFllcywgdGhhdCBmbGFnIGlzIG9ubHkgZm9yIGdhZGdldC4NCj4gPiANCj4gPiBDYW4geW91
IHByb3ZpZGUgbW9yZSBpbmZvIG9mIHRoZSBzZXR1cD8gSXMgdGhlcmUgYSB0eXBlLWMgY29udHJv
bGxlciBvcg0KPiA+IHBoeSB0aGF0IGNhbiBkZXRlY3QgYXR0YWNoL2RlYXR0YWNoPyBPciBpdCBv
bmx5IHByb3BhZ2F0ZXMgdG8gdGhlIHVzYg0KPiA+IGNvbnRyb2xsZXI/DQo+IA0KPiBNeSByZXNw
b25zZSBkaWRuJ3Qgc2hvdyB1cCBvbiBsb3JlIHNpbmNlIHRoZSBtYWlsIGNsaWVudCBJIHVzZWQg
YmVmb3JlIHNlbnQNCj4gdGhlIG1lc3NhZ2UgaW4gSFRNTCBmb3JtYXQuIFNvIHJlc2VuZGluZyBt
eSByZXNwb25zZSBhZ2Fpbi4NCj4gDQo+IEhpIFRoaW5oLA0KPiANCj4gIFllcyB0aGlzIGlzIGZv
ciBjYXNlcyB3aGVyZSByb2xlIHN3aXRjaGluZyBpcyBwcmVzZW50IChlaXRoZXIgd2l0aCBhIFR5
cGUtQw0KPiBjb250cm9sbGVyLCBVU0ItY29ubi1ncGlvLCBvciBhIGdsaW5rIGJhc2VkIHJvbGUt
c3dpdGNoKS4NCj4gDQo+ICBBY3R1YWxseSB0aGUgcmVxdWlyZW1lbnQgaXMgYXMgZm9sbG93czoN
Cj4gIDEuIFdoZW4gaW4gZGV2aWNlIG1vZGUsIGlmIHdlIHJlY2VpdmUgYSBjYWJsZSBkaXNjb25u
ZWN0LCB3ZSBuZWVkIHRvIGNsZWFyDQo+IE9UR19WQlVTX1ZBTElEIGJpdCBvZiBRU0NSQVRDSCBy
ZWdpc3RlciBpbiBnbHVlIGFkZHJlc3Mgc3BhY2UuDQo+ICAyLiBXaGVuIGNhYmxlIGlzIGNvbm5l
Y3RlZCBpbiBkZXZpY2UgbW9kZSwgd2UgbmVlZCB0byBzZXQgdGhlDQo+IE9UR19WQlVTX1ZBTElE
IGJpdCBvZiBRU0NSQVRDSCByZWdpc3RlciBpbiBnbHVlIGFkZHJlc3Mgc3BhY2UuDQo+ICAzLiBX
aGVuIHRoZSBydW5zdG9wIGlzIHNldCBiYWNrIGFmdGVyIGEgc3VzcGVuZCByb3R1aW5lLCB0aGVu
IHdlIG5lZWQgdG8NCj4gc2V0ICBPVEdfVkJVU19WQUxJRCBiaXQgb2YgUVNDUkFUQ0ggcmVnaXN0
ZXIgaW4gZ2x1ZWFkZHJlc3Mgc3BhY2UuDQo+IA0KPiAgVG8gdGFrZSBjYXJlIG9mIGFsbCB0aGUg
MyBzY2VuYXJpb3MgYWJvdmUsIHRoZSBzZXRfcm9sZSBhbmQgcnVuX3N0b3ANCj4gbm90aWZpZXJz
IGhhdmUgYmVlbiBhZGRlZC4NCj4gDQo+ICBUaGUgcm9sZSBpbmZvIHByb3BhZ2F0ZXMgb25seSBm
cm9tIGNvcmUgdG8gZ2x1ZS4gSXQgaXMgbm90IHNlbnQgdG8gdGhlIHBoeS4NCj4gDQoNCldoZW4g
ZG9lcyBST0xFIE5PTkUgb2NjdXI/IERpZCB5b3UgaGF2ZSB0aGUgdHlwZS1jIGRyaXZlciBzZXQg
dGhlIHJvbGUNCnN3aXRjaCB0byAibm9uZSIgaW5kaWNhdGUgZGlzY29ubmVjdD8NCg0KVGhlIHZi
dXMtdmFsaWQgaXMgb25seSBmb3IgZ2FkZ2V0LCBhbmQgeW91IG9ubHkgY2FyZSBhYm91dCB0aGUN
Ck9UR19WQlVTX1ZBTElEIHJpZ2h0PyBDYW4gd2UganVzdCB1c2UgdGhlIGR3YzMtPmNvbm5lY3Rl
ZCBmbGFnPyBKdXN0DQptYWtlIHN1cmUgdGhhdCBpdCdzIGNsZWFyZWQgb24gcm9sZS1zd2l0Y2gs
IHdoaWNoIHNob3VsZCBiZSB0aGUgY2FzZQ0KYmVjYXVzZSB3ZSBhbHdheXMgcGVyZm9ybSBzb2Z0
LWRpc2Nvbm5lY3Qgb24gZ2FkZ2V0IHVuYmluZCwgYW5kIG1ha2UNCnN1cmUgdG8gc2V0IHZidXMt
dmFsaWQgb24gcHVsbHVwIG9yIGdhZGdldCBiaW5kaW5nLiBJcyB0aGVyZSBzb21lDQpzY2VuYXJp
b3MgdGhhdCBkd2MtPmNvbm5lY3RlZCBkb2VzIG5vdCBjb3Zlcj8NCg0KVGhhbmtzLA0KVGhpbmg=

