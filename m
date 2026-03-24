Return-Path: <linux-arm-msm+bounces-99569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNovG+M3wml+aQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 08:06:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DA6303AEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 08:06:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 109673037EE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 07:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75172399352;
	Tue, 24 Mar 2026 07:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="objYn2s6";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="jyQ1vEMx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx08-0057a101.pphosted.com (mx08-0057a101.pphosted.com [185.183.31.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B2526ED4F;
	Tue, 24 Mar 2026 07:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.31.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774335954; cv=fail; b=ktf5FASsfgIu/317Ewk3Sf+9x+3N8mnHjA+iq6JJbq+73ufkKZZ8g94UCyCV8lzqMVFcPMIrpCep5g7SIxzosqR+i0h3aASMO3rUSLorkkchSwysFlNXMNKG0gkXxUb37fSlGPVa3uqa9e9ltz9vGgYyfc0+m6q1wzzk7Tiz/LY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774335954; c=relaxed/simple;
	bh=e9zGmzh5b8ZDEIdKdXD+nRtn1JBwlsEqq1k5+/1pnDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fOjKkpAj0UzbLe4xVDP6QPtvms2hRY+m+M3nQ8dkr4alI2RTIacEipC5pLGjT0xkXyGYF8qZVmQCtXmAiIO79p5yc8VOxwoXcWpuA/UoVys35hstKMdSe8TVKRaU7nL7GHGDuyuB5Xhy9WDGb7TcVnpETefxi2ZM5re8HPODNCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=objYn2s6; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=jyQ1vEMx; arc=fail smtp.client-ip=185.183.31.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O6LM882947010;
	Tue, 24 Mar 2026 08:05:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=270620241; bh=mZdh8aDUD3kw2eDnRUevjFJ/
	4EpGjSx4M6MZk1cneqY=; b=objYn2s6r6kaDalvXzHdonVAAWGLJkWcV8Yo2fXh
	7Km3di9LxnOqCimr2FqpDJHS5A+p3TDaBTCw/HTmcTX3vjLKBmGhJ69CL0mge7f8
	A3AEigc9fm37zwTLzMWtXNosj1SYOczlAMismb3FbDD70J2YJSIbzdjGSHMcHjJb
	425+6yuC4sZ/f41UcBoEZ7YKwQVqCFHpuXR8V9DaIcvRQieIp0rNmE+p/6e04cf9
	j4GLgODb2YvUw9+4Y9fNl1OmvnlnYiYA2Jh6cMBYgiPsgGr9ziGFLY7lqZT9T8YX
	gMkY6p7MYBILE+ZbJTYEZhE+wuJ6KfKoj9uY4m7a4WOkDA==
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11021096.outbound.protection.outlook.com [52.101.65.96])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4d2p699cc4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 08:05:34 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jYvdRKL1qmY6lLwezrLFfqXwUR+HmTfCQCCFDZUcRebU+ZhQ9IVjAY9YZG3CMqIEoEnCjxQHJ8VXvs/uyrKihbmewRr0JCxZzgrzl3TiMBmkE9Pyblz9t5viVM1cutpFFPDLatvgElH/fF12cxWukOkANHpVkIjqwd748itFCnuuMXeNcr0CgBh8mlzAXKON8xieOdb0fsDP5rKIIwkybyDbWMJSLvFX/aoWR2Uz77rhoaG7tClawZNM90e4xmKLU5MzbaNh5JY7vrHutVM8vAtcfz6TQWwdTt/uwJfs4k4IKnkPnC262QbuJ78Dlm3EBU95yJrwmPQ/PPmzZNQ6iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZdh8aDUD3kw2eDnRUevjFJ/4EpGjSx4M6MZk1cneqY=;
 b=jYk4zIWchQ4z/0vnqJD7BVDi4/tE6mv3O1/7fsIT2HHdzikHqYiMp2X8c9Kv33YtOqmrslPp3Iqv7G9SlhMjsGhFxFbS3XbRMtKgw3KmiK+MtRB8V2CIDKbdHR6h0OhksOizi0GOtrl02i3vldgQo3PiRgePawsiyMiQc3IfkYNM4ErcarXnJ2Wir9ONnXXnGJYj8+sxk19WuUR9bMhvmBzg9+iCTR/0NcU2haSwtANSp5ug9U+OJYM94+Bs+9SBEftkGsAfhfqZkobBWzv4S6SsX3fVEFqQGhpm2SFs1Tt6FBVCypwP+NAObdCOmYdWjCaOURRIlWEUiSjk2cIavQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZdh8aDUD3kw2eDnRUevjFJ/4EpGjSx4M6MZk1cneqY=;
 b=jyQ1vEMxkx/zkD0vNJEQEsFxkFw3s1aCJuoGwyK4Ld9IZbcRPaawgHPt+z0uNXowoMw7yxk8pa9qZqCL5oq5gCkbR7nuJ3fpuS11qYr5GvOyTWeJkQW/p4bG0jgBHbR8h+HjMAqR9LZBWhE+IsFDPMQ0jhijk0xOgBZlh85lQ1I=
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5e2::11)
 by AM9P192MB0853.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:1cf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 07:05:32 +0000
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b]) by DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b%5]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 07:05:32 +0000
Date: Tue, 24 Mar 2026 08:05:28 +0100
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Simon Horman <horms@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: qrtr: fix handling of confirm_rx field
Message-ID: <acI3uPjEoG10qZQs@FUE-ALEWI-WINX>
References: <20260320-qrtr-fix-confirm_rx-on-big-endian-v1-1-e1a337dc1a38@westermo.com>
 <20260321101926.GY74886@horms.kernel.org>
 <acDi3JiSjbr4whVK@FUE-ALEWI-WINX>
 <20260323153254.GB112574@horms.kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323153254.GB112574@horms.kernel.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-ClientProxiedBy: GVZP280CA0006.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:273::12) To DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:5e2::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P192MB3090:EE_|AM9P192MB0853:EE_
X-MS-Office365-Filtering-Correlation-Id: d6be9447-4aca-4b89-4691-08de8973bd39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	m0tXhLv3tNDiwAbJAKDvkvpkTe4KqPCH4coLlPai3/t9w9j+HYC24rxpTgkZEq1rin9kzujUxzu7amwGKba+SOoa+hSmFlMwiwFOxRbEY+XU1Eg7zVE8O+iHqfLbxzh9zojErCIaeHLZxzvSNtQumD6dn4sbbtkQ8W/yGmnIhPo3tPplZ4Yg8Y5RgV6LRknSE47KZPx4LMwbtPvMdzLgnLUrB6rn5dG8uHCi2viYzZGAk8nmSK4Bu7oBVdc6k4qUbvSMdKrmDY+BnGm+D/vVRqi2FZx9uIXwujKZYCLbbqX/xkyjCNLEwtQQn4sHxuz7lST+aYITr4xviDfjONGZ2TFjr2YAcE6DLWB+iLyYX09EjuUWSCxp22y8G3VG8T7kQVduhTPipDH2bwW6gcpin0FafZBLkKmJkYuNPXhpKXomU6wWzlS6RVLAXcN1++djN785wR6UBnzdIb+pjF0LLeVAsYNDW4J6yJX/ZXqESrLUkheAYZvSHrni4aT90ycDTNXrxmRHB6Zi3ko4sBZUIp9O+W7R/LElEsGqB+B5xEl0HYOwhLvzuFgStepm/qryxl/SYVkkZdJkOCcr8PGCaAwTOEXg2HSfLJ/5H1IdAjufNt5h/De+5L8/JZ7st4n+Oun04yEpOG0m2aX1DDh4dhMRqLWRpowslJKwQyiFWwAVRe8s6xlxpCme32xe+NMMvGxKbjLFa8dbldIs7b9BXRor7RZ+oaASrZFvLsTNyNQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P192MB3090.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uWQOVoUmbKFDzwzuvqd7mPckY2GC/B3AFP7JpNENJAdPOVkzRhFJbxTTgD0a?=
 =?us-ascii?Q?J6GXi4q9ms13R65Z+iG8drAUNz/eWSkpbK2n8tDSN0lqCK6Dsb1CEiGDsF9S?=
 =?us-ascii?Q?uVPdtXExeSZfpeSeNKdZFZOXbpbMUjlrXZEyxVzeb8RzcZsSBSCFJCG/uvbn?=
 =?us-ascii?Q?ID7emA21Cn8sMlgDp+AA9ee6ZhqfnT/VkobRext6lnUqiwpaHPCfulnnlLMh?=
 =?us-ascii?Q?DZtnqaHojDuXmWVnHjHK4Powk8UqmTMSIdrUJyZPltYHUITm0Q2HEBLftn7X?=
 =?us-ascii?Q?uBpEy22khfcipgGKwiyItsDj3+6jHDyaqGk8XKOgLTEmO5AyAMk3IQJvkF7O?=
 =?us-ascii?Q?2oC54oeqTdGmbJtrGIMR3g8bmbkiihcjyh/WbyPfomneR1/dorBKoltgLw1j?=
 =?us-ascii?Q?2gmj467tKbF1c6AecktWrPERpx5JbzVqNJAwQ7MUZgqb2i3tDinjG47kdGi3?=
 =?us-ascii?Q?DvXypOPq78epqdTzGiVgCYXf1+SD9lZSyujF0Y9LrNDgPb56R3PxVvRPusbd?=
 =?us-ascii?Q?nx1EhuyglRwfN8f9nC9vbM1aEvhWWFHHNJJFxhkAalUAABWThdv/oy10sFXx?=
 =?us-ascii?Q?RuubuwPEyVwiBgzM54u9JlS8WyA33mi6aWPLq5dHDkwQxSTMOlIOFoQAEQlB?=
 =?us-ascii?Q?2mzgqu1IWywt2KonZ0u5QIgoD3Fhu/hr0aDu/9dCiLOPN53OcidOmrsgNJyG?=
 =?us-ascii?Q?+S9EE/FMp2GxsXMjdmZKHt7Q9PN7WIQV92Bf+1QmTy4qj5mLahc9Bhnn8yA4?=
 =?us-ascii?Q?YuPzWLbCqRQk/UgmajbqytubDTJEAolEyS3/n9tTEPtbUOM1wgZ3FXEB+XNV?=
 =?us-ascii?Q?31TqCzdR0S6zCv95d3TAmgJjj1kZ8OkEkjiEAYM0X061jAwBmrmW7sb7+Ptj?=
 =?us-ascii?Q?sHfnAPsLwdJo+wsuqqkOMmbD6eUfCo8SwYjJT6RqeaV8YSvipaPhdRjSivYX?=
 =?us-ascii?Q?xtiTkIdagwKqTrjCanMtTGSf03dGzyj0jIcYHKdk8lJdPEdBqq5SI8CXgbLl?=
 =?us-ascii?Q?cn2HNzS6XOv/ER1yWaL9r6ePvqtwzSRx7bWyrDtF2buK0cDpzu9zihHqT2r9?=
 =?us-ascii?Q?wPxKL/Z8MqNBPWj9h9s/90lpOg4rnQbV1b85L+NHxZAHYwvFwFsPyPhle1ZD?=
 =?us-ascii?Q?hrJKaoxdXu5L3swop2KM0DnL1hPfUEEZQZrSKChtLZi+Zoml7xyA67J6a+D0?=
 =?us-ascii?Q?l1dX9c8fxiJj3R77amEp3lsKFuIt6g8zuaqCr8nX/LwqIQ6l0+fEF8bzWBDU?=
 =?us-ascii?Q?cir0D0Xz80Biteoa67xj3HooX06X/AbPfCGVQEqYHrfgaAYdokyv70kE8IAs?=
 =?us-ascii?Q?TY+ww2rLvfxOmvQ5BTMv7eKejZG8znf9rnrQ97rR77BqFR0L/jkiIVCi91EI?=
 =?us-ascii?Q?kCnFG6soYSCuJW0zQckIOUN1zUUg/S2d8YP272dvZyeHJ04E8B+Y46d1SS5I?=
 =?us-ascii?Q?9jgnCGuD0phfp7PFTUKNN3Th3lZuTUig/0hANB67r+eYG7aBHrSMuq3N4Jgr?=
 =?us-ascii?Q?/lsAbyrUsZtnujraLYZ67pTVUOOOID1jrR/Ov5++HiwV5lhN4/F+V7ujhQq2?=
 =?us-ascii?Q?C3OmrzvixCaSQ3EF9RrTOUQo/zs5L9J0YPsPMl6e1aqSiZThBHNWO7xgwjWs?=
 =?us-ascii?Q?v1/NpjXFB/liExg53PO9mSxQKQf0bRfjocM9STTBBh8d4U3CpmUEIKP6GS+l?=
 =?us-ascii?Q?It+nfctBCj0LHNm3NDRtiYL3lyb0ebbixYf32U4ZiKSK4ohf1uOGLWeHAEiT?=
 =?us-ascii?Q?tckEI+WG2w=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	wh3Dea5bpxnyM6fGSP3bTzdUI0yYD+EyW+d+M/Zvlm7pZEt+/+YGP/sTIL5ndMt74CKYvkl0Su2vsO29Z8hzKiTDw7yQynke9TZDVfjUG08we/fVfnQ6I8Dh7l7XO/+7h+4OP2TRF1kfxyPd0nFuRjdlCabN0gfW4JdSFxgP6LWB1EkY+J08ynvW+ijXGBwQYrXsajCfb9qZ2Kf5JN2Zvnd9UJYMOKmS6jJLia4ETNJVBcA7ICTxUhads5wTcf61E3hur+athbFbCQjNmuS14gXGREeOVJREDSA1ibNQnCCMNKqGKNuVQY6brc3RM6QrT/Ed5zpeRtcaeVMDPuTkLA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RDnah9ghWxOc2kblP6O/Vv5b8gJZFWWJeIuGf3ZKgjfu5mdL+91k4kyCEr0LNbYh+BMg/MJSuY8FC2Ucz3n388bqPXjjggZ9jcYk3dXxNbSELDBCsnxptR0uWMW1LAqgoBPiBouyn9AvPf7XUhUX+WTmS3D8nRh686RkEEfNuVyQ9ZphU8U7PEm22fCy2MorOspEb86W5L2b6Q5rn48iBkm2FzUwliyawazQXUUF33L/ASyJJO+d7DMz+ZunD6+6CDGvoQ20DsyvwRffsmwoyT4eyl5a/TWvfUKFs2DY/Ch1kW3Eif1sXKTEu/EmbKfPfGnMeM3DnmHvE3RHfJQexF6RvziJ8vG0rXkTFdX0mPaNUtzXghKX1qSaeR6nM7b4JGps4P7m/2yvEtnLTjAoKEfIr20xviWMI0Nvu4ePfidtV0aQMU4x/SskuRFFatzMkHCZXJBtgNbIOAcQG81jThCpfvdAI4JmSBTd8iPWOtld9lnaOHk4mQQpzkQQaJTAH+mSv+T8kfeRcZDYlfWE6hdHatz7WssA8q8ERlifT/bt2fZLdP6ARYjjeinLWUY0PBWc4mDpvAZWOgNJdzVOS8klQXoinfqsFJyKZ6TVWqh7Pcw/8czGQsPyDLfy7434
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6be9447-4aca-4b89-4691-08de8973bd39
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 07:05:32.3436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s9THenjWJQy+FXpMT0LU/mYaj4PpjiiTvFKvKbjVIFCOHSTMLgeNKU+CRVqGh5IJwD1koBX4nA5q09KkQJxeZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P192MB0853
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
X-OrganizationHeadersPreserved: AM9P192MB0853.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-ORIG-GUID: jY3bpUzTMrVa9ykmPjF1ckKl1_xxq_Z7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA1NiBTYWx0ZWRfX64jgzpNsmV7t
 FaXGI+3GX4kmQHNpT/rg05rQ5Emjr9bH7UptPZEW+3PdqjR7nvw0LkMMQuA6qOpkw+M4if+s17G
 5TNlcelCal/WlJYt9huSinP8PsI/eLjDdWGSMaTwjlQImfj/Awk5rjZvTpccWgFE5+fiU0EZSqJ
 rvRozLPEV6khM2FAT3lDyJsdclIhK0bT/Rmgqa3nfyFXAHCPqVjZOPIXhtqtlT0/GTqR5s50mwu
 kAod11kD1HzOZe9AsDcnzWUSROswb1WHCqJLk1waF5N0R5qSeEaVZJJkHorJobaepZHunbiog2w
 /pd7AzaoIKTo116lvrekXrwcrDMRSkeL7wT6lgJ9uZq4ZEOM8Zz6VQH06ajfwyHzZQGSRY5URBg
 wj7YBQLHUl1dUale0CUh1pN11ToECxwd/zYjRk1jSwcqTG/57y/tMbKlas6t9yDBBJF+nsXAPW8
 u2OMkZMXxA1YhbSaDBQ==
X-Authority-Analysis: v=2.4 cv=K9Iv3iWI c=1 sm=1 tr=0 ts=69c237be cx=c_pps
 a=de1FuetzK2QBuoS+fAXp0w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tr3XZvuDWTETL0Uaxejn:22 a=WQ4YJ39tjzx_Hbm9pN5v:22
 a=FgcX-9L09ZoKcqbMxm8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: jY3bpUzTMrVa9ykmPjF1ckKl1_xxq_Z7
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[westermo.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[westermo.com:s=270620241,beijerelectronicsab.onmicrosoft.com:s=selector1-beijerelectronicsab-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99569-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[beijerelectronicsab.onmicrosoft.com:dkim,westermo.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[westermo.com:+,beijerelectronicsab.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.wilhelm@westermo.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 53DA6303AEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 03:32:54PM +0000, Simon Horman wrote:
> On Mon, Mar 23, 2026 at 07:51:08AM +0100, Alexander Wilhelm wrote:
> > On Sat, Mar 21, 2026 at 10:19:26AM +0000, Simon Horman wrote:
> > > On Fri, Mar 20, 2026 at 02:28:52PM +0100, Alexander Wilhelm wrote:
> > > > Convert confirm_rx to little endian when enqueueing by using cpu_to_le32(),
> > > > as big endian systems otherwise interpret the value incorrectly.
> > > > 
> > > > When receiving, apply le32_to_cpu(). !! ensures the result becomes 0 or 1
> > > > in native CPU endianness, so this conversion is not strictly required, but
> > > > it is kept for consistency, clarity, and future safety.
> > > 
> > > Hi Alexander,
> > > 
> > > It seems to me that the conversion is required if the code
> > > runs on a Big Endian host. What is your thinking on this?
> > 
> > Hi Simon,
> > 
> > Yes, that is correct. The patch fixes the control flow on Big Endian platforms
> > only. It has no impact on Little Endian systems.
> 
> Thanks Alexander,
> 
> Please send a v2 with the commit message updated accordingly.
> 
> As this is a fix, please base the patch on the net tree.
> And target that tree like this:
> 
> Subject: [PATCH v2 net] net: qrtr: fix handling of confirm_rx field
> 
> Or perhaps, making the subject slightly more descriptive:
> 
> Subject: [PATCH v2 net] net: qrtr: fix endian handling of confirm_rx field

Sure, I will improve the commit description in version 2.


Best regards
Alexander Wilhelm

