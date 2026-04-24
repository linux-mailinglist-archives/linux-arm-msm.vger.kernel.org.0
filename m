Return-Path: <linux-arm-msm+bounces-104378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sL4pJjrH6mlhDgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 03:28:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF6D458B9C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 03:28:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19F95300FEEE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 01:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388EE244684;
	Fri, 24 Apr 2026 01:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KABMhpmI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D6423EAB0;
	Fri, 24 Apr 2026 01:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776994057; cv=fail; b=UrYd6Ii5QjUzihz0fPMnoztFnh2FuMXpLsw1mcGRvG0ya50llWAYu1ffw9i6xZi06XRUR8eBhXFIVWtB2Ix7WlurgcnRnVG8xDF1yaJEYYx8KJ9dDYB7a8AyQNRbFcZAuNVsJimJZ2nXnDb4cXiiD+4NVB2A8ySB8DTdUCUTzmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776994057; c=relaxed/simple;
	bh=S4PIxXGjWbUWiQwx9y9t/mefAd8dOrszDPDmoBw7JMo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JgKciZeecK9QQBIG2NV+RMZSP9H4nPf5/2JnQqLHSs3rjP6Y3QfExNIGHhvPfNGTQE8nQiLEu5y0TbT4k7pvDvxWgO2gBZdnWfOIG45Qyt6+vSQvNh1d/5jo5M84DNiq3dFPSkyYe0+sgmi8EG5omHJts1ZkHGQ48yG9gE3h3DE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KABMhpmI; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776994055; x=1808530055;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=S4PIxXGjWbUWiQwx9y9t/mefAd8dOrszDPDmoBw7JMo=;
  b=KABMhpmIMrIPjBhYbRDzJMG9BdeayD8F1A8wtDhRNAK66xRfwNQyt1tj
   11ic4RCgidVFjZ/D7qIYLZ3WAHyhSUT8xnuW0twpxrhmsC38ptn5nIyMe
   gJUl2tLPDRJrZ+HX59b6+UDt6e6Ih4IuJj2oUggamBcnMj8ccEjntN1Vu
   j3MtJX+gfT20kRiWo/ojKyn/jMZub4EOFksSZLQbebf4vR8UAaobypCq8
   yUhvtwwXls1uMdqHj5N1K39H03VfH+asf6CXVOS786i/zIu9ycvjZ4M9g
   yAUyrKkUyKN5uP4c03zVEwrezuUeOfzkOr8GlPMXxiJsIgj0Zdzv/h5jK
   Q==;
X-CSE-ConnectionGUID: XrZnbA/NSSWdU8lUhwnlRA==
X-CSE-MsgGUID: xXxwAlgcTNyZoOf/EXUSMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="77004542"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="77004542"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 18:27:28 -0700
X-CSE-ConnectionGUID: qJ/IKpH1TaGOix6gzdCZdg==
X-CSE-MsgGUID: IUBqItOeSHecdhKjnDnDbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="263214783"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 18:27:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 18:27:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 23 Apr 2026 18:27:27 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 18:27:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vl3CeWedEARzszt0eclA0KuIxYF4ByDLJRAhdYp70Kk12UDaNRx8xKOJAq1zraZ7g7F8459WDRqVm/4yH1E8y4OFWo/+JbSz/4hPC4EjB5t0Jy0ppBRX+Dizlg8KYuSXDPNpdlyhLP2Q77uyvmqBjpGyuv/6AUMoK2SgyNdJti3gGuuiNUahKkMv2R9Z0VjnMSD4ez5NwhT4rYuLvJRFcQMXeTnxH2TyiX5WyObhg5eufCnJFSksM6LiiPPBdQhYSsdpoRxHW9DuxdplVlAcigKy6B/q1/fu7wW9PNLFWZaTPNeBKUMhqcwPqBdr8Cx1bGmzvJ2pDsV2c2FpXKazmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ko2nZQVT9OZLFF1tsUfw+YRPE8zMi94ECqOl0BHmI/8=;
 b=nGS2OpSBih7izhOtmXh03M5XaEpTHgTmbEDxgRtcSCf1rFFd9eY4GgYN9E44c+0XomdN6oVdJU0ffClxQUC983i8u23xNM3RnK/exSpagwTuN9kSFfAmfjzzq7zw8a+I6mPBkcFaAtB1EabHarpGp76Tm2n9UyEqc5yJ99jcmM3tcyt1ASNNeht+I3FfHwy8SnenJMdqtuM0fwEjILtBSa8aFnGFC+TCK/WNEuQ1wc4LKjwC5oBZ/ZKte3xVyLuvm5s+pR5nsWJgh18WRm4UWMVFDhTq91O+4PFN8xH8QzFXQrmtuBJiukbal2Di4+MD1QTfkP++8UgDmcrIEvLJYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB7130.namprd11.prod.outlook.com (2603:10b6:806:29f::10)
 by CY8PR11MB7394.namprd11.prod.outlook.com (2603:10b6:930:85::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Fri, 24 Apr
 2026 01:27:19 +0000
Received: from SA1PR11MB7130.namprd11.prod.outlook.com
 ([fe80::fc98:7fe:bac0:f2d4]) by SA1PR11MB7130.namprd11.prod.outlook.com
 ([fe80::fc98:7fe:bac0:f2d4%4]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 01:27:19 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, "Borislav
 Petkov" <bp@alien8.de>, "Luck, Tony" <tony.luck@intel.com>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: =Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>
Subject: RE: [PATCH] EDAC/qcom: Unify user-visible "Qualcomm" name
Thread-Topic: [PATCH] EDAC/qcom: Unify user-visible "Qualcomm" name
Thread-Index: AQHc00fmQtjmjiMybEyalPfkc4tyzLXta5gA
Date: Fri, 24 Apr 2026 01:27:19 +0000
Message-ID: <SA1PR11MB7130FCAF48A6175F48731E7C892B2@SA1PR11MB7130.namprd11.prod.outlook.com>
References: <20260423173558.92416-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260423173558.92416-2-krzysztof.kozlowski@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB7130:EE_|CY8PR11MB7394:EE_
x-ms-office365-filtering-correlation-id: a1c6a75e-b4dc-4457-76d2-08dea1a0a098
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info: 6ShPiLufm7VET4mtsWrs09IDPy2WkO7zKi5T3dkRK+3CBYQGuufq06vXJS6kJeH9B4zNDe0Yu+8mla4Zdq7F54W7jGn9fIHT3BEtwZtkpzqMos4VfIDzkhWkfRxoNssLv7N1QA5VV8GjvZfr8ClYQnqhkOSPfCg6yyQQT6vmaK6cfjoubKkAe/xD8Z1jIEltLCKxmH0cs2JfI3QQh/KvPc40K/u2SZBrzfYNP2ofOE2sRSIBbihTDGnoVchvPtXiylDAaOIu+d4XmJxZE794uin0r4bW2y6onZwKiE/GPis5yGZTcJf5/XreevFHSZEv6wHvGMc5aEli7rFNY024NPlb3HsK+eRjSGMDuyotaf9weGsIMWsQFsM23PIcJUhtYgbL4NStkIYvj6gnbdAlErKUtfhiMpTPBcIPWrRsgKyIah6D8WxzJnzqMZ1yY8GQpaLeXc0W13Ae+AoMTaMuSJ+bNloYz3V1rCoKPoKz8tN8OemBzP9cs+nJZdMKZ9C4elpflTHWEhMk/zFQwEqFGD/L5+wN2EdQf8xdIhVWV5bfdPPn/aBdKtYKPFkuIUigXqOFXeKsQJka9wZYwN4Kt8TcD2Gd4AOYkdJJL5+TR8D/nGQsJnhsMHa8Uwyek2skQxabyvcxG25IHu6FZRsqXzOt3BEasJIKWy7vCSfE9Lkpz3SsEq59W6u2Ri0b1VlQaVlDTJ/M1bOlTIyVKleWQzcqRpX1oqbrle/RO9NM2xyk5hePxB/vJINhMPOSjQN6TXYyQrfBDYF9RuO1JPwiGsRVX+cvkBDoWWuLflfmas4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB7130.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CVfloOXUsGC85LP52ZgIvCYAzec5nn1Rrx4ZkvnXwDwddDnKLrEKjtRyh9gq?=
 =?us-ascii?Q?RzPrU+BP/CtsxDf+YvnWhRZ0MwK+EwSRvear9lCqOd+KC0d1OiwNQPkoY5FY?=
 =?us-ascii?Q?02CIOcIpR48ptNtcNa9xH1Hln9d8epDzsQIrcFV0pVxB9BfI90wKbuQ36sdG?=
 =?us-ascii?Q?r2pJ/60cTU9qa2Zqm4bZuVLXewXOVQFiCHoOL7xm2MlIheaR2L71iyZYrxBB?=
 =?us-ascii?Q?S+QjeV92e3Bj8wcWoOOox4WMKERgT6kgjpqzeiZla6CtNd3vp39o3E9qiZME?=
 =?us-ascii?Q?9KvDzF8GxNJzDdz4jCOva9HPPoWs0fQBAXq9BBglyYgQpIPq1Kt7IcCtIV85?=
 =?us-ascii?Q?n6d+MdyS/wNtjaBrspOqOgrQLMXzuEpx9GE0v66ruyJTj8Vw66fSnQ2Bp9kM?=
 =?us-ascii?Q?niOh9yNFewgaYEzCNFon0RICUPoFeiW5bJrMdRgtxleaVf8dzaJHmatz2TVs?=
 =?us-ascii?Q?+S7w2IoZlCkJkS68T4mFI4SB8p91jNqEXqaD9O0bDLGyrd7wxEKhqznybuwi?=
 =?us-ascii?Q?s9GfP5xSakAEW5iR4XPzf/zsrEAPUh6O3aLN74zTIAoV5mEBhvyVjF4n6rXu?=
 =?us-ascii?Q?6ylVIq3RHG6JQ2UWxW9su5T58uZob0p5XFJACXi4dgNXz1qk1rQnj8Cm1bPT?=
 =?us-ascii?Q?pOisEUbf++uyLPxynMnJMD4CmL8R5z9tBu0StGt3cTEcS7gJpV8Mn3RSaTSH?=
 =?us-ascii?Q?WKH1y3yw4cLwcZkyKd+NuTZCgEJQ6XopSNbVBtdhb0fBm1wViwNhisE5vlOU?=
 =?us-ascii?Q?uWszwoI6J+mzUUA6PRUjEQq5BkXzo0kuGl2dM3apdszblj8pGrl1sfqCSh78?=
 =?us-ascii?Q?JB2P3HsCtOJB0Q8c4l5dCAFzr8WfhO5fHR56d25A1pBJtPuOu1EibTSYJ5dy?=
 =?us-ascii?Q?izHN91OoVYWqCFdhvMwsaYKyEDCVIivw0vrliK3zsjEiX1rPTxBu4XyrTRiR?=
 =?us-ascii?Q?Y8cmufVO5H/6XmXQe3HyD0TnD+IO44SMdAwULPhDj9akFGdQKOcNk9fFPoqF?=
 =?us-ascii?Q?JdYbOICl8jsiPykpew/JXrRMIhz0B9rZjEbk8AWyAd7gEexmncsA+gl9/fR1?=
 =?us-ascii?Q?NUZP1TK7wvI69FlfxYNX0FoaasQ0N/BDlNzcGc2jbjbCTHAamqEC9Eyae8Qd?=
 =?us-ascii?Q?oUIQHZHEDq6OQLjfy0CfqpKNrY7DuRp0QCH3zIlBodSXFe+8QDyZReHn48u1?=
 =?us-ascii?Q?nc2XHjqgAnc9dFUhDar8t4rLlqjMhlQxwGA+XSdj+fDf1nBi8veHy1VxUvR3?=
 =?us-ascii?Q?nIO098Y52mjIlItjER+OxMv9J8mmNWL6JUANBA5EkPB2uMuIBXUwP6vwaX5V?=
 =?us-ascii?Q?2PPksBuwFI5HJuB91Mgl74maXEV8f/3OwLZPOhCTPxbCuETZi7+dqse/mgkn?=
 =?us-ascii?Q?q92IlSpQkZU5Oz+8WLM2an7gv5QdrvXuOY0Zvm4DZ/h6u69fhf04DfvlOWO4?=
 =?us-ascii?Q?O9LDJY+kSao5j2BsLlPmynzUT30z2wJyqHdQVSJn3lAKUjwXK/tvX6ptcvjM?=
 =?us-ascii?Q?k72AIwaSV7g9ZKWXSFEpAO4O/LriPp5kS352ANhLc7p7d/uJpRfJveQXSy9R?=
 =?us-ascii?Q?OCmT7RmAWGkxzYfD4TKWn6ABabItUDSf+YU0QPgqsJhOhmKmQfw2ji6s6mm4?=
 =?us-ascii?Q?hofUvu/6CJBJAxibdhwFZFqUrGIRjXdNOgRGJxKNDQqfSqqvzsyeqzTaFAWd?=
 =?us-ascii?Q?taDwomrC8PGD+NRUZVyBfNB3Is8bzEPR05Fg2f5/TRWn4SGXeWJoeEfM/9Ht?=
 =?us-ascii?Q?YU2+nWI8Iw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XtlCwDVx4d8XWmjjuDoeFNqP0dXPXm0WWZMMsBDrqtVrxmK74jjqQNR0Ick8Pf7r111VpksMBn/kcv9R0nfq8XasgrAaF59FEw0/+4zEqCtKwHPpAxelWiFFGVmDrIZ7BbP75PXbp1jeoFSD0G7lghzsnwHPCE4q+kv0ku0iMzClHygGVBbPDZOAsVdbKOMciXIPndTt7ltfbMc+SScOpBJY+ppU1AoU0O+023FlTbojIvgxdktngE4mIysFgkjtA7A5AU5YXQUtOksO6bmjrNscEaE2KBLSLfEzjuTqr5dCGp/61RmuWApN/kG2G/OgVL+MgN7ODWmk0OxmPbV9+w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7130.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c6a75e-b4dc-4457-76d2-08dea1a0a098
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2026 01:27:19.4093
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iBytm7hlJg/lPBG8Hli8iUtFFi+XCGYgc1hj45YG7ALkKWpPexfI2rAdhTS3wPpqNZHPNSFZ1j1SX4jLazf4uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7394
X-OriginatorOrg: intel.com
X-Rspamd-Queue-Id: EFF6D458B9C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104378-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,alien8.de:email,SA1PR11MB7130.namprd11.prod.outlook.com:mid];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiuxu.zhuo@intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]

> From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Sent: Friday, April 24, 2026 1:36 AM
> To: Borislav Petkov <bp@alien8.de>; Luck, Tony <tony.luck@intel.com>; lin=
ux-
> edac@vger.kernel.org; linux-kernel@vger.kernel.org
> Cc: =3DBjorn Andersson <andersson@kernel.org>; Konrad Dybcio
> <konradybcio@kernel.org>; linux-arm-msm@vger.kernel.org; Krzysztof
> Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Subject: [PATCH] EDAC/qcom: Unify user-visible "Qualcomm" name
>=20
> Various names for Qualcomm as a company are used in user-visible config
> options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
> "Qualcomm" so it will be easier for users to identify the options when fo=
r
> example running menuconfig.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

LGTM,

  Reviewed-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>

