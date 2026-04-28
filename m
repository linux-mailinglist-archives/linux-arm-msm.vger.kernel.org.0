Return-Path: <linux-arm-msm+bounces-105039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMuIBWnU8GkSZQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 17:38:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 947D948808A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 17:38:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3023F301FA88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 15:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C4ED3B5308;
	Tue, 28 Apr 2026 15:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="psgl9G9n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010008.outbound.protection.outlook.com [52.101.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CCF3939BF;
	Tue, 28 Apr 2026 15:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777390674; cv=fail; b=laEDM6kZb7GOKlOdsAaLh0LYQxD9UVomzdKoD1hrwNNt9ISKlp/YYIAeeWIOj7e/lqxymJW9dDWx9rRapaQnmV69BvHSgiTfJK1YNqCksf1fJPzq7uJRrZTMhLqFXzdmtIPrXIUMASpqHnJjbYKOkCpcW3U6dE8Z337R9Cwn7ho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777390674; c=relaxed/simple;
	bh=k63c1+0QinvOjClrfJcG689GSpqphYlLtikHaWBHfNs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jn/QosF7cxGRCJHHcLIPagGZc1UpWLUh+RkvE636wDLOVkYLVjNNnDVIqd75QxkVSVICNquLdvmckjoLPoe+YTSlQevnlSdscm7OQZ9Hm76k1FVipSsf9A74UhuZX4ceVeCO0bEhms2i90AILTUFSuNYZua/Mved9EUy1IppTpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=psgl9G9n; arc=fail smtp.client-ip=52.101.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A1UppMqw00QO2ODaNHT/3XcGKDoOAZbJUhRklQ9hf4WyMaZHuogYGsh58lfJVXmFt8R9UkZ+5wrWZ9AKhf5Rq5VJDISYfqX2ylg+hmPt4M6z6/vnQmuvh95Qeh3ua4vkZ2Of1/bF5Cx3va+4RueccUuHAx02wnGf/9+7iyXttqQajyJqqDGyshpfpDNOSBzLsCOW2EPAh3PegPAVmh1eyrBnfdK3W2bKaV45LqqsdLiOukYPxNBb/BKUgIMDN4Xd0F2i75/xFGTj+blZhs0M1g/NJEVSwVXI1jt3vqNkF9IhjfWMmVkyP+ff8LGElDDq8YpdbyponJNjkvNy/1MLNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k63c1+0QinvOjClrfJcG689GSpqphYlLtikHaWBHfNs=;
 b=LmdVwmFBk+AUClQV03MXSRI09WYc8UquLxd1PuhDFWbbVr/DN61gKQXMfOuygKnsHJPJscNqKb+otmK19KOz8GwPMNI0IRcMI0n6ifvlaqEIgzRFTkiDNW5B91KwHvy9im6hC1TBQ/MtnlgwAMgIxHlkW3QBURFZVtQ1AIyC6OWGQ8kTdvdBQLOkUXywov6cKFaxet0Eu7do3W+sWWIEcnGAfDrNrugWt1E51EFU72JHpurQ3zF7XFgmETVQoGPz+qWQh4VajBNcztWceLkIsg1myXIipsRzlZEA8u7AKHhk95JAvzYRpMy1A//Sd0AkcFK4jnu/l6p/V5kGgzMECg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k63c1+0QinvOjClrfJcG689GSpqphYlLtikHaWBHfNs=;
 b=psgl9G9ngCQDww2RaPtKCNhPZDzvXU2V9B+AElz2D4SeIBHoBQU5BownFh27KZ6OkTT5KIXYoDT9/hqAL7HCI7tdV2XXyPC/JIHVYXa9Ck0JbWd+xb9ohQXrPAEv+bfhbQ0BZ44m4Or+QuHV18FpBYRj9Xv7uusfHdPgs1dDPZM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB14436.jpnprd01.prod.outlook.com (2603:1096:604:3a3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 15:37:48 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 15:37:48 +0000
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
Subject: RE: [PATCH v3 10/11] drm: zynqmp_dp: switch to
 of_drm_get_bridge_by_endpoint()
Thread-Topic: [PATCH v3 10/11] drm: zynqmp_dp: switch to
 of_drm_get_bridge_by_endpoint()
Thread-Index: AQHc1yQvqBYDkjdmAkqTkG44o+YxrbX0mzVQ
Date: Tue, 28 Apr 2026 15:37:48 +0000
Message-ID:
 <TY3PR01MB113469B7764079DD361E3FE8D86372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References:
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v3-0-a537b5567add@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v3-10-a537b5567add@bootlin.com>
In-Reply-To:
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v3-10-a537b5567add@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB14436:EE_
x-ms-office365-filtering-correlation-id: ca1cc668-d341-41ec-03c6-08dea53c19e1
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020|38070700021|18002099003|56012099003|10086099003|22082099003;
x-microsoft-antispam-message-info:
 u+uwcpUVEsZ1rpeHO57QXoDzFBqBndI1qe0vnjlH1vZ/QIkI4KhjZ5Wdi3N0FysdXZ1gd7oIXPizR4XX11bbzABUZJh5JgpJ5fEoJvJaj57ENr0eqpHo2ws8SPbSY1hye4oPe14E2wUab2813lBOdB3Ycnmf9pP/kAsLZozTXCn+EGd7yKUnMChXCFXl9QCGV5YLhKnd1LvlNi/TxIFLbONMb2VHMRCfA9u5BxCOrlIJGmjOHY5SDr8rV3IMxVKDi3AOIPPCB0ic/GeZEhQ83CT2SP9o2rsBk/jxl/TdP6eq9NHE9sSVFCe8SOzRppKm6cQXjFrH3ROrECC4ODb5ZIK5iCXQI0mqmSP2vDDSx0nu5u3XvB06rgyi6t403rNKlrGuX6ylq5g9ogeJSN+Ys9dG2iPF4WjUSsleaGAcAX27hEMVUTcVJSFVquq02xvFfepwJdB74ybzp2pScFxQ3RRS1RgeB3iOWDc1j9QVjNNbHVqZv+j67JIJ5WbD7cr/OL+jTCLk2rH3Dkl2n0yxFyz5r/7lz6gvqQ++NW3paAjFWATTf1Ee1evvvswZDDBmfZU02MGP3MgMPjUrcZwBlLaIVJseowKWrebKJzunpHEIKPA7a3gxbeMlkwf2cZDL75dUglZODZ5GymA2CajiMpwAya1maJHdZNgoSb0aJ2fC0aVWKdyhIDNulNAv/gQmvdx3B8ZYTQ7kXtPAjY/wIyIFhjAFRIqGj79IT+7IbazC8/7fp6wAYMyZHx1AZ2HWkPP056ZmNGBPmYj7/BLSF6YbbVqyIfMZlkRMB+vt6iSb2NgSJ1v62BN0A5SK3ZSP
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(38070700021)(18002099003)(56012099003)(10086099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RXBOSDU1emZ0dEN6S1Vkazd6UDkrZ1JETlpiR1lkUXp2UE1qTnp6bFB2OWdN?=
 =?utf-8?B?TDR6L1NWc2tJMWEreHlDMWIremZLZzNRcTBaSFJIZGJ6bUJsY1FwbkFpcVZi?=
 =?utf-8?B?RHR5VndzZWYxdDBTTWJYbVVkWFNXRnluVEtpajBqUVgydFd4bDRvdGJMNzh1?=
 =?utf-8?B?T0VZbE5mSXVLakltTTFlTnVWdVVzaFFGeXZCUHhRN1lVUFQ1bkhCZi8rclpE?=
 =?utf-8?B?bHdDQ3QrU2dCOVhvT29RWnVteEpPVjBDTC9TYVR5cFRXNGN3Zktsc2tKUkZU?=
 =?utf-8?B?RFdSWmF2TDhEUTdBZCtPbW5xOFdOb1ZZK2xqUXRSR3I2cDUwQXlBTThhTm1p?=
 =?utf-8?B?MXdLNEFpaFk1dzdPc24zTGtKeFZXZEVjM1ovc29wK3VFRHlEUGJ2blBwdWRv?=
 =?utf-8?B?TEh3cEpaU3FqSUhGRGl3MXFwL3oybno1RzNIenNuWHoyS3ZJaUxKTmtaZUpa?=
 =?utf-8?B?Zzg2b1RMeXJWVmFiVDZXeElpVTl6bHd5b0hGYWF4dGtqVXo2a2lzMGpzSTE1?=
 =?utf-8?B?YmgyZDFUUnNWMlVmcDRjcUtuQnpHWEJJWU80c2hsN05VY2NvbHVPSGtWdC9D?=
 =?utf-8?B?cE5jYyt6eVpyRis1ZytkZFZ2NW56VVAwTDJNd284V2hyeGtvam5yaG5qVUpl?=
 =?utf-8?B?bkpnU1hjL2poTm9WNEFFeXNyZ2NkeHB5VUdiVTR2T2xUVjV4d2Q3dnRTS1J5?=
 =?utf-8?B?TUorYjVyQmErWExOa2ZVZmt3dkU2b0RmN3A1NURCUGMwUkZJZ0ZLaVQ1cm1X?=
 =?utf-8?B?aDB1b3RkeTlPeWs2aHkxcW1RRnV4d1BXY29LeGdyQzAwS2pVVldHb3NGL1lU?=
 =?utf-8?B?eXo0TWJ5MnJGUUltU1JNS1VLOEVTWGsxUDlmVlVaQkRidXV2QnVaR1U1WlhI?=
 =?utf-8?B?TlBQeTJqZWtYQVh6eWxBeXoreU9waFRrYS81Vm9pZTVtanRNaSswaUlqSFc1?=
 =?utf-8?B?bUN2YWlTemRJZTdXMWdEbmR6U29tU2hUMm5IR3YzbW5BSDgzZWZXdWtCQnJu?=
 =?utf-8?B?Wlp1OStQTjRhbkRjM09wdXV5Qk00QzhLU0NhM2RRVTdHQllOdi9FZ1IwZnRY?=
 =?utf-8?B?UlIwZ2VkTnJINHNXdVhacWE1d0lCMHNhSXp2SVdmeFFHOUNmcXZGSzNGY2NB?=
 =?utf-8?B?WmUyb0puMXBUamdUYmpnNHZTSjFDcjE0K1hxbXFuUDlwdEcwTTUwWEEvRHJm?=
 =?utf-8?B?QXJqanNHN3NkQjN4STRYdkRZZGRLZ3ZkN082d3RkcWpSRTYwdkw5djJXRjlN?=
 =?utf-8?B?dzAweFYvSWFjcXpSNkh4VG1pL3BtQ2V3WnBLdjBVbDlZdytxaWRpRHZUUElk?=
 =?utf-8?B?TmRWelRHRjdaazdpcFhOR2Z4YSt0Um94Qy80dUFvb2szSzlOamxDRGRpTlNy?=
 =?utf-8?B?ZlUyYjViQmxhQVY2M1U5N041NE9wd1Jjd0grL3pYZ1ovQWhxME5ra2VnWU41?=
 =?utf-8?B?T0k1VTliS0ZheXQ3TmNPMlVJVWcrMTdZRlN5NXNjRWNQanUzTmlZOXFvMmlk?=
 =?utf-8?B?N2xZeEJCdkhSZ05qcGZNd0ZqYnBPT2QwOTVMY1dvbFpVc0N3Mk9aM3daL09h?=
 =?utf-8?B?eEZGcUt6RXVlOHdrakl0citzMGxSSlM3NThtem4xNHpGeC9KbWFiMWNQK3ZX?=
 =?utf-8?B?Lzl6enVPMkdPNGtLemY5ZW9tYUZ5a2lRTWQyVktTVG9lcWxNV0RqQ2JZVkFl?=
 =?utf-8?B?aXlKLzh3QjFvTlhkend1M2RTWEc2N2ptOHJ2eGZBZkZ1ai9RUkF3YzR0TDg0?=
 =?utf-8?B?Z3ZvSkI4QXl5YVQ3bzBBL0ZUZnloNkhpMHlVQ05NWld3bWpLK3hlSFJudXJr?=
 =?utf-8?B?bS9UVFhWaHZuZ2JpUE1adndtcnBnczk1MDZ5R0ZHeEpBaUx6dU8zSjJ1NkJH?=
 =?utf-8?B?UFo5eUZJMStKWWljK2lmN2QvTUtmVVRaYVFZWFBMcEF1U0x2ZzdxdTI4Unls?=
 =?utf-8?B?RzRMR21WeWVPcjN4bGJDbmc5eFlMdmJiOXZ2em5NTWRSUlA1d09pcy80SjBy?=
 =?utf-8?B?UkdydnZBUlJrNEIxbjAvT2RnU2hISTB1QmliK2dZOGZiZ0pzeHp0Z1VNZnda?=
 =?utf-8?B?ajA5bVEzMi8vSkRJUms2UEdUcFJJaWJaWW1oN2Y2MWRiUG9XYWJoUlV1V3Z4?=
 =?utf-8?B?djM3Vm5BWXNPWGI1eGx1UXJ4eEZza0h2TTJYWm9sWjVMY3pqMTFydENYVjNK?=
 =?utf-8?B?SGR0MTNjSmgrRnlYOWlHNGplVFlCMi9SWGwvUVZJVDNNdUVkbkluSkpJYVBv?=
 =?utf-8?B?aEJkZDdJZ2JhaXJPZGJjRXFwYlJrYnZqK2FxUjFaRGp6OEMxbmxLVFcrTUQ0?=
 =?utf-8?B?ZktWaE4vWEdHeGNNWkVtODMzRlc1Mnp1d0FTamEybWVFOE1HOUNXQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ca1cc668-d341-41ec-03c6-08dea53c19e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 15:37:48.3449
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H40MGs8+T0kVmwE66mkeRe1EVW/QD0Z0Z5reHlKksYRWqwCjNr5uUvXs868U5hXhuH6nDduaffN1glMIQFXr19yUKDtrFVetDNcsdeL+De4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14436
X-Rspamd-Queue-Id: 947D948808A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	TAGGED_FROM(0.00)[bounces-105039-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[bootlin.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,google.com,amd.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,0.0.0.5:email,lists.freedesktop.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:dkim]

SGkgTHVjYSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBkcmktZGV2
ZWwgPGRyaS1kZXZlbC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9m
IEx1Y2EgQ2VyZXNvbGkNCj4gU2VudDogMjggQXByaWwgMjAyNiAxNjozMQ0KPiBTdWJqZWN0OiBb
UEFUQ0ggdjMgMTAvMTFdIGRybTogenlucW1wX2RwOiBzd2l0Y2ggdG8gb2ZfZHJtX2dldF9icmlk
Z2VfYnlfZW5kcG9pbnQoKQ0KPiANCj4gVGhpcyBkcml2ZXIgY2FsbHMgZHJtX29mX2ZpbmRfcGFu
ZWxfb3JfYnJpZGdlKCkgd2l0aCBhIE5VTEwgcG9pbnRlciBpbiB0aGUgQHBhbmVsIHBhcmFtZXRl
ciwgdGh1cyB1c2luZw0KPiBhIHJlZHVjZWQgZmVhdHVyZSBzZXQgb2YgdGhhdCBmdW5jdGlvbi4N
Cj4gUmVwbGFjZSB0aGlzIGNhbGwgd2l0aCB0aGUgc2ltcGxlciBvZl9kcm1fZ2V0X2JyaWRnZV9i
eV9lbmRwb2ludCgpLg0KPiANCj4gU2luY2Ugb2ZfZHJtX2dldF9icmlkZ2VfYnlfZW5kcG9pbnQo
KSBpbmNyZWFzZXMgdGhlIHJlZmNvdW50IG9mIHRoZSByZXR1cm5lZCBicmlkZ2UsIGVuc3VyZSBp
dCBpcyBwdXQNCj4gb24gcmVtb3ZhbC4gVG8gYWNoaWV2ZSB0aGlzLCBpbnN0ZWFkIG9mIGFkZGlu
ZyBhbiBleHBsaWNpdCBkcm1fYnJpZGdlX3B1dCgpLCBtaWdyYXRlIHRvIHRoZQ0KPiBicmlkZ2U6
Om5leHRfYnJpZGdlIHBvaW50ZXIgd2hpY2ggaXMgYXV0b21hdGljYWxseSBwdXQgd2hlbiB0aGUg
YnJpZGdlIGlzIGV2ZW50dWFsbHkgZnJlZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhIENl
cmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4uY29tPg0KPiANCj4gLS0tDQo+IA0KPiBDaGFu
Z2VzIGluIHYzOg0KPiAtIGZpeCBFUlJfUFRSIGRlcmVmIHdoZW4gLUVOT0RFViBpcyByZXR1cm5l
ZA0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94bG54L3p5bnFtcF9kcC5jIHwgMTkgKysrKysr
KysrKystLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDggZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hsbngvenlucW1w
X2RwLmMgYi9kcml2ZXJzL2dwdS9kcm0veGxueC96eW5xbXBfZHAuYw0KPiBpbmRleCAzNzkxODBm
YjMwMDQuLmM1YWEyMzZkNmI3NCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hsbngv
enlucW1wX2RwLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hsbngvenlucW1wX2RwLmMNCj4g
QEAgLTM1Myw3ICszNTMsNiBAQCBzdHJ1Y3QgenlucW1wX2RwX3RyYWluX3NldF9wcml2IHsNCj4g
ICAqIEBsb2NrOiBNdXRleCBwcm90ZWN0aW5nIHRoaXMgc3RydWN0IGFuZCByZWdpc3RlciBhY2Nl
c3MgKGJ1dCBub3QgQVVYKQ0KPiAgICogQGlycTogaXJxDQo+ICAgKiBAYnJpZGdlOiBEUk0gYnJp
ZGdlIGZvciB0aGUgRFAgZW5jb2Rlcg0KPiAtICogQG5leHRfYnJpZGdlOiBUaGUgZG93bnN0cmVh
bSBicmlkZ2UNCj4gICAqIEB0ZXN0OiBDb25maWd1cmF0aW9uIGZvciB0ZXN0IG1vZGUNCj4gICAq
IEBjb25maWc6IElQIGNvcmUgY29uZmlndXJhdGlvbiBmcm9tIERUUw0KPiAgICogQGF1eDogYXV4
IGNoYW5uZWwNCj4gQEAgLTM4NSw3ICszODQsNiBAQCBzdHJ1Y3QgenlucW1wX2RwIHsNCj4gIAlz
dHJ1Y3QgY29tcGxldGlvbiBhdXhfZG9uZTsNCj4gIAlzdHJ1Y3QgbXV0ZXggbG9jazsNCj4gDQo+
IC0Jc3RydWN0IGRybV9icmlkZ2UgKm5leHRfYnJpZGdlOw0KPiAgCXN0cnVjdCBkZXZpY2UgKmRl
djsNCj4gIAlzdHJ1Y3QgenlucW1wX2Rwc3ViICpkcHN1YjsNCj4gIAl2b2lkIF9faW9tZW0gKmlv
bWVtOw0KPiBAQCAtMTQ5NCw4ICsxNDkyLDggQEAgc3RhdGljIGludCB6eW5xbXBfZHBfYnJpZGdl
X2F0dGFjaChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLA0KPiAgCQlyZXR1cm4gcmV0Ow0KPiAg
CX0NCj4gDQo+IC0JaWYgKGRwLT5uZXh0X2JyaWRnZSkgew0KPiAtCQlyZXQgPSBkcm1fYnJpZGdl
X2F0dGFjaChlbmNvZGVyLCBkcC0+bmV4dF9icmlkZ2UsDQo+ICsJaWYgKGRwLT5icmlkZ2UubmV4
dF9icmlkZ2UpIHsNCj4gKwkJcmV0ID0gZHJtX2JyaWRnZV9hdHRhY2goZW5jb2RlciwgZHAtPmJy
aWRnZS5uZXh0X2JyaWRnZSwNCj4gIAkJCQkJYnJpZGdlLCBmbGFncyk7DQo+ICAJCWlmIChyZXQg
PCAwKQ0KPiAgCQkJZ290byBlcnJvcjsNCj4gQEAgLTI0NjEsMTAgKzI0NTksMTUgQEAgaW50IHp5
bnFtcF9kcF9wcm9iZShzdHJ1Y3QgenlucW1wX2Rwc3ViICpkcHN1YikNCj4gIAkgKiBBY3F1aXJl
IHRoZSBuZXh0IGJyaWRnZSBpbiB0aGUgY2hhaW4uIElnbm9yZSBlcnJvcnMgY2F1c2VkIGJ5IHBv
cnRANQ0KPiAgCSAqIG5vdCBiZWluZyBjb25uZWN0ZWQgZm9yIGJhY2t3YXJkLWNvbXBhdGliaWxp
dHkgd2l0aCBvbGRlciBEVHMuDQo+ICAJICovDQo+IC0JcmV0ID0gZHJtX29mX2ZpbmRfcGFuZWxf
b3JfYnJpZGdlKGRwLT5kZXYtPm9mX25vZGUsIDUsIDAsIE5VTEwsDQo+IC0JCQkJCSAgJmRwLT5u
ZXh0X2JyaWRnZSk7DQo+IC0JaWYgKHJldCA8IDAgJiYgcmV0ICE9IC1FTk9ERVYpDQo+IC0JCWdv
dG8gZXJyX3Jlc2V0Ow0KPiArCWRwLT5icmlkZ2UubmV4dF9icmlkZ2UgPSBvZl9kcm1fZ2V0X2Jy
aWRnZV9ieV9lbmRwb2ludChkcC0+ZGV2LT5vZl9ub2RlLCA1LCAwKTsNCj4gKwlpZiAoSVNfRVJS
KGRwLT5icmlkZ2UubmV4dF9icmlkZ2UpKSB7DQo+ICsJCWlmIChQVFJfRVJSKGRwLT5icmlkZ2Uu
bmV4dF9icmlkZ2UpID09IC1FTk9ERVYpIHsNCj4gKwkJCWRwLT5icmlkZ2UubmV4dF9icmlkZ2U7
DQoNCg0KQSB3YXJuaW5nIG9uIHRoaXMgcGF0Y2gNCg0KZHJpdmVycy9ncHUvZHJtL3hsbngvenlu
cW1wX2RwLmM6IEluIGZ1bmN0aW9uIOKAmHp5bnFtcF9kcF9wcm9iZeKAmToNCmRyaXZlcnMvZ3B1
L2RybS94bG54L3p5bnFtcF9kcC5jOjI0NjU6MzU6IHdhcm5pbmc6IHN0YXRlbWVudCB3aXRoIG5v
IGVmZmVjdCBbLVd1bnVzZWQtdmFsdWVdDQogMjQ2NSB8ICAgICAgICAgICAgICAgICAgICAgICAg
IGRwLT5icmlkZ2UubmV4dF9icmlkZ2U7DQogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
IH5+fn5+fn5+fn5efn5+fn5+fn5+fn4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+ICsJCX0gZWxzZSB7
DQo+ICsJCQlyZXQgPSBQVFJfRVJSKGRwLT5icmlkZ2UubmV4dF9icmlkZ2UpOw0KPiArCQkJZ290
byBlcnJfcmVzZXQ7DQo+ICsJCX0NCj4gKwl9DQo+IA0KPiAgCS8qIEluaXRpYWxpemUgdGhlIGhh
cmR3YXJlLiAqLw0KPiAgCWRwLT5jb25maWcubWlzYzAgJj0gflpZTlFNUF9EUF9NQUlOX1NUUkVB
TV9NSVNDMF9TWU5DX0xPQ0s7DQo+IA0KPiAtLQ0KPiAyLjUzLjANCg0K

