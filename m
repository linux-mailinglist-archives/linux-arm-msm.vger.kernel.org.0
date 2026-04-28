Return-Path: <linux-arm-msm+bounces-104980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEC1Nc+k8GlAWgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:15:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA41484B28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:15:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A7CBB30832FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BC893F167C;
	Tue, 28 Apr 2026 11:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="tuYTswMl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011006.outbound.protection.outlook.com [52.101.125.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E003F23A6;
	Tue, 28 Apr 2026 11:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376985; cv=fail; b=r6SpmmzA10zM4vwrzuFY9DTa6MGqeIdCcE18QFM+qv06yiI1BDvz4UBnZAiOhh/TODBYjsqahaHIWHWvKO/cUFaF5X3xEBY5WmrZB6sDIfZHgFaUmiMVhmooE9CG/KNNFiW2UjIIoGv41oSR2YoG/Kp3sgwhkq5HmL30RzqjrHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376985; c=relaxed/simple;
	bh=mccJCZVH1cCLCbd5fiLNU0xwSaxcTwj/oXEMHVlvddU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gb9W38+ElSCyyv3uh8IccIgcMqE8JfDhsj7HSRyNYrmbFzKrkbFzPRFVGIR9Bak2abBKSCem4l4HwoZK0jP/h6pnTMf0xLWLDvhvS3iQTEDBdpSb8Q0/vZfXmfPAlOGPcPXeBj6AikOg7qDhAZ0vBxvSjOxJnBgmQNzeuj79ynU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=tuYTswMl; arc=fail smtp.client-ip=52.101.125.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpN6uRlKotOuaPN46AP+zoEBFJuRTqkC9Ooge4/lVHBIdsOaPZZGbouQetEOpDj1+DsHueJyy3z52KD8EjfZYb1ZurFK9MhVHRmMYIH76WanOoztgB9cpdE6AbXgVCRhFj34DgWTiHijDi0eSY2JX/2D/Kn7kRszjsoSqnexcB7UNw3UeuZ1HdkSQ/5fO6o/WJHozPxCiZcDz6ZNxCJlScB7AF6WBeW/pY6KwyBBBya0AhJ+X1pWzCdeXw1Q7qci5Nt37AhDqthCZBoUJi2mqVO8qFQsZ8YZYa0K1MvgdYcAk4JD9x2pl/uF4031+pg/S3OGFC275TGOotZ1xkvkeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mccJCZVH1cCLCbd5fiLNU0xwSaxcTwj/oXEMHVlvddU=;
 b=Gq6gBl8+0zm7cGlh/DB53K8MGejOuN59qGJ1YfCF3Vfq+llLKfch5nPfX6XPRaxPWdc8vBiTUmUXA6urSQceQqdrL33fsJWXB9MDSHp0yUcVOPWFr5UchnLSAlpKaKybcwE3iP49G4bgEH0iXHUsFtQtgRGe7OJHVvqeZxqnjeDiXQWg4c/YXkVD2Q1ATiLNqJASRhYhecri/F4XsPB2bGXc9S7cG2stmj6hkI6JhfGSLQCKgURC47z0zdqgHhfnb1+xW6tfUNHRYDGrCfbudYqL/GJ05etSNygDGjsULrQJJp19V67CDnFl5QnD/DYay9oOkSdGCEPshpq3ffkcSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mccJCZVH1cCLCbd5fiLNU0xwSaxcTwj/oXEMHVlvddU=;
 b=tuYTswMl4RqOpnZMaORvjgIhgmczHqckYidY0P8+zm9kqm7JxQBy8JAJekrFq4qTuP3iGQKxrHMwqVbDTy5g3eULn1o0cIvW0+v117SN853Jt3t++Kx1Hl72iNpn2fd+6QgPV3M9G6oaqpQtMunsbSvLqyQLuR8y39PNBySS4XM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB10121.jpnprd01.prod.outlook.com (2603:1096:604:1e4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Tue, 28 Apr
 2026 11:49:39 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 11:49:38 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>, Tian Tao <tiantao6@hisilicon.com>,
	Xinwei Kong <kong.kongxinwei@hisilicon.com>, Sumit Semwal
	<sumit.semwal@linaro.org>, John Stultz <jstultz@google.com>, Andrzej Hajda
	<andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, laurent.pinchart
	<laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, tomi.valkeinen
	<tomi.valkeinen@ideasonboard.com>, Michal Simek <michal.simek@amd.com>
CC: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v2 08/11] drm/bridge: adv7511: switch to
 of_drm_get_bridge_by_endpoint()
Thread-Topic: [PATCH v2 08/11] drm/bridge: adv7511: switch to
 of_drm_get_bridge_by_endpoint()
Thread-Index: AQHc1u/CLMxk+VTSG02AXPmSMDjmUbX0WyoQ
Date: Tue, 28 Apr 2026 11:49:38 +0000
Message-ID:
 <TY3PR01MB113466B70BFD2899AB0CF47AD86372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References:
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-8-4300744a1c47@bootlin.com>
In-Reply-To:
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-8-4300744a1c47@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB10121:EE_
x-ms-office365-filtering-correlation-id: d6649449-e987-4c4c-8031-08dea51c3a32
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 2BeoRk+DJjQ2SaA+KKEkZ/Af2iNm9H1RUG/AC2ERUtoWYF5hXBfgvPpL2HmUq2lAOce2fYg8spEXFipSxjv+ICAiKjoIdfRYcdA+5ZV3KZPGBCJNqanIZ61ijsIRwZ99ofYKcIz5zbflAnDoDH39tlGMJP3eQzFEX49XMlBU7fjexN0IrSBb9TX3X9ajktTD32VcI4Sy+zcBDGPzXk2F2tObepL03JEocQrbylf26oR7a/zLkkVgoV+eP+9g/ZiK2qaKNC5EUGJFf2kM2wkP9F/y1es511SXvIcKbHX9akwLxzedEKsqv4wY4+BfNh43HBNhEx4yMO6uQbFrJVeRQ5f6/EO8p2MVLBgvQD6Mjm5HfymacoryWHgiq9wtHA/vwQarwgzw2jo/lg4ZPR8+kqpry/BefELrBlDHaNnszhX/4hycxew6he1sA36JZ15LgK48Zh2zsoInIlmLVvK8dU7/cjDmzNWsXlNJtehJr/5Z6Rrc4x9o3SynR3D/stMGrAdLdIFVvs0Qg+3OiNhtO2oGzyYqpfclNWCQKB4JAlNHTHEWGFbMjsUUGYKmW/Z8aqJxGTXic0d5nTDyslLRZV1vA2Ke4xPwmu5Zv1Svd3VEQVJcvsC94GSwMHaqlW0clSE/tAW+1pjLWw05hxDDtFYY6/Drh+ezhSV+iPn864JxUhxXoOfhzhCz1A+Q1LS+Fa0WEtaV/J3c48r63EYN0OFWRophj+CurJnEnZJ7CPG60NIkhnQeGeQtU1aA1c7z7ckaeGeOXrF8cAPKPlBVF4I3zUips+qNiBV647PLDMhobHiZ+g58zSq4yJaMdyWy
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dTQ5a0wxcG1FSm5xcnpsTk9sZ201ODRYYUozcnl2QVJIRENrdi9jK0oyZVpl?=
 =?utf-8?B?SDk2NXFZN3RYMVVxNHZQbi9mUTNKUGZ4d3lINnpiZVhxNEQydXc2SGNKL3FJ?=
 =?utf-8?B?WGZMREduR2FMM2pnd1NkcTAxcmJGZmFFYXJSdlNVemtYVkY3YmJlNGR5NXd6?=
 =?utf-8?B?OXNpYUczekVCRXAraUdPbWEvMGhYVDFDRXJUV2czeXhKdXlPZ0FWU1Z2VG85?=
 =?utf-8?B?SnJ3OWtlL0kxNFp5UG5LRHdSbUpqN2hkZENsNUtBNk1LSTFOc0t5dWt5SndI?=
 =?utf-8?B?Q0wrdzZYZFJBalN1eFR0NEYyam5nNy9aQlE4SnhjY2xoSWw2Z3FxMS9VS05P?=
 =?utf-8?B?VHdadWVlR2s2Z1lBUnB3elBqOG4zVTNnRUZ0ajh6UVpHckZ3bHgvbjFTdEEw?=
 =?utf-8?B?a2h5YkZWTnB0WkhTbG1FN3lCd2VUM1ZLYk43a1M2RTlBNFpPeG1QMVNwRUtL?=
 =?utf-8?B?bGhlWVk1dWZobVcvUHZvVXRDQnpWcXFDSERoOC8vTU5vdy9HRFYzUStmRlJh?=
 =?utf-8?B?SXFNNjhsOXVIUm9renlYQW1iZXlMaXBoTEpieDFEUFJCNmhHUi9GZktWOWd1?=
 =?utf-8?B?QnkyUHNLaktoL2w1STdyc3VaNGRxYkxzdFNnVkJhQnpzbndWMW91czc5N3Bj?=
 =?utf-8?B?Z2hKR1VlQW03aitnVm1ZWGlmb2NSaERIVm5Iekdkc2Riak8ycVc3SUR3ZFFS?=
 =?utf-8?B?L0ZxeUZhaXlMMGFadEN2dExzb1lmMHBwZlpFWDg5UXBtdXdoREM4bWhEcU1B?=
 =?utf-8?B?U0RycnpLQUFXRFZoNEYwQnV4OWxrZ1IxbzJOTjRuY0p3SlFLNzZFeXc0bGdC?=
 =?utf-8?B?K2wrY1dTcFJaWkRINGhaNHY3OEt0akxYS1dhWVc2V2gyOFhkWExzMjdUaHRm?=
 =?utf-8?B?dUlBeGh5SjdLeDBWUUhON21aWThvWlRLbm9VY2dzUTZNYnZZcXRST3Q1RVJM?=
 =?utf-8?B?SFcwbTlYdG5pOXVCazBHK09Va0RYaTRoMWxoQnAvRVZCYVdtMEJZSlhtTlky?=
 =?utf-8?B?MUpiT0M5Ry8zMHBPVHdVYVpMSnVaTlVuc2tYWk9JbC9HM3NoK2tMNC9LOXpC?=
 =?utf-8?B?Vk1LQzVIM3BQdUF0Qit0NlRyNkZkMTBVbFJiNkhBMDNZbitHNFZiNG12SXJt?=
 =?utf-8?B?Y2N2R0NlbUFpR0RkcDBoMlhJYjJ6WkE3aEY2K3QxUE4wUU5jQWYxamdRaGpk?=
 =?utf-8?B?ZTVsaG5aOHlHOVRUcFV3UlJndXpraHZJR2JZUGl3VVZwTS92c2xLSGl4MCtM?=
 =?utf-8?B?MEF6cFN0N3NwOWpDZ0hQSFZSemxIZGMybjRIUVZWb3RENWhoazRpWXZnQzBH?=
 =?utf-8?B?dGtDL2VWRGd5OElDZ0M3VkdpNXRXci80SUtRNFJ3T2N5enlWVjVzK3VNZGxw?=
 =?utf-8?B?N1ZTTXBMWFkyb25QV09vQUpIWFVxTnUwbEgvWGE2Wm9SRnVNSll4ZjM5bU5n?=
 =?utf-8?B?VTdsdS9jdTZUYmZUYnhPb3VzK3l6aS85QW1uMFJSd29wRVltVGF6U0d5aDEz?=
 =?utf-8?B?NXVwSVhpQnNMcHVhNFZxdjJlaHh2clJsSHFrQ0RaNnJGM2NUbm56TC82cHVT?=
 =?utf-8?B?bncrSmw5Z1Y5d3ZzUUtsZVBVNVMwOWZYWThTWkFEcjRocERRYytXakl1aVRU?=
 =?utf-8?B?K3lZQXpCN1ZLM2gvVWFBVGUwOWRNUEJiWWY3aW55WTFwejlyK3hiajdFV2s4?=
 =?utf-8?B?aHd2SERKaW9ldU10TDlnY1lHdlhvMDNSRkNkRnRSWWVaVzNVTkc5SytHL21V?=
 =?utf-8?B?RU1aOFJtbzhFY0lyNkZ4cjRJMUIrbHVTYUhQQ2JWRHhsOHc2bWwwM2tPRnNt?=
 =?utf-8?B?akJqMUxZZkZjclVKU0lpd252eWNiaTZEdElYS0VlRFF6ZFg2UFZ6VFM0bExK?=
 =?utf-8?B?TlRvOUJuU3JSckdhZlZFRHFkdk5UYmN6U3FKQWFEM2grNFA0RnIwY2toa2Nw?=
 =?utf-8?B?b2c0WXd3UnRZb3Z1WDF0MS9Rci9sK0lBTHhHV0VXaWpBL1dhOFpabDJ3QzZK?=
 =?utf-8?B?ejdXQ0NEU2RHVkY4QW8rdFgyQXNtUFVoNFlXaGhXWVBKMzZvYnVjbHJTWkVL?=
 =?utf-8?B?aFh5R0tFNVJTSWsrZk5RUmF1Zi91Sm95SnJxei9xbHdVejdPTGMwTXQ3NjhQ?=
 =?utf-8?B?djZZU3U4UTVtSk1rMldod2JpREdFQzY5MEJTMXRVUi9tc3V3SDdiM2x5ejl1?=
 =?utf-8?B?YkZPQ1RhOVhCWXNtcVVnUC9NQnpIYjdibEFjcTRHUFJzWks4aEY5czZOR3Fy?=
 =?utf-8?B?M3Z2MDNOdmEzeEZrVHJlK1FZWnhiMXN5RHlmYkt6R0lOUWVGMkpmMEhSZmV4?=
 =?utf-8?B?SmN5cElwQWVjZGJlYUNIdHdpVEdBbVEwVEtOVHVHaHJGbFE0b0s3UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6649449-e987-4c4c-8031-08dea51c3a32
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 11:49:38.7114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +ueGHTTZXiGJHPGqCTIlXhouFwF1FGHVyzab0uct22MyzLRWkhRv5+SpOxLqjOutw/WQGZKs/rMsf/kuFSX1H6GjtaRmBUSgGksCAesV7Fk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10121
X-Rspamd-Queue-Id: 4CA41484B28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	TAGGED_FROM(0.00)[bounces-104980-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,hisilicon.com,linaro.org,google.com,intel.com,ideasonboard.com,kwiboo.se,amd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,lists.freedesktop.org:email,bootlin.com:email]

DQpIaSwNCg0KVGhhbmtzIGZvciB0aGUgcGF0Y2guDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gRnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVz
a3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBMdWNhIENlcmVzb2xpDQo+IFNlbnQ6IDI4IEFwcmlsIDIw
MjYgMTA6MTYNCj4gU3ViamVjdDogW1BBVENIIHYyIDA4LzExXSBkcm0vYnJpZGdlOiBhZHY3NTEx
OiBzd2l0Y2ggdG8gb2ZfZHJtX2dldF9icmlkZ2VfYnlfZW5kcG9pbnQoKQ0KPiANCj4gVGhpcyBk
cml2ZXIgY2FsbHMgZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlKCkgd2l0aCBhIE5VTEwgcG9p
bnRlciBpbiB0aGUgQHBhbmVsIHBhcmFtZXRlciwgdGh1cyB1c2luZw0KPiBhIHJlZHVjZWQgZmVh
dHVyZSBzZXQgb2YgdGhhdCBmdW5jdGlvbi4NCj4gUmVwbGFjZSB0aGlzIGNhbGwgd2l0aCB0aGUg
c2ltcGxlciBvZl9kcm1fZ2V0X2JyaWRnZV9ieV9lbmRwb2ludCgpLg0KPiANCj4gU2luY2Ugb2Zf
ZHJtX2dldF9icmlkZ2VfYnlfZW5kcG9pbnQoKSBpbmNyZWFzZXMgdGhlIHJlZmNvdW50IG9mIHRo
ZSByZXR1cm5lZCBicmlkZ2UsIGVuc3VyZSBpdCBpcyBwdXQNCj4gb24gcmVtb3ZhbC4gVG8gYWNo
aWV2ZSB0aGlzLCBpbnN0ZWFkIG9mIGFkZGluZyBhbiBleHBsaWNpdCBkcm1fYnJpZGdlX3B1dCgp
LCBtaWdyYXRlIHRvIHRoZQ0KPiBicmlkZ2U6Om5leHRfYnJpZGdlIHBvaW50ZXIgd2hpY2ggaXMg
YXV0b21hdGljYWxseSBwdXQgd2hlbiB0aGUgYnJpZGdlIGlzIGV2ZW50dWFsbHkgZnJlZWQuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhIENlcmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4u
Y29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExLmgg
ICAgIHwgIDEgLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2
LmMgfCAxMSArKysrKy0tLS0tLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDcgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9hZHY3NTExL2Fkdjc1MTEuaCBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3
NTExLmgNCj4gaW5kZXggOGJlNzI2NmZkNGY0Li4xMmM5NTE5OGQ5YTQgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExLmgNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTEuaA0KPiBAQCAtMzU0LDcgKzM1NCw2IEBA
IHN0cnVjdCBhZHY3NTExIHsNCj4gIAllbnVtIGRybV9jb25uZWN0b3Jfc3RhdHVzIHN0YXR1czsN
Cj4gIAlib29sIHBvd2VyZWQ7DQo+IA0KPiAtCXN0cnVjdCBkcm1fYnJpZGdlICpuZXh0X2JyaWRn
ZTsNCj4gIAlzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBjdXJyX21vZGU7DQo+IA0KPiAgCXVuc2ln
bmVkIGludCBmX3RtZHM7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fk
djc1MTEvYWR2NzUxMV9kcnYuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9h
ZHY3NTExX2Rydi5jDQo+IGluZGV4IDZiZDc2YzFmYjAwNy4uNDk4ZTM4NTc5YTBmIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYw0KPiBAQCAt
ODUxLDggKzg1MSw4IEBAIHN0YXRpYyBpbnQgYWR2NzUxMV9icmlkZ2VfYXR0YWNoKHN0cnVjdCBk
cm1fYnJpZGdlICpicmlkZ2UsDQo+ICAJc3RydWN0IGFkdjc1MTEgKmFkdiA9IGJyaWRnZV90b19h
ZHY3NTExKGJyaWRnZSk7DQo+ICAJaW50IHJldCA9IDA7DQo+IA0KPiAtCWlmIChhZHYtPm5leHRf
YnJpZGdlKSB7DQo+IC0JCXJldCA9IGRybV9icmlkZ2VfYXR0YWNoKGVuY29kZXIsIGFkdi0+bmV4
dF9icmlkZ2UsIGJyaWRnZSwNCj4gKwlpZiAoYWR2LT5icmlkZ2UubmV4dF9icmlkZ2UpIHsNCj4g
KwkJcmV0ID0gZHJtX2JyaWRnZV9hdHRhY2goZW5jb2RlciwgYWR2LT5icmlkZ2UubmV4dF9icmlk
Z2UsIGJyaWRnZSwNCj4gIAkJCQkJZmxhZ3MgfCBEUk1fQlJJREdFX0FUVEFDSF9OT19DT05ORUNU
T1IpOw0KPiAgCQlpZiAocmV0KQ0KPiAgCQkJcmV0dXJuIHJldDsNCj4gQEAgLTEyNTEsMTAgKzEy
NTEsOSBAQCBzdGF0aWMgaW50IGFkdjc1MTFfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmkyYykN
Cj4gDQo+ICAJbWVtc2V0KCZsaW5rX2NvbmZpZywgMCwgc2l6ZW9mKGxpbmtfY29uZmlnKSk7DQo+
IA0KPiAtCXJldCA9IGRybV9vZl9maW5kX3BhbmVsX29yX2JyaWRnZShkZXYtPm9mX25vZGUsIDEs
IC0xLCBOVUxMLA0KPiAtCQkJCQkgICZhZHY3NTExLT5uZXh0X2JyaWRnZSk7DQo+IC0JaWYgKHJl
dCAmJiByZXQgIT0gLUVOT0RFVikNCj4gLQkJcmV0dXJuIHJldDsNCj4gKwlhZHY3NTExLT5icmlk
Z2UubmV4dF9icmlkZ2UgPSBvZl9kcm1fZ2V0X2JyaWRnZV9ieV9lbmRwb2ludChkZXYtPm9mX25v
ZGUsIDEsIC0xKTsNCj4gKwlpZiAoSVNfRVJSKGFkdjc1MTEtPmJyaWRnZS5uZXh0X2JyaWRnZSkg
JiYgUFRSX0VSUihhZHY3NTExLT5icmlkZ2UubmV4dF9icmlkZ2UpICE9IC1FTk9ERVYpDQo+ICsJ
CXJldHVybiBQVFJfRVJSKGFkdjc1MTEtPmJyaWRnZS5uZXh0X2JyaWRnZSk7DQoNCkRvZXMgaXQg
Y3Jhc2gsIGlmIHRoZSBlcnJvciBpcyAgLUVQUk9CRV9ERUZFUj8NCg0KQ2hlZXJzLA0KQmlqdQ0K
DQo=

