Return-Path: <linux-arm-msm+bounces-45321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA2BA1441E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 22:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56D133A8EA7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 21:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209D91B0F30;
	Thu, 16 Jan 2025 21:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="XLXhivA9";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="QNPwzkHs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFA519343E;
	Thu, 16 Jan 2025 21:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=216.71.153.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737063626; cv=fail; b=SYdcp7m63QhQ/gU+4Q3HGRR6bY8Hiispj5AqgiYmkKnjrTB2RixzjgsktkXvBMYpgMhBsBctYUHvN3jqa7chqO1XG+eICuLOGE2/YFsdkTr/zMSACwT1RgUeRucKp27NLd1Ydpm7mTQ1AsZ1FOgn0ZAZ00E2ypxu8bDCjEdaAUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737063626; c=relaxed/simple;
	bh=A6iC7nGQNFSxb1XlmR9OeXA5CjCq+prOHvDeYNBn1rA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GypzITwj4yAQ1DN2wvng7bbSI0tbzFDol7ROsCyJEO5yZT9h1HUTeLBX4heBPChjzNQB4nfjcFyEqH/vzNbb1EIx8hcYimXZY1q+xv4Y2hjznlaKEG4CqHNxg4Ua4LacWkaRrfkr2jlTGj5Bwj6XEqZyRs0RSIZGUROvrHzFx00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=XLXhivA9; dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b=QNPwzkHs; arc=fail smtp.client-ip=216.71.153.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1737063624; x=1768599624;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=A6iC7nGQNFSxb1XlmR9OeXA5CjCq+prOHvDeYNBn1rA=;
  b=XLXhivA9Jk5FePiH721qedqONPtfON2LQ0wPmz5RAO6LtcEmB0J3mQQz
   ezaBsXg55sborC12HzqvS39NFsTAGavDlKiBizq5fKxC34vShGmy08nxr
   Q/tb+KPCeKzfsccn+jY1DXmTBrwjkni/5/NQwrtvlgjkaz5dV/1se+7As
   SslN+m0z+Z5SJFR3BHaHDHJN9qaUw0A+d+LimA/IedL0XWrof9R50UqPd
   ibdiPziK9OzdJo+kDlbD2gbgdJ2pZi1ijYE/7EEbYNyqzyfzYIBh4zvuv
   hywKzBFSYbyK/kj0yUc5QCY3MltQCAerNZPdRizhTPLlh6aiOJPQyyQIv
   A==;
X-CSE-ConnectionGUID: tAt4LoxJS2CHgwTQOK0Iqg==
X-CSE-MsgGUID: gEozSwbiTB6j13rQJ8dqEA==
X-IronPort-AV: E=Sophos;i="6.13,210,1732550400"; 
   d="scan'208";a="36118935"
Received: from mail-westusazlp17012032.outbound.protection.outlook.com (HELO SJ2PR03CU001.outbound.protection.outlook.com) ([40.93.1.32])
  by ob1.hgst.iphmx.com with ESMTP; 17 Jan 2025 05:40:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UOSD93CzlcVCsmpJBYkag37jB4XvMrBQGRrH8hvRyZF0cosqVJ/OZ4Nt/Edn8SwfD2Hh/pStAsSBY2/XJYTy9mkxm74EPEjcH7rquTrKU8JH4CO4bLeIQqlelIDxCYjZXkUqXxs86G546DiTnkpc3163RnZi1gczQatTpTnN94FiZk5FnTRFYESN3fcf2kvqPs/eA/lnitdjZXUQsJPk2vm//ycQbVBJpOLeX9w9DjfJ4lJzMiYnkTkVCNlxDuKrblVDn5Ol/3sngu8zGHVBibJlm5v4qYGfOLyU7Vjvmwp+exxN8JYwE2/jJLdT8+83I5ayYayCatQ32XfV8DnZ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=viB295I9ZREpTGA57dsOc2gj8qdSA8EOAgwDuYvCXDQ=;
 b=SuKPxWDc4dWwe6HaCv77qP1Vejvx9j3i9tiQrFJi6xIdAByin7+vn2q/6qEKTxK7TFUHBJ5lidoiAPe+QrDW4S/aK8XCzZMxd9uGiOSnaUx1dkznz6wovpccCiBRlH8DeeyC2YcZHTao6G2wGj8vvBCpwrKvVOHdooiLLq7WKfgv2fBr/4OwOQN3RyAurBMerfd2hDza9K8UF6TTyKbWyAxJ6XEWBcSmaSonOXPy2b5QEVX9/R2yRzWs5Upk/WmnYpSfhXJTiOJAiATD7BqjffmVE8xpbVESrxLjlUw8jpZlGRvH6MwYdRAIb74DRvKT4JWuEyiQplxFUobsCaIpHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=viB295I9ZREpTGA57dsOc2gj8qdSA8EOAgwDuYvCXDQ=;
 b=QNPwzkHsoIbTJ086Asil6niCC1okAfcTyeryhgH6p9aB3cKkbc7TirKp3+AT0PFCXzVMKNLaX7iBIYhJzrqHQxMt6khPb/uPTbXkZ3A9rrgd7HMyO0r7VyBVw5P0ru9cR2QT+Z5T2+EtGwWLRqdeYD9ECMWBYq4DRJHtblgsjN4=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 BY5PR04MB6342.namprd04.prod.outlook.com (2603:10b6:a03:1ec::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Thu, 16 Jan
 2025 21:40:21 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::bf16:5bed:e63:588f]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::bf16:5bed:e63:588f%4]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 21:40:21 +0000
From: Avri Altman <Avri.Altman@wdc.com>
To: Ziqi Chen <quic_ziqichen@quicinc.com>, "quic_cang@quicinc.com"
	<quic_cang@quicinc.com>, "bvanassche@acm.org" <bvanassche@acm.org>,
	"mani@kernel.org" <mani@kernel.org>, "beanhuo@micron.com"
	<beanhuo@micron.com>, "junwoo80.lee@samsung.com" <junwoo80.lee@samsung.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
	"quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>,
	"quic_rampraka@quicinc.com" <quic_rampraka@quicinc.com>
CC: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, Manivannan
 Sadhasivam <manivannan.sadhasivam@linaro.org>, "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>, "open list:ARM/QUALCOMM MAILING
 LIST" <linux-arm-msm@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 4/8] scsi: ufs: qcom: Implement the freq_to_gear_speed()
 vops
Thread-Topic: [PATCH 4/8] scsi: ufs: qcom: Implement the freq_to_gear_speed()
 vops
Thread-Index: AQHbZ/bmJwSl4L15V0OHIQ8jOFvo07MZ7jQA
Date: Thu, 16 Jan 2025 21:40:21 +0000
Message-ID:
 <DM6PR04MB6575AEC570DA0E05BCDFADCDFC1A2@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <20250116091150.1167739-1-quic_ziqichen@quicinc.com>
 <20250116091150.1167739-5-quic_ziqichen@quicinc.com>
In-Reply-To: <20250116091150.1167739-5-quic_ziqichen@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR04MB6575:EE_|BY5PR04MB6342:EE_
x-ms-office365-filtering-correlation-id: 12ed9d92-d760-4c3e-b410-08dd367660eb
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?0UjAg2iFLUaFV11YAK2j6iGhJpFAtYIR1fXsSkfL9hcxH9sN0rdqvmhWmxq9?=
 =?us-ascii?Q?z/47IIWlVkR/Uez5LxhzIFzekXuRyrwGgdXXLIwhGbg2EgoJB8T1MHkm4Rfz?=
 =?us-ascii?Q?hfhotUv/cZI9xJwEwC82/r+D0pW/I60DHVcurchK4Ews/IkTS0yaHyYQgmXu?=
 =?us-ascii?Q?ZnLv3Ifsht307x9AfHF6/u4xEkRaOZOBrtGc6f5gnaayMFKfymEYsNaD4aod?=
 =?us-ascii?Q?eO9DdMbu9SAzfgm7gjDp/rHvSY3i18rOzhQXs7L0SZ8v4181Iannnw1EL0WD?=
 =?us-ascii?Q?j1ygm9cBKV0Ih/5E+zVVdGR0Z+Tf7CbFMEU1o+Q238PUutYu3BOvUckt0XK7?=
 =?us-ascii?Q?AYlp1xrculigqzsRXem61wU9XsRmu5OkwEI6zDaN8v5XVwP8KgLUTI02CEzY?=
 =?us-ascii?Q?SnNDofHr/tyls2vBFOkH8a6/HTLbchKlfL4nJSXP2dpggr4ZTTgdvB/W3hph?=
 =?us-ascii?Q?ZcLpHVQlATUDU5/CWJIaW0ecHz6wuMDwy6M4siqZyVNrMhFzRxjV8ra4y3On?=
 =?us-ascii?Q?RgU7Ee2agrxxl1mZ5eoigoMILhgwwEaVXQpKXom1MTXC0vu8umZCHisioK4r?=
 =?us-ascii?Q?vGoklo0X/Ji0PUnz45rdAsPKq4Nh2hxG5exPuY4vH3k3qUPXFBWE/Kosw/x/?=
 =?us-ascii?Q?Xk8Ky1DatVjS4aQTdW5VAYY9SHq4+tPlsSx1xGTWtXTWiuATp2H8TSEPWdRH?=
 =?us-ascii?Q?ilNE8Gsj6WZgng3ipAZFzrHnkWQM3xmRpt3zSzogJ1gelIVA80CxZ/MYlb3a?=
 =?us-ascii?Q?ByyjbAQ8xSCDH4g6Csxf1Tvyw89gV40szx8kxi5JkHTvvhwa7oxOvn0RY3Ie?=
 =?us-ascii?Q?unzJ4GL9qTN+abAcVBceL0PgccwLPCyvBgmQHoqy2O+vMRo93hgsRdrb9XRJ?=
 =?us-ascii?Q?oVOxPJWJU010xuhjciWo1/XJa+IVObE2x3Ytr2Ktgh2KFnIwe0RVoK/yZ+ps?=
 =?us-ascii?Q?bIr7PiWAUjIntbVyE4VmcihkHbt/5HC5S5ZefvQ1azmQ+KgM6uLmXg+GLv2b?=
 =?us-ascii?Q?LV9XlawjyOD2loeBQFqGvl6P/1T1LCQm+vUDGpdKC/6fLCj1a/QsRI3/+pCk?=
 =?us-ascii?Q?soV/mDBsbszlMxk2rzaTD6BI7xuf/Esb8bbJt1eC7JulxTikuWDB0V7Wjc78?=
 =?us-ascii?Q?HPms8mNjcfJ+ZZW7qTtklpfGT0OGjyNRW/W3FQAVwtvD56UMTOR5Z4gnhSxT?=
 =?us-ascii?Q?gTB7nkSUEqpJODfPYZGWQhzf/rAseV526U1C3yd7kg+KOyqetalgNWDjt5gh?=
 =?us-ascii?Q?ZE2btyWamDGqhsQO6mrWFGF2BXybRQquyO2riXLILFCGlzUHWnk6UQUOIm60?=
 =?us-ascii?Q?S/ERkB0Ha9xLm0IuUo6cjGQwgihNe98q/Fms+LL18zOTaCmWqdA05jJ/EUQi?=
 =?us-ascii?Q?YlMkjoRvUCFeo+t7XRgR1qYQP+g3NLsBwv0+cx91u/l5Wgsf4I/TDlq6gJpT?=
 =?us-ascii?Q?xrw+zx1GBsuIIR8qqqKkFw3MKUSGizR2zOAHpkfuAj/JeOLMIB8OTw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB6575.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?uFjzg9hbU/RJ6fK/z2ECVkGE8MWlZGjjrD/Ajk9ZNJRzZEV2aknkxX70zKxZ?=
 =?us-ascii?Q?8A059hcm9zSdIqm+0mAezswxY2gov+Zp7F3NCechVbZXJhqowK0p33+U7Rcz?=
 =?us-ascii?Q?Va1Sfhb2E5qApPep3zJoZrKZMHysMVz28HCGhnsMPgaoS1BCtxEZGEnFMsH/?=
 =?us-ascii?Q?QaDiuivUP2JvC2Zg6LsZQrGAnQTRSZSPiwugXeK3qbqfNKuTZxaeE2YXCb2N?=
 =?us-ascii?Q?7E3CDUgc8jyo/y85xkXPaT8mRIH/8pdmdmfgQ1UnXOnBoiHqBP/HPFcST/cC?=
 =?us-ascii?Q?QNsJUn/iC0lKxytM/FezxkJCkL9aWMe4MuzTjAjoPnaE9fQKY0ZkhHvT4UYQ?=
 =?us-ascii?Q?GUQgszI4xJ7lCksCxu/0Vp09q4NjtOq1eJz90WpoGlcUXLJbgqSOn+7FArsU?=
 =?us-ascii?Q?fzCmPdWK8ZKACtDw2ld4pQyOUpMrbwWNGmtqZZRuOU+eku6hs95yLDDRteQl?=
 =?us-ascii?Q?/0KLvntCqiKKWARwOfsw58vdCLLvaByuKqA/EZwlYmJFC4TB6zZh9hOUaKo9?=
 =?us-ascii?Q?s9QbSm2ojwZqq+cGaUufm4gmuN8xZzow/0A9dn2YhbkpG3R4HiDCUXUXEkeG?=
 =?us-ascii?Q?pcfWWd8Gx3CU2oSQtOGJMm/0FcHArmyxDC+l4wgOss/1MNuNOLN8cbgdi5Lb?=
 =?us-ascii?Q?owzsIri4yLaLnQLGBDucW4IFcRvQZPPTJJvL3n7VpNBOGPgNjTNGgNxdJi4h?=
 =?us-ascii?Q?/AhRdSPPtb7oiYbFAEFQcie4uz/oZcu5y05hAUioNyl0S8+wwIIoPki9U/2p?=
 =?us-ascii?Q?2KloKwDHTbUTFFy68x/0fIWAxRvwMiXAFX8uJrKsA0e3WQhCvblG845S+ILL?=
 =?us-ascii?Q?QdKyniq2SONRH09YGkpF55kVk9xywitIrcJv9PAtHl/xv599rufc6wnPWaFM?=
 =?us-ascii?Q?jzVPIaxoO5lv27X+fxfHIp/JAfpZ3AIszT42eWVN2I08qdwtpHrQCPLGA64p?=
 =?us-ascii?Q?rYThD2Zzdy2/Tx3JYlsakI6iUK+utLzN0CKuNFwFb3jC5RN12zwV4ckGxl9R?=
 =?us-ascii?Q?TSeS0Tc8qmAC3MuZVHt5SEvgjMXc2IDOJc9IIhgw//dZxi2LzshcelRHKq7Y?=
 =?us-ascii?Q?UlcMwLcgAHC0k6fpuqepOV6loLPfiCSPiUKSRnPY8X9FojjC+9zDAdTG1OPN?=
 =?us-ascii?Q?SgJ6OTTJr8sk4Xog2SWe1FtpPwIISCoB5ynw+XSsqNd8l5fI8yK5l6nVa4cQ?=
 =?us-ascii?Q?glAh0zeGkqUzsiRfatg2Ii4Y/AUuH/cf7ArVogXEvgrQM3i9TdEd414gskdL?=
 =?us-ascii?Q?le5NjaY3jizkbf8IlktxmxDuxRYc7K1K4rTaW/xcsLkHZ+I0xCt8Fk0+SUPE?=
 =?us-ascii?Q?EuZ91yy5B+Hdkinq84KQGxn4x88PGxcUvg/j96yGWvgBA2lP63jS9Zm8OX4F?=
 =?us-ascii?Q?8L4SPRVKpJ6bsAPH/z8Zq+0KhLI4fATmoF045h5IUeQ5rHYZmt6c9gMe2jPg?=
 =?us-ascii?Q?pRL48rhdmiTFgfssAHDeEPIZARJXs6l8iIFGD5nAWfLhcLsoBzpmZK1WhdUi?=
 =?us-ascii?Q?P6joed6jrDq4cqRY6+DBGmtBFiCyGlhNj0oMr7iEUuIOBSyFn47OfUJ5346b?=
 =?us-ascii?Q?6ma43wWmHpNxKBtwkN2xq41mKKWocVaur+8yFqln?=
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
	BIvoSYHWF4ybvd8ZP4a3EtI/OpVe/e4QbojaOnqnigOyvIHlDNYN6PJ3inoI7nk/s74s2fQEhkKS9ZBmgDdkdSfYKDYTrT2T7xTImuhTvnWbtAO8qO0xi0TXQ1QEMxvhZJjH/UXVYLzmLBw7Lr1udynnKQlmol9dDfAqeVQXaQiHixqqHmllfLR5UzXH8OL1ZyfUOvY9FKXcro7ra2qjw3ceCt+i9MDzkKMixNffvYcUe9nZ7aYJg9lFEgDZZGs1E1WlMeg97J/nIJCTBUTkbybGdfxBTzPGmVYAiNGIeRv2b8sbFOK44mxlxrWWLdRVPtUYLQDyWMyB1/fFUrzYAIcK0UIDBcSg0W8vw2r6vG+htRunxIuvissqhCFkH2xz/XBe5PBy82BW0P8aYXGp8Ax+L81ZGFjhWU9ayyUylw/BUmZo1LG3IsFsR08nOjQn1QCh7W0D+B7hWESrbrODydzaWE8sOr6Abc8GMOgD1VOANR7haWa8DKxV8mGe2yCepF3+x02HOnCoAFIVIwnVJXjkqlr8gA7ohum7qRn/L0arxHZIqRNf5wt2E6m9aOKlxeX7Joo/JNW7AFLwJyGZp2lm+CBkaieGjt7XgvB1qUF5j4VQ5Mdqu8LY+klg/5o4
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ed9d92-d760-4c3e-b410-08dd367660eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 21:40:21.6427
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IXp3NwvHQIRgmw14DPtD0ntfJrdkCoNUbJfILG7Es08R4K4qMXxtaHwWFT7meIOkzEDUyJxj7jrL+DdHgrYUCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6342

> From: Can Guo <quic_cang@quicinc.com>
>=20
> Implement the freq_to_gear_speed() vops to map the unipro core clock
> frequency to the corresponding maximum supported gear speed.
>=20
> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c in=
dex
> 1e8a23eb8c13..64263fa884f5 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1803,6 +1803,37 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba=
)
>         return ret;
>  }
>=20
> +static int ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned
> +long freq, u32 *gear) {
> +       int ret =3D 0;
> +
> +       switch (freq) {
Maybe you can use here the UNIPRO_CORE_CLK_FREQ_xx ?

Thanks,
Avri
> +       case 403000000:
> +               *gear =3D UFS_HS_G5;
> +               break;
> +       case 300000000:
> +               *gear =3D UFS_HS_G4;
> +               break;
> +       case 201500000:
> +               *gear =3D UFS_HS_G3;
> +               break;
> +       case 150000000:
> +       case 100000000:
> +               *gear =3D UFS_HS_G2;
> +               break;
> +       case 75000000:
> +       case 37500000:
> +               *gear =3D UFS_HS_G1;
> +               break;
> +       default:
> +               ret =3D -EINVAL;
> +               dev_err(hba->dev, "Unsupported clock freq\n");
> +               break;
> +       }
> +
> +       return ret;
> +}
> +
>  /*
>   * struct ufs_hba_qcom_vops - UFS QCOM specific variant operations
>   *
> @@ -1833,6 +1864,7 @@ static const struct ufs_hba_variant_ops
> ufs_hba_qcom_vops =3D {
>         .op_runtime_config      =3D ufs_qcom_op_runtime_config,
>         .get_outstanding_cqs    =3D ufs_qcom_get_outstanding_cqs,
>         .config_esi             =3D ufs_qcom_config_esi,
> +       .freq_to_gear_speed     =3D ufs_qcom_freq_to_gear_speed,
>  };
>=20
>  /**
> --
> 2.34.1


