Return-Path: <linux-arm-msm+bounces-103062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mATpLnj03WmMlQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:02:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B553F6DA8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:01:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F38E1302A040
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 08:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E96A3876D0;
	Tue, 14 Apr 2026 08:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jz6Slad4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011014.outbound.protection.outlook.com [40.107.130.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0E42F1FC9;
	Tue, 14 Apr 2026 08:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776153603; cv=fail; b=edMMazW/tT1smfMg/L3ucb6y5zVrO/07VC+ENNWMO9Ep9tU9r19/+ZxDsLnds/Cl3w1rJvwk7U3poWkEF0MEG/UI4S/NW1oJre6ovPAP8e6F1WNrdSGhCxwQ3gu8QbjptpFupFUwUXpWhvhC/M80RErb6Sixi5OBb3wDEvcsy0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776153603; c=relaxed/simple;
	bh=vYLGovv1nediGWxW+cDihtZYvOgrbk/ux+eKM023u6E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KhL1une5dzDpluS39bUHJwOniyHGQO5OC511olI0OItrO9pItGQ9SCELvwrDeKQGt9lEToGUwwZVWLnz8KmA3gDnqyY7Yr78+b0i15vec+A175rtAMIqc/Wk/BsyVeCqiVidhf/FPp2PvnofnEhRKn/k93326AmXiXxFDoGwi80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jz6Slad4; arc=fail smtp.client-ip=40.107.130.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ySL+gQ5tt8rP2Ox0Ay0SH0Ouj2zGDWrgno4gsS0Mg6a26vkKMZATjAE3Jx/tk2+ARMOSCqGixQ9UFNmkhQOrccf0rS33QZidWRpUfbS1fiSy/BGw2ernISdnJoGGYpB8HJJrGKE31SlWU6QDwIO0q4jnYFthirWU0ounX3nphF/8qIdiHhYbTixJyBpRI3sM2PnUyIU+d6gHHCA/IsNdHJigPHfD/Jc8qcTrLCgHjrNlR4Z6tLRvvfYeHiJLlRX9aXky2u8tHnZt1W5TI/LjCJVXWF2BYWCa0C2dyzDiKkLAslTH8cyLDjVQeMkrIfc5snD05IXc4I49MNrQ30iLgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYLGovv1nediGWxW+cDihtZYvOgrbk/ux+eKM023u6E=;
 b=V6o4KYSM9WcMOhoQgE9qMD7zK9kcGXdiVxCCa7VXk7Absw7zLnsmvdrSHuap7Jz/JYE3TJdJp5okDbniB/4T2yVj8emvNSwwDxElFfj9L75KBAHPLUVZ9ZGLpo924BrMWVBzfUkOGcg52DLp4dv6QHTm/eKggPw2fE6yZgIEmRZzn2B4cY9ImHNO+ptp25H+k8X94ZH5EBj50wuJWWOrsgDfVMKzV4+Txmx17aWGUku5tKdIlsxKMXgsOwFWHePq/5YLr6Fc5R14dNVw17Owdg2II95V2thU6LJnfqiCEYOq4QU6oehJY7SesRyOKzMvNfxo/xXT8VbKeZ+37JlUGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYLGovv1nediGWxW+cDihtZYvOgrbk/ux+eKM023u6E=;
 b=jz6Slad4oEGzOjD33j8AE1YyvzgeetxJuPnI/GsUevb6POcJkEj3J80zEfz4mkHScWIkoM9LVi8GJSRBA4QnzL3/JNk9Z4J9KYTr56fkqf1fWnZVmSXGIQonThkQDdkdlBhBrvGjY2qCmkPJE6Hmh9aZ6bvLJaTMMOdnfe3HoJ/z8x1+Zf2WRH0s3xNtvXSnhSf7V3qPJPfptrToBVumTVjI6HsO2Os7JiOmqgSthCuRWIz3juU29xbMxS4wCtYExob98ZFpf6fLBjBXGYPq6eRLpOzMolT/FZUp2BGxCrcAiv+V2NJN996VdtYOLhF7yLlQ0kcLWn/fm8GmKI3dBQ==
Received: from AM0PR04MB5220.eurprd04.prod.outlook.com (2603:10a6:208:c2::19)
 by DB9PR04MB8493.eurprd04.prod.outlook.com (2603:10a6:10:2c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 07:59:57 +0000
Received: from AM0PR04MB5220.eurprd04.prod.outlook.com
 ([fe80::cbbc:93fd:f7b0:76e5]) by AM0PR04MB5220.eurprd04.prod.outlook.com
 ([fe80::cbbc:93fd:f7b0:76e5%5]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 07:59:57 +0000
From: Hongxing Zhu <hongxing.zhu@nxp.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Brian Norris
	<briannorris@chromium.org>
CC: "manivannan.sadhasivam@oss.qualcomm.com"
	<manivannan.sadhasivam@oss.qualcomm.com>, Bjorn Helgaas
	<bhelgaas@google.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver
 O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, =?utf-8?B?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?=
	<kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, Heiko Stuebner
	<heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, Niklas Cassel <cassel@kernel.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, Krishna Chaitanya Chundru
	<krishna.chundru@oss.qualcomm.com>, Lukas Wunner <lukas@wunner.de>, Wilson
 Ding <dingwei@marvell.com>, Miles Chen <minhuachen@google.com>
Subject: RE: [PATCH v7 0/4] PCI: Add support for resetting the Root Ports in a
 platform specific way
Thread-Topic: [PATCH v7 0/4] PCI: Add support for resetting the Root Ports in
 a platform specific way
Thread-Index: AQHcsJaGNSCzfKQPZU2/W3eI4zOvhLW+2kAQgBdNUQCABz5UAIAA+Pyg
Date: Tue, 14 Apr 2026 07:59:57 +0000
Message-ID:
 <AM0PR04MB522045C1B5FD2707D699DC788C252@AM0PR04MB5220.eurprd04.prod.outlook.com>
References: <20260310-pci-port-reset-v7-0-9dd00ccc25ab@oss.qualcomm.com>
 <AS8PR04MB883389FD2A016F9E02756B048C49A@AS8PR04MB8833.eurprd04.prod.outlook.com>
 <adcHylFjFjhHT-tP@google.com>
 <klzq2i2ne62hdri65gz7s5pxmvely277optr2lrkvdrrahl3ca@k3hdo6o4nkjz>
In-Reply-To: <klzq2i2ne62hdri65gz7s5pxmvely277optr2lrkvdrrahl3ca@k3hdo6o4nkjz>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: mani@kernel.org,briannorris@chromium.org
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB5220:EE_|DB9PR04MB8493:EE_
x-ms-office365-filtering-correlation-id: 868d8121-f117-4bcc-e377-08de99fbd255
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 O16otGKS8cR4h7DDh/ZlODylGFjDrhEvsRggeDBMKjDD2YARiRsLxkYIrbCsOxczYq0fxkvh/zSfD2u18WmvoXjBd3l5WI4IEj/14kgTTKEL/Ojb6mNPuUysX+ZWEaxnBG1t5ZhPBW9MW3/TK1f93lUm++V9dCmJrDkLc45R+7K4WaLaQSJu2DwhgVqTBADGLnhGMiJXmxgNf2nNM85NP7vVrJ9djGAhnOHyntVO+8DTuLhzK9itHyHB/N36pRnarOXFcT9Fo9WYzrDQXWUACrdroJJw07KHTd+k0UniDyjRlrKb6NB+kOUsJ7V8ZBJR2Lf9jk2XJbhdb4ylVyxg8SH9Io0DWdwaw9+sRMpgNred5ansvZrXjYLxFpP0sMHA9ojVI+yxpKc++JCaFX3WZdoNucA+BTnEq9qDY3Jt8kgyBnENVDqGSDBFr1p/yGvWtzSmWRV/NtNGetYZQdVXX+0c/nLJfVGH4oTAs4I3aj0hCxZDzJDAZDvkuvH9vKPPx6gB8nb4EBQueeAbLAa+a87zegSCRW0P6sH7Sxgd37lNeKtfqIq35bZD7cI3kVexfG6oeU+U0uoH3g/aw4Iw4GNDnuskPwtmfXWfUt9v7vZ3TtfiD0U5Yu+c4770onerGbDLGeu4iIgBe0mnNUaPB4GMQP9CMeDfh3KiuV9XkZNfZ1K4GvtbLuQyUaQBtsfaTsi8pzC1nWBsxwJ7OBNtAJMJfkTIm0X1RRJT7UCpiX8If+SxTSpBJ5aNrzIDNU7cWPPfuTTmqKFOz+7IDeQZbcf2qfJljdMy9yssmRgqjnU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5220.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M3VzQ1BMcEpTZy9MVytKdUR0U1h1ZTB5QjFFTFRVSGhFQ2NhYlh6SjVTSUVq?=
 =?utf-8?B?djhzUzZ0TER4ekZrZkVKdFd0UlJlQXRPREpXNDdtcUx0aktRM2RDMEtmMlpU?=
 =?utf-8?B?Mm96a1h1ZUZFbXdVblZ2WDFCZWhlcUdvcWVRQlp4SzdNcjFkODlMU2Y5bzN5?=
 =?utf-8?B?bGQ3VkZzdVZ0YmhxclJpZlRyUlpyYmlGYWVVRTFhcGF6SzJoN0E5cWt5SEJX?=
 =?utf-8?B?VDBybmJwMm5oU2FsQXR4bEhtdmJ3bjUzVEs2cnArUXNNejdqcWppSDFidlRm?=
 =?utf-8?B?S2cxN0tZSWhNdzNrODlxbEJ6SmEvblliVU8xV2hhL2g1Z3hLdFkzTDhrQjVB?=
 =?utf-8?B?Uzk0TVNOR3pmd2U2K1Y3UUYwU1N0Sk5NajE3aXJmaVYzNm1MdVhrRUEvRlpp?=
 =?utf-8?B?NEl6ZGxoclF2SlFpVURtOExzS2ZuRm5SWU9MaTNwbHFKV241QmMxTVkzVmlI?=
 =?utf-8?B?MlBzY1dMSENMQ2FxKzQ5SnE5eFJzZnE0Szk5OHFRancrTUsxbjlmaEVYbjdl?=
 =?utf-8?B?OXdWcDlyYTFqajhJdUtZeGpGQmYrWGNwb2MyUTd4Z3YwdCtmUHNkaXV5cWdW?=
 =?utf-8?B?ajE1eHVENkx3MHkrTm1TYmlDWXhwcHVibWpkUzJhYnlESzRXZjhPYW5JdGp5?=
 =?utf-8?B?RzJsTVR2NnZuLzF4bVJGK2tjb0kvOHJ4QU5vcHE5b1J2WjZqQ0lKVG0ybEVl?=
 =?utf-8?B?T0Jud1NCSkc0ZzA4SFJRdEhlbm0yazhWV0Y1MytJUEJBUkZlZVVlclRYeFRM?=
 =?utf-8?B?T3BkVnV2NU0zejViZEtoUmpuaDJyaGJERTZ0ckFwbFUwK2JjVG43ZmlPTkt0?=
 =?utf-8?B?ZXpCYlhkRzd5QkZxK1Rxb3hiVHQ3RXBnYkVkT2QwK3ZNNm9kYUdrdWQrNHVa?=
 =?utf-8?B?L0d4YnF1cGZraGI1RXhxRWNZUkRCMzFjYXR6dURYTDJIT1VsazZxUHBvdURW?=
 =?utf-8?B?RXBxS1p3a05uKzA2SXJlTjhCL0Q3aWU0cjhzQ3N4U1lxRGhLZzFISnYxcU5V?=
 =?utf-8?B?eTdlZjgvekZzbFM3VWRMaklqcGZ1Ti9PYUxKdjVKdDdISUd0QzNmbnV4UkJQ?=
 =?utf-8?B?b1Z3UHBycFcwZGJFb3V5TDRHMmJGN25iUXV1aUJnTlFIRVhUTG15OXBJR203?=
 =?utf-8?B?MFViaURRQmU4Zyt1Q2FEcEFFd2ZpODk1SDd6dlBoZzYrRVduS1dnS1UzRGlK?=
 =?utf-8?B?YUJxVUFzYll4dzRPMzhVM0xTQmIrajVxZVdzazdzTUlKRWEzYXdZUWNVMmsw?=
 =?utf-8?B?dm56N2lNb2VTTVFWS1FLT01hMUR3U2NvNEwySWtjYXovU2QzMlZEaWRINExk?=
 =?utf-8?B?UUhNdkg1TFgzT1B6VU5zYUUzT1BoZXo5SzVkdkRCQkNtci9GNk9XdWRlNXVx?=
 =?utf-8?B?MUp1eUJoWUF3RWJ3WmowbGpRemc4SFJlM3VzOVhVdDl2VnZBc0pyeXhOOWZQ?=
 =?utf-8?B?Z3duTlZveVRTcmhIVy9ON1BFeTU5QkdlYmY5MjZPU21QOEJET1hxWWRFMkVR?=
 =?utf-8?B?S2E5MWtMNnc1RE42Zmo1cEhrZTgzbUs4YTFUQlg0TTFIMmlMYVE1YmFIWHpM?=
 =?utf-8?B?WGdmOWtLc0NMN1dvcGFJY3FTSGZvNmZZM0dkNWFxRGQwaFpZYk1nMmxQaVFr?=
 =?utf-8?B?QzJTSE5xNnhjNElOcUNYZVhxd1pScUxTNDNUOXQxYU5vekJkZE5ocGFsQTRB?=
 =?utf-8?B?cExCc0k3ZmV2SUcraGF1SlhBYW5Ja1kzQUhWamFwT1plT1lEVi8zNThuZVdE?=
 =?utf-8?B?QUdYYlJrSytrblp2c2hUOW5mMjdhYkg5WHBHemg0UVJ2L0RmMlpLSllmRmFD?=
 =?utf-8?B?aGE2OHhBMm1WditxcC9UNi9jNVNUR2R5NEVuSDFYa3NLaUM0d2FEYTBNNkdL?=
 =?utf-8?B?ZTk2QVdFVjJPb3FTTkNrMDJzYmdKSTQ0UTZkNjRZamc2akFmVm9SMDdZUmxH?=
 =?utf-8?B?ZVBxdWdnQkt0Q244T1RQVVlKQzViblRrZUZucHZFdVd4TTEwTHkzNTZBTzF0?=
 =?utf-8?B?eGMyb2hwWTQrRnh5MXlFQkJyNk1ueVRLTkFtTU5SOFRYSktxMVhBTm5wS083?=
 =?utf-8?B?bkkxcmtObitOQjUwelJnUUxVdHdTMnM0ODFsNVJybmVEcHVVVUwzek1peFVV?=
 =?utf-8?B?MVZsZnJZbkgxaFN3UHRtUVp1Y3NsWkZ1eWdsYU5HLzM2UUprYm1Ib0daZE5R?=
 =?utf-8?B?QTdUZ2xmZ2U2TmJSS3ROZ3lwRWhUVkJUY3VDUTEyQWFxNzJEMmFkYTBPWUVN?=
 =?utf-8?B?bHZ4TGtTODNIS1lKcHlQdVp2bWdaR0R6dURlS09hOXVaVVFwdThVTXZCNjU1?=
 =?utf-8?Q?nwltpclGR2eaUr4xgN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5220.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 868d8121-f117-4bcc-e377-08de99fbd255
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2026 07:59:57.7594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7lUmg+qsdOVX9h61x4OcJiZMn5pg4fLmbBOQKcFip1rjrhOgKAWXAS7FHXvVHuBfgsH+C/0RPci47tXb3l5bxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8493
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,google.com,linux.ibm.com,gmail.com,kernel.org,sntech.de,pengutronix.de,vger.kernel.org,lists.ozlabs.org,lists.infradead.org,wdc.com,wunner.de,marvell.com];
	TAGGED_FROM(0.00)[bounces-103062-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hongxing.zhu@nxp.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MAILSPIKE_FAIL(0.00)[172.234.253.10:query timed out];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 51B553F6DA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1hbml2YW5uYW4gU2FkaGFz
aXZhbSA8bWFuaUBrZXJuZWwub3JnPg0KPiBTZW50OiAyMDI25bm0NOaciDE05pelIDA6MzUNCj4g
VG86IEJyaWFuIE5vcnJpcyA8YnJpYW5ub3JyaXNAY2hyb21pdW0ub3JnPjsgSG9uZ3hpbmcgWmh1
DQo+IDxob25neGluZy56aHVAbnhwLmNvbT4NCj4gQ2M6IEhvbmd4aW5nIFpodSA8aG9uZ3hpbmcu
emh1QG54cC5jb20+Ow0KPiBtYW5pdmFubmFuLnNhZGhhc2l2YW1Ab3NzLnF1YWxjb21tLmNvbTsg
Qmpvcm4gSGVsZ2Fhcw0KPiA8YmhlbGdhYXNAZ29vZ2xlLmNvbT47IE1haGVzaCBKIFNhbGdhb25r
YXIgPG1haGVzaEBsaW51eC5pYm0uY29tPjsNCj4gT2xpdmVyIE8nSGFsbG9yYW4gPG9vaGFsbEBn
bWFpbC5jb20+OyBXaWxsIERlYWNvbiA8d2lsbEBrZXJuZWwub3JnPjsNCj4gTG9yZW56byBQaWVy
YWxpc2kgPGxwaWVyYWxpc2lAa2VybmVsLm9yZz47IEtyenlzenRvZiBXaWxjennFhHNraQ0KPiA8
a3dpbGN6eW5za2lAa2VybmVsLm9yZz47IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+OyBI
ZWlrbyBTdHVlYm5lcg0KPiA8aGVpa29Ac250ZWNoLmRlPjsgUGhpbGlwcCBaYWJlbCA8cC56YWJl
bEBwZW5ndXRyb25peC5kZT47DQo+IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnOyBs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4LWFybS1tc21Admdl
ci5rZXJuZWwub3JnOyBsaW51eC1yb2NrY2hpcEBsaXN0cy5pbmZyYWRlYWQub3JnOyBOaWtsYXMN
Cj4gQ2Fzc2VsIDxjYXNzZWxAa2VybmVsLm9yZz47IFdpbGZyZWQgTWFsbGF3YSA8d2lsZnJlZC5t
YWxsYXdhQHdkYy5jb20+Ow0KPiBLcmlzaG5hIENoYWl0YW55YSBDaHVuZHJ1IDxrcmlzaG5hLmNo
dW5kcnVAb3NzLnF1YWxjb21tLmNvbT47IEx1a2FzDQo+IFd1bm5lciA8bHVrYXNAd3VubmVyLmRl
PjsgV2lsc29uIERpbmcgPGRpbmd3ZWlAbWFydmVsbC5jb20+OyBNaWxlcw0KPiBDaGVuIDxtaW5o
dWFjaGVuQGdvb2dsZS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjcgMC80XSBQQ0k6IEFk
ZCBzdXBwb3J0IGZvciByZXNldHRpbmcgdGhlIFJvb3QgUG9ydHMgaW4gYQ0KPiBwbGF0Zm9ybSBz
cGVjaWZpYyB3YXkNCj4gDQo+IEhpIEJyaWFuLA0KPiANCj4gT24gV2VkLCBBcHIgMDgsIDIwMjYg
YXQgMDY6NTg6MzRQTSAtMDcwMCwgQnJpYW4gTm9ycmlzIHdyb3RlOg0KPiA+IEhpIFJpY2hhcmQg
YW5kIE1hbmksDQo+ID4NCj4gPiBGb3IgdGhlIHJlY29yZCwgSSd2ZSBiZWVuIHVzaW5nIGEgZm9y
bSBvZiBhbiBlYXJsaWVyIHZlcnNpb24gb2YgdGhpcw0KPiA+IHBhdGNoc2V0IGluIG15IGVudmly
b25tZW50IGZvciBzb21lIHRpbWUgbm93LCBhbmQgSSd2ZSBydW4gYWNyb3NzDQo+ID4gcHJvYmxl
bXMgdGhhdCAqbWlnaHQqIHJlbGF0ZSB0byB3aGF0IFJpY2hhcmQgaXMgcmVwb3J0aW5nLCBidXQg
SSdtIG5vdA0KPiA+IHF1aXRlIHN1cmUgYXQgdGhlIG1vbWVudC4gRGV0YWlscyBiZWxvdy4NCj4g
Pg0KPiA+IE9uIFdlZCwgTWFyIDI1LCAyMDI2IGF0IDA3OjA2OjQ5QU0gKzAwMDAsIEhvbmd4aW5n
IFpodSB3cm90ZToNCj4gPiA+IEhpIE1hbmk6DQo+ID4gPiBJJ3ZlIGFjY2lkZW50YWxseSBlbmNv
dW50ZXJlZCBhIG5ldyBpc3N1ZSBiYXNlZCBvbiB0aGUgcmVzZXQgcm9vdCBwb3J0DQo+IHBhdGNo
LXNldC4NCj4gPiA+IEFmdGVyIHBlcmZvcm1pbmcgYSBmZXcgaG90LXJlc2V0IG9wZXJhdGlvbnMs
IHRoZSBQQ0llIGxpbmsgZW50ZXJzIGENCj4gY29udGludW91cyB1cC9kb3duIGN5Y2xpbmcgcGF0
dGVybi4NCj4gPiA+DQo+ID4gPiBJIGZvdW5kIHRoYXQgY2FsbGluZyBwY2lfcmVzZXRfc2Vjb25k
YXJ5X2J1cygpIGZpcnN0IGluDQo+IHBjaWJpb3NfcmVzZXRfc2Vjb25kYXJ5X2J1cygpIGFwcGVh
cnMgdG8gcmVzb2x2ZSB0aGlzIGlzc3VlLg0KPiA+ID4gSGF2ZSB5b3UgZXhwZXJpZW5jZWQgYSBz
aW1pbGFyIHByb2JsZW0/DQo+ID4gPg0KPiA+ID4gIg0KPiA+ID4gLi4uDQo+ID4gPiBbICAxNDEu
ODk3NzAxXSBpbXg2cS1wY2llIDRjMzAwMDAwLnBjaWU6IFBDSWUoTE5LX1NUUzoweDAwMDAwNzAw
KQ0KPiA+ID4gbGluayB1cCBkZXRlY3RlZCBbICAxNDIuMDg2MzQxXSBpbXg2cS1wY2llIDRjMzAw
MDAwLnBjaWU6IFBDSWUgR2VuLjMNCj4gPiA+IHgxIGxpbmsgdXAgWyAgMTQyLjA5MjAzOF0gaW14
NnEtcGNpZSA0YzMwMDAwMC5wY2llOg0KPiA+ID4gUENJZShMTktfU1RTOjB4MDAwMDBjMDApIGxp
bmsgZG93biBkZXRlY3RlZCAuLi4NCj4gPiA+ICINCj4gPiA+DQo+ID4gPiBQbGF0Zm9ybTogaS5N
WDk1IEVWSyBib2FyZCBwbHVzIGxvY2FsIFJvb3QgUG9ydHMgcmVzZXQgc3VwcG9ydHMgYmFzZWQN
Cj4gb24gdGhlICMxIGFuZCAjMiBwYXRjaGVzIG9mIHY3IHBhdGNoLXNldC4NCj4gPiA+IE5vdGVz
IG9mIHRoZSBsb2dzOg0KPiA+ID4gLSBPbmUgR2VuMyBOVk1FIGRldmljZSBpcyBjb25uZWN0ZWQu
DQo+ID4gPiAtICIuL21lbXRvb2wgNGMzNDEwNTg9MDsuL21lbXRvb2wgNGMzNDEwNTg9MTsiIGlz
IHVzZWQgdG8gdG9nZ2xlIHRoZQ0KPiBMVFNTTV9FTiBiaXQgdG8gdHJpZ2dlciB0aGUgbGluayBk
b3duLg0KPiA+ID4gLSBUb2dnbGUgQklUNiBvZiBCcmlkZ2UgQ29udHJvbCBSZWdpc3RlciB0byB0
cmlnZ2VyIGhvdCByZXNldCBieQ0KPiAiLi9tZW10b29sIDRjMzAwMDNjPTAwNDAwMWZmOyAuL21l
bXRvb2wgNGMzMDAwM2M9MDAwMDAxZmY7Ig0KPiA+ID4gLSBUaGUgUm9vdCBQb3J0IHJlc2V0IHBh
dGNoZXMgd29ya3MgY29ycmVjdGx5IGF0IGZpcnN0Lg0KPiA+ID4gSG93ZXZlciwgYWZ0ZXIgc2V2
ZXJhbCBob3QtcmVzZXQgdHJpZ2dlcnMsIHRoZSBsaW5rIGVudGVycyBhIHJlcGVhdGVkDQo+IGRv
d24vdXAgY3ljbGluZyBzdGF0ZS4NCj4gPiA+DQo+ID4gPiBMb2dzOg0KPiA+ID4gWyAgICAzLjU1
MzE4OF0gaW14NnEtcGNpZSA0YzMwMDAwMC5wY2llOiBob3N0IGJyaWRnZQ0KPiAvc29jL3BjaWVA
NGMzMDAwMDAgcmFuZ2VzOg0KPiA+ID4gWyAgICAzLjU2MDMwOF0gaW14NnEtcGNpZSA0YzMwMDAw
MC5wY2llOiAgICAgICBJTw0KPiAweDAwNmZmMDAwMDAuLjB4MDA2ZmZmZmZmZiAtPiAweDAwMDAw
MDAwMDANCj4gPiA+IFsgICAgMy41Njg1MjVdIGlteDZxLXBjaWUgNGMzMDAwMDAucGNpZTogICAg
ICBNRU0NCj4gMHgwOTEwMDAwMDAwLi4weDA5MWZmZmZmZmYgLT4gMHgwMDEwMDAwMDAwDQo+ID4g
PiBbICAgIDMuNTc3MzE0XSBpbXg2cS1wY2llIDRjMzAwMDAwLnBjaWU6IGNvbmZpZyByZWdbMV0g
MHg2MDEwMDAwMCA9PQ0KPiBjcHUgMHg2MDEwMDAwMA0KPiA+ID4gWyAgICAzLjc5NjAyOV0gaW14
NnEtcGNpZSA0YzMwMDAwMC5wY2llOiBpQVRVOiB1bnJvbGwgVCwgMTI4IG9iLCAxMjggaWIsDQo+
IGFsaWduIDRLLCBsaW1pdCAxMDI0Rw0KPiA+ID4gWyAgICA0LjAwMzc0Nl0gaW14NnEtcGNpZSA0
YzMwMDAwMC5wY2llOiBQQ0llIEdlbi4zIHgxIGxpbmsgdXANCj4gPiA+IFsgICAgNC4wMDk1NTNd
IGlteDZxLXBjaWUgNGMzMDAwMDAucGNpZTogUENJIGhvc3QgYnJpZGdlIHRvIGJ1cyAwMDAwOjAw
DQo+ID4gPiByb290QGlteDk1ZXZrOn4jDQo+ID4gPiByb290QGlteDk1ZXZrOn4jDQo+ID4gPiBy
b290QGlteDk1ZXZrOn4jIC4vbWVtdG9vbCA0YzM0MTA1OD0wOy4vbWVtdG9vbCA0YzM0MTA1OD0x
Ow0KPiBXcml0aW5nDQo+ID4gPiAzMi1iaXQgdmFsdWUgMHgwIHRvIGFkZHJlc3MgMHg0QzM0MTA1
OCBXcml0aW5nIDMyLWJpdCB2DQo+ID4gPiBbICAgODcuMjY1MzQ4XSBpbXg2cS1wY2llIDRjMzAw
MDAwLnBjaWU6IFBDSWUoTE5LX1NUUzoweDAwMDAwZDAxKQ0KPiBsaW5rIGRvd24gZGV0ZWN0ZWQN
Cj4gPiA+IGFsdWUgMHgxIHRvIGFkZGVyDQo+ID4gPiBbICAgODcuMjczMTA2XSBpbXg2cS1wY2ll
IDRjMzAwMDAwLnBjaWU6IFN0b3Agcm9vdCBidXMgYW5kIGhhbmRsZSBsaW5rDQo+IGRvd24NCj4g
PiA+IHNzIDB4NEMzNDEwNTgNCj4gPiA+IFsgICA4Ny4yODEyNjRdIHBjaWVwb3J0IDAwMDA6MDA6
MDAuMDogUmVjb3ZlcmluZyBSb290IFBvcnQgZHVlIHRvIExpbmsNCj4gRG93bg0KPiA+ID4gWyAg
IDg3LjI4OTI0NV0gcGNpIDAwMDA6MDE6MDAuMDogQUVSOiBjYW4ndCByZWNvdmVyIChubyBlcnJv
cl9kZXRlY3RlZA0KPiBjYWxsYmFjaykNCj4gPiA+IHJvb3RAaW14OTVldms6fiMgWyAgIDg3LjUx
NDIxNl0gaW14NnEtcGNpZSA0YzMwMDAwMC5wY2llOg0KPiBQQ0llKExOS19TVFM6MHgwMDAwMDcw
MCkgbGluayB1cCBkZXRlY3RlZA0KPiA+ID4gWyAgIDg3LjcwMjk2OF0gaW14NnEtcGNpZSA0YzMw
MDAwMC5wY2llOiBQQ0llIEdlbi4zIHgxIGxpbmsgdXANCj4gPiA+IFsgICA4Ny44MzQ5ODNdIHBj
aWVwb3J0IDAwMDA6MDA6MDAuMDogUm9vdCBQb3J0IGhhcyBiZWVuIHJlc2V0DQo+ID4gPiBbICAg
ODcuODQwNzE0XSBwY2llcG9ydCAwMDAwOjAwOjAwLjA6IEFFUjogZGV2aWNlIHJlY292ZXJ5IGZh
aWxlZA0KPiA+ID4gWyAgIDg3Ljg0NjU5Ml0gaW14NnEtcGNpZSA0YzMwMDAwMC5wY2llOiBSZXNj
YW4gYnVzIGFmdGVyIGxpbmsgdXAgaXMNCj4gZGV0ZWN0ZWQNCj4gPiA+IFsgICA4Ny44NTU5NDdd
IHBjaWVwb3J0IDAwMDA6MDA6MDAuMDogYnJpZGdlIGNvbmZpZ3VyYXRpb24gaW52YWxpZCAoW2J1
cw0KPiAwMC0wMF0pLCByZWNvbmZpZ3VyaW5nDQo+ID4NCj4gPiBJJ3ZlIHNlZW4gdGhpcyBzYW1l
IGxpbmUgKCJicmlkZ2UgY29uZmlndXJhdGlvbiBpbnZhbGlkIikgYmVmb3JlLCBhbmQNCj4gPiBJ
IGJlbGlldmUgdGhhdCdzIGJlY2F1c2UgdGhlIHNhdmVkIHN0YXRlIChwY2lfc2F2ZV9zdGF0ZSgp
OyBtb3JlIGFib3V0DQo+ID4gdGhpcyBiZWxvdykgaXMgaW52YWxpZCAtLSBpdCBjb250YWlucyAw
IHZhbHVlcyBpbiBwbGFjZXMgd2hlcmUgdGhleQ0KPiA+IHNob3VsZCBiZSBub24temVyby4gU28g
d2hlbiB0aG9zZSB2YWx1ZXMgYXJlIHJlc3RvcmVkDQo+ID4gKHBjaV9yZXN0b3JlX3N0YXRlKCkp
LCB3ZSBnZXQgY29uZnVzZWQuDQo+ID4NCj4gPiBJIGJlbGlldmUgd2UndmUgcGlubmVkIGRvd24g
b25lIHJlYXNvbiB0aGlzIGludmFsaWQgc3RhdGUgb2NjdXJzIC0tDQo+ID4gaXQncyBiZWNhdXNl
IG9mIGFuIGF1dG9tYXRpYyAobWlzKWZlYXR1cmUgaW4gdGhlIERlc2lnbldhcmUgUENJZQ0KPiBo
YXJkd2FyZS4NCj4gPiBTcGVjaWZpY2FsbHksIGl0J3MgYmVjYXVzZSBvZiB3aGF0IHRoZSBjb250
cm9sbGVyIGRvZXMgZHVyaW5nIGENCj4gPiBzdXJwcmlzZSBsaW5rLWRvd24gZXJyb3IuDQo+ID4N
Cj4gPiBGcm9tIHRoZSBEZXNpZ253YXJlIGRvY3M6DQo+ID4NCj4gPiAgICJbLi4uXSBkdXJpbmcg
bm9ybWFsIG9wZXJhdGlvbiwgdGhlIGxpbmsgbWlnaHQgZmFpbCBhbmQgZ28gZG93bi4gQWZ0ZXIN
Cj4gPiAgIHRoaXMgbGluay1kb3duIGV2ZW50LCB0aGUgY29udHJvbGxlciByZXF1ZXN0cyB0aGUg
RFdDX3BjaWVfY2xrcnN0LnYNCj4gPiAgIG1vZHVsZSB0byBob3QtcmVzZXQgdGhlIGNvbnRyb2xs
ZXIuIFRoZXJlIGlzIG5vIGRpZmZlcmVuY2UgaW4gdGhlDQo+ID4gICBoYW5kbGluZyBvZiBhIGxp
bmstZG93biByZXNldCBvciBhIGhvdCByZXNldDsgdGhlIGNvbnRyb2xsZXIgYXNzZXJ0cw0KPiA+
ICAgdGhlIGxpbmtfcmVxX3JzdF9ub3Qgb3V0cHV0IHJlcXVlc3RpbmcgdGhlIERXQ19wY2llX2Ns
a3JzdC52IG1vZHVsZQ0KPiB0bw0KPiA+ICAgcmVzZXQgdGhlIGNvbnRyb2xsZXIuIg0KPiA+DQo+
ID4gSW4gc29tZSBvZiB0aGUgYWRqYWNlbnQgZG9jdW1lbnRhdGlvbiAoYW5kIGNvbmZpcm1lZCBp
biBsb2NhbA0KPiA+IHRlc3RpbmcpLCBpdCBzdWdnZXN0cyB0aGF0IHRoaXMgYXV0b21hdGljIHJl
c2V0IHdpbGwgYWxzbyByZXNldA0KPiA+IHZhcmlvdXMgREJJIChpLmUuLCBQQ0llIGNvbmZpZyBz
cGFjZSkgcmVnaXN0ZXJzLiBJdCBhbHNvIHNlZW1zIGFzIGlmDQo+ID4gdGhlcmUncyBub3QgcmVh
bGx5IGEgZ29vZCB3YXkgdG8gY29tcGxldGVseSBzdG9wIHRoaXMgYXV0b21hdGljIHJlc2V0DQo+
ID4gLS0gdGhlIGRvY3MgbWVudGlvbiBzb21lIFNXIG1ldGhvZHMgcHJldmVudCB0aGUgcmVzZXQs
IGJ1dCB0aGV5IGFsbA0KPiBzZWVtIHJhY3kgb3IgaW5jb21wbGV0ZS4NCj4gPg0KPiA+IEFueXdh
eSwgSSB0aGluayB0aGlzIGltcGxpZXMgdGhhdCBwYXRjaCAxIGlzIHNvbWV3aGF0IHdyb25nIFsx
XS4gSXQNCj4gPiBpbmNsdWRlcyBzb21lIGNvZGUgbGlrZSB0aGlzOg0KPiA+DQo+ID4gCQlwY2lf
c2F2ZV9zdGF0ZShkZXYpOw0KPiA+IAkJcmV0ID0gaG9zdC0+cmVzZXRfcm9vdF9wb3J0KGhvc3Qs
IGRldik7DQo+ID4gCQlpZiAocmV0KQ0KPiA+IAkJCXBjaV9lcnIoZGV2LCAiRmFpbGVkIHRvIHJl
c2V0IFJvb3QgUG9ydDogJWRcbiIsIHJldCk7DQo+ID4gCQllbHNlDQo+ID4gCQkJLyogTm93IHJl
c3RvcmUgaXQgb24gc3VjY2VzcyAqLw0KPiA+IAkJCXBjaV9yZXN0b3JlX3N0YXRlKGRldik7DQo+
ID4NCj4gPiBUaGF0IGZpcnN0IGxpbmUgKHBjaV9zYXZlX3N0YXRlKCkpIGlzIHByb25lIHRvIHNh
dmluZyBpbnZhbGlkIHN0YXRlLA0KPiA+IGRlcGVuZGluZyBvbiB3aGV0aGVyIHRoZSBsaW5rLWRv
d24gZXZlbnQgaGFzIGZpbmlzaGVkIGZsdXNoaW5nIGFuZA0KPiA+IHJlc2V0dGluZyB0aGUgY29u
dHJvbGxlciB5ZXQgb3Igbm90LiBUaGUgcmVzdWx0aW5nIGltcGFjdCBpcyBhIGJpdA0KPiA+IGhh
cmQgdG8ganVkZ2UsIGRlcGVuZGluZyBvbiB3aGF0IChtaXMpY29uZmlndXJhdGlvbiB5b3UgZW5k
IHVwIHdpdGguDQo+ID4NCj4gDQo+IFRoYW5rcyBhIGxvdCBmb3IgeW91ciBpbnZlc3RpZ2F0aW9u
LiBJIHRoaW5rIHlvdXIgb2JzZXJ2YXRpb24gbWFrZXMgc2Vuc2UgYW5kDQo+IGNvdWxkIGJlIHRo
ZSBjdWxwcml0IGluIHNhdmluZyB0aGUgY29ycnVwdGVkIHN0YXRlLiBFdmVuIG9uIG5vbi1EV0MN
Cj4gY29udHJvbGxlcnMsIHRoZXJlIGlzIG5vIGd1YXJhbnRlZSB0aGF0IHRoZSBSb290IFBvcnQg
Y29uZmlnIHJlZ2lzdGVycyBzdGF0ZSB3aWxsDQo+IGJlIHByZXNlcnZlZCBhZnRlciBMRG4gKGJl
Zm9yZSBSb290IFBvcnQgcmVzZXQpLg0KPiANCj4gPiBJIGFsc28gbm90aWNlZCBjb21taXQgYTJm
MWUyMjM5MGFjICgiUENJL0VSUjogRW5zdXJlIGVycm9yDQo+ID4gcmVjb3ZlcmFiaWxpdHkgYXQg
YWxsIHRpbWVzIikgd2FzIG1lcmdlZCByZWNlbnRseS4gV2l0aCB0aGF0IGNoYW5nZSwgSQ0KPiA+
IGJlbGlldmUgaXQgaXMgbm93IHNhZmUgdG8gcGVyZm9ybSBwY2lfcmVzdG9yZV9zdGF0ZSgpIGV2
ZW4gd2l0aG91dA0KPiA+IHBjaV9zYXZlX3N0YXRlKCkgaGVyZS4NCj4gPg0KPiA+IFNvIC4uLiBj
YW4gd2UgcmVtb3ZlIHBjaV9zYXZlX3N0YXRlKCkgZnJvbQ0KPiA+IHBjaWJpb3NfcmVzZXRfc2Vj
b25kYXJ5X2J1cygpPyBNaWdodCB0aGF0IGhlbHA/DQo+IA0KPiBJIHRoaW5rIHNvLiBJIHdpbGwg
YWxzbyB0ZXN0IGl0IGxvY2FsbHkgYW5kIHJlcG9ydCBiYWNrIHNvb24uDQo+IA0KPiA+IEl0IHNv
dW5kcyBsaWtlIG15IGFib3ZlDQo+ID4gb2JzZXJ2YXRpb25zICptYXkqIG1hdGNoIFJpY2hhcmQn
cyByZXBvcnRzLCBidXQgSSdtIG5vdCBzdXJlLiBBbmQNCj4gPiBhbnl3YXksIHRoZSBkb2N1bWVu
dGVkIGhhcmR3YXJlIGJlaGF2aW9yIGlzIHJhY3ksIHNvIGl0J3MgaGFyZCB0bw0KPiA+IHByb3Bv
c2UgYSBmb29scHJvb2Ygc29sdXRpb24uDQo+ID4NCj4gDQo+IEBSaWNoYXJkOiBDYW4geW91IGNv
bmZpcm0gaWYgcmVtb3ZpbmcgJ3BjaV9zYXZlX3N0YXRlKGRldik7JyBmcm9tDQo+IHBjaWJpb3Nf
cmVzZXRfc2Vjb25kYXJ5X2J1cygpIGZpeGVzIHlvdXIgaXNzdWU/DQpJIGhhdmUgdGVzdGVkIHRo
ZSBob3QgcmVzZXQgdHJpZ2dlciBodW5kcmVkcyBvZiB0aW1lcywgYW5kIGl0IHdvcmtzDQpjb25z
aXN0ZW50bHkuDQpAQnJpYW4gTm9ycmlzIEBNYW5pdmFubmFuIFNhZGhhc2l2YW0NClRoYW5rcyBh
IGxvdCBmb3IgeW91ciBoZWxwcy4NCg0KQmVzdCBSZWdhcmRzDQpSaWNoYXJkIFpodQ0KPiANCj4g
LSBNYW5pDQo+IA0KPiAtLQ0KPiDgrq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+
4K6a4K6/4K614K6u4K+NDQo=

