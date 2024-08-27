Return-Path: <linux-arm-msm+bounces-29518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3975B95FE23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 03:09:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3500FB21BF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 01:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EBF828EB;
	Tue, 27 Aug 2024 01:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fP9q7ji6";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="G8SKUwku";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JzjbztPw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5EC2564;
	Tue, 27 Aug 2024 01:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724720943; cv=fail; b=WsDhJ9HTaXbEAqk4oqFqEfyWH3gFcOjVU9ikDocCM3302owYx0t0DU+uyb7Rly91qm/LigLvWZwBuAD017Zkval4yjhUA+A7X6MO8wHwxmH8WFlJ55+bTYjLk1CYEtg4aKOvrAcM4EcblLTTA/qnG9G8I20JWqL/E2T+/ZCulD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724720943; c=relaxed/simple;
	bh=II91BY4XN4S15jcL/G8DESnrJejCi/4MTQ153SpSQvI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SRhvdWVN2D2ASsxj8pI48JI3k89/Y1v0jYMRUFIiM2CtOJd032W4zOaV4sLd1fvKkZFSG84du6hjDvAPvhwuSFUmPHAF0xNKX+voSvPl0i6iNurVdfOqL51RTGIAHsjpFISXW0IcA4fROK8fysSa837ELd7bjOVgPiKq+k2kdTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=fP9q7ji6; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=G8SKUwku; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=JzjbztPw reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47QLdmbv017951;
	Mon, 26 Aug 2024 18:08:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=II91BY4XN4S15jcL/G8DESnrJejCi/4MTQ153SpSQvI=; b=
	fP9q7ji6RDG9fAIaOXgNT8Yg0BIJNp2b0xCMHodAbKfkmvnXXCS6jLMTELbvPmHP
	jr6HHlWtsTdv5xoUZXofcJb/vkR6A/oJKPx6geKDT3utXOfvW4hR+cWnwGEENT+r
	fjHy0GepMCg6Al0gPYq9UBx2WG7rrVBjmhJH0V6UspEi8L5qOHgDFhol4O/yJDge
	l8WzbqKbHRhlGqFkF9M+CTr4NDs+V4xDy2YAGguq1L3Xwjb3Sufws6/RfS4K2nBp
	2LprpNzZNT3j87fjmx+03n+mA09jIJFMb0cO1MXSmIJMt9MRXp1quwgShkQ4kijC
	zaDcFLNus+5kmRFOIO9Lcw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4191tqgr4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 18:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1724720902; bh=II91BY4XN4S15jcL/G8DESnrJejCi/4MTQ153SpSQvI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=G8SKUwku5Nw8Ez/uFi17JcBnjCAutuGEBLuV7V0I2R4feF2Wwd4obdEtbVaNPppgo
	 Wli3HW35sFgugGqo7f8m0NHoHx/1VKDeC0+e63QCSUsbmLA5Qz4szMYiRKk6j9LiLz
	 5pNSP9uM1npuPhEcHkRUlOQ2gLBQg4Mm1lDInyJPxNj6/oY/Y/c13FTgOtLJ2GBfq0
	 53V31OlSAumDpp9jHL/gC6YcDB+k62uXFzdvwTi3WEmNPbCB5eLrXA/wrWXsPNaADo
	 Y4n+3OksxOm3ODlxgkkqOb0i7x39uOTDRP8Imi7l4PbyeWSLb0LS0XsIDYld4WFiVO
	 lMZfJjiJu+D9g==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9565F40524;
	Tue, 27 Aug 2024 01:08:20 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 2EE0DA00A1;
	Tue, 27 Aug 2024 01:08:20 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=JzjbztPw;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id F05164044C;
	Tue, 27 Aug 2024 01:08:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aj7/uUqOEeYMKYlPmMiiMeyq+WiQQdTPXkpgTYjMCeWHAvEy+M7tYC+WDoEeOR0nhrAwfq2rQgA+n/NOdsGrd5t4XybSXL8hgQMicFbkXhEwobJDeLCtMWLeZ/VbH2kjyVARprQxzbwHqABr9xTmHpsIr0AQIUSkQ3T5bCrL73/o9xg2ETjvqxW3HH8PgON+vQaWiPxaB+F6r4O3WGyO2XriU+vuFB6p6uPBHNiwEBDp7c4gRav9YqFiNSvk1U9Z8XfuUc7UwauvqI2/xT0L727qMK+y250OPT9oZyC4ZdVjlr0BMeMKOr5TBMqcxMRKlPJ9nhCs9vL/FgwuFLK5mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=II91BY4XN4S15jcL/G8DESnrJejCi/4MTQ153SpSQvI=;
 b=Nje4lloWBsqAe1GWBmdC6pemguQAtcxGkj2ZNYaRIsoGGUIIL2Vw9u3bFAzuRLeRwSe1G6MAQACCd91PXyo41reP3tb65pTTPQ2F2GebDxPkshlwGU3vCAKD7bXtHWpkWbd/KyOZXH/dm957o6z8esuUMcv5nbr1c4CS62KhP0+4LtLi7ZM+9lDMmn9Nl+pmYQpXtpZ3SXJk3H8JMYJ74Ir9eSC9n4BL0QCPkKIX3O0ySceeFoOdqQQmqadFjguSeU9Nn7oth6CEYh91RCA5suWxk2gapPf+pVeederY+3BP8ez75lPJ2mJomNbnYuNMP71Z9/Qg80B0hHA6d5NJEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=II91BY4XN4S15jcL/G8DESnrJejCi/4MTQ153SpSQvI=;
 b=JzjbztPwGPYE8KqFn4hfde3EQ6jO06REYWuXXeVFaXzsJknADiw7AQ7Mz5Ai3AdBSaRT2YzkWauySrWlO4aVogPOzHgz18TjPL+LAoDuyPSwBhaUZoBoIeu1RpbsjGmLMulcmcNeCLwo+491MvEnpUrPYhs1pkrv+dpXLofdz78=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SN7PR12MB8147.namprd12.prod.outlook.com (2603:10b6:806:32e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 01:08:13 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 01:08:12 +0000
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
Subject: Re: [PATCH 01/11] usb: dwc3: st: use scoped device node handling to
 simplify error paths
Thread-Topic: [PATCH 01/11] usb: dwc3: st: use scoped device node handling to
 simplify error paths
Thread-Index: AQHa7jXEKyMccEpULEuRChZWzeS17bI6XrwA
Date: Tue, 27 Aug 2024 01:08:12 +0000
Message-ID: <20240827010808.wnhwhaz7zugbmes7@synopsys.com>
References:
 <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
 <20240814-b4-cleanup-h-of-node-put-usb-v1-1-95481b9682bc@linaro.org>
In-Reply-To:
 <20240814-b4-cleanup-h-of-node-put-usb-v1-1-95481b9682bc@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SN7PR12MB8147:EE_
x-ms-office365-filtering-correlation-id: 27703bee-8032-412f-2549-08dcc634b913
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZFZFNU1FOTNWcDNVekVyNXJ6QXZNTVl1eHg3aVIrZHlDTlh3ZFNLbnBORDZH?=
 =?utf-8?B?RzdOWGNNVkpKcC8rZUpZUTVKSTFoNllOZ0drN1V4eFVmL3VlS3dFYzFXZUYx?=
 =?utf-8?B?ZjY5c3FKcnBrTDBXN0IrUFUyNFUzRTdnMVRtbUFWNXhEM00wVU9XT3VkcGxz?=
 =?utf-8?B?VHRhbm9SUWtRVHh2K3ZHSFpOZTFaNzI5aWVkRzE4eDl4SGNGak1uT3p4bmJ4?=
 =?utf-8?B?UGw3bE50RURTYklHTXdBazZaeEpPcE9GTnNTN0dscjV6R1JIdTNiWkJteGhz?=
 =?utf-8?B?S0g4Rkl1YjhhOGpuNlFtdWtnWGhFM1pRODluZmptZHlMREdmRUFjdDR1SDFE?=
 =?utf-8?B?THBPNkZJN2FEVkg0QnVkSUFmeWQxZlN2WVArTjdnNGJ0RlQ3U2ZOWFRHYjEv?=
 =?utf-8?B?MHRib1MvQThhWk92Y2hlcVZGbkhnOFZjMmpZaHp2Y01tS2xRQzR6S0o1MlF2?=
 =?utf-8?B?eHdVc1d0UVhIS1haY1VVRTh6aDdjSHVuS0psM3NsdWxxaGRTQVdIcGlaQmpr?=
 =?utf-8?B?TjRsUk1HWjFoVUl1dW1WOUt5c0I4S0VKNkNiMldIcnMwS0FNSTZ5MVZWN2V4?=
 =?utf-8?B?T3pmeDZVZ2tkdy81VlNsTmNzejl3akx3dmJUd01WcElvZi9NTEFZZzBJZHRw?=
 =?utf-8?B?NW5oN2lnQm5oVlUxUzZlZDI1OE1jYzVUNno4dFlVODNKKzB3S212THhsOEZC?=
 =?utf-8?B?bXZQNmFzVnBQMGlqbXZteTI1d1c5emRXSkxRUUJyZmVOdHYydzdBZ3U2bDhL?=
 =?utf-8?B?TnpLQWF5Y2ZOQkNvQXErWjBJZWo2M2Q4a0xEM3cySUZIU0ZDa282OURQS2l3?=
 =?utf-8?B?cXpCcGdWL2NNYTlxdVdYeE0vMEtacDVUYlRTeG9GdytRdGI3VWVhWkRzRUVy?=
 =?utf-8?B?NVY3KzgxcHFaQW9OZ2JGMWhGYW5YcUlSM3Jxam12K0dreGI3em1kYVBIaDZ3?=
 =?utf-8?B?clo0aHZCVFpLbWZ5bXNlb1o0SHFuaUZMaDRzQXFQa29nUDJwZExJN05OM0dM?=
 =?utf-8?B?SjI0YjNoY1d6WlhONXdhY2hZQkt1ZWR0WExHLzRoZ2JIM2VWWjNFbmpFSFo1?=
 =?utf-8?B?Nm1Nd0ppTkU3VGUxbW44OHA5cVhSRGU3SlU1TXllbFcrT1FpSWxzQVl2am9C?=
 =?utf-8?B?bmdWMTNaemJDU0VDT2JzZkRpZzg2WmRHZTRBM1FXOUhiVlJhNkR3TTdQdGpq?=
 =?utf-8?B?aEloaDhWNGtZZ3hvd0VRSHdON3h5d3BuRTdPdmNkczNKVmN6TUQwaVpSRUxV?=
 =?utf-8?B?dHg1ZHZ2THRkeDdGb0VWSXFBWXV2MUt3LzVuU1g5eEN1c0o1M05JcHFTNkdV?=
 =?utf-8?B?UlhvdEIxbzBFQmxUd2xXYlRmd0p3TmgwRzlOSkVtNy95OUZNZFYwRXBxckRN?=
 =?utf-8?B?K1hBSW5SMXRFK05kTEx6UWRYdm5sOGJzQ09TU0NVRTFCbTRVWHRic1FDWWVL?=
 =?utf-8?B?aHI3T1BvdWF3ZEczdkFBd1BIN0FEOHFkcko2cFNDRVBuK0lhU2E3eVhnTEhT?=
 =?utf-8?B?ditZNXBseWlpY0V6bWp5WnVxeDdVWDEwazlzMjF0Mlk3NWFyR2xVS3RKN2p4?=
 =?utf-8?B?ZDc0SjJ2U3FHYldXaXZCOUgvb3ZBV1B5TFBiYVBNZ3BZVVYzQ0MwVUoyR2Zk?=
 =?utf-8?B?Wjh4T3duU21vdWlFdlZUSGROeFA5anp6eW9IQW1FUDJaMFgrV1Qydkoybkd5?=
 =?utf-8?B?MFowaUttdnlOU0orZ08yUFRlZmdGOUdtR09ZS2NsTnZSMGVzOTBNbDBuN0wv?=
 =?utf-8?B?TjVxQk53N3JLSmxiLzlldG0vL2RGT01xYWEwVmVJTHpWV1YyMFNqWkVSUHIz?=
 =?utf-8?B?TWVDTm5zSWF6ZFpRQnZzTjBHdWlzbzF0UVRqM0ZNd05PUEVjWnd4L01RY1Bt?=
 =?utf-8?B?aUM3TWdVMDZRNUlaenhIUnYvVXNlaC9EQkJtZzhLS04vUHc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cktFV2s4MnRONk80Zkt3c2x1dnRzekdnYnBMem9DSi9vSGo3OUV1cloyekhu?=
 =?utf-8?B?OHh1U3cvR05QUEVtY1VGSkN1RDJ6bURoeXpmMVFnYmtqVGRSNUNSSDRWS3o5?=
 =?utf-8?B?VlBWODExMEhoelpNVUtRRWlHc1B6UFRrY2tIWjVKWHVpajhoRVFMQytTczhS?=
 =?utf-8?B?TlplaW5SMWYwYityZDFWWHo4NnNOTmRhTlF6bkJVMU9YSTBvcWdCem0vdllz?=
 =?utf-8?B?MFJhbFBEU2h2Q2hndHIvMW1XcHh2c2dROUM3UjY1SE5SQkVSQ3RxTE1mTFBN?=
 =?utf-8?B?RXR3WnhHalBwU01LcXBtTEZYWmdQWFZNTEd3V00wcGlWdkYyODNMT1lnbG9D?=
 =?utf-8?B?QkU0WXltZEtZa3hUNVlZQUkxR3Q1dmVQSXo4TGwwL255VjZiMDUydUNRYjB2?=
 =?utf-8?B?S1AwbXlSVlcwbmk1clh1MTJTYVZ2MUEwUWZUVjNvbStrTjZ4MFZKNzQzOGFX?=
 =?utf-8?B?NU1icEFYY1I5Y3BzS1ZhdC9OOVdJbTlaU0tqNTY0NWpUNWQwQVlFQ24xUGMv?=
 =?utf-8?B?QmFmZFRXdFE1VzVSTnRDaE4reDVOOE9scGJRNi9ETHR5R0RTZm5PcGViT2Nv?=
 =?utf-8?B?Rm5mUlBTQU9rckZyS2hNUU5SSXVTUGNLSE00bjRqeHUrNHBaZ2hWLzRlbGl5?=
 =?utf-8?B?UWNDeWFQV3M1dW1mQ2h4cXl3WWx4N1RJVVBxc0plSFV0R1ZHNkJlT3B1TDNY?=
 =?utf-8?B?d2sybHI1OHkxSFJOQjhLZnNrTTg1N2t6K2RQTzZyeElwVWhmS2l1bEFPcWRG?=
 =?utf-8?B?bE5OVTZhc0hsSjJqK2MxejdxZWVpd2p2SUE4ZHRTSTZoTHdFVzlHVllrY2cw?=
 =?utf-8?B?aWEvRzcvWUxtWmFpUlptU2xOZzZvUkJ1WHQ2ZGJGbGpwbG9KZVlsaXFadndV?=
 =?utf-8?B?c3N1OEVMckUyTnkwdDEweWVSQ0J5Z1FOcW52am45LzdGZS9ZcmVpOUVORzZX?=
 =?utf-8?B?K0tWNTVqd0FsZlprZ214c2VXbEIzTmtpcis4c2tlZEhkK3ZxaVlTTERhaGIz?=
 =?utf-8?B?L0ZuUFN0MkJvVUZOaVpSVDF2T2xib3NtN3ZPdzZkR2g0QjhGZ05xMkU3dDA3?=
 =?utf-8?B?SW0ycEF3VWUvSzlLU3NQdFR0d2M1a3AvM3dqM3RTdnlvSGdUZm8vM1IxUVE2?=
 =?utf-8?B?a0dkdUg4Um1RbDNrOXpHRmNkYlhiVDZJMlJJUFpLVTlVSGdzdjVsYnlJTm1C?=
 =?utf-8?B?VnNTbnM2anRFWHRrODgxS3k0T0Z5VEVjOG5uY1dBWHRNWnpRYzRiQmtmMDRn?=
 =?utf-8?B?ZytQMmRZYklSR2ViMXorak9LUHBkYVNjQlgyanpweVFsS0oyTCtISkk3bU1R?=
 =?utf-8?B?cEs0YXdwTzRDaXVPdW96ZVdYNW5ySmZlOE85UHV3SDM3eGRUdUlsbDg1dlRC?=
 =?utf-8?B?Uk9WdXVCTE5FWG5yZ2Jzd0dxY2syVzB0ZklhaG10TjlDeWNkd0lTbUJvV1Qy?=
 =?utf-8?B?NnVVMndGeDhZUG1OZEc5RGJRQ0ZtcVdrd056a1JJNS9VN2ZBUlJJRUl5aEhM?=
 =?utf-8?B?RWtZV0tkVXFMMFc4a3RHd242bGRkTks0RFlLQWhrMDhodWloT2lGa2x4TSs0?=
 =?utf-8?B?OTBCV1Mwb3hRTjltczVMYVVEaDR5WlhoZGwzQUtjK0xSNUR3VXRXaS9VTFZl?=
 =?utf-8?B?aEJ6bVBQUE5CZDhTYnBRUUYyQ3ZSMDZ2NE1CYUxVTnVkWjY5VUNzL3FvaldX?=
 =?utf-8?B?NFpJR3ZFSVlOVEV5dmVzV1RTK2VnZzFGcVNjZkt4NFloTC8zcThWRmk0WFhB?=
 =?utf-8?B?Y1MxdkVVYVJPL0ZSTkNlYkhCYWRqS090VHI5TDNtWXBvcVEwV2tqc3lkUTg1?=
 =?utf-8?B?TE1WVk5lVHlCZDdpYzNnL1VBL2R3WkZvZnB6RGo0bzN6ZFVoWGJ2MU9HME1I?=
 =?utf-8?B?SkFPVE1nK3FJRmhQME14Y2s4NXFKQzU2UzBPaWRRNnJHQ3EzTkxOdC9RR1Fv?=
 =?utf-8?B?NzVXclVKNDdnRWZXMmIvTk1lcTZHSURNd05rZkRFVVlGRmE5NFZ6dW5EZ2xh?=
 =?utf-8?B?QUE1VGprRHlIbmFWNFdtN29PbzAvNlJpTXRkeWpsS1NNTGw5cVRPK09KWnNN?=
 =?utf-8?B?MUladWM2aWI3R0ppOHpWT3lEM0lvVWtKK09DT3FtclhXNFowU1JxcHNkZHJy?=
 =?utf-8?Q?bX2P1B6pToAScWok8Wx1Ymy9M?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0A2F86CB1FE7F418987D9E618EBF3F3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xGyvdXfVJQrXTAwn89fBoRcOyCHS4GW+JSpMBa8Oockqq+z9d1E2YuOEIOpBc6Q6G2hlnjeZiTlEmOPW1eZdvr+zdXiYoXqN6Tk+r7w3qyrs/knpba/TBjMU7Cja3jFaiOlrPiIPSyovH87/AoD7ENSrK/m2H1up4iwbu/U9rxQJaTBizQ/Q//1gM/j2JYkjQziEUxx9RUDSnYzBJt3vs2EMO+L0BbEsCKwdyDucAjmD1mPxrJ8/QWr+wQnEf7BlL1YUx7/28F3sq2iGrnIYeZfFY/i7mKAX2RN8XNTeydO6ZnUooqnb4Q77A3jh9ROn3oMThlQz8ucGqb5JD8HwrNGVmHcXENeu5zq6WiPxJQYerJMJJPFmo4/2YPwBdPs3yk7vABc9YYXJsKEs4Ed9VLYpbTysgAyZT9MgV6MCrAd9O8g+SDNKlLWM6ECHV7SREselU6ZoaP+U3QVW/iIonXLIzuxuA9sZK/zMk7Wp1/kHDP0Jcbj2IKrtQZ8ylysqS2D8DjwF7yNsuGYxomQuOzJ3AJH+Q6bXqc0Y2Ijk6encLqL33nhncg39bW0Q6XAbCSSHk/ydYPS5mXyi8CBHEkTC71akAsbKNzAhC37nDUsAuf60FseUUS72Ti04VVgTj9cfHikMpTuFnpWSO7WNUQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27703bee-8032-412f-2549-08dcc634b913
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 01:08:12.4792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5JNbR/ZfjMQsh8DzFYcxP+8Tq8Yu10D2o26/5Z/mPmnKC5/dwdtfaqA89nocogBXkwhGmfPxgW3oUL9iv8US1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8147
X-Proofpoint-ORIG-GUID: QBbjTBe2EyhFwElQmBUANBCilFe2sziP
X-Authority-Analysis: v=2.4 cv=dOr0m/Zb c=1 sm=1 tr=0 ts=66cd2708 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yoJbH4e0A30A:10 a=nEwiWwFL_bsA:10
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=jIQo8A4GAAAA:8 a=Mn_y58DmcRfC5XK0emMA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=AjGcO6oz07-iQ99wixmX:22 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-GUID: QBbjTBe2EyhFwElQmBUANBCilFe2sziP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_18,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=947
 malwarescore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
 spamscore=0 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408270006

T24gV2VkLCBBdWcgMTQsIDIwMjQsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IE9idGFp
biB0aGUgZGV2aWNlIG5vZGUgcmVmZXJlbmNlIHdpdGggc2NvcGVkL2NsZWFudXAuaCB0byByZWR1
Y2UgZXJyb3INCj4gaGFuZGxpbmcgYW5kIG1ha2UgdGhlIGNvZGUgYSBiaXQgc2ltcGxlci4gIFNj
b3BlZC9jbGVhbnVwLmggY29kaW5nIHN0eWxlDQo+IGV4cGVjdHMgdmFyaWFibGUgZGVjbGFyYXRp
b24gd2l0aCBpbml0aWFsaXphdGlvbiwgc28gdGhlDQo+IG9mX2dldF9jb21wYXRpYmxlX2NoaWxk
KCkgY2FsbCBoYXMgdG8gYmUgbW92ZWQgZWFybGllciwgYmVmb3JlIGFueSBnb3RvDQo+IGp1bXBz
IGhhcHBlbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlz
enRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gDQo+IC0tLQ0KPiANCj4gVGhpcyBkZXBlbmRz
IG9uIG15IGVhcmxpZXIgZml4Og0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwODE0MDkzOTU3LjM3OTQwLTIta3J6eXN6dG9mLmtv
emxvd3NraUBsaW5hcm8ub3JnL19fOyEhQTRGMlI5R19wZyFleFZZam5GSVJraUJnYVlCVEVJVzNh
cEZuRE00TW9qcDNyNS1heWkzc2VCckk3b3N6bGRzRkstWW8xdXpwTFdqcmc2OVphMDJ2THlfU2xN
UUU3NkV5UkMzaG4yeGFWNWokIA0KDQoNCkFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5n
dXllbkBzeW5vcHN5cy5jb20+DQoNClRoYW5rcywNClRoaW5o

