Return-Path: <linux-arm-msm+bounces-49751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABC0A488EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 20:22:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D6FF18900E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 19:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3E226E943;
	Thu, 27 Feb 2025 19:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IxdPamjm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2062.outbound.protection.outlook.com [40.107.105.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C9D26E652;
	Thu, 27 Feb 2025 19:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740684160; cv=fail; b=GWexdCEDXDtKnQV6XmOk2RWuHs4VsY2anFa1Ndn+bVLUqc7/G9R+Ov9KnQvh3Qk54gXsEfDkZKYoieORx8GPvVzC+J8VIQYR2KfBvsObYDq46pmiaSzKP0Sf1VbjK0wAWrpJaeSrvLXl5v+trnOFzcPXhsHGaaiLlsE+7yT5mSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740684160; c=relaxed/simple;
	bh=m5AQfVpZMGLVnNMcPzFVIRdlkml/V9EUbPasG4KnEgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=E2VYSUJCULd12hQALtwCFbK1UiL0ITrLAE4sMrBJ11PifaI6JrCSO7MfBEYtYg4MbIFBw93YvQlNSx9fLXhANluQfHUtwACKGF9LqchxnZR4YqTiFCu3TsUyst+m9OJebK+LeMRylsYpn6YxphxvBuIZuQX+W9ZYGNYkYvhD+hs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IxdPamjm; arc=fail smtp.client-ip=40.107.105.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emBr0pmdVZckV0UI1Bvqxn5r1Ct8VeN/T4w9aHjWR8jOQrc/G1z1mJnlg3Pji60QnmUds8ZNm1bdeA2wiwqDm71nYsVkgPBspIoVb440NsZ1iI/h3WS2A48J7Z47LGZ5jZQNRnkTu6QcR9g9va23lCgMgtj9k7ffgYqmke767WpBacWJ8lpxFWziS9jbFGpJx61Z+ud0vtIAVJHrs9ZAD/hvI/N5gS/CqOGuR013G7rZK1qpDiH2wWP6QHWlVQQbi+TIbdWX4MYDZ0Xc8j9hOCvLRNRzDT0qQJgTMGFSxEwCNuJOcvw3AMNddqGOXatYCdCeDNu82l/aqoAleLe5MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WN+PwOzJLbCBr5RTKmzkWV/Xet1cUoYI4BIR6YfyZ3c=;
 b=JkPR7KOqJcLjKPoiJv2ZoWCzgig6se2iVwtzyWkdNjMHwo4gB1V6hxw0+evLz1TtWjv63FYXOIgKhKlz9AYGOAOFCJAh7jOeM6YtFo/v0WIZMIZ9/ekjXkJ6xb370ROsoxgZs9PyRRFV8txIZHZYMm6IglG1NOdosdds7dT2Ib1Jaz87wGrhRBY+2aTf1cSqqu/ucqG6cKQ7WclvD07BQBX0CbyRajIFrD2tEl9inzv39TThq6xg1AHC8AwalKhVqwdDVkLEVfP4rh5qDWEOz9+HHtJKKbWf7UNZ8TrOKPI/WBCAUsWjXvI1OE0kC9OVz+bt/f2QfApiboGer85+7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WN+PwOzJLbCBr5RTKmzkWV/Xet1cUoYI4BIR6YfyZ3c=;
 b=IxdPamjmLzF53/0MYOSZJlac9ATqV4i2Xq00swh2OhwUSUv3TNyAmFTIaBM4RjCldB9bge5ezqvKucFizWXmnxDgEcQQ3dAqTL71Eej9QG+OCnAldBUnK8X+AcW+XKpthrCnRrCvLKUR7A+uYxJB3lFg1NbiVOS0K/yD67yqBJ3rbGwqty91l9OQg3+iNUoQfBdjbgX6XnxNmyi8EIkneifi31Sy4SfwFmAaG2ZAtZdaw+mRTOfmgnltXyU89T9g9sWnshJcOB9DZTJUdbZVSWl4RKxBqY1m4MCAglOBl9/ruq9JrR1no18+Ojz338G45xGtRID00I2aTvd3IR31Rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB10851.eurprd04.prod.outlook.com (2603:10a6:150:21e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Thu, 27 Feb
 2025 19:22:35 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 19:22:35 +0000
Date: Thu, 27 Feb 2025 14:22:25 -0500
From: Frank Li <Frank.li@nxp.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Saravana Kannan <saravanak@google.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/7] usb: dwc3: core: Don't touch resets and clocks
Message-ID: <Z8C7cRKMmvUlV6vQ@lizhi-Precision-Tower-5810>
References: <20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com>
 <20250226-dwc3-refactor-v4-3-4415e7111e49@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226-dwc3-refactor-v4-3-4415e7111e49@oss.qualcomm.com>
X-ClientProxiedBy: SJ0PR13CA0077.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB10851:EE_
X-MS-Office365-Filtering-Correlation-Id: 861d584b-751c-4510-1e02-08dd576416db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QvYGrnHkWMUFyVAPNMcYMUudKMMxCvZGZYUiABpZ2n3eIUiMpl9u/eRyrZZR?=
 =?us-ascii?Q?AO9HDVZqeXm6SYnYiHMyVEVUKjiD0SJks7TZ5WRH0vMZSC7BkQOTnbtd+oH4?=
 =?us-ascii?Q?gOMjp7WoOUrbbUumH8xciaH1oGh//NqR1Nhr+3Q2KYhTSGDp+0R4lXYq+y+r?=
 =?us-ascii?Q?a7FipWPOgKQDboVhnCwaaYuw3UBCUZG2QoHGLksAnSKtGyFpRvKv5sBy1fc/?=
 =?us-ascii?Q?K75OhmKqcdKb5IHtugMEtW8lthaSbkubUZXGjJewN95g4Vmhy2WKFJFuHWWd?=
 =?us-ascii?Q?P+grEDQVlUdXuVBX70m1AK5nrZB4h6Otw4ASGfbMv1okAQdOeqPtc02vYadj?=
 =?us-ascii?Q?VGzqkid8qThW7SzDM7S/ks0B4ewDQ8JoPB1KNeE2mwJJKIpreeni6EymmZN6?=
 =?us-ascii?Q?vFq4GWD62CgZ9lAD628wQ5GpyWyupP57CkbwENtZB7zgaNMH/yrnPUocx6q0?=
 =?us-ascii?Q?qn5uzVMbqNUCds+R4pLQRf+Opx3RMEuhxqLu/VmzgsiS7BndUvjmVMV/g3nR?=
 =?us-ascii?Q?u5QDygIbnVrOKXfSRoYpah3y8oBy3M+Hwv+6r8Et/y8nrkxUlGYlv+zo7X+t?=
 =?us-ascii?Q?LKuSBE4fQxPEaa6N7LtQgU0Ds+VYKsR4L5ArSOs9TOnjFWa+8rCFlFRoJHnq?=
 =?us-ascii?Q?561PnPuqBQ7hJFAm60s3tCkxV6yh+/DhdpjCD79Vhj+Yd0XOe1xgcaMiCH+J?=
 =?us-ascii?Q?nmvowdFK7bYUSnm23yYpzC6Gm4o6qkkQ6qcEder5ohQzfKsp/jqSZ+XMKYg8?=
 =?us-ascii?Q?oG1mf8/VwMxDC68rAXiYNn2MOCdX30jEIoNydgoV5xwDiYx+Ss52ZoRoWHN6?=
 =?us-ascii?Q?6gcQRizMTvDOHoqwmnPq97FWgHkT8UHJAw+PdqH8NAon9JaTnQQFeNkJzYxt?=
 =?us-ascii?Q?IPjAcJAHVNNAsh4fXYDYsIr2GhpqoovLAw+XDmao4DDMMCd2h1KIqIeXEhyI?=
 =?us-ascii?Q?ng3I295t3zX8TuXIgDz/ATiuBPzbVzbZfuH4f4p5L2h+QDYTrv8jtBjbOpXM?=
 =?us-ascii?Q?LDjZu1Lh+FeHaa0DLWhEeyDLBkTynPOUTpftELD+UFTukoNyGNZVv/ORpCgX?=
 =?us-ascii?Q?zrBZJ+uYAq8SBaM8mljyutjei7Ah6I+XrQhQZ7XSOmJuLCzn9D5vdWr6hZt+?=
 =?us-ascii?Q?Ah5IkZAGag/kberkMflqF+Qy7ryzVssjFIXveRGrTV7u1lbEvud6MAKjiRXi?=
 =?us-ascii?Q?8Srm8vA3RN1PJcgpPEMSE3vfKUc315+I7Xdi7JH5W/LAz6pVRILRzXecDI1q?=
 =?us-ascii?Q?P5rbwcS4I3KHqqLL/a15z7lo2pJTy0Fob9BZsNMA6HSDB1QMKABs8UWKFnoe?=
 =?us-ascii?Q?Xb6XJPWK9mFjD1NyHdq//2+HogR+bZYUMPL3gS1Ov3DuhNnJfP6GvdOslnnb?=
 =?us-ascii?Q?jB2Oh7W3N3NkGgrkZPvMhPY1FK9QerNpt/ZHUjZn9l1/idxuqZp6wt8vDFMb?=
 =?us-ascii?Q?yevbO3Cm5hWsSibFeVVg721Ig4BhIcZy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UsRkTH58+R9DKi10jedPhpHtCdmOQ3m2V9YR+hEWPBgqz/oZ5gEAkrjmXN9W?=
 =?us-ascii?Q?2cppZArn9K2xI1cCdDniK+vPUTWOrwUNj1WwJtEp61WFNIG0BasUFtw1R14l?=
 =?us-ascii?Q?ku+wKieCljFXdxJnMHhscLTVy4Z7CiQ4uVouax9yrU46vCabpWMZQm5BGfpS?=
 =?us-ascii?Q?7qFuUiInEkjPG8HKx6GWqgWalrplE+1/31lZ508jtp+SxQ4R6ZDH7hSX+Bqn?=
 =?us-ascii?Q?zX4/JAQe5IqBg92V/rmiO7dmA83BHj/foYGrD++YI1xLygm85ZsrraTwdCHT?=
 =?us-ascii?Q?H8Srty5iDVzHt7FMegNOgTpHAkRCREShbtsiJi9EBbH93oA29QmRHMXC61rw?=
 =?us-ascii?Q?WlciFWYV4Q0vjqQBNy6oIk13rj8Yy6olF2wzXJoZhyE/KnraYfOzWY0RhF/K?=
 =?us-ascii?Q?qf2u5Bq2J/pJkdqXxWo5KPmKC6r8fEwLI0zYbF+9sqU6tdX0nVEwH/NQvprs?=
 =?us-ascii?Q?m8vNsm7EP3szrZDP8Mqnzh4IRj/EeTQBQAbFjaziKuQumM1e1BmeHiyb2mDC?=
 =?us-ascii?Q?FUFnQUgJ+FlixuDQLfgi41sEoT6m2piXqEX4YzE0L6aSOeH+Qsq3AEzOXcoQ?=
 =?us-ascii?Q?nmU9jhL9AruSDHeVaYI+Rjub93BBkJ+GKnSaK1QFNqbZ19zYVsi/WW5wat2a?=
 =?us-ascii?Q?BGGc3pb0YZYoh4YN9y5J3gvPS67CfY/6GeyHQVXZk0hW6CaeT6pVpvc2nX/9?=
 =?us-ascii?Q?xQ9HWu6MYVRjl1Es/EwJGvZz0wzO7/cjUC7lpj+GYdlaJWvPM0LYvIx3MWUb?=
 =?us-ascii?Q?zI5TlEQYgCesMzxzZWIBQiQk5FfEzI0zEnSqHMUjrzJnBRqOdBWE0y/wf9UB?=
 =?us-ascii?Q?aeCpAk9mFATx4cioCknpXCTFdrWL9ARtCHJDpnFFCu2Wc64wmLo80AcRaxFX?=
 =?us-ascii?Q?essF50h2pH19Ia/xJRaU0Q5sAUvpPMfd1ERBhy0bj9vPY7Nha8fIafdB2/38?=
 =?us-ascii?Q?/hG5j6I/iRPBOreoKwoScPmKg57gmQB4QxlQBAZWINImuBz168YAsdzjytQP?=
 =?us-ascii?Q?Ap2nWS6f2CgPnQXd5kni4D5WbCzm3dQgzkwsEFApLH1/4bN2L0X1Y68Fccm1?=
 =?us-ascii?Q?1Jr3IdPSkaoocJnv/+G0QDPKH+56eF7d3aAaWJ6KgiWi9OLXaKvjo14V3rtN?=
 =?us-ascii?Q?FPQI0rQLferb253vstgh94V1diOwTCanpWJ2gfPXmW4kWuI17UyCk7WMmSVC?=
 =?us-ascii?Q?rv3VsLtnXDzzoY1S7HNUS8DgCExUjZJbUVrCD4hz54B7ZTR3hwbvWhEIkXr5?=
 =?us-ascii?Q?3dsmMgBUtINMGGox8MW3X0V2Txtb8wNR0iuZRdHIB4k9u90OC9P+0ytXLMz8?=
 =?us-ascii?Q?i28fLP9SwzxTp5vm54vfGd0Wl8zSjmKBT0hk+cGuPjJ/XWDkQraEAAgrY0o/?=
 =?us-ascii?Q?nXxjiZctlWf1P7lfUjltq4m5REQZHcj/YNEpC4s2mNgtILlfrP/VDF67dK1k?=
 =?us-ascii?Q?Z1ynLkssTCaFz64vyHS2W0PB7CiJ2uWzI8IapDGIIPWeKDTxnAd+n6sqbGRg?=
 =?us-ascii?Q?F5C5WoP+C/aaI1+lv9uwtbwW5eTxVKcqMpQ4RYAdJ6Kkno6LQ9hVVHbn7A4q?=
 =?us-ascii?Q?IObc/yCImO6Nq2H9raxQ4Teom9g2+xKklByRbKdy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 861d584b-751c-4510-1e02-08dd576416db
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 19:22:34.9554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hx27iSGIUbHzA0xqjlx5AMHQeCTzL5NmMoJIKyqR81YxdFOZ8WtHZkAIszw2et8jBIMSUQPJe53VpwQsBNTIYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10851

On Wed, Feb 26, 2025 at 04:17:50PM -0800, Bjorn Andersson wrote:
> When the core is integrated with glue, it's reasonable to assume that
> the glue driver will have to touch the IP before/after the core takes
> the hardware out and into reset. As such the glue must own these
> resources and be allowed to turn them on/off outside the core's
> handling.
>
> Allow the platform or glue layer to indicate if the core logic for
> clocks and resets should be skipped to deal with this.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/core.c | 19 +++++++++++--------
>  drivers/usb/dwc3/glue.h |  1 +
>  2 files changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index d9f0a6782d36..aecdde8dc999 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -2187,15 +2187,17 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
>  	if (IS_ERR(dwc->usb_psy))
>  		return dev_err_probe(dev, PTR_ERR(dwc->usb_psy), "couldn't get usb power supply\n");
>
> -	dwc->reset = devm_reset_control_array_get_optional_shared(dev);
> -	if (IS_ERR(dwc->reset)) {
> -		ret = PTR_ERR(dwc->reset);
> -		goto err_put_psy;
> -	}
> +	if (!data->ignore_clocks_and_resets) {
> +		dwc->reset = devm_reset_control_array_get_optional_shared(dev);
> +		if (IS_ERR(dwc->reset)) {
> +			ret = PTR_ERR(dwc->reset);
> +			goto err_put_psy;
> +		}
>
> -	ret = dwc3_get_clocks(dwc);
> -	if (ret)
> -		goto err_put_psy;
> +		ret = dwc3_get_clocks(dwc);
> +		if (ret)
> +			goto err_put_psy;
> +	}
>
>  	ret = reset_control_deassert(dwc->reset);
>  	if (ret)
> @@ -2328,6 +2330,7 @@ static int dwc3_probe(struct platform_device *pdev)
>
>  	probe_data.dwc = dwc;
>  	probe_data.res = res;
> +	probe_data.ignore_clocks_and_resets = false;
>
>  	return dwc3_core_probe(&probe_data);
>  }
> diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
> index e73cfc466012..1ddb451bdbd0 100644
> --- a/drivers/usb/dwc3/glue.h
> +++ b/drivers/usb/dwc3/glue.h
> @@ -17,6 +17,7 @@
>  struct dwc3_probe_data {
>  	struct dwc3 *dwc;
>  	struct resource *res;
> +	bool ignore_clocks_and_resets;

Nit: suggest add kernel doc comments for each fields

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  };
>
>  int dwc3_core_probe(const struct dwc3_probe_data *data);
>
> --
> 2.45.2
>

