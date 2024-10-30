Return-Path: <linux-arm-msm+bounces-36458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CC79B6446
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 14:37:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 021442810F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 13:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2375B1E9067;
	Wed, 30 Oct 2024 13:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b="RjPNUJTH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2139.outbound.protection.outlook.com [40.107.117.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277263FB31;
	Wed, 30 Oct 2024 13:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730295465; cv=fail; b=HjFknU7ATiiYHei+AKmNGCTXixFTP3/gE8Xo/hGFaA8pJLu0CtigYCRsRkzZeO0eD/M9rl+G37z25sUhLslhSrzs/i87VF5fGP1Ksmv3ZXB888toN7dW2lhiuOOhqiQa8QWdHT6ubrWPF7CLp3Ip9tK2FwHslCv1paLbOiH51Ck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730295465; c=relaxed/simple;
	bh=enuYHWrWOfTafhZ8u7U2adjDyTL9n4XsvhnfWfXfPj8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Vlb0P7jhqUO0sVo0dqjge7lY2N/Bra+gtJDk9dJGUpxoGQSrDFwDTY7ohDjmdSajBBniDNzuLF1iyVD2oPJuoEQTU1/EOXYidkSEpoo4B/fLNR9aW+BzeTlqyPS7268pxUq+rFCck1XIzJ348FXAknkqE9aU3P4ogR36cyQXsQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com; spf=pass smtp.mailfrom=jaguarmicro.com; dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b=RjPNUJTH; arc=fail smtp.client-ip=40.107.117.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jaguarmicro.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AG0SBV6e4OJyY29RjJkbSd42yCa3ULrlzIfztdOY47STsmqDJ38DkqoZThaZxWgdsxNkjOtDuB7zAlR9/h8Jrlylvkd8r+3afKNXKGAWMeFgbJR8Q1sdHQRmMXdQrekju4axvBargmTCMNHI0eQFHN59XEcyGP9kfEM2dl56Tmf2e4DTchP60g71rduhyI+wcW/8+ajnNDzJg17QdY0nKLkivBGH+Fbw3JoD4cw7BA0OZik8D1z9pbMIzEqeaCAjRIJ2lvMFfkqCZRGwGfg/Q8v72OqJe3lryAwk6lEZvbQn1IWdEfQop9wywWXGqeFVANUEQo9IVVWdd3oI08zmqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enuYHWrWOfTafhZ8u7U2adjDyTL9n4XsvhnfWfXfPj8=;
 b=V/UYJOr04KhSHVJZ4rcSwNOAYQ8V0qbE7FDbXpUVKop+3C+JePaF4+gk0RtwyQkTtr2hfbhJINukX8hqCqQxwcbMKifdIQ/afDtqXwNGRT4gpTyqRG2xoEB4ecRSzm5/OLfLoGRHPpGC6JlL2JV24EIsRJXbeNzXadnZZ02rabgBUgE0ZfkO1AGKYgsfDKmC0qiLObEyO9qdOwS3S2edEMdMmsuNdwyyvHqlFLnR4Sdf9EBsNgaVC4ltUATS+mty/4otcLYuhvhKf4NqmxDVAxIXe31dEbqdgomGqZtDYCDHL2rxwLw+jR5v7y2PfCXqaKHrlR7oQC2tzHQV25gDOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaguarmicro.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enuYHWrWOfTafhZ8u7U2adjDyTL9n4XsvhnfWfXfPj8=;
 b=RjPNUJTHuvDTa5aENEOjr0mg7x4cx9W1/R6T8Ki1eYes75xYfG5WuXAohggyQsO1xZQrrqi8WiENzVZm4M1oOsxV45Jil8INOukwn6dIsMA3TgFQ9uNV93x2MA/XuYa7x52K2WLz7ybhEKWlxc1+f73QZN9JT4AlewFyVgLJdkNsFIyHbt3kC7JOw7kn07PRfAKy7auBJYh3jRrGeY8yQvJDsju7cEYVTOdgOVjEmgdEtPkpFV94o9978KvYG9XXQ/gqkDSic7NJRrimOIZy7NXAg+QOAtjEQRPWkssumzMEPP5qVmwCEn4udq1P0YAltDMX/IZ+g9DsPiruBTKz/w==
Received: from KL1PR0601MB5773.apcprd06.prod.outlook.com
 (2603:1096:820:b1::13) by SEZPR06MB6350.apcprd06.prod.outlook.com
 (2603:1096:101:133::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.13; Wed, 30 Oct
 2024 13:37:39 +0000
Received: from KL1PR0601MB5773.apcprd06.prod.outlook.com
 ([fe80::b56a:3ef:aa9d:c82]) by KL1PR0601MB5773.apcprd06.prod.outlook.com
 ([fe80::b56a:3ef:aa9d:c82%4]) with mapi id 15.20.8114.015; Wed, 30 Oct 2024
 13:37:39 +0000
From: Rex Nie <rex.nie@jaguarmicro.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC: "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux@roeck-us.net" <linux@roeck-us.net>, "caleb.connolly@linaro.org"
	<caleb.connolly@linaro.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Angus Chen <angus.chen@jaguarmicro.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject:
 =?gb2312?B?tPC4tDogW1BBVENIIHYzXSB1c2I6IHR5cGVjOiBxY29tLXBtaWM6IGluaXQg?=
 =?gb2312?B?dmFsdWUgb2YgaGRyX2xlbi90eGJ1Zl9sZW4gZWFybGllcg==?=
Thread-Topic: [PATCH v3] usb: typec: qcom-pmic: init value of
 hdr_len/txbuf_len earlier
Thread-Index: AQHbKrc4l+n3EuqURUGI20cuvEjvlrKfR16AgAAEvqA=
Date: Wed, 30 Oct 2024 13:37:39 +0000
Message-ID:
 <KL1PR0601MB5773BBB8804AFD43CB489226E6542@KL1PR0601MB5773.apcprd06.prod.outlook.com>
References: <20241030022753.2045-1-rex.nie@jaguarmicro.com>
 <20241030103256.2087-1-rex.nie@jaguarmicro.com>
 <ZyIyd3QmUxUCqglH@kuha.fi.intel.com>
In-Reply-To: <ZyIyd3QmUxUCqglH@kuha.fi.intel.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB5773:EE_|SEZPR06MB6350:EE_
x-ms-office365-filtering-correlation-id: efc0373f-9384-4c23-3956-08dcf8e805b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?gb2312?B?eEpLalpvTFZrVDNJN0xGb3V3c1pTWnRTWDN1R1NuRC9RMWwwd1lhcWVlbTBW?=
 =?gb2312?B?eTNGOTRhMUNteTRxbFRMQXZNYnNMeWhXWjNRMTkzYXZCWU14dXNPSmxUVGNN?=
 =?gb2312?B?ajIvN1d5Qm44UU1SLys5L01RRDVTSEU2ZlNncCsyUnlCOGdiK0d3OWxnSUN6?=
 =?gb2312?B?OFhqV05mS29OVmg0WmhBdjRDYk1KYWZXenpncUNhWG5ZaEp5aDdTU3BYYkN0?=
 =?gb2312?B?MVdSWmF3Qy8xZW9NOHlHN3JBZ2ZiOEJ5aWkyZkJwMm94SzFDcWUyNXlGT2hH?=
 =?gb2312?B?U0t3UERQTFV5cUpKT1I0UGFiRERVbXA3TUtmSitwdDN6Z1U1dzRsQXFDMTcw?=
 =?gb2312?B?ZFNtWDFhQ0VDNUgxVzdPSlNyc3l4MXpHdElnaEh0ME5kelhvOEdqOEJ4aEpo?=
 =?gb2312?B?eU9id24vb0xSMVpvS3NFNlJlNUlxNjB4Z2J0bVR6dXJJcDZoNS9ldWRIWnRv?=
 =?gb2312?B?clhjQlptOWUrQmhpa25kcUJ0NDhnQ08rY2w4cGswRlRsM2czMUdnaytHWXVG?=
 =?gb2312?B?VkpBUVNuVTdWdVJsanQvMnBQNjk0SmpsVVhkNEtUbGFydGdEMmwzWWNvVTB6?=
 =?gb2312?B?LzNseGtkQjZhVHZGV0NSRzEvNDBaNit0WUhOVFFiTGxkeWwzSDRlRmdIalhC?=
 =?gb2312?B?ZlJwdHFhRjcveEEyYXoySitRaGt4S0RCVjhxOWI4SlNGOGlJaTVyWm9zaGxR?=
 =?gb2312?B?NXp0SzlML2xLQk9rUFJ6RnFldTk5S05lSXpnVityL1VQMVQ0d010NzNUdTVV?=
 =?gb2312?B?TzJCczFWd3VTSmdqQkhabmF3UG5sa2hBSGpYejFHOWg0MEd5Y2Izd29sVlc4?=
 =?gb2312?B?RXVGMHV2QlBxTEZVMDJ0QlFIZEJIdWpMN25HMmdYbmtmbzl1cWJHVC9sY0xx?=
 =?gb2312?B?QTVlM2dhL0JLUWROWHd2b1l3ZjU4bWc0RmFKTXVOeFJRNnhUWFM3T1RCZ1Rk?=
 =?gb2312?B?TmpTU3BlMEVLQ2xRa3lKaHpiSEg3enMzNWlBcWFOY3llMHQ5NEozc2dCUUFh?=
 =?gb2312?B?MFNUaXdqTC8zZm9OSFhmRUtxZTBtWWlvUWhaYnFpa0xYZjJDK0xOSFVvMWVC?=
 =?gb2312?B?OXFsVlY4UkVMVG8zNXp6OFp0V0xQUnJUVGlnVXZBc3VyTHFvQ0FBM0ZQTVVv?=
 =?gb2312?B?Rk1GSWNvbCtNbitVc254Y1JyUEE2RnNvRXpPWHg4akdwK1BocUV6VUZpMXZu?=
 =?gb2312?B?dnpxMFkxbVREY1VVZGhRYmpwTlYxVEpKK21hb0VOMk1hNkNmRURnbnNaMlVG?=
 =?gb2312?B?R2RMK0kxZXVLYzVnSHNTUGhwb1duNE1KaXhiTnVZRTNKbzdSNnQzbGVhazNi?=
 =?gb2312?B?cE1qY2laSVYxUHBxSXZiMHdKNEdJQVE1Z0ZxU0tCQjNqZFFmRjFwdmVyekxE?=
 =?gb2312?B?VHZQUGN0Ui9LcGFGNGcvLzBIRVIzUGtuS2U2T3lKUy9VbGJ4MkhaSTJGVHl4?=
 =?gb2312?B?UWlwYjRpMzBYcytYZEtIc3lGOG1LVVJLSjFUM0lyOHVPVmRoRVhZS1NqaGFL?=
 =?gb2312?B?MFQ5VGtKc1ZucE9IZVl0emkvZ0owNFBlS0ZGMkxvdlpTaVdYUlE5VHlyTlVJ?=
 =?gb2312?B?VlBtQlBlMW9XMk1UenloSk91dW1ueXpYTXlNL0l1dHlVRjhQZWQ0dEp1MXRr?=
 =?gb2312?B?T1U0enpnTFhiKzNjOEFWUTdySTZBRXFCOVNuOWIwNWJwQTRKY2s2c0VYZWNR?=
 =?gb2312?B?RERkNy9tNUw2N2pXdUtINWlmM0U1aU5jc3M3MHh4MVc1Rlgrd2JZLy8ySjc4?=
 =?gb2312?B?OXFzS2RLTFpXUFdBODFpOUJsTlJCenhtZXdHMFQ1YnJRRDYvY1ptM2x2ZFN2?=
 =?gb2312?B?NjlSY3VZbklmWCtIK2ViVUxHRSt1NVdWd0VXY0lLTmU4N3U3RW9sL1pHZWk2?=
 =?gb2312?Q?sgchwk5qU6z3t?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB5773.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?QzhGbFdua2VaaDRYWlZ3S2N5NXdwbmVQaVRmRW9tVU03dGEybVd5TzM1VGtp?=
 =?gb2312?B?eTNxdFFCbVh6NnF0RDZWcWYzUlhQMG9ra2UrT1FBSnFHSlNDWXZuam9pa2FT?=
 =?gb2312?B?WFNyYVpMelJMNUVPSEY3T29rVjN6MUtOMGhmM21OaTBCakdxM3FVcFRRbnR4?=
 =?gb2312?B?ZXFtK29NTlI1RmRKdmxUMURKREsybjJpcTdBeXQvNUJIUVNKblVubE5BbW9k?=
 =?gb2312?B?MXp3YnhpT1JWa21lNFo3OUhvZktDWkxkemhnWkFvSkhGU3c1Q1lmUE9vbjVo?=
 =?gb2312?B?VTQvMUZBeUtFNTBrWmJTcnJOZVAwcEJGTDZyZEJRSkExcktiRFlsWTFTOGYx?=
 =?gb2312?B?RnV4UXNmVCtWMGRsT1JySDhVZnRrN09kTDVYajJmS2FDN0VHc0ZDNGVucTVp?=
 =?gb2312?B?cGQ3eWQ0dk93RDV4TVFFUlJseWd5MnRKRjFFTm1HSzN5bVNuMDROOEt2UHI4?=
 =?gb2312?B?cHJUNXByczZvWDN1S0VoV3ZFVG1zYjROc0JkOVF1dU1IclpueXZQTTIxMzc2?=
 =?gb2312?B?VG15RjBNdER6QXUrWWwwTEFzMlpOYWlDU0dRdkxiQWpFNzZ2NE1EenpEMFpO?=
 =?gb2312?B?K1Y1eldWcVFoYkVic0NHNW82UzBFYlcwWFhXOUR3Mm1iNEQxWndNS3VKcmFz?=
 =?gb2312?B?Nno2ZUg1TjBEMUtDSnVDaUxDdFRZUHE2Y0NNNEFHdSt0T1ZhK1dXZlA2RUdr?=
 =?gb2312?B?ckt6TkRRbzR0QTZjNzV6a1ZuWkJFZitHTG9yQ1ZIMXR1YVRsR29pR3gxTW42?=
 =?gb2312?B?cnNFeEtDVmlTTktxTHVVQm5sNjdwLzg1ZlhyMmE2ZEE5ckJ6VUJBWVNYYVh5?=
 =?gb2312?B?TUNVRWVDU2pPdXh0UHpCWlo0VVh4YjloZmRHdDZUWEhQMnJMNUhvbGV4YWps?=
 =?gb2312?B?a0wvVHpRU3JWZVIxMGpYUlZRaTFXYVBJaXhkQWRPMkRGakFaQlJLSDliS0Jx?=
 =?gb2312?B?L1JGa3NqSnhrOGtxSVJWdFpuWHRNeElHbjNQYmMwNWdmSmpKU0FsRmVmRHV0?=
 =?gb2312?B?WjdJMHlOQU9tNzU4eU5uR05XQUV4Z2dMRVIzWXgrNXVpZ1VXZ3ZPMnpRMFl0?=
 =?gb2312?B?QkI0WXp3a29GUXpaaXVETVdBcHQ4VmVodTdSNHlGWnNYTmdpWDRxL0k5eXRI?=
 =?gb2312?B?VWJ5UlUyQStURU1UTnYvLzlTMDdKbkoycnlxZzNzeVdUazdOSjFSL1BqbVFq?=
 =?gb2312?B?Y0FjTEVQZWc4ajQrNTZiZVMzR2U1UDVraG5RaGF2WXBGbXQvYWxVdDdJQVdj?=
 =?gb2312?B?TEV1VjZMaW4zR0cwSnlsa1M5amhOY0JzVjdCZlA2cUlCODQxS0NKVXFlalpq?=
 =?gb2312?B?eG9PY0c4TXptRUc3NHEzMmZCYzlFUkw5dnlZWmx5RnhTQjh3NkdEcU5IeFBU?=
 =?gb2312?B?NWI5WnNENEdPTHVOWFRPMjB6Rmp0ekE1NGVtdG1VckdJVTVnOXJycEJiRzc3?=
 =?gb2312?B?TFp2Q2hHcHRxODI5M3FPVEprUEpmZVpRL3hLd0lVWkhES1RVNEh3RUpJVTNH?=
 =?gb2312?B?cDV4MUlhNkVwdWN1V0lXenNXaGVBMnBaKzB5R1BKb29WK1ZsY1FOdEo4dDlj?=
 =?gb2312?B?VHYwRGNQNXpHWlBqT0pqbTkza3kwckpTVmx3bTZIQWZ5dSs5Zm5LS2lIam83?=
 =?gb2312?B?aWlOenRpeVRuNWtPRVoyV01sK1Z5cmgwZklieVpYS09EbjFybG02akdXeVVN?=
 =?gb2312?B?M29sanVSR29oTDJnVTl4aHp5eGE1cHF3RlFtNkd3elZsWGFFbHNoN0JoM0JL?=
 =?gb2312?B?THNiT3RFd0RKRlRhVmM5WU9udDlZdlhYMEFlZ0NYUHpJM0sySHRkU3hhQnZx?=
 =?gb2312?B?bDlGV1JVNWZZLzhNVkwvY0ZvRDRBQ25Zd2ZSME5RdjBmVmNmSGl3RUhNR0ZP?=
 =?gb2312?B?QXdwVXB6SU1nSG84S3JaYlFtemhBbUkrSHh6N3lBLzV2SVA0VXFmUUFXdFhp?=
 =?gb2312?B?V3Rmb1N5MVh4SVJHMnRsajNaU0NMRVZtdWtGb3o0UlRIdWl2VjFHQWsyTi9R?=
 =?gb2312?B?M3I2a0Y4S2cxQzFpWUw3L0VXTWV6MUw3TmIyakl3MEZidVQ5R2tjLzQxcURX?=
 =?gb2312?B?WDRzazNhb0VFYlB0U0VkS3hyNU5RVkpqbnB0RG40aWRucUpwSkpzUGZVNkla?=
 =?gb2312?Q?MNjf7hrnI/0hB8MaFWKMb1YMb?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: jaguarmicro.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB5773.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efc0373f-9384-4c23-3956-08dcf8e805b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2024 13:37:39.1231
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gbirICsU1za/E0QHJbCVRauGTq2oDDTFPqJQzRbSsiGQHegTjTaYayR8tuYvcWwSIhTUq3wSEXhD+Vj534GOUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6350

VGhhbmtzIGFnYWluLCBoZWlra2kuDQoNCj4gLS0tLS3Tyrz+1K28/i0tLS0tDQo+ILeivP7Iyzog
SGVpa2tpIEtyb2dlcnVzIDxoZWlra2kua3JvZ2VydXNAbGludXguaW50ZWwuY29tPg0KPiC3osvN
yrG85DogMjAyNMTqMTDUwjMwyNUgMjE6MjANCj4gytW8/sjLOiBSZXggTmllIDxyZXgubmllQGph
Z3Vhcm1pY3JvLmNvbT4NCj4gs63LzTogYnJ5YW4ub2Rvbm9naHVlQGxpbmFyby5vcmc7IGdyZWdr
aEBsaW51eGZvdW5kYXRpb24ub3JnOw0KPiBsaW51eEByb2Vjay11cy5uZXQ7IGNhbGViLmNvbm5v
bGx5QGxpbmFyby5vcmc7DQo+IGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnOyBsaW51eC11
c2JAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBBbmd1
cyBDaGVuIDxhbmd1cy5jaGVuQGphZ3Vhcm1pY3JvLmNvbT47DQo+IHN0YWJsZUB2Z2VyLmtlcm5l
bC5vcmcNCj4g1vfM4jogUmU6IFtQQVRDSCB2M10gdXNiOiB0eXBlYzogcWNvbS1wbWljOiBpbml0
IHZhbHVlIG9mIGhkcl9sZW4vdHhidWZfbGVuDQo+IGVhcmxpZXINCj4gDQo+IEV4dGVybmFsIE1h
aWw6IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIE9VVFNJREUgb2YgdGhlIG9yZ2FuaXphdGlv
biENCj4gRG8gbm90IGNsaWNrIGxpbmtzLCBvcGVuIGF0dGFjaG1lbnRzIG9yIHByb3ZpZGUgQU5Z
IGluZm9ybWF0aW9uIHVubGVzcyB5b3UNCj4gcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+IA0KPiBPbiBXZWQsIE9jdCAzMCwgMjAyNCBhdCAw
NjozMjo1N1BNICswODAwLCBSZXggTmllIHdyb3RlOg0KPiA+IElmIHRoZSByZWFkIG9mIFVTQl9Q
RFBIWV9SWF9BQ0tOT1dMRURHRV9SRUcgZmFpbGVkLCB0aGVuIGhkcl9sZW4gYW5kDQo+ID4gdHhi
dWZfbGVuIGFyZSB1bmluaXRpYWxpemVkLiBUaGlzIGNvbW1pdCBzdG9wcyB0byBwcmludCB1bmlu
aXRpYWxpemVkDQo+ID4gdmFsdWUgYW5kIG1pc2xlYWRpbmcvZmFsc2UgZGF0YS4NCj4gPg0KPiA+
IC0tLQ0KPiA+IFYyIC0+IFYzOg0KPiA+IC0gYWRkIGNoYW5nZWxvZywgYWRkIEZpeGVzIHRhZywg
YWRkIENjIHN0YWJsZSBtbC4gVGhhbmtzIGhlaWtraQ0KPiA+IC0gTGluayB0byB2MjoNCj4gPiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDEwMzAwMjI3NTMuMjA0NS0xLXJleC5uaWVA
amFndWFybWljcm8uDQo+ID4gY29tLw0KPiA+IFYxIC0+IFYyOg0KPiA+IC0ga2VlcCBwcmludG91
dCB3aGVuIGRhdGEgZGlkbid0IHRyYW5zbWl0LCB0aGFua3MgQmpvcm4sIGJvZCwgZ3JlZyBrLWgN
Cj4gPiAtIExpbmtzOg0KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9iMTc3ZTczNi1l
NjQwLTQ3ZWQtOWYxZS1lZTY1OTcxZGZjOWNAbGluYXINCj4gPiBvLm9yZy8NCj4gPg0KPiA+IENj
OiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+ID4gRml4ZXM6IGE0NDIyZmYyMjE0MiAoIiB1c2I6
IHR5cGVjOiBxY29tOiBBZGQgUXVhbGNvbW0gUE1JQyBUeXBlLUMNCj4gPiBkcml2ZXIiKQ0KPiA+
IFNpZ25lZC1vZmYtYnk6IFJleCBOaWUgPHJleC5uaWVAamFndWFybWljcm8uY29tPg0KPiANCj4g
U29ycnksIGJ1dCB0aGlzIGlzIHN0aWxsIGJyb2tlbi4NCj4gDQo+IFRob3NlIHRhZ3MgbmVlZCB0
byBjb21lIGJlZm9yZSB0aGUgIi0tLSIuIE90aGVyd2lzZSB0aGV5IHdpbGwgbm90IGVuZC11cCBp
bnRvDQo+IHRoZSBhY3R1YWwgY29tbWl0IHdoZW4gdGhpcyBwYXRjaCBpcyBhcHBsaWVkLg0KPiAN
Cj4gSXQgc2hvdWxkIGxvb2sgc29tZXRoaW5nIGxpa2UgdGhpczoNCj4gDQo+ICAgICAgICAgdXNi
OiB0eXBlYzogcWNvbS1wbWljOiBpbml0IHZhbHVlIG9mIGhkcl9sZW4vdHhidWZfbGVuIGVhcmxp
ZXINCj4gDQo+ICAgICAgICAgSWYgdGhlIHJlYWQgb2YgVVNCX1BEUEhZX1JYX0FDS05PV0xFREdF
X1JFRyBmYWlsZWQsIHRoZW4NCj4gaGRyX2xlbiBhbmQNCj4gICAgICAgICB0eGJ1Zl9sZW4gYXJl
IHVuaW5pdGlhbGl6ZWQuIFRoaXMgY29tbWl0IHN0b3BzIHRvIHByaW50IHVuaW5pdGlhbGl6ZWQN
Cj4gICAgICAgICB2YWx1ZSBhbmQgbWlzbGVhZGluZy9mYWxzZSBkYXRhLg0KPiANCj4gICAgICAg
ICBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiAgICAgICAgIEZpeGVzOiBhNDQyMmZmMjIx
NDIgKCIgdXNiOiB0eXBlYzogcWNvbTogQWRkIFF1YWxjb21tIFBNSUMNCj4gVHlwZS1DIGRyaXZl
ciIpDQo+ICAgICAgICAgU2lnbmVkLW9mZi1ieTogUmV4IE5pZSA8cmV4Lm5pZUBqYWd1YXJtaWNy
by5jb20+DQo+ICAgICAgICAgLS0tDQo+ICAgICAgICAgVjIgLT4gVjM6DQo+ICAgICAgICAgLSBh
ZGQgY2hhbmdlbG9nLCBhZGQgRml4ZXMgdGFnLCBhZGQgQ2Mgc3RhYmxlIG1sLiBUaGFua3MgaGVp
a2tpDQo+ICAgICAgICAgLSBMaW5rIHRvIHYyOg0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyNDEwMzAwMjI3NTMuMjA0NS0xLXJleC5uaWVAamFndWFybWljcm8uY28NCj4gbS8NCj4g
ICAgICAgICBWMSAtPiBWMjoNCj4gICAgICAgICAtIGtlZXAgcHJpbnRvdXQgd2hlbiBkYXRhIGRp
ZG4ndCB0cmFuc21pdCwgdGhhbmtzIEJqb3JuLCBib2QsIGdyZWcNCj4gay1oDQo+ICAgICAgICAg
LSBMaW5rczoNCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL2IxNzdlNzM2LWU2NDAtNDdl
ZC05ZjFlLWVlNjU5NzFkZmM5Y0BsaW5hcm8uDQo+IG9yZy8NCj4gDQo+ICAgICAgICAgIGRyaXZl
cnMvdXNiL3R5cGVjL3RjcG0vcWNvbS9xY29tX3BtaWNfdHlwZWNfcGRwaHkuYyB8IDgNCj4gKysr
Ky0tLS0NCj4gICAgICAgICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkNCj4gDQo+ICAgICAgICAgZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL3R5cGVjLi4u
DQo+IA0KPiB0aGFua3MsDQo+IA0KPiAtLQ0KPiBoZWlra2kNCg==

