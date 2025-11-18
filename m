Return-Path: <linux-arm-msm+bounces-82190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F1EC67D39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 08:05:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 04F254E16F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 07:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D022F531A;
	Tue, 18 Nov 2025 07:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="Ho/l6UPS";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="XGtVkPfL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx08-0057a101.pphosted.com (mx08-0057a101.pphosted.com [185.183.31.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A042DECBF;
	Tue, 18 Nov 2025 07:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.31.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763449394; cv=fail; b=WksDAj4/0OFIZRL8/bHQz+o9uvbya+gT00sHZBvvmgOVGE+lItYe8ucYejRtpdKgwUKXASsucPb0BG93MV4ZTmImjAnd6WXBnB2NdmwwMgv64ZxABFFzHCkVf0bDk5nhO2+GzSwJMmVZWanEctu8xjXNLFQs4RBXuG3PW64XX4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763449394; c=relaxed/simple;
	bh=jdkuU5vdCns2jU55Oj/9OfxbkEsaXWeXLRFZNN7J4aU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jtBapKjpbb2wHRtYKRQ2o+RICG+DfgS6pWGeKS584DiOxYoxx+vpZvv6l0YBrFcufC714TL0kFc6mxVSpjvbwTyJx2kdU1Gi1SSdc8ZYphaIQ5zqCxm3FnFD6fRsrRJPUBLHTCdzYzyS9+vR5USMsLyVM1qsZGzgCFrOMnkDOmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=Ho/l6UPS; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=XGtVkPfL; arc=fail smtp.client-ip=185.183.31.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI5F1X61387354;
	Tue, 18 Nov 2025 07:53:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=270620241; bh=
	xUJcEPaf0uuZPx6Nl1Jt7EZSbLeRE+goCuIPyVY051Y=; b=Ho/l6UPS/k1ztf28
	nZaddCy/1gw2nCmrfItSz3eLvZgNG1fwxCuR4asis3kVIJtjw7P/CqKixvJAc6iB
	v+9T9g7bRIIJRG6fArnIPdLFD9cjrXrZmgQeoUNi1e20wujKtFW6Cop/+trnCqR5
	BkleH4RJauS5JAOJY6lZxFedHatIvJXWiUwLPZDWbxU6HTd+Gy9Dg4OzDD0evMxT
	ZcYhMtrAKdg2gYUiUnW1IkWuyJ3i83jwiolzmKQs0cE6bDFBJG7l76hhoG1aMamT
	jbC9ecO8+d0J4siuhotIWtT+4hjZh4KF6r65lbuK830PKxzhpudo79revxJ+4Lj1
	ziF1KQ==
Received: from db3pr0202cu003.outbound.protection.outlook.com (mail-northeuropeazon11020130.outbound.protection.outlook.com [52.101.84.130])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4aeed52mhu-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 07:53:51 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eP8/DDTltZ25sM6BqAgfWbNtsVj8kDctN5Mf9F/QWUpXWdtqkA5+JVjg2kug4eQZzFWFhBO53jYFV+t2YCH9YjL74ZbYRb4loLEri0iVvbZHGVTYjnVmIsXnB06osffW9HXGNlmF+sBo6+TSWNR+bhIYmYvBwDMcH/nsRN3dKLp4BWttSEC2dPk3Qfd2/SgxYQ5LENtruRTFWpZhzFxS+iLB6N6I3ERzEuAySsw54Ur2x1G8XyPx76Vsv2ynH9ATGrv4WlLnYOxmbgEgRJthrw4fnjLBRG3VZJY/VA/GZtxT2HnNptcdO2LieHSaY5zIBP9VOJalF9gGgRh1aOhUlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUJcEPaf0uuZPx6Nl1Jt7EZSbLeRE+goCuIPyVY051Y=;
 b=iZsd/cG4epmrcA5US0crtpay2svukje11mcF/kjb0fvNJPZVbEkdTz/2RwxdCVk5Ura3fW8B0dxC5TjkFlJi/8ejb89iQLZIAOTSZ/+4h/Jo0qjpbS5Fd/yi+Gr4ZUtsJ5D4jvullJKndx0TWuzVmYdIldw6gVnbRZAD2j6uqP5A7butvh9xMhjF27hEjKkh4tRtiSvI0f6fSCIpj4qmRNIxEsNUSDBhsNyes5+Jad0qve17Yusd9M5n3Y4qh1rXQPFYCam4siOCZ1qgNM+3tx14hSUW9qpl/5W9pQNKmnVpIJTu0PRlfahNBRkN+DQDGtAkMZ9A4N7/jlrTw7Wjhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUJcEPaf0uuZPx6Nl1Jt7EZSbLeRE+goCuIPyVY051Y=;
 b=XGtVkPfLbMAB8WO7GC39rMdmdFld5xQmpqCixDAdh2uO715mh90t3Np311xbxuCadGWtecr1NxDXUwysuaniJPGqcjFUSA1hms/rBjGjj59jjPx5V37BTuJsMMvmKyd6bi69JHcm6gRLehX+O4Q9zm2GVt8Ed+KtmSCAlTE3GyI=
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM (2603:10a6:d10:17c::10)
 by VE1P192MB0653.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:167::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 06:53:47 +0000
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0]) by FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0%5]) with mapi id 15.20.9320.013; Tue, 18 Nov 2025
 06:53:47 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 RESEND 1/3] soc: qcom: introduce new QMI encode/decode macros
Date: Tue, 18 Nov 2025 07:53:39 +0100
Message-ID: <20251118065343.10436-2-alexander.wilhelm@westermo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118065343.10436-1-alexander.wilhelm@westermo.com>
References: <20251118065343.10436-1-alexander.wilhelm@westermo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00003829.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:5:0:8) To FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:d10:17c::10)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FRWP192MB2997:EE_|VE1P192MB0653:EE_
X-MS-Office365-Filtering-Correlation-Id: b3d968cf-20fa-475c-1f4e-08de266f38f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k2cN5l2maV6UyXbaZrLyoJd322dDyzFW/oDT0bzqjCxr7GGNT6JTPKC92dSf?=
 =?us-ascii?Q?4yv6m7/3jawfzWSQl77Snmq4/0NmWig5QBh66FICsAUcFOMmdmbA54y/Zuc8?=
 =?us-ascii?Q?ZqkMwzrWGTwPizJiNL6w/3bYDfzE4UjPZfHg17W8ETn2I923b93A0sNaDbYW?=
 =?us-ascii?Q?rkpoK3T/J/tiAlDIzjaouGlNNqzDgsidMudy6W+5xYSqIQFO4QN/NH8SYFgQ?=
 =?us-ascii?Q?5f5W/rsvfucekauOHtIxxg3UivSmxgLy33gN4yQ3GjKMMI6vam4v7oqQwuF7?=
 =?us-ascii?Q?OVkVMpTO1PlmDTQ4ll1WJzYpa5zHhbSR6aEThru3oM5Cs2LhJd2ZkCV4jP3i?=
 =?us-ascii?Q?IZkYclLS+LEJTz8qdCNUA1nlSETI0UvXrkvQjJfobHqmtfrNCcXPWJ7Uby+w?=
 =?us-ascii?Q?vU8nzGo8/HgcaMGSxD832JSgg/pqE8SmXbvd4X5DTpCdvC88CYX5yKK1+1dE?=
 =?us-ascii?Q?J3f9Bn0g/Wr+Pn0y+Gan007ym4PPFT9QkucR0/aaGq4xQ9pkcV+fn4AWvwJn?=
 =?us-ascii?Q?ymCKQBytvnwYT17iyjEw0/WYIpZK+AMvxnXLYEoxqqLTbpHjE9e+bp/zHHKK?=
 =?us-ascii?Q?JndDz72vFg+0NKEJ3i/Er2UChsNJuUP9NIF3/b/+qmXCfjSEen7FDSR5V79G?=
 =?us-ascii?Q?YkDKDQg8i333zMrG5JLdGXnxmKUlll2zSCL1cGFXorlH4ui+QsBwUeNs2pb1?=
 =?us-ascii?Q?qGgdnSXvli3tIOr8wT7YLoe6VMPjhmn8Q13vmjD81AyNCiIxJ1lNf1qQ7UVy?=
 =?us-ascii?Q?AfNo+FTfPKlatiIhk9tNmI1QSaH/0SVLn+yHfRpLrJc1Pg5jtPWz/pfxiQ/O?=
 =?us-ascii?Q?ZB7AZGYLTh81F53qSOFfei6vhVoqS1AazVkkLgjP32tin6/atTWPXn8C2eQB?=
 =?us-ascii?Q?TrRobQOFaJfKgnqHFOCDG+GJMe2jCDf+z6q7PQ/3nTJw5xyYD2K/YdoLXIlk?=
 =?us-ascii?Q?3xNQ+tHBSOOWT0taQ7Llm02DpS+Z0PKfT0tvd6aJTQLgyfTgK4vkNwQkKuvZ?=
 =?us-ascii?Q?bx7zxWwRkj1Sk4/Z30Q/DPQylsqFFLvVkcjDBPGX5baCaY2thleVl0WzhEwW?=
 =?us-ascii?Q?pGNhYp0JMWe0Xes77/+TYaj9Je+f4Dmxd0n/Ytnip3B7r6+OP3qa2tdfZrc9?=
 =?us-ascii?Q?uPxUsOFhIBjutJN7z5uBP5MJsYRl0PwEvgOxKaK1UJRSYreZUxrBkIUuI5BU?=
 =?us-ascii?Q?a8Dct0qATQwUpG49kk2Gm3mJQI72UfjC57bLhWK+K4UmLc1N5V65RLRp1gws?=
 =?us-ascii?Q?bMWAkqnyJinw00NMf+MEJHRmjIqYR25/2Sf0wL0dl4pSgiazW9DtFal7x9yA?=
 =?us-ascii?Q?SAN2i+yb1PLCnsFoTum5qNansdkByY9xbL+4E/dec8i+pz5a6+tnLNnGM4ss?=
 =?us-ascii?Q?KUhxPpcury+psFkkulGR51FY7VSaUY+TM2koGzT5dHp/rcQ0hXP0XKcpCmkP?=
 =?us-ascii?Q?GI62yv8wYL0ovqarzY9Y1FXON4/aZxYA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWP192MB2997.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LtcIurzx1huFN5QWecPBuV5P/2n4583tKBm2spUQdeTX3aYmSqE3VdYFNqY+?=
 =?us-ascii?Q?OHrdTcGuDM/TBIzKiwajRSOGwXCKif0qIkfdK+JuthLDVozZEi2E0n55SWQI?=
 =?us-ascii?Q?ni98IwyWE2HZM4MtknfA1DJ2LIC7xwexP7JDa53dMy5L57CclASkeGYTSFxT?=
 =?us-ascii?Q?nZyKyPLpujsWGyLrw9ksPWPPihMwZEFf96Zrg2jIIpAP2Va8/7Re5M2dzOMm?=
 =?us-ascii?Q?xWf+0V3vTKbo8r0FRgVwXUy6+D+KmULwtUP31VFXtH1xjwWnYLJkaW8E1WuJ?=
 =?us-ascii?Q?1CMNXLPkHmRwJ596QgEL2VpDJgzUJw1Pf2Ok3QCqbgOYndKEU5jv8/89HC4y?=
 =?us-ascii?Q?cKX+bRXUcCVNeX5A0tzBPR0/BxQ+fUUU11IyRs2B2kkIXjBQcHvWSVwMLKQD?=
 =?us-ascii?Q?/9/zdEyzYwDT70bJoSRRwyd+kabK1pcFjRJ18jpC57kXEoxtC1i+MDlBwm7E?=
 =?us-ascii?Q?O5m7jqKSTV5jla3f7NliWTDVpVVKD8l5XPTSb04JBpdoI9dcVGTiky9XRobF?=
 =?us-ascii?Q?Y2BfRzVb3iotVS4YAuRh9G1Sirmfk+E+QNX9DODYRgr1nU8UQavBok3iOJQA?=
 =?us-ascii?Q?X4axdxKTDuUwsH8yvWzTDb9TZ1PRxUWxEraLuirBfLE8EydEV0pG3hp65ZxW?=
 =?us-ascii?Q?Tev7DbPhahnCDbN4O9moGNcoFHerADIM29Lt4PVbbJMB+Yx4ia6h14Lnd8cJ?=
 =?us-ascii?Q?YDD0ylS9ITja1arzhDQ7I+kw8ZCW2HxEQrZEL07i7h55Yykm6ioSJE5uLB51?=
 =?us-ascii?Q?y0gICP0SAVVy5kjW0bZbxqDJwrxQB68df9rnwubxEQG43dG4khAxEm5sAgwr?=
 =?us-ascii?Q?AXe6ax/M54+zRQ6nFWVz/8I50aCANe1Eco1yv0lmPTn8Cc9ktj7/Lb59K3Se?=
 =?us-ascii?Q?QsPDRF5BfgceTjkxePebMvKHFE7QsWEtJkU2eHx0Am0KL1bhaUkqc7x/YuAz?=
 =?us-ascii?Q?lcoVhFqN5Z0Yu85MIxVdIbxUg+hpZcyC9HC6PTqZtbohYl3pN58Vg8+dXqdw?=
 =?us-ascii?Q?eBYRvGFVj+5eWPCsJEP5lNm5woaWQckqslE/HLsBjtlIzPsGGFnDskVPdw0+?=
 =?us-ascii?Q?TwoGSNT3R/HRV+mZbHUnOydiuRveXNUcrIYa92Igx4gArJI7gAgckmBJvJtB?=
 =?us-ascii?Q?BvozyJ6Nj1BZisJyvH+8tGN/aoEadKiJBV9NLRVnDt+az5zN24zowr+h8Clz?=
 =?us-ascii?Q?YMlk1yz16ioyH4xiwH+oz1T9tsKRKqepjV0CwOWxyfpWutHNzud8MydQf9EY?=
 =?us-ascii?Q?iASsjtZiwEfApPBr+XPAmDtazpIAkdYE1ovcJGU5/sGQPE4CostSTy94liYM?=
 =?us-ascii?Q?f1zpE+VAwVR7hG8BarCSivWK+rv/zSuuuggszcWJkY/xAn0OoPL6bS2ClLEY?=
 =?us-ascii?Q?dS7d3VARtl2GI61Ex+DkpPFvfGaZasIvX+pv7R1LI20VsdUTux46ij4l6Omz?=
 =?us-ascii?Q?/U4ZdELlvgMnuczwwlkJUp/SLgieiAoye/JvalT063mXaJS3WsftdFl/nrbm?=
 =?us-ascii?Q?FkI1oXxcBTVWa7kpGgTiaRdEZ9QBM/gkP5JtB+UVvCcmECiPDsCnYlTRZvLZ?=
 =?us-ascii?Q?8EN8LQgvwnFR7Dsu7MVZQR8KJejr+bQzz16R7PU5?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hn/Znw4cpxUtGRm+9mtdBEfwKtN7dDWT8l7r61VhSt2s3v3FdVK+tKwDULRPZ7N0HXXM74F8ceULkc0DcL9yz6lKK33mhYV/jCTi+rUxnlMtPmO4yV4V2FLhOe+mcErCV7GoayA7OfLbHE2W8Pa6AC1AKfaRW8bzVFFgPQ15JwmLm8JyoGlH3/YzFtGc2ewYou2ZG+PHPQKaixn9/7Lgod9aSOR/C4AVUsQ4aGmy4swrhrZYK7iBHtOEZADTXPso0hmyljjPn4l1wF8S1tzWjSufaJgeWz0XxvMBzgGfOhtK/t2+v/NX393kga9AzNSOsmahewaOdIISUHihVbJ9IKBeHXQzkhT3jnnpAp0rMIQ6eBgYRoAaHuuI1V+vfkqz4OapIDe2P8lcf+gzcaDQFRWX/8q7h2RNnfIVJb7DBjnv/LGKp0AXnjdMAI34kmOBEaY72FqYJfMRQ1VXn+DXPGsRLgJYZyN0Xt6Zp2vHwGdpqigAR0e3M7T8nLHpc0MD1lqPVO59mYQohHGr7O0Z59CPdM/ygAv359F5MdHbGybrIQGomU3XnVeDrQIyLARSnpMQ7QG37Dsjz/+DQKWIHUKlGHeoF4TXByAgfcy1dX47EPZ0kqWwnx+1j8xa/m86
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d968cf-20fa-475c-1f4e-08de266f38f2
X-MS-Exchange-CrossTenant-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 06:53:47.2161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YA+5WAF/gdz6wO2uP72Uu04qJraIIh2CGbYba1xx104xQrMgGEMZZrRunJXeAVUwS3OtC4tVaJUFtuOtGwL0eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P192MB0653
X-MS-Exchange-CrossPremises-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
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
X-OrganizationHeadersPreserved: VE1P192MB0653.EURP192.PROD.OUTLOOK.COM
X-Authority-Analysis: v=2.4 cv=dr/Wylg4 c=1 sm=1 tr=0 ts=691c17ff cx=c_pps
 a=Q67dIzWXlOQ+KrpM7kYsAA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=N9GNhs4bAAAA:8 a=T0L45qBzl8X6T0AR6ckA:9
 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-GUID: iO0UzzTAKQk2At3cf3XZVfz32LDfmqgT
X-Proofpoint-ORIG-GUID: iO0UzzTAKQk2At3cf3XZVfz32LDfmqgT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA1MyBTYWx0ZWRfX9gxnZZ9lYv0E
 GPsQGz2EiOE93ijgBl7LhyU1N8GSm7Tox6McYb3drpDJFFIxhNlczmiuBTwn9HZvO1gbwnyZax5
 aSym5RnJ+UDsvjWPSmgBF3ceTFYwHOAsP9/wD+ygpkKwmkaGYOd0Q1lwRfoHMr7l5qH4D0kwS7s
 NnqDTkxPxOxWDvrppI5EtpKwHRxVUBlO9QsbH2TZmffWD3AEtPPN0jcyey6sOYLkNCNgeaaaxkf
 VznBQPLvlImBkrqYQ/tZ4Dy44yPt7D/ufsR30HHAQwaLj1nqxdWD3W+JymqSUgTQDsTefZqDezb
 8PP/Hceczomkiqk9CLAOpyDujQI4NYRpVpkcybcybVCzV5Shw0uRmpfxwpsX77bm8UVIL89HJWB
 W+HwJAwf29NxdGDIGHGBXEUa2vt96A==

Introduce new QMI encode/decode macros for each basic element type. It
allows us to further distribute and handle endianness conversion of basic
element types of different size.

Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
---
 drivers/soc/qcom/qmi_encdec.c | 56 +++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/soc/qcom/qmi_encdec.c b/drivers/soc/qcom/qmi_encdec.c
index 7660a960fb45..1f9091458d72 100644
--- a/drivers/soc/qcom/qmi_encdec.c
+++ b/drivers/soc/qcom/qmi_encdec.c
@@ -30,6 +30,34 @@ do { \
 	p_src = (u8 *)p_src + size; \
 } while (0)
 
+#define QMI_ENCDEC_ENCODE_U8(p_dst, p_src) \
+do { \
+	memcpy(p_dst, p_src, sizeof(u8)); \
+	p_dst = (u8 *)p_dst + sizeof(u8); \
+	p_src = (u8 *)p_src + sizeof(u8); \
+} while (0)
+
+#define QMI_ENCDEC_ENCODE_U16(p_dst, p_src) \
+do { \
+	*(__le16 *)p_dst = __cpu_to_le16(*(u16 *)p_src); \
+	p_dst = (u8 *)p_dst + sizeof(u16); \
+	p_src = (u8 *)p_src + sizeof(u16); \
+} while (0)
+
+#define QMI_ENCDEC_ENCODE_U32(p_dst, p_src) \
+do { \
+	*(__le32 *)p_dst = __cpu_to_le32(*(u32 *)p_src); \
+	p_dst = (u8 *)p_dst + sizeof(u32); \
+	p_src = (u8 *)p_src + sizeof(u32); \
+} while (0)
+
+#define QMI_ENCDEC_ENCODE_U64(p_dst, p_src) \
+do { \
+	*(__le64 *)p_dst = __cpu_to_le64(*(u64 *)p_src); \
+	p_dst = (u8 *)p_dst + sizeof(u64); \
+	p_src = (u8 *)p_src + sizeof(u64); \
+} while (0)
+
 #define QMI_ENCDEC_DECODE_N_BYTES(p_dst, p_src, size) \
 do { \
 	memcpy(p_dst, p_src, size); \
@@ -37,6 +65,34 @@ do { \
 	p_src = (u8 *)p_src + size; \
 } while (0)
 
+#define QMI_ENCDEC_DECODE_U8(p_dst, p_src) \
+do { \
+	memcpy(p_dst, p_src, sizeof(u8)); \
+	p_dst = (u8 *)p_dst + sizeof(u8); \
+	p_src = (u8 *)p_src + sizeof(u8); \
+} while (0)
+
+#define QMI_ENCDEC_DECODE_U16(p_dst, p_src) \
+do { \
+	*(u16 *)p_dst = __le16_to_cpu(*(__le16 *)p_src); \
+	p_dst = (u8 *)p_dst + sizeof(u16); \
+	p_src = (u8 *)p_src + sizeof(u16); \
+} while (0)
+
+#define QMI_ENCDEC_DECODE_U32(p_dst, p_src) \
+do { \
+	*(u32 *)p_dst = __le32_to_cpu(*(__le32 *)p_src); \
+	p_dst = (u8 *)p_dst + sizeof(u32); \
+	p_src = (u8 *)p_src + sizeof(u32); \
+} while (0)
+
+#define QMI_ENCDEC_DECODE_U64(p_dst, p_src) \
+do { \
+	*(u64 *)p_dst = __le64_to_cpu(*(__le64 *)p_src); \
+	p_dst = (u8 *)p_dst + sizeof(u64); \
+	p_src = (u8 *)p_src + sizeof(u64); \
+} while (0)
+
 #define UPDATE_ENCODE_VARIABLES(temp_si, buf_dst, \
 				encoded_bytes, tlv_len, encode_tlv, rc) \
 do { \
-- 
2.43.0


