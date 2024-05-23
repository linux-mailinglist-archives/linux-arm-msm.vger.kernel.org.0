Return-Path: <linux-arm-msm+bounces-20279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6744B8CCB08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 05:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E16A282325
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 03:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A44B63EA66;
	Thu, 23 May 2024 03:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="YipjBQmy";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="ZVXAvSV6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDF18475;
	Thu, 23 May 2024 03:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.143.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716434313; cv=fail; b=fqkmneG49js71mZK7SYOupaGKtUGlN5XRPRUZeEDbOWzcFf52yHtMc+2tyGOm9y4WkSW5Io4ofEFLmTQfJKttrc6hE5Y36VraAuCkYBHvLWxNBAYQpLMTe2twXH44vNbXRwA8sWOgWhmM4Ss3euz9pL5GLY/JsB1+Zb1lUHXpYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716434313; c=relaxed/simple;
	bh=3C+OEa1gBrUpqUmmaE/lWPMUi8NnR0/jfw5aOOb7dHM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BdosoHspxbdwGpxKRmq26N2dacUbrXdcyJQUz8ThazAo6r8nghKTjvVzz99wjLBl8qc4LPf3PaRwX+r2l1pxb2C35jMK2QaRKmyzi+xOZrWlwAkVg0f/8E0x6LUd7p6S/IUvGDpBd69cqktssblf+WQJgcB3tsi6yV3MwRSt/2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=YipjBQmy; dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b=ZVXAvSV6; arc=fail smtp.client-ip=68.232.143.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1716434311; x=1747970311;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3C+OEa1gBrUpqUmmaE/lWPMUi8NnR0/jfw5aOOb7dHM=;
  b=YipjBQmyi+4NNm46YhH/2mVd4wztzcY0e3HQMT0PN4Z6z6vM403W8czN
   DkYz6LcUWB+tq/5/lmB4v78MwuWiyFBMe68G7sWNiYul5/uRcuRfJoT+x
   cxo9x6OOkooVZt/GOR5exCRjH/3BvMC0XorEbdGwliIH4U1PFpJIW5KaD
   M57g2Znc9o/umwCgjjvxTenRxCDK7f4Z6BPvS/216M/haeaerFJA8GlYv
   m624XF4b5OwOhSksK4lPxwD0KVspm+VPr0Q6EMUK+M7UOi3hDkKSmnIXc
   8CL/x0fX8e+bAWmcGf4I3LSHvPGMrm8cb8XXt8i6r6Ia96zdaYYjt9t9P
   g==;
X-CSE-ConnectionGUID: LAKnqh9XSvWHgLdA0VJTqA==
X-CSE-MsgGUID: /Rs0ZmJdT5KEbJZk1gXgJQ==
X-IronPort-AV: E=Sophos;i="6.08,181,1712592000"; 
   d="scan'208";a="17095860"
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
  by ob1.hgst.iphmx.com with ESMTP; 23 May 2024 11:18:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/bAmbprYgXDwL7acZ4I5GZyzygmlnEPd6vMZWx31sr3Yv3zVs2/1tco33lyw36aMr7kcRh0GoquyrtVsBObHfNv6jCLCLHIVT6nplQxthiLLv9nagBATBb7wm+Re+YW4rpxO8H95Uo2B0eypD60l0b67wcwHnSEMmViBG6/znma20ANSyCEUtRBkusrkdWke22vHsoggpj9MF75BKdiiZl7Fy8CraQedkuZ5tnvhHD5FAMFxfo9ArihOEy7Xqe5sP7xiA5VR/iWihHfAchzhx0caYHTMqHXQ3C5zGXDTEwwdWE8X/TrvcTBHAZTAGiqgfE+Xd3b7dhqYX99FPL0bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3C+OEa1gBrUpqUmmaE/lWPMUi8NnR0/jfw5aOOb7dHM=;
 b=VnFwMyVNc+GIdkFTf8p9CRlZcc9L4hlRf4pSdCO6L1BSsbyRIVwxhFIyY2zMVoljSD1SjqGx3S2VJc4YU/A6LbVeQY7JVpQz57g1spHwAT6sNodlIhQ3HCVReNbAOwnwSNbn04s65wCOlxnzLSMRez5vKaDk5WNT1TCQTSGdX/zBbnExT2RXN/mCLK1yWgJD8QNnt4ADfMWYCtSe8+F6ROafEKbp5NMlmGhPhs35Z+il17WP2DrV/D70tdCKs/Y9MJYMWJNlEh/d2qKhP9F7zjOWOu5Y5g0zhdc7j1z0ROQoMVgoqDeCSm1mMEbRGDvrPUXM8rEX0ocrHDG6eBldBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3C+OEa1gBrUpqUmmaE/lWPMUi8NnR0/jfw5aOOb7dHM=;
 b=ZVXAvSV60nsj4Ip2UBnVT8/uPTuPClHZ2iU0or74GC42UPVF1mi5OnmP1eytbsJFAb+BPFWogz6TbM0mtNijFRfvJ+DgNCDLhb0cbcT6q9DFYP47WfvJsloQC0RNYa1Xn1a/CZPLH8Ce/rgrtc9RsMdCvcts6JJ5J6VuVw/nT9A=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 CH2PR04MB6808.namprd04.prod.outlook.com (2603:10b6:610:98::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.19; Thu, 23 May 2024 03:18:26 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::bf16:5bed:e63:588f]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::bf16:5bed:e63:588f%5]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 03:18:26 +0000
From: Avri Altman <Avri.Altman@wdc.com>
To: Bart Van Assche <bvanassche@acm.org>, "Bao D. Nguyen"
	<quic_nguyenb@quicinc.com>, "quic_cang@quicinc.com" <quic_cang@quicinc.com>,
	"quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>, "beanhuo@micron.com"
	<beanhuo@micron.com>, "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>
CC: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Manivannan
 Sadhasivam <manivannan.sadhasivam@linaro.org>, "James E.J. Bottomley"
	<jejb@linux.ibm.com>, "open list:ARM/QUALCOMM SUPPORT"
	<linux-arm-msm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 2/2] scsi: ufs: qcom: Update the UIC Command Timeout
Thread-Topic: [PATCH v1 2/2] scsi: ufs: qcom: Update the UIC Command Timeout
Thread-Index: AQHarBX7OisvtrLxb0WSwrfwSly0ebGjkLqAgAAsJACAAAF8gIAAaIOA
Date: Thu, 23 May 2024 03:18:26 +0000
Message-ID:
 <DM6PR04MB6575FAF59F9F3499BEC4128CFCF42@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <cover.1716359578.git.quic_nguyenb@quicinc.com>
 <8e5593feaac75660ff132d67ee5d9130e628fefb.1716359578.git.quic_nguyenb@quicinc.com>
 <2ec8a7a6-c2cd-4861-9a43-8a4652e0f116@acm.org>
 <f9595b82-66f9-dce2-7fba-c42b1eacf962@quicinc.com>
 <bdd52dc0-85dd-4000-b5dd-c2c22f5b8ba1@acm.org>
In-Reply-To: <bdd52dc0-85dd-4000-b5dd-c2c22f5b8ba1@acm.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR04MB6575:EE_|CH2PR04MB6808:EE_
x-ms-office365-filtering-correlation-id: 20af8eb3-deda-4a28-c6ac-08dc7ad702c6
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|1800799015|366007|7416005|376005|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?M3VyMXlMTi9IRVBlMy9Ya1VVNXhGalFWUldWV3VtSTN5bE9IL2c3R3Jtc0tl?=
 =?utf-8?B?eUZoOUZTVnFLSDNvdzZxZWtNVk5VOWpuRDRMazRwOGZ2akFFUjI1NVV3WHhk?=
 =?utf-8?B?cVgzYUI1YkxqWVl5K0Y4Vk9FaEprNmZEV1JRWENyVlZaUlFFaDZpaksrVVZM?=
 =?utf-8?B?amtYcjFMNU1USXoybkZwQWFhMTNlaTJ6Q0kvc25WYXpsS25MV0haUVFNQUt4?=
 =?utf-8?B?NExrZE0vbSt6cG9Ka2s4VnV0U05tRkVKR0NGZ1lmMG5OU3JDSktLbG1WTlg2?=
 =?utf-8?B?NlNtTXh5Q2trTnNhSmNPL3NKN21vNmxjdVpveTBaL2dlMkpKUUQyTENaWjdF?=
 =?utf-8?B?ODhJS21YVVNGWTViZU9jTGVMZG9MSHRuVGN2SUt0dW9JVGVNcFBmRUdIbkdQ?=
 =?utf-8?B?WnZEZWFHTVNkWDNtaHpEMXF1anQvSHUva2t4dnF3UUs0dFloby9CT3RPWUhj?=
 =?utf-8?B?emZySE5DVEZEWkpWSWJpUm1LRGpTbnFLSEFBVUhYTnZQWU1xTDVUUjFtdUgv?=
 =?utf-8?B?RWx1c3VlNSs2QVpRTStMZnhiRXZrT2VNZzVVSlpwOGRCenNnbUR1dDF2WUEw?=
 =?utf-8?B?a1lndHVGczEySlZQWXdienlQYi9zaEJtZTBacUpNWWZlLzFoNERFcWxvTHpR?=
 =?utf-8?B?SVRHc2hqUDhnM29VZ2YrYzlndUdzb1dKSjRlbzR4dFNsSGd2ZlFqWnhyWmw5?=
 =?utf-8?B?T3lJTHNtZkJvRUN2RkhEcVBQZjhLNmpSUzJjR3JtSm9icVBNeGdtUFZ2OFVQ?=
 =?utf-8?B?Ymg2UXVoS0RVMGJmMW1ETEVZZ3JZWG9iSmgwZHNtWVZFZnpJekJBV0pzZWNx?=
 =?utf-8?B?VkpIQ2JVSXlJaFIxS1I2VU5zQnh2OHR3bjdUSGJWOUxVbDRCM1owdHczZWlN?=
 =?utf-8?B?QmJ1c1JBeWE0cEhjMlNUV1BHQURaRFRnRWxjNHhPSGZlL3dvbk9scXNVamlt?=
 =?utf-8?B?THQ3bzRtUVdEQkFNbWk3VkdQcUIrNEU5T0lPb0xGdGJDb21uclE4aDBmSTVl?=
 =?utf-8?B?OGE2Q2VnRE51dWdjVVJBc0ZwbzZNZGF4b3NPR2pZWm0xSVh3Skd0d01lVng4?=
 =?utf-8?B?a2YyTHp3UjJEeWJxZ0dWKzd6RDRUZDltZTBKa1FQMk9LeU1YR3lTNVN0UHZu?=
 =?utf-8?B?K01PWHBtNm9XSnA4ZjRtSU92YXdUVmV3V0ZvKzhQdFlkUDlOZGk0ZFJBMGYx?=
 =?utf-8?B?eXUzTjF2TE5QYndiMmJQc3M2VVB5S21WaW02YXNqbWxDamtyVWVUbUpIUXQ0?=
 =?utf-8?B?M3lDVXhJNXFmcC93NkJXdk9VL1ozWFBUTEc0dkxReVcyUG9GbzJHcHgvUFhk?=
 =?utf-8?B?RFl2empXRUNaTzNJLzBNdUIxQTliVFdXQnlFNGxuS0tBSzVwbFVIRDErVTJX?=
 =?utf-8?B?YVZhQVFTV2czSXdXa2x4UzlqRnN2emRzN2QrWHV5aW13ZTRaZk1IWHRkUHJY?=
 =?utf-8?B?cXhqK0VpcG5lNUFLUWpEa2hMVTRmRDZBL3J4akN0bjhQMHFLZG9CUFFHU2VN?=
 =?utf-8?B?YkxnbUE0NHl2RHNFRW9LNTVTKzV3QS9IRlY0ZjlJQXE0VDc3QnBpeWhScTBK?=
 =?utf-8?B?SW84aXMrTjR3ZTBGdDNIMGRCUDV1OStsWEdxVXA0eGx5dTAwRjFoeFBsMSs0?=
 =?utf-8?B?enIzdThGemhTalpQSGI2N0EzaEFkZ1UrcThqRzZJRXZzNVNhNzBwb3pBd3dV?=
 =?utf-8?B?WklmV2huUzJ3cDZzenhNREVtaGNtbzBlT2Q5YmNvcHVBUTg2elg4b0toUVhj?=
 =?utf-8?B?ZXF5b3VwS05KVktzbGI3RWlBWFAxemVsUTlnZUcxVkU3UGFVb3Zab2VEU2FX?=
 =?utf-8?B?SEwzYkhjREx4bFFtYnhEUT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB6575.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(7416005)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RnZ0ODhETVpnWE1VY3BxakNTc3Y5MS9Tdk5DRmg5Mm5JRU5xN1B1MGtoQzM0?=
 =?utf-8?B?dHZMenpYU2d2Y2lPckJQajQvUkJNOG80bnVrL2JBMWhVWTRiRVFlWTdha0xr?=
 =?utf-8?B?K0ovMXIvZTZDQlRkQzVtVUw0bkE1TWpxdUpDVE90ZEMreUhYUmJBS3dZd2tk?=
 =?utf-8?B?Rkoyc205Q1dYSWZPRGsxNDFwd1ZxbTJGOGN4TnMxdTYvVHhLS0hvSFgvNXll?=
 =?utf-8?B?SXZ1SHpMTkdhc3gwcE1pU0hpdUpDSDBjT2VHKytCcExRU1ArMGo3V3IyaVQ4?=
 =?utf-8?B?RHkxR3U2NTRna1l1S0RYNXd1bktKR2xhR0wxc0ZkUXFseC9rVkZvRUdJZ2Vx?=
 =?utf-8?B?YkhmbnhZTHVhMUxNUklWcm5mNXZGK0JNdDlkZDNiWU92VmY0MDlpK1FoQXAr?=
 =?utf-8?B?RExiU1pLQ1E2M3pDZkdtdGtZblZCb2s5K0oxYWh6N0RyaWpTU2xhbmFTbTlr?=
 =?utf-8?B?SnBGbjlVQWhzN0JwS1liUWNMVHVRZEpIMUtaSWdTbzF4UWFqZTZ2YmxaaTlk?=
 =?utf-8?B?dnM3dlEyY01oVnE2U0N6NnRNeHliUVo4di9SVk1ZbERNaWsyRkY2Z1hXd0Jt?=
 =?utf-8?B?OGRlNzRBVWh3cXkxYm9ocFg3djltZzR6Q0tqMWJaNy9Ld2NXSWwwLzZ4VVFJ?=
 =?utf-8?B?VStGSFJCS09Pbi80Z09RSnltRTFwV3B5c2dFaHd1QVExRGlxb0dReGpkYktX?=
 =?utf-8?B?dnAyN0dybW5WQmt4WStSTkdOMVpWN1VJQzR5UitkRkVhWVhzQ20wQW8vYWFL?=
 =?utf-8?B?UTJhSzZoN0x0WGNsMWtiaG0zckxiQzg1Z2ExeGpCMzdEb25WMU11NkhURWVF?=
 =?utf-8?B?eVpJS0JxZlNmM09NYUdMYUNwYXh3UkQyTlE4OWNMamcwdmVkTng2NlVrUmNy?=
 =?utf-8?B?V2hxSE11L1FJeXRpVE1CZGJ0QnFuRVhQUmZMSEZzR1lBWVZFNXJ1bmVuUTMz?=
 =?utf-8?B?bzVITVRGQWhrRVVVaW5OSzBmOFMrVzZLaFd5N1QxQ3RGNEVvVnVJcnZEaGtk?=
 =?utf-8?B?aGJSNmh5OWxuYzFscWNUdUxPZGN3QWZtdE1ta1dBNHRVRXRXOWZPVlY5RUtN?=
 =?utf-8?B?amxYQm9BYkdZZUdzSzFqdUVPWUxuNm80TGs4MXJyRXhIZ1M0eVI2aU13WlVm?=
 =?utf-8?B?QjBVbVVJbGxvODB5djFuMUY5U1NkdEFkN1lqNk14S252cHg0Z1FnYlhpOTdo?=
 =?utf-8?B?WGo5UHAwOEFpV2Nqa1VMWlZnSUJlYlFCaTFveGFvMmNBcEZZckI1elE1TUUx?=
 =?utf-8?B?OUtLalRtcFFqSVR2WjZ3VTVsTjN6VmFvajdDRFd3NEZHSHZLK1ZFbVprcWFP?=
 =?utf-8?B?QzlaMExJVTEzcHdCR2JJU1RNUGdYcjN4YUZJOVBtd0hoSFU4SDAxc1ZYWUpN?=
 =?utf-8?B?Zzhpc0NXMmhVMjJBQnB4cGk4RUVCd2xsOHYzek8wcFAraG5Rc2lFZVFlcVp6?=
 =?utf-8?B?YVdtK1VSMU8wOW5QYjBNSGxvVnhlczkxL2dlSWtqVmZmd3o1NEV1SjJIWXBD?=
 =?utf-8?B?VnI0VWVsZndpRDhWZldZNGs4MlBBSHZTUk9vUzVHM1Z6T2ZCUU1mZVUydE05?=
 =?utf-8?B?SVFkb3ZlcjE3V3FIa2o4NFpxOUJqUG5MSnIzUWJOREtWVWF6RXQ2M3kyc0Uv?=
 =?utf-8?B?NEVrRUYwK1J6eXBvTkc1QU9UZldvTUtZaFZLbms0RDZKRTdFT3JEdXd6RFBo?=
 =?utf-8?B?MFJzaFNqYXFmakdobVl2Tm5QNDU3OUNucVY0SUdMVVVMZytHWTQ4TkUxbjZS?=
 =?utf-8?B?MEZjS3Ixekt0eEMvalQ3L0lBN1h5UkJMcytBb1lvK3BKeHVLZGpTTkFMSWJw?=
 =?utf-8?B?N2xuTGhob1BxcUhoREhHUDBBVTl3bGF1M2U5aVZNNTdiYnBoMFBWN0dRWTJ2?=
 =?utf-8?B?ZHh4ZCtCRXhCM1hGa1NMSFRjWTBQbUFhRHZGOHNsa3YvYjE3aU90dExMZ2Z3?=
 =?utf-8?B?MXgzaVZTQnFNQ0M2YmtSWGFCODFIWXVjV2xPOENEQ2NCRFkyNE1hbWFmeXoy?=
 =?utf-8?B?MS9JSloyKzdBdlFlT0gvVlN5eEZ2RUEwK1BVdXBGUlFLWnRHUmkxbjJ4ZG11?=
 =?utf-8?B?bHVCRHMvWlJCaWxzb3pTRlR3RVphNi9EdU9LbnlnQTlwTTBtanhJZnJ4aEM1?=
 =?utf-8?B?VkY0RUJhbzZiWExBa3FrNHF3c3dQak1SLzBELzJzWm9Qa01TZmIxS2VDYzhu?=
 =?utf-8?Q?keQv+UnWvzHYwjV/U7ndLmlFBGjylQBlSOdYE0/wMlpc?=
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
	S0+i4ZZ7voTmzJvyMM/owf/Q4JODWyyQWfrERo1hV6H1nT5qgymNgpXhdC/oAo4qb7k5qVR7YSVS3GnnMlFu2ega5xzpIPGp7jf4q2fBUtAf/X861HensMILgyT3KW6b2RiRtFjymdgt3iSCX+/GrHdhLVaQ07Wy+HNXHJksKjvaH9IAsakutjPtaLPMLi9wVJlGpK09t1D9IURahrdMwn8ArUfQ3R/tBuUOZEq51Lea19CfEGFTNWTDiROwyhhnf9smkjA+QGJn0kSIJdFVwTbswz2MoEio92v2cQszjYKzfcZmXUbCOY1+3QS1bLZAoH/b3AL6miLKi6rR1tXGukaSu0tfm19SWIU4YRcKAkcSoXa9dVLTaz9n1ejaBE45fO4KN17lDZkuCOkIX7ED0z5LygWt+NRO0wmpHOBkIe6Wcx2sQK1s7phJfZjxPaMEn68MaBgYiiQnXnVmZfP7oGkTNv3GB861NyLsFaM+K0JIlpOoh9m1fHtDdOIwKNx6zeGUnXmQEEQrdkyNp8nnusCf3395APJem8Z7QPWp6PC0Pye5jT0Dbx64J197vg5Q2GDve573xXw6TE/W4qut/rlOeVDFqvqqo7JUoqHS1uhdbzeWptD9R0bXTEvJHpL7
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20af8eb3-deda-4a28-c6ac-08dc7ad702c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2024 03:18:26.2769
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BeVqMlhE30WrV/wSTMduvEoCrjjcXAajVwMjc3Fh28zPOgBYeC1hrRu/iI3siGvQwyx1aB7AyWHkmvRetTnWaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6808

PiBPbiA1LzIyLzI0IDEzOjU2LCBCYW8gRC4gTmd1eWVuIHdyb3RlOg0KPiA+IE9uIDUvMjIvMjAy
NCAxMToxOCBBTSwgQmFydCBWYW4gQXNzY2hlIHdyb3RlOg0KPiA+PiBTaW5jZSB0aGUgZGVzY3Jp
YmVkIGlzc3VlIGlzIG9ubHkgZW5jb3VudGVyZWQgZHVyaW5nIGRldmVsb3BtZW50LCB3aHkgdG8N
Cj4gPj4gbW9kaWZ5IHRoZSBVSUMgY29tbWFuZCB0aW1lb3V0IHVuY29uZGl0aW9uYWxseT8NCj4g
Pg0KPiA+IFRoZSB2ZW5kb3JzIGNhbiBlbmpveSB0aGUgZGVmYXVsdCA1MDBtcyBVSUMgdGltZW91
dCBpZiB0aGV5IHByZWZlci4NCj4gPiBBcyBsb25nIGFzIHRoZXkgZG9uJ3Qgd3JpdGUgdG8gaGJh
LT51aWNfY21kX3RpbWVvdXQgaW4gdGhlIHZlbmRvcidzDQo+IGluaXRpYWxpemF0aW9uIHJvdXRp
bmUsIHRoZSBkZWZhdWx0IHZhbHVlIG9mIDUwMG1zIHdpbGwgYmUgdXNlZC4NCj4gDQo+IFNpbmNl
IHRoaXMgaXNzdWUgaXMgbm90IHZlbmRvciBzcGVjaWZpYywgSSB0aGluayBpdCB3b3VsZCBiZSBi
ZXR0ZXIgdG8NCj4gbW9kaWZ5IHRoZSBVRlNIQ0kgY29yZSBkcml2ZXIgb25seS4gSGFzIGl0IGJl
ZW4gY29uc2lkZXJlZCB0byBpbnRyb2R1Y2UgYQ0KPiBrZXJuZWwgbW9kdWxlIHBhcmFtZXRlciBm
b3Igc2V0dGluZyB0aGUgVUlDIGNvbW1hbmQgdGltZW91dCBpbnN0ZWFkIG9mIHRoZQ0KPiBhcHBy
b2FjaCBvZiB0aGlzIHBhdGNoPyBBcyB5b3UgcHJvYmFibHkga25vdyB0aGVyZSBhcmUgbXVsdGlw
bGUgbWVjaGFuaXNtcw0KPiBmb3Igc3BlY2lmeWluZyBrZXJuZWwgbW9kdWxlIHBhcmFtZXRlcnMs
IGUuZy4gdGhlIGJvb3RhcmdzIHBhcmFtZXRlciBpbiB0aGUNCj4gZGV2aWNlIHRyZWUuDQpTaW5j
ZSB0aGUgcHJvYmxlbSBzdGF0ZW1lbnQgaXMgIkR1cmluZyBwcm9kdWN0IGRldmVsb3BtZW50Li4u
Iiwgd2h5IG5vdCBqdXN0IGEgZGVidWdmcz8NCg0KVGhhbmtzLA0KQXZyaQ0KDQo+IA0KPiBUaGFu
a3MsDQo+IA0KPiBCYXJ0Lg0KDQo=

