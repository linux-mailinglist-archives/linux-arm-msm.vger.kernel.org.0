Return-Path: <linux-arm-msm+bounces-64113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E06AFDF17
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 07:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E5157A8DF7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 05:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 976B4217719;
	Wed,  9 Jul 2025 05:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sandisk.com header.i=@sandisk.com header.b="PcUPbkZ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from esa.hc6817-7.iphmx.com (esa.hc6817-7.iphmx.com [216.71.154.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E2E2B9B7;
	Wed,  9 Jul 2025 05:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=216.71.154.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752038196; cv=fail; b=sqcWXVIXBtLQYoDPVZ268PUQMyLsVoYZcHBfQjgOdfe7PDIuiVv2EvGt3+Zo9F1edH4PSo4gM/PF72EFDFoCutmqzXrxTOGstL9D+8O7POhurV1zE59zEH1lmtFau/aHug2HIm6oOg76qcSIU3l5Z9/EeUytJmJXTZS3N4dFrZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752038196; c=relaxed/simple;
	bh=rUrNUtEvapJlYc9qoHL4EqfUf/Ns8THUh1He7sL0K4A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YJwU8R6EV0Idie5NQ5LTL4sEY4gwaABX0pHUWF0pHxWd7DxRbdmGDnRgY8d3L6AzTMbb+0cFpNs6wd9l5JKEjHYMt16PIWRoOfP6cEhoRB7WSpE2kFEfa9xs8PxzgYQbxDuDgexXCmKeqWJXHRmG8MXwHcHbtcqrZ/aySxygED0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sandisk.com; spf=pass smtp.mailfrom=sandisk.com; dkim=pass (2048-bit key) header.d=sandisk.com header.i=@sandisk.com header.b=PcUPbkZ2; arc=fail smtp.client-ip=216.71.154.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sandisk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sandisk.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=sandisk.com; i=@sandisk.com; q=dns/txt;
  s=dkimnew.sandisk.com; t=1752038195; x=1783574195;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rUrNUtEvapJlYc9qoHL4EqfUf/Ns8THUh1He7sL0K4A=;
  b=PcUPbkZ2opPH2KWkgJwmLx4pljtRCjnoqZTgHRxdAXZrQiJtURHY51nH
   ONnLBg1fegovV1UMxOXuNARIk1o9lsuDf0eRV17nI8Lsi6pv37OeooZ8k
   CwwolWGE9Jrq7VNA5FhuIyj6TVhmKqaQkOSRdYH+cokAegOvcH687910y
   a+XJfeBik2fAVAca5etZJyVNfK9z0YMHDO5L9cDnyAq7YNRNrV+VgpNic
   KtnkfKbRjmBAquvD+Uny3QW70LZTahR/Nop7czVEbOHYQklsuMl87wf4U
   SJ3egfdIM29AihGHuJeaCHPVeteNxOLNZ07ySjuooX7tuH1LuQBYF+ZvU
   g==;
X-CSE-ConnectionGUID: T+BH+B4cSS6w4KQGbIyUBg==
X-CSE-MsgGUID: ONohP3aES+6jzf7DtrAafA==
Received: from mail-dm6nam12on2120.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([40.107.243.120])
  by ob1.hc6817-7.iphmx.com with ESMTP; 08 Jul 2025 22:16:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XYvoS92PJyNoh4HJbRiLju8dD5r/2FrKOBQDdbOmN1GUISxG3G90bPniTPVUl2TCh0UqSU1TkDGG2KmkP1feFaAz3qwogGlnEPpEyeFIC8vwwl0uyVToxM22HwPd28Jx0YLLekYMmbjna3kJ8UZMlTpxl2zvoFi/3FP8xE8Gf1UHr0gqatzW8c+uDeaHiy+QwNondejCschJXa5dbD77930tVcF7nb/DtIA43AlEuKZrGmx1W9GyDwZIvWAA+d0N05ZM063ahzgcX5EIWKugBldMGYfNPWwr9YsIMv9GLWeXooSDT4x4qi0HRSdRuE9aanVBUmaNGT4rp7DZR+AogQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUrNUtEvapJlYc9qoHL4EqfUf/Ns8THUh1He7sL0K4A=;
 b=WSoUnbhx2Xuqd+VijAdJCuHQE5z95/fM9zxtSEqw2VkfNnNbqibrtaXjTNCB2q0KsT80LFOie6MH/a9lKJVoxXM3Lh+NWcBeuehUMkRd9nwK8mXOnuQjUhVf1ZvTx3P9eQsJkK/k+VDiVMfnUMixPRCD0sgnI8kp7JLFtzg2qtzkUHynTjdY0jc5HD+fpnfS5Fk/EaCnOO+zj1S3yUBWVwFFv99qJX6JCstnq4kIIIOaM0Pt8tKYkhfhXKrsvb/Ky17uok9Q8Tp9yQfQR2363OU/VfjMUI90NDPWrrp07uPg0W6DqJH6akLDBIxcJgdI514uPDQERgp3NW/nUq1wtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sandisk.com; dmarc=pass action=none header.from=sandisk.com;
 dkim=pass header.d=sandisk.com; arc=none
Received: from PH7PR16MB6196.namprd16.prod.outlook.com (2603:10b6:510:312::5)
 by BLAPR16MB3747.namprd16.prod.outlook.com (2603:10b6:208:272::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Wed, 9 Jul
 2025 05:16:31 +0000
Received: from PH7PR16MB6196.namprd16.prod.outlook.com
 ([fe80::542:41ae:6140:5595]) by PH7PR16MB6196.namprd16.prod.outlook.com
 ([fe80::542:41ae:6140:5595%7]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 05:16:31 +0000
From: Avri Altman <Avri.Altman@sandisk.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>, "mani@kernel.org"
	<mani@kernel.org>, "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>, "bvanassche@acm.org" <bvanassche@acm.org>,
	"avri.altman@wdc.com" <avri.altman@wdc.com>, "ebiggers@google.com"
	<ebiggers@google.com>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>, "konrad.dybcio@oss.qualcomm.com"
	<konrad.dybcio@oss.qualcomm.com>
CC: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Subject: RE: [PATCH V3 3/3] ufs: ufs-qcom: Enable QUnipro Internal Clock
 Gating
Thread-Topic: [PATCH V3 3/3] ufs: ufs-qcom: Enable QUnipro Internal Clock
 Gating
Thread-Index: AQHb8E70Now1+gBlykuFNjrAun77MLQpQCuQ
Date: Wed, 9 Jul 2025 05:16:31 +0000
Message-ID:
 <PH7PR16MB6196F9B8C676FA18AAC10F3FE549A@PH7PR16MB6196.namprd16.prod.outlook.com>
References: <20250708212534.20910-1-quic_nitirawa@quicinc.com>
 <20250708212534.20910-4-quic_nitirawa@quicinc.com>
In-Reply-To: <20250708212534.20910-4-quic_nitirawa@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sandisk.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR16MB6196:EE_|BLAPR16MB3747:EE_
x-ms-office365-filtering-correlation-id: 1ce946b7-4581-40e6-b9c2-08ddbea7c3ef
x-ms-exchange-atpmessageproperties: SA
sndkipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?PtBBxcsThl+I925phQLrTnQ5sU/MLVSqnXlyXHJOGfk6AKlPSNh0qiYV3q8t?=
 =?us-ascii?Q?3jPv9JzGGUFcE2XcDsQNA/Vhw5CgVqnuMGWAZaeYZJzwiifBiJgYoCFwVHr2?=
 =?us-ascii?Q?sePdxSJM4h6UFXkcXtO5Gqhl99g443XbRj9Beqq++ws1xiQWR7e0CrErGW6C?=
 =?us-ascii?Q?7YL7jhli5CMleo1+iHaX3z1Yk8feg81k4JE9IrRfzL8GmjCSCn4mdU9IeWZ5?=
 =?us-ascii?Q?B4z6RnFA0MZ0gwhRDVqwxdWQRV8UZzhtX/RMpQhWq2/J92tORD1NZemGHa0H?=
 =?us-ascii?Q?BaOMx48aU/rRr3ioruLNoeKfrF25fpbI6Y4GXrCYiMn1r48tEtTqEvocU4El?=
 =?us-ascii?Q?XBmkR3bx+BAlVQs6U/ZnIqtCQuXKF57f7J9xAiXA2t4QRmdrN/2W/Z1vAzSG?=
 =?us-ascii?Q?GyjwGerG/Q+io+rYV17CLgnEvD578bMlSYzz/kY7DxadgVT1pxdYFLDmwJBx?=
 =?us-ascii?Q?p/43HbDmfknqu0RmNIHE4kmHns5ro5oS7Xh25WgsUBOe4lJgkNf3Lzekouy/?=
 =?us-ascii?Q?lu+Px470BTjL5zH7LnMB74nz02T/kLptZnig9x0XUJLgAvs8BeDLvkydKUqc?=
 =?us-ascii?Q?VLjBGbiPDu5wGFdDUt5BOYamxEnvG6f7xiMxbOZBGdTw4DSyAN0dyFBlNTYt?=
 =?us-ascii?Q?j68qlrNSLX+D8f2+2cXOnc8bVlMJneWg5pILdRQfo8BR3GFkkd34JgDEq7dJ?=
 =?us-ascii?Q?ZZcVs2DuqMOAHKeVCbKqfgB5qQyFxozay81CnFRRoy31Z45DnharKF3JPevf?=
 =?us-ascii?Q?qq0RX9Vt2uW+g75pwUGKIu1HJCsBRyGcGGZ8VtO7WP1zEEH5hfvAEh+Biika?=
 =?us-ascii?Q?0QPxnQlCB0Dd1PwmcvoiLZuZ4BcEmQ0NwbLcVFm0yCSRBfP9aEYv6yCRwvIK?=
 =?us-ascii?Q?zyiEy1xT51bdGGF4qX7AT+cUB3Gv39qGr76KekCiEcj5Zexz7fTM6LdrmHpD?=
 =?us-ascii?Q?ek+qty12wNhWIqS64doNonMx2rnZwty4E/fZXILvdPxuVS3w4x5sQeynwFxF?=
 =?us-ascii?Q?lqOV8o6KxdqV+NycbOjnqYruaqrmgUDVl4hh6szSMt4vZfKnClZ1E6vzIz52?=
 =?us-ascii?Q?h48py9Mt+acu9Xx46X/TP7fwI8lGMzx04Yq4QyPwxfH4JxQ6CTnqt2wF0BK3?=
 =?us-ascii?Q?D9/9ZOcFvOeWcnO+A4h9+jjTuI0DmKxTIOZMVPaUrp5zsiLdFe0RSTgSf94T?=
 =?us-ascii?Q?xHMIkFfiw+uje1lU9SpBCe8YGhJxJA5RROU2rape3muXhZVHpNbaGluAt8Pg?=
 =?us-ascii?Q?JYX4X4mmI94407ksNyW2ZoonReJy2DttG21ieEL0YrUXRfmnTO1wF8qG51+b?=
 =?us-ascii?Q?xhW1mQyc8jNHwPa8pRjZ5C2gQUlYjOBTo5cu1yteDRpqVcBxNSyl8P85XKDw?=
 =?us-ascii?Q?dTUMS/gcMWIeh+AHXBKSpQSdmBYcaZoOvhkDpeYcK9nNc2H9ydTfG5mDvneG?=
 =?us-ascii?Q?zflK5pyl5XXD8eD2fOQQskvJoQGzn6MLvHo/6hXceUppGL94Brfd9Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR16MB6196.namprd16.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?bjmaIm6kP/QyCgKNpkjAkDJRiVRg6ntO979Ax/oRGfcwP1BDS8vAt7tWajVk?=
 =?us-ascii?Q?0b6WDH1Kfgy2I/VBc5mxzOsasHOvRcyAw9uYu34DLbo3FyxwLXa+umJdbSlx?=
 =?us-ascii?Q?Oti8f/zOK7wG6lHNhDVNH8HdqXqUGCAzQiCAbHa2u1JK8OYtR8eBKTp/JeiT?=
 =?us-ascii?Q?AFNJHylUGowsivaM0NuZvRba34+G0TJ1VlWissl8VFGJDfJ53EwrqCKKWqZm?=
 =?us-ascii?Q?ptrqIUkEoVH4YR/NpaH9hoay3dKE0owOQOSEMllGwZ7Uvlx2UUlx7HPPkR3n?=
 =?us-ascii?Q?5BaCUiIoc8lY7ceY7H9GtfAtkCWdUb7GscKy9gObOK323xvQgRGkYYF+6top?=
 =?us-ascii?Q?XdnK4SiynxyT8ROARGbEcm96uDI+pF8ql7SRE+hnLOrHS5CBXZnw6lD5kMNF?=
 =?us-ascii?Q?vZ2Coy+e9P9YUpLr73cto5CjcrU5tcjq4D6vkQ6nX+dHteO39KW5q33gvOk8?=
 =?us-ascii?Q?fu1Y4vm6QRYf3Y7f19+ecyoWR7qLWk2Cz7gV1EB4MguDfSbUr1xhDHrds3o9?=
 =?us-ascii?Q?ea/ABO8Z3i8Q7r3dPJ1+ni811ly5H7nTDJpShteNs7F7wun4aE5mjhdr2/hX?=
 =?us-ascii?Q?EO1DQoTCVz5LNOTucRSQGOcLR2ojxTxBb7Ea42QIpE7EM39suyT8grbH4PdW?=
 =?us-ascii?Q?VUxckN+sQleJpCANpzoNZ6MBD4p3PmvCgZJa4K+Ztui0kOLWjzFxw5HoWiiy?=
 =?us-ascii?Q?DgQekSGFRvVXdH0mSCIrmnquFyTxZqkZjbPTKJBdP8/Xk3fEkJqeEMMLi0R+?=
 =?us-ascii?Q?G+/R+8cf2iW5ujIhwSN198NwRY0E0rgHVbls8S6dpLi7wlGlrX4jnHLNxySS?=
 =?us-ascii?Q?n+Sl8GdTKrMxtbHivnmzLHnz+17WH2CeH+tJFdFKssrXFqlDaDQ+Xbopxo/S?=
 =?us-ascii?Q?n7eTkAXrALZTD6Sg0uFyI1e3Glgkb/IpdTKlLzJrv8YGc9olPchhl5YPOVqD?=
 =?us-ascii?Q?T/5WJdzooR7wz8EfQOvL2a5w7yf2uXMTbt7Ca8o6U30+azkasiXYzRQZkVPl?=
 =?us-ascii?Q?OvfCJ8nVDWfUSMFe4pHm2RnmWJPwB7hX3W4lr5yAafoe7vKU/Z+6oMyuDcVR?=
 =?us-ascii?Q?bAoESSH+Akh+DrJIQCV8LkviUDygbQOL6lU3T68yOBA9lYN4ZUcH699i+Mwg?=
 =?us-ascii?Q?O/2WRLjWX92kMWgGOtWq7E3dFVNu6VQebZevOfYE8A48PBiUUvVBnXPkVx7N?=
 =?us-ascii?Q?qh+KrvJgROQZHBBTSwjxFbCHm1ZNWl1DZz4QCOxPulYLlx/7w3c8/rSApeXs?=
 =?us-ascii?Q?I7+QKyUZlq2Ey6cJdAjUPcVq3VLbcDVn11LwVtreCDXz7b5t0ciKHwWdGDMC?=
 =?us-ascii?Q?SnkUa9W4Fypo5u4i47tOTzvFuXppuvNODZAbwUXvACMkLMGZ8ryJEs7h8H1p?=
 =?us-ascii?Q?dJXnTNAhifz1v40rq1g35rVyXR4DOLAev7Yyia2NKyC5GZ7WX2Ieg/EJQE83?=
 =?us-ascii?Q?JqmgxXYx5dQ29mtXrRmKKxB99qwQUrfdL0ql/5rFifr9FSwPgRRqbDFaPlow?=
 =?us-ascii?Q?zFaJHQbwSjNwXZlGQjmSMUCtaXkOfhTE/DDQPl8N9s4qiEYh6ZQeKXUUoveQ?=
 =?us-ascii?Q?fVoADWs4TvakGoPcRvvwd4adG7OaFqi+X1IBfs22?=
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
	uBBbHVhdTE/jjKDKxfO8HTHzEDXK9C4AP+eN4vmBVOiPV2uHeOXL9AuXwv9F8KkpYo9cDCMfTn/RjXmVxaO+OrEZBG/Za9CTS81Es2H5IAbAU+BxnMJICh2V7TmOP7PsZUTjhg4cGyo5tBBwMk6bekek+zA2KkOVfjFPc71vA8QQQ6Sg8ga5xZCE82CoO4/oHIdpBtjSSDXke+3Cfm1GdLrpX2hSzbeIuwLyKVElsb9U3b4vrktOtGWO1fj0/tit8ExOT6KS3UbsAsBdG87+cvcYABjYjzM05YIeWtQQOU1jC98XnIDabfUvMotp9JWQVFcJZ06t2OZ+5zxH+Olyydpk9fAVwOwE9f0HjjrR8Zrk6rnDXtDUMmJq6XvNRNiO6cirkG0HQDYhIhwmM4jdlSROERWZWeDlaCtM2qzTZ0rGdh4e6anChySgIlkbeteU8Vw9aCo+j2eAsD7natXgtDcvvY2ijBPNQZ+JNLO6UmnOepSN6rYiyAYzXq5KGhPT4TXSi85fmCkYPCguDJ7T8tMJxTukgWMfaFkxASIiBam3BMpc2o1DWAafUMloysc3a9CbRIs/Xnmk6steAMVes42DgRDuD92k4ESK8c+xgtJ8RAaGmxd8GwpRl0Yt/99Cq8wkDbJprfpH9V3YX41fWQ==
X-OriginatorOrg: sandisk.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR16MB6196.namprd16.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ce946b7-4581-40e6-b9c2-08ddbea7c3ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 05:16:31.2219
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ffe0ff2-35d0-407e-a107-79fc32e84ec4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 96gmTDjVlN1q/7pqDfleXqtB9gumcciiSdMw44oN0/CXEDxx1G2vlEf55yyFdKrkO0/FUmMolr+mnRoh4uvWLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR16MB3747

> Enable internal clock gating for QUnipro by setting the following attribu=
tes to 1
> during host controller initialization:
> - DL_VS_CLK_CFG
> - PA_VS_CLK_CFG_REG
> - DME_VS_CORE_CLK_CTRL.DME_HW_CGC_EN
>=20
> This change is necessary to support the internal clock gating mechanism i=
n
> Qualcomm UFS host controller. This is power saving feature and hence driv=
er
> can continue to function correctly despite any error in enabling these fe=
ature.
Does this change offloads clock gating?=20
i.e. no need to set UFSHCD_CAP_CLK_GATING ?

Thanks,
Avri

