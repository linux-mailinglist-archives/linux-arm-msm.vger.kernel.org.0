Return-Path: <linux-arm-msm+bounces-33607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CA999582B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 22:10:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C82F28A8DA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 20:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495BD213EFB;
	Tue,  8 Oct 2024 20:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kMRjwYXQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1354A20CCF7;
	Tue,  8 Oct 2024 20:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728418200; cv=fail; b=fmLSuXEQsSIKm8Y+RG2DozAIYFW+X24/0iV5oK4NSTumCvr+7H2O6xlMU7AEgBIBwq3JRPBqjTTmtXi4StDBg9unOavQpMAaFDv6rlLAVu+Jfk9kiHB7beE0D/BdQIaIFtWyeuFDKTeLix6I4aCkKL+eak74xG5Ksi71F2BAF7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728418200; c=relaxed/simple;
	bh=1GW5fgvxQO5QAYnmuV2Hs2L7faplbrMuFiLzCQ0wokE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uJMb3kEPT+2pSLk749Z7wg2vf+bjrXuujKmBud2jMNxjmvYysy953qk8UFYPbTwHvlR8U6RkKqOk/XvkXhfDIcSfkiyZrEkuQZ6XLRHoRHQ8ja42zAq7UsDU0eLl+2mXyAKXKhpzDYZ5qN6iDD6nO9BLEaTF5G492md/H2btAV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kMRjwYXQ; arc=fail smtp.client-ip=40.107.22.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SjP1/RUqA7Lc9ni6Zv5QGV/IycIwodF+joTq52+gmts9HhwIwDeWFWs8rV/I5LR+sFrlCW28eBDYNXizcdr/72rmAkkm80HRc8h6z+i6J/Rbyxd2hY/sBYhe8g43rAzSuuvH1BKuwSSHv5OtUt68+aobHYrogfhgzKmIQyILaFMcX/YBRYACL9E4x3VFuLIKdsYkOP9NSerzUjkQVGUsc0WRFrvySy8Wcl6fz1IubBsMN1NemlY+eFUNyalOfifDPJANFiIeSuZTfxQjfm8vqlpIgR82DanvTW8uVc4NVyzAlEnwoRFYu9ONUmeqe8/At8CvgnJWRc1xAg+1KHMetg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ls5buFucBZ5jJe9UmhFWr+aTdk7frj8BsQRHjZ7YOk=;
 b=odcefle2a7TiNmA7kIiuU5r2QfHhwEiTbSTAiaxjxeh2i+ykRf9zjzHht7xdV08t2WYDNi0Je06R/auWyEznOtYFbK+3AF8mFKk+5K21lfzt8wQrNZdQcC9Q7dRGYMEBX54757ZYTMGCjcd8E2cAjSK6lqg4w2HX2SJxjicI/ySn3Gg6lWf+ba1qHKXG3Y6dunLXblCu7UUERl2hSj1UNzC4WC8R9dxJr2FaQorkFrpbRy/u3JUYlczhke0/e8jrbrdmJd7kSJJcTNeoWKOpEUtJxky22BdSYucMwljk3HnnBp/zcacaCHHxTYpbShYDF3Pu7c3POdMEkMswxULGwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ls5buFucBZ5jJe9UmhFWr+aTdk7frj8BsQRHjZ7YOk=;
 b=kMRjwYXQMvFxhIgW1Xt4eIPOSnkh/kgRj6Ydwf5rsYnLv8wqEpNkn/JqwHpl0eC/EA2ylZKS9MgfVS7TKRHOmc4iA+92hKI5br3qxEdljq3bqtDKPNLTab29kVCBQVsKT/a7Et3y/XuaQHs7aNw1YD+OzjEPbGBbDkZRNfnQWfcp3mw3KmuCsmG+Fe00j2WYWmMxrrefpOxN9OXkQK7SNdMi8pkVpHZV5VHyA20xVfTM7QZai6rfn7l5kW2Aiarn8cwRjaSGBxQRdaMinf4Wy5nq4A3CEwoXJEI2D123tPfcBndLAEu8cbZ+fN6EpnYA8nupcPHRc0pKROAnINl9EQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PA4PR04MB9685.eurprd04.prod.outlook.com (2603:10a6:102:26e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 20:09:54 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%3]) with mapi id 15.20.8026.019; Tue, 8 Oct 2024
 20:09:54 +0000
Date: Tue, 8 Oct 2024 16:09:45 -0400
From: Frank Li <Frank.li@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Saravana Kannan <saravanak@google.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH v2 0/7] usb: dwc3: qcom: Flatten dwc3 structure
Message-ID: <ZwWRieC0D3Q13VW7@lizhi-Precision-Tower-5810>
References: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
 <ZrugxSqzhzxvVqV3@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrugxSqzhzxvVqV3@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: BYAPR06CA0055.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::32) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PA4PR04MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: 143a8442-7639-4609-0c9e-08dce7d52cae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WPUO+lPWzl3KAkGsO5GaeyboXv9gW9wIZQJqfwF8q4dFxB+EZCnWlw663JzP?=
 =?us-ascii?Q?QZFQyZkpHZRVX1GkMn+HRZuh1/dublNzm6bIreJLq/5mfdnTGsm/VEHnrDAw?=
 =?us-ascii?Q?rUmtyoJINdHtsQrxSRGLIeEXN9/LjIqT2BPFh/rGF3mQkthKG7eIZBREZGKJ?=
 =?us-ascii?Q?Yicq+v53YWsB/pyWcdc4nL40rxB519v5wJzz6JVOMlG8oHopC1Q+9V2jQJLa?=
 =?us-ascii?Q?r9cXRvgth4rRA6KwF0hfeGEiRROrmbpkulxbrHOfv9pchqRCnlE/eV9CG9r+?=
 =?us-ascii?Q?KkELc0axyY2r8pQfSKUsE0SZ8rtH1l2LigQcwQfr+jl27VTFHAc2C/hpUY/g?=
 =?us-ascii?Q?yK4ywQnElKVxxQrNLVxdWdVWvgpfx48iW4e/5HKPIYZz7DVysPc0b41AMgqL?=
 =?us-ascii?Q?b5lmbtwuPogeXdC5j1AiwSgsFZZW9+iHSBUxe1SdaMvjA9XQOHlRIZK/qY6m?=
 =?us-ascii?Q?VbXBooPbWhaFCF7V8e5LdPED24tgqTPFbcA+hjF2oiwn+JRbjEhR4u5nVmaX?=
 =?us-ascii?Q?mLjrxYab7d0wpCnFwTGsNmimGgGdb/wgEMwA4rZ0K9DNDk1KaZdfOIhVxZQx?=
 =?us-ascii?Q?JMEC6QPpmtoNdr7oo2/632++xUMgTjfBlLPf4exz/Zfw2veFGy3jLRRQHmA0?=
 =?us-ascii?Q?juUNDDp6HAuVQuw17//MHVlqeLW7SKQicb+QUcIhSyOZa42QiISKSX3EPEwC?=
 =?us-ascii?Q?gbFBIghlNP6EP2Yx5FS2xoYwiyl1xdfA++gFMAptdvt42hzzZ0N6oqy2sZ/N?=
 =?us-ascii?Q?FjwyVJg5Y7VOOslWqeP5NwG30XrGaScOqPTHPURxPiDa+uFpUw7Swmp5wl4e?=
 =?us-ascii?Q?RiZoql9l5Mh19bvhjj21cCmX5Amz2VQoyDB0ZfSRUTggbSsVN6Mq1BEfmTeA?=
 =?us-ascii?Q?OV2H/W1MggG0tHZQ4PiNwbG1Z02KAKOf498LcrASPZUV1txwoqnqJmwKfbU3?=
 =?us-ascii?Q?aqKylgs++NJIZxbPJs8wsHOhgQGJwNPlSYhnsff1vtfLrZ6ZLn12j8G4IadF?=
 =?us-ascii?Q?yBYVLkZ8O0J/88uLfH11NcDY8y+FW7BzNfTR7UIwUqGAxVxJcgrg3pVXGk4I?=
 =?us-ascii?Q?Q1QadcI2REtlDIL+k+oWaUMbrmJBkRnb+l2cz2gDP5vCSOmyoFeMz6K+TRT/?=
 =?us-ascii?Q?ncUcAgh1aaOdN1VqnK9X8gwT3fPwpp6WTlqlpCLsz4F/+in7QEGrZzSXTHI8?=
 =?us-ascii?Q?b5Fp1WTX6xfjYTwNTm1Io+i3+Is2k5lHCCsXvAnOxfdTSOfzAu2dm21IvsAm?=
 =?us-ascii?Q?lAtAPYZ28egZUQyBW4H6x/Qb6A+STzF6ermOQXvvUKrsk/QJCtqKv9R2IuTe?=
 =?us-ascii?Q?2nPSijpFe5ifl/DmbVQB2bdgBuvh8ZUpWEOQ5vgLsC4G4A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xxhwje+dAr5q5zbhlmjpEpbn0q3NOPZr2y9PYTY2tqN8UVtYpiqo/uduVWpa?=
 =?us-ascii?Q?dpJIRU0Yp4dncEWXsqO2RS0eEKFCHYW4eXxRK2/T9QjwhjuaIeJDNG8aGl3R?=
 =?us-ascii?Q?XGrsEN5zHtc3nms//K6VPBhYP6+Jf5CaknXx9aL5GbDFLcIXpBg7VQLVJw03?=
 =?us-ascii?Q?qigSwkRlgCbIXu4ec4QU0U+McuYL2VLZbJ9Lo+TgmYH6vG7h3I7Ikgqwh8RG?=
 =?us-ascii?Q?9iVddWG9UGLjtwoOaCymUUWkLIMwBLdI3pEvSWeekj1C0HZrm5hf8bIUURdI?=
 =?us-ascii?Q?FONahv+ChiEn7kXGNwTa/gN7SQneX2pXuRTH7P6pTFRZUDFeis3Uu9LvGjcL?=
 =?us-ascii?Q?UveY1InnzwG1LHfVA2La9PL0uuaYMOX/t+CYA0ayBmX+SXD0mpr8JCh4IiOi?=
 =?us-ascii?Q?8jr/OD90tB1/grTCV9riL0IuxmaaXPq5M6EcCxA5rId9uiifbnqxfNE4+ceC?=
 =?us-ascii?Q?Xu+YaPRVTUB1Bzf7vt4Gry4PH0+X7dr4jzB00o+L2RQJw+kv4/pFcylMhAEs?=
 =?us-ascii?Q?Ryd7pmSlVDeUM0p/2CV8oE2h0sm8+K9EDSTI33vBytmoNZzemOTJMEx1DMst?=
 =?us-ascii?Q?n+OvS2+aalX8oYM6xiMA2kUuij+wsJZOi1cOY8vDEuv1MhHCHLmMaU03/WVz?=
 =?us-ascii?Q?Pp+RXzyTjBEycr9T82x9x08iLbdbJOfNMv/OtlU7kHTlwxgaHxtrb2Omn5m+?=
 =?us-ascii?Q?igE1r43ckBPkMiAvSBZKn+7LDZUaYZCaLgXBEbJILlh4VNDeajYiNAzysiVZ?=
 =?us-ascii?Q?hVNS6lNgGuXM+FE8qvNzOFshUAX13lUiQTYnwrS4lJ5rWjWOxYSsOkb1k/kb?=
 =?us-ascii?Q?31B3MTyFdbLum88eVsCklxWbFrKfqtaMyY726NMD4+eAKxaeMg/ABcd54tRl?=
 =?us-ascii?Q?5PHXZdcQTZ3K4Ze+K00DNlVOufzM0dhY8Ub+KwOyePzLNwnUDOdQyg0CepsD?=
 =?us-ascii?Q?Wuky0XuzD5xnUsT2RncqevzQnoP58PIi5M0JsYnVWUdRMZRmtx4JV6QwHnJE?=
 =?us-ascii?Q?25BRFWgwYL9wRvoqinzStCApbhrLV0Q6Kj0pXMkmUFc1QQgrUNHw6+fgWHFn?=
 =?us-ascii?Q?zNp7Tm6I9OpFFPXqmrMm5DxNo+EWy0oxmNDuy7ASr7r8Pn5+eoA2NUCGcX8y?=
 =?us-ascii?Q?5MNBqYgRCRqEn8Hkdq35ljnTFFJKE8mGIDj5ktn9x+t6ZJwjvbsqHB4EcMOm?=
 =?us-ascii?Q?RMLjghlO7AhFSs51JctlnO4HUf4rh/M8OewDFeRaXwFumW49wMMOQ1YZZR2f?=
 =?us-ascii?Q?L4XPjTNLGN5sIQW1gZnISok7MD672ga3cqLH4iVcf+LHfogsYfH0ql4ipuwN?=
 =?us-ascii?Q?pg3TrjOrWYV8ItbxahnPaqKfg0/NyhCR7yUi6AURJZZMk3GgOPPhS8nE1xdx?=
 =?us-ascii?Q?zdBOAFbXS7xrVn22RYvZ6D+H6yTRjd4rZ/kgdBkbvBk2pz1Yu7gFSupPQ78i?=
 =?us-ascii?Q?h8SzSVqKXuhlXyo+AdEp2ehvFKIf8mY8dHNDcWAi+vsoDu6uN6QWqF1Lx8s0?=
 =?us-ascii?Q?hJ2l2MsZqoQHZhCEmShUvqV29lPE8JGNZvXi3Vm5mlhEeAqS0+XtysuMbwQH?=
 =?us-ascii?Q?e60zS5xslK13sIsjJ5g=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 143a8442-7639-4609-0c9e-08dce7d52cae
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 20:09:54.4680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: guvuqErQVDdM3DwXQda2yOFcoWNOo1dV3czx/mjCFuNcXZbYsRoZUXoPyA00ALXFRKLmYGtyUnIa5Dg27yCr7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9685

On Tue, Aug 13, 2024 at 02:07:01PM -0400, Frank Li wrote:
> On Sun, Aug 11, 2024 at 08:11:57PM -0700, Bjorn Andersson wrote:
> > The USB IP-block found in most Qualcomm platforms is modelled in the
> > Linux kernel as 3 different independent device drivers, but as shown by
> > the already existing layering violations in the Qualcomm glue driver
> > they can not be operated independently.
> >
> > With the current implementation, the glue driver registers the core and
> > has no way to know when this is done. As a result, e.g. the suspend
> > callbacks needs to guard against NULL pointer dereferences when trying
> > to peek into the struct dwc3 found in the drvdata of the child.
> >
> > Missing from the upstream Qualcomm USB support is handling of role
> > switching, in which the glue needs to be notified upon DRD mode changes.
> > Several attempts has been made through the years to register callbacks
> > etc, but they always fall short when it comes to handling of the core's
> > probe deferral on resources etc.
> >
> > Furhtermore, the DeviceTree binding is a direct representation of the
> > Linux driver model, and doesn't necessarily describe "the USB IP-block".
> >
> > This series therefor attempts to flatten the driver split, and operate
> > the glue and core out of the same platform_device instance. And in order
> > to do this, the DeviceTree representation of the IP block is flattened.
>

Bjorn Andersson:
	Any follow up on this thread?

Frank

> Thanks, we faced the same problem. Can you cc me next time?
>
> Frank
> >
> > ---
> > Changes in v2:
> > - Rewrite after ACPI removal, multiport support and interrupt fixes
> > - Completely changed strategy for DeviceTree binding, as previous idea
> >   of using snps,dwc3 as a generic fallback required unreasonable changes
> >   to that binding.
> > - Abandoned idea of supporting both flattened and unflattened device
> >   model in the one driver. As Johan pointed out, it will leave the race
> >   condition holes and will make the code harder to understand.
> >   Furthermore, the role switching logic that we intend to introduce
> >   following this would have depended on the user updating their
> >   DeviceTree blobs.
> > - Per above, introduced the dynamic DeviceTree rewrite
> > - Link to v1: https://lore.kernel.org/all/20231016-dwc3-refactor-v1-0-ab4a84165470@quicinc.com/
> >
> > ---
> > Bjorn Andersson (7):
> >       dt-bindings: usb: snps,dwc3: Split core description
> >       dt-bindings: usb: Introduce qcom,snps-dwc3
> >       of: dynamic: Don't discard children upon node attach
> >       usb: dwc3: core: Expose core driver as library
> >       usb: dwc3: qcom: Don't reply on drvdata during probe
> >       usb: dwc3: qcom: Transition to flattened model
> >       arm64: dts: qcom: sc8280x: Flatten the USB nodes
> >
> >  .../devicetree/bindings/usb/qcom,dwc3.yaml         |  13 +-
> >  .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 608 +++++++++++++++++++++
> >  .../devicetree/bindings/usb/snps,dwc3-common.yaml  | 417 ++++++++++++++
> >  .../devicetree/bindings/usb/snps,dwc3.yaml         | 391 +------------
> >  arch/arm64/boot/dts/qcom/sa8295p-adp.dts           |  12 +-
> >  arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |   5 +-
> >  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |  12 +-
> >  .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  11 +-
> >  arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 138 +++--
> >  drivers/of/dynamic.c                               |   1 -
> >  drivers/usb/dwc3/core.c                            | 169 ++++--
> >  drivers/usb/dwc3/core.h                            |   3 +
> >  drivers/usb/dwc3/dwc3-qcom.c                       | 323 ++++++++---
> >  13 files changed, 1483 insertions(+), 620 deletions(-)
> > ---
> > base-commit: 864b1099d16fc7e332c3ad7823058c65f890486c
> > change-id: 20231016-dwc3-refactor-931e3b08a8b9
> >
> > Best regards,
> > --
> > Bjorn Andersson <quic_bjorande@quicinc.com>
> >

