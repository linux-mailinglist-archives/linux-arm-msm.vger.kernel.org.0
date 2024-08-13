Return-Path: <linux-arm-msm+bounces-28412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCB5950C5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 20:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 066D428148D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 18:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825461A38D9;
	Tue, 13 Aug 2024 18:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MUXu9shs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012043.outbound.protection.outlook.com [52.101.66.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD4F1CA89;
	Tue, 13 Aug 2024 18:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723574051; cv=fail; b=H1OyvSbEwA+jF/SrSKXW6ZUHEzdYg+ctrBMII3FXOfcVvfJz1rBXspwGxw9w3lm/U10yNGmbKCa9gdwBIpbUdT5FzdmgXDWsTVCA2BnK2SwpC9twdgEwHbBti7RHkmrHelBep9Gafyft6fqeDt9+63NfTABs5G2cEJubBEcFgao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723574051; c=relaxed/simple;
	bh=0JNdNfMWt/C1uudp1OaHMeubApFKuEVI6qRbwpLyzP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qCzdyrN9T3tc43i/aiN4ID+NJI/ZQVLoGnfGLI6iumGOkZYVGRXINzRrCuh3QIt/hNIIIKKmanTUiCTlwtPXdrE5vobhJDfbzrcPe13N8K9ykMSKRKeUgSsiqfzYIxT7v3m18GtkWBLyar6YK4UYLn21J2rFcHKzNstg23g7GGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MUXu9shs; arc=fail smtp.client-ip=52.101.66.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Os25/ykrWa0FL7o1l3uyM+ZzUsR0Ho6oefuFEDpuz69T463W4wdErL0dsfjN5Xquqxy6L2YToknhmquf5zV2vNi69mRWNvNNoRo464mYOez4YzjJ/66uCl9Zr7kqRBhXwhevFeHD1/IUR92RinU6MOKoKEnA+MTDZwNY3T4lB6buv+EH0mLlvzUvSYHSCfpETAAKrHJZDei5+/UwBo5VkTTgJNQTTVvkyVJT/O86CYuYxOysdmYu2iui2Ond9qJAPklDrmMir9YBujerKcvYRSeUT69+4lOBFGHTx27BMHT8xXS4kd8D3XzYYtDEQcTELiFa5DbZNCv5am0frkKLwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpBXpjyPxe9JDu50FuD0iTxcOYipxIuNvMbSeCLo2I8=;
 b=sALJUMYJIF51bO0zEE/ttpM5VFIr6PGecVLjdsbX8gHw/akN1Q/tESUeru6FQ+45KPA21rIuu9+K2aoSjwYxigGTQvpforPuCkp5zdQEpBE2UopRHNJ9pvM3qqXbsOcvy7AtyBPN6Jf5WRq2bfREmCsOS4iduunqHsmri7RVZTAORecTrCjBqsH06wm508xh/Fh1ZV7z52PC22Mt4w1X1Wbusu2OebZ4IQfLm2pJCQgD698EoiGQ50TcVT0GNai9zvd5Q9jLyhcwmc6HIv79N1prsi7vDEyKDl2bBzN/QJNAHIJOoZFuzq6vEGJIuk0I39LYe9bIN0JY024yiN0cVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpBXpjyPxe9JDu50FuD0iTxcOYipxIuNvMbSeCLo2I8=;
 b=MUXu9shsF6/zZHg8Ti8pyovCOgBQOGLKJQSJrUTU+drqwgXX526z/4ut28+b7IF41OiCPp580211NMrPXeUfyCmvoCJmkYNzyMUFip3aNzvC9CrYbMPjHOPIxwUV2LhaKcCiYiZB987By4B5zgN3FF8ogK3JZ1u3axtMeb4b7uxdjkQdAfuGBisJiwJsWKFrAtRjZBFqn3vXRjGOk+XC2MuY9zpk6NO1TUSg9l+o7IPaohA4iw0qyPCZll3dWKGyiFV1cNB41m0w2fn1A17shdcHWzGG2ntymhg3lBbfjWOlTXTIejNng0Kvunq6nEZ28lWLffFdK/VdIPdYIjGvCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8745.eurprd04.prod.outlook.com (2603:10a6:20b:43e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Tue, 13 Aug
 2024 18:34:05 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7849.019; Tue, 13 Aug 2024
 18:34:05 +0000
Date: Tue, 13 Aug 2024 14:33:56 -0400
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
Subject: Re: [PATCH v2 6/7] usb: dwc3: qcom: Transition to flattened model
Message-ID: <ZrunFEOV5/aM4G4U@lizhi-Precision-Tower-5810>
References: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
 <20240811-dwc3-refactor-v2-6-91f370d61ad2@quicinc.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240811-dwc3-refactor-v2-6-91f370d61ad2@quicinc.com>
X-ClientProxiedBy: BYAPR06CA0072.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::49) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: d98bb2bc-8d20-42c5-043f-08dcbbc682f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l885uMW6N56SWiwDm2PSmxz/XXdvQL2uroCGfuNwdly4OtJwakm4xQuTX2OU?=
 =?us-ascii?Q?nlGSP+cpOUXkhrS/VT1UzmzPAthwrjXOiNJcV56jMkfGRgfBl5L2Rc862e7I?=
 =?us-ascii?Q?BZntULlGxRe3NYbYgt7WMg2u9LiOv3F0FkmG1+g8cQ4Ug/OpwH+dF4A7R4X/?=
 =?us-ascii?Q?O4KVMqLwUgydbONuRB0biF40YYyOtRL82hr4w9QC8YBehcDjJi82HVok178r?=
 =?us-ascii?Q?JUxjffkEKwjGQZMVHYGtJ4saL1C91va0iwjrFuSOJ4zFg4GZ3vfxcdx6huiM?=
 =?us-ascii?Q?d19ReLwPlmJsV3NB62sAbMef+P/29SQqLUgiUeTEnfB9hG+V89J1yZEOmLm8?=
 =?us-ascii?Q?dDHBnKRghZXzxQuWr0aeqgDzX8SIsEc3x1czyi5U+FO8DA94iJdMCAWU5+7a?=
 =?us-ascii?Q?hPOjbkMomS5cQn+cpB2+G0Uuu580WXBoY5Ac9F3VgqnOG89huw+rK7H1gEe7?=
 =?us-ascii?Q?AA2jxc3n35ASLp0IBNbuL2I9CZPW5nLgtH6hKTZPfBdvuln/VkvQtPNVGF8j?=
 =?us-ascii?Q?q/0Z5pdktHsazk/FKGjGSKsXenGEiMWO6HwCDniUw3uyNO/YV2ZKQJu3PN2b?=
 =?us-ascii?Q?cG9A4frp+hBZCxDrHenqFZbG2cHeTskr+sUsNTeRq+ZMotbappVBJYExEz+s?=
 =?us-ascii?Q?YdU8jOqJSPeTcpBM1S6yfRz7DuSNp57ZgcOpJNIGRsWQXJrBVMb0oVU99B1L?=
 =?us-ascii?Q?LrWTE5n2lNc+DWIBNal+5AjmQpq9C7q0qFvIINUsvqYuk6lEod7r0ZmJYe8D?=
 =?us-ascii?Q?XVR/LRgG6qyr8xacrqluZp52qqgN+cxd/5ZO8/tQb5Mqde0HbUm8d4kejKaG?=
 =?us-ascii?Q?pQkiPDfnq5XNuC1UlINGdjDtwizzeErI/CBSx0w5+I0MXrA8wEzqe/rYXoDW?=
 =?us-ascii?Q?5mXLMT0DYTMeAINbHa0cg+usZC0ZBcCYhl5K6z7/rFlWjNRMz8Wea0HMoLFo?=
 =?us-ascii?Q?oYhj6CePvFgFSe3NFAc++iutuVOWw5pbTy3uH2d6DQ5VARkqRT5ERRl5VCVS?=
 =?us-ascii?Q?l28d43AjoycdjXcEvIA4NkAxSCV1aZ9jdjJjyPM5F1+S5imjiNADEjvVDLs8?=
 =?us-ascii?Q?zIjbefJgb8jT3cJzlde85ydU27wCESPNJOX64tDyrHix9wucKBfKZ/qeJGHL?=
 =?us-ascii?Q?C94UmO4Iokjh9AT2XR7f1DPqgAvsBZav25AvrkYbMFCmoUf6+xti0lTLigh6?=
 =?us-ascii?Q?15hyWg6HMOVknwvpkO7gAK3k3S+BTUkgqmmtwUaU1fyAWCQFJukwqC2Ze0Xw?=
 =?us-ascii?Q?77bu/D6zJrmkf0VNoQrHpI3l+0x+OaKNQ8928VF5xxXj7Ka4rgEBcGn34RIJ?=
 =?us-ascii?Q?r0ZXZnmNAvgYE22uPYrALczOUXTFOXELeN3cmxVh7tISxpF3iOXHdhtnRiz2?=
 =?us-ascii?Q?DkJgDrfxmZ+Hxy0r83/uQmeRzFPAjWzMB+RNA0M0snckgHvqew=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mBqX6kN2W90ny2hq0iOn67MUG2wYSnjx1aJpGv+Q5r6cngwQh0lziuvMPQ0l?=
 =?us-ascii?Q?Paa4YNELL1obVNUdt5+6/CrHloGOz1mYzWCFTzHNHyBCueFVUlBYNjerkzlw?=
 =?us-ascii?Q?+9ZnuBVa5/09W0Fwia888IiFRfVFs1puc9W+5p9BitT8EZnkPQetFFyMr/Q7?=
 =?us-ascii?Q?raWn1CzjvzZHnPLT59lSeksa7xqGo0AmdmdtFBvn0SA6GO6TaaWWn46bG/6W?=
 =?us-ascii?Q?Dse3k9E3Bhep80Cw2RPuTolCrG+kC1CwLLCtLe0jzPSPnQ+5tcCrrd4HMm7a?=
 =?us-ascii?Q?wKCyT+cRvy+/a6xqrQbOy7k/0W1kmpEjAXYLyPqu2Rwep9jnIBveAY3l2IEB?=
 =?us-ascii?Q?M4k9FLgFRlfVrKj9eLjXbPQ0tEdOSwU7CJ9K1rET36GweUZY/bG25zWNQ/PH?=
 =?us-ascii?Q?nIoHXH++3BXUJ8+cYfq/WMEzX0G73nFbX3pVsn3LW6YIOF0GQQI9JOjkqtuX?=
 =?us-ascii?Q?wDyOhXuRnJuugbR4A4PB4B8p5eQAKJeEh+maxMc+kOn2ooi7GSji6bLIXh8G?=
 =?us-ascii?Q?uP2YixKOw3woalBTQCgQhOA/Sf4fsMrOeQTGrZtuF+0DmxjRou3w56CPGM+D?=
 =?us-ascii?Q?13KMbFsGbGArevyB+y4sPiJ3trZ0oPN8deARYNyf/9ZvsYzlZf1WRP654cAx?=
 =?us-ascii?Q?efmfuzprwa6PIxzszgqLts4GcYqL5XPARTziKoz8FUMJ4ZpZXOf163rWbXS7?=
 =?us-ascii?Q?fGlXtP6BzjKxaeGxLxVzor89tSYn4xmzaSwL1/+rZ9t+JF5IDEr/eyJ+rfTk?=
 =?us-ascii?Q?EhqRk1UpTbS/6z+H3Jc7PdtH1C8dxHINg/1oviNM3f9pHB9+jmTMqfgwuqrF?=
 =?us-ascii?Q?pwa1CpFuCJBiGOSq8bWdiS/UPoKY61yNxt2uucSZ5HSye/waGG3P7+IUGqtp?=
 =?us-ascii?Q?WeX4NPZnXyhlFl8HC6Mg1etLtH+l5/ETLGDDNJS0Jmh/jmHmuSZZ+6ZzekC1?=
 =?us-ascii?Q?mCKyFLrlte/4BvpP33cv32QLPuDWgMxfAAKoO0NWpwcpX2nWZB+5qLtl2/4y?=
 =?us-ascii?Q?vpEH0bz/mf05jUAaqLZHYMbJuTUnsAtpIYMBk0rAtiEj9r6o8+HdKREB+tvH?=
 =?us-ascii?Q?+A3isuO9boQm73Cq1QKJF/1FlpmjOOsNviSfvWR9d/C8rCm+ooh7k3UP8tA7?=
 =?us-ascii?Q?3rkuM40JjqwrcoT7RemLCNXQD0r1S2UUYvriNHy/T5NO7kyRhQHhOcDCJPAh?=
 =?us-ascii?Q?K0nv+LsYcWXablGpzdHmxxNMjAc526z/hKSadqRoarmIUhYP1GnhsGU4M77x?=
 =?us-ascii?Q?vvJgvR0c7gvg9CdJOQK7R3XnTP2Q+v+rxHj+3mU8csQIYUw17wlmMgv6/jIg?=
 =?us-ascii?Q?xmHoQ+Jsu/3EwWeePDppBB+sudwqsXp/AxpDj3lwfu9F07aNAgIK2aqUWKoR?=
 =?us-ascii?Q?1truWf/gYWzJqOIJmG8KLkfIy3jrVpRQBfkJTQUYN9NJn/MFL8m0FugNFhdW?=
 =?us-ascii?Q?D7DwGHmKy47SyBGKzmGCkgTW955nw+m4BjIBLFhW+HyG4/OkiwoIguWW/tZH?=
 =?us-ascii?Q?4MrxkBd93+bZKi56sDoCx1zcF/DU4fScIwJdlwaqCDkml3IEAMHTGv+OCGIC?=
 =?us-ascii?Q?ICpfV/1aM/ZrThgakre8L4jxjEZ8tDjrQZAl8XRx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d98bb2bc-8d20-42c5-043f-08dcbbc682f5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 18:34:05.7374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p8UvwWQSD8epYPbGeZpg2etPk5CtYB/ug9kP7GaEHRAGtqADVOcz+X1orIESdNdlzTzwr7lcd5T8EQ6g+8Go9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8745

On Sun, Aug 11, 2024 at 08:12:03PM -0700, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
>
> The USB IP-block found in most Qualcomm platforms is modelled in the
> Linux kernel as 3 different independent device drivers, but as shown by
> the already existing layering violations in the Qualcomm glue driver
> they can not be operated independently.
>
> With the current implementation, the glue driver registers the core and
> has no way to know when this is done. As a result, e.g. the suspend
> callbacks needs to guard against NULL pointer dereferences when trying
> to peek into the struct dwc3 found in the drvdata of the child.
> Even with these checks, there are no way to fully protect ourselves from
> the race conditions that occur if the DWC3 is unbound.
>
> Missing from the upstream Qualcomm USB support is handling of role
> switching, in which the glue needs to be notified upon DRD mode changes.
> Several attempts has been made through the years to register callbacks
> etc, but they always fall short when it comes to handling of the core's
> probe deferral on resources etc.
>
> Moving to a model where the DWC3 core is instantiated in a synchronous
> fashion avoids above described race conditions.
>
> It is however not feasible to do so without also flattening the
> DeviceTree binding, as assumptions are made in the DWC3 core and
> frameworks used that the device's associated of_node will the that of
> the core. Furthermore, the DeviceTree binding is a direct
> representation of the Linux driver model, and doesn't necessarily
> describe "the USB IP-block".
>
> The Qualcomm DWC3 glue driver is therefor transitioned to initialize and
> operate the DWC3 within the one device context, in synchronous fashion.
>
> To handle backwards compatibility, and to remove the two-device model,
> of_nodes of the old compatible are converted to the new one, early
> during probe.
>
> This happens in the event that a DWC3 core child node is present, the
> content of the reg and interrupt properties of this node are merged into
> the shared properties, all remaining properties are copied and the core
> node is dropped. Effectively transitioning the node from qcom,dwc3 to
> qcom,snps-dwc3.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 310 +++++++++++++++++++++++++++++++++++--------
>  1 file changed, 251 insertions(+), 59 deletions(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 33de03f2d782..27b5013cd411 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -6,6 +6,7 @@
>
>  #include <linux/io.h>
>  #include <linux/of.h>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/irq.h>
>  #include <linux/of_clk.h>
> @@ -13,6 +14,8 @@
>  #include <linux/kernel.h>
>  #include <linux/extcon.h>
>  #include <linux/interconnect.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/phy/phy.h>
> @@ -22,6 +25,7 @@
>  #include <linux/usb/hcd.h>
>  #include <linux/usb.h>
>  #include "core.h"
> +#include "glue.h"
>
>  /* USB QSCRATCH Hardware registers */
>  #define QSCRATCH_HS_PHY_CTRL			0x10
> @@ -72,7 +76,7 @@ struct dwc3_qcom_port {
>  struct dwc3_qcom {
>  	struct device		*dev;
>  	void __iomem		*qscratch_base;
> -	struct platform_device	*dwc3;
> +	struct dwc3		*dwc;
>  	struct clk		**clks;
>  	int			num_clocks;
>  	struct reset_control	*resets;
> @@ -259,7 +263,7 @@ static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
>  		goto put_path_ddr;
>  	}
>
> -	max_speed = usb_get_maximum_speed(&qcom->dwc3->dev);
> +	max_speed = usb_get_maximum_speed(qcom->dwc->dev);
>  	if (max_speed >= USB_SPEED_SUPER || max_speed == USB_SPEED_UNKNOWN) {
>  		ret = icc_set_bw(qcom->icc_path_ddr,
>  				USB_MEMORY_AVG_SS_BW, USB_MEMORY_PEAK_SS_BW);
> @@ -302,25 +306,16 @@ static void dwc3_qcom_interconnect_exit(struct dwc3_qcom *qcom)
>  /* Only usable in contexts where the role can not change. */
>  static bool dwc3_qcom_is_host(struct dwc3_qcom *qcom)
>  {
> -	struct dwc3 *dwc;
> -
> -	/*
> -	 * FIXME: Fix this layering violation.
> -	 */
> -	dwc = platform_get_drvdata(qcom->dwc3);
> -
> -	/* Core driver may not have probed yet. */
> -	if (!dwc)
> -		return false;
> +	struct dwc3 *dwc = qcom->dwc;
>
>  	return dwc->xhci;

dwc only use once.

	return qcom->dwc->xhci?

>  }
>
>  static enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom, int port_index)
>  {
> -	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
>  	struct usb_device *udev;
>  	struct usb_hcd __maybe_unused *hcd;
> +	struct dwc3 *dwc = qcom->dwc;
>
>  	/*
>  	 * FIXME: Fix this layering violation.
> @@ -497,7 +492,7 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
>  static irqreturn_t qcom_dwc3_resume_irq(int irq, void *data)
>  {
>  	struct dwc3_qcom *qcom = data;
> -	struct dwc3	*dwc = platform_get_drvdata(qcom->dwc3);
> +	struct dwc3 *dwc = qcom->dwc;
>
>  	/* If pm_suspended then let pm_resume take care of resuming h/w */
>  	if (qcom->pm_suspended)
> @@ -699,34 +694,198 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
>  	return 0;
>  }
>
> -static int dwc3_qcom_of_register_core(struct dwc3_qcom *qcom, struct platform_device *pdev)
> +static struct property *dwc3_qcom_legacy_prop_concat(const char *name,
> +						     const void *a, size_t a_len,
> +						     const void *b, size_t b_len)
>  {
> -	struct device_node	*np = pdev->dev.of_node, *dwc3_np;
> -	struct device		*dev = &pdev->dev;
> -	int			ret;
> +	size_t len = a_len + b_len;
>
> -	dwc3_np = of_get_compatible_child(np, "snps,dwc3");
> -	if (!dwc3_np) {
> -		dev_err(dev, "failed to find dwc3 core child\n");
> -		return -ENODEV;
> -	}
> +	struct property *prop __free(kfree) = kzalloc(sizeof(*prop), GFP_KERNEL);
> +	char *prop_name __free(kfree) = kstrdup(name, GFP_KERNEL);
> +	void *value __free(kfree) = kzalloc(len, GFP_KERNEL);
> +	if (!prop || !prop_name || !value)
> +		return NULL;
>
> -	ret = of_platform_populate(np, NULL, NULL, dev);
> -	if (ret) {
> -		dev_err(dev, "failed to register dwc3 core - %d\n", ret);
> -		goto node_put;
> +	prop->name = no_free_ptr(prop_name);
> +	prop->value = no_free_ptr(value);
> +	prop->length = len;
> +
> +	memcpy(prop->value, a, a_len);
> +	memcpy(prop->value + a_len, b, b_len);
> +
> +	return_ptr(prop);
> +}
> +
> +/* Replace reg property with base address from dwc3 node and fixed length */
> +static int dwc3_qcom_legacy_update_reg(struct device_node *qcom,
> +				       struct device_node *dwc3)
> +{
> +	int addr_cells;
> +	int size_cells;
> +	u64 dwc3_addr;
> +	int ret;
> +
> +	ret = of_property_read_reg(dwc3, 0, &dwc3_addr, NULL);
> +	if (ret < 0)
> +		return ret;
> +
> +	addr_cells = of_n_addr_cells(qcom);
> +	size_cells = of_n_addr_cells(qcom);
> +
> +	__be32 *reg __free(kfree) = kcalloc(addr_cells + size_cells, sizeof(__be32), GFP_KERNEL);
> +	if (!reg)
> +		return -ENOMEM;
> +
> +	reg[addr_cells - 1] = cpu_to_be32(dwc3_addr);
> +	reg[addr_cells + size_cells - 1] = cpu_to_be32(SDM845_QSCRATCH_BASE_OFFSET + SDM845_QSCRATCH_SIZE);
> +
> +	struct property *prop __free(kfree)  = kzalloc(sizeof(*prop), GFP_KERNEL);
> +	char *name __free(kfree) = kstrdup("reg", GFP_KERNEL);
> +	if (!prop || !name)
> +		return -ENOMEM;
> +
> +	prop->name = no_free_ptr(name);
> +	prop->value = no_free_ptr(reg);
> +	prop->length = (addr_cells + size_cells) * sizeof(__be32);
> +
> +	return of_update_property(qcom, no_free_ptr(prop));
> +}
> +
> +/* Prepend dwc_usb3 interrupt to relevant interrupt properties */
> +static int dwc3_qcom_legacy_convert_interrupts(struct device_node *qcom,
> +					       struct property *dwc3_irq)
> +{
> +	const __be32 *interrupts;
> +	struct property *new;
> +	const void *names;
> +	int interrupts_len;
> +	int names_len;
> +	int ret;
> +
> +	if ((interrupts = of_get_property(qcom, "interrupts-extended", &interrupts_len)) != NULL) {
> +		struct device_node *parent __free(device_node) = of_irq_find_parent(qcom);
> +		if (!parent)
> +			return -EINVAL;
> +
> +		__be32 *value __free(kfree) = kzalloc(sizeof(__be32) + dwc3_irq->length, GFP_KERNEL);
> +		if (!value)
> +			return -ENOMEM;
> +		value[0] = cpu_to_be32(parent->phandle);
> +		memcpy(&value[1], dwc3_irq->value, dwc3_irq->length);
> +
> +		new = dwc3_qcom_legacy_prop_concat("interrupts-extended",
> +						   value, sizeof(__be32) + dwc3_irq->length,
> +						   interrupts, interrupts_len);
> +	} else if ((interrupts = of_get_property(qcom, "interrupts", &interrupts_len)) != NULL) {
> +		new = dwc3_qcom_legacy_prop_concat("interrupts",
> +						   dwc3_irq->value, dwc3_irq->length,
> +						   interrupts, interrupts_len);
> +	} else {
> +		return -EINVAL;
>  	}
>
> -	qcom->dwc3 = of_find_device_by_node(dwc3_np);
> -	if (!qcom->dwc3) {
> -		ret = -ENODEV;
> -		dev_err(dev, "failed to get dwc3 platform device\n");
> -		of_platform_depopulate(dev);
> +	if (!new)
> +		return -ENOMEM;
> +
> +	ret = of_update_property(qcom, new);
> +	if (ret < 0)
> +		return ret;
> +
> +	names = of_get_property(qcom, "interrupt-names", &names_len);
> +	if (!names)
> +		return -EINVAL;
> +
> +	new = dwc3_qcom_legacy_prop_concat("interrupt-names",
> +					   "dwc_usb3", strlen("dwc_usb3") + 1,
> +					   names, names_len);
> +	if (!new)
> +		return -ENOMEM;
> +
> +	return of_update_property(qcom, new);
> +}
> +
> +/* Copy property to qcom node */
> +static int dwc3_qcom_legacy_migrate_prop(struct device_node *qcom,
> +					 struct property *prop)
> +{
> +	struct property *new __free(kfree) = kzalloc(sizeof(*new), GFP_KERNEL);
> +	char *name __free(kfree) = kstrdup(prop->name, GFP_KERNEL);
> +	void *value __free(kfree) = kmemdup(prop->value, prop->length, GFP_KERNEL);
> +
> +	if (!new || !name || !value)
> +		return -ENOMEM;
> +
> +	new->name = no_free_ptr(name);
> +	new->value = no_free_ptr(value);
> +	new->length = prop->length;
> +
> +	return of_update_property(qcom, no_free_ptr(new));
> +}
> +
> +/* Move a child node, with it's properties and children, from dwc3 to qcom node */
> +static int dwc3_qcom_legacy_migrate_child(struct device_node *qcom,
> +					  struct device_node *dwc3,
> +					  const char *name)
> +{
> +	struct device_node *child;
> +
> +	child = of_get_child_by_name(dwc3, name);
> +	if (!child)
> +		return 0;
> +
> +	of_detach_node(child);
> +	child->parent = qcom;
> +	of_attach_node(child);
> +	of_node_put(child);
> +
> +	return 0;
> +}
> +
> +/* Convert dev's DeviceTree representation from qcom,dwc3 to qcom,snps-dwc3 binding */
> +static int dwc3_qcom_convert_legacy_dt(struct device *dev)
> +{
> +	struct device_node *qcom = dev->of_node;
> +	struct device_node *dwc3;
> +	struct property *prop;
> +	int ret = 0;
> +
> +	dwc3 = of_get_compatible_child(qcom, "snps,dwc3");
> +	if (!dwc3)
> +		return 0;
> +
> +	/* We have a child node, but no support for dynamic OF */
> +	if (!IS_ENABLED(CONFIG_OF_DYNAMIC))
> +		return -EINVAL;
> +
> +	for_each_property_of_node(dwc3, prop) {
> +		if (!strcmp(prop->name, "compatible"))
> +			;
> +		else if (!strcmp(prop->name, "reg"))
> +			ret = dwc3_qcom_legacy_update_reg(qcom, dwc3);
> +		else if (!strcmp(prop->name, "interrupts"))
> +			ret = dwc3_qcom_legacy_convert_interrupts(qcom, prop);
> +		else
> +			ret = dwc3_qcom_legacy_migrate_prop(qcom, prop);
>  	}
>
> -node_put:
> -	of_node_put(dwc3_np);
> +	if (ret < 0)
> +		goto err_node_put;
> +
> +	ret = dwc3_qcom_legacy_migrate_child(qcom, dwc3, "port");
> +	if (ret)
> +		goto err_node_put;
> +
> +	ret = dwc3_qcom_legacy_migrate_child(qcom, dwc3, "ports");
> +	if (ret)
> +		goto err_node_put;
> +
> +	of_detach_node(dwc3);
> +	of_node_put(dwc3);
>
> +	return 0;
> +
> +err_node_put:
> +	of_node_put(dwc3);
>  	return ret;
>  }

Look like you copy children dwc3's property into current glue node.
Can you passdown dwc3's node into dwc3_probe(), let dwc3_probe to handle
these, Or move it into dwc3-core. otherwise, if imx want to do the same
thing, the the same code will be dupicated.

>
> @@ -735,16 +894,21 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	struct device_node	*np = pdev->dev.of_node;
>  	struct device		*dev = &pdev->dev;
>  	struct dwc3_qcom	*qcom;
> -	struct resource		*res;
> +	struct resource		res;
>  	int			ret, i;
>  	bool			ignore_pipe_clk;
>  	bool			wakeup_source;
>
> +	ret = dwc3_qcom_convert_legacy_dt(dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to convert legacy OF node\n");
> +		return ret;
> +	}
> +
>  	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
>  	if (!qcom)
>  		return -ENOMEM;
>
> -	platform_set_drvdata(pdev, qcom);
>  	qcom->dev = &pdev->dev;
>
>  	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
> @@ -773,10 +937,14 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  		goto reset_assert;
>  	}
>
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	ret = of_address_to_resource(np, 0, &res);
> +	if (ret < 0)
> +		goto clk_disable;
> +	res.end = res.start + SDM845_QSCRATCH_BASE_OFFSET;
>
> -	qcom->qscratch_base = devm_ioremap_resource(dev, res);
> +	qcom->qscratch_base = devm_ioremap(dev, res.end, SDM845_QSCRATCH_SIZE);
>  	if (IS_ERR(qcom->qscratch_base)) {
> +		dev_err(dev, "failed to map qscratch region: %pe\n", qcom->qscratch_base);

dev_err_probe()?

>  		ret = PTR_ERR(qcom->qscratch_base);
>  		goto clk_disable;
>  	}
> @@ -796,17 +964,17 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	if (ignore_pipe_clk)
>  		dwc3_qcom_select_utmi_clk(qcom);
>
> -	ret = dwc3_qcom_of_register_core(qcom, pdev);
> -	if (ret) {
> -		dev_err(dev, "failed to register DWC3 Core, err=%d\n", ret);
> +	qcom->dwc = dwc3_probe(pdev, &res, true, qcom);
> +	if (IS_ERR(qcom->dwc))  {
> +		ret = dev_err_probe(dev, PTR_ERR(qcom->dwc), "failed to register DWC3 Core\n");
>  		goto clk_disable;
>  	}
>
>  	ret = dwc3_qcom_interconnect_init(qcom);
>  	if (ret)
> -		goto depopulate;
> +		goto remove_core;
>
> -	qcom->mode = usb_get_dr_mode(&qcom->dwc3->dev);
> +	qcom->mode = usb_get_dr_mode(dev);
>
>  	/* enable vbus override for device mode */
>  	if (qcom->mode != USB_DR_MODE_HOST)
> @@ -819,20 +987,15 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>
>  	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
>  	device_init_wakeup(&pdev->dev, wakeup_source);
> -	device_init_wakeup(&qcom->dwc3->dev, wakeup_source);
>
>  	qcom->is_suspended = false;
> -	pm_runtime_set_active(dev);
> -	pm_runtime_enable(dev);
> -	pm_runtime_forbid(dev);
>
>  	return 0;
>
>  interconnect_exit:
>  	dwc3_qcom_interconnect_exit(qcom);
> -depopulate:
> -	of_platform_depopulate(&pdev->dev);
> -	platform_device_put(qcom->dwc3);
> +remove_core:
> +	dwc3_remove(qcom->dwc);
>  clk_disable:
>  	for (i = qcom->num_clocks - 1; i >= 0; i--) {
>  		clk_disable_unprepare(qcom->clks[i]);
> @@ -846,13 +1009,11 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>
>  static void dwc3_qcom_remove(struct platform_device *pdev)
>  {
> -	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
> +	struct dwc3 *dwc = platform_get_drvdata(pdev);
> +	struct dwc3_qcom *qcom = dwc->glue;
>  	struct device *dev = &pdev->dev;
>  	int i;
>
> -	of_platform_depopulate(&pdev->dev);
> -	platform_device_put(qcom->dwc3);
> -
>  	for (i = qcom->num_clocks - 1; i >= 0; i--) {
>  		clk_disable_unprepare(qcom->clks[i]);
>  		clk_put(qcom->clks[i]);
> @@ -868,10 +1029,15 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
>
>  static int __maybe_unused dwc3_qcom_pm_suspend(struct device *dev)
>  {
> -	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
> +	struct dwc3 *dwc = dev_get_drvdata(dev);
> +	struct dwc3_qcom *qcom = dwc->glue;
>  	bool wakeup = device_may_wakeup(dev);
>  	int ret;
>
> +	ret = dwc3_suspend(qcom->dwc);
> +	if (ret)
> +		return ret;
> +
>  	ret = dwc3_qcom_suspend(qcom, wakeup);
>  	if (ret)
>  		return ret;
> @@ -883,7 +1049,8 @@ static int __maybe_unused dwc3_qcom_pm_suspend(struct device *dev)
>
>  static int __maybe_unused dwc3_qcom_pm_resume(struct device *dev)
>  {
> -	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
> +	struct dwc3 *dwc = dev_get_drvdata(dev);
> +	struct dwc3_qcom *qcom = dwc->glue;
>  	bool wakeup = device_may_wakeup(dev);
>  	int ret;
>
> @@ -893,31 +1060,56 @@ static int __maybe_unused dwc3_qcom_pm_resume(struct device *dev)
>
>  	qcom->pm_suspended = false;
>
> +	ret = dwc3_suspend(qcom->dwc);
> +	if (ret)
> +		return ret;
> +
>  	return 0;
>  }
>
>  static int __maybe_unused dwc3_qcom_runtime_suspend(struct device *dev)
>  {
> -	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
> +	struct dwc3 *dwc = dev_get_drvdata(dev);
> +	struct dwc3_qcom *qcom = dwc->glue;
> +	int ret;
> +
> +	ret = dwc3_runtime_suspend(qcom->dwc);
> +	if (ret)
> +		return ret;
>
>  	return dwc3_qcom_suspend(qcom, true);
>  }
>
> +static void __maybe_unused dwc3_qcom_complete(struct device *dev)
> +{
> +	struct dwc3 *dwc = dev_get_drvdata(dev);
> +
> +	dwc3_complete(dwc);
> +}
> +
>  static int __maybe_unused dwc3_qcom_runtime_resume(struct device *dev)
>  {
> -	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
> +	struct dwc3 *dwc = dev_get_drvdata(dev);
> +	struct dwc3_qcom *qcom = dwc->glue;
> +	int ret;
> +
> +	ret = dwc3_qcom_resume(qcom, true);
> +	if (ret)
> +		return ret;
>
> -	return dwc3_qcom_resume(qcom, true);
> +	return dwc3_runtime_resume(qcom->dwc);
>  }
>
>  static const struct dev_pm_ops dwc3_qcom_dev_pm_ops = {
>  	SET_SYSTEM_SLEEP_PM_OPS(dwc3_qcom_pm_suspend, dwc3_qcom_pm_resume)
>  	SET_RUNTIME_PM_OPS(dwc3_qcom_runtime_suspend, dwc3_qcom_runtime_resume,
>  			   NULL)
> +	.complete = dwc3_qcom_complete,
>  };
>
>  static const struct of_device_id dwc3_qcom_of_match[] = {
>  	{ .compatible = "qcom,dwc3" },
> +	{ .compatible = "qcom,snps-dwc3" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, dwc3_qcom_of_match);
>
> --
> 2.45.2
>

