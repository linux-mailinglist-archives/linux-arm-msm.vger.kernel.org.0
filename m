Return-Path: <linux-arm-msm+bounces-111336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uet/N6KNImpzaAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 10:49:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 80372646920
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 10:49:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=VguNbZiC;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=rqyH8ivg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111336-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111336-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8CA10301E12A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 08:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A174A33E2;
	Fri,  5 Jun 2026 08:48:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C74494A00;
	Fri,  5 Jun 2026 08:48:57 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780649338; cv=fail; b=kjCpKPs3iVAd7elXuJ49amvn/z4MnjTNSAwO03pf1VXT9v8CASSZ31aaONdkN/WIAuhTEiMXNrMahxGS7g9cDHVEWEVn6VESUTruwOuf3k5AyknmIwBWdmm/XJEgNLG23bLw9mmyhni6H1fRJ9ANxcxGzksvrGDkpmjGtV2haj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780649338; c=relaxed/simple;
	bh=KVy7EDe4B1uRYX1ov8iXQTxiyaQ6CzZuYjnX84Ww5BY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nOCt6Eh76FXNuIr2imggyGntpWF45cBEgw1AObuD7yYSeqIIv/MI2ikhgYDo1ktOWXqVNpMEBIPk0fDUdag8mWVQltW4GGOKh3daJqclXDHqgdiOMs5OGKkTmY98UqlS4UF1F6E5P+fleUe5pI3BQKzbjeRa6yYNGNft9uehDy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=VguNbZiC; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=rqyH8ivg; arc=fail smtp.client-ip=67.231.152.168
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6555iB1X3107326;
	Fri, 5 Jun 2026 03:48:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=MTtWJznKgs9gIXuboummiglLGBazl9sN72T7X7RWGYk=; b=
	VguNbZiCaGEp8qhBQ9ML79iUPjK/dv9BLTf7h3jAQip8TntERWMP6PF3dkqMcoGw
	niacP5mSQ249NrmkUjmqrhfz5Pp+2TGw3+whNQ+UxK6T7jruEoGDcV/Ysb3/ioqN
	1VwLUTGOySPl5Db0+AYSoc3nU9NgKSUw0ltoGQSOSPJsm+V9l59Nbm+9sId/B7yY
	rFohK7c3izbu6xT28zbElHxR+qp/l/scs+DmCbnG7ut5wwYwlLdmhtINOWB3niTn
	yY/aq+edOU+64UQacxFLxsDSW2/mKwX+g0u4E6KyqSPwZ41FxfIv4x2KAybEY3K3
	DFpfZBsPauynT+ykk/1zFQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020087.outbound.protection.outlook.com [52.101.46.87])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ejrbram9v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Jun 2026 03:48:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D9QPomgQxUWmnq7ymzCbuYmZWz1q46cygL5FK0VLiBr5eZRPVQ567gc2C2xsf65c1WchRN5p1LPParUaSlIDIllN1i6hH7/WYWU/ghoDRtMyl9FEDV1vb0EGcnInL9w/W1h+yGDScoJ8y2z+BKaEaEodp5YlbbYtdItyGuhplQVTMOZuPw6u81lT+OvgPg8jcQcfoU8Jca0Qmu2kQ9RtiBjuYSvmh7NlGMiVnG7C2Rpltoqu2TQOnNJvOuDKLl9HzU7XxFfkiCb9zQZeXQy2llQQ5/4ZPzmJnDvF+hzuvkrRgA6M1nEBpJFznusOj8wz3X5qds8tPMFWgKbpyvY2cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTtWJznKgs9gIXuboummiglLGBazl9sN72T7X7RWGYk=;
 b=xwJPbZVSL/PItDZqKVhE7DB/YmVf4GZdh79eGoSgQVdpwiBK7VYIsKPT1KDqp0GqQG+0eD3q2xJVmToXihtXBBr0SUhujEMRWrNfBYg9H158lPQBaImXLd9Zkob/jSMO/wopfyjVkvj15YWRo51E89FAUggWM7pSi67+dmTNkLWNPSCnMWJJt1IfpYf3+VkMPSBd+0G7L0ncMMl1Bq9KcIJH6ldNG1zDcjZo3ZVLa4jgJckux+0OF0mviZgFoe7eiXFEYz9mVxMP09EEhW4/bfoK1eWDhvu3gyivy3o6sXqY9ToTLugTzTzr57gQYlwaqSBIVkpqw8x0IK53yE1ZfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTtWJznKgs9gIXuboummiglLGBazl9sN72T7X7RWGYk=;
 b=rqyH8ivggR7IQg5ZTszZLi02DCPM56vWUup5LkTu2byswX5TNV0cUivRwuTMi+9fe+tur3OFCZpdYnG3l9w4CMibGssluhfr1npL8zzxLm2w45DoZE3ceQc9R6e2wCHs2ujUedEwHR5uCo7H+E4to133UmKhgYtyCpI1IymfXlE=
Received: from DS1PR02CA0002.namprd02.prod.outlook.com (2603:10b6:8:452::16)
 by PH7PR19MB6061.namprd19.prod.outlook.com (2603:10b6:510:1dc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 08:48:19 +0000
Received: from DS2PEPF000061C6.namprd02.prod.outlook.com
 (2603:10b6:8:452:cafe::50) by DS1PR02CA0002.outlook.office365.com
 (2603:10b6:8:452::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.9 via Frontend Transport; Fri, 5
 Jun 2026 08:48:18 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF000061C6.mail.protection.outlook.com (10.167.23.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Fri, 5 Jun 2026 08:48:17 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 45016406560;
	Fri,  5 Jun 2026 08:48:14 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0F20C822544;
	Fri,  5 Jun 2026 08:48:14 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 04/10] ASoC: rt5682: Use new SoundWire enumeration helper
Date: Fri,  5 Jun 2026 09:48:04 +0100
Message-ID: <20260605084810.1575539-5-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C6:EE_|PH7PR19MB6061:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1d6cd09d-bb93-4e9d-8068-08dec2df3098
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700016|7416014|82310400026|56012099006|11063799006|6133799003|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oMW5zoYdR4wy3qFb1znRIPodkfD7U7msnE7jOe6hmWtugqa5s9kTroelhC+9m7dJI9OKxuRu30jKNNoLJvGBBBmkhZPN/zV4lfXI3oIYsO2nwY8KX6miOHCe33XGml+nomLXTWB4eAECO4L/SLe/iwSRDSI7r+wztie8le29lT18R6TxtDx5/HjrlkMwtD6a4O+LwW+hMnbzfAAsWI2Tz+kDNZkdpq38MaQLac0P1/cDFsXqZzioFa7nYKyB9PYWFO131YXBKpA+RwnGs5L5OuGkCKN629AmdB5jRJR0Vg2wVbvaiZCq7hi6acNFGwplwADH5fA7yJFzc+zv0WB2WLFGMYFDQbBEx6CEtbsxUIAgu4LyJXT9Y30tEWa2Gd/4qH9aZG/SlIaNafoHw0Om9b4S+1vJDjGDZmx7VLnI31p58dV4UIsfnoVbvXDTuq9TUje/agbmiCr+9IcDhxtxNTpHE8AuwEnQztVeQVkCXWR97kFiS3cjNI5whH8CsiaDdJETUyFT9aYnRmlDQ6p3LPmwlKIBzt5FEyoz8WAgt18uR4iR5HfvEHU2ThX6yfBRo9jL5K5VzWJ+I8sQupP5/ECyrVLXocVp6vRpfzsd5vFwn6lueHNjj2lSZEzrdz6nIMEkTP0TfhsrWx+8Bx6aVgWFcIWdx0vPYnx1/FfpF/0Ci+xyNk3LmAq81+VjT0QyyDGAW4ST4wIXsoO6r0AQL/AefKi41z/nKFF6gIAXTH4=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700016)(7416014)(82310400026)(56012099006)(11063799006)(6133799003)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dWVuphoUkyTA/7ACNFF0x8goCOPd+44HJJOjBEYMSLSAR70Sf2CLPy90zYVrS1vXvmxVRJ4bVgIvG5x/qiZd40M+MLftkoPOemrB45BeiY/p/qNI+fBo69SoxCMCsoPZLItvgAxHTq9zKDPYPdPtB9CsnSy6Dk6Sbav9VGsa1oWZ1Sz8c+AbkrqE0fy5bW0IEKkL2N4EWtdGqKXfviSJ3mTzXQ/pv7f8fo/nzfQ4THeastFzbY7X6cqMlfbY/uLytxlvJFvbW5mSK8UqyG1M6doNA4giJEz6tUcbVn00POJ9oEzREyWNfFxRfJBzw8IPC8FWouLGUKWN79yjJ6C8XUiwLKrXo5OM0HSXduQ01lecufV8iPF/+G2M0Hu6hU7tLK7Z066hM/pf0EDQ/+TUYDwHJXC4ullF/h1BxhrUWUTGHgA/p1ApXoPAna2qrpgV
X-Exchange-RoutingPolicyChecked:
	Fqs9iK7yudShlKu3OwuaHr05VsutSbqAs7HC5h9pq8Rt0ZFdlgebwv2/7N/GtWo/VG94xPHo+phtDot55bDsjf793UyDlrVcle9DkmpG5gR6nQhbqWE2CFf/ib1DoFwq9KBTuLBdRx8+NltaQyyfgUNXX7m+he/l12+x8hf3gLtDSbC2W9gsRUdojNO1uDyjZIyDnlNOTMkRFPhugi7Q65jY5okJK2NP81YHSGpN21/LD7F3MsTt18h+P2TGkemihPPY+Ip/W/JrDYJ1tuAdPyEOhZddPCztf7LLmC8QfLPzIeLKTosWfQL3y+k+1XpmGUQ2EZNcd8AvLa5lVesvDw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 08:48:17.9201
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6cd09d-bb93-4e9d-8068-08dec2df3098
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF000061C6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6061
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA4NCBTYWx0ZWRfX1XrfxMGVEEkB
 QuU85cn+5HZPyytMxjq34tgIO41N2DEOPBKGxK98uFJXqYNp3RcVQuFnMEou6mcmdS/oNg3CrfF
 XHAZnGUy8A+5CSZMT1tbPM4o9nXJyAwvPPCZjhczi+7sFY+MZt512g1S12v5Fo0UlV73VZT60yZ
 Iossl9JSjkCLfEU3eI9qxDTwfGvfUMXkLSBG20QcS8uWmcA4Wtu5vz3gDn8551XvdMNbBdzv12i
 KGiT0T/RjrBHwXAWtkAlqKheEzSRpICpcZKLcYNxjAQx0tSxoz/hVSYdjmcvjTkR9gUXJZFoLRj
 fFPva62PLz97DDAopryzDna0F0ALI41ItPBqYgbukdW05R448t6cdhjWE3HXDr47DiWFy7ptScU
 pDMBJfYRDQjhkmiMJCfS8yQ6pItESWWwNRoaPVyup8dt3PhV8e9hKveGGVqnbaMcsC/sHhmtBZQ
 uY0SsNffvky19M1AfcQ==
X-Authority-Analysis: v=2.4 cv=TZimcxQh c=1 sm=1 tr=0 ts=6a228d56 cx=c_pps
 a=JhSJYUolln7UJVv2rG4jYw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=3l_c3HHteuAAOOvkCYUA:9
X-Proofpoint-GUID: hXv2Rrdz8GhXt8kvvz6m0A1Q6j-zCiQx
X-Proofpoint-ORIG-GUID: hXv2Rrdz8GhXt8kvvz6m0A1Q6j-zCiQx
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
	TAGGED_FROM(0.00)[bounces-111336-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,cirrus4.onmicrosoft.com:dkim,opensource.cirrus.com:from_mime,opensource.cirrus.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 80372646920

Now the new wait for SoundWire enumeration helper no longer depends on
unattach_request it is safe to use from probe time. Update the driver
to use the new core helper.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v1.

 sound/soc/codecs/rt5682.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index d39f8e4f3474c..4b82e07d3b2c7 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2929,20 +2929,14 @@ static int rt5682_probe(struct snd_soc_component *component)
 {
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
-	struct sdw_slave *slave;
-	unsigned long time;
+	int ret;
 
 	rt5682->component = component;
 
 	if (rt5682->is_sdw) {
-		slave = rt5682->slave;
-		time = wait_for_completion_timeout(
-			&slave->initialization_complete,
-			msecs_to_jiffies(RT5682_PROBE_TIMEOUT));
-		if (!time) {
-			dev_err(&slave->dev, "Initialization not complete, timed out\n");
-			return -ETIMEDOUT;
-		}
+		ret = sdw_slave_wait_for_init(rt5682->slave, RT5682_PROBE_TIMEOUT);
+		if (ret)
+			return ret;
 	}
 
 	snd_soc_dapm_disable_pin(dapm, "MICBIAS");
-- 
2.47.3


