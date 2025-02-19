Return-Path: <linux-arm-msm+bounces-48464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 387F8A3AEAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 02:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5211A1885348
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 01:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF6A31DA4E;
	Wed, 19 Feb 2025 01:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=nobuhiro1.iwamatsu@toshiba.co.jp header.b="pDI8rxlW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mo-csw.securemx.jp (mo-csw1121.securemx.jp [210.130.202.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B971B66E;
	Wed, 19 Feb 2025 01:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.130.202.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739927459; cv=fail; b=nIGRX1peZVsy1nGGgFlAh/BbwNqoGc4zBV7gDR9RDAnQ7V0FmVFT5nN48M9CfDxT/P4BChQCWVxa9ZADKhjrC7XbIPXzv8sZSCzpICe2NIusbFlHSsBq7/XN5gWURDMBG9hCdVMtowvWXf0BKHQwbJLcGOJ73uultMbJ/O6yDic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739927459; c=relaxed/simple;
	bh=/DuUHd+8W6EL3IO5NL4KhN4wsdwUTejoUg0q7J8tIW0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mC3IgYyDVBZNQbQ7UVi/HYU3gaeXYoI3K7RC0BGRqY90xrVdvkbh2kCU8WPnfmFbqrPijWjjfQ7o4b0aVrhlCHb63i9GIrinCOcrv3Gm4WglnAyX9dl1crOI4FNpEkUlgztH/GrSsQ2cj/sAyehOOFQEos1CNSQLXlFiZoELn6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=nobuhiro1.iwamatsu@toshiba.co.jp header.b=pDI8rxlW; arc=fail smtp.client-ip=210.130.202.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:CC
	:Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding:MIME-Version;i=nobuhiro1.iwamatsu@toshiba.co.jp;s=
	key2.smx;t=1739927306;x=1741136906;bh=/DuUHd+8W6EL3IO5NL4KhN4wsdwUTejoUg0q7J8
	tIW0=;b=pDI8rxlW9+axpoWDM8XKaC7c55BH8OgGi0mbHn/m+0OQkyEJPr//aNa8tUITRU3KuUXEp
	4wZD6KFd34ILUdy4i/38J8zWvHoXNwygMQVD7lYKNXrG7127opba/o9p7Rip2sJSSmo+yZVsSu+wl
	4IlYIVGzhoYlzof/eqCEgvVXsOWdPTmtwxJ4fic49c5HMeVlJaUyi1pxgHxHNVNC9m5osMAvnGPHV
	UcAOTR5zUcbm109QbQrVcbRwdxZad85mML9jpszuz466SS//INftAoLfO6hpIiDK66q0w0JDnViVI
	ujf4+ycED2yXlJ0xInvL3LONW1+fwbmW8PAtcrhvmQ==;
Received: by mo-csw.securemx.jp (mx-mo-csw1121) id 51J18LTr1878164; Wed, 19 Feb 2025 10:08:21 +0900
X-Iguazu-Qid: 2rWh5b6vEriFFozwnf
X-Iguazu-QSIG: v=2; s=0; t=1739927300; q=2rWh5b6vEriFFozwnf; m=0OqiI5jTZ9a9Cog/KS94MmzYsoqhjgBOVtmUTlafafY=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	by relay.securemx.jp (mx-mr1121) id 51J18CAQ2805251
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 10:08:13 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RgUcOperGeecuelJrbnfT+a9wNM+yYVeJv1b6mf1mq6tYcVda2dDw5/vmGlksTDPwmbI37vmWfHgCQ/yusCMDj9m0n2TaIIiF8hpd3LqFOHHBde6qLOgNrIXHJciSgr7pp5iwHQjsYIrIXZRifSxd/YSOd/WWUULaKHvlpU+uqPneb88zmCq/EcZVdJDWAgxsVhCRefQnfBJQrgZeo5LjGgwXK/OKx0CoYKPb6rAFadno/IG1aB3OBXm3mi4Mc6ZhwuqACh9ffBM77KzQ8wNt/RD98sf1oXUpHDWH5xv/18HJpC22XE1biODdPD8b6z+QboNi6qrSZ9eQjfZ+HF2aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDC+tT7XkniApw7Qz4nb7pGCfuxcDQ4E8WCpWA3sh6E=;
 b=Riy0/Tva1ebC3HuxdUiNJVBf6TrjiG+F/ErEsNQNdpgvw4Z8Twi0V6FEBxmBIR/2VMyxBYeZLovl3gVdy0W2CCO7gcUDCXuwSxfNj/AwmEUmC1tBnpBr9bX2WEarzd1NfZaPh/TglvCWewQ0I+M95e+z6A6LLHk3994pq6YxtElDjz6YSgeO5bo+8N8tq5B0dGZOW+SjuasIEp2eI7+FYmiThoo1WbG6tvJuNkcUBm/LFCKqAF+ePKMEWLRlGSM8TxHCQo3krE2fOOY/HjeDz1sKye8YrXWZxneWPaEUCkv8X2fPYMwHW6t8Arno2ac4CigzlkNzq76K6QhB+XJ0Xg==
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
Subject: RE: [PATCH net-next 3/3] net: stmmac: "speed" passed to fix_mac_speed
 is an int
Thread-Topic: [PATCH net-next 3/3] net: stmmac: "speed" passed to
 fix_mac_speed is an int
Thread-Index: AQHbge+CfUtCStFMKEKPJ5/hgZXK4LNN0PWw
Date: Wed, 19 Feb 2025 01:08:07 +0000
X-TSB-HOP2: ON
Message-ID: 
 <OS7PR01MB14808749371CD77CE68E9081B92C52@OS7PR01MB14808.jpnprd01.prod.outlook.com>
References: <Z7Rf2daOaf778TOg@shell.armlinux.org.uk>
 <E1tkKmN-004ObM-Ge@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tkKmN-004ObM-Ge@rmk-PC.armlinux.org.uk>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB14808:EE_|TYCPR01MB11899:EE_
x-ms-office365-filtering-correlation-id: 02ad36e2-fbc3-470c-de11-08dd5081df04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018|95630200002;
x-microsoft-antispam-message-info: 
 =?iso-2022-jp?B?cGUrMStTaEJSNXEwRGxPcWxIcWxXWVI3WjdYeGdaTUh5RUpISzBDSFN0?=
 =?iso-2022-jp?B?V0I0NTRtc2FKZFpqK2x5WE0zNzJqMUlEV3hORGtJcXV3dWFnSzF3KzY3?=
 =?iso-2022-jp?B?MlVvNC8rVGFlMVF1Z1Y3ZWpPYnVNWkJvbUtSRmVaNHljb2dBcDFoM0Np?=
 =?iso-2022-jp?B?UTBnbFZmK0FvOC9XRXZUalRVNEhpc3NVbzFFMVlSL1orRkVBTDQyKzhM?=
 =?iso-2022-jp?B?NEtiYjloTzNLMGhwVlJ4V2llTS9ObEVlTXZ0ZnVpZkZ1U2QxOG9IamdV?=
 =?iso-2022-jp?B?TjVHNTNnZFIrdmFPTHZQQmZWc0w2ZjR2RDNJQTJQYWovajJUUlNKUE9R?=
 =?iso-2022-jp?B?RWZwRWd2MXNOaS9kM1k2SmxSWnlOU29wa1BrZXdvc3VtMWpacG1DTkE5?=
 =?iso-2022-jp?B?ZU5XbUpJT1RmOVBGeDFYTHRNbkh0TkdBRWpybEFjc3hJWWV1d0pkb2Y4?=
 =?iso-2022-jp?B?RVJQSFprMVgzcEtzVHN5VmhyQkpMRXp1dGFjay85TzgzcUUwa2FmbzE4?=
 =?iso-2022-jp?B?c3MvSzVwR25lb3FZYTE2bnJUbzdzdFVHYmFsWUd1YkE5T0J6Z1Y5SzQ1?=
 =?iso-2022-jp?B?R0dQNStpZHR4WU9XUlZ6Nm0waVpsTFJRZm1vN3dMeDhJR0p0VEFoYXpk?=
 =?iso-2022-jp?B?U3VaOWs1VGxhdysrVFB2ZHEvaW5qaDBQV2krYzlBbys4NHhpU2tKK0g2?=
 =?iso-2022-jp?B?VWpBZ1Y1TUw3cUxJVkkvZXNqdXpNS2xBaTNzMzRiMk9kWmJYRFhidW5m?=
 =?iso-2022-jp?B?OXV5aXM4M3oydnF4WUZ6alNFZ0RXKzdkanVBcW5wMkJNbUtsWGwvUG5D?=
 =?iso-2022-jp?B?M2IyeDNmVlFqTWNMeWp4Q0VYWGdMeVROd2I5ZzhTeWJQV2lKQ3dXVjQy?=
 =?iso-2022-jp?B?VGNTYkF0aTJoQ1pRQi9RV0JYUXFLOHd2ZlF6RTVLbkdkYmNDWVRnV2JD?=
 =?iso-2022-jp?B?MllQS0R5SVdQT3o5ZEF3Rnc2ZWR1alN4TWJMa2ZnTlNwNHh6UGVXVVhh?=
 =?iso-2022-jp?B?aXpaMjVaWEhXaWpKUUd1a0NocW9CN3RRTkN6SmR1OElGQjd2WDhlakh3?=
 =?iso-2022-jp?B?UEJzLzFhWUUrRTkxdXRrR3Vkc2dNZGxqQkpXUWZVMUJzRy9veEZqZVVy?=
 =?iso-2022-jp?B?RVo1Sm41Mnk1MUZ2MUdvdFhCSU5Zb0RMMWp1Y0JFUEFKaVZLTmdFN3h3?=
 =?iso-2022-jp?B?MHBYV1JsdFhYSGFucmpUMlNJY3F4SlUzOFJTalZsOFV3UEZ0cDI3S1Ju?=
 =?iso-2022-jp?B?ckhkd0s2RlhTY0VkWHlmbnNZTS9oUVNSQXVMaUpuK0xlWkY4aDhRL0ZP?=
 =?iso-2022-jp?B?dFcxc0RRNE1qaFRJTjhUMjFsc3lMYlE3MytCVnQ4SzVTVW5IdGlUYTJQ?=
 =?iso-2022-jp?B?MjJraWRMSmtSVmZDSnVuTGNkK3EzWWlNT012Z0pWMUJOdHFDZUF4d1V3?=
 =?iso-2022-jp?B?bjM5N05kQkhRay9qWlRwbzE5VytoakpRV2ZJWUZmNkF3MVRlK1R4YXVo?=
 =?iso-2022-jp?B?cW1HRjhvcTd3V0VFU0x4L3AySDNlYWNwd1lBYkNZV2tXcFNSVlgvT1ZQ?=
 =?iso-2022-jp?B?cDdHUEtiZkhiRjc5eFV6VjhtVmNUVXgxYzdoTk1xZU9wYnJ0dFhLcU01?=
 =?iso-2022-jp?B?UlhSQ3lqOGNuMklTdmJPUkw5bHdNL0ZRc0phTzQwMStSWWF1L1Q5SGdO?=
 =?iso-2022-jp?B?VFljcXhQVEVqVEZxV3dFNG1MWmhnU3c5WEFoM0R4RXpzR0JXRk1KMDZj?=
 =?iso-2022-jp?B?aFp6WndlZW5wRVRyYlIyak9Fdkt5UlljbWpFbzNla0Rub3cza0lIaG9I?=
 =?iso-2022-jp?B?MHpRTTc5cTR4MkZtYlBIWEVoNlN6U3NUbXBmcDh2ZzJBK0hqS1hXbXlD?=
 =?iso-2022-jp?B?d2FZaFhMY3hRRjdqclIxanBab3pMd0t2UkE2OG8vWW12QmRCbmZ4WmdV?=
 =?iso-2022-jp?B?RmU1cHpGempIZmlLS3U2R1JaSEI0SGNXZW94cURKVEExWXR3K0lxUDgx?=
 =?iso-2022-jp?B?Z2RzRHl4a2NDRUJNblZzaWhaMCtiUGRpY1NMYkV5a3ZCRVNxSUY3ekZS?=
 =?iso-2022-jp?B?NnBvYmEyTDQ5c29Ca1ppNEdNL2RaMTl0WWtMT2FaeXkrV2NNYVM1NytH?=
 =?iso-2022-jp?B?a2dzNHFIL3lRck1rY3d4dEdhKzhmUzZBPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB14808.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018)(95630200002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-2022-jp?B?aVA3bUZRVmVtbUg1SlZiNjFsTXlqVUpQM1RjazQzYUZWR3BCUktBZ1dX?=
 =?iso-2022-jp?B?L0s2cStRLzNldDlGMk1PUXJHRHVaYzl1cjRVSGx3WGd6VW1XVStrREhu?=
 =?iso-2022-jp?B?WXpYc05GRm11RkphSG5pTkVRemo0b1NiZTFuZXNOVktrM0xiTWxRUkZa?=
 =?iso-2022-jp?B?S0U0dm1neXRLRVdKelhUenh2dEVWNEhHem9ENVVwR3duTTI1a3J5cElX?=
 =?iso-2022-jp?B?NHN4c1lSOFEwcmlKMVhxZ0hPeDJVQVNVZ3ZGTWVIRkZETDlJTTRobS9X?=
 =?iso-2022-jp?B?RjNBRGhkdVhjUnQzbkJBU2RjdU9EdmtMbGd2ZWdrK1ZUNzk5M3VKeEFD?=
 =?iso-2022-jp?B?cW5YL243emRlYjc3WDlkREVuWWpIMlBxc1NIS0Y0UHdYTVdNSDRPeTVl?=
 =?iso-2022-jp?B?V1h0L2hRdFFGdlRJMmVCTGhackVpMWZSTzdyWklkT041MTJsMVRqUFBC?=
 =?iso-2022-jp?B?Y2RnYjNRYVNhUnl3M1QyVlcrRHlHdk1VdlQ2MnZWWjdMdEYwbkZVc092?=
 =?iso-2022-jp?B?SE92TlU2cWRzQnl1TEZocCtrd05KTURPaDdPTXI2TkRPM0JwTzlSaUZX?=
 =?iso-2022-jp?B?NkFYb2U4VWxvTUxFcXBWV3VpbDd6YmRIeXhOaVJ4b1AyMnExZWEwMzBN?=
 =?iso-2022-jp?B?c3BmUzg5MGkrcDBKamZRQXZNWjdaMDR1enpVUk4xbDM0OUoxSWpxWGlh?=
 =?iso-2022-jp?B?QWZMYWYrQ0cxOGZnQ0RJcEVPUjJJOFNKcTdtNVNDZ1RZRFI5SjNjMFV2?=
 =?iso-2022-jp?B?M2FBZ2lIZExWRFlaNzEvZHRrbVVkM2xRaXk4c1FWdzZrR2RGdk5aVFJq?=
 =?iso-2022-jp?B?UU5VYWlMVXVJVFlWdUtWN2hPbmxHUUR6UjNVcmlYMytsckNPVzVBRllR?=
 =?iso-2022-jp?B?cTFKb3pveDJQS0FKNmpQdHdyNDZYNzFtSkl1VEsvbFlxSnh2ay9SalFm?=
 =?iso-2022-jp?B?Z3h1WHBhK05UZUpyL1NqTnRwOTVhcEFZSGkyNlpMdzJGVG1iNTZWcG8v?=
 =?iso-2022-jp?B?MGhuR3YrVUJzbWpIaUg0OHdjSFlJVmNTOUdJYVNacjBlVWRld05lb3h1?=
 =?iso-2022-jp?B?OFkwQ0d0cjh6a00yTzVSNnFxSUFRc3FidDVURjd3UEJJQU5NTUFkUkRa?=
 =?iso-2022-jp?B?R1JaaENLaDg4SXkyeUROcXM4Rm55Y25XcUx4UmxKUEYwSTU2SEhtWjQ5?=
 =?iso-2022-jp?B?cG1SVUovL21KSmNnNWhwWEpkbWZRM1ptOE1pUVFrdzBCb2MwZkJHVkZn?=
 =?iso-2022-jp?B?RlNmTFZTM0x0TTk2akw0UnlEUnVZditMTzNsM2QyT0tNbWZZcEcvL3ZU?=
 =?iso-2022-jp?B?Um4zazZOaWZwTlJUMnVBR2wwMVJseXV2QWdGMndKTVc5aHZyZmd3blV3?=
 =?iso-2022-jp?B?R08vUks1UXZHbk9iY2cyb0w1MEsrOG91WGgvUGkzQXlUcEc0bmRaNGFT?=
 =?iso-2022-jp?B?alhyWWtPdDEvU0FYN2dlUEYxczUwNzUreG1mMWVzeElSelJlditLTVFo?=
 =?iso-2022-jp?B?SEpvYVl6Nk14bkplZzJ3RkZiSHU3ODhMQVRUWk9uaXZMUmVrbit4S1VB?=
 =?iso-2022-jp?B?WkMrMHlhMVZxTGkzTUpvRjRnSzJ6WVhYV0kxbWU0aHUxZ3dIaHM1QUVy?=
 =?iso-2022-jp?B?cTlMelVVcXRyLyt3SFNUSnNaa3Rlb1ZXZDZyUGMxY0VlUTNNcjc2K00y?=
 =?iso-2022-jp?B?SWt1Z3JTSmFCalVnM29VaGRpSjhlWEJ2bVd5K0N3UTdlVUsyM1dnMkdI?=
 =?iso-2022-jp?B?cnZlTUF1WHhIYWN5MjNzVkVTR2FNdXQ3MW9WUkkzQ0o1YURnaXBibEhw?=
 =?iso-2022-jp?B?WU81UDhPRFUvdUMzZHRKWTRXSW1TaFhDVGMvWmJ0N1JFRCtRTVRtRHR6?=
 =?iso-2022-jp?B?aS9jaEI0UEFzZkhSbGExNTRwTVNhMGJVa0dSSkdSN3JWZ0s2RERvMThG?=
 =?iso-2022-jp?B?MFFXQUlMbi9FaUFPd1dRcHp3SGdyTTViZnVXaGVoS21lWFNaUlFzUXpL?=
 =?iso-2022-jp?B?QjhHcU5hWHpGb1hKNEF1UTVmR2Rici9RRkh2NERoQ1pTdHcyYmVUZnkx?=
 =?iso-2022-jp?B?RUlwS0F4RU41UklENEN5MlJKbTVnWWk5enExeVl3ZFFkVENxNm43L1lt?=
 =?iso-2022-jp?B?dEpiS05mK3pEdXZPenhPK21UeHhjY3FENU0wMmR5VFM4R1hjZUNsY0d4?=
 =?iso-2022-jp?B?YWRrNU9JcU1VNlNoUFhYOG9vY0czdFhXWDNNazZuMndIeVdZdjdmOVlB?=
 =?iso-2022-jp?B?czZyU3VYdFFrd1pmL1lieWJiODNWZndNNExmSGJWNXRHQ1pYT2xONjBH?=
 =?iso-2022-jp?B?aFhmSlFFV1lVVDR5K01wM3N2Tk8ybE0rWU5YY1YvdVc5QXZQQ2o3aFFW?=
 =?iso-2022-jp?B?Z1JRLzQ9?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: toshiba.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB14808.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ad36e2-fbc3-470c-de11-08dd5081df04
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2025 01:08:07.8617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ODg4BE6ZT0/QrV8V7IY33etRHltntRY4Iw3ujHhPv+a4PM/41d6DpWWeaeHrOzfIgJIlcvplwrFixXalGvVG/iPagxP6xtPHvfR7ctYQA2gHHMA7SYnxurBuR4sjUzws
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11899

Hi Russell,

> -----Original Message-----
> From: Russell King <rmk@armlinux.org.uk> On Behalf Of Russell King (Oracl=
e)
> Sent: Tuesday, February 18, 2025 7:25 PM
> To: netdev@vger.kernel.org
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>; Andrew Lunn
> <andrew+netdev@lunn.ch>; Chen-Yu Tsai <wens@csie.org>; David S. Miller
> <davem@davemloft.net>; Drew Fustini <drew@pdp7.com>; Emil Renner
> Berthing <kernel@esmil.dk>; Eric Dumazet <edumazet@google.com>; Fabio
> Estevam <festevam@gmail.com>; Fu Wei <wefu@redhat.com>; Guo Ren
> <guoren@kernel.org>; imx@lists.linux.dev; Jakub Kicinski
> <kuba@kernel.org>; Jan Petrous <jan.petrous@oss.nxp.com>; Jernej Skrabec
> <jernej.skrabec@gmail.com>; Jerome Brunet <jbrunet@baylibre.com>; Kevin
> Hilman <khilman@baylibre.com>; linux-amlogic@lists.infradead.org;
> linux-arm-kernel@lists.infradead.org; linux-arm-msm@vger.kernel.org;
> linux-riscv@lists.infradead.org; linux-stm32@st-md-mailman.stormreply.com=
;
> linux-sunxi@lists.linux.dev; Martin Blumenstingl
> <martin.blumenstingl@googlemail.com>; Maxime Coquelin
> <mcoquelin.stm32@gmail.com>; Minda Chen
> <minda.chen@starfivetech.com>; Neil Armstrong
> <neil.armstrong@linaro.org>; iwamatsu nobuhiro(=1B$B4d>>=1B(B =1B$B?.MN=
=1B(B =1B$B!{#D#I#T#C""#D=1B(B
> =1B$B#I#T!{#O#S#T=1B(B) <nobuhiro1.iwamatsu@toshiba.co.jp>; NXP S32 Linux=
 Team
> <s32@nxp.com>; Paolo Abeni <pabeni@redhat.com>; Pengutronix Kernel
> Team <kernel@pengutronix.de>; Samuel Holland <samuel@sholland.org>;
> Sascha Hauer <s.hauer@pengutronix.de>; Shawn Guo
> <shawnguo@kernel.org>; Vinod Koul <vkoul@kernel.org>
> Subject: [PATCH net-next 3/3] net: stmmac: "speed" passed to fix_mac_spee=
d
> is an int
>=20
> priv->plat->fix_mac_speed() is called from stmmac_mac_link_up(), which
> is passed the speed as an "int". However, fix_mac_speed() implicitly cast=
s this
> to an unsigned int. Some platform glue code print this value using %u, ot=
hers
> with %d. Some implicitly cast it back to an int, and others to u32.
>=20
> Good practice is to use one type and only one type to represent a value b=
eing
> passed around a driver.
>=20
> Switch all of these over to consistently use "int" when dealing with a sp=
eed
> passed from stmmac_mac_link_up(), even though the speed will always be
> positive.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

>  drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c    | 2 +-

Acked-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

Best regards,
  Nobuhiro=20



