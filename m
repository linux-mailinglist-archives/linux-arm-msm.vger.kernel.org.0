Return-Path: <linux-arm-msm+bounces-63479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3E5AF6AA6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 08:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C27917BCCA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 06:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6520292908;
	Thu,  3 Jul 2025 06:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sandisk.com header.i=@sandisk.com header.b="m7V4jVf8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from esa.hc6817-7.iphmx.com (esa.hc6817-7.iphmx.com [216.71.152.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AB8291C24;
	Thu,  3 Jul 2025 06:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=216.71.152.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751525070; cv=fail; b=BpraQ0oLwvAtuBNyO2O/vBZUQ5jTaIahtceSvNADRIRlh1Jc/XgCWKksGj6BhHijEGVM7JYtwXnZMLRVKA99863JihMBEi2hlPLqLHmEfoyhJ4O+UzRxQDvdKfITPOXKUjXZfuIpgv9VGrrVMW1EjTtDI0kyWMJH25L2Ptn4wpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751525070; c=relaxed/simple;
	bh=pvyeLY9nO+8d8uP0Is1DCsKI3uCg1RxbDfX5IB4/Vos=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KmZ0YpOSrxqA+S7uG3UEOJME6T2i+aAla5sUsQ8b2y5B1Z7RDXd7SgqHxST/K92kqe+i7RA/YDSYmWjSBw4hLDuS4g6gENVKEkgZ/bXyXELd7j4Ix0xFRiJ+3ZD+NVe7MX+6gDyOAd9Y7l47x+ZdDF0gd+2IaoWRgCSRdF8QbNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sandisk.com; spf=pass smtp.mailfrom=sandisk.com; dkim=pass (2048-bit key) header.d=sandisk.com header.i=@sandisk.com header.b=m7V4jVf8; arc=fail smtp.client-ip=216.71.152.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sandisk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sandisk.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=sandisk.com; i=@sandisk.com; q=dns/txt;
  s=dkimnew.sandisk.com; t=1751525069; x=1783061069;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pvyeLY9nO+8d8uP0Is1DCsKI3uCg1RxbDfX5IB4/Vos=;
  b=m7V4jVf8UwJFYjI5g8O1RAAM1RD6qUMtrhEFM7DBJ+d1NCAlI8s9J5Ha
   BPop2554unnS2dUVWNHN+V4WBxRZcXZBJC0SlLhvmIlGaUJlXG6/7jDbK
   JNM13ZChw7yjQgfgR90ZOVjEkBG1viO3hXsmp0AO408zrdHFe3pqtNB2Y
   E26TVM/3aDao5CZ7qh3Nh+/+PYu89q6f1U5QWu1/ksiWlSeXmYF0T8j8r
   tpHT5jx3psRLD2bFbRgnUnbwe4LevuNkedGT10bWe9TJNt4Cn1mK8Ifx1
   bVO3VsNNeSfpc7l4aLDQXx9wrx6niH1Uule9r0+ZjDhJ05lPEtvY7zAZY
   g==;
X-CSE-ConnectionGUID: Ap0ebfP9TA+aAYIU3c4EGQ==
X-CSE-MsgGUID: mllyo/vRRLimkiJSIBKDXA==
Received: from mail-bn7nam10on2136.outbound.protection.outlook.com (HELO NAM10-BN7-obe.outbound.protection.outlook.com) ([40.107.92.136])
  by ob1.hc6817-7.iphmx.com with ESMTP; 02 Jul 2025 23:43:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ae9NfCvg6bQ5XaCnJxw6K0rvVfYHGcOEr+TzpS8Kn66vh0NETV+xCSTeBKj5ZZjrXYaVmKzd6sZ/wuY4aItKDrSrPijGVdmhKZjRGlkgbV4Sw+px3R/Wh16KnUoAg5treGFwMLJU6BIc6JVOeehrw5smIt78cDE2JhSYFfj8Ha65FlSSS39EzOYrSdUwGGwHd4LeHN8jdy76O0zfrsF4DXfTQEhu01zElBYihyxSAVkSTvFf9MFQylk7Bt3ShjdVZXh51g/UxVjvJXdVuLwizFj/1bL3dOnvZym4zgbwu8LJ8Unem5Eub7HphEVCMobBrvsccm8fL/zVgIRWMjCa7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0Twun3hO+usFKTXfPbNLN3vdKX18sKuNWhcDT3Xjuo=;
 b=Mr/efmrMLIdafyO6eSe0aMP5va9GM1XaTzCwEPbpADSBGHnFAmZH0iCLMcMLlSb13acRFkbotYNj7Uy9wbvVuxLYM8xEvTanUQpKKh0aO8Otm++pNHRYvxt60Ks98f9a/6E4XPwcQsdHjbka0Ke+eS+o9OKCqLHqlmLPS8625TwDZPgFEuwG48lLHxBNbTAriwctHN6Fe8uvh7Q2mAZlbOeFNE6qLK+AYqyVR17Gc+TDLXO4OA1fL6cUcHrQ4zA9W4uOIY7v1+eNZBdtnBKVNR2vufQtDnaP9pOoBVFmqVAbyZe/VHqxzi0s9p9NJNa56lu9SIYQIA6UeN3eUUamrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sandisk.com; dmarc=pass action=none header.from=sandisk.com;
 dkim=pass header.d=sandisk.com; arc=none
Received: from PH7PR16MB6196.namprd16.prod.outlook.com (2603:10b6:510:312::5)
 by SJ2PR16MB5595.namprd16.prod.outlook.com (2603:10b6:a03:586::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Thu, 3 Jul
 2025 06:43:16 +0000
Received: from PH7PR16MB6196.namprd16.prod.outlook.com
 ([fe80::5975:403:10ae:a379]) by PH7PR16MB6196.namprd16.prod.outlook.com
 ([fe80::5975:403:10ae:a379%4]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 06:43:16 +0000
From: Avri Altman <Avri.Altman@sandisk.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>, "mani@kernel.org"
	<mani@kernel.org>, "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>, "bvanassche@acm.org" <bvanassche@acm.org>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>
CC: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Subject: RE: [PATCH V1 2/2] scsi: ufs: qcom: Enable QUnipro Internal Clock
 Gating
Thread-Topic: [PATCH V1 2/2] scsi: ufs: qcom: Enable QUnipro Internal Clock
 Gating
Thread-Index: AQHb62Q/uwNT6TAT4Ui1d8L+Zkc9KrQf9E5g
Date: Thu, 3 Jul 2025 06:43:16 +0000
Message-ID:
 <PH7PR16MB61965FA0A8DFB0877CE51690E543A@PH7PR16MB6196.namprd16.prod.outlook.com>
References: <20250702151441.8061-1-quic_nitirawa@quicinc.com>
 <20250702151441.8061-3-quic_nitirawa@quicinc.com>
In-Reply-To: <20250702151441.8061-3-quic_nitirawa@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sandisk.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR16MB6196:EE_|SJ2PR16MB5595:EE_
x-ms-office365-filtering-correlation-id: 425ed5f3-c22b-4bfe-35fe-08ddb9fce3dd
x-ms-exchange-atpmessageproperties: SA
sndkipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Wo18s/smNcKkxWH6cBE2XHVo73O//Mp+o5v40avOCDDrHJRiZJ+o7o6i0kJy?=
 =?us-ascii?Q?0dLMuNKkCUlMWciwxgZwhyqvnn5Nz7ubNiy7jOlo7sttUZkR7GXhRQgPWlIy?=
 =?us-ascii?Q?86euRaHdzeESYa3joxMCYSe/amYblf1WdrnUlSKKlWhkJL2MYVMYBHu+GGiW?=
 =?us-ascii?Q?AjUNwLohte0ldN08NgYCmSJbcM6Ign8+C5ICN4F+0r8BWQkXelT+04l2fL6o?=
 =?us-ascii?Q?XiK4JCsklGFNAgGv3N28FOW+BiggpJEi8ShRNRrd/JOXc2lpGwAnzc97R6gG?=
 =?us-ascii?Q?uxk50A2AisCoeO4BmBa9PGkkVOo0dactxqA48dp3OiSqT4syIsCIjrkb31nu?=
 =?us-ascii?Q?aaduAtNB1tskcJEX9ZfhGoW7EXTNp8s2yv4M5MxOSp6R8M7fsKSMC6WvYh1q?=
 =?us-ascii?Q?oY2x7dRUuJN3m6VhO4BcOkdbk1CuxSglFtZyRTzyL5E+rwsI8HfKOqJ7shgZ?=
 =?us-ascii?Q?M+o5Aey555c87GRCZthHEjEDjdXWF4TsHncQu5pc0hniNhd3kIgmOrokbMY2?=
 =?us-ascii?Q?bvnQbQ0dDns79Mk1vkc6S2u0LNhsEJHupLlSOjhfAgKu7p+PONnM9Q55dNfD?=
 =?us-ascii?Q?vtVI3VKw/wUqywv8+Mvva7mownjnn2cdQL1alPKYUJDs5vjrUctb15JneSOV?=
 =?us-ascii?Q?1FmrwYC5zl56lPufVE0bb1mLow+G3xpmn4rHNRTt+f83HdJvToC3dr9XmMD/?=
 =?us-ascii?Q?Xp+4ZK2v+TPPgdR8G7AUMLfG9DjyY9VqD5s6ia6fGA4ncuHpDssv1ZCslO55?=
 =?us-ascii?Q?sNtuPv4VD82QI2aNQETsxIbi1P/xPEu6Hvk20SbsmtNv1XWORDpGxeszYKvb?=
 =?us-ascii?Q?Up9YUBr08OBwn35qf1CCc6v/OsKSB4knykhLchoBHMjH/T/hVXnwWWayshoh?=
 =?us-ascii?Q?2gtpH+ZCgBi8xMCnKDwABe1M+1DeQUMPdgiibgS7Rz78MhlDikxUIuLrCliB?=
 =?us-ascii?Q?T/X1rAsRKNJuVKeB2lb+yyOtIxX3nGFFfH7AOdMAglJ1TfSukKrqFcLwvNe4?=
 =?us-ascii?Q?0xQP1e8pLP4ptCsejdMII5kkW/kNCaJO2xZh3+eByaU1iwdswsPOx5FrFyhd?=
 =?us-ascii?Q?EN6KzxVjmd6fOM9mg6Ouh9w17KBncrfMHxXhVdpyj1+S48jEKnPPh7zmAMsV?=
 =?us-ascii?Q?psVkz+NQpG5fSVaxRlsu1JbsAIk90itQNTDNHY0Sh9NHefPfK6Plrrj8LXcP?=
 =?us-ascii?Q?saXUAuWYlkfmd6m3er0h1vcnyFXDWTUUuiDF8EzDLL8ZZ5dYX27a360vQadZ?=
 =?us-ascii?Q?LrplQwG4IRV2nmz9ro+YzbThHNGpq6MT8Ounl22LTYLa9AtPLXIeUOBl6slN?=
 =?us-ascii?Q?pxiVjz943vWMiwPg7HceOvRBmRtYjWRKis7dmu+8P67QBhn2SanrQ/rwvCVp?=
 =?us-ascii?Q?lI0am58CQy42nQXMJtkBJkgxia2E7cDZtaEJaXcJyM2/ymWFm8d0fu/t2B5u?=
 =?us-ascii?Q?Z/MerbPqXnJ+xn3Ht4mPiOsVhGnhOfJoxSQ+yS9xiI901cF4aiNc2A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR16MB6196.namprd16.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QpyW1QlyRtI5D9BRcBoiSwdwWM2COpz0I4cybAGhLFJFoU4X5qPKEYab1WbC?=
 =?us-ascii?Q?ey2C0if3vGiiCS1GoAjingqe5S03isPe6BHmj5P2WaLeaQbo1ZN8bIZW2TLy?=
 =?us-ascii?Q?dtVetuuByUqVPujI3SYp5rNdJ6VRuMhw/8aitVg8wGBBwaxmO810WtOOYun1?=
 =?us-ascii?Q?6SOosOsYFS4CoWoOj3nLgljwavO6AGNExijoTFmCfd5wKfZ13GLx5oyeD+6m?=
 =?us-ascii?Q?dGcjB+dCSzv3uM45KGSHZLvygrXWgcmOiimM7nUMLuLfQ3NThAl/x5NgXICp?=
 =?us-ascii?Q?X4yttVz5pXOcNdgobBAJ3SAFWdgBrIbVuh8KCgOZVkAzdp0Sddmxso4lh8a+?=
 =?us-ascii?Q?74XI3Vcloi3CUaFOTEyUiNDVIOE62U3kL/DMAJZcR4NfJzie9tCEYQ9gzFW0?=
 =?us-ascii?Q?NcITpHOu+XaUQoPwtaoBaSc+rdyyJPjp6+4+lmsN+wEPG+SK2FLxDpgjh1cw?=
 =?us-ascii?Q?FdW+TgiwofEdjGt8XydcaQd58tXfUxDkg90b4vmiUTsS6xHsaO14lgvDooio?=
 =?us-ascii?Q?F0M5XaieyXXMeNaeri9wQceber9FYDR9UcpJv9nsqGWfjF/ZKm6aWfBXAHzM?=
 =?us-ascii?Q?UTtJ5rS3hEkofiCvMYcTeyhjow1cFY5eQZKl0/g4p9U7Er9Cj8B8LjgQA4FI?=
 =?us-ascii?Q?D6+c+gG2VFOm/vKpCp3IyGiuyX0vYgtvZcnhMsLqBuSma3Bxgt1LOnqUQhD+?=
 =?us-ascii?Q?tcJxRkbh4OWYS6jOM75Vvn3bSh8Q+W7TAykVjpQ9cEBJUxtq3glOuo63HT4r?=
 =?us-ascii?Q?qcJtyo20BYHBWy7F3bDAx6yA1xjN9sCEszSwEN7CFMqi2BsserZgnGOwTLwb?=
 =?us-ascii?Q?XNhSl1vqTHUrqtOh1/F+ftlcvY8w3QAPkvNFYt9QDB5spPT8Mt0s33jQ9zIc?=
 =?us-ascii?Q?0Op/iklbE3kHZuAVt7OqS9waOdZNQ2NgBCqcoaH3E9OAZa4TENZTb2ZgQ3ZG?=
 =?us-ascii?Q?ZBDsjvsY8Uh+TS3s0/0F0cX9a3o1JloY5eP8TcUGLpWkHv0CrkYYBFTdwMa4?=
 =?us-ascii?Q?9n9qYmCW7RsX4QOjjTICbmwqkqJFBLH8MJnScpQpJ84p7K6vlCLVRIgU5JLH?=
 =?us-ascii?Q?WkYiQ/Z+4nAfHxYsNZyLJvjlA4n/1jUEOxAzE8vey5Zc2WsPVzpojq6DBX2/?=
 =?us-ascii?Q?MzSnsTdV358IizwdlRZM8czw5lik4xikVtbuFFtbrXyxK1s5puZatNjKzhb3?=
 =?us-ascii?Q?pKF9BwsWP+WoHelFavorEStd9OTNU4ugEuyC7ihRm9lFaWiCLVapy6RMzMGq?=
 =?us-ascii?Q?7EoOt4bF4aHLIbZMRtDhCHbwVxdMky3Xl1gSXXGoPWEVpM1QbvR+vo1eUVio?=
 =?us-ascii?Q?Ua1QbMm+nTRtXsRbs287fM/n0MKTU0DoqZkkNZkFXvybNZLwdZ0LCKRrafiv?=
 =?us-ascii?Q?Bg9Z1ZBEvo56TnNRgCuq//vvz2Dl8w/RShABD6VVixhCng3gpnkJ+xjaqQGb?=
 =?us-ascii?Q?Qir5/XPo68l05GaAUMMdRzHzfWVSRUvhN7YZbos3e9mDCYcQz1psEg1ZE5lu?=
 =?us-ascii?Q?Z4CypgpyKsLFnMv5QbLS2/Bwi6NrzR0YmQbYuLFoF6xUo74J5cF3nFrxRUxH?=
 =?us-ascii?Q?t+ISEA8azS33DIU7GNqVhRmSP4pmdnr3FJL6rU7q?=
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
	6v64JGMR3gv4MC8BbrQTNacnl4WHiHgVwF2RByB/U04gSRyiqFSrZ03jualrmrbcma+MFTXrSNkZQ0RW/vRuv5KZdamK+iTbS2PyhYvp6fF/wxsnvUsfMN912DCTUNkmNrd5a6kvGpJVjHe8jAmkdP0sAxlgpqlf0uv9DerpkrzuHXAnz/6hXUGBg8igJZKtD7m1HWv0dNVTsT8L2Nk1tl5L2w/nrdUV/oEUijNnVJZcXHe226sI/HP7v/yAF7DNoYH67G2UfqD+cYGzwO+YcEojI+eavDfOBZhUITj4mrpsovK+iZCiMIiviKopOFw/8siFPpIKxkA+ydeR7LxRQuAkM7drTttdStj/mMidybSip3hoy8slxrdBPrliE/vK/2+1U0sRaOJ/0o6ucCVIZea15ipU0td/+vxOQH+1E5GRwVBVukyiQr/AAnPfG4uMOBClWL9UtqLh1buAq8nPvp2jKPk00Q0tjeEdCUZsq01Xfgpr72QFeC6xqh1wah80OER7QUydOLfJdExFMWFkZeP+yT4rbankCFBQhmqQRMg2wBFD+axE4x5nMHwoG9pJ6rbYwy5gd3uGYZ3TxQfqcdd4AnJUiEa+Aw7p4UsIU2F3L/3ZMdZReI6fKLZzbUoGOQCKFxPq8EnqMc0DqjYyhA==
X-OriginatorOrg: sandisk.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR16MB6196.namprd16.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 425ed5f3-c22b-4bfe-35fe-08ddb9fce3dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2025 06:43:16.1797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ffe0ff2-35d0-407e-a107-79fc32e84ec4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Tt54OWyJzUOYjlvOCqLGRNrGFxCvPJVEe79NsFJUZrFuvCqxzA0bOFW3y7qXBuCLdJHX+SZHZs4ZlTT/jABJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR16MB5595

> +/**
> + * ufshcd_dme_rmw - get modify set a dme attribute
> + * @hba - per adapter instance
> + * @mask - mask to apply on read value
> + * @val - actual value to write
> + * @attr - dme attribute
> + */
> +static inline int ufshcd_dme_rmw(struct ufs_hba *hba, u32 mask,
> +                                u32 val, u32 attr) {
> +       u32 cfg =3D 0;
> +       int err =3D 0;
> +
> +       err =3D ufshcd_dme_get(hba, UIC_ARG_MIB(attr), &cfg);
> +       if (err)
> +               goto out;
> +
> +       cfg &=3D ~mask;
> +       cfg |=3D (val & mask);
> +
> +       err =3D ufshcd_dme_set(hba, UIC_ARG_MIB(attr), cfg);
> +
> +out:
> +       return err;
> +}
Might be useful to share this with other vendors as well. Maybe in ufshcd-p=
riv.h ?

Thanks,
Avri

