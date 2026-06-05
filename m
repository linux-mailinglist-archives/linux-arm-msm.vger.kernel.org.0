Return-Path: <linux-arm-msm+bounces-111449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xW8CBar2ImpPfwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 18:17:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9AB649AF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 18:17:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=dC+vZeQA;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=xfshERCA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111449-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111449-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27119304CDF4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 16:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40DDC3ED5A6;
	Fri,  5 Jun 2026 16:12:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7B83ECBFD;
	Fri,  5 Jun 2026 16:12:02 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780675924; cv=fail; b=qkMEfvB129+P6xe1ZM3kwjg/pZcgMr7OGG3RGtqQnnh5Gfg++Fj+DRYIBhdhj8nLglV6+5nPpOSTigdHKstV+6uQjmLuDwkba3rYlMiOP5OJSp2QZafwDR/W+da4B93brjUKF2Y10I4+ij4byFQ5XjuJzib5kg4yJiOkOSSH+FM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780675924; c=relaxed/simple;
	bh=B1DqjSZQVUR26ZQkg9NSIhi16QFsBS/J0GZ6hD1yb/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dBJeoVFArvw93DghBhnfA66maH1cIbptdgKPydD9AscGty1ecuNqM8SuUcAuPIVmbHC4knkZI+XgbuQ3D4b9RffY2ui8TBaMfMY3c8ShLWpsa58Pxg4nF6H7s0vDREbO2Cgcu55vyxH3SPHhJn1jlSt6mHY7gTcae3lXdBqp9rg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dC+vZeQA; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=xfshERCA; arc=fail smtp.client-ip=67.231.149.25
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 655F4jxC1879412;
	Fri, 5 Jun 2026 11:11:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=bWFlrjhZAFnruFgHgv
	wVbCmATvqY+T0jwZajoFmso7U=; b=dC+vZeQAQyAwtUi9UNt9Tdv8vdYfjJKZC0
	0kE5hCODrZ/F4g6sdKXR2MwklUnPhzXyKLJOWcMWZ1L7lSGaTaQDzlvGo2ghYmq9
	DIJTtsgPIH6eQqbPWtmKYAlayv3t7wzklyja509L7bMooC3wUCy3u31azBTwA6In
	c85xJOZDlD+Hn9S1pm6LLFoZ+dtDdNaj9KuiIsLUAQHXUdK91DL+3YKKkEHTQfQ5
	ufMk516XqKMm//QzUnxd925Vlqk7RpzT7yzFuWRGh+zvnxhZXj6DZhQ4FaF6+pSy
	Mz/KbSW24sC8uTCdaMqN0ek8UGJ/Xj6ZHVX0hY0ldrUVHwBNRpbg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022119.outbound.protection.outlook.com [52.101.53.119])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4efwa19ksp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Jun 2026 11:11:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cR47ofZpOxAPX4pTvYrhn+5C5al+yR0Kr1JjTH8iwrCsv2dZ9cozWhEGMSWrtZsiBhHVD8v1FALY16YIlxOswZMQFXHAewSdFonPHKPIYFPQFJMSpxPkYjqPFVEJv8Z6M0HOC58/4fbgWCDa9nVE6PX6AlEPfiAa3sJ1YMa7EeDfb52r9a6xL/BXu+m72jq8Dy3IjKy3xdxtFjocraHV+U6O973t/aX+v9mDeZFpq+9wRgsI2x8HnQj5U/kITfdxODZ8NcZ4EyW1pD/VQY4hoiq46tYAWueXAdwfpeYMgeiFVU8yH7H8t7EmGRBqKlRR5lCLqgsVKvNWSndMlKbpOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWFlrjhZAFnruFgHgvwVbCmATvqY+T0jwZajoFmso7U=;
 b=w89eSxKKzTQI99HGTCp2WpBdqi0JUt3SBGkrnkJulse1lzcThxlFKod9KAT9r24ljqZurkGa1FK9K4moziuP0gT4IbUC4r/8rx0WTxPn/1del+F4RxQklxVD1iE52PGBGDLxmKuGzwsfkJTLE9JJ3KI03NgehxGnt5hdVCTM1jxvSTDsz3bz1VlELt92frbrFswLiyYhfq/KpAwTKWNAuAZMQ/4Gihi5wOTEzK0/cUFTyrsZQVX8QUw/b3P2JshiHIoURZMgQA4WWXwSitScaSHU83z7DDAO7A7rqehYxrxSu0OE1sDCVpCk+kavBj7V4VFK4TDegA7gU/kIZxhyrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWFlrjhZAFnruFgHgvwVbCmATvqY+T0jwZajoFmso7U=;
 b=xfshERCABa35RKXFdnX2SPJjWgL95SG0QZnj75bahAovM83zgeIzI97oWDMS6Wjd4M2DX5MsawjEI4gvVIMCr0hX7gLHcQUfPX5Hf6mgVqFeWRH4W/oDVvJ9QgxjvN02uPHcNlEiY2lefQzxjiPH8WhjKuNfOOiO/PV3JIJ3Dhk=
Received: from CH2PR12CA0028.namprd12.prod.outlook.com (2603:10b6:610:57::38)
 by CY8PR19MB7715.namprd19.prod.outlook.com (2603:10b6:930:6e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 16:11:01 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::78) by CH2PR12CA0028.outlook.office365.com
 (2603:10b6:610:57::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.9 via Frontend Transport; Fri, 5
 Jun 2026 16:11:01 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Fri, 5 Jun 2026 16:11:00 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C6822406540;
	Fri,  5 Jun 2026 16:10:59 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id AD962820244;
	Fri,  5 Jun 2026 16:10:59 +0000 (UTC)
Date: Fri, 5 Jun 2026 17:10:58 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org, lgirdwood@gmail.com,
        pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, shumingf@realtek.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v2 01/10] soundwire: Always wait for initialisation of
 unattached devices
Message-ID: <aiL1El3HOOKAja7q@opensource.cirrus.com>
References: <20260605084810.1575539-1-ckeepax@opensource.cirrus.com>
 <20260605084810.1575539-2-ckeepax@opensource.cirrus.com>
 <371781e9-6c5f-486f-a0ca-ef6e59b91a1e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <371781e9-6c5f-486f-a0ca-ef6e59b91a1e@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|CY8PR19MB7715:EE_
X-MS-Office365-Filtering-Correlation-Id: 75e56148-e6c0-49ed-d381-08dec31d095a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|61400799027|36860700016|3023799007|4143699003|56012099006|11063799006|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	iX/Agg80PjxVcZPVTeTOoRpRrtuYfDFKOPPMMAVi2HpOVtK45tekocnBH6zkRFxgHx6Ux3onC63Ke5+IEe4U/xCITjy0RGTQ/1wrTiMr+ku74hZKLSbbffcXNBF0/Q8aHtIsydCFcmiLRPzU0Pb7ffDtLt9diu9LyZQWagn+r0EN1bbEfc4kAB0jO7zoDbYfMsc6tUbtYoU3bxNN9cCuAFY0e/Gv3IWxrOjepxopKIr58eMWL0KXrl0B19oC5krcg+niHl7uJwQqKDPS5VWDihcxlgjHa29dUHvmP3cP6LgY3r41eF3itorzuHKKqdb1o2HrzciV31fkPs1KnZKIqmWtMFL7wO4gaot+MKf/eb7S68wUeQBZnJOpavrtFUweo9IoocKPzCk8yXgC5JW5W+PETUfRsHwlIPvvufE+5mrth2v3ZY1Na2s1Vj99hV+ANzwnQLpumfA+Jm0ccp3FsEX2KoBPvA8JzPZlqOdRF3u2gslZe7pm3zszN2y9L60+Towrv8PgE0EyqSi3C13IINCzk83zo6tudsPml2J0W66ZvS3plVIygCarrnozvFkSyMyOUaY/8zgG0kTi2/noUEuVgBbhIoJjYCL1ymwD53uxZeYc3a73qJrTrwfR5UynogE4vAAfseS76CbXTmG5EBVDM8K/7QyTxQp7rzd8/LiaUcNqMKSa6/A9reTXaeVzccgyMC/407a6SZdHlIudpbucLwCldY5e7jlwMKbhy3k=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(61400799027)(36860700016)(3023799007)(4143699003)(56012099006)(11063799006)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ijNxjp7X2wAT9I1aT5p03ZM+dajJxEvSVcthwIlTCzflYACXyrtAyOHwJvQMNLuzpMZeQYd+1C6VH9M9Jhp7H6yv2R2vvxlz3k949xuxhFPEzIFEGqtNZPbNvuL10sLYFhyPDPTf+8m11PWKdUdD9iaDWe9xm0OFMgKzhar0dLOMCOwLARorV/bizQXrwwr9vI8DzgSNLSxtr1v3kuUKfp27tAjbl1ojFtc8jIXH36nWjQKWI5/IigV49rPG/LNIbRnBhNFhskYDfYypua/wNlfjM3Mz4FyOveRUWskb0+f+9oj7Y6cci/AakyOayVVS7iEZhd/iyStsQs+uz3y0P5i8F0MmC04D8q0OAxNeGIyetu6Q//yAiiBRMT71Cq5UsYYLI+t2/IJwXaNC7jHOMESKWaRhLvJO1FsTw9VUUR0EAEeUSkUo2lPtNeTpX7/0
X-Exchange-RoutingPolicyChecked:
	P+HW/LZi1gyzU9yh4xcMj+yD/pQcmGdU7w/9ANO2aIvWXSOdj7jPmhJEGIdwuY6HzJdj7QHdf2NIHYOHGDAkwzbYwI/VOFc5FkfHueMNUOkLVW8GstlSW9deQWmdTU1rbRHMl1y3hSawEZxhdZnmLsJg5FJffdrXZd4GOtLUBCi8xh9K7G0pgVyDSvCtkMn0wgOtDyl8twh76NSunWTKsPbIH7YSVguStcvPwicx0iIIu1pgU8t6cAiNcwfyx8+//vnkOqAOH51PURILgcRypu15MNvT8XDM0fBu8dS9efQMW3W/IYMW7bm5PX2L+iUOLgNuI3snPTx0N9JklwyqLA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 16:11:00.9054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e56148-e6c0-49ed-d381-08dec31d095a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7715
X-Authority-Analysis: v=2.4 cv=WZ48rUhX c=1 sm=1 tr=0 ts=6a22f520 cx=c_pps
 a=3pEbTsiE5+CWpS/p3ZrWzA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=buv1F5jgVjMBcu-Q1fYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: e2kAbs36Fl-_Mn3UYoPh19iEWV7R6yDV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDE1OSBTYWx0ZWRfX5ABE5ddFzodf
 LUMul7hNLYT1DGkn1P/8m1ev1HDsvq2ZM8Y5AWJtEzFUv/njnTwCqP05ejgrhuzaMrHaH+7OVBI
 NlPFBbnS6Z6vH0ManuwOk28H2mKSN/VAYzf7ofeyncMUE1J/53cS9rAbMTCCGVmtEpVs6tWZa6/
 b2thx0EbBr1NXQp1GFo3fIzkYwWnVtpVfbg3rtxXNsg+qV4PN9K6XmqqOjmNbuzIqaBwK0KS1lL
 Cy4kVHQSXzEku5GbrI7zucske2Ux4oVxTSDC2slOuPZgwvkkVdjVvT1oee6x8v8Tsae7ZOtCwHu
 BXv/CJDIsHzFLKOO2YhF6jZCyDIpSPi6SZDhk95aOHEra6H+WTPo5VD5zA/lnOdMO3aEn4J7TaG
 EKG3WFr14vUTl8m+o5/htpFMTEzsFehb/y5SDszg5B33ktWPhyDq+qlbI8y5cCvzFXkMpClcdMS
 FkzKAutGGz0GhFKe3zA==
X-Proofpoint-ORIG-GUID: e2kAbs36Fl-_Mn3UYoPh19iEWV7R6yDV
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111449-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linux.dev,linux.intel.com,realtek.com,vger.kernel.org,opensource.cirrus.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,cirrus.com:dkim];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:broonie@kernel.org,m:vkoul@kernel.org,m:lee@kernel.org,m:lgirdwood@gmail.com,m:pierre-louis.bossart@linux.dev,m:yung-chuan.liao@linux.intel.com,m:peter.ujfalusi@linux.intel.com,m:oder_chiou@realtek.com,m:jack.yu@realtek.com,m:shumingf@realtek.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F9AB649AF5

On Fri, Jun 05, 2026 at 12:43:24PM +0100, Srinivas Kandagatla wrote:
> some minor typos in commit msg.
> 
> On 6/5/26 9:48 AM, Charles Keepax wrote:
> > Currently in sdw_slave_wait_for_init() the waiting can be skipped
> > if unattach_request is not set. Doing so was added in [1] likely
> > because the core used to do a complete() on the completion so
> > waiting in the case an unattach hadn't actually happened would
> > block for the full timeout. However patch [2] updated the core to
> > use complete_all() which means that the wait_for_completion() will
> > now simply return if the device is already attached skipping the
> > completion doesn't add much.
> > 
> > Additionally, unatttach_request is only set if the host initiates
> 
>  s/unatttach/unattach
> 
> > a bus reset. However, the host doing a bus reset is not the only
> > reason a device may be unattached from the bus. Other options
> > could include the driver probing before the device enumerates, a
> > sync-loss, or the device itself powering down.
> > 
> > Removing the skip using unattached_request, doesn't cost much in
> > terms of efficiency and allows the sdw_slave_wiat_for_init() helper
> s/wiat/wait
> 

Thanks I will do a spin early next week for these typos.

Thanks,
Charles

