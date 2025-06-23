Return-Path: <linux-arm-msm+bounces-62121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1FBAE5808
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 01:32:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48EBF1C26426
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 23:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB9B223DD0;
	Mon, 23 Jun 2025 23:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="pqhShGgB";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RQ9pXxt5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="c8GHHyNS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A71A1B393C;
	Mon, 23 Jun 2025 23:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750721545; cv=fail; b=gqXLHLpPMFyZYxFL7QCnXN3CLpDtLJ5JA/U24Mu1JA50Lzrx9jpQQLtdIiNckZDkUcy+2Rc75tDRr87/Yyhwn+4GKPYN17NUE3KMcrKOn8RXveWVhg6I1QvPistg4jp4b3A6ZwF6GNz8rWLq9GfGhEJYNyFhiqpqKXoUiplYCOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750721545; c=relaxed/simple;
	bh=UArxGcBCbfF8bZGSgJV221iDT8iWpwLcTg43B8pCbO4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=W0OhLDF99uha8b3JvnSvkr65FuaCHKg/nBhBo3rmQKsNhcYYn2Kl9Yq9gLwU99RnpfaK4aN7am+qzZqAk55fAr76J3e0TOGhKBhTAhhiZeABabsHhzSz5flY+wLtYKixWgjXYLWGdLMYd8CdIKQ9ETpn0ITMiGd1ps+LDxEalMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=pqhShGgB; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=RQ9pXxt5; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=c8GHHyNS reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NGWBlh021557;
	Mon, 23 Jun 2025 16:32:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=UArxGcBCbfF8bZGSgJV221iDT8iWpwLcTg43B8pCbO4=; b=
	pqhShGgBR0lLnnRtBIMoNqNwTqUFlCOr5qt1vHpBBiJE7k629Urwb0Wy8k+LyJ/J
	IHy+Rhy61Lz4cPoW4cxxMiLmH+50L3P3FQWbUgM0ntUPqaxJAS+bDkYYvAX01fS4
	fo32GKsSmmU+iNSBmnFB4tgat438WgmLSXZRMnbSKpheQUZ6UZIhHzYtDlciwiLj
	PI7nZ6k740g8sT/nNtZdh8mCOkudDEbZ6KsHaKTUwdGYjxvTgtws/rWra/k97yUv
	XYwoAWu9EZqtUJRicPY9V5cSfZ0ttI/hM0RQfpgywc6d9EqLBvqHXPgOWkS/NSd7
	bcEG7Gkirgewm5aD1mYeFQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 47dv09qv84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 16:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1750721539; bh=UArxGcBCbfF8bZGSgJV221iDT8iWpwLcTg43B8pCbO4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=RQ9pXxt5zkxVPJvTTi8zHOD5L+ndpokiTIoxm+1ZZ0iBthAjKe8Gz6tU4tzfu78Zw
	 G6ogHVHMr7OtzvW4d3swo1kDmzSzwevXWdbPorXu1nXNPP4DBW7gnviAIYitrv5cSo
	 5WfCl1ad03/hfJ02yeCe+OcKOWUjLxZ7meHXt2v90jlR5ZB2hFhZf5wbdMtmDBkcPl
	 GzRUL/uKd6nPeV4xnmHHqkYp0wxQ3OUtL0W5bb9PikwqQiJMbLYx9WZcODGTUochPE
	 uz3Cbayw628x5u8y+fsm276KPUNXZyRusJSusatc0cdwcDy8B+gjzPp2yw/SYJ/v0w
	 NMNgey0RrAn2g==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4E21E40361;
	Mon, 23 Jun 2025 23:32:19 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 02B18A0070;
	Mon, 23 Jun 2025 23:32:18 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=c8GHHyNS;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 12E244054B;
	Mon, 23 Jun 2025 23:32:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gxvbq/3lV+7H8UIv5gwnAVFzDqK2nSCYuH78Zf25v/ZYkicxJsvy97gDchYBIp2aMGScwnTRR6WHJ0KsCjjN6fJDPvhQuW6g0XquRI9DwTDpLa9sbuwGP3/Cdk93BoVfbRVorZvqTbd6uJbgp3OSkTedUtAp7Y7RuN6yL9xGT1HCUC8AXeUu4lxn1EKo2iVbf2fkOuvYAgoonfzvA463KvMHUO6gMcUqsNDnPPG01u/6rtZcq1Dw+jsUiJJyonP0EQOYBlfud8pCn1Y2b/jy5Wljgp2RGhV79Mi0iXMmA3wCqGpCjGmz5jNi0XMGXfkVdUyXcMVlS5FvKZGCOE/3lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UArxGcBCbfF8bZGSgJV221iDT8iWpwLcTg43B8pCbO4=;
 b=B2ez86sfG/1OuhjPFoo7lMk/fkhkCD0aVOmgraeaHxfOFvqqNNm5Er4CwNKB8CS+mjFSyeVseyJ03/kyegpoFDqIsDI9AiJW33hvwuntIfvL2k+2Hj9jwfDf3tkyrSp//KOsHGjuurHjRxCC/OBTwrOG0gHcQ/Ak8jEiNtvGPKriGNcdTUoZA+if6eXpR+lUrCk4yoYU3gu1KVNCE9STSYuFN/lJxQxvoev+lAKgkNY36xeUyOPDWhTW9XJzWch1eOFSz8ZAlT6B18ydQmaL1mCoOVEdaTbtf7zDkZgkoexQhPSQcIvFNc7JxfPIjQEjt0afgUuB0rShgoe2PDcSuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UArxGcBCbfF8bZGSgJV221iDT8iWpwLcTg43B8pCbO4=;
 b=c8GHHyNSRY4Kt0HpYA2IOKTZpGPQfIop7lMmAUKgd8Tec+3icJ2oS538t+D1KVkVcDpfCMKP8Iu+vq4lGWGK3UNOWq4+LLX3HQxAGJc18Ct/tc5pqiAOcYJ4EmgNe+3qPINEIL699FD6BdWYmEjMygG098QWxgyhDQCVI6oJMSY=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA0PR12MB8983.namprd12.prod.outlook.com (2603:10b6:208:490::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 23 Jun
 2025 23:32:14 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 23:32:14 +0000
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
Thread-Index: AQHb2egLqR4/q5MDhUq3kRsaRsZtEbQRekWA
Date: Mon, 23 Jun 2025 23:32:14 +0000
Message-ID: <20250623233211.aeehndz2nxqovepd@synopsys.com>
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091357.2983085-3-krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250610091357.2983085-3-krishna.kurapati@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA0PR12MB8983:EE_
x-ms-office365-filtering-correlation-id: 078a69a9-9a23-43a6-083d-08ddb2ae2f7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dWFQSVo3M0Q1blRwcDRmYUhybFV5NTFrektLSzVkdENnd0FhOUJrRUZwRjhT?=
 =?utf-8?B?NEtjV2x2dC9GTExYeDJpczM3VlZwR1RLendSZ1ExRm5KTGRjUi9CMkl1TWhu?=
 =?utf-8?B?TjhmQzBDRHM4QzFHZWN3MnpWR3YvcWdlVjBvRkp0UkNFOGcrQ0JLMGlSZmF3?=
 =?utf-8?B?MlVMd3p6eTFobkJEZk9XclFtUHY1T3hrSUZRcnNGM2RsRmRKNUNzcjBYV3VD?=
 =?utf-8?B?WnRZckJqK1MzYnBncHowa3FteTVUb1lDaFJTZ2cvRmlkU0RlREttYTBCbFdT?=
 =?utf-8?B?dVRkM2htWTVVZEtpbThBR2pWSmVRMkVLRzhoN25vazJHUE5IMmZLMVhnUHI1?=
 =?utf-8?B?YnlVOTRic1BzQmpCQklGUVg4OEZocFNyRUlEaTJMV2w4Y2ZrUUhLZ3h4b2FU?=
 =?utf-8?B?VENZRkU0d3lKb1BxNjFoQ1ltMjEzZnpkNHdmWDRSTXRIQmpHcG1wR1Z3MVpv?=
 =?utf-8?B?MUd6KzZCUldRVG9meHJNM2NMUURuVTV2NExzbXd1cjBSejRldmM2bTJ0cGRv?=
 =?utf-8?B?dUlsTDFTTE8yb2ppOVlNYkVoRUZuNGxuRVVPOGdWTkNQQnU4eVF4b2xmLy9j?=
 =?utf-8?B?YzFvV0cwL3BkdWNESHlZNTJGS3JFenZxM2ExNnpxaW9SZ25rbDgxSHdqSzZY?=
 =?utf-8?B?eHhhYmE2aHlEM3dXVDdnMjM2VGFuUXJpZ1dPQ0Z5N1dBa2VtNHl3MVZzdnhp?=
 =?utf-8?B?QnZCWVpLQ1ZOWDB0S3JCaVlQSnROLzRTS0lwRy9JZ09qMnJEalNuV2xoY2xT?=
 =?utf-8?B?YlZ3NTVGUG1KRDZQVHoxREtUaE9MemQxeTVnenhkWnVnSkRyenZwK0FoM3JJ?=
 =?utf-8?B?dGhkUEJHelVXaEJsSGhza1lPY1J1WUpIbXVhVUVxSFlnb3JWMFJjeXA5dlVp?=
 =?utf-8?B?NFpna0pMTFNpMmRJN1hCanZ1WTJ5RjBYZGQrTDZCRUZFM2U2WWpJdXpTS1Fv?=
 =?utf-8?B?QndmdDlOWjMwUjRoTmRjbCtWSVhCbjdJYlArV2tKM1E0aVRHQkI3ekZYZ0RU?=
 =?utf-8?B?TnR5UGFoV0NyNDVrSXpXYThqNXBkTnBwMEVoSUpleThkZVJHa0l1OG5xdTM5?=
 =?utf-8?B?TjJXYkpZWm5KSzJuWWJVb0pBRXYxeG00TGxMUjdGVmR1SXFPUGRwYW9jdzRW?=
 =?utf-8?B?YkxlaXJ2TWluamh5NXovcDhneTRqK1B2K0NhMEhMSFRMMlhPRHY0QzFJNSta?=
 =?utf-8?B?Z0l0c2tpOE5TZ08xRGc3K1FnTUVRYkN3YmYvMkJhT2JJVlpBRmpkMXRqaUJP?=
 =?utf-8?B?TzVzamFzV2FIcDRmbnlhY00zRGxQWnJTbU1tNFA2NCtUakVYQ3p6eVN6V1Vo?=
 =?utf-8?B?Z25Yb2U5cjJZZEVUVkNMUXA0VGpGUEVuU3QxZDBHNmhMZEo1STRGK1dzdzYv?=
 =?utf-8?B?d0NBTTZtdUxIWEVKSlhaa1VTUHBlODFwT2p2QkNtTW83SVRkYTJGaWxYS0I1?=
 =?utf-8?B?VU1OWjhoVFc5dzVnWkpkY1h1UlFRK21DY3laZkliK2VoNzJwTGhIblBSZUpw?=
 =?utf-8?B?OE1ibGdTY2VqSlEvWUlUaEZyN3NDQzUwMVRRNVBMMFJLQVJGVWl1TUZmMk9k?=
 =?utf-8?B?QllrSUljcmxQc1Zzd2U5QzVLZHhpUHlEWU8yVE5aRWMveTdNUWhhWEQrNysv?=
 =?utf-8?B?MFQ0dVhJNnJpTU4yMEhFc0NSWmZuUk1wSFhFZWM3YjZOb2ljdk1tWHhHY0Ju?=
 =?utf-8?B?bGFDclI2QUhvc3Y1N05TZmFCNFVuT3k3MkR4WTRpVmkraC9xdU1MT3BLdVhK?=
 =?utf-8?B?S1lzMTdpajA4dE4yZ0ZoYUtJZ0h5dW1iRHFWSTg1Sld2NkVwRFAxdE5yOU81?=
 =?utf-8?B?ZFhha2VNSFY2YU9QcnJ5b0pkeWVqOFJ1NW1PZTVYaEtINkpZUXVWNDBSWFZR?=
 =?utf-8?B?SkFVQjc5Q3M1dUVOckRSZENjSmlMclVyVHhEUGY2T3lYRHp3MUx0WS83OW80?=
 =?utf-8?B?YWVjenpBREJtUThkSXl4WVk2NjNwZ2JQQXQyaWlTNnc4Zk9hUytDb1NISlJp?=
 =?utf-8?Q?k7IqA12kDNvFk5+lAbfHKRsVjcC0v8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Vy9TS2llYi9vRGF2aXF1VUt5cGlOVmdpRkJrUnNiLzd6dGl6N3pWa1VZTVhP?=
 =?utf-8?B?UVlXd2lCdDE5dDJ3Q251amVYdUlKR3VqSDE2RHZnZEhUa0Q2RTE5YjJibjVt?=
 =?utf-8?B?clhnL2tveE4rei9HK2dha3VQVUtkUzgvTjhGWUtMZnQzRE5BaXFacGVuRWl4?=
 =?utf-8?B?S3hIMURaRWM2TlhyQVB4bEk4dW1nOFZxa3hMdWdQQVA0c1dWbUpsdzRDeXNo?=
 =?utf-8?B?cklYV1grVWYrZHZHbGhtQitVZTJlanU2M1JxVVB1aE4zeVZnYXZWMzBLOEJL?=
 =?utf-8?B?T3dOMFZIWDhlVEJwL0h1VExJV05wK2pYUmJ6MDgzZDFJSzMwUk5VQVVWZXFY?=
 =?utf-8?B?Tm9DK0ZjRHZGajAzQnlZNTVJM3VKOTRZMmVuMUZ1eTJYU2ZORVMwV0dlRUFJ?=
 =?utf-8?B?YkNKYVF5NzRlaTgvZDM3cmZnTmFyTFVWaTJFWUt4c2tmU1EySnNtLzVCYi9M?=
 =?utf-8?B?YkVackpmdzdtSHRVYmtOQXVMU29GcXVjL2o3alR1MmpENlF0dUoweUIwUmEw?=
 =?utf-8?B?elpNR0hQUk9uV3VjTzd0dW5aa2tFdGlTckhnUEVwTCs4bndTN3dRR2lBbWZP?=
 =?utf-8?B?MHIxeWJTa1hZczUxNWpZeTJpNEFuRFJvSS9WSEZTU01TZU1TVHFLb3dITktB?=
 =?utf-8?B?RDMxc3dPQTczK1lLMlNOdlZ1RytYUXQyZmduSVZCamlOYUQrTlRIQVB1UmI1?=
 =?utf-8?B?TkpCZU1JMVYzZlhiZk5DNXh4VlBtdXFWK2xCT3Npd1N3Wm5KQ0hSMXA2Z1Zk?=
 =?utf-8?B?UEZBNHJBQTA3QytVdjRNWHc5SE80YlZKMXlnUmE5K2ZyVDErUzBSZXZTaU5l?=
 =?utf-8?B?bzdDNXdKblBmR3BaVUxWOWZwaVc0TFd3T05mM20zSGF6RC9QVmFVVDN2YytZ?=
 =?utf-8?B?NENWbU9ueTFJWFU0NnRHMkxvRURabkhuTEhOd0dmR084clI4VTVGWGQ1b1Q1?=
 =?utf-8?B?Y28rUWJPRjU0OGxxNlNhaE1qR1NiRzFMQ0NOT044MGR3OWRKcjU1TzdWVHZ1?=
 =?utf-8?B?NEdGZFVVSElzMGRFTlF6VHB3aURTYVZmUkNNN2JvekdsaGt3aHhIV3MwYjUw?=
 =?utf-8?B?Q2pOSnBVTTJwcGJLSlRoRE9rY3FiNUQwSjMvYURyQ3Zvd2E1Qm9EYmtwNWFu?=
 =?utf-8?B?Y2wyQVZWenBEUURUbjZxeFFvMlF4TWtwR0kvdE91Q3dQNVJiSEJ3dUJMWWtK?=
 =?utf-8?B?b0JFQUE3MGpDdUxKNE16b2JxbG5JUmFBejY1dkkxeTNwMlNHZDRjYUxOSmpK?=
 =?utf-8?B?RjJzaUxsRHlVcXRUS0dGc2FGZHFiSU9oeTRoRHZmS2l2bW9XUmN4dk5NNUVz?=
 =?utf-8?B?OExNQTMxTU0zblRkdHZadkovaVFwd2lFVmZhRWkvUVZxVSs2c1RidFNEQ1FG?=
 =?utf-8?B?d25LaDRjdEpTbzdETzYxbjJIU0JlZ2U0U2V2RS9ORmJldVl4Skg5WG9oZ3lu?=
 =?utf-8?B?dWRHVFJEcFpxSGIwRmN5akVMbCtKNnZ4QzhPVUpIZHIwaDRlbEdBNXozYW93?=
 =?utf-8?B?STlBNjAwNmJWQmRSRCtETEg0aDlOYnNZd24wU0llZ3V5eUdJTHo3RW92WkVX?=
 =?utf-8?B?SGlnZ1pXMW5mY0htMlBLWFlITEdJYUlubURPdlUxRVhGV1RGVVBkbE1hdk5V?=
 =?utf-8?B?UktDN3d6ZUlFVzhYYUZKOTI0dU1ndkM3dTZ0RVVkOUNEWElON2pFTE5FajNa?=
 =?utf-8?B?akFPRjgzM0NLV2dyQmhpL1d5V0VaQjd2d1pjRktaQlZ3c1FGcXhoRWgxN0di?=
 =?utf-8?B?aUpnVmpqQkFadTZvckV0UmdUT3V1eERWa3dkeUFrMHZNUG5qM3MrRHp0UTk4?=
 =?utf-8?B?dlRvSzJhcFlDR1JuTWdjK1BjMlpQV2hyaStLcUQ2Zko3SkJQSXZWOGRxZkVr?=
 =?utf-8?B?bXk5SmdQRlFqbVVIeGhETHJEcXJQTFRiTTlqRnJLYTdqWmhVeWxQM09YNHFT?=
 =?utf-8?B?cFhKS0pEU3JKc0dzU0dmM2RSQTdOWHcxMkU2ZEsvaEExNHVUVkMxK2YyWWx0?=
 =?utf-8?B?bzA5Y0JUUE9acFpnWHVvOUcxZXlSVFc1bmZSUXUzeDZuenN2YWczRVRKdmla?=
 =?utf-8?B?bFhUR0VaZ2xzMkw2YnhQNFRUalhFbitYVjMyb2pEZEJqQW1WZmtHYTVTQmtD?=
 =?utf-8?Q?zOTcz71bI/1afNJALDfRLccxn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <386F5BBA5E12E246BE41FA48C0DAEF56@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sh6gJI7fqlmU/vLym22w9DpnDpT2GFc1eM7P7iyhf6s1mWkKSjdiPqe8mMlYQERPVrqTFFMMRQ003AMA5eNQJR9PNeXiHOiU8xPIued3a1jXmKIT7MB1f0Dfneh8BRYLsxHNa5Lh5VU7HwjXxyc+Dvn9o1/QwNTk68lFANkZKyz1CLn3oF8u1GjKvFGL1L5PbDHXOWBNX46e26F7tRkGm0eygwDXrRpMOic8v/EiS6O+EihykJTkvjGKCavOGTZs//5FVh42r7dJTnpWAj9lIhp5z54hecAbVC5Vc4Q53LH2/bXqwoYsozted/YOePtm1VMsd6fHpQz+oI4A5rntlAsnP5MHEGocXW57hm/NsCpyi5YUHhrgNFfQWWmopxESA35Ef94FgJNS3jK5q3/OKo80yl3w+OAu+H4O1uqcbvh20JZsMDxqogmAVKUaudI2m51R+GycdshHaCxzwfY8ewufrIN51qjFJD+kgf1Y63FZLV1dilDcd7VNGj3AE/Z5m5+C5GYFt+5vU2YXfwtCKmWmOEDGfCWpp0bhJT9LrCJ2U+ishgHElsofHNJks7uCvbaMHhWckIqlwk+nSc8SmozU1eraXfu+fk+fNrQ2CUoQLmr62eUYe0bJSr87he5QNd7eDX0fL2eOY83Uw96rRg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 078a69a9-9a23-43a6-083d-08ddb2ae2f7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2025 23:32:14.6869
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oFGCFtiRMbkIKvnAOLgS2AsvLhdKvcSS15Gv5K2OSOpY1dfwqANRJcO5l1xfrFv1jjY8Ndc9UgJ+tqE/wWJEmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8983
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDE2MyBTYWx0ZWRfXxT+HHVPxmv4x
 D1d7AbHI58aPTbJlsSA94wq6bKHzwKDkf58VYJQbegeJo2J+hPBdGBzhw39F005wwD0y1RuK+Lf
 kX27IcXtbFfKcdkH5NUyc9RB/AGsEYY71TM4yQ/rnEBAgAOVPq7GBuvuWrrw0WURrtS5C6t+2IF
 4jzMLRg2uM8QuQ2cAQe1fIITBlcNlo5ZK3WUjUiyTw2LXS0vezOj+8v3aWGr4MeyonjaIsIrzPv
 IO4JnYSJ98RKSOvnUl3rDVAX2CvScHpL0vkJtUOlvrZAh4WV+A9ezsv+8PhYRyCS0DnNTJUvd/v
 PbKgE+7D+xEMTkrwONUrYu+hBLAJFBDpNA/PKFrhu/Jb7qrwG4RDJS3jCgSeWTDuYrWmDVaFsyB
 IMPT5BHd5Iys9b4gYRyUSnqnRK+10PVxlcquFz+yw1gnC4A2P0GQXQ9n5Ar/9Jjxz0dq+89D
X-Proofpoint-ORIG-GUID: QWxvsBKa1NB4Ta8bZaXL8BGwHvUVwoVt
X-Proofpoint-GUID: QWxvsBKa1NB4Ta8bZaXL8BGwHvUVwoVt
X-Authority-Analysis: v=2.4 cv=GNUIEvNK c=1 sm=1 tr=0 ts=6859e403 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=qPHU084jO2kA:10 a=EUspDBNiAAAA:8 a=yKdW2BEOS02-6PAENsAA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_08,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 impostorscore=0
 clxscore=1015 mlxlogscore=751 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230163

T24gVHVlLCBKdW4gMTAsIDIwMjUsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+IE9uIFF1YWxj
b21tIERXQzMgZHVhbC1yb2xlIGNvbnRyb2xsZXJzLCB0aGUgY29ubmRvbmUvZGlzY29ubmVjdCBl
dmVudHMgaW4NCj4gZGV2aWNlIG1vZGUgYXJlIGdlbmVyYXRlZCBieSBjb250cm9sbGVyIHdoZW4g
c29mdHdhcmUgd3JpdGVzIHRvIFFTQ1JBVENIDQo+IHJlZ2lzdGVycyBpbiBRdWFsY29tbSBHbHVl
IGxheWVyIHJhdGhlciB0aGFuIHRoZSB2YnVzIGxpbmUgYmVpbmcgcm91dGVkIHRvDQo+IGR3YzMg
Y29yZSBJUCBmb3IgaXQgdG8gcmVjb2duaXplIGFuZCBnZW5lcmF0ZSB0aGVzZSBldmVudHMuDQo+
IA0KPiBVVE1JX09UR19WQlVTX1ZBTElEICBiaXQgb2YgUVNDUkFUQ0hfSFNfUEhZX0NUUkwgcmVn
aXN0ZXIgbmVlZHMgdG8gYmUgc2V0DQo+IHRvIGdlbmVyYXRlIGEgY29ubmVjdGlvbiBkb25lIGV2
ZW50IGFuZCB0byBiZSBjbGVhcmVkIGZvciB0aGUgY29udHJvbGxlciB0bw0KPiBnZW5lcmF0ZSBh
IGRpc2Nvbm5lY3QgZXZlbnQgZHVyaW5nIGNhYmxlIHJlbW92YWwuIFdoZW4gdGhlIGRpc2Nvbm5l
Y3QgaXMNCj4gbm90IGdlbmVyYXRlZCB1cG9uIGNhYmxlIHJlbW92YWwsIHRoZSAiY29ubmVjdGVk
IiBmbGFnIG9mIGR3YzMgaXMgbGVmdA0KPiBtYXJrZWQgYXMgInRydWUiIGFuZCBpdCBibG9ja3Mg
c3VzcGVuZCByb3V0aW5lcyBhbmQgZm9yIHRoYXQgdG8gaGFwcGVuIHVwb24NCj4gY2FibGUgcmVt
b3ZhbCwgdGhlIGNhYmxlIGRpc2Nvbm5lY3Qgbm90aWZpY2F0aW9uIGNvbWluZyBpbiB2aWEgc2V0
X3JvbGUNCj4gY2FsbCBuZWVkIHRvIGJlIHByb3ZpZGVkIHRvIHRoZSBRdWFsY29tbSBnbHVlIGxh
eWVyIGFzIHdlbGwuDQo+IA0KPiBDdXJyZW50bHksIHRoZSB3YXkgRFdDMyBjb3JlIGFuZCBRdWFs
Y29tbSBsZWdhY3kgZ2x1ZSBkcml2ZXIgYXJlIGRlc2lnbmVkLA0KPiB0aGVyZSBpcyBubyBtZWNo
YW5pc20gdGhyb3VnaCB3aGljaCB0aGUgRFdDMyBjb3JlIGNhbiBub3RpZnkgdGhlIFF1YWxjb21t
DQo+IGdsdWUgbGF5ZXIgb2YgYW55IHJvbGUgY2hhbmdlcyB3aGljaCBpdCByZWNlaXZlcyB2aWEg
cm9sZSBzd2l0Y2guIFRvDQo+IHJlZ2lzdGVyIHRoZXNlIGdsdWUgY2FsbGJhY2tzIGF0IHByb2Jl
IHRpbWUsIGZvciBlbmFibGluZyBjb3JlIHRvIG5vdGlmeQ0KPiBnbHVlIGxheWVyLCB0aGUgbGVn
YWN5IFF1YWxjb21tIGRyaXZlciBoYXMgbm8gd2F5IHRvIGZpbmQgb3V0IHdoZW4gdGhlDQo+IGNo
aWxkIGRyaXZlciBwcm9iZSB3YXMgc3VjY2Vzc2Z1bCBzaW5jZSBpdCBkb2VzIG5vdCBjaGVjayBm
b3IgdGhlIHNhbWUNCj4gZHVyaW5nIG9mX3BsYXRmb3JtX3BvcHVsYXRlLg0KPiANCj4gSGVuY2Ug
aW1wbGVtZW50IHRoZSBmb2xsb3dpbmcgZ2x1ZSBjYWxsYmFja3MgZm9yIGZsYXR0ZW5lZCBRdWFs
Y29tbSBnbHVlDQo+IGRyaXZlcjoNCj4gDQo+IDEuIHNldF9yb2xlOiBUbyBwYXNzIHJvbGUgc3dp
dGNoaW5nIGluZm9ybWF0aW9uIGZyb20gZHJkIGxheWVyIHRvIGdsdWUuDQo+IFRoaXMgaW5mb3Jt
YXRpb24gaXMgbmVlZGVkIHRvIGlkZW50aWZ5IE5PTkUvREVWSUNFIG1vZGUgc3dpdGNoIGFuZCBt
b2RpZnkNCj4gUVNDUkFUQ0ggdG8gZ2VuZXJhdGUgY29ubmVjdC1kb25lIGV2ZW50IG9uIGRldmlj
ZSBtb2RlIGVudHJ5IGFuZCBkaXNjb25uZWN0DQo+IGV2ZW50IG9uIGNhYmxlIHJlbW92YWwgaW4g
ZGV2aWNlIG1vZGUuDQo+IA0KPiAyLiBydW5fc3RvcDogV2hlbiBib290aW5nIHVwIGluIGRldmlj
ZSBtb2RlLCBpZiBhdXRvdXNwZW5kIGlzIGVuYWJsZWQgYW5kDQo+IHVzZXJzcGFjZSBkb2Vzbid0
IHdyaXRlIFVEQyBvbiBib290LCBjb250cm9sbGVyIGVudGVycyBhdXRvc3VzcGVuZC4gQWZ0ZXIN
Cj4gdGhpcywgaWYgdGhlIHVzZXJzcGFjZSB3cml0ZXMgdG8gVURDIGluIHRoZSBmdXR1cmUsIHJ1
bl9zdG9wIG5vdGlmaWVyIGlzDQo+IHJlcXVpcmVkIHRvIGVuYWJsZSBVVE1JX09UR19WQlVTX1ZB
TElEIG9mIFFTQ1JBVENIIHNvIHRoYXQgY29ubmVjdCBkb25lDQo+IGV2ZW50IGlzIGdlbmVyYXRl
ZCBhZnRlciBydW5fc3RvcCgxKSBpcyBkb25lIHRvIGZpbmlzaCBlbnVtZXJhdGlvbi4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEtyaXNobmEgS3VyYXBhdGkgPGtyaXNobmEua3VyYXBhdGlAb3NzLnF1
YWxjb21tLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jIHwgODIg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwg
NzMgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYw0K
PiBpbmRleCBjYTdlMWMwMjc3M2EuLmQ0MGI1MmUyYmEwMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy91c2IvZHdjMy9kd2MzLXFjb20uYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNv
bS5jDQo+IEBAIC04OSw2ICs4OSwxMiBAQCBzdHJ1Y3QgZHdjM19xY29tIHsNCj4gIAlib29sCQkJ
cG1fc3VzcGVuZGVkOw0KPiAgCXN0cnVjdCBpY2NfcGF0aAkJKmljY19wYXRoX2RkcjsNCj4gIAlz
dHJ1Y3QgaWNjX3BhdGgJCSppY2NfcGF0aF9hcHBzOw0KPiArDQo+ICsJLyoNCj4gKwkgKiBDdXJy
ZW50IHJvbGUgY2hhbmdlcyB2aWEgdXNiX3JvbGVfc3dpdGNoX3NldF9yb2xlIGNhbGxiYWNrIHBy
b3RlY3RlZA0KPiArCSAqIGludGVybmFsbHkgYnkgbXV0ZXggbG9jay4NCj4gKwkgKi8NCj4gKwll
bnVtIHVzYl9yb2xlCQljdXJyZW50X3JvbGU7DQoNCkNhbiB3ZSBqdXN0IHRyYWNrIHRoZSBjdXJy
ZW50IHJvbGUgdGhyb3VnaCBkd2MzIGNvcmUgaW5zdGVhZCBvZiBhbg0KYWRkaXRpb24gZmllbGQg
aW4gdGhlIGdsdWU/DQoNCkJSLA0KVGhpbmgNCg0KPiAgfTsNCj4gIA==

