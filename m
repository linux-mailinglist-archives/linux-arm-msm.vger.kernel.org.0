Return-Path: <linux-arm-msm+bounces-111340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a4PuBQaOImqcaAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 10:51:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A522E64695D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 10:51:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=QhxLVSK+;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=bgw5j6Ey;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111340-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111340-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3CD953019129
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 08:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1AA14B8DF1;
	Fri,  5 Jun 2026 08:49:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7337F4ADDB4;
	Fri,  5 Jun 2026 08:49:02 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780649344; cv=fail; b=p5anHdHdjLtoJKUdNT2Rcmc4FRFv6WltMwoNRBJSWteMKcGKUMUbiEWb+nmUPM9SGRBAY0aZmFt/KPe0X68lG9LD1tssqcCgj3mNZTIAuKgdScpLNLOR3ytt8FpoMYWNIuF7J1I1AsP0pWez9HdJDx8ch/6oaNet88TYDH9JYKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780649344; c=relaxed/simple;
	bh=CsyyGzpJ9AkuGSwk6a4aWe2fa+39tjUcdXD3r6w72TM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q+NsbCa8Kmy1ChbIg7VSo7jHVzdELnL7UTDaF3IjyXfupdRtlVHPy9NYvllgpn7WBgbchRSTTO1i8cMrpT2GDtOeh2bCRJmRtw+B5hpFTlQPiJW6NZFudPKN4FeHWjCc90hW8puI81kG5jw8muwwC9sVhoK5H7ewYhQpq8lkBuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=QhxLVSK+; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=bgw5j6Ey; arc=fail smtp.client-ip=67.231.149.25
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6550JRiY429440;
	Fri, 5 Jun 2026 03:48:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=4WDCmWoXWL0mSKvv3ezUJgLA1Wrex8PGAA5iycP7MRg=; b=
	QhxLVSK+qJcHDUp4zN54kDPx1WbafPD4I81LhwcYDTqJ5p4Xq5AoO4Pwmt9oyObf
	cScrtvSSp3yQFQPcAcNuW0jRjqVFoIGBqCTYl+MvFN7SPyWcLNJdd7NBEc4qYQ/Z
	v0qmBn79VjFzqBbkwz4wlixrghiOZERBL/3WLrShtDW8k6wjoHwZeTluz5FeXpTE
	uAfL50UII3GN7R8P2j/I/+ZoZBOcSOMf/qMDoEdTHhSFHmQTy7H+3ol7yMgrjEot
	gf0dwEj5ScIPmIYF+r+HUqqoj7xEMAE0iJ0CsRODnyO48cTcOFr6oJfTgOwJwnfY
	sBm9WzIr/7tvOhdwLcX97w==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021083.outbound.protection.outlook.com [52.101.62.83])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4efwa192ja-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Jun 2026 03:48:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BpoBheyglDUvVUwCdM1ePzFB5nSoui6k/epKpUHYWJGXvHkmEmf5KFDBqUeieCUAbHqv0DzeS/+Wv1gfgRBnxEWGaQP1K0tRceIPgG/OO0nLmGonDJmJNGLAufcjJFIX8UQsc4NqIfafalx0L18+gza/H6PXl+ktKGKz3GganZPi6rBJ8iI6DsxWZFd07wwhOILHKN96E60lgq4xwwzY0EmT4qG2yKNTxMeHiYEG5Jm8G1MZ6sXQ46NvGKlm5lzP4WkaT95Pjntxia6g96TmO/9MFBKVN8kZxZWi6RDNpLO1mz/LaL8vmAMTrgFmKlRJPfu+ttxhOL6a8qHfvnEmQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WDCmWoXWL0mSKvv3ezUJgLA1Wrex8PGAA5iycP7MRg=;
 b=rL4sOwFUfxh6qgXzaIKqB5h0y5KeESDyB8wePJHjlvDKsoo6W56iuduJNsI9d9OkNvWw5ALVGQpievsl1Q7CgBptsGuPH8jPDXhJF9sfK4Ga9bvU3qWcHnt17oGL05vhMZ69Pp3+PccDi3C3aKHTCdeftQWwCHcymilKo2YOmVV6AKG9gC7ly8dpUs5/pyWV70khtMAY/jNrbDwRMCmthFm+puiHXulNZ/m5T9KOTEZ/GRwHv05d//zrM3Ip6YAZvkFKAw9LK9K0OmzCPAsI5RafUsrlgO5fusvOriEvfGfyXderjGYmvlVsZbHIUY3xUgpcxvDcVNg9ZqE9I3oKoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WDCmWoXWL0mSKvv3ezUJgLA1Wrex8PGAA5iycP7MRg=;
 b=bgw5j6Eym7nQ4SCBeU03wpUFTLtge3X5K+ozA6WUqnBGvm4AivsALYyVX5CokicL07yBsGqdRU+yf2VZYGYNLEjHGLSTzcyjNF+EsVUENiViL6ZC9n31EmwOMd4qXiHYehwTmusxl89206oax1jq3kfDWZ1OP4Wiz80nu0YxLGs=
Received: from DS7P222CA0022.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::25) by
 MN7PR19MB076263.namprd19.prod.outlook.com (2603:10b6:208:5f0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 08:48:19 +0000
Received: from CY4PEPF0000FCC5.namprd03.prod.outlook.com
 (2603:10b6:8:2e:cafe::42) by DS7P222CA0022.outlook.office365.com
 (2603:10b6:8:2e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.9 via Frontend Transport; Fri, 5
 Jun 2026 08:48:18 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000FCC5.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Fri, 5 Jun 2026 08:48:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 45795406561;
	Fri,  5 Jun 2026 08:48:14 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1EB6382254A;
	Fri,  5 Jun 2026 08:48:14 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 09/10] ASoC: SDCA: Use new SoundWire enumeration helper
Date: Fri,  5 Jun 2026 09:48:09 +0100
Message-ID: <20260605084810.1575539-10-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260605084810.1575539-1-ckeepax@opensource.cirrus.com>
References: <20260605084810.1575539-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC5:EE_|MN7PR19MB076263:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 69925835-afbf-4ce7-5c9b-08dec2df30c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|61400799027|82310400026|56012099006|11063799006|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	B1E5+rHIRE4IkEDXL6zrLPpxNb77M9w1zwByUD9gt7NGP9zskCuh2aUMI61zdM9bHWL3yxS6GnGZLGYhtI6iDAIRWELzdUPpNUo5I/ehBGpoBuCwYZYR2OqqdJFT7pFDJSJSdxtmohPb4NXvYXLBaAsY0EgQUxLt3z/2fYfdtvFxgPlhteQ0akWpgWqt/DkhDOP+QMOYomwn7k1XGNS3n8RKWNORjQQZQtYAasDWn9Pyt0QtLs2bacdzFBBzCuvOOXDy9HjDI6XsjLBM9Eo5TGAIbycyI7exNMVzxX/KKN6UCyURm42S9lIZ96iG5Crwf7XHMc3KoiQDxPJTrDWKQyj6JM5QCoyyCP+nOxTCcE0+9GCPdTnCBu/0nbiy43OxrWGZcHBF9uemNRSyE0f9H68GSAIdTzrlhoOVngYB1a9M1a6d9ya7yyv6Ji7xF6ICBlbfftUpGUZ9nMp9dTicjjkepN62LltI3AkaYsRYOXHQimaMJ5Ct6YBcQ6JKEQAe53KTYwQcWRJuMgEeEc8LMVuRxrIlG0sDHpppKoHovfJeyKqttpvxIAMibYqySOroskgqKFVgryzmjisKroUE40X/pRRj8NfEbkXNIfXIrvXrz09iNrCv3BIID9C75xjXli0HLazwdAPiKlDTzd6jrnZwRpjDNtlVrCpUsnFi3x/Htos9MEbE/nQ/cMMI5XWLfLa0sCzid+72g3b3YFXVR6pcqusBw2ComgHccdk7uqw=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(61400799027)(82310400026)(56012099006)(11063799006)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mv5/zdlRVSK/W7J1oogGSpGtEreNn85xZFszNq4SnJMpga7C6x1Dd5TCXxBHYi5pt5AuZfHnN9xEraqrQ/est95coudjlMgJ9mtm1WwEoRtXxurycmeZhsGtJC6zWjr3JXN5QOxsi8mM3pS+bDji49TrR40AJsx1LkcaQwAWN/7qnp2+fPSAorT1h3qve3a4cBDbxH3hqehCFXJ40fRTS5lEMVqPstI2m2veBeZxyoYd96BUQY7rUBsK2nhbPdu9Axu3GxqMPN3nmzzONGxDIhK8h9Jkmfw5UDrG5/U2r6VVmBq8yPQWEAwNp7dVLu5VoJ5UT29NIg1KlexCzPYMgE0TYnAomEIDWfbh2sQkisOk1FBaiX/RkxUALlPYwmvd51uluwAkJT7llXfqF2sLXV4FqJZQ7joL1X9dbHQiSNpzJbkF8Tk5IocNMo59f417
X-Exchange-RoutingPolicyChecked:
	kcmah+K7wYF8shhaDjx8LDYyOORCKrg2QGK3ogS24JH0fqsPGzeKxS0l8E8Xq3t5gjKVLhE9i5yzFmdpMpQuqCaeBnBQ6gKtuZoSUX0BGKsPTqBNtB2ST3Zx86BAIZmbb5I7Oeg19+GFF3Kj0TYCmSbX27bU3wCVcTblJbvGKYRTOd9DiqaqHavOVj9bVhkYulGMZJeSMTMGMmeasDMHC7dBE8AHIBB2gBXiByoa/5F1ll+HFTFIoe/co5rItaSwVL/vQ6uXnQXPF6jInbaaogOYSUWRHylVBuMhgLZ6Z5ZBTT8ROZ5KgnnxZi2pbgB4R8gOC5/eUfForpJMZqVzEw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 08:48:18.1968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69925835-afbf-4ce7-5c9b-08dec2df30c5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000FCC5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR19MB076263
X-Authority-Analysis: v=2.4 cv=WZ48rUhX c=1 sm=1 tr=0 ts=6a228d57 cx=c_pps
 a=f6P8eh4LYcQUHlEOLA+94w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=RJn9l5sriXOQfstplqwA:9
X-Proofpoint-GUID: TB3DCOx_ivwQoDdeQPo4_hPh5hK_uVTd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA4NCBTYWx0ZWRfX5B9aWdr1tn2u
 uj1rsj7ESDPGcW7kfWwglypileS77CwDRMlxsGvlZjS1uqmsygyb5TSbEBVO2EqRRyfqjvRoqYv
 k1h9vyowHChWEO7DCKDP6G0ZyRf4djsb/NTWfBG/W8sqbAwFNXXJLvhoZc9clQ32/YNtQlB8djJ
 WwFBY3zh6TuOiF7zANzfNKBae8Jt2gZit7mf1YNsVreDGNIfYRmVjBDGdDFrqR36toUZ7Fr5xdQ
 YwZpOIMSDwN17PI0kXEpv5LKKTXMR6ornWIQsjiwnp30TBuL49I2ggH06QWSeN6bh7WiTXhVvc9
 YbzPNHmA8rrxqVEBc5dvEGP2vv6fUc/+50X4OnAhqP1uX5ixG71dWaE9Ne02HPKABRDe/2sZ+a0
 A5MHlKG81Cu7A+GNS+rercgArqux+rhhESrn2GQguF/poDYdD9q6WLAqHOFhwQoVblmtmRqZ5u+
 F8gsMW1ovPWpuPJZ3Bg==
X-Proofpoint-ORIG-GUID: TB3DCOx_ivwQoDdeQPo4_hPh5hK_uVTd
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,linux.intel.com,realtek.com,kernel.org,vger.kernel.org,opensource.cirrus.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:vkoul@kernel.org,m:lee@kernel.org,m:lgirdwood@gmail.com,m:pierre-louis.bossart@linux.dev,m:yung-chuan.liao@linux.intel.com,m:peter.ujfalusi@linux.intel.com,m:oder_chiou@realtek.com,m:jack.yu@realtek.com,m:shumingf@realtek.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111340-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus4.onmicrosoft.com:dkim,opensource.cirrus.com:from_mime,opensource.cirrus.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,cirrus.com:email,cirrus.com:dkim,vger.kernel.org:from_smtp];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A522E64695D

Now the new wait for SoundWire enumeration helper no longer depends on
unattach_request it is safe to use from probe time. Update the driver
to use the new core helper.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v1.

 sound/soc/sdca/sdca_class.c | 53 ++++---------------------------------
 sound/soc/sdca/sdca_class.h |  3 ---
 2 files changed, 5 insertions(+), 51 deletions(-)

diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index a6a3da8de4371..6937a91ddfb9b 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -38,35 +38,8 @@ static int class_read_prop(struct sdw_slave *sdw)
 	return 0;
 }
 
-static int class_sdw_update_status(struct sdw_slave *sdw, enum sdw_slave_status status)
-{
-	struct sdca_class_drv *drv = dev_get_drvdata(&sdw->dev);
-
-	switch (status) {
-	case SDW_SLAVE_ATTACHED:
-		dev_dbg(drv->dev, "device attach\n");
-
-		drv->attached = true;
-
-		complete(&drv->device_attach);
-		break;
-	case SDW_SLAVE_UNATTACHED:
-		dev_dbg(drv->dev, "device detach\n");
-
-		drv->attached = false;
-
-		reinit_completion(&drv->device_attach);
-		break;
-	default:
-		break;
-	}
-
-	return 0;
-}
-
 static const struct sdw_slave_ops class_sdw_ops = {
 	.read_prop	= class_read_prop,
-	.update_status	= class_sdw_update_status,
 };
 
 static void class_regmap_lock(void *data)
@@ -83,24 +56,6 @@ static void class_regmap_unlock(void *data)
 	mutex_unlock(lock);
 }
 
-static int class_wait_for_attach(struct sdca_class_drv *drv)
-{
-	if (!drv->attached) {
-		unsigned long timeout = msecs_to_jiffies(CLASS_SDW_ATTACH_TIMEOUT_MS);
-		unsigned long time;
-
-		time = wait_for_completion_timeout(&drv->device_attach, timeout);
-		if (!time) {
-			dev_err(drv->dev, "timed out waiting for device re-attach\n");
-			return -ETIMEDOUT;
-		}
-	}
-
-	regcache_cache_only(drv->dev_regmap, false);
-
-	return 0;
-}
-
 static bool class_dev_regmap_volatile(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -151,10 +106,12 @@ static void class_boot_work(struct work_struct *work)
 						  boot_work);
 	int ret;
 
-	ret = class_wait_for_attach(drv);
+	ret = sdw_slave_wait_for_init(drv->sdw, CLASS_SDW_ATTACH_TIMEOUT_MS);
 	if (ret)
 		goto err;
 
+	regcache_cache_only(drv->dev_regmap, false);
+
 	drv->irq_info = sdca_irq_allocate(drv->dev, drv->dev_regmap,
 					  drv->sdw->irq);
 	if (IS_ERR(drv->irq_info))
@@ -206,7 +163,6 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
 	dev_set_drvdata(drv->dev, drv);
 
 	INIT_WORK(&drv->boot_work, class_boot_work);
-	init_completion(&drv->device_attach);
 
 	dev_config->lock_arg = &drv->regmap_lock;
 
@@ -290,10 +246,11 @@ static int class_runtime_resume(struct device *dev)
 	struct sdca_class_drv *drv = dev_get_drvdata(dev);
 	int ret;
 
-	ret = class_wait_for_attach(drv);
+	ret = sdw_slave_wait_for_init(drv->sdw, CLASS_SDW_ATTACH_TIMEOUT_MS);
 	if (ret)
 		goto err;
 
+	regcache_cache_only(drv->dev_regmap, false);
 	regcache_mark_dirty(drv->dev_regmap);
 
 	ret = regcache_sync(drv->dev_regmap);
diff --git a/sound/soc/sdca/sdca_class.h b/sound/soc/sdca/sdca_class.h
index 8b63e62485e64..57f7f8d08f497 100644
--- a/sound/soc/sdca/sdca_class.h
+++ b/sound/soc/sdca/sdca_class.h
@@ -30,9 +30,6 @@ struct sdca_class_drv {
 	/* Serialise function initialisations */
 	struct mutex init_lock;
 	struct work_struct boot_work;
-	struct completion device_attach;
-
-	bool attached;
 };
 
 #endif /* __SDCA_CLASS_H__ */
-- 
2.47.3


