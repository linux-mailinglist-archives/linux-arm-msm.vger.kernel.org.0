Return-Path: <linux-arm-msm+bounces-41708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8519EE4BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 12:06:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE8051885C73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 11:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63D521149A;
	Thu, 12 Dec 2024 11:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="qHWWrncK";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="K24erfpn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCA0211496;
	Thu, 12 Dec 2024 11:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=216.71.153.144
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734001610; cv=fail; b=RxYtHl1P+TbbjeAsMsqWKGpblah3aeh6GBXMt/DUwXlKmglpQJ9TA9su/dgKySCdzjqwS+X9v3d6Mdi9M93aVPcPGeiabUlQfUnlpUIRs/hfk8sMspk63G+AyFSWXZKYOBRXRoJg5WVnWdov2S4fR49s3Ur1jVMdaYN794oRyxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734001610; c=relaxed/simple;
	bh=FZmmw25x65FT/47OR7OPEfNZikNbOOF+NvsGW2bZSC4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uUiqOw+g6OBA+5jgup9Q3hC5a1A5mUBS8U2cJUp7RERBKESSZ3SJOOBLT3fZ6M9KtdP2upl7eRIKnulBzQ5WFMnM1MdW7W7r+nWXkE6g5i5XfUovh2dOOQPepAZeWCs/qWF1fcx3IXMsrYXGM0f56WXVxHL4dY1LCPb34E7YSrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=qHWWrncK; dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b=K24erfpn; arc=fail smtp.client-ip=216.71.153.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1734001608; x=1765537608;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FZmmw25x65FT/47OR7OPEfNZikNbOOF+NvsGW2bZSC4=;
  b=qHWWrncKekewyOBN6+4UuQ2vaRQsoercjmI2oc79+KVhA+YevaHno4Bl
   NF8+4StOaH+afNVrHIE+JZ2CvuntRtFshVjDQ97la+vHruLxBaoeRJQUc
   NfYy1sJW25qnbag3SQ0NVZ/nDUoVwDPhL/ldgGgBRqrr2RHk2qlhThId5
   jLuGgw2GyIe0fN6PYnnYlEfPWfdVvD+RtnCfHxerdiN76V9kLWtSaiA/P
   CMc+OxyM5mPmISrzNd6aC0djfhVwRcep0s9OaN3ACuIDKXzDhwuZpZrFs
   +Kx+ChDnSgb6dIEVjMolKxlV5Z+MmDPLio/s5/H73YLlJv9U/88djSMZn
   Q==;
X-CSE-ConnectionGUID: B6DMqyoGSPO0j3SnaOGKGA==
X-CSE-MsgGUID: jGfYIDUHRuev43qb+eH+gA==
X-IronPort-AV: E=Sophos;i="6.12,228,1728921600"; 
   d="scan'208";a="34713652"
Received: from mail-eastus2azlp17010021.outbound.protection.outlook.com (HELO BN1PR04CU002.outbound.protection.outlook.com) ([40.93.12.21])
  by ob1.hgst.iphmx.com with ESMTP; 12 Dec 2024 19:06:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dTKh8fXWC4DLTVyrfsAwQf3OF+VHqPwY8KE8wxrKhgW/g0e2DWf8+lQ1D4vNV5X98/TNKHFdSpbNIr+VW6WArfNtjP2EsHGvoKqlPy0Oqw5y+NZIBA9fJfUriJlNNgXKa/gPZKT09FVzSNlCSp2ZQazalcgwDMIGoAqk+64qOqM/0R0E2c1w9pmhdc4KrgAYXaIscaFXVZmeY7TsZbUTa6xtEsS5W13c984nhIZhb0zt3JjbTVVQj2IIDpNCwgCIS6uI7D6sYicYlYQarVCGyJfGm4BPytxp1dmr+OQgt3FbbYK0gF7U43uKulLUXSCakbro68xoRfvyzdGH4/FEiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZmmw25x65FT/47OR7OPEfNZikNbOOF+NvsGW2bZSC4=;
 b=QbuNAYo2KRvtxx/Bxnopw+fdSxEl0kBDaAvtrHENvXMJEEjKPEpAfClSMJZRh5l6tdcr4jkJxT56ZORthvkOoq//bxRmS3HQJbwNghHpPqfaSOSdr3H4RVe8oqNeUkwHz3a6UFpgkVdgm4MAw4YhC0RNsdk1tg7lVaAL++BKPJ+KVxiOe5IBixnGCTqIVicb4o7bExmMIC9M8dHbbABdRkv4uZgayk/qnrTHI43nNZDcAb0X+RXK51P7Kv8BKHgjKLi/OjLOGwDl6s6VmVqxakWmZ+rraG+DyotSPSj1E3f7aVprNL7q+5k63hCB8n4uuAxeRDvOsSx7I1t4FAcSwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZmmw25x65FT/47OR7OPEfNZikNbOOF+NvsGW2bZSC4=;
 b=K24erfpnCFY1LsrxJg3hYxHUzUeWQSrXfPCcj2ZUJEafoXuk5+KmTSBWJ7VZ3RcG3B89qgmNYFnCA6I/X/PlL8zMUNbza63NxcfKnW7/mKyjcpsdTvO/Bwa3WcmsAl8RI0dmsNYgtPNUaom8yeIwHb1aeNqhmToM6s9O5Z6wWL4=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 DS0PR04MB9511.namprd04.prod.outlook.com (2603:10b6:8:1f3::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.16; Thu, 12 Dec 2024 11:06:44 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::bf16:5bed:e63:588f]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::bf16:5bed:e63:588f%4]) with mapi id 15.20.8251.015; Thu, 12 Dec 2024
 11:06:44 +0000
From: Avri Altman <Avri.Altman@wdc.com>
To: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K.
 Petersen" <martin.petersen@oracle.com>, Abel Vesa <abel.vesa@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>
CC: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Amit Pundir
	<amit.pundir@linaro.org>, Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: RE: [PATCH 2/3] scsi: ufs: qcom: Allow passing platform specific OF
 data
Thread-Topic: [PATCH 2/3] scsi: ufs: qcom: Allow passing platform specific OF
 data
Thread-Index: AQHbS/PJt1rxO00L5EKkh/GtkLgL27Lic5EA
Date: Thu, 12 Dec 2024 11:06:44 +0000
Message-ID:
 <DM6PR04MB65751DAF5C778E4E5C115228FC3F2@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <20241211-ufs-qcom-suspend-fix-v1-0-83ebbde76b1c@linaro.org>
 <20241211-ufs-qcom-suspend-fix-v1-2-83ebbde76b1c@linaro.org>
In-Reply-To: <20241211-ufs-qcom-suspend-fix-v1-2-83ebbde76b1c@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR04MB6575:EE_|DS0PR04MB9511:EE_
x-ms-office365-filtering-correlation-id: d8908843-5faa-4e4a-7f48-08dd1a9d104b
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WkdwR2NmcGo0ODRyeVE3N1pTeVIreE10SnVJSmRqT3N4aTlUd3hibStFb1Qy?=
 =?utf-8?B?dE15TmFveVBDZVA3a3ArMytQZ0FNUTUvY0R6dk9jTWdTY0R3aC9HckEzbWNT?=
 =?utf-8?B?NENYZHFKRHlUVDVTVVdQWUdVeU14bHJRWUVZVHdLdHpQbkZWVURsaHFsaUdv?=
 =?utf-8?B?ZFZWVWNwRVZqRWtDYWg3TDYrR2ZCT252aEErRk9wZndkWjI1ZCt1UVNaOVEw?=
 =?utf-8?B?YVBWK0dWbEpBN2lEZWtCNk1NR0U5eTlEWm1NNWg3N3BocmRJNDRHa0ZzODBT?=
 =?utf-8?B?QW5pMjZ0T0JoT3pyREpFaU52YVpjOVZ2Znd2V3pxU3JTUjVaaVNZd3NrTWly?=
 =?utf-8?B?R2JER2RaZDdJeUV5enpna1Q5T2FOR3pZdG5rR05IOFNYQ0xxOUd1ZTFsUTNs?=
 =?utf-8?B?MFE1LzdlM2U4bDhxck80dkpnSUN3a2orbW1NbkxLL0s0cXEyT0EzRm5NdjBQ?=
 =?utf-8?B?VXhkZVhtTlZOZVNQWEY5MlJxbE9vKzZkbjI2Zi9xVS9yUFQ5ZXhSSE02T3Mr?=
 =?utf-8?B?SEhTVWp3cXJ3TmRrQnJCbzMxc0RqMEJ2Yjlxb2p6cTkweDMrejAxOHZQcUcy?=
 =?utf-8?B?YWZ0VEFNemJxWmFCZEhpWjRBMURvdXVDSkZoeElkR0IzRkRjVFN0clRkaUJo?=
 =?utf-8?B?R0diN05aTTJUYkxtb0t0b21ZYzBueEJqeGNBT2luczVHV3k3elQxS2ZNS3p5?=
 =?utf-8?B?Q0MrTThZOWlJTzRBSkhFM3V2VTIxRDNnbXh1Z290U3dYQXUzMGdSUjk0SXlp?=
 =?utf-8?B?VFErNGdwTzdhQUNiZEdnUzRXZjVyU05JKzMzWU94M20velpHc0NNZG5ScVcz?=
 =?utf-8?B?TmQ4NzZuelhWNUpBd2NnaFp5dzF1WGI4TGx3cFVoZ2xSVDVHWk4rak5hVTBK?=
 =?utf-8?B?bXhaYlVBNjFmTmtFL3dWOGN5U3ZqbG8xamxDVFRZMlZtSlJiSkNWMThQcDg2?=
 =?utf-8?B?dnE2YlZENlBZY0hVa0FDRVk5cTM1TXpkZC9ONDVNNkVGMTJxZnh4YnUydm5U?=
 =?utf-8?B?b09NcDNYa2NicFk5QUxZVWxpSzBicXRSaDNCYzJQRVk2cldsTmY4LytaS2ly?=
 =?utf-8?B?dFByZ2lpelJKMjhyTzRQdGpJWDRVeUlEaVhpVUhXYy8rVUFrbEl6b2xTT1ZH?=
 =?utf-8?B?TkZ2bksxMWljdnF3VFZCbHBUMDFTYnNaZ3ZldkFKZzBjaTJFa2NaUEJ6V2VF?=
 =?utf-8?B?OHh0akFZclFwOXJldkJuTmlOb3ViRXp0ZFJwb1J6Rjhtd2xvTzVxVmxnc0F2?=
 =?utf-8?B?b3hlREkyZlBDK0szdVhla01mRytrMktXMEtYTEpUTk1YK1drclM1N1I4eEhT?=
 =?utf-8?B?Sk9JZmtZNERuZ2h4Z2g0aWk4SVd4c1hLRXFMZDZaZmxUdEQ1ZHpDNHp3WHNY?=
 =?utf-8?B?cWlkQ0s3eThkNHFONU1YL3ZqTWlxd01XbmwzN0R4cnlETElveEVkcElqalNm?=
 =?utf-8?B?TG11NVlZQmo2b2FlSys1eFY0VWZ3SUdvdzI5R2R4Rm5GckZTSWpENEhVdFRO?=
 =?utf-8?B?VWdVeUFkcldmT25yUkM0TTg1VFlGTG5rM2lvWXB5WEF3ZjRESnJvM1paTnIy?=
 =?utf-8?B?TWk1QnowVzNRMXNaKysvMEFBcG5nZ25OV1QyU1R6K3UwQ3dpbTVhUlcxVnJo?=
 =?utf-8?B?YW1DSUt2UlJNVGFlb1JKSVNOdGE3UkcrNUl4bkhQYjhZVFF0azV6RkcxU01i?=
 =?utf-8?B?RmJxdjBDSEJ0THg4Y0MzdGRVaSthU1R3djdvOFVlRHhCb0tWL1k0ckdIRDRC?=
 =?utf-8?B?Yy93VWtpNmF3Z3RPalVHTWNGalplMVVrQi9pTXY2eHFBL1VSMVJTOTFzRzE1?=
 =?utf-8?B?QzB5Vy9yTlhIQitVVHBEM2FwUVltNXRCc014bDVqdnVtd1pzdW05V3lnRnlT?=
 =?utf-8?B?R1VsaENkY2ZzRHVDaHNhek5wRjd5S1dnMFZGcThBcVRGYXc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB6575.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WDU4blE1SXNTM0Q5YWdCRjE1WnlyUC9yT0xjNFgyM0RaZFlkSTFhMFd3MmtS?=
 =?utf-8?B?TW1XV09jTVBEaW1PcGdHQjIyVUcyS3l6M2tDSHpJN052Z0htYjEzRlgxdnBN?=
 =?utf-8?B?S3oyeUFLR3JxaTQ3NjdkY2Y4UmZzalpqWW5Jb2ZFdFFKeUpqUXBldEJjKzV1?=
 =?utf-8?B?bEx2QzJBbDNoaVZENis5T3BZZHFqWW15elYvbUFFcTZmMUhzaWUyRjNOUFRt?=
 =?utf-8?B?UkFwNjM4VGQwOXdDM2hXcUEvcW90cUIvYllIcTR6MjdTRGJIQ24xQnFHdUgw?=
 =?utf-8?B?YmZuN3ZaWU02a29xMlpZSXNDTGpJdENOU0kyQi9lSGFQTkhHcXVMc3lzWG9K?=
 =?utf-8?B?ankwdnBSQ0Z3UDZtdmVSS0cvR0doaFAxR1p2bnFKWUVuSkUwdXozcXBhMzJY?=
 =?utf-8?B?OENRZlo5dlY4clQyYVZQRE92K2FnQlJPZjVZRmkyb1pYeERPUGI0cGFtaUN3?=
 =?utf-8?B?dW1mUS9pYzY0NDVQb1RpVXNsZUNJaU1ma1dRaEFBZlY0blV4RzB3SjJ6dDZB?=
 =?utf-8?B?REdTRnVWOEQ4ZTgrWUJnK1RrY3hOUnhGdFp5dWRiN0dWTGUxWit6REovUFRF?=
 =?utf-8?B?U0loNXpkMTdGMmhwOFZLbFI1UlpWcHR1V3U1QU1ITkt0OFZXUE5JVUdDY2Z0?=
 =?utf-8?B?WDJ3eHdGZEkzVkR2Z0NQV2VGQUR1ZWJmZDZpQkM4Z0hGN05oVTVUYklOY1E1?=
 =?utf-8?B?RU5WQ1RWY0huZktYT29GU1pVcnNyYTRUc1ZXZVMvV0xzc3MzRG5wVTdKN3Vq?=
 =?utf-8?B?Q2plZGVRdkFmMWMxaVNYcXRnSldZTndqemFrRG9PeWI3Nm1sallWckllbytG?=
 =?utf-8?B?bHp3ZklBMkV6U2xRdnljT2l3K2VtVElqVlRyZGpMYXBpdUVPcTlGY2Z2YUJ4?=
 =?utf-8?B?cHZOenNBc1BGdWl6RVowODg4ZUlramI1eXAvSHZrSktlcHJvWmNWZUE4ZlFx?=
 =?utf-8?B?ZzdxQkdHbmsyVVJIR2pCeFZFUVNHM1Bacy93M0ROZi9ZUHpCZTBzNjZLbHM1?=
 =?utf-8?B?RnpEdEttYno0SkZacVJvbTY5YmIyc0xsSTY0djFrNktLREM5V0p5SzdWaG5R?=
 =?utf-8?B?amlVYm1PSkg0Y3RFbVJWTExvMWdrUUE3SVZnV0luR1VPZGhJcW9TeXJINGNG?=
 =?utf-8?B?VUFFYlRBSEdyUHExMVdiSU5lOTl5R2xuT09yZUY0aGh3d0g3eGdwV08yV0ht?=
 =?utf-8?B?d1Vzb0k3NVBySzAyaUJGcm9YNmR0eUlkV3BGNTZBZ2gxUWt3VWNmODlPcVAz?=
 =?utf-8?B?QmtBNDZsaFdZaGhqT2ppbkVucnhpQ1lVSFV3UGdHM0lOTVNicXd0TjhUMFUx?=
 =?utf-8?B?dDlGZzhpRXM5QXdQRG1KaEZac29ZZTdIeWVlZ2NGVWJZRTVFRXhhK0hxRjhG?=
 =?utf-8?B?ZUd0UGUzRHA0RWdiSFZpenhFWXZadHpEUVAzc256eEVxKytoSFE5bkNTM0F4?=
 =?utf-8?B?UXl5QllZK1Z1NmJ2NTBMMkRpMDJSM0x3QUdDYzh5aFMxMUNjSUVIajd5ZXhC?=
 =?utf-8?B?RHJYWGUvM2xkSEE4RC9laWtDTUZROFYwblBZV25vQVBkVjNkcXR3a0FGN1l6?=
 =?utf-8?B?aTZ6RWU5VWZIdkZFZFZBTmhaYThDeElHcjlxTUNwcDlPbXdHV0FhcXVsR2lu?=
 =?utf-8?B?cjVpMU9wRUFrem8yVXpSL0hDUmlORFBXeE9odyt4Y2pzN2p3bjQwMUx3VGs5?=
 =?utf-8?B?dDViWDZIWnc2WnhLOUNhOTgvKzlSWitzNFBvaFlnd3BlU0RJRUY3dW5RYzF6?=
 =?utf-8?B?eEZ3QnZsd05Wd09ybVlBNmRiMVYxZ0JNZ3NRbFRCUUhUV3o5WDZrbDN2UDhM?=
 =?utf-8?B?NTFlUTNKOW1FcHVQZ2hlSStkZzhPSFZZL1pYR2JyR2pFUEx1UWlZQm92RFU1?=
 =?utf-8?B?WER6ZEJMdEUwTjRNaGlCa0pmcTdEZTh4UVpHR1NpZitTTERXaGdiTG01SHZm?=
 =?utf-8?B?V1hBWURPV0w4aU02YkVEMjdoSTR2RkZpR09STzR6RC9ZSWZKeDFxdUtWaDZa?=
 =?utf-8?B?aWZSTGFlUUpka2ltamNlaks4cHlkWHJkR0l3RndrRWI1UTVnOGQ1Y0pmVm9J?=
 =?utf-8?B?WTdlS3lZUkd5cXZwVThkdUV4L0RLaVhrbEhPbU5CdXMyYi80Q3BUOTRJclFt?=
 =?utf-8?Q?qqD5/bb/VHsErMDf1vIlMmxdo?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	alykVysl3L4QX8Wh3JCQumWC/AEKL9psdT+ZP5viDGpbZgaRHE5H1aUOlnnNzfR28CiQGIGZswY/drc1Oc5rt1/zCIv0p42uSH3He39/4Pi9CzZ9DukXrN8qfpQSkjrEjPXCW2b9AJdLRy7jUfp2YMRF0GCcCOxSSLKfBrda8rxOdkPCHdgK36TKMMfr1MsqoqMYZd9M7gU8MPS/HeZkUE0ZFFyJvM8CbTYfPoMcAz9LkO0DXbq/FWloQMUObPSaORvuL791FlniWZ9Zno9JDUYhL+IkdxQgSO+h9lbo/zouDOlWlYH3k8zxFUpElCu6DTGrDaUt3lEQhTaSEIlxgPLYYVjQOlbY6QoPuQKcVWwSIRMs5HHOkpP9bsFDlHzvmDlV/nARwn2iLstB2R3DcKYRPc9/O/E0toqRHGcPwUMxjOeub/uSyDUHg9DgzZBKP3tp8KXdpnX+kTNgenwXBqb5iikSFKSljMNyRLPdsQYQcAkivLg7aKreN/k4WzlVJLEUx6Bd7sh4b/Zz3kf3rqkHka2RFWxKQMLoltER52RCFhXojIJkUoMABQj2FyXoJQPZ8fFC2gZDGH/ajAXBWvpxvE+4OtitW9ffuTOZjnul70fpI7jXlHkrCRmwlvc4
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8908843-5faa-4e4a-7f48-08dd1a9d104b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 11:06:44.1994
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Io4L/QeqnfWOp0ZHFgADCiQTpqL+EU6tkxwKt+2DfY78O4aqcAb8ovPdjYL49guHmB2G5obWNT/rEb+qZ9eSvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR04MB9511

PiBGcm9tOiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbml2YW5uYW4uc2FkaGFzaXZhbUBsaW5h
cm8ub3JnPg0KPiANCj4gSW4gb3JkZXIgdG8gYWxsb3cgcGxhdGZvcm0gc3BlY2lmaWMgZmxhZ3Mg
YW5kIGNvbmZpZ3VyYXRpb25zLCBpbnRyb2R1Y2UgdGhlDQo+IHBsYXRmb3JtIHNwZWNpZmljIE9G
IGRhdGEgYW5kIG1vdmUgdGhlIGV4aXN0aW5nIHF1aXJrDQo+IFVGU0hDRF9RVUlSS19CUk9LRU5f
TFNEQlNfQ0FQIGZvciBTTTg1NTAgYW5kIFNNODY1MCBTb0NzLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogTWFuaXZhbm5hbiBTYWRoYXNpdmFtDQo+IDxtYW5pdmFubmFuLnNhZGhhc2l2YW1AbGluYXJv
Lm9yZz4NCkEgbml0IGJlbG93Lg0KDQpSZXZpZXdlZC1ieTogQXZyaSBBbHRtYW4gPGF2cmkuYWx0
bWFuQHdkYy5jb20+DQoNCj4gLS0tDQo+ICBkcml2ZXJzL3Vmcy9ob3N0L3Vmcy1xY29tLmMgfCAx
MyArKysrKysrKystLS0tICBkcml2ZXJzL3Vmcy9ob3N0L3Vmcy1xY29tLmgNCj4gfCAgNCArKysr
DQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91ZnMvaG9zdC91ZnMtcWNvbS5jIGIvZHJpdmVycy91
ZnMvaG9zdC91ZnMtcWNvbS5jIGluZGV4DQo+IDMyYjBjNzQ0MzdkZS4uMzVhZThjOGZjMzAxIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL3Vmcy9ob3N0L3Vmcy1xY29tLmMNCj4gKysrIGIvZHJpdmVy
cy91ZnMvaG9zdC91ZnMtcWNvbS5jDQo+IEBAIC04NzEsNiArODcxLDcgQEAgc3RhdGljIHUzMiB1
ZnNfcWNvbV9nZXRfdWZzX2hjaV92ZXJzaW9uKHN0cnVjdA0KPiB1ZnNfaGJhICpoYmEpDQo+ICAg
Ki8NCj4gIHN0YXRpYyB2b2lkIHVmc19xY29tX2FkdmVydGlzZV9xdWlya3Moc3RydWN0IHVmc19o
YmEgKmhiYSkgIHsNCj4gKyAgICAgICBjb25zdCBzdHJ1Y3QgdWZzX3Fjb21fZHJ2ZGF0YSAqZHJ2
ZGF0YSA9DQo+ICsgb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKGhiYS0+ZGV2KTsNCj4gICAgICAg
ICBzdHJ1Y3QgdWZzX3Fjb21faG9zdCAqaG9zdCA9IHVmc2hjZF9nZXRfdmFyaWFudChoYmEpOw0K
PiANCj4gICAgICAgICBpZiAoaG9zdC0+aHdfdmVyLm1ham9yID09IDB4MikNCj4gQEAgLTg3OSw5
ICs4ODAsOCBAQCBzdGF0aWMgdm9pZCB1ZnNfcWNvbV9hZHZlcnRpc2VfcXVpcmtzKHN0cnVjdCB1
ZnNfaGJhDQo+ICpoYmEpDQo+ICAgICAgICAgaWYgKGhvc3QtPmh3X3Zlci5tYWpvciA+IDB4MykN
Cj4gICAgICAgICAgICAgICAgIGhiYS0+cXVpcmtzIHw9IFVGU0hDRF9RVUlSS19SRUlOSVRfQUZU
RVJfTUFYX0dFQVJfU1dJVENIOw0KPiANCj4gLSAgICAgICBpZiAob2ZfZGV2aWNlX2lzX2NvbXBh
dGlibGUoaGJhLT5kZXYtPm9mX25vZGUsICJxY29tLHNtODU1MC11ZnNoYyIpDQo+IHx8DQo+IC0g
ICAgICAgICAgIG9mX2RldmljZV9pc19jb21wYXRpYmxlKGhiYS0+ZGV2LT5vZl9ub2RlLCAicWNv
bSxzbTg2NTAtdWZzaGMiKSkNCj4gLSAgICAgICAgICAgICAgIGhiYS0+cXVpcmtzIHw9IFVGU0hD
RF9RVUlSS19CUk9LRU5fTFNEQlNfQ0FQOw0KPiArICAgICAgIGlmIChkcnZkYXRhICYmIGRydmRh
dGEtPnF1aXJrcykNCj4gKyAgICAgICAgICAgICAgIGhiYS0+cXVpcmtzIHw9IGRydmRhdGEtPnF1
aXJrczsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgdm9pZCB1ZnNfcWNvbV9zZXRfcGh5X2dlYXIoc3Ry
dWN0IHVmc19xY29tX2hvc3QgKmhvc3QpIEBAIC0NCj4gMTg2NCw5ICsxODY0LDE0IEBAIHN0YXRp
YyB2b2lkIHVmc19xY29tX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlDQo+ICpwZGV2KQ0K
PiAgICAgICAgIHBsYXRmb3JtX2RldmljZV9tc2lfZnJlZV9pcnFzX2FsbChoYmEtPmRldik7DQo+
ICB9DQo+IA0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCB1ZnNfcWNvbV9kcnZkYXRhIHVmc19xY29t
X3NtODU1MF9kcnZkYXRhID0gew0KPiArICAgICAgIC5xdWlya3MgPSBVRlNIQ0RfUVVJUktfQlJP
S0VOX0xTREJTX0NBUCwgfTsNCj4gKw0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQgdWZzX3Fjb21fb2ZfbWF0Y2hbXSBfX21heWJlX3VudXNlZCA9IHsNCj4gICAgICAgICB7IC5j
b21wYXRpYmxlID0gInFjb20sdWZzaGMiIH0sDQo+IC0gICAgICAgeyAuY29tcGF0aWJsZSA9ICJx
Y29tLHNtODU1MC11ZnNoYyIgfSwNCj4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gInFjb20sc204
NTUwLXVmc2hjIiwgLmRhdGEgPQ0KPiAmdWZzX3Fjb21fc204NTUwX2RydmRhdGEgfSwNCj4gKyAg
ICAgICB7IC5jb21wYXRpYmxlID0gInFjb20sc204NjUwLXVmc2hjIiwgLmRhdGEgPQ0KPiArICZ1
ZnNfcWNvbV9zbTg1NTBfZHJ2ZGF0YSB9LA0KPiAgICAgICAgIHt9LA0KPiAgfTsNCj4gIE1PRFVM
RV9ERVZJQ0VfVEFCTEUob2YsIHVmc19xY29tX29mX21hdGNoKTsgZGlmZiAtLWdpdA0KPiBhL2Ry
aXZlcnMvdWZzL2hvc3QvdWZzLXFjb20uaCBiL2RyaXZlcnMvdWZzL2hvc3QvdWZzLXFjb20uaCBp
bmRleA0KPiBiOWRlMTcwOTgzYzkuLmU4NWNjNmZjMDcyZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy91ZnMvaG9zdC91ZnMtcWNvbS5oDQo+ICsrKyBiL2RyaXZlcnMvdWZzL2hvc3QvdWZzLXFjb20u
aA0KPiBAQCAtMjE3LDYgKzIxNywxMCBAQCBzdHJ1Y3QgdWZzX3Fjb21faG9zdCB7DQo+ICAgICAg
ICAgYm9vbCBlc2lfZW5hYmxlZDsNCj4gIH07DQo+IA0KPiArc3RydWN0IHVmc19xY29tX2RydmRh
dGEgew0KPiArICAgICAgIHVuc2lnbmVkIGludCBxdWlya3M7DQpNYXliZSBlbnVtIHVmc2hjZF9x
dWlya3MgPw0KDQpUaGFua3MsDQpBdnJpDQo+ICt9Ow0KPiArDQo+ICBzdGF0aWMgaW5saW5lIHUz
Mg0KPiAgdWZzX3Fjb21fZ2V0X2RlYnVnX3JlZ19vZmZzZXQoc3RydWN0IHVmc19xY29tX2hvc3Qg
Kmhvc3QsIHUzMiByZWcpICB7DQo+IA0KPiAtLQ0KPiAyLjI1LjENCj4gDQoNCg==

