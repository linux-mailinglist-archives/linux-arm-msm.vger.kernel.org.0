Return-Path: <linux-arm-msm+bounces-105011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SByqKI/D8GloYQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:26:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F83486E86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:26:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 477063154CD8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE88A43C074;
	Tue, 28 Apr 2026 14:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="QJNbegDt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011024.outbound.protection.outlook.com [40.107.74.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FF243C056;
	Tue, 28 Apr 2026 14:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777384927; cv=fail; b=NRqbLd8ncq75jaQV+rbwg+Z46tsV9SfCRrPV+KyLmrcQcd7HMZTA+5n4x4HvEkDuibIl5q+woGavZxhvSfepOorvLweEk0PoZ05aqZnOe+W89nfz3zmziUDLt8QCZBnW2sKS9uSMIYdzFJJYgD1FxmptlHYxXdluu15FHSTWh2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777384927; c=relaxed/simple;
	bh=LEnHJQHSuZ3V911vt9KV5GWaHc/6ffn4NapCFBSs5uc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h42rbSmzNkclST3WgwBZEPgxHjAI/8Oz+HnPR/01TJDSicn1eiOnx2AmmEMyrOetxcyGBqMW1S06ZEXYiMna7mdYdBp41KK/YvTOm67tt+LZJhtAfboLD7VbXkk8ij2BvyTlpaayBghkR1k+pgnzmwObTjoY1yULBQGh4MjcN0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=QJNbegDt; arc=fail smtp.client-ip=40.107.74.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jepgfpGV5G/cMpZXen5+bq40tR0HQBE2XgcjhMHPJwHdeFixIumQt+Vf1xYigxKUExQg9E41+zwDq2NsALRw53VA51rLq3OybmXm2466ep834cu3YHilKrfkAxRRaiiQtagcjDhx53HINOqTCMlOAIKZ8lKzOSs2o+UhNNSNNXm9Sjxy8CCjz9ohmJervLUddmh3jBpZDjDNp5OvFfg/wfC/DZmbE3LXbHSifrWZqsQlgwcjxZmLilYhsnIDfOgqhT1MP8tYyvFqsY4lJqfhtPoLWhF4fzSOkxt+FQZXgp/EDRAxb0mJ+X6qLaGRrm1L5Z10GI2dfobVYyNxn3bw+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEnHJQHSuZ3V911vt9KV5GWaHc/6ffn4NapCFBSs5uc=;
 b=rbb3bLcAzGfPxJp1w4SD61arcvbT+tF0e0ItSyNLsdMXl/Iqnh1r+wwtD6VWwV7Gr1XQiBYmLUcyCJmIWwpquMUHQkYE8sXAghm4kmIKH3M1ugVoOToKWhlflUAJCNhh2RFJrRDvMWrsCMpKQGVddFyY1kNqQDLwQvx1sZSzc/VpRqXLExAD8sugHJGhb99wo8KVoj1w7AuhBZdW6KKexkXy4s3elCHsTbo2hCV5bEPvYNb1fS14nyPDuqWx5y+4BTWeqIkBxywI0sgWNcUb9JWrivjuuqAmzsJ8wjH+r49ZPlNEnTqlKFubebAK3cywDa7X6/bJHqyInHVWSkSf7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEnHJQHSuZ3V911vt9KV5GWaHc/6ffn4NapCFBSs5uc=;
 b=QJNbegDtm8N8ptVO5QQO1VZR81MuKd7HF2+AhruihQITuCb26LSqou8LFYuaTInITIu6DezSjpLdC6ZZ3zadMCMvA4KBdsrj2XoaptMmQg03tg1KidfL1Rhol02gCzoRRiRQ3LmDXKT2etAQDPJ46SvVvrp4iQfdiyIperqljzs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSOPR01MB18042.jpnprd01.prod.outlook.com (2603:1096:604:476::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Tue, 28 Apr
 2026 14:02:02 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 14:02:02 +0000
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
Thread-Index:
 AQHc1u/CLMxk+VTSG02AXPmSMDjmUbX0WyoQgAACgvCAABfEgIAAAYVQgAAGVYCAAAKiMA==
Date: Tue, 28 Apr 2026 14:02:01 +0000
Message-ID:
 <TY3PR01MB113465B0308DE16ACC48D1E8186372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References:
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-8-4300744a1c47@bootlin.com>
 <TY3PR01MB113466B70BFD2899AB0CF47AD86372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB1134674FDD088299A4382D3D286372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <DI4TGV2WURTY.39OXE7WWKRLA1@bootlin.com>
 <TY3PR01MB11346E82D19FBE8544F51624286372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <DI4U2DT3OBMR.23T3F7X8P75RU@bootlin.com>
In-Reply-To: <DI4U2DT3OBMR.23T3F7X8P75RU@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSOPR01MB18042:EE_
x-ms-office365-filtering-correlation-id: 080fed9c-b4d7-4610-1f39-08dea52eb8ca
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|18002099003|56012099003|22082099003|38070700021|921020;
x-microsoft-antispam-message-info:
 NQ5J7hyT2EcN+cBN8Ou+yXt5gUJLKP42i6kQR93gHBfTqU+THzdcW6/uoekhqHf0rDzW3A08+0f/NoxgWW5czXa3oOgyYbvIoHAauP+O9gEBp2QD/gQX/9cmnxsT366MtIPUh/oEKOfmOlm0jtVi3yT7Q4nolLXXViRIYcC4h17It1GhaD6xVikykzUBe6UYtYYTTYPgL3tCbRsxLi5LzAnOS1ER125Th5ARuTdWLQ8dp8vtpBGtc2HXoFtWi48nw3DwwigkQddz1o3W5SUR153JgAI6IgW/Vpx8qTr4oHrsrB5BB0uvwA5or1MUDyDWSLHOQIF6AGxg5rtzdgTcUx8hadxSrAIwy3aaftP4nc0y/Ke/DlfGoDsyJ7GEVIr9pwtIjgk97HD9NUQ2DDTFjCeXOyOaoxU7anIlpm7aWKG2L9BSjNRCHBx9ilkzXlY7sGThFWasGESFifBxc65pYo69Vj8gvBsCYVYik3S3/nJX0z25z4gxbFrtX5UzeXXKn9dANoWeAgMAmWRPnucPtq2ua/iZRtk6EYGr20vMZ3gfGfRVTyHHV5oM4SOkSneWcsy1FFfeCL63eKKmzpITDUVJhJ9ly6DVn/2BXO8wEgOpqliFKdwTkT1TCQL0NdjvsuLjFpVtk9/ANXfFM74qEYg6hdr/eQZ04iR0BZjwvlkauBadVE+O/lmdj8utXw6xoXIjK57TDQQXk3WMl/vaQxc5DtZ+E4QyIITrfr1pYOmil5H29Wti4FeUUFa2AqiZyDNPSEv4zuk6SxZ9hiVTFA5ZwGX/rG3Kz5ZqYfFsBJyB0kduqJrGUqC9j+AFUeE2
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(18002099003)(56012099003)(22082099003)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cmhyL2ZuazAwa3QyUUFxbzNOWCt0dktVUmRxYTJOYUZtM3BiY0JmeGhNSFA2?=
 =?utf-8?B?dytEeVpwRDMwTjZjZWZWOEc2MERnMldycUpobUxQcXFzZWk1bUpTQ2YyTFNj?=
 =?utf-8?B?SWVJWXhPSXR2ckVCc3VBOXE2VzVhTGF5TE5SNnZzVVhFaysvUkRCN2FEa1Vs?=
 =?utf-8?B?VjVCRzJRV3JXMWJaR2xxbHltNzNZd21hVWl6SkFDVHlEYnA2eVljblMxK2l0?=
 =?utf-8?B?K2k1R2RwOFA3WVd0THNmcThqUjlWR09KTTRqL3pWL2M5RjR6OEhUN1FZU3p0?=
 =?utf-8?B?cWZCam0xRGpSTU1Gdnp1b2dUU0ttZHRPa0d3VXdTMUFhNkVocWRGNlpZSm8z?=
 =?utf-8?B?Z1pyblJaV2FDNU5zWUZlUE0yTWI5M1dwMStTYWhZdm52cjUwRnk0ekhCZXJj?=
 =?utf-8?B?WE0wWG5ORGN6anhUVlFlbHpLMnBtbGpyeFl0TWxOQmVrV2gvVTZUYXErd29B?=
 =?utf-8?B?VmNwUkJtQlNma1Vob3dVQTBZRHZKNkNXTHBqWFRqbEtNbmJGTDI1VFZmTVNL?=
 =?utf-8?B?MDV4SzRQUzZ6KzlJUUdYSmZGYlcwTWkwSm1RR21WdTJtelZOd2pkazk5RUVP?=
 =?utf-8?B?UmY5SzNOT0QxQlpsemwxYVltZ1hBWDJIQllwS2NaZm1ldGhlbzRXRm9GUEhY?=
 =?utf-8?B?R0FLazVTNU1GbmNEcEEwTThjbWpuMkdKZWs3U0VUdzlISWVOcHF3VEVlN2oy?=
 =?utf-8?B?WWRBYkN2VlZrNGxpRHF5Qm9WOXJpRFRhTkd6SWJ4QXBlNzhTOFVDSVhrYWVW?=
 =?utf-8?B?clVQODV4SStmRUVZZEhaWnFHeGxmeW53amFyWVZEdXVaeFVWS2d0NGhmZXVF?=
 =?utf-8?B?bjJZQUswa2RBcUM1RXJMeXRWSUgzMytTbnhmejErcDJuRDk5WHErSnBvbGtr?=
 =?utf-8?B?Y2NmZkdTRjR0cjBySm9ER1hHRDNUbGIvSGZ0WnIwa2o5YnovWlozbm1PTldV?=
 =?utf-8?B?c2JFQUw3czdKU2FtZFFDUlp5Z3hZc3VrVTNyOTJPQjcrcnIzVVJTTWx5Qk55?=
 =?utf-8?B?N2UrWGpCWWQyVmtxaWlvRm9xb0ROOG9OekRvR1R2RGZFWjh0Y2FLditOS1hl?=
 =?utf-8?B?aGFmL0hrSnp3UHN3K2JFZ2xWOStBY1RITGxHaVBBOTRYM2l6MVlPUDNnNkth?=
 =?utf-8?B?Sk5NN21SVXRuYjdMMEt3Y0ZZNmdtSlFLUjlxWVdZUHdyblgvcHlJSUNKbkYy?=
 =?utf-8?B?V1ZYTk9NNzlXc2R5Q010ZWcrVklrTXN5U3dYWk9ZR052R3lRcEx3ZHVzSWpK?=
 =?utf-8?B?RHdVZHdsLzg3YWo2SERRTFhiODlxWU9zc1RCTXY4SlBraG5CSllibU5aaGdv?=
 =?utf-8?B?R2NDdHVKbnNhbHdEVWt5eDE3cXllcG43N24zdnk3MEdybXBpRk5UK2lSV2lj?=
 =?utf-8?B?UFRwTEFxSWhqK2cxOHBKTFhhM0RUajUzQXBhdVRkTWdqaStFeThMcDhRNW5w?=
 =?utf-8?B?UnJjd2ZYVmdNYXBJSDNVQjl0dFd4bnNEL0RGL3lMYmhPL3lsbTlab04xWHRU?=
 =?utf-8?B?T0lQTmNvSjQrMXluVFlNQ29HQWxEMWJLRE56eC9BRzZCMTdIQmppR2pYb2tD?=
 =?utf-8?B?KzlBeGlCRllkY3FYZ2pPTkF4VEZXNWhjZE5IU3QzZzNSYVlQSkZ1bHErU0l5?=
 =?utf-8?B?Qkd4d1JjNGlqMzR2NE9tNWVlNmN6dHRuYlhpMCtGeTZBMUcvNzlKc2JkdVZV?=
 =?utf-8?B?bDBHTkhqNDR1T0hHS2F2V1lXVW9XMGZzdDRtUWZjeGZiYWNxcVZHMWJqRHlE?=
 =?utf-8?B?NFgvNDUvMTlmQWxpNitaeDBpNldzZUtuRE5iaFhhQ3VnVTVUTjhtRGlJVXVB?=
 =?utf-8?B?N0hhZ3R1eXVnVGx0UEh0VUxVWEZFU04vMzY3cTYyaVJSQ3RERDg0UjdPakk2?=
 =?utf-8?B?b3QyenlvdXgrYmVZTlBRWXg4UVBlUlhmbGM5SllSRWxwNDVvZzJKbnBXU2R2?=
 =?utf-8?B?d3huN3RmNW9HaHhwS0QrYWRVVjhsZEJ3U0lOVWg2aTRaV2JTc2h2cWVWK1N4?=
 =?utf-8?B?R1NBL1QyNGhwY1F3VHlNODRnSWhYSTVwaEUwS3gxSEpXcU55L05KaEpEN3lX?=
 =?utf-8?B?bXJYUnJVSkxCeE5RZlFuQWM0SzUrUlQ5SyttMzRHRlYxWG9Bb2tFK0F5M2R6?=
 =?utf-8?B?cFVFSVdnTHZoSmpyVk1VSHUxVGk0OEpqcHVIeEJ0Z3hGS2dHSHZ6ZDNvczR6?=
 =?utf-8?B?QWJEaFcyT0RrcDl1UDBMQnh0cnBRSlhXSC8raStZYXJRUzQ4d3ZpV1E3RVlS?=
 =?utf-8?B?QmJpdXNEb0FJalBseDNtRXRkYjBpRDh2aFR5TFduazliU1lhVXVieWhtTzAz?=
 =?utf-8?B?SDhQM3JFVnlHM09FOHhTVmNCam9tbisxSnY5OG53Q1Q5dG5pNDRydz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 080fed9c-b4d7-4610-1f39-08dea52eb8ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 14:02:02.0047
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 532kVXVM7QfLPVyuFP3i6lkZY31Q+SaWGT6ZSKt/VkSQ73ihPG3kiSi1hAP+1kiNry5qoAk4Z+Mq0of3B1novpSq/fS/afkKHrgCSyiE0iI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB18042
X-Rspamd-Queue-Id: F3F83486E86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	TAGGED_FROM(0.00)[bounces-105011-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim,bootlin.com:email]

SGkgTHVjYSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMdWNhIENl
cmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4uY29tPg0KPiBTZW50OiAyOCBBcHJpbCAyMDI2
IDE0OjQ4DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMDgvMTFdIGRybS9icmlkZ2U6IGFkdjc1
MTE6IHN3aXRjaCB0byBvZl9kcm1fZ2V0X2JyaWRnZV9ieV9lbmRwb2ludCgpDQo+IA0KPiBIZWxs
bywNCj4gDQo+IE9uIFR1ZSBBcHIgMjgsIDIwMjYgYXQgMzozMSBQTSBDRVNULCBCaWp1IERhcyB3
cm90ZToNCj4gPj4gPj4gPiBAQCAtMTI1MSwxMCArMTI1MSw5IEBAIHN0YXRpYyBpbnQgYWR2NzUx
MV9wcm9iZShzdHJ1Y3QNCj4gPj4gPj4gPiBpMmNfY2xpZW50DQo+ID4+ID4+ID4gKmkyYykNCj4g
Pj4gPj4gPg0KPiA+PiA+PiA+ICAJbWVtc2V0KCZsaW5rX2NvbmZpZywgMCwgc2l6ZW9mKGxpbmtf
Y29uZmlnKSk7DQo+ID4+ID4+ID4NCj4gPj4gPj4gPiAtCXJldCA9IGRybV9vZl9maW5kX3BhbmVs
X29yX2JyaWRnZShkZXYtPm9mX25vZGUsIDEsIC0xLCBOVUxMLA0KPiA+PiA+PiA+IC0JCQkJCSAg
JmFkdjc1MTEtPm5leHRfYnJpZGdlKTsNCj4gPj4gPj4gPiAtCWlmIChyZXQgJiYgcmV0ICE9IC1F
Tk9ERVYpDQo+ID4+ID4+ID4gLQkJcmV0dXJuIHJldDsNCj4gPj4gPj4gPiArCWFkdjc1MTEtPmJy
aWRnZS5uZXh0X2JyaWRnZSA9IG9mX2RybV9nZXRfYnJpZGdlX2J5X2VuZHBvaW50KGRldi0+b2Zf
bm9kZSwgMSwgLTEpOw0KPiA+PiA+PiA+ICsJaWYgKElTX0VSUihhZHY3NTExLT5icmlkZ2UubmV4
dF9icmlkZ2UpICYmIFBUUl9FUlIoYWR2NzUxMS0+YnJpZGdlLm5leHRfYnJpZGdlKSAhPSAtRU5P
REVWKQ0KPiA+PiA+PiA+ICsJCXJldHVybiBQVFJfRVJSKGFkdjc1MTEtPmJyaWRnZS5uZXh0X2Jy
aWRnZSk7DQo+ID4+ID4+DQo+ID4+ID4+IERvZXMgaXQgY3Jhc2gsIGlmIHRoZSBlcnJvciBpcyAg
LUVQUk9CRV9ERUZFUj8NCj4gPj4gPg0KPiA+PiA+IEkgc2VlIGEgY3Jhc2ggd2l0aCBwYXRjaCBb
MV0sIHdoaWNoIGlzIGZpeGVkIGJ5IGF2b2lkaW5nIHRoZSBkaXJlY3QgYXNzaWdubWVudC4NCj4g
Pj4NCj4gPj4gQWgsIGRhbW1pdCEgR29vZCBjYXRjaCwgdGhhbmtzIGZvciB0aGUgcXVpY2sgdGVz
dGluZyBhbmQgZm9sbG93LXVwIQ0KPiA+Pg0KPiA+PiBJbmRlZWQgdGhpcyBkcml2ZXIgYXNzdW1l
cyBuZXh0X2JyaWRnZSBpcyBlaXRoZXIgTlVMTCBvciBhIHZhbGlkDQo+ID4+IHBvaW50ZXIsIGJ1
dCBkdWUgdG8gdGhlICdpZihJU19FUlIoKSAmJiBzb21lX290aGVyX2NvbmRpdGlvbiknIG5vdyBp
dCBjYW4gYWxzbyBiZSAtRU5PREVWIChub3QgLQ0KPiBFUFJPQkVfREVGRVIsIGJ1dCB0aGF0J3Mg
aXJyZWxldmFudCkuDQo+ID4+DQo+ID4+IFRoaXMgYWZmZWN0cyB0aGUgbXNtIGFuZCB6eW5xbXBf
ZHAgcGF0Y2hlcyBlcXVhbGx5Lg0KPiA+Pg0KPiA+PiBJJ20gc2VuZGluZyBhIHYzIHNvb24gd2l0
aCB0aGVzZSBmaXhlZC4gSSdtIGp1c3Qgbm90IHN1cmUgd2hpY2gNCj4gPj4gYXBwcm9hY2ggdG8g
dXNlIHRvIGZpeCAoc2FtZSBmb3IgYWxsIHRoZSAzIHBhdGNoZXMpLiBBbHRlcm5hdGl2ZXMgYXJl
Og0KPiA+Pg0KPiA+PiAgMS4gLUVOT0RFViBpcyBhY2NlcHRlZCwgc2V0IG5leHRfYnJpZGdlIHRv
IE5VTEwgd2hlbiBpdCBoYXBwZW5zOg0KPiA+Pg0KPiA+PiAgICAgICAtICAgICAgIGlmIChJU19F
UlIoYWR2NzUxMS0+YnJpZGdlLm5leHRfYnJpZGdlKSAmJiBQVFJfRVJSKGFkdjc1MTEtPmJyaWRn
ZS5uZXh0X2JyaWRnZSkgIT0gLQ0KPiA+PiBFTk9ERVYpDQo+ID4+ICAgICAgIC0gICAgICAgICAg
ICAgICByZXR1cm4gUFRSX0VSUihhZHY3NTExLT5icmlkZ2UubmV4dF9icmlkZ2UpOw0KPiA+PiAg
ICAgICArICAgICAgIGlmIChJU19FUlIoYWR2NzUxMS0+YnJpZGdlLm5leHRfYnJpZGdlKSkgew0K
PiA+PiAgICAgICArICAgICAgICAgICAgICAgaWYgKFBUUl9FUlIoYWR2NzUxMS0+YnJpZGdlLm5l
eHRfYnJpZGdlKSA9PSAtRU5PREVWKQ0KPiA+PiAgICAgICArICAgICAgICAgICAgICAgICAgICAg
ICBhZHY3NTExLT5icmlkZ2UubmV4dF9icmlkZ2UgPSBOVUxMOw0KPiA+PiAgICAgICArICAgICAg
ICAgICAgICAgZWxzZQ0KPiA+PiAgICAgICArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
UFRSX0VSUihhZHY3NTExLT5icmlkZ2UubmV4dF9icmlkZ2UpOw0KPiA+DQo+ID4gVGhlIHBvaW50
IGlzIHlvdSBjYW5ub3QgcmV0dXJuIFBUUl9FUlIgYXMgaXQgd2lsbCBsZWFkIHRvIGNyYXNoLCBp
ZiBpdA0KPiA+IGlzIGRpcmVjdCBhc3NpZ25tZW50Lg0KPiANCj4gSXQgd291bGQgZGVmaW5pdGVs
eSBjcmFzaCB3aGVuIHRoZSBuZXh0X2JyaWRnZSBpcyBkZXJlZmVyZW5jZWQgKHdoaWNoIGhhcHBl
bnMgaW4NCj4gYWR2NzUxMV9icmlkZ2VfYXR0YWNoKCkpIGJ1dCBJIGRvbid0IHNlZSBob3cgaXQg
Y2FuIGNyYXNoIGhlcmUuIEhlcmUgaXQgX2Nhbl8gYmUgYXNzaWduZWQgLUVOT0RFViwgYnV0DQo+
IGl0IHdvdWxkIGJlIGltbWVkaWF0ZWx5IGJlIGNsZWFyZWQgdG8gTlVMTCwgb3IgdG8gZW5vdGhl
ciBlcnJvciwgYnV0IHdlJ2QgaW1tZWRpYXRlbHkgcmV0dXJuLiBBbmQgaW4NCj4gY2FzZSBvZiBy
ZXR1cm4sIHdoZW4gbmV4dF9icmlkZ2UgaXMgY2xlYXJlZCBieSBfX2RybV9icmlkZ2VfZnJlZSAt
PiBkcm1fYnJpZGdlX3B1dCwgdGhlIGVycm9yIHZhbHVlDQo+IHdvdWxkIGJlIGlnbm9yZWQgdGhh
bmtzIHRvIHBhdGNoIDEuDQoNCk9LLCBJIGhhdmVuJ3Qgbm90aWNlZCB0aGUgbmV3bHkgaW50cm9k
dWNlZCBjaGVjayBpbiBkcm1fYnJpZGdlX3B1dCgpIGluIHBhdGNoIzEuDQoNCkkgZ3Vlc3MsIHdl
IHNob3VsZCBhdm9pZCBwdXR0aW5nIGVycm9yIHZhbHVlcyBpbiBicmlkZ2UubmV4dF9icmlkZ2Uu
DQpJdCBzaG91bGQgYmUgZWl0aGVyIE5VTEwgb3IgVmFsaWQgcG9pbnRlciwgbm90IFBUUl9FUlIu
DQoNCkNoZWVycywNCkJpanUNCg==

