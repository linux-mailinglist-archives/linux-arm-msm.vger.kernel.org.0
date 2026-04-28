Return-Path: <linux-arm-msm+bounces-105024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGSkOWvJ8GmfYgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:51:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A76A4875A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:51:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F0A230A5504
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C2243CEF3;
	Tue, 28 Apr 2026 14:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wYsjM5yn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010053.outbound.protection.outlook.com [52.101.229.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B782F260C;
	Tue, 28 Apr 2026 14:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777387553; cv=fail; b=m4+6eSCvdtH9LOSJxnKiWyZw3qJL9ernViv3j1rY+C8SnauGNDeXzTAs3fN47d4ewujnKYQvK7oM3UpW2h6JTp/ELx1OYm7u0jW8tCW7KgVTFzmU1n4GF3sVeIyLZykY4QfpG3Xr9f37UQMDXHrUU32IcCY93/xttahuBDaVxno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777387553; c=relaxed/simple;
	bh=DPNDcxTNqPDfCa3I6jaZITekXQfT7d1YFAA5FAfDaSY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NhR4EQp/0ustjc+0D0jxmPlqT+/ceYtSa1vlhdwnr5uKd6KeSxHi9ezAcvRu65GVejewLFJpPAOxEgKjm70p7zCBHPGea3pStkAzmdBrGHJq7UkxaIZZlbK0LStzOm0ex99EpIcltXXb1lerMWCxm5Iz9p80csRP5hVPPCxgucQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wYsjM5yn; arc=fail smtp.client-ip=52.101.229.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IXYENmMNS7SnZfAaWOCpHRbuDJBxROThxJP6WFo9u9E++MEGwIUfprEyJUbYpMFq/c12NqbXGgH4TwOdNh7CPHcpX8MDyFAb8H36g3ERRE9lT8gnmOgH/sAGrFYmfj4LaIgWT1rECEo+g+OQvSC3RdCtFqw+gfqkMH90NuCxF1ZEe+i0GhFn+tnniPb1dP7+XI6yfn2edxOQdQNr5i2EVw/tmuabK4P7U3wq1X9v16DOMXm8YjR1NE9SdyPegIOf9mHw81jhovqVU6AVs6epg7flm7r642iYRyx6dn/onCI97KrArR+23DO+2CrIztMTX45a1gBBm2/8OTIzzXo0hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPNDcxTNqPDfCa3I6jaZITekXQfT7d1YFAA5FAfDaSY=;
 b=WSYkpZBgKytBLg6Z31ix8nes2+Js7VTIw6gYPaXQReku3Ve6I2v46AjPSOAuYhhTorqJqr4ZHzxAQik4hTgER1Hs8R/cY369kYzNYqwdwH7/Bo9oh4PT6luwPdxDNCRVIX2JDRoWM/8NtQuo3SpETPG7v4K15fL6ctTDiaSXP+8Iyaj+IRXhkpEcpotRE0cjp8syhsQbm7AbqhZ3IGgbPDNUbw4fMI8wW6uk/S/302C3efhC/VcHGs5ws8DlGWfVt0hmNJSwJBD2w4+8G0CzWlNwb4lelIR1NdfI+KI5NsRnFkOJQNcX3BdtEs1zF/53dVlBsUXgy0zsOo7/Jrdzxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPNDcxTNqPDfCa3I6jaZITekXQfT7d1YFAA5FAfDaSY=;
 b=wYsjM5yn9UCeVWFNSZt6h4N/mv0Cn4OHKfEybezEZgn5nR1A+Di3GM8hOdwlGXDb9ceNtukyK+x2CAvhfYY6ZJlAT4R4hT4KhGaSBjEXYQPhoSMhwlrJSgYeaYSD0hbwtYc1Teoq04fCahqBMDu9hhF720YG397kuJlt8WHhTcQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB11085.jpnprd01.prod.outlook.com (2603:1096:400:3a5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 14:45:48 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 14:45:48 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Maarten Lankhorst
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
 AQHc1u/CLMxk+VTSG02AXPmSMDjmUbX0WyoQgAACgvCAABfEgIAAAYVQgAAGVYCAAAKiMIAACyhwgAACLSA=
Date: Tue, 28 Apr 2026 14:45:48 +0000
Message-ID:
 <TY3PR01MB113466FD12513A25C0126A55F86372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References:
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-8-4300744a1c47@bootlin.com>
 <TY3PR01MB113466B70BFD2899AB0CF47AD86372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB1134674FDD088299A4382D3D286372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <DI4TGV2WURTY.39OXE7WWKRLA1@bootlin.com>
 <TY3PR01MB11346E82D19FBE8544F51624286372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <DI4U2DT3OBMR.23T3F7X8P75RU@bootlin.com>
 <TY3PR01MB113465B0308DE16ACC48D1E8186372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB11346293C9AAF8BC4B3FCAD6586372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB11346293C9AAF8BC4B3FCAD6586372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB11085:EE_
x-ms-office365-filtering-correlation-id: bf1425f8-fa9f-485b-31c9-08dea534d64e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|56012099003|18002099003|22082099003|921020|38070700021;
x-microsoft-antispam-message-info:
 UGrUHBfy5pbH0C4GnLLkozEynPWengd95zasZ11/gQQSbivpVpLPBbRlo9jHSMsgWCMxK/ba4Q9aACmQbzPhuesSj+YnEuoSDMoXl4GgvQ+H1u7SR6ZNwHKJZEc2prxQeIN7NXhQ69AsmJxhK0NVEY3bTZTnpRIfJ5zocS7kBbBV2GdUaVaoTdZUSiZ/fe3MZ6FpR35afe7DqhbwBQQHLa2AdzIRm0hMeYzam7JJ6VfXK27w6inq/JBrLzoFmYqoikKjREQ2oYgmrl2GOV5Qe1w2XqTzoTxdEGhdYOcjSiOCLBAgzUixrgLJxtBg3etL5pKPZfeTXv9LbW3k0QU5ee45lYjotKQfHF7X4LI/g0Qn/auqOdtHxQAJ/6vpa5pfBtYBJA3VmDeHl2gV8BHiTEE29dkb/rjT+8V9zfHeHavxcTOnmO74UgGAyyQje0J7ne3487SNiJZjV+b84GSee3Sv/RyvIzqg1oRQCR79RR23mt4c8Yhso5NmG2j7XETFdnUZ9c+cr45lanGw/KDY6ZOZ1VS9nS60dT1xKIEvdbg+JLV3DNIxYUVaTy2m8Jy0WlYIoV5jiUA/BbcsY7hn73f3b/2ra9jafskVfWJWEeEAMkokGYIDYCliUhD3KwoNbd/0IlAEDjOstjoKx8R2KNqq6nM5Xem9g8Lu1CTu/ZDPxSEWzRq8Mgy2KVbXOKANGErOA0zKcSi5ix6kFrEkynCXQaLYRRMEsVUUYqUUITjCx/wU3MkKnDhdvP6AnNtLeZHzkzcknMSx0bCos1tfjn2+xEFjKJVQk9TlMsiXkh1uk4uWY4LU1fBnqvJWtPtv
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a21ENUNUdDVsYTNDTHlLK3ZwajhHMmRoYVBKczFlbFQ2SWxrY1ZJd3IrdFNX?=
 =?utf-8?B?Tk5NeVNaQ2lPMy85aVE5R0gzdjBwdkxUejVpcWk4TDlTSGZJS1VoQzRyV0w2?=
 =?utf-8?B?clBKS2V3YzR0bERrRlRoNS8rbFNmZUM4OFVXeW9wQTJHOTZjbGVkWGxYS28w?=
 =?utf-8?B?MmlVbWd4YWdDZEl0VVJRd0lJK0xwdnVpUGttdi9sdlRCTXp4SEhmeHF1NXI5?=
 =?utf-8?B?RHJrc00vSWZjU3JyYVJXdzFFU0s1TzNQVUpZVXpLbjNkM3R0UlNvVk9rU1A4?=
 =?utf-8?B?Si9vbk56MEJOWGpmMmdkalA5Y29tZitqL2E0QitrdmZZaGE1ZHQ3RjZGc3FW?=
 =?utf-8?B?Q2F3TFdJSWpCYWg2NWMzVkhBWUE1UVpsUit1T3dpV2lwZHVQQk1mRHpEVGla?=
 =?utf-8?B?dkUrSFIxL1V0bTZWT3VLanh2TGRxRlVlUWdqU014M1FQUUNueHBWRVRyeitt?=
 =?utf-8?B?aks1VmtwMVZWSVo2eEZha2k1aXVrY1d2TFJDcmpWR3R0WVdYaFNDclNhZ0Mx?=
 =?utf-8?B?Yll3aExraS9aT0NkRHhXVXlzUFVQU0dVTFFBVnlJTCtmdEl3V0hZMVo3OVFX?=
 =?utf-8?B?TjFVWHZEN21QMFJ3cm9DUmdOOXAxNWl6UzltUXRGMXV3OUprdlBPSG5KMndB?=
 =?utf-8?B?M2Z3QVh1ekF4THpOeVRlVDBXMlFwd1FEc3dhSUpsdS9kemVyQVNOc3pKNzky?=
 =?utf-8?B?THp3L251SmN0eUo5dUFheklGUmlucWpkSHZFcklhZXRieDZVZjBZaUJRejJ0?=
 =?utf-8?B?NHBVZ3lBRFU5RmZxbXMvMWtReEdiSXJHSFNZaHRSSVhpVWhoZU5vSU9sVno3?=
 =?utf-8?B?RVVPU1U0UkJUWWM1L3BIcDV3dHMva2U1d25BbjlNMGZlQm5iUE1wMUNlaEhH?=
 =?utf-8?B?UnRveHpJcjkwU1hTRHlqNXNvc21pTWhrSGxueXFOWndhM1pDVUNPYmM2SDlX?=
 =?utf-8?B?MnJCV3M2aVZocGFkdUZieDNDa0lSK3lONjlIU0VrWG8wZENTOE1IOS85NDEw?=
 =?utf-8?B?QlhOeDdndGJVd3gxbWEreUpHMk5HRXh2bk9SdldiSldSenB3eS95Tkllc1Bz?=
 =?utf-8?B?cGxPQmhZUVpqYzlVcVZ0K0xzUm1jNkFwYzVIWG5zcVJtdlkzM2wvVFdlQ1hw?=
 =?utf-8?B?MmVGdXhPVzFGUXVvVkxTWVh2N2hMK2dRczJucDg3aG80bXprR3ZHRzF4WEhT?=
 =?utf-8?B?ZU0wVC9HUHJqNWZTYU9PTDFqZGxUcTRxb005SC9xNy82em9WV2dvakJoellK?=
 =?utf-8?B?RVM0L2xLWUpuUERocm1kRzlPMGpZQ0MwL3VSMDVEMHhlaG1TUTlVM3YzL1di?=
 =?utf-8?B?elNpUWpKZ1RNZzk4RG1nN1BLbitYdFBGWU14UHdQWDhoTlkyeG0xZm4xV2lK?=
 =?utf-8?B?L3F4NnJQZjdYZVJHTHZDWFE3WSszeG1ZVm5tNVJhVTJjeEVGZFJjSlhsUWl1?=
 =?utf-8?B?Z2ZoY1RUZzByaGVoMWZiUTdwSGVrTmw0WHNEbEUxcmVGYWRJTVAvVFkrUU9G?=
 =?utf-8?B?MU1vVVcrOFNiYk1VeS9CSUkrN2Z4a2VwakpqVENOMUNDNEdEUFFVcEJ4WFA0?=
 =?utf-8?B?MEVidlNkRWhrYktmYjk4RHNJRkZVM3JWQ1VOdW92eFEra0hOUysrRFhadzFF?=
 =?utf-8?B?LzI5VFFGemRhaStQK1dwUXFKK0ZNR0tGZXRiZmdiL1hleFl0cHhVSy9XK0Fx?=
 =?utf-8?B?U2hmRFd4WE5Gd2ZwTHZ5ZEhZdlJhOHVoVWNicXdwRDdWczBjQlg4T3NTajMw?=
 =?utf-8?B?dzB6Z25ZMFdZMXlibmQ2TWtlR2JFNmJIcEpjL3Jpai9MK01pd1Z3cWluQ0FR?=
 =?utf-8?B?dEhBQ2w5UllaSndtMDk4UHRvcERCK0Z3bWtMNUcxNkZ0VWJCWjVKQnQ1TXl1?=
 =?utf-8?B?Tno1VC9qWHVHR3JYN3lzdm5McUtkd0V0ampvaUlGY04wQTZ2aGlNb0V3R2VG?=
 =?utf-8?B?L1RlNjh0M1R5Y1dJb3VxRXB2TGg4R3U3bW9ZOG1LaVBwT1diMHBMOW5GYWI5?=
 =?utf-8?B?eW5EdUdEZnoxVGwvcko5dkdpSjJ5OGFJREYvK1pLdy9ub3NHbitLU0F6MUNi?=
 =?utf-8?B?elRSeXhlcWExZ3Q5SVlUL0pTZXg4VTR2cnNlc3kydnJDRXJSMHZBRzZXU2ti?=
 =?utf-8?B?TkY2SkJZQk5qbVpjSVVMOU5CbVFwUTYvWUZJR0VPbDUxREVYbUlUaHdzNUph?=
 =?utf-8?B?QjhkeVhHcHJYRG9GaHZJRzdudmg2NFo2dDNkd0FiRCtuVkhJVWFjeXdSbThU?=
 =?utf-8?B?Q0NUK0doNEpmQWh2dEpROWlSR2FGdTdlck16eWkyY2tiQVY5cWF4S0ErZFh1?=
 =?utf-8?B?dkFHMkRpd0ZMMjltN0hIUCtSUmVoMllrWld5THVPVW10d1RyazdZQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1425f8-fa9f-485b-31c9-08dea534d64e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 14:45:48.5432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YmEHsvBiQyGOHudOpqu2mjN8JQQjCSgf8DOQLBQOtlmYPaIKDcGlHoAl4bdTmqYDMtjOnaIma4MJ8rUVhyZ3g4v0hvc/F9iam1l19yNW+hU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11085
X-Rspamd-Queue-Id: 4A76A4875A4
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
	RCPT_COUNT_TWELVE(0.00)[33];
	TAGGED_FROM(0.00)[bounces-105024-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,bootlin.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,hisilicon.com,linaro.org,google.com,intel.com,ideasonboard.com,kwiboo.se,amd.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:dkim,lists.freedesktop.org:email]

SGkgTHVjYSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBkcmktZGV2
ZWwgPGRyaS1kZXZlbC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9m
IEJpanUgRGFzDQo+IFNlbnQ6IDI4IEFwcmlsIDIwMjYgMTU6MzkNCj4gU3ViamVjdDogUkU6IFtQ
QVRDSCB2MiAwOC8xMV0gZHJtL2JyaWRnZTogYWR2NzUxMTogc3dpdGNoIHRvIG9mX2RybV9nZXRf
YnJpZGdlX2J5X2VuZHBvaW50KCkNCj4gDQo+IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+IEZyb206IEJpanUgRGFzDQo+ID4gU2VudDogMjggQXByaWwgMjAyNiAxNTow
Mg0KPiA+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjIgMDgvMTFdIGRybS9icmlkZ2U6IGFkdjc1MTE6
IHN3aXRjaCB0bw0KPiA+IG9mX2RybV9nZXRfYnJpZGdlX2J5X2VuZHBvaW50KCkNCj4gPg0KPiA+
IEhpIEx1Y2EsDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBG
cm9tOiBMdWNhIENlcmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4uY29tPg0KPiA+ID4gU2Vu
dDogMjggQXByaWwgMjAyNiAxNDo0OA0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwOC8x
MV0gZHJtL2JyaWRnZTogYWR2NzUxMTogc3dpdGNoIHRvDQo+ID4gPiBvZl9kcm1fZ2V0X2JyaWRn
ZV9ieV9lbmRwb2ludCgpDQo+ID4gPg0KPiA+ID4gSGVsbG8sDQo+ID4gPg0KPiA+ID4gT24gVHVl
IEFwciAyOCwgMjAyNiBhdCAzOjMxIFBNIENFU1QsIEJpanUgRGFzIHdyb3RlOg0KPiA+ID4gPj4g
Pj4gPiBAQCAtMTI1MSwxMCArMTI1MSw5IEBAIHN0YXRpYyBpbnQgYWR2NzUxMV9wcm9iZShzdHJ1
Y3QNCj4gPiA+ID4+ID4+ID4gaTJjX2NsaWVudA0KPiA+ID4gPj4gPj4gPiAqaTJjKQ0KPiA+ID4g
Pj4gPj4gPg0KPiA+ID4gPj4gPj4gPiAgCW1lbXNldCgmbGlua19jb25maWcsIDAsIHNpemVvZihs
aW5rX2NvbmZpZykpOw0KPiA+ID4gPj4gPj4gPg0KPiA+ID4gPj4gPj4gPiAtCXJldCA9IGRybV9v
Zl9maW5kX3BhbmVsX29yX2JyaWRnZShkZXYtPm9mX25vZGUsIDEsIC0xLCBOVUxMLA0KPiA+ID4g
Pj4gPj4gPiAtCQkJCQkgICZhZHY3NTExLT5uZXh0X2JyaWRnZSk7DQo+ID4gPiA+PiA+PiA+IC0J
aWYgKHJldCAmJiByZXQgIT0gLUVOT0RFVikNCj4gPiA+ID4+ID4+ID4gLQkJcmV0dXJuIHJldDsN
Cj4gPiA+ID4+ID4+ID4gKwlhZHY3NTExLT5icmlkZ2UubmV4dF9icmlkZ2UgPSBvZl9kcm1fZ2V0
X2JyaWRnZV9ieV9lbmRwb2ludChkZXYtPm9mX25vZGUsIDEsIC0xKTsNCj4gPiA+ID4+ID4+ID4g
KwlpZiAoSVNfRVJSKGFkdjc1MTEtPmJyaWRnZS5uZXh0X2JyaWRnZSkgJiYgUFRSX0VSUihhZHY3
NTExLT5icmlkZ2UubmV4dF9icmlkZ2UpICE9IC0NCj4gRU5PREVWKQ0KPiA+ID4gPj4gPj4gPiAr
CQlyZXR1cm4gUFRSX0VSUihhZHY3NTExLT5icmlkZ2UubmV4dF9icmlkZ2UpOw0KPiA+ID4gPj4g
Pj4NCj4gPiA+ID4+ID4+IERvZXMgaXQgY3Jhc2gsIGlmIHRoZSBlcnJvciBpcyAgLUVQUk9CRV9E
RUZFUj8NCj4gPiA+ID4+ID4NCj4gPiA+ID4+ID4gSSBzZWUgYSBjcmFzaCB3aXRoIHBhdGNoIFsx
XSwgd2hpY2ggaXMgZml4ZWQgYnkgYXZvaWRpbmcgdGhlIGRpcmVjdCBhc3NpZ25tZW50Lg0KPiA+
ID4gPj4NCj4gPiA+ID4+IEFoLCBkYW1taXQhIEdvb2QgY2F0Y2gsIHRoYW5rcyBmb3IgdGhlIHF1
aWNrIHRlc3RpbmcgYW5kIGZvbGxvdy11cCENCj4gPiA+ID4+DQo+ID4gPiA+PiBJbmRlZWQgdGhp
cyBkcml2ZXIgYXNzdW1lcyBuZXh0X2JyaWRnZSBpcyBlaXRoZXIgTlVMTCBvciBhIHZhbGlkDQo+
ID4gPiA+PiBwb2ludGVyLCBidXQgZHVlIHRvIHRoZSAnaWYoSVNfRVJSKCkgJiYgc29tZV9vdGhl
cl9jb25kaXRpb24pJw0KPiA+ID4gPj4gbm93IGl0IGNhbiBhbHNvIGJlIC1FTk9ERVYgKG5vdCAt
DQo+ID4gPiBFUFJPQkVfREVGRVIsIGJ1dCB0aGF0J3MgaXJyZWxldmFudCkuDQo+ID4gPiA+Pg0K
PiA+ID4gPj4gVGhpcyBhZmZlY3RzIHRoZSBtc20gYW5kIHp5bnFtcF9kcCBwYXRjaGVzIGVxdWFs
bHkuDQo+ID4gPiA+Pg0KPiA+ID4gPj4gSSdtIHNlbmRpbmcgYSB2MyBzb29uIHdpdGggdGhlc2Ug
Zml4ZWQuIEknbSBqdXN0IG5vdCBzdXJlIHdoaWNoDQo+ID4gPiA+PiBhcHByb2FjaCB0byB1c2Ug
dG8gZml4IChzYW1lIGZvciBhbGwgdGhlIDMgcGF0Y2hlcykuIEFsdGVybmF0aXZlcyBhcmU6DQo+
ID4gPiA+Pg0KPiA+ID4gPj4gIDEuIC1FTk9ERVYgaXMgYWNjZXB0ZWQsIHNldCBuZXh0X2JyaWRn
ZSB0byBOVUxMIHdoZW4gaXQgaGFwcGVuczoNCj4gPiA+ID4+DQo+ID4gPiA+PiAgICAgICAtICAg
ICAgIGlmIChJU19FUlIoYWR2NzUxMS0+YnJpZGdlLm5leHRfYnJpZGdlKSAmJiBQVFJfRVJSKGFk
djc1MTEtPmJyaWRnZS5uZXh0X2JyaWRnZSkgIT0NCj4gLQ0KPiA+ID4gPj4gRU5PREVWKQ0KPiA+
ID4gPj4gICAgICAgLSAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKGFkdjc1MTEtPmJyaWRn
ZS5uZXh0X2JyaWRnZSk7DQo+ID4gPiA+PiAgICAgICArICAgICAgIGlmIChJU19FUlIoYWR2NzUx
MS0+YnJpZGdlLm5leHRfYnJpZGdlKSkgew0KPiA+ID4gPj4gICAgICAgKyAgICAgICAgICAgICAg
IGlmIChQVFJfRVJSKGFkdjc1MTEtPmJyaWRnZS5uZXh0X2JyaWRnZSkgPT0gLUVOT0RFVikNCj4g
PiA+ID4+ICAgICAgICsgICAgICAgICAgICAgICAgICAgICAgIGFkdjc1MTEtPmJyaWRnZS5uZXh0
X2JyaWRnZSA9IE5VTEw7DQo+ID4gPiA+PiAgICAgICArICAgICAgICAgICAgICAgZWxzZQ0KPiA+
ID4gPj4gICAgICAgKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIoYWR2NzUx
MS0+YnJpZGdlLm5leHRfYnJpZGdlKTsNCj4gPiA+ID4NCj4gPiA+ID4gVGhlIHBvaW50IGlzIHlv
dSBjYW5ub3QgcmV0dXJuIFBUUl9FUlIgYXMgaXQgd2lsbCBsZWFkIHRvIGNyYXNoLA0KPiA+ID4g
PiBpZiBpdCBpcyBkaXJlY3QgYXNzaWdubWVudC4NCj4gPiA+DQo+ID4gPiBJdCB3b3VsZCBkZWZp
bml0ZWx5IGNyYXNoIHdoZW4gdGhlIG5leHRfYnJpZGdlIGlzIGRlcmVmZXJlbmNlZA0KPiA+ID4g
KHdoaWNoIGhhcHBlbnMgaW4NCj4gPiA+IGFkdjc1MTFfYnJpZGdlX2F0dGFjaCgpKSBidXQgSSBk
b24ndCBzZWUgaG93IGl0IGNhbiBjcmFzaCBoZXJlLiBIZXJlDQo+ID4gPiBpdCBfY2FuXyBiZSBh
c3NpZ25lZCAtRU5PREVWLCBidXQgaXQgd291bGQgYmUgaW1tZWRpYXRlbHkgYmUgY2xlYXJlZA0K
PiA+ID4gdG8gTlVMTCwgb3IgdG8gZW5vdGhlciBlcnJvciwgYnV0IHdlJ2QgaW1tZWRpYXRlbHkg
cmV0dXJuLiBBbmQgaW4NCj4gPiA+IGNhc2Ugb2YgcmV0dXJuLCB3aGVuIG5leHRfYnJpZGdlIGlz
IGNsZWFyZWQgYnkgX19kcm1fYnJpZGdlX2ZyZWUgLT4NCj4gPiA+IGRybV9icmlkZ2VfcHV0LCB0
aGUgZXJyb3IgdmFsdWUgd291bGQNCj4gPiBiZSBpZ25vcmVkIHRoYW5rcyB0byBwYXRjaCAxLg0K
PiA+DQo+ID4gT0ssIEkgaGF2ZW4ndCBub3RpY2VkIHRoZSBuZXdseSBpbnRyb2R1Y2VkIGNoZWNr
IGluIGRybV9icmlkZ2VfcHV0KCkgaW4gcGF0Y2gjMS4NCj4gPg0KPiA+IEkgZ3Vlc3MsIHdlIHNo
b3VsZCBhdm9pZCBwdXR0aW5nIGVycm9yIHZhbHVlcyBpbiBicmlkZ2UubmV4dF9icmlkZ2UuDQo+
ID4gSXQgc2hvdWxkIGJlIGVpdGhlciBOVUxMIG9yIFZhbGlkIHBvaW50ZXIsIG5vdCBQVFJfRVJS
Lg0KPiANCj4gRlRSLCBJIGdldCBhIGNyYXNoIGluIGF0dGFjaC4gSSB3aWxsIGFwcGx5IHRoZSBz
dWdnZXN0ZWQgY2hhbmdlcyBhbmQgd2lsbCBsZXQgeW91IGtub3cgdGhlIHJlc3VsdC4NCj4gDQo+
IFsgICAxOC45NTczMjRdIHBjIDogZHJtX2JyaWRnZV9hdHRhY2grMHgzNC8weDIxMCBbZHJtXQ0K
PiBbICAgMTguOTY5NDI1XSBsciA6IGFkdjc1MTFfYnJpZGdlX2F0dGFjaCsweDM4LzB4YjggW2Fk
djc1MTFdDQo+IA0KPiBbICAgMTguOTY5NjEwXSAgZHJtX2JyaWRnZV9hdHRhY2grMHgzNC8weDIx
MCBbZHJtXSAoUCkNCj4gWyAgIDE4Ljk2OTg0NV0gIGFkdjc1MTFfYnJpZGdlX2F0dGFjaCsweDM4
LzB4YjggW2Fkdjc1MTFdDQo+IFsgICAxOC45Njk4NjddICBkcm1fYnJpZGdlX2F0dGFjaCsweGYw
LzB4MjEwIFtkcm1dDQo+IFsgICAxOC45NzAwNDJdICByemcybF9taXBpX2RzaV9hdHRhY2grMHgy
NC8weDNjIFtyemcybF9taXBpX2RzaV0NCj4gWyAgIDE4Ljk3MDA2NF0gIGRybV9icmlkZ2VfYXR0
YWNoKzB4ZjAvMHgyMTAgW2RybV0NCj4gWyAgIDE4Ljk3MDI2Ml0gIHJ6ZzJsX2R1X2VuY29kZXJf
aW5pdCsweDljLzB4MjUwIFtyemcybF9kdV9kcm1dDQo+IFsgICAxOC45NzAyOTNdICByemcybF9k
dV9tb2Rlc2V0X2luaXQrMHgzMGMvMHg0ZDAgW3J6ZzJsX2R1X2RybV0NCj4gWyAgIDE4Ljk3MDMw
N10gIHJ6ZzJsX2R1X3Byb2JlKzB4YzgvMHgxNzQgW3J6ZzJsX2R1X2RybV0NCj4gWyAgIDE4Ljk3
MDMyMV0gIHBsYXRmb3JtX3Byb2JlKzB4NWMvMHhhNA0KPiBbICAgMTguOTcwMzM2XSAgcmVhbGx5
X3Byb2JlKzB4YmMvMHgyYzANCj4gWyAgIDE4Ljk3MDM0OF0gIF9fZHJpdmVyX3Byb2JlX2Rldmlj
ZSsweDgwLzB4MTRjDQo+IFsgICAxOC45NzAzNTldICBkcml2ZXJfcHJvYmVfZGV2aWNlKzB4M2Mv
MHgxNjQNCj4gWyAgIDE4Ljk3MDM2OV0gIF9fZHJpdmVyX2F0dGFjaCsweDkwLzB4MWE0DQo+IFsg
ICAxOC45NzAzNzldICBidXNfZm9yX2VhY2hfZGV2KzB4N2MvMHhkYw0KPiBbICAgMTguOTcwMzg4
XSAgZHJpdmVyX2F0dGFjaCsweDI0LzB4MzANCj4gWyAgIDE4Ljk3MDM5N10gIGJ1c19hZGRfZHJp
dmVyKzB4ZTQvMHgyMDgNCj4gWyAgIDE4Ljk3MDQwNl0gIGRyaXZlcl9yZWdpc3RlcisweDY4LzB4
MTMwDQo+IFsgICAxOC45NzA0MTZdICBfX3BsYXRmb3JtX2RyaXZlcl9yZWdpc3RlcisweDI0LzB4
MzANCj4gDQoNCkkgY29uZmlybSB0aGUgY3Jhc2ggaXMgZml4ZWQgYnkgeW91ciBzdWdnZXN0ZWQg
Y2hhbmdlcyBmb3IgVjMuDQoNCkNoZWVycywNCkJpanUNCg==

