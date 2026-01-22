Return-Path: <linux-arm-msm+bounces-90146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CtoM7XtcWlKZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:28:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE8864866
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:28:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1D6E84F39DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 09:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DE3E355041;
	Thu, 22 Jan 2026 09:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ix9C/GWL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011044.outbound.protection.outlook.com [52.101.70.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE48347BB9;
	Thu, 22 Jan 2026 09:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769073693; cv=fail; b=mMuT4DiGhVFTE739uv62pUI93x1bAYGQKKZIFGHdANuVzKs51NvoSQuzychj03xKPSoj3asec/ej1agB+qKo5Z0DnrmsGzJLJZKgdncXCuak5ZC9oaegYLIJWO/K0wPwtgQzaRjFVWm4IRZyTSa5JT2d1QkwrIJVuoEwmBPtSkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769073693; c=relaxed/simple;
	bh=UH8yivkBx3HOJuS50cnQyCqeW4rGcrwZu/M4J9JhheM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Z+Saxe1m2IX9Y8aXjP3G9yi7KBfV4ZSbm4sGoCnyYqntPkBXDVfuKZZX+SAKkTfq+W4jpfY783/+gtInBwv7r8ro4K8pM2/7kePDCinhJjHiRgDexBreFMnpvat9x+iAXTVYP58NNedab+G6yxrfEpz+gTy2Hn7yqmGY/G4CWm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ix9C/GWL; arc=fail smtp.client-ip=52.101.70.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hfeLIHqUWocQgdxStpy7qJ9/Ci6BLtZKA6gVDODrczObk+Jo2ZlzsGET27JFGefqKMl8RjcR1e4YrpVcLLBAZHmpcfOQp5gV1R/Zg0mtIiArD64VXPtkE4g3rUaMuwVAbeGQalx8ztmojUEprTYYngdhcQmONBZQQttQumvRrDYh+1djXWSSRBTQO9+F1UroWOQMB6k50AuXgSqaPRuBvIQJz0Bh2z6REOIXijFySUmnBbS05TG1JFsIhOd0hMKq/3lL5y4+v0R6EwNNpPn4ROwaUk6iwmuF+2z4eKoJOlKhYzNZekHMMMF9OvC7pKIQfsJJtuiqZ5Xebh/V29MR4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DC94HxsU5WlWFPo8fA42IWzv2SCV5yEUDdgc68K/fA0=;
 b=JCv2GJRpDsITVXYFNahgPy1NMBjmA220BLjSnJSMAbHqfkY8WjfrcHOPRzJpVBSQr0Ld35/j5jcbmvnTqm0VsRKUGAHeN6dZsJIrJ0dD17jYtQxuDrbCEcFEinhwXatkFCtggzNzAIjOkbZXRbCK75ed/wmwucl1LHVFhDduS+NlRmAgS1MashsO884LiaBEjt5R+4kXF+yf4cBUvP4m0SmRewKI0PbDycXbShHJmgoN72t5orFJFdWGIOY85EO//czF8+5KlB7wpUvRnf4aiyuQE38ZPtvj0m9Sp3Iz3zjg0dThe/3tXxhunVVFgspaMiHZONkIn1QTYlklrgnutw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DC94HxsU5WlWFPo8fA42IWzv2SCV5yEUDdgc68K/fA0=;
 b=ix9C/GWLyvI3EiOLqZ2OAZdK5/IZa1l+sF1+mhqxaNSh4t8C5W689NxzSm2MQOEX8ez/vOCQ0ktK8WMOAS2Jstoue+NjK9Z+j/FnvS9fHJWt5JffwGu0PHJLSbuJaGZwHDMyEe+253gRFuWCNXkmqvjJz5Kiue1OAsh8adiu556Uozmn366fzLDrRc0GrbmxVT9AqAPhNgy1iV6u52W98X+tO/yA5mkbT+S5oNimUfO1mUWJ+ik245gEC7EPorJo6nz4ZVCUx8KwyLoK0HfOSm/qcr0jRtwFDOxBwlAdTQvbptA73gozg3SIbItDarjy6lwDk8yU9U2MDv+rxWbhbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com (2603:10a6:102:1bf::7)
 by AMDPR04MB11605.eurprd04.prod.outlook.com (2603:10a6:20b:71a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 09:21:28 +0000
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::b853:e05b:c1e5:41b7]) by PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::b853:e05b:c1e5:41b7%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 09:21:28 +0000
Date: Thu, 22 Jan 2026 11:21:23 +0200
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, broonie@kernel.org, 
	will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	robin.clark@oss.qualcomm.com, hanguidong02@gmail.com, quic_c_gdjako@quicinc.com, 
	dmitry.baryshkov@oss.qualcomm.com, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: do not register driver in probe()
Message-ID: <6oogrqe3n5sxtpdydjqo4ucwp7n3ipqoupxtekvzbnqd7dae3s@q22wc7fpbtya>
References: <20260121141215.29658-1-dakr@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121141215.29658-1-dakr@kernel.org>
X-ClientProxiedBy: AS4P189CA0012.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::15) To PAXPR04MB8253.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::7)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8253:EE_|AMDPR04MB11605:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ccfd776-58be-4b08-957e-08de59979f0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|19092799006|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1LS3EjnX+w/X7pB7dZx1N7h3YwuMGJpQNYpfiLJQxyWOE73pXnqW+atd52wZ?=
 =?us-ascii?Q?cXxyjwj3jLNo4GsaWcveEXjomkejrr4i/KtrrgHlkvL6nbVZ0NY+Yl7ImB2G?=
 =?us-ascii?Q?zIjlths4b86LvwN71QK23nHmIgCLMCb+DVnkTz9c+5+Zntg8ii6K9CJ/qXMv?=
 =?us-ascii?Q?DX3jlRSS5fsbStr0eHxWhscwpMReXrxHlL308HLuvQYgCYwVNAMavaXF963R?=
 =?us-ascii?Q?cVnVeSHtNcYqKmHBHffXugCYm0uFOdLRvDDbUXLSJxii8e7ADJzrPipDEAEn?=
 =?us-ascii?Q?0JAt0LbDD9SeG2e+25mkIktSgetFFcXLrkl9/LgrGzsD6ni1LK5/Jsm6H9l0?=
 =?us-ascii?Q?oWuAQjyv+ZlPYTjjj14UvAhy5fxkjROKpINLuqU0zqiUHRuMcKICFBzWaGoi?=
 =?us-ascii?Q?OKqVs2ZxZmyiMyZnwSGItUm9SpQIW849OdUTa9gG/4dMeU94cS313kMMkRBi?=
 =?us-ascii?Q?yOrDFRr3VBRU2P2u0lDRQV/LvLQCVj2CcmhpFE2ikzdoLDf8dTRvKAb7p9/5?=
 =?us-ascii?Q?N2/v3aDtLcEEvlDuLf5+lfjLxCcl8xbyeWFD17MPNBksdc8X6JoqZldZQpwL?=
 =?us-ascii?Q?PVbDDn+tcXL6d9Id7aORLq626quzwRRgmIfvUfKnMFdGuMiiF1zbIISbEkwK?=
 =?us-ascii?Q?Wq6vVwhSGFnq03z7LwhR4Jderp9PXRVREOkUnUR51ZDZefKHNLqsecJFcQON?=
 =?us-ascii?Q?B7A60Mg+3eEokK7vq8oUy3aExAi9QD+bqd0KPKcaL/24+Ff426Cy/jtHlbOP?=
 =?us-ascii?Q?IRbJxQErLRVrfU5HKGro/b5K6VDTQcM2p7Fz1VW52o0zPiqwJOyAWHt7eJxj?=
 =?us-ascii?Q?qud5Yy81nUUHtkCLjTGwzJdsgP2IWL/8w/bkTsMVSRYqJXcr9nQhTJq3rDlf?=
 =?us-ascii?Q?iCui/j3HKjtxO98raE1+wQ5RDyR54C3NebFSMNo02ld0Ct0K6Tv8gJ2Fy3Jr?=
 =?us-ascii?Q?9uBCcqynFq9dLQJ/1A1gqwuH9sbF29zsVfE8+/koFHBm/ID2fMuH5ysBba3a?=
 =?us-ascii?Q?+ui8oz1sR2wOA9+tyoe1/0kEOqVH62W+drNJmVMFHKGMDCjAv1OLuse8TK7M?=
 =?us-ascii?Q?WGhV8HEfXWoa04/uaHYx7DpDiP35rFB/iY3FA6Lf/f3XNPTzSllbQ4KMimqM?=
 =?us-ascii?Q?kyR0EFHo0kJwQKLBHOEM47Nmdt/D4AIWsF3/UBbPDn6Gec8qgnElqHgOnXCe?=
 =?us-ascii?Q?1eyst1BS3Z6jwyjLxbHZXIvMFyIdxSR6LLz12J+4B8+ap5ACIbBWhkUlSgxx?=
 =?us-ascii?Q?w5jtq4dlGYbDRAX1lBjk/W/wg0fOUoi3fVmxAPsnONRgxv3nllubbKFRC4WX?=
 =?us-ascii?Q?4Ifh0+wgCIfPTtLvzDtIcqP5udeNPYk23qkTn2JTfawyrqqjT8XvI2jI50DM?=
 =?us-ascii?Q?yDE1RWEyG+G7Kg+eLEijF/x0nIPQC++SXa3Mrazho6QFQM9HzwrjZKdoLz6r?=
 =?us-ascii?Q?5DKI7+BB4TfAADlDQWtnGBzL68u1E3e9ok0rysqtAedIPOFdI7kxV9x1+Z6R?=
 =?us-ascii?Q?/cvT+6RHtisK3kNBIsSPqn2lthFKfONamoZkw4MrhJlOcHgnuNuCjowjhRVj?=
 =?us-ascii?Q?v/g4UTVcHMVkisoiODS9tn4B6QcXZZc2WHX5tiQ8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8253.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(19092799006)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tL62zeuJBlq7yl++LpbmWr+m6SeYO/zhQIUk8tncu0zCva3APqdkNmFORibY?=
 =?us-ascii?Q?TaV4/zSYo09UyDqoUvCsO53LStNzSsoXnwxzR5TVxwHVpuXy5m0J23X4tJPM?=
 =?us-ascii?Q?D1YgimGmEiILEuCefUdA3Myc0TDDbxh6CDqw2fRD8p7uGpwoYl2duMnp1Yzj?=
 =?us-ascii?Q?nVpartqXMLf2eDrWNqif5VRXdBGtVG9IIrwY9jbu3mqM/CGhvEgp89OOPhwo?=
 =?us-ascii?Q?cSfPEr0LrctWyxhMaPaumfF21eNCxHQyP5D6mK47Xz4kg6aACBSEIsqwPVuc?=
 =?us-ascii?Q?69irw6CaHUsIvdiWq0jbixFgS34LLvso8ueuSdW8slMfIzSqf8x702KW7cKl?=
 =?us-ascii?Q?NIiD9IO/kbr7iI9WqfDZM3qGMdlRetqBvDwuP9FyDP1/kuo6IpWKA3k0l02u?=
 =?us-ascii?Q?Toy9E/VRLuvuCdwPvC61GEsgOgJ00hX6xxlIFks7cnB+gE9VsDe3knEQ4SOx?=
 =?us-ascii?Q?2Bbfdw6gE72xGC1DrGpRGxdoOojgLDyqJyJqMu29ggAJikmV74KTspof/OpZ?=
 =?us-ascii?Q?L7/AFPUmzw4MeH9D0iVyQA3bXEdNIV7QJ2ZaYSFMVLZqmBnCt0SgG/tU3BAU?=
 =?us-ascii?Q?rugetNlFoYxBS1JF7VULlxPEE4j/XJOaa4CDNFSgOwnrs4yJw1kPmxhJ9b7E?=
 =?us-ascii?Q?hFNl7/dFIdkRtFu5Y4dVMpLCE3B5v8At5onlL50L/QQ2AQV//pklZEma567w?=
 =?us-ascii?Q?R5iXewl5iLk97IGGC7WPdS81wg54c5KWpKwqVUhWmx1MDFe1Ckfruec01Q3e?=
 =?us-ascii?Q?bdzSpE/EtTTZRQMqWRgXgPsG6atkp2X3GgVsGP8bcrOp/WKr/YDszUeBduY9?=
 =?us-ascii?Q?kUrTMpa0s1yv4UwB2PPpVk/H5b0U5aS4ixvdClWzc+oKXOB97yJiidMLTZWa?=
 =?us-ascii?Q?x9Xnp0KSdDUFbdeYSWqZp8dsInK+S829gJcd7XRp1P+g3fy6n4AirrTotH8H?=
 =?us-ascii?Q?BkYYQ7UjICTAlkdzyeXhnffJ7vCNeY4dhQIPtKKzj+mRIDiVpEdEs1tpEsmL?=
 =?us-ascii?Q?ehg9/6/7sqezVTilcHWykpTxD3SMzGNHgmVBFhe4P4HWRSDScB1SD6ELAteg?=
 =?us-ascii?Q?FWjVzvH2MRYIoX+OZ1PQvuGrY5ZvCZD+N6Z4Ws5+fuOYoQ3Q4LOfOIGCm+cJ?=
 =?us-ascii?Q?LOBLpP0s4ESdYbM3ef2oDCtIg9SBVd047WiVWTkeiQ6snjftOVB0Rkw0Mzyp?=
 =?us-ascii?Q?qthfqnnQGnz9eDtQw00i35PKMrTjLZNazIG0x2cVYDjDYw66ZwGSJsWDF6Uh?=
 =?us-ascii?Q?jNHSfjCrwH+8qVK/YRt5AJ8YN12/qiNL6qmqLVBbp7Q/Sfqu7k2CdzoXNZJ2?=
 =?us-ascii?Q?Un6E1LR7uAlH/CPwDJoVV4DrE3eUWM+0KjbE608j1L9fVZjxoF2PVZARLvfP?=
 =?us-ascii?Q?5n/t+/gaUehasI2d+53Mv81TCnxdmF/lmvNE5yS/OBkueg0kxtdGnK4cfFQo?=
 =?us-ascii?Q?/WN+PzOA2Gu1/UVp+Y4HxvhHLOgQ20TYRDiwEGLklsL/nRDolyesLb2hH72+?=
 =?us-ascii?Q?k6oRVWCjuYNz5lmYqsCw4AQVXBblhKqI+iUYuDADBcRwvOEJABjUy3Gbo8sn?=
 =?us-ascii?Q?Q81JTFdE0hkRwkPmkInbk2qtZXXUBa1pcBrAXnHWgTZDCO9hR5avm3lX9Llm?=
 =?us-ascii?Q?VtxJGMmMkjMGgEYfZGtTm/nXIweTiYuKcLHCujQponDsnLeLg5+ptwj/NmvG?=
 =?us-ascii?Q?/GRJZsw3nk/mF4zxCKp6Nnp8xt62AXhL/baIByfgN6sxMh5sQQaTSy530Ksl?=
 =?us-ascii?Q?MUP3Q0/Low=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ccfd776-58be-4b08-957e-08de59979f0c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8253.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 09:21:28.0494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m1zjWD+aVVxcCgXSrPiLo/4wd7mQrWkQdu98A3v7e32c3PMRl/GRkE+o0ek2V9QnadyMBD57CQ3fFLwzA0wV5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11605
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90146-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,arm.com,8bytes.org,oss.qualcomm.com,gmail.com,quicinc.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[nxp.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ioana.ciornei@nxp.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 7EE8864866
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 03:12:01PM +0100, Danilo Krummrich wrote:
> Commit 0b4eeee2876f ("iommu/arm-smmu-qcom: Register the TBU driver in
> qcom_smmu_impl_init") intended to also probe the TBU driver when
> CONFIG_ARM_SMMU_QCOM_DEBUG is disabled, but also moved the corresponding
> platform_driver_register() call into qcom_smmu_impl_init() which is
> called from arm_smmu_device_probe().
> 
> However, it neither makes sense to register drivers from probe()
> callbacks of other drivers, nor does the driver core allow registering
> drivers with a device lock already being held.
> 
> The latter was revealed by commit dc23806a7c47 ("driver core: enforce
> device_lock for driver_match_device()") leading to a deadlock condition
> described in [1].
> 
> Additionally, it was noted by Robin that the current approach is
> potentially racy with async probe [2].
> 
> Hence, fix this by registering the qcom_smmu_tbu_driver from
> module_init(). Unfortunately, due to the vendoring of the driver, this
> requires an indirection through arm-smmu-impl.c.
> 
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/lkml/7ae38e31-ef31-43ad-9106-7c76ea0e8596@sirena.org.uk/
> Link: https://lore.kernel.org/lkml/DFU7CEPUSG9A.1KKGVW4HIPMSH@kernel.org/ [1]
> Link: https://lore.kernel.org/lkml/0c0d3707-9ea5-44f9-88a1-a65c62e3df8d@arm.com/ [2]
> Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_device()")
> Fixes: 0b4eeee2876f ("iommu/arm-smmu-qcom: Register the TBU driver in qcom_smmu_impl_init")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

The boot lockup was visible also on the NXP LX2160ARDB. This patch fixes
it.

Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> #LX2160ARDB


