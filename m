Return-Path: <linux-arm-msm+bounces-29700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA986961BDA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 04:09:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF67F1C23134
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 02:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C726853376;
	Wed, 28 Aug 2024 02:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RSyAYnBm";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MffX/3Zv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MjI7hJYr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5ABA61FD8;
	Wed, 28 Aug 2024 02:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724810950; cv=fail; b=GeK/8tcJ2y7qEVTP8p5R6kbEEhm9bsr6BcZI9pooNpv4NILAtQI9u5W2UQDmOD3DxzglpH5GzQwTc9xX+xGIvbP5fr8OssJGT9PhUHs5f06jjdRdLyggY8V1u8u1ReTXFf8bC4A2mN5QAA673cniSsx2J6DvWx1bUvC0V2Hwxm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724810950; c=relaxed/simple;
	bh=PzeXSRKykdpINpHD+Za8pYMMBgK4ZIG/USlw+4CUoqk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qLyUNMfvUxiJMWhKrsAny4G4MrjldUpj5GWCTpruanumkoMDlwskf3R/T4bM437Rp9F1rug1Qiu3ntgaOU0cY87I6L+YDdOqi8SOzYIxHCNXf/YaiJlfrLTO65eyH92Xvk9jtU9bzzyrGLUfy3z3U/qgi/vXcAtib/nWoAv4kqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=RSyAYnBm; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=MffX/3Zv; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=MjI7hJYr reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RLhfrC013729;
	Tue, 27 Aug 2024 19:08:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=PzeXSRKykdpINpHD+Za8pYMMBgK4ZIG/USlw+4CUoqk=; b=
	RSyAYnBmcBsxpgVg8kcDI+gVt44WEs/N8cM4jL0hB1EiLP7SmojL56L8tBlAKofS
	LV2c2x1e4D5bcEaouJeuw5nG2cBfrTEv7elBCsE/l+VrfAoNP6s7fm8mSEqp6/sV
	75NEaoIcdO7q/BpGw/x0q68xUqwFGfMQGlMMKDfQXdtodXUvIBMgUNHh5+S11XAj
	dKYkJLtRek6lOmDpZSKaZp9QzpBqX2CC2YKp0Z3LWzpsdCQ7BcSvGT1Ls78FHYDz
	AJafht4wbqWTR4oJx/QwZewI6aBmEpWjSZ8DUtWStOL19G5VFf6K0GfgH13gpD2H
	cdWapv2jucTELqgshSwj8A==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 419py70x50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 19:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1724810916; bh=PzeXSRKykdpINpHD+Za8pYMMBgK4ZIG/USlw+4CUoqk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=MffX/3ZvynhFxydO0kUGoZKiSsRWdROkQzr3Qf72xJspoxwG2K+XfjSP5iKKfz//2
	 47psiv6i7zZynG8Ch3b3Vr2dodcibxUQ0byqwaSnhCRwDelaB4ptADWRAjfMsQze2f
	 /KMWAiMWVpCekW9JbN+1mfAeyMu3QlKin4ElrHU5qRvjW9G7bKnzR1nrThHHUBk+uU
	 UvyEqKWmN1q1rYkqGUuNoClmPBvBUeWd2bZCaFS7zYzxpakkMoo7wWIcrGfi0kw5h+
	 S4CRpZ4r1NcplVyTR+IOodHgtbJcazmC7oaz+X5BQVsr4LQDmVDvPwGCSKKk/FgnBD
	 jbr4ZA9cWtHaA==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5735E40175;
	Wed, 28 Aug 2024 02:08:34 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 50DD5A007C;
	Wed, 28 Aug 2024 02:08:33 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=MjI7hJYr;
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A6D6540361;
	Wed, 28 Aug 2024 02:08:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=owtI8FAV4vEEN/8HPHzt9pwGIxMxb+EaF1+vRdTAFo3rPu0j4X5luKI+xbtI4Np79ASbIh5h9GD3sjOLfVtWYgkwI1m9t0U2y/2ZLJxuRwzMAXfY4wLkwl+8XS/u6WpVJpcKMSmMOz5TbwJSEdolPnoDnNdqHPcLR0AIZ1qMVpdOQkl2l96nc1A0x9vEClSma2RIpbEMM6gY6WHTLkXTpQn6gmLOHKbqMGgG1ZCHCHxdlzEsBT7P5Yt8swEnB51uhIyuLuN0gJ8zQPXlDPKitKglO8p1c1G5c6H5jyhI5gswsNmnQUGIGRRvfvifS9wMgBzyY0lS1AVJ77Q0Psocvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzeXSRKykdpINpHD+Za8pYMMBgK4ZIG/USlw+4CUoqk=;
 b=sngdFX1lYv96KysmmLiXGbqt0ac49St5xWiwdfPrJsUWQ0EroUu2Z0vgT91q+nH22HP2/rfd9iEyCGHufZTLmRt9Efqsj0NXB8We7qlg7/64cTU81KZFXdS4zCzsoHciqJfLz1/QWdue3rCAFBercVxK6ZgxerRk+xyjYwFsDIUJbYagwdSI7vwU8ECXPbGlTkEWNZuGZTGBma1CUHOZbkFepgd4M7sY55RUgryiXe2eUzYLK6gmykCM0jR+jUO307AhCe2GpD9OWUwdY7lLYgG1tg3/AZ/3n7dwC/H1Zm1EAe5a+6NFdRNyC1EwwnGyHtpoGUdr3q9d59OyjjDJGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzeXSRKykdpINpHD+Za8pYMMBgK4ZIG/USlw+4CUoqk=;
 b=MjI7hJYrbAcnIz8RAJ99UvZdFvuvzAHcFK9Htz30Olc2F1BNekOy3OOeAtDxEJV4VvUxyo3FRMe1tJxQOiWByz8eFuKVw2/MqTsE4Txi68kJ8V84xlXh/w4oiNqUTG1eX4RYyij2Fmo9nQ68TyEJ3Ufa8DnYTc61JFSa4JUrEgM=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH8PR12MB6820.namprd12.prod.outlook.com (2603:10b6:510:1cb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 28 Aug
 2024 02:08:26 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 02:08:26 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
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
Thread-Index: AQHa7jXDHduLG5TQ00KMcUORIuy3G7I6bRyAgAB/wQCAARUJgA==
Date: Wed, 28 Aug 2024 02:08:26 +0000
Message-ID: <20240828020823.synkd3725y4khim6@synopsys.com>
References:
 <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
 <20240827015935.bzv6nevcd7ec2uu2@synopsys.com>
 <c9f11ee1-382b-4742-b558-c2b0801d8669@linaro.org>
In-Reply-To: <c9f11ee1-382b-4742-b558-c2b0801d8669@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH8PR12MB6820:EE_
x-ms-office365-filtering-correlation-id: fa6cd6c0-ca3c-4c5f-6951-08dcc7064dae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bkpVVXJVMHBiNGFINHJEWFpCTnFNMTY2UjJ6RCtrK1poWGpKeTBCNFd2MUZN?=
 =?utf-8?B?VzVSemNkYkQxT2RqZVRManNLd2M1REdRWmF5S3k4bEk2U2RramthMFB3azUz?=
 =?utf-8?B?cmZTT0pWd2NxZ1VvRUdSa0pSUzFEeDNVVHJlZDRYcHBaQmZiTFFyUnhzSzhr?=
 =?utf-8?B?V3ZWZVBMM3dBamFxUlQvbGpuT2Nsb1dDbUJHS3UxSTZqN0RoVSs2TDB0TjV3?=
 =?utf-8?B?aFdRY3VQTnBIZGV6WHREQ3VzL1hmTXJFenlkelR6dDFTNzFGbldRK05uQmlZ?=
 =?utf-8?B?NHVqVkZPOGJTbmx4UElObUJJcVNqdHVTYUsvSU9jUkh0SW5QcE5YYUE2TWEz?=
 =?utf-8?B?bU0zbkxYaWRLWU9lZ3NidGt6SzcrbVFXaTNJRmtlSXF4VzRxVEI2ajVYV1cz?=
 =?utf-8?B?RVNLa1E2OWUwU2llbmhBb0YzWVVFOEExWG1wdWU2eE4vRUMvVlp0TW15SSsz?=
 =?utf-8?B?VFdKL3l6MUF6bTY3OURJaUVCeG81VngrQmV3Q1VuaURKWWllTDFsOXorN25P?=
 =?utf-8?B?THQweXYwVFpWbmxIQmppNGlYMXpPWE8rOVY1cVAvR2pVNGs4bmhaSDUyVmMz?=
 =?utf-8?B?ajY0NU5rRWVBNGtJNllkcjcySzBRZ3R0K1NDMS9xR0k0a1RUQ21pNUNxS1Rw?=
 =?utf-8?B?a0xpSkcrVEVpYVRweHJJUHFURk1TZ1FKYkN5eWE0ZzY0cGlHbk4zcjIyTnlK?=
 =?utf-8?B?TWcvRUVMUGJNd2J0R05RWFFOdjBiVEpXMHliV240R1p2MHBDY2N4OXlsb0RU?=
 =?utf-8?B?Nk9LMUllbVlWOEVBMytvRmxqRW10R3dqS0owUjFpaXpRc0RaclV3ZThzWUhV?=
 =?utf-8?B?b1o1Vk1VbVhVM2ErSHk1cWVVN0kxV3ovVk1SYzZYZnFKSXRreFVHNDZkZk9t?=
 =?utf-8?B?R2J0ZGg3VTVkeVR0SE9ocCtQQWp4Q1lKMmNOdnYvMEZmbE1BT3pNR0xXR3pB?=
 =?utf-8?B?NWFrZVdxREthc1lLSnJuNUZ4VXZabjl2V3pMZ2tpaDdIYlcwWGh2SEVWMVN1?=
 =?utf-8?B?Um1oYm90MSttSDBCdys0QmpIcTVOQWdYMVA3emlQZko2TVJzcHM1SHBoRTBp?=
 =?utf-8?B?VEkwY0dXSTFvU0RubHVUM0dxYStNMGlkVXpMWEhicmVCcWdjRGFnSlYycTZ0?=
 =?utf-8?B?TnRFNUliTFhleWsvSHRnQ0xOU3hBOUswY25nOFBHTVN2T25JR1gybFRmZDdV?=
 =?utf-8?B?dzZRWmJ0dHE5MVUyUkw1ajgyV05zZGE5TjJjSlNzbzFWUW12em5yWU1lRVRp?=
 =?utf-8?B?UW1vWWJwV3JOVitWYXhzU0RSNWhpRWEwNkk5WE50OXV5M2NiVDZSMXl2Mncy?=
 =?utf-8?B?YVhVVWs5a0lhdzRpcnVBWnBZeFpZeXJGelZHWDNqbDRDdHNJTUg0R2tkRHZH?=
 =?utf-8?B?MXlPT2h4Z0hkSjhSeFdESFNZeGo2OFRpbzIwdEdSOGhZM2VLVmo5d09oNDQv?=
 =?utf-8?B?WlBpclhrTjBXZUxyeWxBQUlZN2NSQjVyWXExOVJlZjhJL1h1V1F2aWttUjli?=
 =?utf-8?B?ZEYxWFZDeVlneXdrWlFIQTN6VFZrYWQ1M3VpemFtMXhHK1Fkc29oaFBhd0lG?=
 =?utf-8?B?YUhhaDh3TXI3aStMUHlaYzMwalZDUndtTDlyb0pDNW9IbTlqcnlWWG1vMkwv?=
 =?utf-8?B?aVVmcEJVVnFYYkZYZi9RbDd2MzJBQmpuaCt4T241clk3Z2kxeWoyRlhxSjB1?=
 =?utf-8?B?Q0ZKNTJyNUZ3ZUMyYTRjUGdTOUV0djdJMkt3VGpNdXBMRDBRcktzWGFQV2hI?=
 =?utf-8?B?ZXNrQ083dElkODVnelBQWWJ4a1hKSjI2QTVWTEpzV2ErS2k2Z3NjZlNkRXIz?=
 =?utf-8?B?Skx0MEIyZkhZeCsxNG5wVllPbkxxcVhoTUFVaE1rUHRZNWNIaTYzbjI2dTNM?=
 =?utf-8?B?U21IeUo4aHRPdkNnN2tYdHd2UG9za004dFdnNlgzeVRld2c9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RFlpNzdLWi9xbGVFZ1JVYW1DQTkwdGhndGNYeHE5bXJnNmlZZUFmYWZZTnZ5?=
 =?utf-8?B?QlBQMWY1dTdOODg4UGlNanhTdXZJdzJWQWYwelVqY2Ztd1huKzVObFM3aXVR?=
 =?utf-8?B?bTdEOHhJbk1rd0srQWxqMTJ6Y1IwWDBFOFhNQ1FaUE03QWJMVHF6aEVRRVNX?=
 =?utf-8?B?dGNDWEpPK3pFOE54RWZybWVWQ2hxYkJVclhraDN5QlFiWldxY0ViUWk0RHM0?=
 =?utf-8?B?cG8vZnZZM3g4NWJQdVlhZnpiMTJSdHNxc3NLb2VxUEE3UmsyaklZMzhZNWhG?=
 =?utf-8?B?UEZWQ21qSEZGcGM5emc0aU5mRVM5czBTV2hoQXNvcmUrc2g2TFRjYzM5YVBx?=
 =?utf-8?B?aEVKaE1hZTMvdHRya2I0RTBiUUxKNjIwbVArWjNDRGtlL3pmamkwV25uVHU1?=
 =?utf-8?B?VUVBMFJzMGZMRzlNOHpXdVk3UlVnUWJoMXRrcU1ucUs0SmpKNVk5UVl5VGRM?=
 =?utf-8?B?Mk96L0Z5bjRUbzNoYmxqL0IyNkhjS29vL09LclQ2c3dBYXJJMUl6VUhnczNx?=
 =?utf-8?B?SVdOdE5IZGlNZVdONHpMMkFaWkFWN1BYR1VxZ1dNYjVTSzlmUnlmM1NoaEhw?=
 =?utf-8?B?S0RIQm9WS3V5VlJQRWtWRkltVVJEaVdidmx1KzJrZTczWjRvQ2FzeW5PRVRk?=
 =?utf-8?B?NzZpd0JMVzJvOC9WeEdmcjRqNEYva09ZRnlBODd2eFFBb083cGdOMHphWFZF?=
 =?utf-8?B?bVpHZ3d5dENpeXNEV3BxbWpsRmtYV0k3Q0lySEJnbGI3WlVVOWNkRGxTYVEx?=
 =?utf-8?B?NGR3YmtwbU9TdmpWVFovWkM5ZEd4WjRTVGgzMC9LMEQyV2JqVk1VNGFCN1Zz?=
 =?utf-8?B?N2dCMEhEN1F5QnFJOU1MajRkamNiRU1PQnpEWGNBT3BhdXl1Vlkzb3l3ajkx?=
 =?utf-8?B?aXJrUXNWUFgwRGVZQXM3dTRpYWR3ekVpb1VvdndidHBCNkV6SlZhVExOa1Zj?=
 =?utf-8?B?eHJwanE0M1Vab3VoM3JlVXNEWk9aYVdrUGhWRzRaL20xYzMxcjl2cGlFRmxh?=
 =?utf-8?B?bGk5aDlGbGJSQUJ1Sk8wVVVrMnRWMWpRR1Z6QXczdERTYW1jVit1QTVFUG91?=
 =?utf-8?B?Q2k2RHFEc0RvOXNzQnoxdUVQaUx0YzFVSHdYQ3ZqVEV6QnNRaXozbHBkVjNi?=
 =?utf-8?B?NndoZmtocGpoZWNEbzFHNk5mc09sQiswZ09MUEZnTEJSZmZDQjZGelkxb2cz?=
 =?utf-8?B?Z3RDSk5DR216TzhsTjhLMFNXK3pDTnpKSDduYkI2RlFSMWxPYmxQeCs0NmRv?=
 =?utf-8?B?RWNwWlZ6U3JiamFPTGZPYWdMSWU1VFNNb2F4dS9DS0FTTzJjMEd0bzBZWHpq?=
 =?utf-8?B?QTgvRE1xQzNKWDNRUnE1WVBiV014dnNOUzVqS0tIVWZuYmxaRzl5U0ptZXIv?=
 =?utf-8?B?RElFQ1FVUzFjRkNaYWV2bVVEUUI0MWNzWFBOTFplNzRBZlZHaDZXVFRhY2pE?=
 =?utf-8?B?ZFd4d1NkUythckQ0MlpBUE8rUVlLbW9sdm4zWXdiS2pyYTl3MG9QbWhzUmF3?=
 =?utf-8?B?OUNtYnJhbGNRV1h1ZENIUy9ad3gzdTFjWUxXVFV4SzZ1THp2OHdJRkR0Q3JS?=
 =?utf-8?B?MDE1OWc0Z0l2V1dBQXhnK1dMcHFIbkZ2dWJoVVFhT1FPRU9UNytwYTQ0R3VE?=
 =?utf-8?B?cG1qNFBObDl3NFgzUHpLd2JIZUFPQ1hLcG1LdjI1NDZmZHgwd0JaeFlGRzNy?=
 =?utf-8?B?Qk1PM1ZVenhwMXprUjhWREFXd2M1Y21oVXBTK3l1OXMrWGFUYTlnUEUrL3kz?=
 =?utf-8?B?RW1oaHdCK25yMW13ZWx1MmMzSzBlTEJvT3FmbEpjNTBVaUp2ZmRacUd6T0NX?=
 =?utf-8?B?eitVb1phaFk1M0s0MXN1SDlBZjVVNUM0ZHAzblN1TnoxcXZzU3JSbWs2MEN6?=
 =?utf-8?B?ckJUbk4zcWp5TVBTcTVrbWRpb3dMaVRWeEhneHhkeFNMS21iMnA3SVZGQ1hw?=
 =?utf-8?B?bk93OURyemx4ZnkrelJTNTlZc3ZEVFREU1NUcFdWa2hrLzJJbUtPNy8vODF0?=
 =?utf-8?B?LzEzbEhITnVQWDlzSCtPWUtTS0ZZcXVyU2UxY2gzVmhUd3FJcThrSGZYaW9V?=
 =?utf-8?B?bGtCaVNMUUJyc2lPbFJudXZTWnhFVUNCK05VQ1BVZTVqWjZpaUluSnJ0MzZl?=
 =?utf-8?B?bVc0VjQ0YnowUU9PYlkyVnpTNjl5dkxJVnJKU3NwSUE4QVV6RHdPYmFTZ1pr?=
 =?utf-8?B?VkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <30B97618A65C074F83DEF01A7DC06FE2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	y1ch3fjDQGzUdu4w6HHmjk6RJch7jP+iWCzVqbMADjOfixbgVJ0HN4Nr7A02aiSw9zsFbXAoi+SiHXCZpLA8qbsjhFYxmNnhNmIlCQnyxT1qGFLx7HiVh0rPP7hUoZhv3PjhJ3R+UXwGAc+w0LXTjxzBIXRkBQG9QU7cepcid2k98DwpIUbbu2lzUQtoWxuqiTCFhJ8Opn9+Zg1oF17eEIRA2XLBncEakpfq0d9AGeBNqVH/ow2Lxn5AcH5nA8cwgUvzw5yCrCp9dG//pqK+5tbh6x80rqecrEVs9f+FsvZvvWrGYVSCO6lqPwTLE/lDN/zxKAeIBxd/Ck2K7XCSYUDK9nVKtDt2wxm3odamKAX6afuqjEn8EOKcASsMbHgyWx5Qh7lhuB0Karpy/dT4Tew1LT5eo4utJbA5J/QzUdf/wdNCxaYXtL4muZq8uegmXDQyhOFa/CgbWPCGxK0iMSGFbnWd08yMAjtDad2siqVEROtfCakXHsj5z0sv2PRRDuABWWk2bpDT/TGFzRkd7igZhAW12wY2jmQOUil00LOUZlaMjDu6E0P4hpbmU3PiWZEsao9p0Ez8rtrBJbyIHR2ZVrziYXdLX04DDSKWyte8X2P5FpEBYmW8Gn7IuRsytKcCcYL/24nlfhxw8B64sQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6cd6c0-ca3c-4c5f-6951-08dcc7064dae
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2024 02:08:26.6528
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jG5J5afG012lLYCJzjR2n3LgoUPgK+hOnHevoPpO/hHcUqNbzEpW4FXFIM2nfvGz/r4/wH5OwYpXcpnXrZrWLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6820
X-Proofpoint-GUID: rJpxLvTf0GfNAlmnplBc5nTxdCU_boV_
X-Authority-Analysis: v=2.4 cv=QqQM3kyd c=1 sm=1 tr=0 ts=66ce86a5 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yoJbH4e0A30A:10 a=nEwiWwFL_bsA:10
 a=qPHU084jO2kA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=Wr5bkmya7MId_aF8p24A:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: rJpxLvTf0GfNAlmnplBc5nTxdCU_boV_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_01,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 suspectscore=0 mlxlogscore=288 mlxscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408280014

T24gVHVlLCBBdWcgMjcsIDIwMjQsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IE9uIDI3
LzA4LzIwMjQgMDM6NTksIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBIaSBLcnp5c3p0b2YsDQo+
ID4gDQo+ID4gT24gV2VkLCBBdWcgMTQsIDIwMjQsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6
DQo+ID4+IEhpLA0KPiA+Pg0KPiA+PiBUaGUgZmlyc3QgU1QgcGF0Y2ggZGVwZW5kcyBvbiBteSBm
aXg6DQo+ID4+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyNDA4MTQwOTM5NTcuMzc5NDAtMi1rcnp5c3p0b2Yua296bG93c2tpQGxpbmFy
by5vcmcvX187ISFBNEYyUjlHX3BnIWVGenQ1NHBZU0VsOHdydnJIN3lRU3dGUnpib2puUlN5ZWxu
WWp4bFk4UlphVTZvWkNWZXVpMmYtREhRMGJrOEZkeTZndkpvU1dMZUFQejJ3XzNGOW93bk9GTEdV
b3lIZCQgDQo+ID4+DQo+ID4+IFNlcmllcyBtYWtlcyBzb21lIGNvZGUgc2ltcGxpZmljYXRpb25z
IGFuZCBjbGVhbnVwcy4NCj4gPj4NCj4gPj4gQmVzdCByZWdhcmRzLA0KPiA+PiBLcnp5c3p0b2YN
Cj4gPj4NCj4gPj4gLS0tDQo+ID4+IEtyenlzenRvZiBLb3psb3dza2kgKDExKToNCj4gPj4gICAg
ICAgdXNiOiBkd2MzOiBzdDogdXNlIHNjb3BlZCBkZXZpY2Ugbm9kZSBoYW5kbGluZyB0byBzaW1w
bGlmeSBlcnJvciBwYXRocw0KPiA+PiAgICAgICB1c2I6IGR3YzM6IHN0OiBzaW1wbGlmeSB3aXRo
IGRldl9lcnJfcHJvYmUNCj4gPj4gICAgICAgdXNiOiBkd2MzOiBzdDogc2ltcGxpZnkgcGRldi0+
ZGV2IHVzYWdlDQo+ID4+ICAgICAgIHVzYjogZHdjMzogaW14OG1wOiBzaW1wbGlmeSB3aXRoIGRl
dm1fY2xrX2dldF9lbmFibGVkDQo+ID4+ICAgICAgIHVzYjogZHdjMzogaW14OG1wOiBzaW1wbGlm
eSB3aXRoIGRldl9lcnJfcHJvYmUNCj4gPj4gICAgICAgdXNiOiBkd2MzOiBpbXg4bXA6IHVzZSBz
Y29wZWQgZGV2aWNlIG5vZGUgaGFuZGxpbmcgdG8gc2ltcGxpZnkgZXJyb3IgcGF0aHMNCj4gPj4g
ICAgICAgdXNiOiBkd2MzOiBxY29tOiB1c2Ugc2NvcGVkIGRldmljZSBub2RlIGhhbmRsaW5nIHRv
IHNpbXBsaWZ5IGVycm9yIHBhdGhzDQo+ID4+ICAgICAgIHVzYjogZHdjMzogcWNvbTogc2ltcGxp
Znkgd2l0aCBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UNCj4gPj4gICAgICAgdXNiOiBk
d2MzOiBydGs6IHVzZSBzY29wZWQgZGV2aWNlIG5vZGUgaGFuZGxpbmcgdG8gc2ltcGxpZnkgZXJy
b3IgcGF0aHMNCj4gPj4gICAgICAgdXNiOiBkd2MzOiBydGs6IHJldHVybiBkaXJlY3RseSBhbmQg
c2ltcGxpZnkgd2l0aCBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UNCj4gPj4gICAgICAg
dXNiOiBkd2MzOiB4aWxpbng6IHNpbXBsaWZ5IHdpdGggZGV2X2Vycl9wcm9iZQ0KPiA+Pg0KPiA+
PiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLWlteDhtcC5jIHwgNjYgKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNv
bS5jICAgfCAxNiArKysrLS0tLS0tDQo+ID4+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtcnRrLmMg
ICAgfCA1MiArKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPj4gIGRyaXZlcnMv
dXNiL2R3YzMvZHdjMy1zdC5jICAgICB8IDM4ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLQ0KPiA+
PiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jIHwgIDcgKystLS0NCj4gPj4gIDUgZmls
ZXMgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygrKSwgMTIxIGRlbGV0aW9ucygtKQ0KPiA+PiAtLS0N
Cj4gPj4gYmFzZS1jb21taXQ6IDY0YjQyOWVhZjIxYmU4ODhjYzgzZTkwMTNlMjU4OTdkNWZiMDNh
NzUNCj4gPj4gY2hhbmdlLWlkOiAyMDI0MDgxNC1iNC1jbGVhbnVwLWgtb2Ytbm9kZS1wdXQtdXNi
LTkzZmFkZmM3N2QzMw0KPiA+Pg0KPiA+PiBCZXN0IHJlZ2FyZHMsDQo+ID4+IC0tIA0KPiA+PiBL
cnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+ID4+
DQo+ID4gDQo+ID4gVGhhbmtzIGZvciB0aGUgY2xlYW51cCENCj4gPiANCj4gPiBJIHdpc2ggdGhl
IG1peGVkIGRlY2xhcmF0aW9ucyBpbiBiZXR3ZWVuIHN0YXRlbWVudHMgZm9yIHNvbWUgb2YgdGhl
DQo+ID4gc2NvcGVkIGRldmljZSBub2RlIGhhbmRsaW5nIGNhbiBiZSBjaGFuZ2VkLiBCdWdzIG1l
IGEgbGl0dGxlIHdpdGggaG93DQo+ID4gSSdtIHVzZWQgdG8gcGFyc2UgdGhlIG9sZCBzdGFuZGFy
ZCB3aXRoIG15IGV5ZXMsIGJ1dCBpdCdzIG5vdCBhIGJpZw0KPiA+IGlzc3VlLg0KPiANCj4gTWF5
YmUgdGhpcyB3aWxsIGJlIGhlbHBmdWw6DQo+IA0KPiANCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNv
bS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9DQUhrLT13aWNmdldQdVJWREc1UjFt
WlN4RDhYZz0tMG5MT2lIYXkyVF9VSjB5RFg0MmdAbWFpbC5nbWFpbC5jb20vX187ISFBNEYyUjlH
X3BnIVl2V1F5YUgzRzAwRHJsbjkxXzByMXQtVXozcmJ0dXJqSE1RWkNDSVR3QzZmcEJoM0NfUFph
Uk94bXFic1pEaUdSQ2RkdzJRbzhadUFLUWFhZFdCa3lON05vdzBFTzc4eiQgDQo+IA0KPiBodHRw
czovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0NBSGst
PXdnUkhpVjVWU3h0ZlhBNFM2YUxVbWNRWUV1QjY3dTNCSlBKUHR1RVNzMUp5QUBtYWlsLmdtYWls
LmNvbS9fXzshIUE0RjJSOUdfcGchWXZXUXlhSDNHMDBEcmxuOTFfMHIxdC1VejNyYnR1cmpITVFa
Q0NJVHdDNmZwQmgzQ19QWmFST3htcWJzWkRpR1JDZGR3MlFvOFp1QUtRYWFkV0JreU43Tm81UTVO
T3FvJCANCj4gDQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvQ0FIay09d2h2T0dMM2FOaHRwczBZa3NHdHp2YW9iX2J2WnBiYVRjVkVxR3dO
TXhCNnhnQG1haWwuZ21haWwuY29tL19fOyEhQTRGMlI5R19wZyFZdldReWFIM0cwMERybG45MV8w
cjF0LVV6M3JidHVyakhNUVpDQ0lUd0M2ZnBCaDNDX1BaYVJPeG1xYnNaRGlHUkNkZHcyUW84WnVB
S1FhYWRXQmt5TjdOb3pNZ3NvX2UkIA0KPiANCj4gYW5kIGZpbmFsbHkgaXQgd2lsbCByZWFjaCBk
b2N1bWVudGF0aW9uIChhbHRob3VnaCBpdCBmb2N1c2VzIG9uDQo+IHVud2luZGluZyBwcm9jZXNz
IHRvIGJlIHNwZWNpZmljIC0gIldoZW4gdGhlIHVud2luZCBvcmRlciAuLi4iKToNCj4gaHR0cHM6
Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8xNzExNzU1
ODU3MTQuMjE5Mjk3Mi4xMjY2MTY3NTg3NjMwMDE2Nzc2Mi5zdGdpdEBkd2lsbGlhMi14ZmguamYu
aW50ZWwuY29tL19fOyEhQTRGMlI5R19wZyFZdldReWFIM0cwMERybG45MV8wcjF0LVV6M3JidHVy
akhNUVpDQ0lUd0M2ZnBCaDNDX1BaYVJPeG1xYnNaRGlHUkNkZHcyUW84WnVBS1FhYWRXQmt5TjdO
bzlfZFRtOUEkIA0KPiANCg0KVGhhbmtzIGZvciB0aGUgbGlua3MuIFRoYXQncyBnb29kIHRvIGtu
b3cuDQoNCkJSLA0KVGhpbmg=

