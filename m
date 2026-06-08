Return-Path: <linux-arm-msm+bounces-111817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iY5rNQObJmp8ZgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:35:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7BA655298
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:35:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b="Q0/rCVLc";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=E1PAsd9S;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111817-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111817-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1C315300533D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 10:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 471C83B71BD;
	Mon,  8 Jun 2026 10:28:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C223B7B79;
	Mon,  8 Jun 2026 10:28:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914511; cv=fail; b=kFoSATsthK4bHTTxOw87SwDfR5C2b7JL/kv+t2cO8MB77fWdUzT3E+XnFbfj3VxTJwoqLe8LsiaZ0RrrbukvCXUbORk1IMTn4Hq5xZQnfDVuV6JaChc5ESUQt5VSQGpbdliemNzW3GpAdMur39c0crcvpSU2Z8uXNN3WWOtgHLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914511; c=relaxed/simple;
	bh=4HAeBhKbaQIgGryNw61ZXeQPOsTIsyvfQT2gZaFSHUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uls+WvP2TZLxXL49TFWKaQ46LrpkKJLPojEI4Jo6ebyF8EYzTe3grRAAVnCTdIM/5fJtOgEnXrIQeEIoYAHBAMUAWPwflb2zoTFYP5+5L+7zMwUumaNLD16Z+JcH8tZ3tEjtnk1E5jG/q9q3HBEngyc7OQpKg9I1NonvsiesVcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Q0/rCVLc; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=E1PAsd9S; arc=fail smtp.client-ip=67.231.149.25
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6584fEuP3647139;
	Mon, 8 Jun 2026 05:27:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=6Ay4wym6H3h1U4wmwZE/klWNNTGfXRuWp+uhjSL3/Mg=; b=
	Q0/rCVLc7tnjux+EMfkboXpsv0MVAPBkX8e4NdQWxR9J9P9EDOQuV3H5BfGTPVpW
	MgXdefChALNLBg5JOZbCNrjGuEBHbl5I9JJh+bI/a0Gpoe5vfTDM8TPL18JuctE6
	Gd8NyxZETFNzuTH2BK0glYdQh8eFfFKeTi53VTJDoVoFhgN9sabf0pL8f1NddkxU
	bhfVOutW/rYYxGt5Qgi035j/YgYSyfBp55Em+aNWNq750zwhyJ4Mxxn8Xeo1Ar97
	Kq4q9DWOXaSWWtTcKjq632yX96zfCqx3CYxMmjrtuXcDA54KRWxvVTETVn+nfIno
	mJHiADL4CDf2huZC7TYhZQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020087.outbound.protection.outlook.com [52.101.46.87])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4emgy0a8pw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 05:27:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CCbrJVbav7pC29g6C+0FZZEE2C4+z2m9/iu8if0SceQ9b+3CTp70ykGURPYUud7htaMD62MrSSlgbldPs+7Rkdyy2hKws4FEMKR4mX1c0/9eQx3CaRHKWO8St/igSBUwH8iPESphy6kKZMxuCM8FfvkR/YiSxyWp1iybMI6zLzgLfqcLiF4YpvFkioZXziWtx5t2DhEklrSAY/h4g7WA5TnlYQzPt4gW96Pm0MfzMgYkyNb8ms4uodeKEf0Y2JpaqTL73I/f+3xbtyP56hhOfV7Y7Nnbl7KfT5/3zbUo24IhgW6/IGfxjsBr/3MC1vfOnmQK5hdkbB+CqCsFwt6xTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Ay4wym6H3h1U4wmwZE/klWNNTGfXRuWp+uhjSL3/Mg=;
 b=k57csBwmZcZD4Eeqw/1ltmtVS/MI3DrXZqTFMBtFNwsEIF4o7pH8dRha7IJAtF7DANiK4bebsWSZivAPqtqv24FXUGZ9E6v6qEHlbvfz/n+pHrTU14n0KBwX2lkrS0VKBX6o8HDxjy8suYc6EOHqTWWbsm9RjUsXQ3isYnOacjoUMjpC8q13KlmsDGIjUN6n8OLz2NrCp2SMIAZclN52sXz9A/ucG68KyK76xyhv0VlrHCiIxHdzLjsM++Hr0qvEl1dx5tWIdUqAzoJRi1O69Idx6AqaWgtzSq1/PBLMJXnjhrtO9pkJY+hmIwjcdzcQK6nGoC/RnamLOmN61VrYfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Ay4wym6H3h1U4wmwZE/klWNNTGfXRuWp+uhjSL3/Mg=;
 b=E1PAsd9SMNFMWF7IkpOnJRGIvZ9S3UhVEei0oAEPBNqtxY3OiApb3g+ksxqHzyiO2uYJYMzrYPiHHoxKxwBfTTTlDR0y5wXgG+eWdOo1cd5nH1BOTMWlMz1iHK7w+GY4RPFZyjEzA6xDIaGZVWhrClFkzVouFMtLLdu/+EgTO3E=
Received: from PH1PEPF0001330F.namprd07.prod.outlook.com (2603:10b6:518:1::a)
 by PH0PR19MB4792.namprd19.prod.outlook.com (2603:10b6:510:24::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 10:27:20 +0000
Received: from CY4PEPF0000EE31.namprd05.prod.outlook.com
 (2a01:111:f403:f913::1) by PH1PEPF0001330F.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Mon, 8
 Jun 2026 10:27:20 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE31.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Mon, 8 Jun 2026 10:27:19 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0D5BD406559;
	Mon,  8 Jun 2026 10:27:18 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D8667822545;
	Mon,  8 Jun 2026 10:27:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 05/10] ASoC: pm4125: Use new SoundWire enumeration helper
Date: Mon,  8 Jun 2026 11:27:09 +0100
Message-ID: <20260608102714.2503120-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260608102714.2503120-1-ckeepax@opensource.cirrus.com>
References: <20260608102714.2503120-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE31:EE_|PH0PR19MB4792:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cf6adfba-b3d1-4546-4bbe-08dec5488527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|61400799027|18002099003|16102099003|22082099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	BxcUHdZ4xsn3QxhiWsDGkwPwS5TkHh0MK+NfnnyvQxRM7MzsS7P2sLFh6R/IElC0Kv4AbsRCOLokQHFO6iDQlWYQtsAgxDjJ/lxmP4uEiO97c/M+KCfSO4qs02tgiv+8bSTfHkk7708jtZw8ooLVS9lmlraeLmIItebVXk/PA6Ua/ZDVSjlGGyzVsAC6fU9cxbI5Fvqy0JFx1hvBsqWnBfYer30TAcdF5VQCcXd8HdtL9LsyK+6oabz+XVAp3nwm1lV8S2BLQWPN+vfa8gxv2tk46qjIdEDbKDdl8Fw5aKod4Y5ewJpKr5zJTeUuPg4jACI69MvGc7k4RdZyJ+CCgY4glU4oLltYxJjxuJICY/0H0qsUusgA4o9f3Vfb1JOlaPmXyjwdEYeuhTCx8sP9ITvN2OVdSCi3+UGr6KZBZa9liuJ/Pvg1MJfgdGqEEcllRhCRoY3L+fEhD6YZ3gw4nj3b1xEYJrGHa4eZwx9OTXhs0ifRt7sWGKVjzmaFTcDjUQSQoG3cykPXxfI2+Z+fZWsj7oHrjR9hb3WroOXCbX9yYMin7IqCBLueXhV4aM5g7Jy8G3f9bfXjjt3ykG7Fe2SEwjnTNbEw1qCVNv5DjtXGc90JQYT9BDygePUAFL3Aejy2iCWqO1u2TMKAFuTEpAgyu9tfde8hvOcaFJ0avKwUsdytJUY4VNZrNJ4SkuB9ZPKiKBZB8AemcuA4Y6jn63p6vKFBa+NujC9XQXQfmLk=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(61400799027)(18002099003)(16102099003)(22082099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	okY5CJ0n1DwLNLJCrkcZERnI9tHkyc+RLCG9AGLY37jI+Ia/91jwl9Tmr4SZmSkAxe3iWBlz7p1z4KIsULr7eN9cy2mcrdt/YkmT8uqLtJf+tqWuyBAfKt0/xRA2LWcBh/RlfkbH8YmZU5ZqprbQVZn+6nV5Rf2sbReDt3h6P82fX14T0NEb7QZQL78PQZr1Yml4fiRUJ8fMZq6Do7l1smm0nifsCW3P7aIlIl4iHw4l0smGtbcE5DdjWzy/mYLsFZOzOHtUIBDxwtJEoTCtZbsCxBvpe0toDYkb/oh+MBTTA+XKwWlXdeKawVLlvcGcO7Kh9jKB/35PZbxdnGd0NDmslx6zzDveDMs8KKY5QOGaSVPOgukSqmDIetxQ/N1gATpxOTyc+N1YkLkYBiawox0cI1m2w+ofaygqmSBefoHxMUJ8kywXRPZIV4pYKY8z
X-Exchange-RoutingPolicyChecked:
	WvdTUEx64gKc3J2BKVzYpsNxlKd1mWY4x+8sx7RJlPPwfpqt+/oduworZ7XiwI+jHUbrkWhFhl9UaneUfo8m1ySRQFciwImfWf2gO0XqQFRynAoTSiZXV9ZMUdbn8zSIwQmV5It1MC75GiBFUwbWXuw0LmFY9cvaMQf0w9EEPS+qjBoiPU6w73kdzdKD+0Uyw28YiM5Nlv63IpgcosioB/6URiTZaEUGFkGuXx3DqxL+HaIduka417Rq01eiUCHCuilpToHan1dS54H4wI7hwFHEsHAppeCxwCHPK6qbri/O4BlEGQgOnBI0VatHX8Eno4ixu94sgNM1KA37i7IsZg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 10:27:19.2520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf6adfba-b3d1-4546-4bbe-08dec5488527
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EE31.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB4792
X-Authority-Analysis: v=2.4 cv=GP441ONK c=1 sm=1 tr=0 ts=6a26990b cx=c_pps
 a=JhSJYUolln7UJVv2rG4jYw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=EUspDBNiAAAA:8 a=w1d2syhTAAAA:8 a=3l_c3HHteuAAOOvkCYUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5NyBTYWx0ZWRfXzs2kKZMEHvZ+
 dNtQ5RqScxTmqRfhnST6DwlHFxfCW6D+oeLei0iJylbKqRtyTmluQF/R1PLPvJsPsy35DfbpaSZ
 zeevWqbG2X9JZOrsFdfamXstlBNklcP4y5tqy2vQWiDTva6u7bJtnuuIvae7Vof10Ykk7VXlj0b
 wzNW+y8KKmBUVpnBTBwQp3d61aHLvAndulKS/vVZL55gBaGEmsumyBRaSX1u25eNY34BjVRsWmD
 AVZSz80C7Cfo0EnX7i2Wlg+sQNxqxYYU2Aq4tQ+ONdHllB0OZ6PN3NepSLz938QpuiLdvb9mOp+
 jjhopYC8vPBoX/avpe4oHRM9wx8DwU4CyOqGxAUM0N6DyWZpp7TO6Ck271mrWmsVF38nUt1Ga7x
 EOHKGnAzo5iTP3Ld2Q8Pwapb/5c1u3YyeZYo1EZBB0UJfsd4LnydqAPUCdjzk1wMiyl118GS7aQ
 a2bSIJyEh2p9r0oqpuw==
X-Proofpoint-ORIG-GUID: 0EbPEJrP3HnXKiJ-JyvS5WXgDrADJis6
X-Proofpoint-GUID: 0EbPEJrP3HnXKiJ-JyvS5WXgDrADJis6
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,linux.intel.com,realtek.com,kernel.org,vger.kernel.org,opensource.cirrus.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:vkoul@kernel.org,m:lee@kernel.org,m:lgirdwood@gmail.com,m:pierre-louis.bossart@linux.dev,m:yung-chuan.liao@linux.intel.com,m:peter.ujfalusi@linux.intel.com,m:oder_chiou@realtek.com,m:jack.yu@realtek.com,m:shumingf@realtek.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111817-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,cirrus.com:email,cirrus.com:dkim,opensource.cirrus.com:from_mime,opensource.cirrus.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA7BA655298

Now the new wait for SoundWire enumeration helper no longer depends on
unattach_request it is safe to use from probe time. Update the driver
to use the new core helper.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v2.

 sound/soc/codecs/pm4125.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/pm4125.c b/sound/soc/codecs/pm4125.c
index 1f0a3f5389f1b..29655175ea289 100644
--- a/sound/soc/codecs/pm4125.c
+++ b/sound/soc/codecs/pm4125.c
@@ -1309,17 +1309,12 @@ static int pm4125_irq_init(struct pm4125_priv *pm4125, struct device *dev)
 static int pm4125_soc_codec_probe(struct snd_soc_component *component)
 {
 	struct pm4125_priv *pm4125 = snd_soc_component_get_drvdata(component);
-	struct sdw_slave *tx_sdw_dev = pm4125->tx_sdw_dev;
 	struct device *dev = component->dev;
-	unsigned long time_left;
 	int i, ret;
 
-	time_left = wait_for_completion_timeout(&tx_sdw_dev->initialization_complete,
-						msecs_to_jiffies(5000));
-	if (!time_left) {
-		dev_err(dev, "soundwire device init timeout\n");
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(pm4125->tx_sdw_dev, 5000);
+	if (ret)
+		return ret;
 
 	snd_soc_component_init_regmap(component, pm4125->regmap);
 	ret = pm_runtime_resume_and_get(dev);
-- 
2.47.3


