Return-Path: <linux-arm-msm+bounces-28409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A94DC950BF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 20:07:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD3701C22280
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 18:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 011F11A2C12;
	Tue, 13 Aug 2024 18:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Or6qfHus"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011008.outbound.protection.outlook.com [52.101.65.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B17C37E;
	Tue, 13 Aug 2024 18:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723572435; cv=fail; b=nHAXbWmivtbltoc8PcVrYmRKvPiNbytMI0YAX56dZc+o1O3lJFp24HVY8WjcuNv/mrB/D9pP87rWAumOHP0pLHbedwvRt6c++J+lyvGt3MwRAhsgXatdJYy740RSpieg1FTyi72Ai6fTeHtNlmXzn5YNsku+Jl72l0N5ZqrELXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723572435; c=relaxed/simple;
	bh=QYK3LriLZovjiyJlauVk0Gdaui0UovW6RdWHnV+zR6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=C+fMABVAeWExLmZWLjtbQ0Ve3dXH1MSqy+CzqMnMt1HTV1+j7zS/nhQO9kDLd5cO/IPgkt1TvaVxlin7xCd1iFcr6FipjuIsgCDf63QNKUuh5/boI34ri9aOhY4uU5ZLp3TAdOhEakzplrPLBKTrOZdj7u7aRqykThzaZSpQ+jk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Or6qfHus; arc=fail smtp.client-ip=52.101.65.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xb7UnEgPA8S7BCWDfBUVPaFfrGYwq384vcugglZhlApd9jPsco6kuHYTX4rJndfKIaN7vrRr8fQuBNWZ70v1rPR7zAMTD6jgRwpNJNhOIE2Aq2Julq9lSumSL6EME8YpYbvpLqcevlnmC/jc/dGL7u8KU8Un017yWyZwtRqHpm2fIHpgF5RSPqVUQQf1Il0ujNJMF53rTnMvF6JK10wwOxuuMBUpbKdPka8nbJk4Q77C4ORNtjILBqC6mea16f3TsNR+3/Cy7pktESCsK8W8eJu3Cvul/VTHOgQE6XIRiW8O/a0Vj5wkQchTygTm5MVF1gWcJA0Q8SP/s8tnL6kinQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCewUyPAAkt2hHRJfHTQxhzXDJCfX0Lvhu4vLNngIRY=;
 b=qBYCWDm2R8uCT/m7wVK4YUOhG8WS9i2P/5sh96WV2MLEYSf4MptM+PFVQn+I1KG31T6i1uegW33kmdXk6su8pcWmKVmu6Vac9Tqu8utW86U+fvjaZnTwu4wet48RhXz21pJW3rtjDClU3lDlSs1ogjh1y0GNuqywoYcubZeYQiBUpYVv3bKtidbYzmVEoxqyHQwFtgPNJIV6uD+VzhifOAzjgBiTYBAIKwD4vAfByhSf6Uh3QNJFLL0mtOiwFx8i9bdFOMz30TJkb+InuglhPIAv0oIE3iX9GKVnUoXCuVOf8tHxubn3YjCyPM9ZCu3vFRhV4R96/xL6oaJDXQoOpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cCewUyPAAkt2hHRJfHTQxhzXDJCfX0Lvhu4vLNngIRY=;
 b=Or6qfHusKRAU/D1kTvv1+sAyL+SiTPRhLgIoRrzuM8zwSHBma4X22DR28kunDYB/h1ppY5xQ5h05RSl8H8w+Ct2bvwBlRjKpJo8Yo+4dJIbJ1BISKseDgmqmSNSZBxP8d81MtwSYVWgbL9uFs25qvrkrXT13JV9GNwDPqXSGfwByQqq0z5V9MtHZ6X7JMEqnMzn2R3ebygM4pNcW5DzQz+/5XODIveC/VESnpDPWk6A3mtNON5wBNHzs53VlNYAq35iLwhXregZ76bm71TxKXTlZ5FXioBlF5JIJSxUvhKU2lsn9XVmtRhdN61uGbS14k+IxOhmyBJU1s03iBKmwMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB11033.eurprd04.prod.outlook.com (2603:10a6:102:484::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 18:07:10 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7849.019; Tue, 13 Aug 2024
 18:07:10 +0000
Date: Tue, 13 Aug 2024 14:07:01 -0400
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
Message-ID: <ZrugxSqzhzxvVqV3@lizhi-Precision-Tower-5810>
References: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
X-ClientProxiedBy: SJ0PR13CA0212.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB11033:EE_
X-MS-Office365-Filtering-Correlation-Id: 609a07d0-5ce4-43f9-b51d-08dcbbc2bff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zqluEuM7YxT6i/JXWqfFNGXsj9K/RpN4LwmLVrUh+ilg3FfzOgGkDM0h3/VH?=
 =?us-ascii?Q?d4I5lWRAWylnjzEAcica9rgkdOnQq3BVQI+0PyBBu2tKG+AIQ1TzRbykzuYB?=
 =?us-ascii?Q?BEffvteJnmn1Pa050wRvVne3kN2ySyBjss4nJZbYWt14eM/muw8gLLpYRRsf?=
 =?us-ascii?Q?uZmN6HNn7DMFafYJ1g/A7P/RJgiTQy/h/Hgb0zh4B1ePNJILmDQQHGqoJmA7?=
 =?us-ascii?Q?ssavS8rZzZt8qRwHaSiprjYzEwKIHP5N8QeDolQXRyqNfEqgBo7z7YNrk5qa?=
 =?us-ascii?Q?w4vJsGaQHw3ZCpUi4aZolAtf+RyS8ZJjpJwtGCzY2IjSrcIp3pKvokCij/cn?=
 =?us-ascii?Q?nZHAZXCd4SzqpnfaS98PfX/jOYtf1q44379DXjYshA85I8anG6dsG7HiWnTu?=
 =?us-ascii?Q?heL8+hhKZ1KEcYKuLoKVk3KxVzUqZ3RsRxK/lsCNLr5kUdr/PGoKhILjSngj?=
 =?us-ascii?Q?QPw1QiTku9vg+G6ZA3nVUltFz/l6M9/D/BO8tc5wJsVZNzBNjwaQown2CrrJ?=
 =?us-ascii?Q?1PM++nAzIHKtMkuYeSMdMM7DkGrAorysbZ6lmnSoNUjicqKprRx8QFYsgnJv?=
 =?us-ascii?Q?4q2dLrE+JMIk0Bomsi8/eL8enqJy0nknI8JnxWqNFtIjXbLMFzwl831tqF0d?=
 =?us-ascii?Q?PjeeuDX2Tce6giVEceZcqIyvGDNNUsiCzv+ajo4oII61N0eS/Lr5Yv9ehG0M?=
 =?us-ascii?Q?IVj2kXcAU7hhax6XHN7aaDAxCPq/g/AGoJSpJIloYSZ2Em3fpCONgncs5moU?=
 =?us-ascii?Q?EFiUSbxv6TBVgbYEJ/h96IEFRE8Q4pdwKFzJ+KF/9JBDAxutEBrMfD/9abkt?=
 =?us-ascii?Q?MzcyqqnRvA1TFqxNYoCCIciVJYVgWnZGsQb3JxlpjPBjspDmi9COK0DpKX8h?=
 =?us-ascii?Q?/nhD5Cn6RlAyFFbzasHwVZDot+g3PI3uviWGAPfDdjNTvrFhANBotRutjVhk?=
 =?us-ascii?Q?QgOGOyEF40d7hSbYJLb5/73vhv/IChve+HWRAb8HbZLG8M/fYyXJE4FnjUq/?=
 =?us-ascii?Q?3YVJxyiVojBOGM+m2Df27WFnEvVgt7TuqSt99J1KXJ5nOlvBu3HEWSYEAiMg?=
 =?us-ascii?Q?Pz4opgPrsM8uMBf51DcWcHAAh8kXkNA5lNhufKMPQhSKGpArOL2zDVfKQtVy?=
 =?us-ascii?Q?KPHSW640uen8uBep9ux+7FwrfpS5ujn+EJYWmiq9xHsKsyjEVIppFxGcCHUE?=
 =?us-ascii?Q?oFG6tIRjP7QpLVHlC52juPl0jhXoMjSSEXd+C9wGxlnrPcOm/BtMLlKExCc8?=
 =?us-ascii?Q?cZSfZVqHw5mG/O5gr5MbfVVvNHrVcYgbR5+8k7ZTiiO/BxHrlT35hFnhbXXA?=
 =?us-ascii?Q?iUdnZwXSP2HthyMlMG5ghb7TMrlMcDil6XF25VK0j00onYKXFtRoc+4s/Tyu?=
 =?us-ascii?Q?bIZ5D78=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MBvLgbTa3BrWOYfZTX1mhyrpZW7Eh0SMsLu1daB8k4C+AYSnpUWFPzAKbT8G?=
 =?us-ascii?Q?C5jlr9mSJAYipAs4oW7qyEvXdN8uIN2SEUS73cB+IO+A+RnAXbfJ52qROukt?=
 =?us-ascii?Q?ziXPFIX9E2+UTxclcZ3LzcHLwMfSRah/ZfwXmACBhbDjykqlylkkuGtKdo6v?=
 =?us-ascii?Q?vctBtcUHxDBGGjrUPzdEBy81zW2BQyvMDOaIWCHNZUKMSUhk1uHaLu3XKUM2?=
 =?us-ascii?Q?dEfmK0b+t90ii6PF1pTDkX5FuhhhdkJbt0/+c7/Pbuppw6Hdj5Y7YcvDljoO?=
 =?us-ascii?Q?ba5WHc5dZ3ZF7LnSXeuqG5ecEKWUfIuzOyAwJZ/Uy/NOPFk//oK/3yELXkBX?=
 =?us-ascii?Q?DKzBbGPtr0ojZb29n6OiUIJ+wpZW6Kqu9HIyxXXSGjrwMKCLj87IuTsc1drJ?=
 =?us-ascii?Q?yGjiqfWLjkx3DiY66kEqez2JLCON6Dxx2X3d/vzymJ/Re6dVEpZVCSXqxVp3?=
 =?us-ascii?Q?UOnYSM0HkwvOyK0qR25wm/h0uL6EfwBNDofx6Tmk+gBxqD2sD39Tbvf4hWyt?=
 =?us-ascii?Q?Y7rFbaswzwLObYMxk+Cv/OwuJqj+XvANG/12WJnq+cPOn2Dlmz8r3WGLFjCC?=
 =?us-ascii?Q?dFU3bm/4RrwtLKqw4XTL2CJnFn8YA2a23Ynk/SCij2rvgCDBsG42nqY9yzVT?=
 =?us-ascii?Q?xcvis7M34XvgKnA3R1r+zSOQQl6fHay/pBNkPi8NsNfWecke12Jzm09PjFqT?=
 =?us-ascii?Q?x71aObA0BDRn5VfZhnA58M2mH/TSBduowvC1RoAudbaJnkRFEDvkZfFk1GTm?=
 =?us-ascii?Q?GL9zJ9WG6MYTCSs9yyQqMdx5jQaz2slg9xQLscc+BL3Q7omVxDFFXbTGFxXQ?=
 =?us-ascii?Q?O/JN4IJvFZ+ofnmDMMrI1hKLWmHeYci2i5kRTK4y0V40fBtgJqKuOWdjyev+?=
 =?us-ascii?Q?1wqz8A72cpPfuus1e1bEhIgmo7mKVJGjUyEngxyw0Dkz4WMkTfTkzBmEyTqO?=
 =?us-ascii?Q?ZkorGqDp4fQHeUgy8P77VhY+h7B7GAy3kLQjEKQNGo8lNWULps5es1egUv4+?=
 =?us-ascii?Q?Vg59VkroOrOHcq4j5Q9DaHsrLMr/2+sDlCYttnOnwYi0xNH/0NxuGrZwBFU2?=
 =?us-ascii?Q?X1L8MNg04gjb+EhpWfQiOGgphuRhEUAcrV1WpyGt9n1k8XJgYZZuyL2oWxgE?=
 =?us-ascii?Q?9tQnDkCTW4fsu31YlP0AMtKg/QjvsZTNqgLtQAZ1KRr+2Urt37QLXqH2+M+g?=
 =?us-ascii?Q?C8IgSGzrQQQ49PpdUpNLSPOuUvwv0gdi/xPPsoupQUJmY7WzPPTUL07pzSQl?=
 =?us-ascii?Q?XOat6mrtiLUS79LLUqw0B9lhxDn/Wz4gOFXOvp+VkPZ77sz0dXBkK4iBcuZN?=
 =?us-ascii?Q?2r4U1Tii3qx3rSjPYXM6Va7y7n2nPQxDDslmCwbRBTpVkcm8gMaeC74f5bXO?=
 =?us-ascii?Q?a+76vC/lhjjOx9u7k087sbnUA+2LwO6oZ0K2nqHfb0A+cCUi0cydztW4aqL8?=
 =?us-ascii?Q?qbrnp0N5bZ7t0xM1+R4PMPU0UgehaxPIZFXs6cZDQOD13ld7rBVnt8XsxfgD?=
 =?us-ascii?Q?0kY5KzeZNnpxRANN7aIytXoN23F611x/775RvjUiU9B6G8eLf69409DjiN7Q?=
 =?us-ascii?Q?weByXb6evAzZ/wSfCgql1J0+0P9QaaW4Ql+nAZ+s?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 609a07d0-5ce4-43f9-b51d-08dcbbc2bff3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 18:07:10.1272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aXHw4Knv3k6rCXJy2hHTSd/texYzjUGMke1HAkmmcktDwindyayQhcWXetKAPqCJdrQszPsiyQCo0PBi7uBIvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11033

On Sun, Aug 11, 2024 at 08:11:57PM -0700, Bjorn Andersson wrote:
> The USB IP-block found in most Qualcomm platforms is modelled in the
> Linux kernel as 3 different independent device drivers, but as shown by
> the already existing layering violations in the Qualcomm glue driver
> they can not be operated independently.
>
> With the current implementation, the glue driver registers the core and
> has no way to know when this is done. As a result, e.g. the suspend
> callbacks needs to guard against NULL pointer dereferences when trying
> to peek into the struct dwc3 found in the drvdata of the child.
>
> Missing from the upstream Qualcomm USB support is handling of role
> switching, in which the glue needs to be notified upon DRD mode changes.
> Several attempts has been made through the years to register callbacks
> etc, but they always fall short when it comes to handling of the core's
> probe deferral on resources etc.
>
> Furhtermore, the DeviceTree binding is a direct representation of the
> Linux driver model, and doesn't necessarily describe "the USB IP-block".
>
> This series therefor attempts to flatten the driver split, and operate
> the glue and core out of the same platform_device instance. And in order
> to do this, the DeviceTree representation of the IP block is flattened.

Thanks, we faced the same problem. Can you cc me next time?

Frank
>
> ---
> Changes in v2:
> - Rewrite after ACPI removal, multiport support and interrupt fixes
> - Completely changed strategy for DeviceTree binding, as previous idea
>   of using snps,dwc3 as a generic fallback required unreasonable changes
>   to that binding.
> - Abandoned idea of supporting both flattened and unflattened device
>   model in the one driver. As Johan pointed out, it will leave the race
>   condition holes and will make the code harder to understand.
>   Furthermore, the role switching logic that we intend to introduce
>   following this would have depended on the user updating their
>   DeviceTree blobs.
> - Per above, introduced the dynamic DeviceTree rewrite
> - Link to v1: https://lore.kernel.org/all/20231016-dwc3-refactor-v1-0-ab4a84165470@quicinc.com/
>
> ---
> Bjorn Andersson (7):
>       dt-bindings: usb: snps,dwc3: Split core description
>       dt-bindings: usb: Introduce qcom,snps-dwc3
>       of: dynamic: Don't discard children upon node attach
>       usb: dwc3: core: Expose core driver as library
>       usb: dwc3: qcom: Don't reply on drvdata during probe
>       usb: dwc3: qcom: Transition to flattened model
>       arm64: dts: qcom: sc8280x: Flatten the USB nodes
>
>  .../devicetree/bindings/usb/qcom,dwc3.yaml         |  13 +-
>  .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 608 +++++++++++++++++++++
>  .../devicetree/bindings/usb/snps,dwc3-common.yaml  | 417 ++++++++++++++
>  .../devicetree/bindings/usb/snps,dwc3.yaml         | 391 +------------
>  arch/arm64/boot/dts/qcom/sa8295p-adp.dts           |  12 +-
>  arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |   5 +-
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |  12 +-
>  .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  11 +-
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 138 +++--
>  drivers/of/dynamic.c                               |   1 -
>  drivers/usb/dwc3/core.c                            | 169 ++++--
>  drivers/usb/dwc3/core.h                            |   3 +
>  drivers/usb/dwc3/dwc3-qcom.c                       | 323 ++++++++---
>  13 files changed, 1483 insertions(+), 620 deletions(-)
> ---
> base-commit: 864b1099d16fc7e332c3ad7823058c65f890486c
> change-id: 20231016-dwc3-refactor-931e3b08a8b9
>
> Best regards,
> --
> Bjorn Andersson <quic_bjorande@quicinc.com>
>

