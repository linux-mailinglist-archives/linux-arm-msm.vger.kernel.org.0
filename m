Return-Path: <linux-arm-msm+bounces-28410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E51950C0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 20:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97FCD1F219E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 18:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618C5381C8;
	Tue, 13 Aug 2024 18:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Oe9EmP40"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2071.outbound.protection.outlook.com [40.107.22.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E500DA3D;
	Tue, 13 Aug 2024 18:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723572950; cv=fail; b=rzX/Cg9TAxH5/LGw+w0SumpzZvdVQdPiwYQNUZsggNebW2MeezVouhWKWdSah/Xe8/GYFyeAjQbhTGlVwjPjEWwyS5mrUND9k+ObKcfiXnsVQo+Evvi4QfGB4C3iuTiyanEj0/FTQr9GJiDWGXckXmV+kSJzrFXQILl0bAw18l4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723572950; c=relaxed/simple;
	bh=tmY/OYNS5ZEcJpEPFyMpbb8lO1q2KGHOVDJexo0/Q4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XgPjMsTabWT6NgE4q5PIwJYGQXWHp02jp6Tq1N8E1NxIIUV52bHW9YMfz0BzwwCHBhlfafFEiPrZSIi+U4TeckBjg9oIc56Nj08VptCHG1HN2lJGyd67pZS1r/BIN0wSv0nbDXuQZIE8U4qbDrundwWZ4NNCeGSkxkFmhcC5ipI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Oe9EmP40; arc=fail smtp.client-ip=40.107.22.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/juN9hoEx7W+FBmAr7x09yIyb1jqmDeaTmK0f0Ac6bD/H27wAJUgG9+LZ+Ilv52emMZE8KCT698BsX+08nKNY2KMm+cELJhcjA2EcEhUA6h/PQQ4ewZ8xxBgv4PQg2WBvLLTtqhbiRYDRaKbxCJxa2L3c0BbFgOBSr1l7Q5syJ6oLGSsihkdKwz1395vfsscP5LmiyirhBjnb042dc+HJOMBg3Xx10ucrIxJLxTvrur+meIYXCj1naLPoLzLmuaej0sU5BfoT8WFC6MJ2aDC/5s+Ev9UN6dgVSbiLW3IAIu81rnaE2OtUZQ0TgLQ7O91K5s9qHn7+xAsbds7tNk5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ekuRPYDPW3t5UszjlJORQXGX059HLeLVERZD6vDP34=;
 b=ia9qTguf4QVPid9El8e8j2ohwqeUXQjIK2B+cvSZcGIVlxBFNPHzEv2bO60JW6SJwXbYYxm731eknuMT+oabc1/P/bRS4XgMRUbq7ZzOgV2ZCIrlDyAa0Q2AwxLXihmfR2kqU4sZLizfny2HZafgdbI4p23/CPf0UkhGRElLeQcMC8VXU4WWsjvVRqv2IlF48iQjGt6q9Xo3K0N4gspuoytSXM56ROaBXBwUxYHyNPSq/LPiCT8ECGmSvzLAQOg+7ju0or0upBw8urox4UiiCp41trSFiwPctFZTn8dDWdN2gxTMSlocrqHCO22+Afp6wG+zYE+cr1Io4JxwsfpV4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ekuRPYDPW3t5UszjlJORQXGX059HLeLVERZD6vDP34=;
 b=Oe9EmP40m7aqbj32mVQTe0yzdw81kgt7jry+5jfBDM33VPhqqJfNch1HUjtU/gGLTZ6uElrRJY+cP6Y/+GfVx39EJz3N6Ouciu3Pe7ToKW2ux+Ze1JkKSKkA/t/O43WrsIHJD6rtD417XMdJTSldxtBUYSOMsd2tr2xmhvpP7qyRS9Qq4+WWkYpOVnMinMs0wwbmeHBSxr7V4/3gIH5Fq2fOAyjW1S+AsKLpbbJpG0WQaEd5Yb7iZ5qISYqtMykD00+YnUrJLDeE8y2D952hz7hGf4fL5+w30niVBMS7F4Q4SjryYzOEY5VYPTHHu+9rC05X11bUdv7FDtEvCNuPHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DUZPR04MB9947.eurprd04.prod.outlook.com (2603:10a6:10:4d9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Tue, 13 Aug
 2024 18:15:44 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7849.019; Tue, 13 Aug 2024
 18:15:44 +0000
Date: Tue, 13 Aug 2024 14:15:35 -0400
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
Subject: Re: [PATCH v2 4/7] usb: dwc3: core: Expose core driver as library
Message-ID: <Zruix+aadUL2F2jY@lizhi-Precision-Tower-5810>
References: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
 <20240811-dwc3-refactor-v2-4-91f370d61ad2@quicinc.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240811-dwc3-refactor-v2-4-91f370d61ad2@quicinc.com>
X-ClientProxiedBy: BY3PR10CA0027.namprd10.prod.outlook.com
 (2603:10b6:a03:255::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DUZPR04MB9947:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e953500-247d-4f59-e0d1-08dcbbc3f255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l1iuXnwttTQTiYlUvW/qgfdUte4OqAHMZj+/A5MXw2yzchqiAIjkbxujYRND?=
 =?us-ascii?Q?7i4OrttrxpUsKOnth193Vw5p5uvrxXecMTrUo1CWvn9GW0FYTuMzm9zwUjIB?=
 =?us-ascii?Q?fVjD2jgkZ7Zkh+W6MtkViPu2Svc6PcoBtJukTIO9qc/7PcKopVTG9slHWGoL?=
 =?us-ascii?Q?sJwE8YvGg7qtO2aP7lTixU4YGasgyyM4jn/Bdu7Xqvm8RE1dQDwhcs20szqS?=
 =?us-ascii?Q?8fEQE9yVdCEyREcth1I17jGAots2GwKLLn8d11kGkssBTzSmK/DWarsKFBDD?=
 =?us-ascii?Q?WOojX8bZ/gRwCw5dMu2ryUwKtb7g/OVeGrmp/uIo3M+QDauIdauIyJgzcIor?=
 =?us-ascii?Q?pQXMugjCrxdj7QUQiJqu6WKt1X6KMWtUQLwMkCKhpaDQnj6isgwh79+f8xWC?=
 =?us-ascii?Q?+xTwmGQDXTKO5VAAMXOKdbjHa3nNdJeJoDR44vx3OUO/KzG2ocmb+t6r6lXw?=
 =?us-ascii?Q?33rVz+beQYYAMKmKJZm2kElHierwgxXYRKPuvT48Zv3jdB+Nc1beTayDL0aP?=
 =?us-ascii?Q?mrBpEkRfzpK47gDrDlLLa1VyqeUHoi86qQmqzxXSL9FWQi0g//c3ScMRBqMm?=
 =?us-ascii?Q?KLyxdDM4ddlDFyJhQQGaX9ikS7KoVR1BVhi0g47skqYiYJkpxRhPhjjwdyUF?=
 =?us-ascii?Q?OLC49z+LvEHDeUY6pP7JNN5hGpXHPbKdR9WOZ72+UrF7LSvNrRB2kAcGHDyM?=
 =?us-ascii?Q?ueaP1sALLi7k8+oMuM8Odh4XjzN0pbs7VbeQNP9JRD7jN3pz/B3T/YchMZbY?=
 =?us-ascii?Q?jmnS54jsXpLbLZJ99f6CUfASSYV89oxJwZnvbKTwD7YRPzj6nLvOvT7bQQ8x?=
 =?us-ascii?Q?Vz0vpZRXPpEG9K37ehkZ4POHq9HGlB5ZZf7onGJAi8wat8ll0SO8YbU0z+Wk?=
 =?us-ascii?Q?eqmQ/3Q9xmMOA/4WJXLz+udtPYyCZOXF0DT2aErkUxi/wmIc6Hwvvt9B2nUb?=
 =?us-ascii?Q?40jvaTIYvS5BYLw9+bwG2w3/Z9NTyPvsGBMCpCKqQc5nldGfmFk6SH52IKZs?=
 =?us-ascii?Q?j+6XAfUg1xbjSw99S6GzfQ7VdJzVIDPJX3S/iCrEgFHvNbP/Rf9ByM9Yvsk/?=
 =?us-ascii?Q?bWAZo4V3w76WIyhqQwWEcqKsxnaxGOypOtnee8Kw3s0edrWKKTtUwjuXpmNz?=
 =?us-ascii?Q?Ms6E5W3E46aessaEQWxpj17+GDUrHuMFxp09bSzoisoFY7c3pHiR38iwFd5A?=
 =?us-ascii?Q?VIlEPgH/hOJcuirALOUxlSkkkBvRO/TwBeG7+ASA8ttrogkTcmGrMAGj6sAp?=
 =?us-ascii?Q?LFQeFdkbeztrUWL6SaLKiEksUz6GzBo+cHh8zxD7pbs37ZQeqVLExZl762Pb?=
 =?us-ascii?Q?wZSVl2CXWz47LNhIOdde7u+EEGQxNuT1BNf/LiepKlkawzvJqA/kx7suiiZg?=
 =?us-ascii?Q?vZn6gy2s+VANAumKAplYR3c3ZPnkhwR0bSUJY1XT8CBD6kZyaA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y5sTNj6BTVCnkZKsNdFtE3iCheU0wwoMgAqeyq5KYPl8A09A1Bcj19HDBdaD?=
 =?us-ascii?Q?DzYmUpqpVUYyXKiIoi+dXs6jmiMfp5CNTDnUehpNlecLeg42hgay8rzBJwLy?=
 =?us-ascii?Q?BHQsdSC/OMtsL6nixaFTVWZQhTWF+JAZBVVZ16raEUMPlUqfo2ZEDRv6+/R7?=
 =?us-ascii?Q?O/WrLMsubX/X6AWIA8TuHThGE1Xa6GbAlkXskNL+scd3Bh2viG3l65ROaSmV?=
 =?us-ascii?Q?707svNBSfQ7wS2a4OJfSvPzxXuQi8qahnf3uXn3uFSskXDSMteKOUcX77YmG?=
 =?us-ascii?Q?vJ7whv8txOErWXZDWgYi/NoSQQLluVR8e7pX6NCnM1plfjjyP3vfa0XIsAGO?=
 =?us-ascii?Q?l+iaoiPGUtT9aE+ACzgbHQqz3OIKeZ1YKgpWfLyJWKpzqRR+sDil/97Q2NzS?=
 =?us-ascii?Q?83cl3n8Rv8A5IFD2tl/pq39eIr8KuIdzzOWS/n/DjL5J4LaqQfcqf3ivNkK/?=
 =?us-ascii?Q?inFrGXsHfKBlNhbKE6ujlOJHkQ0F84D4s76+ThWhXdq+LWAOsFFUyO/qn7aS?=
 =?us-ascii?Q?aPTnk/VdXOgtPezsUdZeK73NPDF6UQ6dWlEJ/SQRyk4cneAyhoMwAbPD0G9y?=
 =?us-ascii?Q?WfNO2oeWJMb9TUSfaEh1uwyenB8FykY/pyl2Upd9Ik9SSJZ14vRr0uKvRo1p?=
 =?us-ascii?Q?+czIZMZ9dXuONTisHgh2s0fVoNdM5akhQ5CqR1LL3TWLK7m99356DKhNGf74?=
 =?us-ascii?Q?wJFKVGQCmTwXrG8zh76LsVUd0KiyfuJRZcy787V9oZakmxkONXF6e6Ghl5Lm?=
 =?us-ascii?Q?hpDMGKyXnIa7JSQWbX6mSGSSFWNuz+WdhElyjubyry1gkmnaxy/ZAgNoa4KP?=
 =?us-ascii?Q?Hh2fY5Jtj3wfxTt41FzGf8LSpSHEuAsWkVMxenHrA6MEGFemAQeuBcGZzf+O?=
 =?us-ascii?Q?w8oK+IoZz4xb5LE8Wew6NYvQGi3Ihdwya6uJV7Eq5o8wjC40ovOUyQe4xhMo?=
 =?us-ascii?Q?XCHG9JbWs7IswIc5CMvh//Wbd5S+TP6bkzWpYbIpaxKAmUxBEb7xqnmn4ihr?=
 =?us-ascii?Q?76Bgw7oPW5kaunVvDBNcOyJn0L6y0GD3JGT0neVG7UC9ufya9Ooh/Hscu1WH?=
 =?us-ascii?Q?O7nR/NGTQtpG3xmtTdvlNSnc0nL3zSd3LJOAidZEaYLx7toEJOUMcjPK2AHl?=
 =?us-ascii?Q?76CyiQxFihKvUb8nawRXVT18WkF5dyBS0hCTpz51AW4jRn8PBv2i551jDuwQ?=
 =?us-ascii?Q?NpHIomVRd8QgimDRILllVAqJuqmAVif9O/nO/rts+VIJ7GDTiRQZ00q6dnQ5?=
 =?us-ascii?Q?HaWih593gZoGzGSQc8uEyZhtop2xVQe2FLhUYK39aGBbDzemFE4/6GcL7y10?=
 =?us-ascii?Q?Upp92O+L6TQeD9IzU+Lc14QvYofwJbnQZHzT2VBWQJXXxhpi2b7znRqFnz/c?=
 =?us-ascii?Q?fggae5R3WG7hYcFxQG42k/DgvPXl72f8FVxoPkcx7kvIwVSgu4RYFXjCOsGS?=
 =?us-ascii?Q?BB1Zqdd3jtOSbo12nuxuC/ui5rK5xALhX4RQsEAY6F2P0zOSpm7mbYjGE4lc?=
 =?us-ascii?Q?eraX4aUc7ZBSdgFYtOcZaO6R3gLPEg/7NsTJD/V8OFC7O8IzR1Oyg2qZgnlI?=
 =?us-ascii?Q?kcS6nO0aKUTrKYcujC0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e953500-247d-4f59-e0d1-08dcbbc3f255
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 18:15:43.9454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DdkELy2h6XmrIrK4lYH5qYzLEtRku+5X0jap8+Sjfd3/Y5fJS2rkN4Z9hqt+6TB5rnrObDsqejqSIf2h9fPwvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9947

On Sun, Aug 11, 2024 at 08:12:01PM -0700, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
>
> The DWC3 IP block is handled by three distinct device drivers: XHCI,
> DWC3 core and a platform specific (optional) DWC3 glue driver.
>
> This has resulted in, at least in the case of the Qualcomm glue, the
> presence of a number of layering violations, where the glue code either
> can't handle, or has to work around, the fact that core might not probe
> deterministically.
>
> An example of this is that the suspend path should operate slightly
> different depending on the device operating in host or peripheral mode,
> and the only way to determine the operating state is to peek into the
> core's drvdata.
>
> The Qualcomm glue driver is expected to make updates in the qscratch
> register region (the "glue" region) during role switch events, but with
> the glue and core split using the driver model, there is no reasonable
> way to introduce listeners for mode changes.
>
> Split the dwc3 core platform_driver callbacks and their implementation
> and export the implementation, to make it possible to deterministically
> instantiate the dwc3 core as part of the dwc3 glue drivers and to
> allow flattening of the DeviceTree representation.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/usb/dwc3/core.c | 169 +++++++++++++++++++++++++++++++-----------------
>  drivers/usb/dwc3/core.h |   3 +
>  2 files changed, 114 insertions(+), 58 deletions(-)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 734de2a8bd21..6addb3c367e6 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -36,6 +36,7 @@
>
>  #include "core.h"
>  #include "gadget.h"
> +#include "glue.h"
>  #include "io.h"
>
>  #include "debug.h"
> @@ -2076,10 +2077,11 @@ static int dwc3_get_num_ports(struct dwc3 *dwc)
>  	return 0;
>  }
>
> -static int dwc3_probe(struct platform_device *pdev)
> +struct dwc3 *dwc3_probe(struct platform_device *pdev, struct resource *res,
> +			bool ignore_clocks_and_resets, void *glue)
>  {
>  	struct device		*dev = &pdev->dev;
> -	struct resource		*res, dwc_res;
> +	struct resource		dwc_res;
>  	unsigned int		hw_mode;
>  	void __iomem		*regs;
>  	struct dwc3		*dwc;
> @@ -2087,15 +2089,10 @@ static int dwc3_probe(struct platform_device *pdev)
>
>  	dwc = devm_kzalloc(dev, sizeof(*dwc), GFP_KERNEL);
>  	if (!dwc)
> -		return -ENOMEM;
> +		return ERR_PTR(-ENOMEM);
>
>  	dwc->dev = dev;
> -
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		dev_err(dev, "missing memory resource\n");
> -		return -ENODEV;
> -	}
> +	dwc->glue = glue;
>
>  	dwc->xhci_resources[0].start = res->start;
>  	dwc->xhci_resources[0].end = dwc->xhci_resources[0].start +
> @@ -2123,7 +2120,7 @@ static int dwc3_probe(struct platform_device *pdev)
>
>  	regs = devm_ioremap_resource(dev, &dwc_res);
>  	if (IS_ERR(regs))
> -		return PTR_ERR(regs);
> +		return ERR_CAST(regs);
>
>  	dwc->regs	= regs;
>  	dwc->regs_size	= resource_size(&dwc_res);
> @@ -2132,15 +2129,17 @@ static int dwc3_probe(struct platform_device *pdev)
>
>  	dwc3_get_software_properties(dwc);
>
> -	dwc->reset = devm_reset_control_array_get_optional_shared(dev);
> -	if (IS_ERR(dwc->reset)) {
> -		ret = PTR_ERR(dwc->reset);
> -		goto err_put_psy;
> -	}
> +	if (!ignore_clocks_and_resets) {
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
> @@ -2225,7 +2224,7 @@ static int dwc3_probe(struct platform_device *pdev)
>
>  	dma_set_max_seg_size(dev, UINT_MAX);
>
> -	return 0;
> +	return dwc;
>
>  err_exit_debugfs:
>  	dwc3_debugfs_exit(dwc);
> @@ -2249,14 +2248,33 @@ static int dwc3_probe(struct platform_device *pdev)
>  	if (dwc->usb_psy)
>  		power_supply_put(dwc->usb_psy);
>
> -	return ret;
> +	return ERR_PTR(ret);
>  }
> +EXPORT_SYMBOL_GPL(dwc3_probe);
>
> -static void dwc3_remove(struct platform_device *pdev)
> +static int dwc3_plat_probe(struct platform_device *pdev)
>  {
> -	struct dwc3	*dwc = platform_get_drvdata(pdev);
> +	struct resource *res;
> +	struct dwc3 *dwc;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "missing memory resource\n");
> +		return -ENODEV;
> +	}
>
> -	pm_runtime_get_sync(&pdev->dev);
> +	dwc = dwc3_probe(pdev, res, false, NULL);
> +	if (IS_ERR(dwc))
> +		return PTR_ERR(dwc);
> +
> +	platform_set_drvdata(pdev, dwc);
> +
> +	return 0;
> +}
> +
> +void dwc3_remove(struct dwc3 *dwc)
> +{
> +	pm_runtime_get_sync(dwc->dev);
>
>  	dwc3_core_exit_mode(dwc);
>  	dwc3_debugfs_exit(dwc);
> @@ -2264,22 +2282,28 @@ static void dwc3_remove(struct platform_device *pdev)
>  	dwc3_core_exit(dwc);
>  	dwc3_ulpi_exit(dwc);
>
> -	pm_runtime_allow(&pdev->dev);
> -	pm_runtime_disable(&pdev->dev);
> -	pm_runtime_dont_use_autosuspend(&pdev->dev);
> -	pm_runtime_put_noidle(&pdev->dev);
> +	pm_runtime_allow(dwc->dev);
> +	pm_runtime_disable(dwc->dev);
> +	pm_runtime_dont_use_autosuspend(dwc->dev);
> +	pm_runtime_put_noidle(dwc->dev);
>  	/*
>  	 * HACK: Clear the driver data, which is currently accessed by parent
>  	 * glue drivers, before allowing the parent to suspend.
>  	 */
> -	platform_set_drvdata(pdev, NULL);
> -	pm_runtime_set_suspended(&pdev->dev);
> +	dev_set_drvdata(dwc->dev, NULL);
> +	pm_runtime_set_suspended(dwc->dev);
>
>  	dwc3_free_event_buffers(dwc);
>
>  	if (dwc->usb_psy)
>  		power_supply_put(dwc->usb_psy);
>  }
> +EXPORT_SYMBOL_GPL(dwc3_remove);
> +
> +static void dwc3_plat_remove(struct platform_device *pdev)
> +{
> +	dwc3_remove(platform_get_drvdata(pdev));
> +}
>
>  #ifdef CONFIG_PM
>  static int dwc3_core_init_for_resume(struct dwc3 *dwc)
> @@ -2450,9 +2474,8 @@ static int dwc3_runtime_checks(struct dwc3 *dwc)
>  	return 0;
>  }
>
> -static int dwc3_runtime_suspend(struct device *dev)
> +int dwc3_runtime_suspend(struct dwc3 *dwc)
>  {
> -	struct dwc3     *dwc = dev_get_drvdata(dev);
>  	int		ret;
>
>  	if (dwc3_runtime_checks(dwc))
> @@ -2464,10 +2487,10 @@ static int dwc3_runtime_suspend(struct device *dev)
>
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(dwc3_runtime_suspend);
>
> -static int dwc3_runtime_resume(struct device *dev)
> +int dwc3_runtime_resume(struct dwc3 *dwc)
>  {
> -	struct dwc3     *dwc = dev_get_drvdata(dev);
>  	int		ret;
>
>  	ret = dwc3_resume_common(dwc, PMSG_AUTO_RESUME);
> @@ -2484,15 +2507,14 @@ static int dwc3_runtime_resume(struct device *dev)
>  		break;
>  	}
>
> -	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_mark_last_busy(dwc->dev);
>
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(dwc3_runtime_resume);
>
> -static int dwc3_runtime_idle(struct device *dev)
> +int dwc3_runtime_idle(struct dwc3 *dwc)
>  {
> -	struct dwc3     *dwc = dev_get_drvdata(dev);
> -
>  	switch (dwc->current_dr_role) {
>  	case DWC3_GCTL_PRTCAP_DEVICE:
>  		if (dwc3_runtime_checks(dwc))
> @@ -2504,52 +2526,67 @@ static int dwc3_runtime_idle(struct device *dev)
>  		break;
>  	}
>
> -	pm_runtime_mark_last_busy(dev);
> -	pm_runtime_autosuspend(dev);
> +	pm_runtime_mark_last_busy(dwc->dev);
> +	pm_runtime_autosuspend(dwc->dev);
>
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(dwc3_runtime_idle);
> +
> +static int dwc3_plat_runtime_suspend(struct device *dev)
> +{
> +	return dwc3_runtime_suspend(dev_get_drvdata(dev));
> +}
> +
> +static int dwc3_plat_runtime_resume(struct device *dev)
> +{
> +	return dwc3_runtime_resume(dev_get_drvdata(dev));
> +}
> +
> +static int dwc3_plat_runtime_idle(struct device *dev)
> +{
> +	return dwc3_runtime_idle(dev_get_drvdata(dev));
> +}
>  #endif /* CONFIG_PM */
>
>  #ifdef CONFIG_PM_SLEEP
> -static int dwc3_suspend(struct device *dev)
> +int dwc3_suspend(struct dwc3 *dwc)
>  {
> -	struct dwc3	*dwc = dev_get_drvdata(dev);
>  	int		ret;
>
>  	ret = dwc3_suspend_common(dwc, PMSG_SUSPEND);
>  	if (ret)
>  		return ret;
>
> -	pinctrl_pm_select_sleep_state(dev);
> +	pinctrl_pm_select_sleep_state(dwc->dev);
>
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(dwc3_suspend);
>
> -static int dwc3_resume(struct device *dev)
> +int dwc3_resume(struct dwc3 *dwc)
>  {
> -	struct dwc3	*dwc = dev_get_drvdata(dev);
>  	int		ret;
>
> -	pinctrl_pm_select_default_state(dev);
> +	pinctrl_pm_select_default_state(dwc->dev);
>
> -	pm_runtime_disable(dev);
> -	pm_runtime_set_active(dev);
> +	pm_runtime_disable(dwc->dev);
> +	pm_runtime_set_active(dwc->dev);
>
>  	ret = dwc3_resume_common(dwc, PMSG_RESUME);
>  	if (ret) {
> -		pm_runtime_set_suspended(dev);
> +		pm_runtime_set_suspended(dwc->dev);
>  		return ret;
>  	}
>
> -	pm_runtime_enable(dev);
> +	pm_runtime_enable(dwc->dev);
>
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(dwc3_resume);
>
> -static void dwc3_complete(struct device *dev)
> +void dwc3_complete(struct dwc3 *dwc)
>  {
> -	struct dwc3	*dwc = dev_get_drvdata(dev);
>  	u32		reg;
>
>  	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST &&
> @@ -2559,15 +2596,31 @@ static void dwc3_complete(struct device *dev)
>  		dwc3_writel(dwc->regs, DWC3_GUCTL3, reg);
>  	}
>  }
> +EXPORT_SYMBOL_GPL(dwc3_complete);
> +
> +static int dwc3_plat_suspend(struct device *dev)
> +{
> +	return dwc3_suspend(dev_get_drvdata(dev));
> +}
> +
> +static int dwc3_plat_resume(struct device *dev)
> +{
> +	return dwc3_resume(dev_get_drvdata(dev));
> +}
> +
> +static void dwc3_plat_complete(struct device *dev)
> +{
> +	dwc3_complete(dev_get_drvdata(dev));
> +}
>  #else
> -#define dwc3_complete NULL
> +#define dwc3_plat_complete NULL
>  #endif /* CONFIG_PM_SLEEP */
>
>  static const struct dev_pm_ops dwc3_dev_pm_ops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(dwc3_suspend, dwc3_resume)
> -	.complete = dwc3_complete,
> -	SET_RUNTIME_PM_OPS(dwc3_runtime_suspend, dwc3_runtime_resume,
> -			dwc3_runtime_idle)
> +	SET_SYSTEM_SLEEP_PM_OPS(dwc3_plat_suspend, dwc3_plat_resume)

since you touch this line,
suggest use new SYSTEM_SLEEP_PM_OPS() and RUNTIME_PM_OPS() help macro.
also CONFIG_PM_SLEEP can be removed.

Frank

> +	.complete = dwc3_plat_complete,
> +	SET_RUNTIME_PM_OPS(dwc3_plat_runtime_suspend, dwc3_plat_runtime_resume,
> +			   dwc3_plat_runtime_idle)
>  };
>
>  #ifdef CONFIG_OF
> @@ -2595,8 +2648,8 @@ MODULE_DEVICE_TABLE(acpi, dwc3_acpi_match);
>  #endif
>
>  static struct platform_driver dwc3_driver = {
> -	.probe		= dwc3_probe,
> -	.remove_new	= dwc3_remove,
> +	.probe		= dwc3_plat_probe,
> +	.remove_new	= dwc3_plat_remove,
>  	.driver		= {
>  		.name	= "dwc3",
>  		.of_match_table	= of_match_ptr(of_dwc3_match),
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 1e561fd8b86e..4a0ee9ef72e2 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1160,6 +1160,7 @@ struct dwc3_scratchpad_array {
>   * @gsbuscfg0_reqinfo: store GSBUSCFG0.DATRDREQINFO, DESRDREQINFO,
>   *		       DATWRREQINFO, and DESWRREQINFO value passed from
>   *		       glue driver.
> + * @glue: private reference to any glue context
>   */
>  struct dwc3 {
>  	struct work_struct	drd_work;
> @@ -1388,6 +1389,8 @@ struct dwc3 {
>  	int			num_ep_resized;
>  	struct dentry		*debug_root;
>  	u32			gsbuscfg0_reqinfo;
> +
> +	void			*glue;
>  };
>
>  #define INCRX_BURST_MODE 0
>
> --
> 2.45.2
>

