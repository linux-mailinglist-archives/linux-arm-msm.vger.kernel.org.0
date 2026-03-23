Return-Path: <linux-arm-msm+bounces-99110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1CviHQHjwGkbOQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 07:51:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B6D2ED2CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 07:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B1808300B3DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 06:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A3635BDAD;
	Mon, 23 Mar 2026 06:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="Khg7aAvy";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="bJ8jLW31"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D24D332628;
	Mon, 23 Mar 2026 06:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774248702; cv=fail; b=uJ1sNm1MM8SPFiHnWSdtt5kp1NwM08n/qsLLtahVjVXpwux1zIkcEz1ERquECmVdIR8XAIOdpIRUEdAldkaXw7yGYlihWVgP6OQCXgKR2Rh22WLR6SHZ+/rKzjv1U1P8J6II4kHlaACZf/XeG5aj/Rz4Z2JOhxp6ApCHBZzaD58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774248702; c=relaxed/simple;
	bh=EFZdOlLc9bNiy1dhnj0Cdh7vv8YAxTEyJQfj/r0Ul/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EGm23+v6cJDTVqAfT9cJ/VMeH342IA29HdresGLUOWR1x3X/+BpH+ad5QDCAkMtfbBvx+D1kof7VyR6XQM0XGp9+3iVIGCpZAYS/KE90ZyzTXpd6KWATPdeYQR0MjO3FDXeIqbsBp9x2FZNdiYO1gLrRYsGBpMwpaiSfQMpuv3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=Khg7aAvy; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=bJ8jLW31; arc=fail smtp.client-ip=205.220.184.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N5526V492732;
	Mon, 23 Mar 2026 07:51:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=270620241; bh=gxMg02W7BWjBhlmLCo8cYk4k
	ZG5ja0mtXwdAlL4XpM8=; b=Khg7aAvymoG7D2GHomt1VB/NQwZ4FnmnNWL0gWQC
	6JCzJYPaKfJAIRJX+CGmI6ZK5TTwdbGvr8kBrCjVJSbApZPUoJD0fpr+3sMCmV1e
	FASfugy7kb63NUMjjSgPM/dTGMDSbCejSfTBMTOk44J6ZyqEB5fen+IGUan6Ewjf
	AngHkVEHMtP45t6gZl7gGodLVj4FGcwyNxwPXIC4E+RDH6UuUAEtTs0lUyOjRLER
	a468CX1z/0LlckWD1hhmfZXO+reE7MeFJv1U4swvmARTbE4ZeHPqCKI88ivPTy60
	ZEuj2TOxb8gYq+jD/qNahgrhpTZeCdurXG4+u89gtQ4atQ==
Received: from pa4pr04cu001.outbound.protection.outlook.com (mail-francecentralazon11023121.outbound.protection.outlook.com [40.107.162.121])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4d1gjd9hnr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 07:51:15 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQRLo+KBQ+6AiV9zvdIe19sCh8Ux2qAUcTB6ozGQVrNlwt5T5UojaP60OnATPMcfLLU4totg1Bl6uxGj1uQDeyrYKpjzH/A0Nvt59mhSnMpL0thoRsPi7Vm3T9AiJYliCGYSDAROVeAJ7Q3XiOU9uiosHCXk63xpNeR6L3NpKCaLbE53pqKXcg/na/UE16Pt5Zhv04MS2rdQXoaTfWFc2clyxcevWi4NyNEwkRVLSjgoDUWfdaZ2V3DKOEOVwXRUC7ew5R2wi2qJz65o51MKXG1PTkrrV9J6ddWPV6h5Ze9r5d8seBzA83mh0gEt/CwlibX2Niy0Dtoo1aTeZ3Sudg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxMg02W7BWjBhlmLCo8cYk4kZG5ja0mtXwdAlL4XpM8=;
 b=wEPSuK4ItrDS6gas8m2r/tlmpu6fsREVecnqMdOEJngXpB2Is8oZzCShVG689BXp7HaMnxVPc8wflgWy0PFd170beM2rn59D3dpvvbr1ngzKV+t+xnQky+pIkukG7//XfREZtaQJTcWCApTVdeDeSit3QxBSyaIPBkhQ10VVx/qXSHpbMIXyKd4GEc49OnLSep+78XLXFTr56qZrqXk4fQ5Vxbk+wMi2tuYYl+3BtTKjb69V/w47SJsfzZpx7pvvWVxPeXtxZGGxdnjditKyXXF0JB5ZLzXeC1AG34MW6OU+LfqhErL0XxZrwibjg1KJu/Yt6/LehmPFdzKssPXXyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxMg02W7BWjBhlmLCo8cYk4kZG5ja0mtXwdAlL4XpM8=;
 b=bJ8jLW31wlxq7eCj40k1teQZNJilHZO57ZlG0ETEa/8dZMU+NiV/tFiwi1L7Rmh6bWM8UCDLbVwZtnLNfPPwrHyQSeUKq/dBtavN1UtyXIl6P6MxmyXN0Z97FEzFzct+OsVtSVB1pMYEOm3LFDRnC2W47efITtQAT7SOUoLV6o4=
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5e2::11)
 by VI2P192MB3291.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:29e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 06:51:12 +0000
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b]) by DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b%5]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 06:51:11 +0000
Date: Mon, 23 Mar 2026 07:51:08 +0100
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Simon Horman <horms@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: qrtr: fix handling of confirm_rx field
Message-ID: <acDi3JiSjbr4whVK@FUE-ALEWI-WINX>
References: <20260320-qrtr-fix-confirm_rx-on-big-endian-v1-1-e1a337dc1a38@westermo.com>
 <20260321101926.GY74886@horms.kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321101926.GY74886@horms.kernel.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-ClientProxiedBy: GV3PEPF0001DC10.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::271) To DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:5e2::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P192MB3090:EE_|VI2P192MB3291:EE_
X-MS-Office365-Filtering-Correlation-Id: a8b10c9a-7168-4184-3c2d-08de88a891ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RSVVW4phNBX/S0329yoq1m/jw/3OdDl8F50zuc7uzDxX0jI+Up5aGZ/G/x6aUelJ4gmr00L8C43HEoOEKjS+sLzezX56bO7BuLwXP8zuxWMoNUQQtbnrkjRtAg8pu7HBIJzm/Rk2vD11D3j4USWm2U2A46t+19iSsAzIIWAS9VFMABUHZmwbAtV7ZRmUOMorz7JfyeDSeatWvfjyrUHHjh1B2ZeXfR/S7N75PRP0JBkC1iarQovaO2E2+0UfMjXuxRegcEC+Z3OBPIKtzlLQCjE3HbwKnF/bZlze5kRx3RqIQZ6hwirs3QTL7Bpex01QoaFAoi4hOcp/3/Z0mPeNgw7fv/S7OHAPE2fV8ScKcgVZlIPKHS0YlAB4O4lVRDxEKgZhkIOUruIBKW4LX9wYj56OnxTodflIUO651QIAuPY3n8ohjbwkBIGg9g9LK08UKi8sPXfD3i/iO4edXCfvmrYXLqhwVZbylWJ1DOWQHcjEjqDNE5HQ70gcoERfzIVkHOC4ZZr5HfWant0REL9na0FC9f5Rrny+jDNA+SevBqlWUaeQ4k9K7Kh76qWeqdMV4v0hx68guh+WKHo68nc+/U+fr/1o7NDgDWDn4kBGWslpjt04RSW9wOzZhVPgH28jca++4PwLhYso2w1JgrcMT4zPxmKcWVoclbQ+NNLPzudED+HityRalzBEYHm0q1K8ZcS1ehX4iKeUBihgo6JrQap7MSph+Uwfj0r3GHaZb0c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P192MB3090.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M9KBuwJ8KscCwtdq1SnnfRKpSX/qYmITHG/ffwt/RLsb/9Du+j9OQ4x9YcO1?=
 =?us-ascii?Q?oUirzYUBqETR6zCoNzkui2x22UkoqRNjWBcRPOfoWhQw411ZnBqXQMuq5M+O?=
 =?us-ascii?Q?1tnsWmoSObsXJsOvQQq0KiL28Xg49ShVSwwEqaeBgZBYGaqJ4Wyh0E17ylth?=
 =?us-ascii?Q?Oh4iwa1YDcyOKDPgn8D3C6SIhOhosA03u0s4+Nz524HEtiIHIkQClJY6XTwZ?=
 =?us-ascii?Q?+npRVV/PJ1Zu3hTP7t7kUtkltlUjIl89c38CeqZZRvlDKOeS/dHENamSY9Yz?=
 =?us-ascii?Q?lD3wFZunFy4xKP1LPN6t5Ns2tpZCTO5q0FBksO9oSmeLVJzNQGz2UXkfBCj6?=
 =?us-ascii?Q?2rxe/oSRLc7EgRWZ67jnXLchd0rTbM0pvhyIb8d1VOLGf9E2A/IWHseTaF29?=
 =?us-ascii?Q?JHxDtQSR3QpWp8CppZ6NUzmtilM2tNP/ihYnYsFgE25cdV0e9hiVEcsx1U71?=
 =?us-ascii?Q?uScNfs342f8S/9oG00FELw0XlCbBtVcYGCRP5nohy7uwgA9rPSvg7wghc+Em?=
 =?us-ascii?Q?m9fqe0jUXfXLVGtEApCf5cU6EZnsbT35i5fLwj2wrrtnehyrl8OSKmdk6EDs?=
 =?us-ascii?Q?ATqlku5KczXFwtlqSbUMkLXqeHqz6r0uvq49tUbksvoLDFoBcQ8YSJaYaOSI?=
 =?us-ascii?Q?HabkD8UVztsR6d3xONKz8r027xtvHBgJmU7j/mOaRAUaovQURUMrse9SZRBS?=
 =?us-ascii?Q?0/H+Bel+l2pRAeu355sJHcHXj8e6NDt+eWmvCXBBlvvoNd+zE2m6fTFE6gyP?=
 =?us-ascii?Q?QpSrRkZCTwcj1Hf47YXtzJUQ+SjfI2vD4h2ELswR5b+/uHOpR4RYjzqdxfMk?=
 =?us-ascii?Q?/26pUEGbRI8YEEE3U1J2f8HQhBNWEsCz3/6874/Wp/ukz4bbTrvBNzlwOU/v?=
 =?us-ascii?Q?lW/jyjuJeCj4+BaFIl7rO/PBra0NanIpC8IWJVGEC/M0ERStPX2t+pEgL573?=
 =?us-ascii?Q?B9NMm1+5nCXMMfI6AVcdHgqiqPfQs8PlE0l44qFsekImL6gnl/g8xekgK1fr?=
 =?us-ascii?Q?QtJpPRyBEPrOAdOFJWGt12/RqHiYNKx90Nx3NzHFFoajrl0EdF1dExvbj7h2?=
 =?us-ascii?Q?udIto2NqAJOaj4W1xZmil7JA1E8qmut3kXbmXwulj2G22+Z6xWpyh6zbw6+q?=
 =?us-ascii?Q?ha0QFcBbjIfI+wVd5cuPxfedC5tMsRdnoCluNgScdUevgQK9NCD7mnnSSZoV?=
 =?us-ascii?Q?9Qqgr/wDPfo4HD7bS+fUKPh0CUkTL7hHy/G2u1yLwfFwOdkmGeFC0152CMhG?=
 =?us-ascii?Q?ZHgHFfu4IOJX4Y3ep1z3AgXaFsFsXPgdNlmrr1PIoewsM5DThiE+PCufOTz6?=
 =?us-ascii?Q?e2EHHR7/fbH7kOxuurAmcrgLKGEEDXVh/6uEzwrTK5FyAIRA5NWYA5YB3nvR?=
 =?us-ascii?Q?IoUfDR+8UuEzahtHKAwj0e6RDyFcr92bJbIpdbYsoKzPocFoQtF7da99yuqA?=
 =?us-ascii?Q?mysQMNZtsVfh5AV2uduygOAwtheC9NVIPXJ9+rJcdWYDoOdgakprc/c0ohQw?=
 =?us-ascii?Q?ePArpMGknTSivkO6r4OxrOEaO4ZZV7NQi31vZs68spvEgoJbscvEoDU9A2iZ?=
 =?us-ascii?Q?clTwbaymb6Mu/zSLv7n73ZPt7ToWJ1sqiTiAh0ihxPd4plyjgqygVPh1oO2j?=
 =?us-ascii?Q?HS6qhGtwB2ontI7NKFcoE/u7/NoZpCCDT+tTZ86Qxx9SdR7y1bPPIdv0rqd6?=
 =?us-ascii?Q?zyEJKO73VysfN1zkvr3mfPVoboeh+r2SW7l0M1AizRkTsMs8tzn65bGmElfv?=
 =?us-ascii?Q?G6jMXRBc8Q=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	a8qwlnAyqUfb54vSZOqDpgx8321Lt2M6OFfuuJUHrx9gLh6z3Z9vQl8MSx438+LZSqfNknJHnLhYN1XsMR7q5cG2btSKU0nEHxgDN+CgZrkDSs27//1UxHd5LDAh05SSUL/WS6X3ZBxbKb/Ac7YADA9Nkqhiw8TYZ6iEAZZ4FxGqpP6ku/mgfT7rgCm6SQDrtCp1wZL7lJAAdIqcKvYBRoi6FpYcFqcNgq9h2MFHLbzm+RNE6kcFPmWENdD9T/c783zUTyHSO+2Y3GyKvP3Vx9prXrkH/5Vs5CtQWuku+nP0OVSV2+SmcQvE+VhOUMIAwbfjMw2zi+3CPSdk2NjU6A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	R5ebrSMhr43EBMZ8F3/EVYua+JGP2JxO8e5vLaLxs3s9uqCesj7wTFKuWnQzxyTFNCMxAauuHhij0uF4v6nKbyswqpb6Vi2Svl8GYPdcsG5ja9Sz0BjlC+LQQY5+24nVFd8kYi29o3NfXy2m4kjTzgMbBklaYS2Pyl3SobIMq/0KILlEfr/THLG5kONMSlsoM2Y0Sf9mEn/hm30oXiciKMQUtHTIAkG7pIopJMB9ZAKwNo3ZDah3HFqX8YKXGE0PQ25HB5PhvGrt3LemRiSA+KEW6oh1IYuTPVXAXzQXdmdf78K5JWaMB0eqM3lK+rEZ1PS7bNBu0xiPgiPj6R7VIrSpChlyqlnotkhopVfUfk+FxbuyyoQKzOer5fUbSsSljApAroom/HlkmfV2vP0czHLTa4cBULYNJW7v4crVvMkwq6I9TtlRJwn3oPY8UhTaii1P+B36PO8gunjafgzjWdqedl2oZIMTYSF7jaDagSIzS1n6pvvqgyHA9inFzyz+OoTYHUAXIYDzEppq7HufXMjqZiUX89Uda/IiL+DcHJH2J6yZxTggxk8jfWAiX1mNuY3Sj3FLxJ4bPcl0P05oSYoE7rMZ+Jz72AVBaWiyeX4+9CaYavnBNpvtQvzcU4se
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b10c9a-7168-4184-3c2d-08de88a891ce
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 06:51:11.9045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fjksBbGlt8vfX92IhHjX9XMdH+SjOXYnBjedv3adSjpmaA8d1YR2Hwr2nHYlzxSy4zct9BteznkUh6gL1aObZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2P192MB3291
X-MS-Exchange-CrossPremises-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 14
X-MS-Exchange-CrossPremises-Mapi-Admin-Submission:
X-MS-Exchange-CrossPremises-MessageSource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-OriginalClientIPAddress: 104.151.95.196
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-Antispam-ScanContext:
	DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-Processed-By-Journaling: Journal Agent
X-OrganizationHeadersPreserved: VI2P192MB3291.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA1MCBTYWx0ZWRfXxW6QFJ3tDZdW
 2zpdm6tXvCInX5BLATUf9cyZqUNXSUXN7hr3YEgSQKF2xIsFzi3TCt2tsHm7Ya2kdHc9JpzG++V
 eKn27UqkjV4R95W4SKzbKpoDXL5O1Q8bewXLZeq7TFH5Mqc8DWNlX2X2moninI9WEUeu3Vtp/vK
 U4RhE92kFr8wBOlAftkVnBt6+EV9Rzz/NIiEjufKu6GXEpMJJ+8tg2nFcem/JKnWtJ80QyshemS
 VITh4HGQc/VnuXcrWe31EPOtuZNYAcLAyv6JZh5/Sn9i2Jn8PUrxSOcTZSSBBw6GVVYO6deHKM8
 t9DIPuEzk7KNNLkiFAS9PeC5wdBHOls9OWkjgMauupq8A2viCr3JqhlJ+yD0Y2eutQfNO3E5ypd
 yJDj/KgFtouhjcaWDwkWMyV3OdgT6WQdXMqHXZaZhCPRrP6nwTVoHx6TSToWXmnrKLIf3D5gYtH
 E907+Uq8xxwMX+5hhBw==
X-Authority-Analysis: v=2.4 cv=G6YR0tk5 c=1 sm=1 tr=0 ts=69c0e2e3 cx=c_pps
 a=bcwGhgiONHI/shJbwOsL1Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tr3XZvuDWTETL0Uaxejn:22 a=8ys4xmT3Mru1TjC2zVq1:22
 a=xIg7_Bo6SZ6xne73jiIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 6FSBdD-TFXL52AD8UyvSYKwdnp1pyx1n
X-Proofpoint-ORIG-GUID: 6FSBdD-TFXL52AD8UyvSYKwdnp1pyx1n
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[westermo.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[westermo.com:s=270620241,beijerelectronicsab.onmicrosoft.com:s=selector1-beijerelectronicsab-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99110-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,westermo.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[westermo.com:+,beijerelectronicsab.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.wilhelm@westermo.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D5B6D2ED2CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 21, 2026 at 10:19:26AM +0000, Simon Horman wrote:
> On Fri, Mar 20, 2026 at 02:28:52PM +0100, Alexander Wilhelm wrote:
> > Convert confirm_rx to little endian when enqueueing by using cpu_to_le32(),
> > as big endian systems otherwise interpret the value incorrectly.
> > 
> > When receiving, apply le32_to_cpu(). !! ensures the result becomes 0 or 1
> > in native CPU endianness, so this conversion is not strictly required, but
> > it is kept for consistency, clarity, and future safety.
> 
> Hi Alexander,
> 
> It seems to me that the conversion is required if the code
> runs on a Big Endian host. What is your thinking on this?

Hi Simon,

Yes, that is correct. The patch fixes the control flow on Big Endian platforms
only. It has no impact on Little Endian systems.


Best regards
Alexander Wilhelm

