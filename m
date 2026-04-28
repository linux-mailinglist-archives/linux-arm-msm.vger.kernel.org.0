Return-Path: <linux-arm-msm+bounces-105040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wACaHcfV8GkSZQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 17:44:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFD048820E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 17:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53EA03037E59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 15:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6D629D291;
	Tue, 28 Apr 2026 15:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="aOHmN3FL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011042.outbound.protection.outlook.com [40.107.74.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB5F3932D8;
	Tue, 28 Apr 2026 15:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777390904; cv=fail; b=P9sW5fg80oV9vbwds6pOEWkSO6fSmKgrWSIUgTYn8OjF0vYdnvsPszRAdypi1Hfoqxw8wYGDopOPemv3M+qdAhWS08PBVIpGGSEwhaMlBn4DSvbovf1ujwYnL4mFkNRlWQ9J8hoGS5hUoPm2cypXdR5dqumEzDasKAgm4S1P0TE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777390904; c=relaxed/simple;
	bh=HgRaNLuM4JsktyDIgkafs5oiAmUVCDQ4IzL82XI0NxQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aUpAR05kGwH62ZsKa72VBNLbwRYOw+mzmDOLfcYkXNVzfUb4WF7iblcVpMkzJyMnejvTiFC9pW9cLQmtygJ5ufZ8ta5SLuij7Cbhkk6KNZR2CXlI4zOScb8ZdZ1b2OT+aSprkEqJmQlXeHLL2PI1l5D5RsoYeg93uFp4Al5zLKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=aOHmN3FL; arc=fail smtp.client-ip=40.107.74.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rstohoEldaLLibXIUz+oHeB+4FGCadOsEWqKQDv6iWoK9K4q8n6BWih7Va06GrluGKF3xhtvq1HSJlsZ6PUMbwy/AyI6w96U5Hka+C49qGNvWrHIo9ezeQkYIbdMx0m3LOFP/TW2yFtHW+pqMBEDOlTL1alialQ8c4WtrF4oZ7ixho/OGoZx1MI3/wKFcpygWsqV8qi9218Th0UI6gawZslMKFuMSBsQOgDqF8bskdQ4XoWRwI9tk01uUkzTVMMiM1zgqW+UHK4HEzabQr8sJFhZ5uUWEKUsX8OhMBNZlkFapSkv2bdDupIjqu3ShMTualnBH/VdDU4jg/p2giHYEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgRaNLuM4JsktyDIgkafs5oiAmUVCDQ4IzL82XI0NxQ=;
 b=x5/BDJmYFJeKDnhnVTp2LUjBMt+5HscpPP0fo7X+nxrH/MMEhejh4Ro5bk+6h2icxPJ6T0BX+gh9XPkML9Ej3+LGDZ7Ob30UaGlQEqwOGRYpikQLqpfhS3S8MuldHVZnnKqY5Q/9SklDGplLYaqB+LN5H6unB1bPlSsyHTj+CptfH9x2ol4BUmejNj26abNEifh+ZMi8Wbuqxg1lb7GeaL+MPnHZDe0O0JItOt+ItkdPslsI6bmii5IFbXW5DCUk5zWkzuKEEnQJijvz5Ik8NVRhDLUSE9jYS6nM7jObJl3U/kll+LtK1K99HDjmMYiC6i5eYNQ4vrQ1iRxNKsSmpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgRaNLuM4JsktyDIgkafs5oiAmUVCDQ4IzL82XI0NxQ=;
 b=aOHmN3FLWKqJKhGmFEzxSD6MQFZSwxvpM1+SDDlbi9hL2rt+LQZ8133+bOkvtt9vESQmZsGz/NCEbkCHJwuOGYYudH5h9vG5fX9TN1VDzsNXtqOV+g11xpeU2LQeMPLZHtBtCxPEJHQm0GRKxH7E9D6k2r8RSmroHYgeLUjvrrU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB14436.jpnprd01.prod.outlook.com (2603:1096:604:3a3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 15:41:40 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 15:41:40 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Andrzej Hajda
	<andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, laurent.pinchart
	<laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>, Xinliang Liu
	<xinliang.liu@linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>, Yongqin
 Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
	tomi.valkeinen <tomi.valkeinen@ideasonboard.com>, Michal Simek
	<michal.simek@amd.com>
CC: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v3 08/11] drm/bridge: adv7511: switch to
 of_drm_get_bridge_by_endpoint()
Thread-Topic: [PATCH v3 08/11] drm/bridge: adv7511: switch to
 of_drm_get_bridge_by_endpoint()
Thread-Index: AQHc1yQrlRTFBdZXUkiFVqLyiUYdb7X0nDCg
Date: Tue, 28 Apr 2026 15:41:40 +0000
Message-ID:
 <TY3PR01MB1134607C51C29EE25D9CE2E2786372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References:
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v3-0-a537b5567add@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v3-8-a537b5567add@bootlin.com>
In-Reply-To:
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v3-8-a537b5567add@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB14436:EE_
x-ms-office365-filtering-correlation-id: a82ee07d-dbae-4129-ea5f-08dea53ca413
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 awc9Qs8Zh5dzlPZ7FYAid866Y9Wrzq6HFEN8f0IDgXQD21PbLWx4j/F7JDjnZtatR/pcUP3FMeV2SeSm+nP5GnNQsnysVHbSjlcx/YTr834KNN5IlqdetsyBSuiWEpjQIEOYgUTGaYkBF2CClOaIHLYCpbPci1e9To7RKLKLMzIYQuodW7xghAicOnV5kaS0iDbYJKzhgqzGHmzk8pO7RBFL6pqp3Wmz4SVjcCqE2ZFKJd+cA1j9NHp5QBJCZro4/Ik/aKHPXB70tsHlvzSVIejPjp70wJgxk2hEcWEl7UaMIXPQMr+DHU3bA7qiczKtpcGWTeW3gwzB3F10eBBsUV37b6GgeDUwvMDTpPX5LfZUH/KMdi+nYgLAJ1280fig/w12D+Ws+r1b/6TdvAfB6mOPY5WaMTESt4P8npPY1O/xqjNvoYA/fsVo81tdMWxtoOAYHMh1dGWmJ6dm9NnVNy2yT37aErzcH65E+v6ZRdsqPID28LqYP4MgTptc22l8zZvX7ZMsiqPYmH41pGk99Z2ePruKI4uR/Du6iGTjK6GgAgwZLdysS2cj5LKE6TDxxj7zIHFYu6ZkvKEMGqSqJyenOff4GVEGbpq4MKI9Ws1NYnTPTYr1wk8ibwvg4FrGRHk7bzuEzv6qDDkJlbAqb6P+nbMdxME2yg1uyofYZOB0/wZoqXcRH5tBCVlBwrEvVdgN9jwFpUE3vWY/L6+CdhCl9Pj5JO47yeKxhLnZL7YM4XfjyMlV4Lr2GFeEltb/QtOyAvd3k0yPFoPvbQDD0IUIyI7QR0WYPswTNHq5nUqleyNQRH7VVwy+evL57pqv
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Vmp1RnpmSEIxU0JjT2NvQVp6ZmYxdVpsM3BrOEdsZWNUTFZ0ZFhQdkhGM3Jq?=
 =?utf-8?B?YTdUeTVsZXV5Y2xjdWJZbm5VNjkxVGdCYUgvbTRQa3dGeENSRnhQTUtYYTdC?=
 =?utf-8?B?bWZITnZib0dkSkVMUTgvRmxibHJqZTluNFFUQjJPd1UycTQ0SEh6RHY0Szcz?=
 =?utf-8?B?K0hXM3RtNFEzMXBST1p6V0ZlaGt2YXhFWHUrNmhqWWR5NUl3MURKd1k0VVZv?=
 =?utf-8?B?d01JMkxiL0VHSmd4eWlVbW9iTDdjcmFtOXJ3Z1RZd09CT29RMFc3SjF4a1Ft?=
 =?utf-8?B?S1M1NTJkNmVaMElCS1NGRVZRVXJpc01UUkZYUUphS3dpNXpmN0tYUGZYd3I1?=
 =?utf-8?B?K0JJTUcxZnRqdFR0QVdqTkp1Nnk1WUhWa3lQU0F0V3RnR1BDbXJLZy83a2hk?=
 =?utf-8?B?SWk2WnJrdkhQY2JINDNZVU5vc2RwUEdUWnU1UVBWZ0o2ZS9NZmhsdXg4bjAw?=
 =?utf-8?B?YmVsa0EvL2V3OTBGbmxhSmlQUEpVUVlOd2pIekwxVnhyL3lVemRPTTZ1K29M?=
 =?utf-8?B?dHg3ejFDWmdPMkVzZ1FXakdBdHFITnVrQlVpSzZsWlB2SnlxTy9NVFg2UGI1?=
 =?utf-8?B?Y252dUJIaW9LdWhVb0JvNlN1dTd2NlpSc1pnZk1oYzNnZkVhTG4wZ3pkR3lG?=
 =?utf-8?B?Y3BySlp6cXZqZGEwcCtqZGZxSFR2QUxua285bCtSWXRINUc2UUo4ME5QUlhv?=
 =?utf-8?B?QndXbkZSVjJXTVhjejkwS1hDcHRyekFZNWlMa2RtbW1kMmRvWHRxbHRsUjdq?=
 =?utf-8?B?WERnQk5XNGVzYk1lUDJScWxhN3EyUnZEZEZJRHhIdUxtdUpubkdoM3NJQjlL?=
 =?utf-8?B?MnRqdDE3OGljbkVEN1dUQUlmeXZtV2NhUzFQMjJwN3VmbmtQTm9lTkpRcS80?=
 =?utf-8?B?ZUlmZ3V6WXFudjZMby95bmQ4Wm1aZVp0alJtTFNrcFRXYUZHelhIOWphcGpT?=
 =?utf-8?B?SnpvM0pnQlgzZnJrdmxtUWNPYytWZEpKTWR2cHBuZnR0MVk2cFlpczlOTExx?=
 =?utf-8?B?WjdxdWw5SnNyQ2hKa2NmakpaUVdETlRJbDN3MzVHL0ozNHFmdGlKZ3RHSk13?=
 =?utf-8?B?Q040QzZGL3BiWFhkTmhhaVBaNVBvanJ4dGVSNXdSOGVpTEV4TEdXWlM5MmJS?=
 =?utf-8?B?YWJHNk9oaTRHdjMwVXMrRFN5a05abzRRUlZpbGtnbHJqNWxBZFY2TEdWYkNP?=
 =?utf-8?B?a0NEWU9wY3hSZ3V5TmNVTmZOMU1qRmJQUzdzU3ZiUGVxOERjck1vVE42UnJK?=
 =?utf-8?B?dWFuZEp4aEhMVXV3RzNkRXdKMkFXNkFvY3RTMkFhSlpxUXlZVHMxRkZERzda?=
 =?utf-8?B?Z0NFS3pEK1JJd1NGYVE2Z3p1bHZpUEo1UnB1WW9zcU1tSkM5MmJzMDdLRm9q?=
 =?utf-8?B?KzlsRnRpaG5ZcG1rMktGSjdkS2NYSUk0SGZEeFE3UGVnUkZEbVZiVXB3VkJj?=
 =?utf-8?B?aC9ZYjQxQVNwVVJaRlhCSmFJUDgrZXFvdmNTYzlyaXlNc0dBUVczNitjL2lG?=
 =?utf-8?B?VThrbVQvakYrRHlxaXJ5cE9ybTMrWDZGaThjWE8xUEd6QVZGQTN1bjZVVGl4?=
 =?utf-8?B?TXQ1NlpMdC9DeURkQUpMN2I1TmhpdTZDL3NmaVlocU51NXdFVm1RT09mNzE5?=
 =?utf-8?B?L2JLMFEwMENpeGRlWDJZcFhhaDhwWTQ0VnJ4eWR0Uno4OFNVUFo1RmtXa3pE?=
 =?utf-8?B?T1o5L0lKU0s0R0RSNmRoc29PWTFCT2NRYmNyRlRuNnpTbjZObW9QWUwwcDhw?=
 =?utf-8?B?UXNEZ0M2KzV2M0JTcGxFYXpnaXhLdnhjYXIrQ0xDUWJOYm80cXNqY001cEpl?=
 =?utf-8?B?QU93SHp4N09vNituSzZMU284emdVZ2cvc2N4aEVhdk1DTGUrTVBJOS8vUjdF?=
 =?utf-8?B?TlFiR1VybDcrUUpZd3pSWXEzNWx4NU9laVl1Mk1CZlZhZXZ1OFE3ZStPTEhv?=
 =?utf-8?B?UTN4RytNYUJoUjltUDc5Wmp2NnZRcmdSbHN1WUdHMnhvalg5M3JkcEdrUnl3?=
 =?utf-8?B?eWJRMmdNK2lRUkg5c2VNV3I0U3dEU0pSSkpXQWtNV0lJQ3ZxaE0zQSsycDl6?=
 =?utf-8?B?cVRyWUROKy9ZVjN1dWpTaWE2TFVpVllUUjA1SnpBVVg3TFVSbEQrMDlnaC93?=
 =?utf-8?B?MzJGMXM1allueHowU2J3YlljQzdaa2ZXQkRjOXRoZ2JEdTl3bFd1UmZZc0Mv?=
 =?utf-8?B?YStRUzZWSU9zYkNBS3NlYVdMZXBnN1hBMUJWejlib2JVYXZCZ0E1VmxQVnEw?=
 =?utf-8?B?SkNOTEMyWVVPWHp6RjcydVNWaDVpelJibnJPMGhwNENLM240dmE4YXB0NDEz?=
 =?utf-8?B?WFhLZGVvcUxrZVJpYjR0UWFMVkVxZmptbzJYWnJSYXhtTTkzZHppdz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a82ee07d-dbae-4129-ea5f-08dea53ca413
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 15:41:40.2055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mIw3c+MxWPMN+W8IuDk3ArE1fuj/KxLWxyxLZQdbaSCgbsIrHEHSj0OQf/30mVed8IHFw9C8RM192jQ+1O8ebp1KXyWEPSmdVRzOrgeNcsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14436
X-Rspamd-Queue-Id: BDFD048820E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	TAGGED_FROM(0.00)[bounces-105040-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,google.com,amd.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,lists.freedesktop.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:dkim,bootlin.com:email,renesas.com:email]

SGkgTHVjYSwNCg0KVGhhbmtzIGZvciB0aGUgcGF0Y2guDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVl
ZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBMdWNhIENlcmVzb2xpDQo+IFNlbnQ6IDI4IEFwcmls
IDIwMjYgMTY6MzENCj4gU3ViamVjdDogW1BBVENIIHYzIDA4LzExXSBkcm0vYnJpZGdlOiBhZHY3
NTExOiBzd2l0Y2ggdG8gb2ZfZHJtX2dldF9icmlkZ2VfYnlfZW5kcG9pbnQoKQ0KPiANCj4gVGhp
cyBkcml2ZXIgY2FsbHMgZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlKCkgd2l0aCBhIE5VTEwg
cG9pbnRlciBpbiB0aGUgQHBhbmVsIHBhcmFtZXRlciwgdGh1cyB1c2luZw0KPiBhIHJlZHVjZWQg
ZmVhdHVyZSBzZXQgb2YgdGhhdCBmdW5jdGlvbi4NCj4gUmVwbGFjZSB0aGlzIGNhbGwgd2l0aCB0
aGUgc2ltcGxlciBvZl9kcm1fZ2V0X2JyaWRnZV9ieV9lbmRwb2ludCgpLg0KPiANCj4gU2luY2Ug
b2ZfZHJtX2dldF9icmlkZ2VfYnlfZW5kcG9pbnQoKSBpbmNyZWFzZXMgdGhlIHJlZmNvdW50IG9m
IHRoZSByZXR1cm5lZCBicmlkZ2UsIGVuc3VyZSBpdCBpcyBwdXQNCj4gb24gcmVtb3ZhbC4gVG8g
YWNoaWV2ZSB0aGlzLCBpbnN0ZWFkIG9mIGFkZGluZyBhbiBleHBsaWNpdCBkcm1fYnJpZGdlX3B1
dCgpLCBtaWdyYXRlIHRvIHRoZQ0KPiBicmlkZ2U6Om5leHRfYnJpZGdlIHBvaW50ZXIgd2hpY2gg
aXMgYXV0b21hdGljYWxseSBwdXQgd2hlbiB0aGUgYnJpZGdlIGlzIGV2ZW50dWFsbHkgZnJlZWQu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhIENlcmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJvb3Rs
aW4uY29tPg0KDQpUZXN0ZWQgb24gUlovRzNMIFNNQVJDIEVWSyBjb25uZWN0ZWQgdG8gQURWNzUz
NS4NCg0KVGVzdGVkLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQoN
CkNoZWVycywNCkJpanUNCg0KPiANCj4gLS0tDQo+IA0KPiBDaGFuZ2VzIGluIHYzOg0KPiAtIGZp
eCBFUlJfUFRSIGRlcmVmIHdoZW4gLUVOT0RFViBpcyByZXR1cm5lZA0KPiAtLS0NCj4gIGRyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExLmggICAgIHwgIDEgLQ0KPiAgZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMgfCAxNSArKysrKysrKystLS0t
LS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTEx
LmggYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMS5oDQo+IGluZGV4IDhi
ZTcyNjZmZDRmNC4uMTJjOTUxOThkOWE0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL2Fkdjc1MTEvYWR2NzUxMS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
YWR2NzUxMS9hZHY3NTExLmgNCj4gQEAgLTM1NCw3ICszNTQsNiBAQCBzdHJ1Y3QgYWR2NzUxMSB7
DQo+ICAJZW51bSBkcm1fY29ubmVjdG9yX3N0YXR1cyBzdGF0dXM7DQo+ICAJYm9vbCBwb3dlcmVk
Ow0KPiANCj4gLQlzdHJ1Y3QgZHJtX2JyaWRnZSAqbmV4dF9icmlkZ2U7DQo+ICAJc3RydWN0IGRy
bV9kaXNwbGF5X21vZGUgY3Vycl9tb2RlOw0KPiANCj4gIAl1bnNpZ25lZCBpbnQgZl90bWRzOw0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2
LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYw0KPiBp
bmRleCA2YmQ3NmMxZmIwMDcuLjNjNTE2NTUxZTQ4MiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMNCj4gQEAgLTg1MSw4ICs4NTEsOCBAQCBz
dGF0aWMgaW50IGFkdjc1MTFfYnJpZGdlX2F0dGFjaChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdl
LA0KPiAgCXN0cnVjdCBhZHY3NTExICphZHYgPSBicmlkZ2VfdG9fYWR2NzUxMShicmlkZ2UpOw0K
PiAgCWludCByZXQgPSAwOw0KPiANCj4gLQlpZiAoYWR2LT5uZXh0X2JyaWRnZSkgew0KPiAtCQly
ZXQgPSBkcm1fYnJpZGdlX2F0dGFjaChlbmNvZGVyLCBhZHYtPm5leHRfYnJpZGdlLCBicmlkZ2Us
DQo+ICsJaWYgKGFkdi0+YnJpZGdlLm5leHRfYnJpZGdlKSB7DQo+ICsJCXJldCA9IGRybV9icmlk
Z2VfYXR0YWNoKGVuY29kZXIsIGFkdi0+YnJpZGdlLm5leHRfYnJpZGdlLCBicmlkZ2UsDQo+ICAJ
CQkJCWZsYWdzIHwgRFJNX0JSSURHRV9BVFRBQ0hfTk9fQ09OTkVDVE9SKTsNCj4gIAkJaWYgKHJl
dCkNCj4gIAkJCXJldHVybiByZXQ7DQo+IEBAIC0xMjUxLDEwICsxMjUxLDEzIEBAIHN0YXRpYyBp
bnQgYWR2NzUxMV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqaTJjKQ0KPiANCj4gIAltZW1zZXQo
JmxpbmtfY29uZmlnLCAwLCBzaXplb2YobGlua19jb25maWcpKTsNCj4gDQo+IC0JcmV0ID0gZHJt
X29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlKGRldi0+b2Zfbm9kZSwgMSwgLTEsIE5VTEwsDQo+IC0J
CQkJCSAgJmFkdjc1MTEtPm5leHRfYnJpZGdlKTsNCj4gLQlpZiAocmV0ICYmIHJldCAhPSAtRU5P
REVWKQ0KPiAtCQlyZXR1cm4gcmV0Ow0KPiArCWFkdjc1MTEtPmJyaWRnZS5uZXh0X2JyaWRnZSA9
IG9mX2RybV9nZXRfYnJpZGdlX2J5X2VuZHBvaW50KGRldi0+b2Zfbm9kZSwgMSwgLTEpOw0KPiAr
CWlmIChJU19FUlIoYWR2NzUxMS0+YnJpZGdlLm5leHRfYnJpZGdlKSkgew0KPiArCQlpZiAoUFRS
X0VSUihhZHY3NTExLT5icmlkZ2UubmV4dF9icmlkZ2UpID09IC1FTk9ERVYpDQo+ICsJCQlhZHY3
NTExLT5icmlkZ2UubmV4dF9icmlkZ2UgPSBOVUxMOw0KPiArCQllbHNlDQo+ICsJCQlyZXR1cm4g
UFRSX0VSUihhZHY3NTExLT5icmlkZ2UubmV4dF9icmlkZ2UpOw0KPiArCX0NCj4gDQo+ICAJaWYg
KGFkdjc1MTEtPmluZm8tPmxpbmtfY29uZmlnKQ0KPiAgCQlyZXQgPSBhZHY3NTExX3BhcnNlX2R0
KGRldi0+b2Zfbm9kZSwgJmxpbmtfY29uZmlnKTsNCj4gDQo+IC0tDQo+IDIuNTMuMA0KDQo=

