Return-Path: <linux-arm-msm+bounces-105003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iImSFXvB8GloYQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:17:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B057C486C47
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:17:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC480337E0C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D84472764;
	Tue, 28 Apr 2026 13:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="i47fzcuH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010049.outbound.protection.outlook.com [52.101.229.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370A8472789;
	Tue, 28 Apr 2026 13:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777383101; cv=fail; b=nTtsvABLjGhHO+kfeGar9eL/+Gbh8utAI3qUVFXkweKbkjIapwOUIDm6X4hYCLMuprk22MtvPcA9Zi5Ra+enXhiY7yvN+N4zQcUY1GzTfOxAeUsII2tTIWve+hz5WVOID3TycsyCY86MBQelHVsoVkvOpYYuJsAwj3M8AETR84s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777383101; c=relaxed/simple;
	bh=4AfUo0SeZdg5icevags8SPeEv8w2cOne82t/BHm4OY4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uHlrcUxV/CKUqqZU+XY8Gyz//X2117zmW9P0g6Dl3+dR5lRgVnyFayGYyeXEpWg8j21G+zdtbNVOOmCTcLtjaAvoRwJSqRbTGTFDD9f7BzIEntFRELxTyHBFld8HQ0LXaviKw/a3dIl6HJWjbimMzgoHzpM/FnH0Z3UxrNMN1Ik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=i47fzcuH; arc=fail smtp.client-ip=52.101.229.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CwmW6ko2qPqN3fqq59ZkrgdCdpn09cp0GluDdOupweI0Wpy/e2ghiS930v1KGRgVYrNhmcxCh+1kAeLsqckFPZH7cnIXC2WPWwo0ypUjzlVgwACdjdwbbltD331E0XH76eRD84XNgpgH+bfxaLYaSeGs4UaEMVENvVCXuHGtc6xiVmHhRURsDf5spr211M+F2x69DmVzRML/qPKO8tCkDAFgPz1wGC5eYCM9rjgNEG7H0eWU1uuwVG195P/JW3GS9ByQ8z9NNtKqyLQhj5M3Zkz7u3AsK+bjhz/uuIUTPkpNtpyi5qDD4IdOC2eSyfByAUOlEbYNK90Cw6FHSUU8Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4AfUo0SeZdg5icevags8SPeEv8w2cOne82t/BHm4OY4=;
 b=uxTpHVmWc5zRf90HHiFWKui5KOzhDpa8elupjSleUC4ClWuHAqOc892L9k1pK5UXo1DT78K0Z3274zWOFBXYVCw4RbSLT7Z6UUjc5fwsKXM0bSwWxBDwLQakLyYm7yogjBthtJSkQ01nMGhuDudvMmO7rGrz5q0ikpg9ienVEuNuJLaOkAtFVXWKCIvz87pFjhYG4phSlyP2tPb+ive8LLtSFy34oDcD/+0oCcmk35ejja/i4Gd9aoYthWXJwSgqmaVBxLMo4cVAbGUHpQx2YizKvBTtZu6Q1rEoa4OOtj3wHt0VtqMnkxlFSB23XSIUPOcc+1c1aeB19ZtqMdO2Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4AfUo0SeZdg5icevags8SPeEv8w2cOne82t/BHm4OY4=;
 b=i47fzcuHZqNFRkX33hXsvd/B/2inMdNP7f3/xueivd3mnRBzJKFaWpoW9SZL4guI566uWkEedqO5IoI3uW0OMaivUBudMCxBRxOSqn6yIpR5YiVj2Ais8pQBAg1s2lpNCeDvjsu1Ez2hzb/cUVsJqUoF5taKCyLWtOjYBD515iQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB7844.jpnprd01.prod.outlook.com (2603:1096:604:1b8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 13:31:34 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 13:31:34 +0000
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
Thread-Index: AQHc1u/CLMxk+VTSG02AXPmSMDjmUbX0WyoQgAACgvCAABfEgIAAAYVQ
Date: Tue, 28 Apr 2026 13:31:34 +0000
Message-ID:
 <TY3PR01MB11346E82D19FBE8544F51624286372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References:
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-8-4300744a1c47@bootlin.com>
 <TY3PR01MB113466B70BFD2899AB0CF47AD86372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB1134674FDD088299A4382D3D286372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <DI4TGV2WURTY.39OXE7WWKRLA1@bootlin.com>
In-Reply-To: <DI4TGV2WURTY.39OXE7WWKRLA1@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB7844:EE_
x-ms-office365-filtering-correlation-id: 00690ffb-9673-4ecb-5807-08dea52a7793
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 7bDPw6GqV8JawJBi+GHEkGayCxx9HJ8VNmgmfph9SwxlhOQY04+kV3/eHEiGh1Rc5xcqndNHVzmtUlNqU5k+lhh6bdgv/XR/PDsy5iq1LUzD33UAJCUMmH9J31jCEliGEVvRxYvWhtt0zFIfWfRarw1TWdN+RffKC4fg9p9FRziTgvR5+gm0dKVohrwlmz3Ko96S6hn+v5Mhue2iJTixvKThH23wwqsADFu5hM9XoeMX9yCGm98F7vNHTqkA8XqHncgcH4n4zPCCQdmpP77JacU3zcRRa+WYjKxOq+6jza8oBAyQoZuX6uZ1zk6g11hLhbTORRDN1JQ/N1P1cBogOM8Ocs9RJCMysDMDiRoWh0VGHdGbGxrzbkO79GJLHbLBMW/lB3lOYyI/fQmVksWj4wPIrB3QYzOgdG0aPc/YI0jpUrxP3ao+QLQuUWVj5jV/YeTw2oiOejzWe/A060xkydZO2+iTUD2c1E6vLbjT8fV2ool6QFLUurUUGHQISAUVV9d+KfCjhXckOVFZocLvrhtYsZK8NuGm6gsAYTEgMQf20FbiaYCnsUW9DYetQF+CMnXWJnJAtoHOCrBe+Xb8rH2zjee64f93cjxeU3rUsWiAm36k5rBrvkm90+kWilZBNZJcyzWDrke8Vg1ngxVgSb9KWpAD5HP2FOsHSQ24mk1dIF7ZnyesXY1KluykcNBatK9YXME/KkUPA0gO17Hm87cYA0hF3ocQO4nav22iQ1/ruhXtnzG18pbe8Z5/pJHY
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QWduMmxLWVdRZENsbllNcGR1RVU4a2EwaVluKzFrQXN0NFd1am5WQm5zRjZK?=
 =?utf-8?B?TGFwWWsrYVV4R2lrYThtQi8xZm5Mem1naC9yc216Z2MyYmN2akUwQ2I0YkhB?=
 =?utf-8?B?eENpbFN4NTVmSUY5WFVpdTAzMWs3U3RKQ3F5U05kUkJ4WXVleG1hbnRSaWlB?=
 =?utf-8?B?c0ZWRldzVWpHVkNmek9JZHd4M1lOMVo3TzhSREhLcjIxU21vZVZUUXljZEt5?=
 =?utf-8?B?SWJ2K0pxLzErd0c2M1pvR0NIU1FvMlB3MHNxNlNxVUdFT2tPcjBYOXBzSTBD?=
 =?utf-8?B?YzdrS3VFaHNnNUU3aVVYRWY5cjhDZkYyakZ1QzFGVmYreVBwSTJIcGVaOWNr?=
 =?utf-8?B?RkdxZUwwazhERklURWxEOWJtWlJSbDJabG8zK05uSHZmQzBWNXFTeW9CTERi?=
 =?utf-8?B?Z2FUL1IvNnJTblB0NURYeWlSeDdxcnVyZDd2VitGVzk2bHZQVGduY0F5WkNN?=
 =?utf-8?B?ZjgzZ2dSaHdBNmxsMHhqRWlEMC9PcnFpemxnbUNaOUdCY2tSaFJvbHNid1Nk?=
 =?utf-8?B?amZlckRFSTJhSTM2di9VRUQ3NVlHdFRlK3p0UWxSaHV0NENiV2NrWUV4Vndn?=
 =?utf-8?B?bFFOcGhsWEt3MWErVDlERXVxdFpyUnhiby90MWVJMlFwNTZsVjZ4ZFJoYW5M?=
 =?utf-8?B?MHlZRDVMOU0yaXlUa3FjRnQ1dC8xQ1JCbk84Qncyd0RlNDZOUSttRjEzWHFw?=
 =?utf-8?B?M1lPUXdMSUI0clFWc1Iwd0FUMFpXcGYyVVhtK0M5amhVZWpscXo5Qk5WclFa?=
 =?utf-8?B?eEtYQnRTbWxmRTVWTSt3STdxVDNOTnZKZXRXVytVaXIyUHNjMDB2QzZJNUZu?=
 =?utf-8?B?VFVkZERkaUIycnlrSFVzV2ptYmw5RG8rcndLRkhOZWZlTGsyTC8xRmxxdFNV?=
 =?utf-8?B?M2NscUhHUzBBeU90dElGaWk1NWVoY2lMR2hiQzlFMUUwc1B1WmxxcG8vT21z?=
 =?utf-8?B?K2xwRzM0SDc4RVN2K09OcUFXb3NPRURFUWFlUzlWcC81TXR3eE1FenRndldV?=
 =?utf-8?B?TWFMODF0Z2QvekZjN3dLVTQ1SWNodis4bGkra00wWXlhTkY5MURlZ1VZY1pY?=
 =?utf-8?B?RzFKWVRKWjhOaENrZTVLY0NlNElyZ1ovSFJLbnBQTFlFNWxQMEdEbVpwM1VD?=
 =?utf-8?B?emYrVmd5N0NkcDVpN3A3TVdxUXI4OVBXdUZWSHUvWDNuU2pZTEV5NXVUcU1S?=
 =?utf-8?B?aDlHZngyRFNvR0J6RXpvbWg5bU40Y05kdGhiRGtSMFRoL216U3ZZcW9uTE16?=
 =?utf-8?B?NlRlMldRRHBJSWMvQWdZajd4cFZNbEx3SnROKzNtazJxNUh4Rk1CWmtOWTdR?=
 =?utf-8?B?RlhTSzREUGF2NXdsbzA4SjV4R2RKM0tsU2tTVm1aVVhncnluV2I3cnJwWExE?=
 =?utf-8?B?ZmdWVWRzdCtSdExTTG9yTCtsOXhKd012eVJFaFhKR0wrTTZnVWtTZDVPYTJl?=
 =?utf-8?B?dWs3RTcxcWRHMGRQVlZwRHpHL05xa2pxOEF1QzRMZkg4a2QwVWtWWW1pUEhD?=
 =?utf-8?B?cXVWWm5DVlVuZ1ZTSWZ0SklEZlZiMTFDeGwxZ1MzMEkzeEwvWXFjYW9abXBm?=
 =?utf-8?B?c3RjcEhNMnc3a2VtT3pJQmlla0ducjdIVytkNkw4VDU4SVJEYlgxV2JSVkgw?=
 =?utf-8?B?azlaaUdDNmxnN0p0RkkrcldxdTZFektCbXNKcUdCMU9oT094RGhURnFpNS9F?=
 =?utf-8?B?ZStxRUZOY1JxWE9vdEg1SnlCMk1ZL2d2azJyZHNua2J2dE9aQW5ocmNuK2V6?=
 =?utf-8?B?WGJTK0Vyd3JaVjZaUml4cEYxdlpFY00rRi9GNWh5M1JmWnRmNllQWWJ4S0RT?=
 =?utf-8?B?YUtpTFBYazJBUm82UnhFVXJUOFRMZHhTQ0RzUTJZTmlJSENDd01mUHFzSzdH?=
 =?utf-8?B?VkkrNExEV0VFamc4cnlwL2UyTG1HOXRwbTZhWUtMUTh2Y1RZczZXbEp3THE1?=
 =?utf-8?B?K2UyMk9teWpoU1Vzalh3UTFvVkdNVTBSNG02ZHJPQ2x0WFI4a3BYRk5QTFNh?=
 =?utf-8?B?RkRZemJFRVlIZUVHVTVRTjlicjF2eTJiMkJaamorOEFZaHZscm9wOEwzcjhT?=
 =?utf-8?B?ZGVZcWZ1Ujdrck9Ha3hVN3JjR2ZVdHozWHhnSlpsOEwvQTB2RlVLTEV4anFa?=
 =?utf-8?B?ZUlqbGtaenVtbWMxYnBrbi9Rc0wrVUtxM2VDeWtTWWIxUG4rS3JjQnRkSmRN?=
 =?utf-8?B?M25QYTRzQ0ZQVEhzTWhXZ3lTUWVBYWFpYk4vNktRZDdZVUcwaDhwdWloeU9O?=
 =?utf-8?B?TWpOZTJSbERncXdKcGYxclNiNFdYRTI1NDlyTkZYNDU4d2h6bktyS0RmaUdh?=
 =?utf-8?B?VGtDSzVrbmhWWElKTitKd0tJeXJYMHJVMzVrNS80UVlVZVRuYjNVZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 00690ffb-9673-4ecb-5807-08dea52a7793
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 13:31:34.6416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F+hbXClKwbCYbzBCSmd+pA5oHafL1jYcxgkkTSxfDGcRMAjYa1ruVhS+lRo4wCQeJQYXLdRMgZz3k1vGi0pO5Ma3yQLTFF15X3KapDP+QV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7844
X-Rspamd-Queue-Id: B057C486C47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	TAGGED_FROM(0.00)[bounces-105003-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lists.freedesktop.org:email,bootlin.com:url,bootlin.com:email,bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]

SGkgTHVjYSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMdWNhIENl
cmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4uY29tPg0KPiBTZW50OiAyOCBBcHJpbCAyMDI2
IDE0OjIwDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMDgvMTFdIGRybS9icmlkZ2U6IGFkdjc1
MTE6IHN3aXRjaCB0byBvZl9kcm1fZ2V0X2JyaWRnZV9ieV9lbmRwb2ludCgpDQo+IA0KPiBPbiBU
dWUgQXByIDI4LCAyMDI2IGF0IDE6NTggUE0gQ0VTVCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gSGkg
YWxsLA0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IGRy
aS1kZXZlbCA8ZHJpLWRldmVsLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhh
bGYNCj4gPj4gT2YgQmlqdSBEYXMNCj4gPj4gU2VudDogMjggQXByaWwgMjAyNiAxMjo1MA0KPiA+
PiBTdWJqZWN0OiBSRTogW1BBVENIIHYyIDA4LzExXSBkcm0vYnJpZGdlOiBhZHY3NTExOiBzd2l0
Y2ggdG8NCj4gPj4gb2ZfZHJtX2dldF9icmlkZ2VfYnlfZW5kcG9pbnQoKQ0KPiA+Pg0KPiA+Pg0K
PiA+PiBIaSwNCj4gPj4NCj4gPj4gVGhhbmtzIGZvciB0aGUgcGF0Y2guDQo+ID4+DQo+ID4+ID4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gPiBGcm9tOiBkcmktZGV2ZWwgPGRyaS1k
ZXZlbC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmDQo+ID4+ID4gT2Yg
THVjYSBDZXJlc29saQ0KPiA+PiA+IFNlbnQ6IDI4IEFwcmlsIDIwMjYgMTA6MTYNCj4gPj4gPiBT
dWJqZWN0OiBbUEFUQ0ggdjIgMDgvMTFdIGRybS9icmlkZ2U6IGFkdjc1MTE6IHN3aXRjaCB0bw0K
PiA+PiA+IG9mX2RybV9nZXRfYnJpZGdlX2J5X2VuZHBvaW50KCkNCj4gPj4gPg0KPiA+PiA+IFRo
aXMgZHJpdmVyIGNhbGxzIGRybV9vZl9maW5kX3BhbmVsX29yX2JyaWRnZSgpIHdpdGggYSBOVUxM
IHBvaW50ZXINCj4gPj4gPiBpbiB0aGUgQHBhbmVsIHBhcmFtZXRlciwgdGh1cyB1c2luZyBhIHJl
ZHVjZWQgZmVhdHVyZSBzZXQgb2YgdGhhdCBmdW5jdGlvbi4NCj4gPj4gPiBSZXBsYWNlIHRoaXMg
Y2FsbCB3aXRoIHRoZSBzaW1wbGVyIG9mX2RybV9nZXRfYnJpZGdlX2J5X2VuZHBvaW50KCkuDQo+
ID4+ID4NCj4gPj4gPiBTaW5jZSBvZl9kcm1fZ2V0X2JyaWRnZV9ieV9lbmRwb2ludCgpIGluY3Jl
YXNlcyB0aGUgcmVmY291bnQgb2YgdGhlDQo+ID4+ID4gcmV0dXJuZWQgYnJpZGdlLCBlbnN1cmUg
aXQgaXMgcHV0IG9uIHJlbW92YWwuIFRvIGFjaGlldmUgdGhpcywNCj4gPj4gPiBpbnN0ZWFkIG9m
IGFkZGluZyBhbiBleHBsaWNpdCBkcm1fYnJpZGdlX3B1dCgpLCBtaWdyYXRlIHRvIHRoZQ0KPiA+
PiA+IGJyaWRnZTo6bmV4dF9icmlkZ2UgcG9pbnRlciB3aGljaCBpcw0KPiA+PiBhdXRvbWF0aWNh
bGx5IHB1dCB3aGVuIHRoZSBicmlkZ2UgaXMgZXZlbnR1YWxseSBmcmVlZC4NCj4gPj4gPg0KPiA+
PiA+IFNpZ25lZC1vZmYtYnk6IEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9vdGxpbi5j
b20+DQo+ID4+ID4gLS0tDQo+ID4+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9h
ZHY3NTExLmggICAgIHwgIDEgLQ0KPiA+PiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1
MTEvYWR2NzUxMV9kcnYuYyB8IDExICsrKysrLS0tLS0tDQo+ID4+ID4gIDIgZmlsZXMgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiA+PiA+DQo+ID4+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExLmgNCj4gPj4gPiBi
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExLmgNCj4gPj4gPiBpbmRleCA4
YmU3MjY2ZmQ0ZjQuLjEyYzk1MTk4ZDlhNCAxMDA2NDQNCj4gPj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMS5oDQo+ID4+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTEuaA0KPiA+PiA+IEBAIC0zNTQsNyArMzU0LDYgQEAg
c3RydWN0IGFkdjc1MTEgew0KPiA+PiA+ICAJZW51bSBkcm1fY29ubmVjdG9yX3N0YXR1cyBzdGF0
dXM7DQo+ID4+ID4gIAlib29sIHBvd2VyZWQ7DQo+ID4+ID4NCj4gPj4gPiAtCXN0cnVjdCBkcm1f
YnJpZGdlICpuZXh0X2JyaWRnZTsNCj4gPj4gPiAgCXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIGN1
cnJfbW9kZTsNCj4gPj4gPg0KPiA+PiA+ICAJdW5zaWduZWQgaW50IGZfdG1kczsNCj4gPj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMN
Cj4gPj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jDQo+
ID4+ID4gaW5kZXggNmJkNzZjMWZiMDA3Li40OThlMzg1NzlhMGYgMTAwNjQ0DQo+ID4+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMNCj4gPj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYw0KPiA+PiA+
IEBAIC04NTEsOCArODUxLDggQEAgc3RhdGljIGludCBhZHY3NTExX2JyaWRnZV9hdHRhY2goc3Ry
dWN0IGRybV9icmlkZ2UgKmJyaWRnZSwNCj4gPj4gPiAgCXN0cnVjdCBhZHY3NTExICphZHYgPSBi
cmlkZ2VfdG9fYWR2NzUxMShicmlkZ2UpOw0KPiA+PiA+ICAJaW50IHJldCA9IDA7DQo+ID4+ID4N
Cj4gPj4gPiAtCWlmIChhZHYtPm5leHRfYnJpZGdlKSB7DQo+ID4+ID4gLQkJcmV0ID0gZHJtX2Jy
aWRnZV9hdHRhY2goZW5jb2RlciwgYWR2LT5uZXh0X2JyaWRnZSwgYnJpZGdlLA0KPiA+PiA+ICsJ
aWYgKGFkdi0+YnJpZGdlLm5leHRfYnJpZGdlKSB7DQo+ID4+ID4gKwkJcmV0ID0gZHJtX2JyaWRn
ZV9hdHRhY2goZW5jb2RlciwgYWR2LT5icmlkZ2UubmV4dF9icmlkZ2UsDQo+ID4+ID4gK2JyaWRn
ZSwNCj4gPj4gPiAgCQkJCQlmbGFncyB8IERSTV9CUklER0VfQVRUQUNIX05PX0NPTk5FQ1RPUik7
DQo+ID4+ID4gIAkJaWYgKHJldCkNCj4gPj4gPiAgCQkJcmV0dXJuIHJldDsNCj4gPj4gPiBAQCAt
MTI1MSwxMCArMTI1MSw5IEBAIHN0YXRpYyBpbnQgYWR2NzUxMV9wcm9iZShzdHJ1Y3QgaTJjX2Ns
aWVudA0KPiA+PiA+ICppMmMpDQo+ID4+ID4NCj4gPj4gPiAgCW1lbXNldCgmbGlua19jb25maWcs
IDAsIHNpemVvZihsaW5rX2NvbmZpZykpOw0KPiA+PiA+DQo+ID4+ID4gLQlyZXQgPSBkcm1fb2Zf
ZmluZF9wYW5lbF9vcl9icmlkZ2UoZGV2LT5vZl9ub2RlLCAxLCAtMSwgTlVMTCwNCj4gPj4gPiAt
CQkJCQkgICZhZHY3NTExLT5uZXh0X2JyaWRnZSk7DQo+ID4+ID4gLQlpZiAocmV0ICYmIHJldCAh
PSAtRU5PREVWKQ0KPiA+PiA+IC0JCXJldHVybiByZXQ7DQo+ID4+ID4gKwlhZHY3NTExLT5icmlk
Z2UubmV4dF9icmlkZ2UgPSBvZl9kcm1fZ2V0X2JyaWRnZV9ieV9lbmRwb2ludChkZXYtPm9mX25v
ZGUsIDEsIC0xKTsNCj4gPj4gPiArCWlmIChJU19FUlIoYWR2NzUxMS0+YnJpZGdlLm5leHRfYnJp
ZGdlKSAmJiBQVFJfRVJSKGFkdjc1MTEtPmJyaWRnZS5uZXh0X2JyaWRnZSkgIT0gLUVOT0RFVikN
Cj4gPj4gPiArCQlyZXR1cm4gUFRSX0VSUihhZHY3NTExLT5icmlkZ2UubmV4dF9icmlkZ2UpOw0K
PiA+Pg0KPiA+PiBEb2VzIGl0IGNyYXNoLCBpZiB0aGUgZXJyb3IgaXMgIC1FUFJPQkVfREVGRVI/
DQo+ID4NCj4gPiBJIHNlZSBhIGNyYXNoIHdpdGggcGF0Y2ggWzFdLCB3aGljaCBpcyBmaXhlZCBi
eSBhdm9pZGluZyB0aGUgZGlyZWN0IGFzc2lnbm1lbnQuDQo+IA0KPiBBaCwgZGFtbWl0ISBHb29k
IGNhdGNoLCB0aGFua3MgZm9yIHRoZSBxdWljayB0ZXN0aW5nIGFuZCBmb2xsb3ctdXAhDQo+IA0K
PiBJbmRlZWQgdGhpcyBkcml2ZXIgYXNzdW1lcyBuZXh0X2JyaWRnZSBpcyBlaXRoZXIgTlVMTCBv
ciBhIHZhbGlkIHBvaW50ZXIsIGJ1dCBkdWUgdG8gdGhlICdpZihJU19FUlIoKQ0KPiAmJiBzb21l
X290aGVyX2NvbmRpdGlvbiknIG5vdyBpdCBjYW4gYWxzbyBiZSAtRU5PREVWIChub3QgLUVQUk9C
RV9ERUZFUiwgYnV0IHRoYXQncyBpcnJlbGV2YW50KS4NCj4gDQo+IFRoaXMgYWZmZWN0cyB0aGUg
bXNtIGFuZCB6eW5xbXBfZHAgcGF0Y2hlcyBlcXVhbGx5Lg0KPiANCj4gSSdtIHNlbmRpbmcgYSB2
MyBzb29uIHdpdGggdGhlc2UgZml4ZWQuIEknbSBqdXN0IG5vdCBzdXJlIHdoaWNoIGFwcHJvYWNo
IHRvIHVzZSB0byBmaXggKHNhbWUgZm9yIGFsbA0KPiB0aGUgMyBwYXRjaGVzKS4gQWx0ZXJuYXRp
dmVzIGFyZToNCj4gDQo+ICAxLiAtRU5PREVWIGlzIGFjY2VwdGVkLCBzZXQgbmV4dF9icmlkZ2Ug
dG8gTlVMTCB3aGVuIGl0IGhhcHBlbnM6DQo+IA0KPiAgICAgICAtICAgICAgIGlmIChJU19FUlIo
YWR2NzUxMS0+YnJpZGdlLm5leHRfYnJpZGdlKSAmJiBQVFJfRVJSKGFkdjc1MTEtPmJyaWRnZS5u
ZXh0X2JyaWRnZSkgIT0gLQ0KPiBFTk9ERVYpDQo+ICAgICAgIC0gICAgICAgICAgICAgICByZXR1
cm4gUFRSX0VSUihhZHY3NTExLT5icmlkZ2UubmV4dF9icmlkZ2UpOw0KPiAgICAgICArICAgICAg
IGlmIChJU19FUlIoYWR2NzUxMS0+YnJpZGdlLm5leHRfYnJpZGdlKSkgew0KPiAgICAgICArICAg
ICAgICAgICAgICAgaWYgKFBUUl9FUlIoYWR2NzUxMS0+YnJpZGdlLm5leHRfYnJpZGdlKSA9PSAt
RU5PREVWKQ0KPiAgICAgICArICAgICAgICAgICAgICAgICAgICAgICBhZHY3NTExLT5icmlkZ2Uu
bmV4dF9icmlkZ2UgPSBOVUxMOw0KPiAgICAgICArICAgICAgICAgICAgICAgZWxzZQ0KPiAgICAg
ICArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihhZHY3NTExLT5icmlkZ2Uu
bmV4dF9icmlkZ2UpOw0KDQpUaGUgcG9pbnQgaXMgeW91IGNhbm5vdCByZXR1cm4gUFRSX0VSUiBh
cyBpdCB3aWxsIGxlYWQgdG8gY3Jhc2gsIGlmIGl0IGlzDQpkaXJlY3QgYXNzaWdubWVudC4NCg0K
ICAgaWYgKElTX0VSUihhZHY3NTExLT5icmlkZ2UubmV4dF9icmlkZ2UpKSB7DQoJaW50IGVyciA9
IFBUUl9FUlIoYWR2NzUxMS0+YnJpZGdlLm5leHRfYnJpZGdlKTsNCglhZHY3NTExLT5icmlkZ2Uu
bmV4dF9icmlkZ2UgPSBOVUxMOw0KCXJldHVybiBlcnI7DQogIH0NCg0KQ2hlZXJzLA0KQmlqdQ0K
DQo+ICAyLiBsZXQgbmV4eHRfYnJpZGdlIGhvbGQgLUVOT0RFViBidXQgaWdub3JlIGl0IHdoZW4g
aXQgaXMgdXNlZCAob25seSBpbg0KPiAgICAgdGhlIGF0dGFjaCBvcCwgZm9yIGFsbCAzIGRyaXZl
cnMpOg0KPiANCj4gICAgICAgLSAgICAgICBpZiAoYWR2LT5icmlkZ2UubmV4dF9icmlkZ2UpIHsN
Cj4gICAgICAgKyAgICAgICBpZiAoIUlTX0VSUl9PUl9OVUxMKGFkdi0+YnJpZGdlLm5leHRfYnJp
ZGdlKSkgew0KPiANCj4gV2hpbGUgdGhlIGxhdHRlciBhcHByb2FjaCBpbnZvbHZlcyBsZXNzIGNv
ZGUsIGl0IG1pZ2h0IGxldCBlcnJvcnMgc25lYWsgaW4gaW4gY2FzZSBuZXcgdXNhZ2VzIG9mDQo+
IG5leHRfYnJpZGdlIGFyZSBhZGRlZCB3aXRoIGp1c3QgYSBOVUxMIGNoZWNrLg0KPiANCj4gT3Bp
bmlvbnMgYWJvdXQgdGhlIHR3bz8NCj4gDQo+IEx1Y2ENCj4gDQo+IC0tDQo+IEx1Y2EgQ2VyZXNv
bGksIEJvb3RsaW4NCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZw0KPiBo
dHRwczovL2Jvb3RsaW4uY29tDQo=

