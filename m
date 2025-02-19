Return-Path: <linux-arm-msm+bounces-48465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E9EA3AEBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 02:13:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96F21188640E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 01:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E7E20330;
	Wed, 19 Feb 2025 01:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=nobuhiro1.iwamatsu@toshiba.co.jp header.b="k+mFfKID"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mo-csw.securemx.jp (mo-csw1120.securemx.jp [210.130.202.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9508F83CC7;
	Wed, 19 Feb 2025 01:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.130.202.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739927601; cv=fail; b=GFka1UwBVI+O2DqESvCvpC4ouUJTrNGyHbdda7IkmD8LNba9EAyo3caUaua4VF3Ozgnx+E/5jgBoGIsSxbI0nDM74gFPcfd3nwCZ0aeT1x4D14s7MJ5j79PFraUmYVMzohfV0zEiTEZr33OEsd2q62erth7eQk1Ov/asAzbzQ4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739927601; c=relaxed/simple;
	bh=3FSpP6JfOuayIdZsdYiJxpZhfoYELmplVeETlOVt8i8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PyWoMfRQP+CWpjF+qjrdp/PW3BuJ0F6lnYZMmxgs3WJeDaieXw1KI/6oSeusrdB05M2j25w0TOmPSSS/72AtjJwUcKiixGqkD7NeQi0Hqra74MF4cIAC0mq8OX/IN1Cym2Ykrey3Z4bGMRZw9gU9oDNOb1JrEbicuqHegnOSdVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=nobuhiro1.iwamatsu@toshiba.co.jp header.b=k+mFfKID; arc=fail smtp.client-ip=210.130.202.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:CC
	:Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding:MIME-Version;i=nobuhiro1.iwamatsu@toshiba.co.jp;s=
	key2.smx;t=1739927500;x=1741137100;bh=3FSpP6JfOuayIdZsdYiJxpZhfoYELmplVeETlOV
	t8i8=;b=k+mFfKID7tJzlqtxDNzskfaKvxzqmHKjRc5s6PSSkvMXaFMXk01W9us0zHWY+JHOldAZG
	cThpNl2vBC4N7wKTMFPL1NnISM2TUcGCmg/7NMYIkIyDKzyMQv5Ww5lYZBPR9n4m0xBchXokvvwMX
	rUG1yr93MbxMZoTBCdR05QlTpdy7DCb/c6F/P1XDV6ARoNWCsrVf2i3aqjsVTA4bA6CJin3ccwJU0
	h+FtzrE7pmW6Nr3ywsW/DwPQXZ6VKeqDcKD3/VWsTsPzvi/8Phs8sYHDA1JQn2GLY6pndkoJOZobn
	W9OPoDC1CKpInPzrT999DUWuUWoiMhCzIENMZFPrEA==;
Received: by mo-csw.securemx.jp (mx-mo-csw1120) id 51J1Bbxt1643757; Wed, 19 Feb 2025 10:11:37 +0900
X-Iguazu-Qid: 2rWh5b6vEriU9O3E8H
X-Iguazu-QSIG: v=2; s=0; t=1739927497; q=2rWh5b6vEriU9O3E8H; m=rd1DG7Yxy0+XA59rMoOyplbxeQIS9QaKivZOVQpC2JQ=
Received: from imx12-a.toshiba.co.jp ([38.106.60.135])
	by relay.securemx.jp (mx-mr1122) id 51J1BUI23181301
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 10:11:31 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCArfQxY1/wzN+kel0LSdtt0f6aNCDt0QWexEQJxcGy1RRdp/b09T0lzb64MVc0VvForuemaE/pIm7/AAnFRRcjvnVaubi9aw4umTjPq9V12rGF2dAOFu5LSkcgLuBAzGO30TXG3C1Sx/9yA/v7R6U2dMnahT3Rg7WIK3uo0Qasx/BFak9/u4Ze33glEbqbV1fzIWqNWQe8EHUt6B7rpntnxOYaFqQcBz5nfsjZGe1jpdfKkxrwWRASuvcAMmxAJFiCvvkuv+x2XUxxjeZOK2Ti890zBm1ZKhNOG5YJWAJJ/Vuy2Ud5inVYswFG8CSGCK0V4j9FOZZZ0kylDdG4hbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FSpP6JfOuayIdZsdYiJxpZhfoYELmplVeETlOVt8i8=;
 b=daaCZqCdMLPwUBHuRb081MY9k4dmeGxrMX5mgZwF77b87lm0boF/4sxWOv3s6+diMVlLz/4JW2wpRMI+GMyZnHdCmk0Etd+pdco3aXvRZ4sLMUfZgoa6/RORvUBaIca9GtQefXBh7s1mh/YXC0F7/5Hx3tAObkmgEh5O7AQSWTQsIRxXwywPauslh5A+iy0hRJCVPnOd8myM3MXv0K9TbZo+H3AYHc8dOVIatVIplHdtIb0wJpL46ta88Cf7nH2WTUe7EG1E2CcbSfR1FzYaltM/dsTJdU+pUBDUSY6gcdPGITgCK1UDF20P+Na9fYzfQrk8aXlefYu8kSVPIvK1EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <nobuhiro1.iwamatsu@toshiba.co.jp>
To: <rmk+kernel@armlinux.org.uk>, <netdev@vger.kernel.org>
CC: <alexandre.torgue@foss.st.com>, <andrew+netdev@lunn.ch>, <wens@csie.org>,
        <davem@davemloft.net>, <drew@pdp7.com>, <kernel@esmil.dk>,
        <edumazet@google.com>, <festevam@gmail.com>, <wefu@redhat.com>,
        <guoren@kernel.org>, <imx@lists.linux.dev>, <kuba@kernel.org>,
        <jan.petrous@oss.nxp.com>, <jernej.skrabec@gmail.com>,
        <jbrunet@baylibre.com>, <khilman@baylibre.com>,
        <linux-amlogic@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-sunxi@lists.linux.dev>, <martin.blumenstingl@googlemail.com>,
        <mcoquelin.stm32@gmail.com>, <minda.chen@starfivetech.com>,
        <neil.armstrong@linaro.org>, <s32@nxp.com>, <pabeni@redhat.com>,
        <kernel@pengutronix.de>, <samuel@sholland.org>,
        <s.hauer@pengutronix.de>, <shawnguo@kernel.org>, <vkoul@kernel.org>
Subject: RE: [PATCH net-next 2/3] net: stmmac: remove useless priv->flow_ctrl
Thread-Topic: [PATCH net-next 2/3] net: stmmac: remove useless priv->flow_ctrl
Thread-Index: AQHbge98a5qcr5qm3kiYD9a+dQCXCLNN0cdw
Date: Wed, 19 Feb 2025 01:11:26 +0000
X-TSB-HOP2: ON
Message-ID: 
 <OS7PR01MB148089F4C1A42FDCD46D5E3D192C52@OS7PR01MB14808.jpnprd01.prod.outlook.com>
References: <Z7Rf2daOaf778TOg@shell.armlinux.org.uk>
 <E1tkKmI-004ObG-DL@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tkKmI-004ObG-DL@rmk-PC.armlinux.org.uk>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB14808:EE_|TYCPR01MB11899:EE_
x-ms-office365-filtering-correlation-id: 9b3100f0-b610-4c84-8c72-08dd5082557c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?MGJTYlZFc3I5aDg2R2d2dTRHMkV0V1pqTi9OZ2EvS05kVHoyMFlLODBHbFJv?=
 =?utf-8?B?L2dHYmszdzQ1NTFxaDcra09FVTNsbjJBTUxiNjA3WWdRTEx5UGRiZk80NUJr?=
 =?utf-8?B?SklJYkx3YVhmTUFocjgzeHc4YVIweExPVmVTK3NNZEMxYVdXd1BJdXZHaHdF?=
 =?utf-8?B?T0tEUEIxQ3M3Tm5qUUJqUnlRc05hUVA1enNMVlBmZkkwcDQzam5oUVEzY0xG?=
 =?utf-8?B?RzZDM3g4ZTUvRzNQazlFVWdXQnVCYWpEcktEOWNob2FoSFl6QzJJSFUyN0tr?=
 =?utf-8?B?a2VGWnAwa1NMa0M4Y1FCNDJXRXp5U0o4cmVkRU1IZXUydlNWSHdhZEJUMlRo?=
 =?utf-8?B?U0pnalBZWkczTFRlOG5ya2NObDFrOXVsc2tVcFcvc0JlY1BRWDMvMDR2YklS?=
 =?utf-8?B?YW1yMXc0bWF5ZHl4eDk4SnhRcC82QzFYOFJDNVBlMFlSbURCcjV0L3lya1ND?=
 =?utf-8?B?WjUrdHhFdlEwVEJWYm1ueEttcGxlZmRSMnhCdytvdUxKZjMvOXVkUEYvMUZm?=
 =?utf-8?B?bjkzenhvT0pnT243NVhnSkpGU2V2VGw1RmZ0cG9yVk5kWjJXSkR2Y2ZGZnNh?=
 =?utf-8?B?TUVaRzZPRmpyZlRBd2F3TVo4NFpTT3pUbkZuWE43NWJPT3lDRVZEQ2pXUnRZ?=
 =?utf-8?B?bVFRM0ZlTlc1NXZlcHBiaXJPZjJ0WmhNTnN3Z0ZNVHVPbjN6L3h5ZUVZRm5C?=
 =?utf-8?B?VHM0TUFIU2dVVXluemwvSHRmaW8wbzEzVll5Vkp0RmRxdXVkUlZiSlI4UHNy?=
 =?utf-8?B?RnR2RFU5dmdiNWMvY3VINEFkcGZiQjREVG5KWVZLN0ticXFtbTJiSHhNOEw0?=
 =?utf-8?B?QzhZaW55WVUzMmV4bmtXS2RMK0JnNmJiRURaMTJ5dm1sbStvQi9PQ1FxY1Zp?=
 =?utf-8?B?dTZENXk1VnRqVEx0OXJoS3JrUXJSLzZ4WmNmTEVYSWNvajY0VmFab2NqUzd4?=
 =?utf-8?B?WHJaVVJmWCtXSmpwSmwxUjZBNVhyT2k2aS8xZ0NOSHV4VCtYc0FkZXVxRU5n?=
 =?utf-8?B?TDc0dTBTeTZZUFhKMTlxV3gzTmJDSjdJaUJrM0Q0Q1VJcUdya0tHcm16OTZy?=
 =?utf-8?B?eWp1SEJDK3FTR1RHV1Z5WFhGc2Z0L0pCTENBbEc2d1E4Z0lTdGIyOG45bk5V?=
 =?utf-8?B?Zk1WS3E3VnA0WW96OWxhTDFmWVhzUnVTZU1jMmxKWC8wdEtVcG1RQXVXSFV0?=
 =?utf-8?B?eVQ3NjhtT0FldFE1azNnbU9GSFRpRG5rMElKMlhCdUkwTEl2ajZMQWEybHZL?=
 =?utf-8?B?eEs5cUg0bzZLK1hCWU1iZVJZRDAzRXNmUEYxZGdtbEc5TDZZRFBjZ0dtV2t1?=
 =?utf-8?B?Q3ZGUHdmakhpT05lVThRc0dQVmVvR3QxMlJHemwwdHpoRDdVQ2Z2d0Y4c0Jk?=
 =?utf-8?B?UHBoYyszSXZNL1IwK3ZzdzVnU2Rsc0k0WllqYkYxZnBVYTFlalUxNGpaL3pE?=
 =?utf-8?B?c0NDTmRqRW5YakVEWVFGcmJoSkJvSENHR2U4Mmp0dFkwSDZFU1dMNTNwcjg4?=
 =?utf-8?B?alQ4STFWN05QWHkvK3N1b3JhZ21MelBjdEFYUnBlWVFOaGR6N01ZMTlzcGI1?=
 =?utf-8?B?WHhWaFRYcXF1UDFyYUtpd0ZsT1NmRnNlbTd0RG16cHlDbjlvbzRSZTU2Q05j?=
 =?utf-8?B?RmZCMmpZTTlSd0Q4cVpwaUpaL0dQOFROYzhxM3NRU2tMcTJlSGIwU1hxVWlL?=
 =?utf-8?B?V3JPQ0trYTVDa2NBeTl3dTB0Umt6U0NzczF4Tkd4OXRjeElSZVJVbTdUMlhy?=
 =?utf-8?B?TktDYVNxY1ZSSVcvRHZZN2IwV01wMmJNWEFHaTlqdU1nRW1pT0l5N0N3Kzk4?=
 =?utf-8?B?YjNBZXd3TXdhMThrck1SaGpSbXV6cXdFSzlDeEIweWZvc3g4dHZRSjFzUjUz?=
 =?utf-8?B?OEhWSzhYRVZCRmI2d3VDYStlL0lTMEp5RldZZGJ2ZUFlWmdXT0VraXJ4VCtT?=
 =?utf-8?Q?Ba52/rq+1YYV0FWzYO9DmQ/bRjCtkS6g?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB14808.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cDArM1RCSFluS1B4Qm9XcWoySy9jRmpJcy9xR2crZ1FtU1ZIM3pUb2gvcEZ2?=
 =?utf-8?B?b2VZbDQ1OXptR0tVM0NSdGo4RitQTjdQQlVZbGxjYUJ3WThWNTY4QTc1ZkNw?=
 =?utf-8?B?U2hIS2l0bWxiSzFvVC8wSjRxaHgzWHFzVFI2TEFLdEJ4bUhqTDBQYVhKM0JJ?=
 =?utf-8?B?SHNvdzZENEVkR3VIWThVaVArcVJDeUFzTVkzeUdRelJoMWY2SmV4SWx1OU4w?=
 =?utf-8?B?SlRhdW5sUHhXdEU0RVNLTG9yTE9samxVdXpNczRCbWRVVmFQdk15MFZFa0Z2?=
 =?utf-8?B?bHlqaWU3NFRqdDhROG9jQ0dzZm1FZjdpYUxvcFFic1JIb3lFZFEvTkhheVFh?=
 =?utf-8?B?ZmxXNHpQa1BFTjE3STlreDBMajNtQld5RUhXWXBSeVR6c1U4SktCdW1IUUh4?=
 =?utf-8?B?WjkvaXZDN1pQNWI0cGNpTFgvcHZLTUhId2xLOWxGZ3krRFM2Mi8zbHlIMTli?=
 =?utf-8?B?MDVtRWNlUit3VG5hM0xsQTIxcHBhOUUybzltVHBQV1FjVk9jS0o4Z09XOXBG?=
 =?utf-8?B?a2pQZHZDNG9Cc1ZKcllERTNSNlRub05NeGh2R055SDZ1NkxvU0d6ZTNLRjdT?=
 =?utf-8?B?WTV3aTdvTlFQV0F0aEJtSVdhSUo0ejRUWGVxNVFvd3ZxczdwQ1d3UWxYZkM3?=
 =?utf-8?B?QisrT0xkVWVkZnAyUEhIWWlDbGd4N0xucU41V3hUNFk0c2c2djh2TmZQVUdq?=
 =?utf-8?B?dDV3SHlRVVdpRVhaM1plOVhueUZYLzcwY3BDcnZPZHJoQnNjbEFJR1FhaVYz?=
 =?utf-8?B?OGdNY3hwY044OHlIWVprbUh2VzZqRUJrTnRsM3h0ZENHVWlydjJSRDRTbFVU?=
 =?utf-8?B?UWJ0cUJJN2hpcjAxeGJIb3JXanltazhsRlpJM1c0anRNaDltN1o5QnpzZFY2?=
 =?utf-8?B?OU5OTWFpbVNRMGZpYzlvR2t1NThQOFliaWk2Z1FONEdNM0hxQkRNWU1GWXNi?=
 =?utf-8?B?M0tmWC8ySU50QkRRR2pJazlLOGtyQzUxNWh1dzhFb1F3Si9GQmNvVW9vTXdI?=
 =?utf-8?B?ZVhxUWVXYU1JQXNjTnNKTExaMGN3V3F0YUdSY2tIbVEySmR3c3NKNGx1cDMr?=
 =?utf-8?B?bE9IMjVvZVNwRW1CN2RNc056dVhsL01kaWVNMzV3ZnJOeGVKYVpBaTdwMmlR?=
 =?utf-8?B?M2pTeDhkWllEUVhJWHhubzFacitsc1p6V0RKSEQrZ0s2UDJsKytqeFhCWnFM?=
 =?utf-8?B?dlVERnJUNTI2UkwrNnluU3JLR21JSmVEaTBWNU1MUkVHZzlqOFNCVnFwdlQ2?=
 =?utf-8?B?RmV0ait3aTdEUU02RllreW9kRFBzODUveDRndmlFL2paRzU4UFJ3anFRNXFG?=
 =?utf-8?B?OGdCcklnekxIdUUvdnBjbmFHdXBUYkFnOHRPeVY4ZFo2elFzdU91WFB2ODNL?=
 =?utf-8?B?WktHY2VndHZlWU5iMjhIUjZaTTdQZFJuSUFucFQzNmRwM1BqUlVXR0p6ak9R?=
 =?utf-8?B?OHhOWkJQRTFxaFdtT0hySHFOVGhTeUx3cDFRcm0raitJVldHbWRIN3U3V2kz?=
 =?utf-8?B?a2ZSUGQrUjFaeDBJVk1yK2NXbEQwNEVpbmZkQ3ROckw2Z0VQRDJMa1BPWjJE?=
 =?utf-8?B?TjB6MGE5TndXanlHNGNOQUFaaTRESzh2b3lCWVM4R0dXVGdJVXZ5WldOTDRS?=
 =?utf-8?B?YkRPQ2Z3NW1iMVZtdVR4bDA5L2JRUFJqb1ZPamNUZ3hHZ2dZU21PZTJCTC8x?=
 =?utf-8?B?c3hzQTJJK0JnSm85R2wydFY4Q200OVlxWUo5WFprbVF1Yitka2VMMlBoek9R?=
 =?utf-8?B?aHlLSVBQRlQ0aVVWUGQrQjc0OTQzQ0VIWUNwRVh1Ti9CU2kyUGtaMGFRVWFN?=
 =?utf-8?B?NnhRY1piZDFFTjR1NnF0VyttZnZkUzhlMkE0RGZJTndZS0oyRTRla2svNzdj?=
 =?utf-8?B?ZFNYR0lIT2NMaHBZTVlLUkV0aEdTSGZVaUlsRFFsTmJzMFVKMFRLVGt3bGR4?=
 =?utf-8?B?b3JRUXFTRVFMcWxQV3paUytTazZ2MysxdmdLRGpRU25iaUplTlpoZkpQdm5K?=
 =?utf-8?B?VS9WWUJZbEIwTk8wZC91MkNaWDdOdUJleVRlMnFFdXB0Q2NyeEJmaUpteHZx?=
 =?utf-8?B?TCt2eU5sTFdwT1lKejVxY3loWWVNVEZsOWMwZGVkL1htbko1QnZkMWpCT2o0?=
 =?utf-8?B?d3MrNHNXdHRPalFEYTBkdGxhRm1KblQrNWFXWkJWemdaa2pRanlZTzNvYm90?=
 =?utf-8?B?ZEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: toshiba.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB14808.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b3100f0-b610-4c84-8c72-08dd5082557c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2025 01:11:26.6368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H2rlT1pQ/85V46jqKmumwP2SHeg8WHvk8REwTWWaovQKbjxRp+/SBpHWicLgPHqfTxvMpQ8Rlf9Lfw2Z1EJeUvDZoXP/6XkM7CEZO9wwkabgFzQeWC7uAxD7xhYd1Kzd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11899

SGkgUnVzc2VsbCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSdXNz
ZWxsIEtpbmcgPHJta0Bhcm1saW51eC5vcmcudWs+IE9uIEJlaGFsZiBPZiBSdXNzZWxsIEtpbmcg
KE9yYWNsZSkNCj4gU2VudDogVHVlc2RheSwgRmVicnVhcnkgMTgsIDIwMjUgNzoyNSBQTQ0KPiBU
bzogbmV0ZGV2QHZnZXIua2VybmVsLm9yZw0KPiBDYzogQWxleGFuZHJlIFRvcmd1ZSA8YWxleGFu
ZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT47IEFuZHJldyBMdW5uDQo+IDxhbmRyZXcrbmV0ZGV2QGx1
bm4uY2g+OyBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+OyBEYXZpZCBTLiBNaWxsZXINCj4g
PGRhdmVtQGRhdmVtbG9mdC5uZXQ+OyBEcmV3IEZ1c3RpbmkgPGRyZXdAcGRwNy5jb20+OyBFbWls
IFJlbm5lcg0KPiBCZXJ0aGluZyA8a2VybmVsQGVzbWlsLmRrPjsgRXJpYyBEdW1hemV0IDxlZHVt
YXpldEBnb29nbGUuY29tPjsgRmFiaW8NCj4gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPjsg
RnUgV2VpIDx3ZWZ1QHJlZGhhdC5jb20+OyBHdW8gUmVuDQo+IDxndW9yZW5Aa2VybmVsLm9yZz47
IGlteEBsaXN0cy5saW51eC5kZXY7IEpha3ViIEtpY2luc2tpDQo+IDxrdWJhQGtlcm5lbC5vcmc+
OyBKYW4gUGV0cm91cyA8amFuLnBldHJvdXNAb3NzLm54cC5jb20+OyBKZXJuZWogU2tyYWJlYw0K
PiA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPjsgSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXls
aWJyZS5jb20+OyBLZXZpbg0KPiBIaWxtYW4gPGtoaWxtYW5AYmF5bGlicmUuY29tPjsgbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmc7IGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tOw0KPiBsaW51eC1zdW54aUBsaXN0cy5saW51eC5kZXY7IE1hcnRpbiBCbHVtZW5zdGlu
Z2wNCj4gPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+OyBNYXhpbWUgQ29xdWVs
aW4NCj4gPG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20+OyBNaW5kYSBDaGVuDQo+IDxtaW5kYS5j
aGVuQHN0YXJmaXZldGVjaC5jb20+OyBOZWlsIEFybXN0cm9uZw0KPiA8bmVpbC5hcm1zdHJvbmdA
bGluYXJvLm9yZz47IGl3YW1hdHN1IG5vYnVoaXJvKOWyqeadviDkv6HmtIsg4peL77yk77yp77y0
77yj4pah77ykDQo+IO+8qe+8tOKXi++8r++8s++8tCkgPG5vYnVoaXJvMS5pd2FtYXRzdUB0b3No
aWJhLmNvLmpwPjsgTlhQIFMzMiBMaW51eCBUZWFtDQo+IDxzMzJAbnhwLmNvbT47IFBhb2xvIEFi
ZW5pIDxwYWJlbmlAcmVkaGF0LmNvbT47IFBlbmd1dHJvbml4IEtlcm5lbA0KPiBUZWFtIDxrZXJu
ZWxAcGVuZ3V0cm9uaXguZGU+OyBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsQHNob2xsYW5kLm9yZz47
DQo+IFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT47IFNoYXduIEd1bw0KPiA8
c2hhd25ndW9Aa2VybmVsLm9yZz47IFZpbm9kIEtvdWwgPHZrb3VsQGtlcm5lbC5vcmc+DQo+IFN1
YmplY3Q6IFtQQVRDSCBuZXQtbmV4dCAyLzNdIG5ldDogc3RtbWFjOiByZW1vdmUgdXNlbGVzcyBw
cml2LT5mbG93X2N0cmwNCj4gDQo+IHByaXYtPmZsb3dfY3RybCBpcyBvbmx5IGFjY2Vzc2VkIGJ5
IHN0bW1hY19tYWluLmMsIGFuZCB0aGUgb25seSBwbGFjZQ0KPiB0aGF0IGl0IGlzIHJlYWQgaXMg
aW4gc3RtbWFjX21hY19mbG93X2N0cmwoKS4gVGhpcyBmdW5jdGlvbiBpcyBvbmx5IGNhbGxlZCBm
cm9tDQo+IHN0bW1hY19tYWNfbGlua191cCgpIHdoaWNoIGFsd2F5cyBzZXRzIHByaXYtPmZsb3df
Y3RybCBpbW1lZGlhdGVseSBiZWZvcmUNCj4gY2FsbGluZyB0aGlzIGZ1bmN0aW9uLg0KPiANCj4g
VGhlcmVmb3JlLCBpbml0aWFsaXNpbmcgdGhpcyBhdCBwcm9iZSB0aW1lIGlzIGluZWZmZWN0dWFs
IGJlY2F1c2UgaXQgd2lsbCBhbHdheXMgYmUNCj4gb3ZlcndyaXR0ZW4gYmVmb3JlIGl0J3MgcmVh
ZC4gQXMgc3VjaCwgdGhlICJmbG93X2N0cmwiDQo+IG1vZHVsZSBwYXJhbWV0ZXIgaGFzIGJlZW4g
dXNlbGVzcyBmb3Igc29tZSB0aW1lLiBSYXRoZXIgdGhhbiByZW1vdmUgdGhlDQo+IG1vZHVsZSBw
YXJhbWV0ZXIsIHdoaWNoIHdvdWxkIHJpc2sgbW9kdWxlIGxvYWQgZmFpbHVyZSwgY2hhbmdlIHRo
ZQ0KPiBkZXNjcmlwdGlvbiB0byBpbmRpY2F0ZSB0aGF0IGl0IGlzIG9ic29sZXRlLCBhbmQgd2Fy
biBpZiBpdCBpcyBzZXQgYnkgdXNlcnNwYWNlLg0KPiANCj4gTW9yZW92ZXIsIHN0b3JpbmcgdGhl
IHZhbHVlIGluIHRoZSBzdG1tYWNfcHJpdiBoYXMgbm8gYmVuZWZpdCBhcyBpdCdzIHNldCBhbmQN
Cj4gdGhlbiBpbW1lZGlhdGVseSByZWFkIHN0bW1hY19tYWNfZmxvd19jdHJsKCkuIEluc3RlYWQs
IHBhc3MgaXQgYXMgYQ0KPiBwYXJhbWV0ZXIgdG8gdGhpcyBmdW5jdGlvbi4uDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgPHJtaytrZXJuZWxAYXJtbGludXgub3Jn
LnVrPg0KDQpSZXZpZXdlZC1ieTogTm9idWhpcm8gSXdhbWF0c3UgPG5vYnVoaXJvMS5pd2FtYXRz
dUB0b3NoaWJhLmNvLmpwPg0KDQpCZXN0IHJlZ2FyZHMsDQogIE5vYnVoaXJvDQo=


