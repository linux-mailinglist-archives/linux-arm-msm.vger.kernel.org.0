Return-Path: <linux-arm-msm+bounces-105023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SENZKp/H8GkqYgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:43:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EEC487351
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:43:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0548A3053DD8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4048E372661;
	Tue, 28 Apr 2026 14:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ToH6k7wt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011003.outbound.protection.outlook.com [40.107.74.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CB01B3B19;
	Tue, 28 Apr 2026 14:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777387125; cv=fail; b=gaSONRI7HQ71seo+vlBnvHzQN0jAYlf+qjG8MDITHJbfp1XWUXnzhR0lYw+SdX1ciOfUq5Faxh1HKOy0lbaMeHAF8/XBSYn6PG9+peJHtCjr0WcL2+7H1Z55zBYWbmR2qJjoNEIu/97ydm2ShUz+mziZ+rLpH6+YueuO2PllIxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777387125; c=relaxed/simple;
	bh=QxJzZkUKd9pp8yhcreBmOMFRpBp9i6q/5UA9OahYWIM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=W03YYZHxPnV38uuAF86buBJgGmVopfPstsXzCo6ABiZ4NHlTH3KiMMkNGaZEJA1ORZ/Y58FiArxajxCQx4bt1Y+5Ie9YEMOdlXK2IpQvzylyj2P1ImQVS0rNibt1FtSQFQtuWUrbbADPc+9lbJUvqIbhhSw7sd3vPuh0iRtUA10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ToH6k7wt; arc=fail smtp.client-ip=40.107.74.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dVNqxFV55d2Nrstb6NUDi8OlbPqRoGs9yiLeJJND9L6K1VmhiRwf06j2xnz+6pirydMLdFaYxnkwFCSl7fflFDusMujvvIutSUQPWVaBaKza9rVTM+foVkDBvF9OXGvwy1evpo12nvJbqDM1q7Vv8dsIvuOBX2f3nUbCnpHkirBiE06E21nNQ8GWTtpF6fC8Rv8QIU64GoWmmMB+eRUX5ryUWuY7Sb5sS3Kg0NcWy5ANDBoDIsyntzTzbhRxIFykP0JrVP0brQxWwdbPzsCBa03FJ5BjafMFnW3SzQUgOg1RYfDf/31Xvi6LZ7kiJ2O1IyWFXaEDBU359w4g1LI14g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QxJzZkUKd9pp8yhcreBmOMFRpBp9i6q/5UA9OahYWIM=;
 b=O+NQY18Q+rp0iXVb2eTneXLAkpl0VieHNmsN+DYJ4QqJ5kAtdF6j4guh0Mw3YzN4sWA4WCtiHaqQu+a0pFNesveXjSBnOWK/U5ezMAC+j5oBd/MREwmAjATla/PX5vhGokjYpJCm20FzK5Ect4GlWlVOJLrkFodk7JhydGgME/mfvzML4Iapj6ISubqaRGmybgZH0hTp4T/gCPdZTSpHhxd5kiNDj6MskFXMuQQyMGBpdU/2emub2L/M9U5oLNs/sdNa/jdlhawLvYAVmUh9j7zuVOtyRa0gsFcnr1jNGNYA9fUVOxup3HLlKohoY3KSocXEqpwij5HSTAtne/YEDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxJzZkUKd9pp8yhcreBmOMFRpBp9i6q/5UA9OahYWIM=;
 b=ToH6k7wt9tRkub7y9MpC7IdsjjRymvOa0Ah/uOhWZ+nV7V5qGW4ITUIxb5ZyN+XKrzR+qWwoi2q/IATTE3cC58NCvREOoCJJPL7ZmIpC/VzOrg+CG4J1spdrV6PyT4V8y/d0Z/3phyn5YtLU/WuD+HhfCRTPv86bvkP9tSmUg0E=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB14054.jpnprd01.prod.outlook.com (2603:1096:405:20e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.29; Tue, 28 Apr
 2026 14:38:38 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 14:38:38 +0000
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
 AQHc1u/CLMxk+VTSG02AXPmSMDjmUbX0WyoQgAACgvCAABfEgIAAAYVQgAAGVYCAAAKiMIAACyhw
Date: Tue, 28 Apr 2026 14:38:38 +0000
Message-ID:
 <TY3PR01MB11346293C9AAF8BC4B3FCAD6586372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References:
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-8-4300744a1c47@bootlin.com>
 <TY3PR01MB113466B70BFD2899AB0CF47AD86372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB1134674FDD088299A4382D3D286372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <DI4TGV2WURTY.39OXE7WWKRLA1@bootlin.com>
 <TY3PR01MB11346E82D19FBE8544F51624286372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <DI4U2DT3OBMR.23T3F7X8P75RU@bootlin.com>
 <TY3PR01MB113465B0308DE16ACC48D1E8186372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB113465B0308DE16ACC48D1E8186372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB14054:EE_
x-ms-office365-filtering-correlation-id: 615e36e0-a409-4eb5-cb32-08dea533d5dc
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 Hjw3amUPMkeZ0nFCGnVuUn1HaP/bj25hYOdVCM9CqLu3R/KXrfDqWQj6ScatNk842uTEbHJkmo/kIepLdp2Lku0rTeXqyn5+DonrhPUy+twLfPp/kxzDexuuZucWZ0nghSlh9Dm8gO4CWt0nCMVypVgiJlMik92UdXfRCWxWTAJKSVizTCR9RqvzyLi/Mw79lOnEiTH3QUcMLuhkVw7dPaPea4HSjIzC8ASAm5IYbwCCg7k/YX0LT9jf7ylMSG2LZUsqb4/EnOUJS/GwOKjhx/T8sEnHUeAzbSMWkRsAPF7gu6TRym0v3AsHZsg5edetDLMDczPW5CW92BP64X5ln4oMCnm08Jb+EbQVEAfkEUpXwWWf1iV70RgMy5a2Qg7OZx+3/vBloYEUzW6WegpqttocpAQf2m+nVMq0LgDOd0Hley1zGr/D47AK1cGwiJ8Hs1TWfXybJm26VCzOnU4eAHgIErAQD6HgcF9CbQcHpaHdXpL9Ns20yDtkNUqk6SSfcN0m8q9x3CnK9LHuZJKxs/HEZiZauRhT2fDnpHT47UzvjLGlo6e7TKqxFvUZE4iwpR4Gw0r8s+L4yGLOqH3uU/rm/pM6sNFU1XkawcfaQhShXN/IH1OA8GpS2KEDC4wqpO/RYE2xK0Gk3W3OCDLGN+KBJ31ESa0jPA2gjqoisyuTnyeoBgKgI2NPHwII1kNQQrSwO8HNtbvVqmJDRn/OcGzEE8Lf4YPiULsCIYZxfoBZBSvK3NYXj7cMEvpWLOZJzZ+cliWDAQCgrUedYdwLtSNKCuV0nHIA3eK/pPv4gcdW7F5NvneV6ni2Oa272BjA
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SWZrbUZQT2Z3a0gwN2syVSt3VVpqZitCVWRhbWlxWjQ5SUtXODRRelBKUzk2?=
 =?utf-8?B?R2EzSGxVN0NyUXdDZCtaT2U3L3dkWFpMN0dqMWFGZFlqd213ckh1b0kxRDJE?=
 =?utf-8?B?SjQvVTFINjYvb3ZKUG80cXN1ckFqZll1UDVxN3dsdVI1bk9uT0owNC93UXFB?=
 =?utf-8?B?ejE5d0tvU1g5SGVXTFdMMDRwdFNpODcvbW83Mmw5aTl5OWp1VE13bVVSV0Zw?=
 =?utf-8?B?a3dVdzFIVEpOdGkyVVpWWUVpcWZkeDRLMHZBZlJtSlJYbVZIczV6YUt4Z0xV?=
 =?utf-8?B?QmRBUGwveVpDeG85SHMwRllPdE9GOEYwMXloUHA0ZEdLMGJ3V1JHc3RBREVC?=
 =?utf-8?B?eTJqc3k1eTFOZXVtbkxkYUtneEFCZ0VyblBzdkE4Um9XSHFvdDZtY1p4eCtP?=
 =?utf-8?B?aXd2QmVscVJXanc0ek5UdVdZYkFIV2ozeXk4ZHg0QkhWKzZFVFpFSWRsU1lp?=
 =?utf-8?B?M3l0S1RqczRxTFcvWktsMGM0cjRBVllxMGpkakduZDBZaHRDRTVKNWlkaXhp?=
 =?utf-8?B?MDBqbTI0aWZjZTQ5TmhhQ2RGaGVoWFBwZEViRWZIWnlROFFOMzF3M0l3VVRu?=
 =?utf-8?B?UDl6bkQ0MGo3cFJrbGN0bVJSL0NnUjlDcHZPR0RZNWJtSXhMNTJLa281UjZw?=
 =?utf-8?B?TU91NzdBVzJzR1pHM29ESlRldlZoUWFxQ2d6Tnh4N2YvZmdBaDF0bHJqVDY1?=
 =?utf-8?B?eGJ4WldmV2FTb1lsdUl0RW9hWnErdWxCMWluWGFPaHBneGhwYXVVRVhVdlYv?=
 =?utf-8?B?QlUrUUxYTWxoWkQrcUhzdTBUd1VSWHlCSmVXbXVHUm0yVExYL0NkWFZaSlNX?=
 =?utf-8?B?dGZLSkR1aVdZNVFZMlF1ZmVPMW5FQUVPV3hkUjNqQlJhVWJwRVh0YmZVR3ZI?=
 =?utf-8?B?ZVlFZzhzNURiTUVDR2k0ekFJYWQyZ0MzdkIzWVZyWHpkWDVydnFBbnBIT3JM?=
 =?utf-8?B?a0laeHgxSVN3ZmFveHpqeHBza1dZcEcvZ3NDREluREZCNGltdU1GNkJkUnNU?=
 =?utf-8?B?MU9pcmhSamdIbGpRelZGN2c2Ri9yK1NZVFpUdll1V3R3SC9DQVF1ZEhhcjhV?=
 =?utf-8?B?N05GdXdCcnVUMkZWQjRlaHRLWDA1U0lwRzlHdHp4V1c5QzJpZ2pzUW04OXpC?=
 =?utf-8?B?WmJsTUIraTBDcUJMa3ZjZXdPUXFaSnhxY2xVZ3hjcjBLZExFOTlodE5SNGZQ?=
 =?utf-8?B?anE4c2tIU1BxRk9NSlJjNmNiZkZBSFAxL3AwbFhqNGZzY2dFUVBvcWR4a1Y3?=
 =?utf-8?B?eHlON3M0dG0rZUovNkZVc1R1WGd2TUxsWkVmaXc2akoyMGw5RFY2RHg5aHdD?=
 =?utf-8?B?c1NjR1NRV2Q2YVhRaTl5eEEwK0g5SmJuNyt1dVF6cHpaK3ZLdmxJUGt6b3B2?=
 =?utf-8?B?ZmJJcjJHZ3YwMXk5QVA0RldkaGFqZld5T1p6ajIrbVgxVFdMYzN5WGZad1py?=
 =?utf-8?B?MFViSUhBVld5cUtaNVhVd1cveW1CRXFySVRZaGV6dVFBclJ4QXFNMmNWU1Nz?=
 =?utf-8?B?dExXWk8wOFNwekU4SUc1VDkyY09XSWRNcWxuVm4wUExFcVdUcXFIekNiZmxJ?=
 =?utf-8?B?VUhxMzNSaERWUGNkejErRXdQOFYrcGw1WE1DSzVLUmZSVkJ3YURDNEcvak8z?=
 =?utf-8?B?a1A5YVgvanhMeGpaUkIzcGpDd0ZGbXVqSkE2Ym1pazdzRWpDNjNHMk9xRjg0?=
 =?utf-8?B?MlBEendnMzJwaE1VRXVTa05ic1orYmhiWmgyUkNYWlJ5TVdWSHZXcnB3YklY?=
 =?utf-8?B?SkpEZ1pFRXFxY2ZRdVZZRkgwb2NyN1FJTmdtTmhIN1BsSnd3eDRuL2xZVldI?=
 =?utf-8?B?QnJxL3Z2OXNXcU5xN0V4UmhUYW1SZlZucGdsK2Fad3lnVEhVSEs2cTU0YVM0?=
 =?utf-8?B?SlM2ZHdUOERNNnZJckVhMy93UWE0TzYwQWUrMXlXR1c3ZHgzSlFwOVlMbWMx?=
 =?utf-8?B?QVAxYlRhVXN1S2xhM3hiTkJ0cE9KTmNXMmJXY3VBaW1ETTBFbk04OUg3V1M3?=
 =?utf-8?B?cFEzTVRoZ3J5eTk2M3Y1bHk2cUk0eVVtM2daeXJzb2VkUk1tQ2RwWGIzWlFY?=
 =?utf-8?B?NTVrMTM0bTFHcFU2QTVIbSt1WjhyNVppd0J1NTlxUVJ0K3RVOFlqcVBzcE5n?=
 =?utf-8?B?Vk9QYUx5T1NkTUV6Yk5MajVtaUdwMDBtb2FNVUQ3NjVheXNGTUo3anJOSHp2?=
 =?utf-8?B?aWJYQzV1ckRkekdySDdId3BtVnNmV0lYWGpqdG8zNGloUEFIYUwvMVYvck12?=
 =?utf-8?B?SWpDcDZsOEY4c0lmRStqRm9nWTVvSzVPQVlYYjA2UmlLeWRXemhlNG82M3Fq?=
 =?utf-8?B?L0k3ZjFBQWk4dzZvaHdwTmxFTUJLTVFBUTZLd05jR0MyU3hMeEoxZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 615e36e0-a409-4eb5-cb32-08dea533d5dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 14:38:38.2544
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EMF7ZEolvre6MPRKa2HTQfts7mSr68Xm62TmOi0vbNwp8+lrTcrqxdFL/38E6mknm7HBl0eDhUAjUECLQTfFvnXliRtAPOszdbA/2+CNv28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB14054
X-Rspamd-Queue-Id: 06EEC487351
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
	TAGGED_FROM(0.00)[bounces-105023-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bootlin.com:email]

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmlqdSBEYXMNCj4gU2Vu
dDogMjggQXByaWwgMjAyNiAxNTowMg0KPiBTdWJqZWN0OiBSRTogW1BBVENIIHYyIDA4LzExXSBk
cm0vYnJpZGdlOiBhZHY3NTExOiBzd2l0Y2ggdG8gb2ZfZHJtX2dldF9icmlkZ2VfYnlfZW5kcG9p
bnQoKQ0KPiANCj4gSGkgTHVjYSwNCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gPiBGcm9tOiBMdWNhIENlcmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4uY29tPg0KPiA+
IFNlbnQ6IDI4IEFwcmlsIDIwMjYgMTQ6NDgNCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDA4
LzExXSBkcm0vYnJpZGdlOiBhZHY3NTExOiBzd2l0Y2ggdG8NCj4gPiBvZl9kcm1fZ2V0X2JyaWRn
ZV9ieV9lbmRwb2ludCgpDQo+ID4NCj4gPiBIZWxsbywNCj4gPg0KPiA+IE9uIFR1ZSBBcHIgMjgs
IDIwMjYgYXQgMzozMSBQTSBDRVNULCBCaWp1IERhcyB3cm90ZToNCj4gPiA+PiA+PiA+IEBAIC0x
MjUxLDEwICsxMjUxLDkgQEAgc3RhdGljIGludCBhZHY3NTExX3Byb2JlKHN0cnVjdA0KPiA+ID4+
ID4+ID4gaTJjX2NsaWVudA0KPiA+ID4+ID4+ID4gKmkyYykNCj4gPiA+PiA+PiA+DQo+ID4gPj4g
Pj4gPiAgCW1lbXNldCgmbGlua19jb25maWcsIDAsIHNpemVvZihsaW5rX2NvbmZpZykpOw0KPiA+
ID4+ID4+ID4NCj4gPiA+PiA+PiA+IC0JcmV0ID0gZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdl
KGRldi0+b2Zfbm9kZSwgMSwgLTEsIE5VTEwsDQo+ID4gPj4gPj4gPiAtCQkJCQkgICZhZHY3NTEx
LT5uZXh0X2JyaWRnZSk7DQo+ID4gPj4gPj4gPiAtCWlmIChyZXQgJiYgcmV0ICE9IC1FTk9ERVYp
DQo+ID4gPj4gPj4gPiAtCQlyZXR1cm4gcmV0Ow0KPiA+ID4+ID4+ID4gKwlhZHY3NTExLT5icmlk
Z2UubmV4dF9icmlkZ2UgPSBvZl9kcm1fZ2V0X2JyaWRnZV9ieV9lbmRwb2ludChkZXYtPm9mX25v
ZGUsIDEsIC0xKTsNCj4gPiA+PiA+PiA+ICsJaWYgKElTX0VSUihhZHY3NTExLT5icmlkZ2UubmV4
dF9icmlkZ2UpICYmIFBUUl9FUlIoYWR2NzUxMS0+YnJpZGdlLm5leHRfYnJpZGdlKSAhPSAtRU5P
REVWKQ0KPiA+ID4+ID4+ID4gKwkJcmV0dXJuIFBUUl9FUlIoYWR2NzUxMS0+YnJpZGdlLm5leHRf
YnJpZGdlKTsNCj4gPiA+PiA+Pg0KPiA+ID4+ID4+IERvZXMgaXQgY3Jhc2gsIGlmIHRoZSBlcnJv
ciBpcyAgLUVQUk9CRV9ERUZFUj8NCj4gPiA+PiA+DQo+ID4gPj4gPiBJIHNlZSBhIGNyYXNoIHdp
dGggcGF0Y2ggWzFdLCB3aGljaCBpcyBmaXhlZCBieSBhdm9pZGluZyB0aGUgZGlyZWN0IGFzc2ln
bm1lbnQuDQo+ID4gPj4NCj4gPiA+PiBBaCwgZGFtbWl0ISBHb29kIGNhdGNoLCB0aGFua3MgZm9y
IHRoZSBxdWljayB0ZXN0aW5nIGFuZCBmb2xsb3ctdXAhDQo+ID4gPj4NCj4gPiA+PiBJbmRlZWQg
dGhpcyBkcml2ZXIgYXNzdW1lcyBuZXh0X2JyaWRnZSBpcyBlaXRoZXIgTlVMTCBvciBhIHZhbGlk
DQo+ID4gPj4gcG9pbnRlciwgYnV0IGR1ZSB0byB0aGUgJ2lmKElTX0VSUigpICYmIHNvbWVfb3Ro
ZXJfY29uZGl0aW9uKScgbm93DQo+ID4gPj4gaXQgY2FuIGFsc28gYmUgLUVOT0RFViAobm90IC0N
Cj4gPiBFUFJPQkVfREVGRVIsIGJ1dCB0aGF0J3MgaXJyZWxldmFudCkuDQo+ID4gPj4NCj4gPiA+
PiBUaGlzIGFmZmVjdHMgdGhlIG1zbSBhbmQgenlucW1wX2RwIHBhdGNoZXMgZXF1YWxseS4NCj4g
PiA+Pg0KPiA+ID4+IEknbSBzZW5kaW5nIGEgdjMgc29vbiB3aXRoIHRoZXNlIGZpeGVkLiBJJ20g
anVzdCBub3Qgc3VyZSB3aGljaA0KPiA+ID4+IGFwcHJvYWNoIHRvIHVzZSB0byBmaXggKHNhbWUg
Zm9yIGFsbCB0aGUgMyBwYXRjaGVzKS4gQWx0ZXJuYXRpdmVzIGFyZToNCj4gPiA+Pg0KPiA+ID4+
ICAxLiAtRU5PREVWIGlzIGFjY2VwdGVkLCBzZXQgbmV4dF9icmlkZ2UgdG8gTlVMTCB3aGVuIGl0
IGhhcHBlbnM6DQo+ID4gPj4NCj4gPiA+PiAgICAgICAtICAgICAgIGlmIChJU19FUlIoYWR2NzUx
MS0+YnJpZGdlLm5leHRfYnJpZGdlKSAmJiBQVFJfRVJSKGFkdjc1MTEtPmJyaWRnZS5uZXh0X2Jy
aWRnZSkgIT0gLQ0KPiA+ID4+IEVOT0RFVikNCj4gPiA+PiAgICAgICAtICAgICAgICAgICAgICAg
cmV0dXJuIFBUUl9FUlIoYWR2NzUxMS0+YnJpZGdlLm5leHRfYnJpZGdlKTsNCj4gPiA+PiAgICAg
ICArICAgICAgIGlmIChJU19FUlIoYWR2NzUxMS0+YnJpZGdlLm5leHRfYnJpZGdlKSkgew0KPiA+
ID4+ICAgICAgICsgICAgICAgICAgICAgICBpZiAoUFRSX0VSUihhZHY3NTExLT5icmlkZ2UubmV4
dF9icmlkZ2UpID09IC1FTk9ERVYpDQo+ID4gPj4gICAgICAgKyAgICAgICAgICAgICAgICAgICAg
ICAgYWR2NzUxMS0+YnJpZGdlLm5leHRfYnJpZGdlID0gTlVMTDsNCj4gPiA+PiAgICAgICArICAg
ICAgICAgICAgICAgZWxzZQ0KPiA+ID4+ICAgICAgICsgICAgICAgICAgICAgICAgICAgICAgIHJl
dHVybiBQVFJfRVJSKGFkdjc1MTEtPmJyaWRnZS5uZXh0X2JyaWRnZSk7DQo+ID4gPg0KPiA+ID4g
VGhlIHBvaW50IGlzIHlvdSBjYW5ub3QgcmV0dXJuIFBUUl9FUlIgYXMgaXQgd2lsbCBsZWFkIHRv
IGNyYXNoLCBpZg0KPiA+ID4gaXQgaXMgZGlyZWN0IGFzc2lnbm1lbnQuDQo+ID4NCj4gPiBJdCB3
b3VsZCBkZWZpbml0ZWx5IGNyYXNoIHdoZW4gdGhlIG5leHRfYnJpZGdlIGlzIGRlcmVmZXJlbmNl
ZCAod2hpY2gNCj4gPiBoYXBwZW5zIGluDQo+ID4gYWR2NzUxMV9icmlkZ2VfYXR0YWNoKCkpIGJ1
dCBJIGRvbid0IHNlZSBob3cgaXQgY2FuIGNyYXNoIGhlcmUuIEhlcmUNCj4gPiBpdCBfY2FuXyBi
ZSBhc3NpZ25lZCAtRU5PREVWLCBidXQgaXQgd291bGQgYmUgaW1tZWRpYXRlbHkgYmUgY2xlYXJl
ZA0KPiA+IHRvIE5VTEwsIG9yIHRvIGVub3RoZXIgZXJyb3IsIGJ1dCB3ZSdkIGltbWVkaWF0ZWx5
IHJldHVybi4gQW5kIGluIGNhc2UNCj4gPiBvZiByZXR1cm4sIHdoZW4gbmV4dF9icmlkZ2UgaXMg
Y2xlYXJlZCBieSBfX2RybV9icmlkZ2VfZnJlZSAtPiBkcm1fYnJpZGdlX3B1dCwgdGhlIGVycm9y
IHZhbHVlIHdvdWxkDQo+IGJlIGlnbm9yZWQgdGhhbmtzIHRvIHBhdGNoIDEuDQo+IA0KPiBPSywg
SSBoYXZlbid0IG5vdGljZWQgdGhlIG5ld2x5IGludHJvZHVjZWQgY2hlY2sgaW4gZHJtX2JyaWRn
ZV9wdXQoKSBpbiBwYXRjaCMxLg0KPiANCj4gSSBndWVzcywgd2Ugc2hvdWxkIGF2b2lkIHB1dHRp
bmcgZXJyb3IgdmFsdWVzIGluIGJyaWRnZS5uZXh0X2JyaWRnZS4NCj4gSXQgc2hvdWxkIGJlIGVp
dGhlciBOVUxMIG9yIFZhbGlkIHBvaW50ZXIsIG5vdCBQVFJfRVJSLg0KDQpGVFIsIEkgZ2V0IGEg
Y3Jhc2ggaW4gYXR0YWNoLiBJIHdpbGwgYXBwbHkgdGhlIHN1Z2dlc3RlZCBjaGFuZ2VzIGFuZCB3
aWxsIGxldCB5b3Uga25vdyB0aGUgcmVzdWx0Lg0KDQpbICAgMTguOTU3MzI0XSBwYyA6IGRybV9i
cmlkZ2VfYXR0YWNoKzB4MzQvMHgyMTAgW2RybV0NClsgICAxOC45Njk0MjVdIGxyIDogYWR2NzUx
MV9icmlkZ2VfYXR0YWNoKzB4MzgvMHhiOCBbYWR2NzUxMV0NCg0KWyAgIDE4Ljk2OTYxMF0gIGRy
bV9icmlkZ2VfYXR0YWNoKzB4MzQvMHgyMTAgW2RybV0gKFApDQpbICAgMTguOTY5ODQ1XSAgYWR2
NzUxMV9icmlkZ2VfYXR0YWNoKzB4MzgvMHhiOCBbYWR2NzUxMV0NClsgICAxOC45Njk4NjddICBk
cm1fYnJpZGdlX2F0dGFjaCsweGYwLzB4MjEwIFtkcm1dDQpbICAgMTguOTcwMDQyXSAgcnpnMmxf
bWlwaV9kc2lfYXR0YWNoKzB4MjQvMHgzYyBbcnpnMmxfbWlwaV9kc2ldDQpbICAgMTguOTcwMDY0
XSAgZHJtX2JyaWRnZV9hdHRhY2grMHhmMC8weDIxMCBbZHJtXQ0KWyAgIDE4Ljk3MDI2Ml0gIHJ6
ZzJsX2R1X2VuY29kZXJfaW5pdCsweDljLzB4MjUwIFtyemcybF9kdV9kcm1dDQpbICAgMTguOTcw
MjkzXSAgcnpnMmxfZHVfbW9kZXNldF9pbml0KzB4MzBjLzB4NGQwIFtyemcybF9kdV9kcm1dDQpb
ICAgMTguOTcwMzA3XSAgcnpnMmxfZHVfcHJvYmUrMHhjOC8weDE3NCBbcnpnMmxfZHVfZHJtXQ0K
WyAgIDE4Ljk3MDMyMV0gIHBsYXRmb3JtX3Byb2JlKzB4NWMvMHhhNA0KWyAgIDE4Ljk3MDMzNl0g
IHJlYWxseV9wcm9iZSsweGJjLzB4MmMwDQpbICAgMTguOTcwMzQ4XSAgX19kcml2ZXJfcHJvYmVf
ZGV2aWNlKzB4ODAvMHgxNGMNClsgICAxOC45NzAzNTldICBkcml2ZXJfcHJvYmVfZGV2aWNlKzB4
M2MvMHgxNjQNClsgICAxOC45NzAzNjldICBfX2RyaXZlcl9hdHRhY2grMHg5MC8weDFhNA0KWyAg
IDE4Ljk3MDM3OV0gIGJ1c19mb3JfZWFjaF9kZXYrMHg3Yy8weGRjDQpbICAgMTguOTcwMzg4XSAg
ZHJpdmVyX2F0dGFjaCsweDI0LzB4MzANClsgICAxOC45NzAzOTddICBidXNfYWRkX2RyaXZlcisw
eGU0LzB4MjA4DQpbICAgMTguOTcwNDA2XSAgZHJpdmVyX3JlZ2lzdGVyKzB4NjgvMHgxMzANClsg
ICAxOC45NzA0MTZdICBfX3BsYXRmb3JtX2RyaXZlcl9yZWdpc3RlcisweDI0LzB4MzANCg0KDQpD
aGVlcnMsDQpCaWp1DQo=

