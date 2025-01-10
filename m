Return-Path: <linux-arm-msm+bounces-44762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 090A4A097EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 17:55:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1659D3A85E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 16:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F6A213237;
	Fri, 10 Jan 2025 16:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LAbg4ySh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2086.outbound.protection.outlook.com [40.107.21.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96A120B7F8;
	Fri, 10 Jan 2025 16:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736528139; cv=fail; b=CEJQ63RjynwMsTezY/hvsAyprggiWo+d3tQWXvXjSjYepoY3Y3fQvFEbMR1bUgsG/3xmeTA5jbnqwO8jBM7knd6jJ4bg07Ts/c9kG3B6idO7Z06VgFIGEAS1Tug8OSw1HFeXRjwJEROCv6t/LkGS67cVBowAVssD2fnlZZgxLe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736528139; c=relaxed/simple;
	bh=p/DlGDqX/TFMBWgkoqokTWToF/hLhYYe/RnQ5VLP5fM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=E9JbjDKO8rsCguShJQDkULvpTAPJs9+b9OY6ZgrEhYbx+QzM1HYJNc2gcKq0GF4PqjMZuXct4BCfNpVJRWz/FqG5l3SqhMa/K6EGfh4aX9qfwiII/p+8jGfDMzk+qu3+c5oqMvQDSyXVupAx5tDNt0/GYBH8qUgi3NL7TRx1LOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LAbg4ySh; arc=fail smtp.client-ip=40.107.21.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SqAs3wt4RrsYvt9qQnrTBLkJ+WIwm508zUT76BlvJfkl8MpJY31qmkUwnk/czt5VMXAkLeIrFtcqlZjqyipUcncxK5htq/iX+nHdnTHiSezAVruzGA93hVK1V7quUb4JQlIS7GAEMTJey94HVqCEIIGL/4LkOZ6jkKTKtA+D4i9HmflkadcB6pub820HV2TIuwmUeDng9ODYc8Lm5rTch8dPwRdPTnqEKCq1kbDo/P2D7H9l0N7yfqXaA7dbDQeTm63oKFwQg69EJZKMr4LguGRBRuVMV7qudWjUggUn1p77Af00M5II/cOWY9hAVLBNdzKYsuYj/9v8gMXEUEcHYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7kpl2Gu2/46k2QYsEW0z1PNQmta++j8jQxdwdx//s0=;
 b=SI0cbOPZnPaog1pyDojFa6a1fkTQ8NoHA9OdeTDWry1BHEI8JUiCkoRIaQ/9ZkwSKErA9wqKMnDKmK3k+ynEaUaCgwy6ZO5HzTirShhLxegiAERh07gdtFJQ2PQh5k4O9Dn9U2ZmVqG3+6D9sK2RDEDNU8a1Ws92EM4TwjMAOb0WvtI0BZNfkf0qhLNkfcGNAw90BK/VDwOjPoFKqw9Qi6yXXKiGV5e0rBTz8WDdFRlgIL/AWLlM4JiCrjQS+KVFozU9eyitYDu7yRzN8W/io2oXrOJQh2X0RZs2/RUKxDqPKUl546nAY+m3DSgbfpm8XxYVqhwNbJLQq5bQHNzwiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7kpl2Gu2/46k2QYsEW0z1PNQmta++j8jQxdwdx//s0=;
 b=LAbg4yShLgnpwx5Co1amIx1uRmbV+cPznR8RcKn28plmSX04D4LvyUjPYkOOcSz9dM0zsoksU7AMKy7CynvRDetun/3Y1NZN6Y4CcA1O11QgsJJRAV78I7RyrooDDvyglbY2m/vcLOTTNDfw9iOwYxRkPuYgWB+fGuv0RlXf9uw2ObHQYA1wMn0+vcgd/indqhwm9qb/XKJGrI2Cn1oPpx/qxze9KZlyFJFqCvKZ0P2y/cCAJphkxE7WwFbidbZGer8mtuaJENgyTn3df8XPdtEMeouFlIEn5U6id1w6wKhyjW9ioERu2jjViI9nYUaTF6PyKaB27ugGXrtCLAOWhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU0PR04MB9370.eurprd04.prod.outlook.com (2603:10a6:10:359::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Fri, 10 Jan
 2025 16:55:34 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8335.012; Fri, 10 Jan 2025
 16:55:34 +0000
Date: Fri, 10 Jan 2025 11:55:21 -0500
From: Frank Li <Frank.li@nxp.com>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Saravana Kannan <saravanak@google.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 0/7] usb: dwc3: qcom: Flatten dwc3 structure
Message-ID: <Z4FQ+XQYS7tpHs9b@lizhi-Precision-Tower-5810>
References: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
 <ZrugxSqzhzxvVqV3@lizhi-Precision-Tower-5810>
 <ZwWRieC0D3Q13VW7@lizhi-Precision-Tower-5810>
 <ZwXweChRh5bjc1nS@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwXweChRh5bjc1nS@hu-bjorande-lv.qualcomm.com>
X-ClientProxiedBy: SJ0PR03CA0224.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU0PR04MB9370:EE_
X-MS-Office365-Filtering-Correlation-Id: 88888677-9c34-4745-51d5-08dd3197979c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TxONgi9t4QMU2o4ht4WsIFqCQQSkRYlO1pErRTqjz64KPGF9CWdt/W3864bT?=
 =?us-ascii?Q?uVHVfhDX9DZ2qtj5ZoHOUyN+AoM1ac9ldLto3Ans8cfuUNOSk2vVuo+ozbeQ?=
 =?us-ascii?Q?WyTJXwu6EE5iwXH0ygsH3uiNCKEZ/g9CN0uCkxUYqC2YRkV1kWzx89gflxfn?=
 =?us-ascii?Q?J3LmrltPLhBmWce8ylaTWxR0+ua8DC2GdBotBVVfP7T+zm1+J5zbbc3spZLN?=
 =?us-ascii?Q?LC2lSGiyt5n3b9sEUjsuW8wU8VWvBdsMkWb4SGZJJ2+dIYi1VsnrXpltK6Qx?=
 =?us-ascii?Q?MXwN4+niCX6cXjjS7IzJ/vcCJEY+RC1574uPb26jpX3G+ATKW+6OPsfDi1Q5?=
 =?us-ascii?Q?3d5yeuJoe/eVK40PsTHCgSFBZu/d9Cunnu5Gw8bvxSngwFDI5/zfKAPpiv+V?=
 =?us-ascii?Q?u/lm0Y9caoTikfKdFZw2u1XfaWd3FHp44CuDYM15r4Qe5PgdZVOe7xdtW3qg?=
 =?us-ascii?Q?aemv+tqK4NMVc1pznN9T9vdHmoKBj8OsDkNdjDqhDqVxEjZx2aki0UIsS7pv?=
 =?us-ascii?Q?gEV/gRw8BjGV6gfZdj0d9uBPHQBDpRfATkQ+eGpitYyjc5I/rjALp6nHlGa3?=
 =?us-ascii?Q?tfxzA01le7YARBFTmYjHJfsk5UTVIZTRjpBY8nuHOh4+r9lR9+Z6PRh4bpYt?=
 =?us-ascii?Q?BAdSSzN0FJYSvcApLt4Dw3s0to7zGvBErb9h6AlUPeTcB5AKd9UHZ+0iFewK?=
 =?us-ascii?Q?9gf29NVOsYjfWrRvjsd3dYlrsWgAxNHnAdCIx7iRnkJ7DNwRWXskOgWp6AB/?=
 =?us-ascii?Q?qKph6fkxV8/RPlFt8cwHXCmpiRPSGZt9qnajiF19f5mFz3ENp9NW8x3YC4R/?=
 =?us-ascii?Q?xkPIuw8Yv5S5l3AOQw2eZXBzjh0OjbU541CVNu6s1c+FpR641cBeBoWQuyzI?=
 =?us-ascii?Q?tuuyibkvfy2apDPGgHxmXaPXWf6hdw4r88YLyebeoD3ts19CIU6U4Ja7JvZ0?=
 =?us-ascii?Q?0EQPSmcovQ4ZdwEfTB0n46PoMkUuw8HB9YcQZ62mnVDQo0JGV96mtudCi5f0?=
 =?us-ascii?Q?Wd+w7+HJEUZt/S6RAM63HqaBWbNHQ91EZnNwtoruvUGROTlX2g0ydDArds/r?=
 =?us-ascii?Q?6kUQHIvDXJWVIU0bmscDgz9vFpdMcQFWtUyAjDcQYTMcDHHL7tTGhc54KTPj?=
 =?us-ascii?Q?wofX54irZQgnHKmxlojfFlxIqh6LYeI2W0WCs6a+IukaQiL8FPUhBs+5wmiV?=
 =?us-ascii?Q?Vx3UR1DeB5HC8HBz9oc64NO6NeTmdRFlecvQ34tPJzzDCVxa9Fehrbkw3IWX?=
 =?us-ascii?Q?1kKKeG2ixiQ1NM5XLu0CcA+F2SXgJLQK8VvoPNjFzAn8V5cpMEf0SGzovfua?=
 =?us-ascii?Q?2ospGx/bUC/LKabQU8N4O7MNRjfpajdJq/SckkXN8Evgx0cY9OtEbgy31Zak?=
 =?us-ascii?Q?0175oaoarG/zHeSobtRtlHbzNPKqJbgS1kGQ80sbJp/DI7muaMXIWJ0oUfNK?=
 =?us-ascii?Q?bQ4soIfcgMILVIJRcqG24O+6ZBc0houO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ih3X9SBn3vRwSVjLFfqh5wK99dbecQeqnpzNDHn1L0eYbOSXMJIMfiI9jpV3?=
 =?us-ascii?Q?wZodw57jIhA0yjvn1f+8o0xHCSVilgy3cOxWCHSp70TgReTNxs5CHKukstUo?=
 =?us-ascii?Q?d7me9C3BjtQxKDJEp1IIjUIQRfBmVYm+TOlx/Y6IgAMGXgGZ2GPlmR3qccUq?=
 =?us-ascii?Q?HPKExfb/DnHfcEwuZ58PiJs7k+xChdg1riSxhQ16n6l2006eX9TPt7BObk+4?=
 =?us-ascii?Q?H1/UfceANoj7Uy+nhznydh1eyO+oA22WO5PGxJjMgAJbTiuuZzsOwYxPP2vl?=
 =?us-ascii?Q?BLaw+x9iFHi5FJX0CJHCHpyC5W0GunxikWK8xYSQwV6mfbW2he0y5g6bFQVo?=
 =?us-ascii?Q?27hTqLQX0hRn4Wd96fsgTeKQ2bnHzCM/Re7Fa8Ja9j/ys9c9iIhOVe8scui1?=
 =?us-ascii?Q?MCB5ERQQnwZA+hsLXbD0M383HlmBpvKq5tof3tCg6W7dttruGy4HC4bDx9eY?=
 =?us-ascii?Q?oWqPsB4JqHrCrmuT9chfkzdGW9gARW3EATTuMC+VEzqlxYm2RM0lCeiu+SIw?=
 =?us-ascii?Q?YWv6c9Qtum84x/tzfZpVzf2Bm4Jsz4txqaiUsXM4E7wyZuCjv9rf3SBeSMRJ?=
 =?us-ascii?Q?6Alf4jTKoEis3Oc4xOdEdx60dCpFu6YuWvY8gZMxEoa2Gw3JFV8lMtXR7Hlo?=
 =?us-ascii?Q?y2Pi3XFE5QlWx5E8hI5bZIfvfD3HjIXPnYFIPOZ0WdTMTuC/vJBjkuEGSpAI?=
 =?us-ascii?Q?7eGaQ9nvLr+EgW35B5vgnsEZIAmdvkZBzCzn6PtrCO0zswjUnzle2tXJ2Fjo?=
 =?us-ascii?Q?YjuMtQVIU3lZ1WpitRKnrTBrh+4+DCNE/fpgulIT9aWWgiPNBU9zKwebWMvC?=
 =?us-ascii?Q?VkCMT+0wXoW0LaNC+t/18NwkGgWVJsJkFX1nymh8Sas7Q/TkEXgNT+GVfreh?=
 =?us-ascii?Q?8Bzk/3IhDmmFEKn9LyXCEjEznQFEJa0U1/Jn2K//zcF+ePNpG+XhooYXJe+S?=
 =?us-ascii?Q?BkcrG7r4DD1D8no9XFWs6pF7irQWVSWNbDJJW/kCcrIWsnAtH2b3SUvgkBDX?=
 =?us-ascii?Q?2PES+z0JHjhc7zS0paY+K90Ur1FYw6YXyYneBAjxT3br6EcmJTZ9xKwhT/D3?=
 =?us-ascii?Q?/vvNFfrHV7ecTykjI8huZU4AH6USMofNSpnmBrd1mJ+ooMGME9or2ut+P4uf?=
 =?us-ascii?Q?07WEylohLCYs19qQ3K+4hePd9Bpl3YJGWgRyBqR5PXj3CBTHyY3CY5Xvmdes?=
 =?us-ascii?Q?ZJ74OVtOtNbJztW8F26PuqRTwjMsWlRbpAwiumntcnm2Pvxko6/cEEGLVHlu?=
 =?us-ascii?Q?XBQ8QIEbHhPe9X/xH7THB7I9RCOCIBa4NBHTbZE5/pcsxw4sFzbBucDSZVu4?=
 =?us-ascii?Q?+LvYeSenlRmzpFgfSMzptW6JqQ+MCVYXf/YdewxKIAW9QT3BxZHZ7Lp43uYR?=
 =?us-ascii?Q?9/Ct2toVO36Ncthu30MTqVNF53kvoLBigrJIEdQJbNoaylji2nkK5K6Ap85z?=
 =?us-ascii?Q?Bqewzy575gB+cgw+Qet4Tvpif+NWgpWf8tAwBjExCXrrShRLYu7eZn/rofjz?=
 =?us-ascii?Q?wZv3X1fY/EmPkLkIeI4Tr11hL6YBFfbApVHVukHTIoiMvFqagHIEVVLMPXZo?=
 =?us-ascii?Q?cPVUqJ1BDEGHat3Y0R0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88888677-9c34-4745-51d5-08dd3197979c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 16:55:34.2648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vTJwmW8bbnDcX7kS4biXbwqI0UO+fMyhVSOABph/DznMRdm3kkwKxpMCBYqzumV+0qJ4ZDPUeo4OT5Gg+kkbHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9370

On Tue, Oct 08, 2024 at 07:54:48PM -0700, Bjorn Andersson wrote:
> On Tue, Oct 08, 2024 at 04:09:45PM -0400, Frank Li wrote:
> > On Tue, Aug 13, 2024 at 02:07:01PM -0400, Frank Li wrote:
> > > On Sun, Aug 11, 2024 at 08:11:57PM -0700, Bjorn Andersson wrote:
> > > > The USB IP-block found in most Qualcomm platforms is modelled in the
> > > > Linux kernel as 3 different independent device drivers, but as shown by
> > > > the already existing layering violations in the Qualcomm glue driver
> > > > they can not be operated independently.
> > > >
> > > > With the current implementation, the glue driver registers the core and
> > > > has no way to know when this is done. As a result, e.g. the suspend
> > > > callbacks needs to guard against NULL pointer dereferences when trying
> > > > to peek into the struct dwc3 found in the drvdata of the child.
> > > >
> > > > Missing from the upstream Qualcomm USB support is handling of role
> > > > switching, in which the glue needs to be notified upon DRD mode changes.
> > > > Several attempts has been made through the years to register callbacks
> > > > etc, but they always fall short when it comes to handling of the core's
> > > > probe deferral on resources etc.
> > > >
> > > > Furhtermore, the DeviceTree binding is a direct representation of the
> > > > Linux driver model, and doesn't necessarily describe "the USB IP-block".
> > > >
> > > > This series therefor attempts to flatten the driver split, and operate
> > > > the glue and core out of the same platform_device instance. And in order
> > > > to do this, the DeviceTree representation of the IP block is flattened.
> > >
> >
> > Bjorn Andersson:
> > 	Any follow up on this thread?
> >
>
> Thanks for reaching out, Frank. I did pick this up again a few days
> back.
>
> I'm struggling with Rob's request for not peeking into struct property
> and/or utilizing overlays. Hoping to figure this out shortly, so I can
> get v3 in shape.

Bjorn:
	Do you still work on this? Or I missed somethings.

Frank

>
> Regards,
> Bjorn

