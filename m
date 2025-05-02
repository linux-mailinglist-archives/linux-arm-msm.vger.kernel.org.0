Return-Path: <linux-arm-msm+bounces-56446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 515EFAA6A0C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 07:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D87A93B8FE5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 05:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50EC19DF5B;
	Fri,  2 May 2025 05:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sandisk.com header.i=@sandisk.com header.b="waAsKpen"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08A94C8E;
	Fri,  2 May 2025 05:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=216.71.154.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746162614; cv=fail; b=CaJufsxSH6WdwfvHc579WnpCE91x8XuO9tMGfNX9PBrpQYHLshEgrP6DqKn55mKOoWHYGYkzcHB2FuJ0MrxeFMaEc9pjIUnNrE001+thlpQuqObXf3SKd4YEvTJ/WXicLDsdsMs3XCrvPskvo+s135pkNie915v4LRc9HzcjXuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746162614; c=relaxed/simple;
	bh=wmhaGiSUrMWd478WGEmLchDKHHIUzLrUXGBoCE8bzpc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LsvLQ2QFsxsKj6P6xeslmU9y2QFeYKLUNSuz+AFBCjQPHnd0lbCGU1WwzUphGurrPfAaMq4654yawaIMSJXhVL2W3u9IXW1MUwdfNe6HJwy3gCUM/NUkZ6KkWo0X01AWgOdRqt0ubuxYL6QJTxgxKXPrvj4SQlc1NKO+QqxQv/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sandisk.com; spf=pass smtp.mailfrom=sandisk.com; dkim=pass (2048-bit key) header.d=sandisk.com header.i=@sandisk.com header.b=waAsKpen; arc=fail smtp.client-ip=216.71.154.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sandisk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sandisk.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=sandisk.com; i=@sandisk.com; q=dns/txt;
  s=dkim.sandisk.com; t=1746162612; x=1777698612;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wmhaGiSUrMWd478WGEmLchDKHHIUzLrUXGBoCE8bzpc=;
  b=waAsKpenZyw8wLRwd7Ifj5WGE8A6+gPw7NSa0Z2nClw5MVBwNrqPa+P3
   NY058m4nHwNTc3uXUMHW+hMmq9Lylyse0wpiXkwXlTQ4xFL6LeZoG6MoL
   egLsCeIZix8OTQBVAUSUhf1WEczQzfHIgiDdmjlyxNkPlZuW5BDQyJeQr
   ViGHHWgcTy8epXEmvPSCb71KfaunwObB3Bg2m0xTJEqPUjxqhl47z9euT
   etytbMY+yFfmDRWvwqDx44+zqwuoR4rYp3B85VfU/wG3G8ODeK/3LtLIV
   bW2T4YEPAuJ8ENWoJz1eh8hmMW+WcG4jc0Imm0zoMnmJcfIOCVaY8R+ls
   Q==;
X-CSE-ConnectionGUID: h+JXy4B4QCCYV1a3LkS6qA==
X-CSE-MsgGUID: UA9HgyVfQLyHK3FekOAQcw==
X-IronPort-AV: E=Sophos;i="6.15,255,1739808000"; 
   d="scan'208";a="83066472"
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
  by ob1.hgst.iphmx.com with ESMTP; 02 May 2025 13:10:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oma3+I3DNbd81vkEQWoRAx9Cc/3Nm50GQE6QvxpE4Dy4ydoDdsV5BgGDq1NAZXAiuOLHw1mE3zPi5AgDjzq+hDn27rRLkxXdns7uqu35+bmR1CigkUNiszg/YskzgASDA7D4o0FpL1++5D2UhQIRye2FdhJv5torRfqREBUMViSIgak51w8CS24jaQ5mAPwoj50Y5p/XnRHrZhtg467nqGu+zS9p+AXBr9d1SgPSam+IdOQExEEeQmpOEDGPAUG0oV/E0Y5qdsBtPk/SVosVobliv4CB59hbd44HVOOV+auiLXnKYtOLsAWTffelOlLehsnH9As5pZkGYBRct/c9vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8cHNDGxxHqw/SKJ2PfyfWspueWWYKfGx0WH9MkTPXc=;
 b=LpMx9QFBwtVbXM27ZS9wvtRBEnl88eYJh3PCbQ20qW/kWd0oaI2mNfdb9tJiRsmQP8WCt7HHMd0xZv5iDEL3R/e7IFf4FjF+KUSOSy2q+xQtghL67NPxZG+p6RM165Sg3lE6wHB+PWYEooNvTd8BoUtWajuKkbPJLAWk7H2oGC3tFTydLJmMbpgNBlSzuI6MRXaE12EhnQk037iylv1LcCtSgZXSEfbGDmc2jsnQ7bDjYv2iMugc/8NT+dmUo2STSMjNgT0EYJagSTrXSucrLe2QKS1SiCh69frKVLbuSIhzVo+c6tzPvpA0xCQzy8yrR4WRd9bnvMyi5FPFw9Zv0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sandisk.com; dmarc=pass action=none header.from=sandisk.com;
 dkim=pass header.d=sandisk.com; arc=none
Received: from PH7PR16MB6196.namprd16.prod.outlook.com (2603:10b6:510:312::5)
 by CO6PR16MB4226.namprd16.prod.outlook.com (2603:10b6:303:b3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Fri, 2 May
 2025 05:10:02 +0000
Received: from PH7PR16MB6196.namprd16.prod.outlook.com
 ([fe80::436c:8204:2171:b839]) by PH7PR16MB6196.namprd16.prod.outlook.com
 ([fe80::436c:8204:2171:b839%5]) with mapi id 15.20.8699.021; Fri, 2 May 2025
 05:10:01 +0000
From: Avri Altman <Avri.Altman@sandisk.com>
To: Ziqi Chen <quic_ziqichen@quicinc.com>, "quic_cang@quicinc.com"
	<quic_cang@quicinc.com>, "bvanassche@acm.org" <bvanassche@acm.org>,
	"mani@kernel.org" <mani@kernel.org>, "beanhuo@micron.com"
	<beanhuo@micron.com>, "avri.altman@wdc.com" <avri.altman@wdc.com>,
	"junwoo80.lee@samsung.com" <junwoo80.lee@samsung.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
	"quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>,
	"quic_rampraka@quicinc.com" <quic_rampraka@quicinc.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"luca.weiss@fairphone.com" <luca.weiss@fairphone.com>,
	"konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>
CC: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, Manivannan
 Sadhasivam <manivannan.sadhasivam@linaro.org>, "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>, open list
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/3] scsi: ufs: qcom: Check gear against max gear in vop
 freq_to_gear()
Thread-Topic: [PATCH 1/3] scsi: ufs: qcom: Check gear against max gear in vop
 freq_to_gear()
Thread-Index: AQHbuxpVzzz15RUUOU6UtEfehEb90rO+ykYw
Date: Fri, 2 May 2025 05:10:01 +0000
Message-ID:
 <PH7PR16MB6196FCFC818B623C946BD5DAE58D2@PH7PR16MB6196.namprd16.prod.outlook.com>
References: <20250502042432.88434-1-quic_ziqichen@quicinc.com>
 <20250502042432.88434-2-quic_ziqichen@quicinc.com>
In-Reply-To: <20250502042432.88434-2-quic_ziqichen@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sandisk.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR16MB6196:EE_|CO6PR16MB4226:EE_
x-ms-office365-filtering-correlation-id: 1e2d7e0a-bf10-4071-7f7e-08dd893797a6
x-ms-exchange-atpmessageproperties: SA
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?nmlZGuR0LmSPd1/v0S+ecluiApejxu/pv9bRailFr5Vw1YCNFKV8bEfi5cy4?=
 =?us-ascii?Q?Y+DHXmIi/XjaKDS3UETQSpOS8gnkBCh+P+Wey25+bYUptTwvCjDwMk8+amSD?=
 =?us-ascii?Q?rYGTxYLXzTjip7/UKxQxtLNF0veAodYRrJaiqkXRDrkFs99GvA13/QfzUgYR?=
 =?us-ascii?Q?P72+W2WCdA64U4hIJ2AXQHN3Qmsl2TK4nZvGtrGFCVxSdeyCi1ysZ4cgaiU3?=
 =?us-ascii?Q?1KBAJQhlMJieCzcK5wqxjbkyVorSwfZsn+N4NB8txlPWR0yayYmbZ8zcggoW?=
 =?us-ascii?Q?zLHySQjSMlMaf8CQaWJjnI+dtWTy7Ba9pb3iW10gbzJOBKw4ss66LXxDLmSc?=
 =?us-ascii?Q?J8tY9hG8i5P+gSsORrRXL3gxIWhxvdSIMZ651Ttft8PX/DT9/JBVHZMB6ei4?=
 =?us-ascii?Q?XUNZswYVl8C3rEm4bAPsAjUA/AcTBNN8YtdoBVdn9bTMk65YbK0TxeZ5+Xu1?=
 =?us-ascii?Q?pzgU1dlyedfU49yVegotRz0RXsH0oTkd/JVigu0dCGWPr6atvw8yqWfD3Nb5?=
 =?us-ascii?Q?2+YQYPvUBMaVT5g51IovQh2GY1Db1JZAAHA1wrYrFN4vAV4GL0JDbYtZOoes?=
 =?us-ascii?Q?QfhFjUN2byzaOZe7RGOyECasFWIb5s2m52IiCNFlDY+DLy5IU2sBChyybV/T?=
 =?us-ascii?Q?6SUSTVWQaYVGnsurPfg+z20/M3dtpxIsDn5YmDT6T9MjXEqgtzwTJsdq3z8u?=
 =?us-ascii?Q?AdT+e8zKU+QdWJ+OKmewSttfgbapxenjxh56RjCTr+2/90mCj5NHpvDOXyYJ?=
 =?us-ascii?Q?JEpZB5azRW0tP+K2tJ5ECjD6zyY+Q9wGb94+0lD5XF62nqz2URzrtCKBH6ZE?=
 =?us-ascii?Q?lTo884FNKZ74kcl+H/gclXtSe1d1an9XtGkA7IYyobyxe+DVsdIBORjB9Ec9?=
 =?us-ascii?Q?lXFzgtqZR7ydGPRkDO3zewMobHfKXePbjnWdttTsqPUcaWaIf2lTEuI6VuBS?=
 =?us-ascii?Q?JLagAxzfVCNBG87mMUC18eITrfXfMPkdynS6v4L1h1XhPPLLAZKTbCvO69q7?=
 =?us-ascii?Q?FhpGa3xBt+4U+A0340R28ixcD5z2sv5MoaJI6eP6k/07thO3WDeaHl4hLmg7?=
 =?us-ascii?Q?ir3+8OX658ywEke8gdBKdUlQZPcVMNz3riTs2A+uSyDCiQIwzdh2ibB6v/mI?=
 =?us-ascii?Q?IZF9N9VI1mpEPXxuuZSkvdmttKwCMPrd1vZpwDP5nljETpS3RLcA/KVUoa/J?=
 =?us-ascii?Q?TiBKfT7LrtiCjblcBlL8A4u+x+OBLZU36LWwudrXJ0yiL0grx9TmKUeuVJBF?=
 =?us-ascii?Q?U4Q8O/sOgpSOCfhD3MaZx7yrsHE6zxYrQ+DWAosIl591dn3oJ3bFB/dhW8R4?=
 =?us-ascii?Q?iQuc75SsILfOs2ViwSIC+aJFiKR31cVn0n2YPjxP9y8VCfMYkUMZz3vlnFwq?=
 =?us-ascii?Q?k6UoGAspILdJO5e13Ug/w5FqB6EkYREV2/H8HgionaXYYeN0GIufVIai2z4L?=
 =?us-ascii?Q?3rjhh3Zi1UzmMdH6ai2bfx7BzxoNFun/FHa4v5F+CIw+nyfsVokyqTiCgexS?=
 =?us-ascii?Q?OLHk8Ia+GLYmbeQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR16MB6196.namprd16.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ddvywIhmhKcgskrDdci4Y//QcxOQqGMzCK7So8k2Fg9jWyqPwOAMfpwcATyR?=
 =?us-ascii?Q?+0jZRXAvmDF+AjhDu8A7IOWauIkQfVbbVIfwimQ7c8P07XN71z3iaoBd40zv?=
 =?us-ascii?Q?IeGknF7Z7+WEg3dcPD6AtUx7PXSkJ9BSjBhDGgIMBY+isFqCNXhLMbL61Ups?=
 =?us-ascii?Q?m19W0YYDzewLq3kJ/Leu1kTrTKPVFmCp6sWFmFRzRSWjqE3rYjuXOdjwu9Mc?=
 =?us-ascii?Q?qY5///BHsvRVFwUJKtT+ImQoBHum1KadgBUXPYRYqEq0c8JKHjHxRui/Txaw?=
 =?us-ascii?Q?QK6uRiSvwu3SJmVs9VUHIJmpD17xHr6JRR2uCSi0Vv0OtzBVsDRHjpymPbvU?=
 =?us-ascii?Q?2dF9/w2451ZH63/Lf0CGrehwH+ET5DD4DBQ4G/yNBCq/4Nqiq3/SEgVCdhIY?=
 =?us-ascii?Q?cYyBarNgsZPduXXXS6SsoujtwXc+Mh0ay/MNMz3/6lQEEoDm4uy2j1d5GFw+?=
 =?us-ascii?Q?SVNnvFASIeeqfeAAy7gwehOMK7Py64XVPGehbQdbN3UWt1veRu8DjbJxYoq2?=
 =?us-ascii?Q?lfKU5Wu+K3h2he7bfT7TnIIfqEp4uEXsZosBcOW5DUiGR5YHNF4h22K6BXJM?=
 =?us-ascii?Q?3z1w7Iuztekdn857/DOzTzkXtEzMocalDQSPyD+nwX+gZ1YvvaQko7BGEXQu?=
 =?us-ascii?Q?7ZYxkiBvDPXdBkyIRU3igKaG4UXrEVgrvO+QclclYZ01eiHpDSbVKD2vZ79e?=
 =?us-ascii?Q?iFhqJGlC7NtQG8MMvmj4U5GM2BbLhDe9suzZVR5B6ybA80u7UBRWZiqrIOzr?=
 =?us-ascii?Q?iTRY+ljzNuIh/yV0Aq4SHrSf3l2rlfHZTwYs6h2cTr8sA7eYZJomZZQXG/gU?=
 =?us-ascii?Q?H3Quk1kXNiBeTdfJQMjp9G+k4+Oc44daSDU8XHLZsyyZ+ee0paUg9V26WEWb?=
 =?us-ascii?Q?LnI1INGGxqYF8e1hwHaa0O3JIaTQ9vgRuK5Hco8k3WkjTgaTADVjvFHoXp4B?=
 =?us-ascii?Q?Ozh3mKejz/1BZwHwWD02dEXQfmdsHQx6FdWXanjZXCRsBpdySsMeSIM9bId2?=
 =?us-ascii?Q?t2g2/b59tOtyp8BO91oqf12yz79kP43OVilO7TugJmOqTlECVIGR8fdT8JZN?=
 =?us-ascii?Q?WNMVumscwIgLewiCJHq7VCe/ad3WjnXyzOJtPE4+CNpXsiXNp3O4+uEDPE5g?=
 =?us-ascii?Q?8EaTUSXmiFxIuuVQw4o8mWiVG9+TQzDRjP45zs8B4IFhvVhi7+zBFUSmUqAx?=
 =?us-ascii?Q?zjEnW+A5UJh/oFEswGA1xdWy4bMCz8ht1z/BcFvZO1iLnyL9VySux7Nqsrdu?=
 =?us-ascii?Q?YvyeEMxsbyi5yk9mtBprRAVf9p5FHG78LeNXFXAICAH+7X2eDEhGpVLJ8itK?=
 =?us-ascii?Q?nw/y3x1NFND8h4yOd+TcyQT8ou/CvqMdAbQ7VR1URzkZeC46sM1wT+3Aq6ja?=
 =?us-ascii?Q?22d6/BMjs6EAQdWv8+/zQTXR2IDFLMFjnLXqM5z1JLNcjxvBNJZf+10PFI1D?=
 =?us-ascii?Q?TEkZdj1NcjR7VHy+kUTzbJ2zP7hiG5CWt5VW9t69iDwkpum7PyejS2Pg85kp?=
 =?us-ascii?Q?mka2dItWY2Tz2LFDZ0LEU0YhPnpaNk/LxDO2fVICRoxbxs/ePlREt6jJdUE/?=
 =?us-ascii?Q?ycNZ3IsuwTqKZrjtGRl9ylbkhUvYviOsIIVtDSi9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uo1+smVA9L9+9O3HAX2ygE5k27VubO7r3lmqVz1QLQsijyfyFbZwoIsyLcfBnF1HaTXnSQd4QeOWfT3n5IdWa4JoWJXMmprV0H2/zDZb3UBEw9vi8arn5OhwlmaWgxxaWuW2afTUIxurjvnTM6OborXIIf+MZKZf55S9R1wfNbhd1UT1hk/s4IFuq0uRFm86U3Vc8IrqQlzDqF58DS/S0DBBsu6hPjfyFRQtKnhiFkfwRF1JjnStD/++ajEVxVqjcXsK8v6F9CNCaBnbkARDxo/I8pzTiyPRTnpK/jxlqywIRGLluUWjt4MgE8vCQNcCry6LmSZaULjs0rrZLYcJqYcaUqyvNcZ7nGwoQyxyoWgQ7mHJrRz0Qz+4DgsbRkXcUO3x8V+CHM31zK6H3zn4DAdQ9kmvG9g+eWONE8JpQ90lnbpDZ26PjRM7Ja1HU4qn8DNyTpyNtvBO3F2dpWiUYLP3nyUNLKK6HfaI0zH/ik9EKJuByo7H8pKdBFJSJzlmj8pw0B0XgKdgpN/XfOZd7svKyOd+yUi+h0SzBnsL2zaOE9p12OR49wCydxK8EyqYCNav8+JCUwnBK6oXZKNnUq3m2nmFk85tpYNtQUFCL2peJDDVWewsRuusFSi9wPiV
X-OriginatorOrg: sandisk.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR16MB6196.namprd16.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2d7e0a-bf10-4071-7f7e-08dd893797a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2025 05:10:01.6808
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ffe0ff2-35d0-407e-a107-79fc32e84ec4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lxZAHMXGwN6BittEaa1TJi5p0H3ya71C+VakP41UsXg+JS6Y0biBlUSGNNC3BGQQLp6T4RG2WefwIbzHypFPtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR16MB4226

> The vop freq_to_gear() may return a gear greater than the negotiated max
> gear, return the negotiated max gear if the mapped gear is greater than i=
t.
>=20
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c in=
dex
> 46cca52aa6f1..f5ea703d8ef5 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1938,9 +1938,11 @@ static u32 ufs_qcom_freq_to_gear_speed(struct
> ufs_hba *hba, unsigned long freq)
>  		break;
>  	default:
>  		dev_err(hba->dev, "%s: Unsupported clock freq : %lu\n",
> __func__, freq);
> -		break;
> +		return gear;
Mayby return 0 so it is clear that you are not returning a gear

>  	}
>=20
> +	gear =3D min_t(u32, gear, hba->max_pwr_info.info.gear_rx);
return min_t(u32, gear, hba->max_pwr_info.info.gear_rx);

Thanks,
Avri
> +
>  	return gear;
>  }
>=20
> --
> 2.34.1
>=20


