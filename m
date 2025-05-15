Return-Path: <linux-arm-msm+bounces-58056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 954A6AB835D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 11:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A061A9E0596
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 09:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0833A296713;
	Thu, 15 May 2025 09:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="mJfsUgN2";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="Q00HaCby"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx08-0057a101.pphosted.com (mx08-0057a101.pphosted.com [185.183.31.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7601FCFFC;
	Thu, 15 May 2025 09:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.31.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747302927; cv=fail; b=Tig4gqrjFVqh/74F1t1q0XIcEstunNrupMBOU8M3Ko0p6Ir8khgIs5XfDbgFkwxXnF7xC5ik0yqo7wT/qWH2OEWxAoC7DkF1M9TqRrVxAOzXvet1cq5VwhkecO0Ht6GP4CHndZEKDdZ7HzNwuOWv+EJzTLnaDKnnB/m31ZPY3GY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747302927; c=relaxed/simple;
	bh=rrppWb6p6+mvECAy3axl9KZcRApZm6FC+kepKyslEsY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=LKu3Gt2EqmOB/UL7yyMeSQbUMYjoOs8m3HIbjGO+AJepL0vhXtZlAC1B4nGCOnrfFfIpsQHL3Srovt3+I9xrMb6EOfItm7JLEII4wTd39FmcbHovv8rJo7oLHyzhHbKslFrMmPFwR0PXzBi03cjm8u7Mk2SsxvnnCrnivz9O7Xg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=mJfsUgN2; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=Q00HaCby; arc=fail smtp.client-ip=185.183.31.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54F5ROaF012623;
	Thu, 15 May 2025 11:55:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=270620241; bh=PTTpgws/311vWIzfvsD6qL
	eM3eFY69bnXk8y1w88wPU=; b=mJfsUgN2mIOOTVetiFSfzB9hUQzqV5MwgDrkD7
	5pOZUEOujglo4jr22unWtRybI4d6AE6MMHiVaYHkBQN4tpustg480JXN7f5UI9Sc
	//rvMKetWIDRpHDk3EN3Af0IMFplXR09p3Hg2goHTollmvGGw7qcXc4BJ5sI2gen
	N9uiJ3nUAkivdOXQ3eiQ1/bBstKHo5gKZIr9JpfUocZH668RZGxAqpWs4bBFuBJK
	AZrKrhD8VCt8GUkFblRpLuFnN3uggf0oo+/i0zuQTxcG5OMSUFzDHTK9w3QxcpeF
	2JRSARov9AwQSF7IWRgUGX6+MvPMNyixgP2UApWurpi6fTPQ==
Received: from eur02-vi1-obe.outbound.protection.outlook.com (mail-vi1eur02lp2041.outbound.protection.outlook.com [104.47.11.41])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 46htt45p67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 11:55:22 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQL0zNpG1v6NY383oXR77QEG1l+PdffzB4OMYcP4uGNHoDMMcfJqYffVAl5O2G/731g08fJZ+a/P1/E0gRufI4/snnJvxPpl/MQicnx5jXEZwcYxXdAQp7X6tR0a0sfnWniucZHY2tD6v6HYTqxTLAUh7VXMTX8EkAVMCDyFIJNqkYjHIqUqK56VqnIA46twdzopGMyYKeNtsSQreIr6+NOMHPCrhzGBoLK529ekaaNKeUvnp66h3gg0QufKdQTkXlKip1ACt273Q63DU6M/V8F2/88A2DtzecbRsTC8qNKnxgoqrIdxHLkiOxdA9UNgfJMfAgvZw5nbldiLGGV6wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTTpgws/311vWIzfvsD6qLeM3eFY69bnXk8y1w88wPU=;
 b=SYPfnqnuFO4INyhJBT6AAHjt4kQYOuba/0i0cVtxH2XM0AUaQTRcr9ThqDCadcPjsF4UEcO9NQOb+5oIHbvXPwmq6K8otTs6EzGYoXoBQlHIK5w4zviDfqA8FL8J4PAHIwSIhdnFuAvxfICSrk4T2dzYdjRvw4RfC4CnbPUMruePh8yFs7mP46SaMuwoIfIwUrnvK/pQsA5irSemELgm0oW/X+ApG1iCiiyAT40DRmaeisg58eAx/uJKZFUIyHHTm7BgLFykca54xmuRwhNp+K7eikW2DyfwCWZNBV/qkjt7zawcIut7AkALdCi8o/gA4UkQW4EJXSGC9hYUrBMkkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTTpgws/311vWIzfvsD6qLeM3eFY69bnXk8y1w88wPU=;
 b=Q00HaCbySdQmUXErNEV4b6AsJsp4mEod9d262Z6So3333+HuI9JLyiP9Y4gUuXeOQfMldS6v5SG8Li8+JhsgYH8nOeM0K7JIDlmFtDMeXUfKq2LyqhhjzgiK8Wum+5hzTjAWxixhZOiiKCPB6JZ6jDSYpCpHerqwRKq/2vnElUk=
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:63a::18)
 by AM6P192MB2475.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:69f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Thu, 15 May
 2025 09:55:19 +0000
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70]) by AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70%3]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 09:55:18 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] bus: mhi: host: fix endianness of BHI vector table
Date: Thu, 15 May 2025 11:55:16 +0200
Message-Id: <20250515095517.1867846-1-alexander.wilhelm@westermo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVZP280CA0042.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:26f::9) To AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:63a::18)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P192MB2240:EE_|AM6P192MB2475:EE_
X-MS-Office365-Filtering-Correlation-Id: e7e44010-5934-4f35-f7c5-08dd93969980
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qHC/uXcEs2BA/Rcr6d/yLJdq9taR8VhYz/mWZM3gJevqlohZBQqDG4og1e2w?=
 =?us-ascii?Q?Hu6kpp/bGLdb01Uk++VYZ75pHdTEx2qQqfcLX2GZ8/FWzDRjK2utM71VHA9K?=
 =?us-ascii?Q?LRZGPMj8aFtVmoIkjlnJlycC+x4es9aXO7iIWO2rYFUcOvale661lUhCJwMy?=
 =?us-ascii?Q?Gsq18eqXQj1onYaJG7i/s2LKSFqMlK4jhEOAC7euU4cBzT8BOXhst/lT9m3t?=
 =?us-ascii?Q?ocN9unYMz22jReCWLHF5wQfBBnYJbJRH2Eo/9i7oUISOyH+KS7w3ERLfKYeS?=
 =?us-ascii?Q?BXHxchcNDDTrvqdXa8C1bQbwSkuIMKgTxq7+G+cANZ9X6C4R/lI9L0OZPEzQ?=
 =?us-ascii?Q?7Kka/5oqjjL0i9ublMcu7dVdLeoOHWWtb87XHAbDSoVgbmrmtn69GYulI3B/?=
 =?us-ascii?Q?lSajtm1p2X1CNI9Bj+WPmwPORL2uNBmEZ8nliJk5jjajksf1f3LWhNZ04r59?=
 =?us-ascii?Q?foXnhtSKxftI4ze/sG3q6gmfRQL1t7gKqZjNcpL9+LuAxO5wZ0SM4jTaVuU1?=
 =?us-ascii?Q?tEZVDa6NnHM0zEilVKsDSUQEX4FpT4USbKaarR/FCHi3dC7EF4YhyVOTfrHM?=
 =?us-ascii?Q?CSgtQlXTI70TcFF/hX9/nNaP1dyYHTcIZgpNBx54pAWJ9oqhJfAVCi4QeWJh?=
 =?us-ascii?Q?kbuz2mP5NIw6IUGFHUxjLa6OtPuBqfFgenmmhYV11SoNiVAy2FpbeneBQbZZ?=
 =?us-ascii?Q?fsZQ84ZbQ6x6ODQc6SfOHw3wmjH2dvR0F4wHpJ7NV3pTyg0rN/wrwvNdPhCU?=
 =?us-ascii?Q?ATCp5e26RnF2ePmx9FLkIkrEd5r8y8H5F1o/duoaJw8T4xRxFpEL/St+tzRc?=
 =?us-ascii?Q?pdPyPmtAG3cKGH3wQTPgJjP390DE1gzMw8KfRqZGESYOgXN7BnUV4xJVOq4Q?=
 =?us-ascii?Q?lFsw/FM87EilIb5zvrFhybL2zLeKBEQbflNXoX6D0qPpibOBY3/QoCgg0rT4?=
 =?us-ascii?Q?axuUxNPxa1KVujxuBUBDknUOsk9tx1CE5uli7gdQO5jxxOBQPXY4KcsabtM2?=
 =?us-ascii?Q?5gZJVM15wgcWHTgGRokzT8glMhKmxqycKRe0Dy4GB49cxrvnJEwWjYlnz+ro?=
 =?us-ascii?Q?KV8oOHSt+GLL4pivTWo0suNLqpn71RG1TfglBqaXz3ZL9Of1Z0TR9de4rGA+?=
 =?us-ascii?Q?gXWxaQck3f58TwIDFnxV1ZJHtTXDloYU7yrYzCeVXnMYB/CeIFX6V/RbRE32?=
 =?us-ascii?Q?bqgbC3q7oGxZk6TY/ekCg274ZqxGQp0aP9ngCWfvAU+lrfg2UkbNX8lqeXsQ?=
 =?us-ascii?Q?8ieY8WbCDZZ5H6lopaRxrJqYuAy2rT72e2e2Uq/pFm77SpxNdY+ltJEKYhTq?=
 =?us-ascii?Q?1XDEhJYpwh1Ms3PcEHSgmQDNnYTooZ08wcU2Ww42Z/hxXzrzNC3a2n4b9eMG?=
 =?us-ascii?Q?moU6RZ9f7HsNHmPMOMQ0SV0p0TKFFpjze7DJfW0kDXL7mTyISUr+TUsX1OWj?=
 =?us-ascii?Q?jDqI6jTMh0w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P192MB2240.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dTBaBQhsbKwVGtzV5/DUJ30eDrWX1BFQZaC5VgG3Wc89ImJTFnekqcakTl5s?=
 =?us-ascii?Q?1VoEoLOnpLd5BhXUTMaV0VTbMDFjTvVU4AaXJTonX3KwCSlodY3sBSEYiheH?=
 =?us-ascii?Q?BXXCKiYDahhvF5UF93DyTaJrY7TaPboE2bxgJbv/i9o5jjZH4bItTyRMcWnQ?=
 =?us-ascii?Q?a8oyRvSH2cRq565g2o+aSD03xUa906Lr+XVCgt4dZq7ctna4eCzZt4r6Dfeb?=
 =?us-ascii?Q?MMLkDWfzXrJNM85fKCHVQdH3Fzekw/BAaBtuSHtI18nYwPsoIu6L/QoLsZNi?=
 =?us-ascii?Q?d2FeED9A6FqzwRdpQNg13zNiOHHGx8izbgVJaynukCQs+aWX5va/+t4gH4ny?=
 =?us-ascii?Q?5/JmtKi17+A9bSM7cxkcux7quwB1qw6Gdvq5yPEWFx26dl1QAGa/9s/oLBuy?=
 =?us-ascii?Q?OmAIRePmPq2i1WktGlZjYMIYg7RWgVqpyA7BV2li1aWKmJ2bSD6pDcL9khO5?=
 =?us-ascii?Q?F/C8xQg9yqprKdkLfR0Vi0Muv0+M232TGC9odknWpWZpcu6g6tgUUDeVvXBf?=
 =?us-ascii?Q?681GBqp+y1lsItjr+vg0q9CB4YDtonfOiMo6r6w7DoeSXNZz7FPDyNE9oXhu?=
 =?us-ascii?Q?BqzrCRMJGirq27TJChcrPpk6JJ2IGpzDbeAVaI17iMOdqdAqagkFe7jtNFtp?=
 =?us-ascii?Q?0/YTGxLHC7sD8bGHcEapYxHdYPrrnmQ0jWBdURukdY8jThFm+urdHQsO+qZM?=
 =?us-ascii?Q?GdSqd5VHpc7W4tlrF+QGZQUadw5165ncyPZ28Rb/3qHevp8udomOlWpY7NOV?=
 =?us-ascii?Q?D9NPA4kJkvhjZD5yLkgV9PJUegpVnjXMhoxZqafZRhYaecmds2WGBRMtyiR5?=
 =?us-ascii?Q?YGGI65I1MZsc7QyMBR0IVxkNfmWY8XEd5k3eYXDBKJdj8/LVGV/i7IEWbwfF?=
 =?us-ascii?Q?a/M3+ACEplo5N/2diibDAXsRHAIJllRjhyTP1vNkbea/IvYMjWr8eR1kJmVw?=
 =?us-ascii?Q?4lr0cAnOF6fAYYo7t+jJjDI0fdAEUx8m3wkpQxpNfO2X2SSaE13iYDUCjCGN?=
 =?us-ascii?Q?KHmUzqbupm2QOlTVNV8LoiAvTBobEgHkk8NJj6L/9UpYjGgH+19FGhmdsWtx?=
 =?us-ascii?Q?BKSuF4mkS1pjDC2j5XvjECrBStqkpw5grKP0ukNCPtwpudirX8m+N5xA9Bch?=
 =?us-ascii?Q?mpyY6K5UbVAJHEIfgSVXNsQ1JAih80LCfDrijFZ6p5su3UBHWls+P2g+PQX2?=
 =?us-ascii?Q?8VmG5mxBvHQ6gG//jM4GWTieSlQSzk648LxukqKSr1CS9kxinH7JLNRJzNGM?=
 =?us-ascii?Q?kegxRWvKxDibOtXE/bQBPfm7cmHEEv6iE3eUxx4Zn9HYpuV9s4O7Dg8bdxOj?=
 =?us-ascii?Q?I31qCxB5065OvStpeU/Z/OBA0Ov7uEr5EhZOL0XabFO7zRTwAxt11bP02i/v?=
 =?us-ascii?Q?7GsJ/LS93lrn/qHdzXUsd1ftM71ayuzOygEU/Bze2dl2Uez8Epmo0JX8g1AW?=
 =?us-ascii?Q?dnhzm1RxwcxoAqzE9z7YXb3xClcPrGx3gUSV12sZWuya3RB0B1FsTovQdn9F?=
 =?us-ascii?Q?HsaajmSJwIrypeLNmPvx7GsSx254yjsTcqfNmsVA76U3sf+vGXENrfbn/ij7?=
 =?us-ascii?Q?X3whgTXr0NJskYYhcpFF1dXYRZ8dhhScaWbVS1mg?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	khnWhSg6kQ2NR4ytULcBUPrxK3wdcCNqrUmkKY8dv8g0EMMRy+oio8tq5NuW5a6aGUDg1WVoGVOfw/gkbCH8C0kJMYkRvOCi+jgex8PdVqHKColoJvJw7gTZ2y0G5vYQIrAK79Yf8drYDZrXv91sUpsEXrmipggOFaQXUYSqykcKsNDaLwAySv5TAojJgkAs89d2loqUF8Egi+QQ1fLaYb7vwUY0WNi2lwGTFGBGIFrW8OFKEYRrG6vru4vbSWTXmSGpqWMFa4gDINPkKO7lPcZxIVwmSs1V6zmg8ar3135EmgFj5j40XCO92h2+2my+WlD1976uRxhV83BHYbsAFexgabyvZzeGiq2UjYiJNp8mrIM6xnDzHyC7NiNcT+C/iamvGj3I5Dxss8Op8HUy7XNv2QrEifadW0t+0beUBdpacWkmoCYjqh0YBPhnnKqbyR8xes26XXs1hR/Gsfq+KOae9kaulcBAyUB8U3zUlEO814eujfAj1BOaoS8C2CFreRTHSyyrX5v44LTdo6rqaSO1gQSXwta5oGXnLkbYn887WtnmX+t2+BzPE9T4s7ymZEbKPAdEU0A+Er7Kox081qmk/RRhb1qDDD8aSkwcqVgli/kbSVLQQplO4MyAxu3w
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7e44010-5934-4f35-f7c5-08dd93969980
X-MS-Exchange-CrossTenant-AuthSource: AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 09:55:18.7419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4PwNJ7mwoGXocIKzE0Qbo/u0epAdFzhPvX+rJmmPmjuD8WMlpYJFrKXhJfjHxabm4xgHFH8S/aM2OSHgCVqmpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6P192MB2475
X-MS-Exchange-CrossPremises-AuthSource: AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
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
X-OrganizationHeadersPreserved: AM6P192MB2475.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-GUID: dDJTPpE3vPEatikvzG3yhB-V0aDbyxv-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDA5NiBTYWx0ZWRfX66nI1/2fRJe3 WkcmGgmLTXgRo37H01BVHOffyK+zbl90sRVzcNlXuOOiQjp9yhdD+4DzNAuZU5x5QFF/eL9zaxv zsUV/A4+Plp6Bk9AMV06DuPPdsgzWqOoS3DnNlTYhsQjXRoLRB2x1qohX/XQdSD6aQwElmoTU4e
 Pcljy8YqVQMlhP3xL4/OZp1XIggZh4kWX7XQJ9vGqyH7osOEcqfzVxpRRF9h5tNrO+VyXwYulvq IafqJRnV12jG/+2clby/kP/mouNppGurvrbDyhXH/PLgALKetNZFvvBVFbtO6WfqdN9XXYUvzID aa2zl5FLdDy2JlgygWNWGR4Ytf4yIIs+Y9I5qjGUvDG61hPKDroQBMurCh9QyTZjwy16Cw/tGrr
 /gJtULTMO+Wl3I2PjjfZrd4nzaZfvXDnq/U6b3rP13numdSe2v5uhgXG9BU73azBSniRu+nX
X-Proofpoint-ORIG-GUID: dDJTPpE3vPEatikvzG3yhB-V0aDbyxv-
X-Authority-Analysis: v=2.4 cv=SJtCVPvH c=1 sm=1 tr=0 ts=6825ba0a cx=c_pps a=Qf1mswPHpNN1WXcnD2EiMQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=8gLI3H-aZtYA:10 a=N9GNhs4bAAAA:8 a=ZddV4WD-gSN6lUJ0vOgA:9 a=PZhj9NlD-CKO8hVp7yCs:22

On big endian platforms like PowerPC the DMA address and size are required
to be swapped. Otherwise the MHI bus does not start properly. The following
example shows the error messages by using qcn9274 wireless radio module
with ath12k driver:

    ath12k_pci 0001:01:00.0: BAR 0: assigned [mem 0xc00000000-0xc001fffff 64bit]
    ath12k_pci 0001:01:00.0: MSI vectors: 1
    ath12k_pci 0001:01:00.0: Hardware name: qcn9274 hw2.0
    ath12k_pci 0001:01:00.0: failed to set mhi state: POWER_ON(2)
    ath12k_pci 0001:01:00.0: failed to start mhi: -110
    ath12k_pci 0001:01:00.0: failed to power up :-110
    ath12k_pci 0001:01:00.0: failed to create soc core: -110
    ath12k_pci 0001:01:00.0: failed to init core: -110
    ath12k_pci: probe of 0001:01:00.0 failed with error -110

Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
---
Changes in v2:
  - Set __le64 type for dma_addr and size.

 drivers/bus/mhi/host/boot.c     | 8 ++++----
 drivers/bus/mhi/host/internal.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index efa3b6dddf4d..205d83ac069f 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -31,8 +31,8 @@ int mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
 	int ret;
 
 	for (i = 0; i < img_info->entries - 1; i++, mhi_buf++, bhi_vec++) {
-		bhi_vec->dma_addr = mhi_buf->dma_addr;
-		bhi_vec->size = mhi_buf->len;
+		bhi_vec->dma_addr = cpu_to_le64(mhi_buf->dma_addr);
+		bhi_vec->size = cpu_to_le64(mhi_buf->len);
 	}
 
 	dev_dbg(dev, "BHIe programming for RDDM\n");
@@ -431,8 +431,8 @@ static void mhi_firmware_copy_bhie(struct mhi_controller *mhi_cntrl,
 	while (remainder) {
 		to_cpy = min(remainder, mhi_buf->len);
 		memcpy(mhi_buf->buf, buf, to_cpy);
-		bhi_vec->dma_addr = mhi_buf->dma_addr;
-		bhi_vec->size = to_cpy;
+		bhi_vec->dma_addr = cpu_to_le64(mhi_buf->dma_addr);
+		bhi_vec->size = cpu_to_le64(to_cpy);
 
 		buf += to_cpy;
 		remainder -= to_cpy;
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index ce566f7d2e92..1dbc3f736161 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -25,8 +25,8 @@ struct mhi_ctxt {
 };
 
 struct bhi_vec_entry {
-	u64 dma_addr;
-	u64 size;
+	__le64 dma_addr;
+	__le64 size;
 };
 
 enum mhi_fw_load_type {
-- 
2.34.1


