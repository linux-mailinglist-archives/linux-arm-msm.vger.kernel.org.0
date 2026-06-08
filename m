Return-Path: <linux-arm-msm+bounces-111823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mgVtEqibJmqyZgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:38:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACED4655325
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:38:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=KwUEk84U;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=HbFXXW9P;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111823-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111823-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF79130598DB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 10:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C4203BF68D;
	Mon,  8 Jun 2026 10:28:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1923A3BED2B;
	Mon,  8 Jun 2026 10:28:43 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914528; cv=fail; b=YHgqmEQUKn2xtV+z30Mk+AN6RDIDXe5EEYiniW/mNfOBoLc9x4ybJZ9/2Lns390PP1QTfrUwGgu+5ztWQ4H/CSzktw718+wtleKwLJwlgua4sGiNx7SGTM/MttFUJMuCK4sgGmg44cj7T1X1PdjwYOFQp5xiui5a9sulFwcVt8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914528; c=relaxed/simple;
	bh=qbKfgjXwhulXPgIax8jfrdU7anU3ehShxFie34KlUFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PxZcxi0P7e7wMJ42SvmHDS9cC1gl9epHd5H0kOoK6k3ur+DBBb4Cxqmo6vZO26ziPJriwe5pEWV3cXRkwSQHM3sYbEStx2vl6mbn5DdKmKnophnZR9oYD75mlUaYz6iU/XJlKkVxKlID5IX/0n/MOEAG9kVnn+PlNve7MT3q/0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=KwUEk84U; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=HbFXXW9P; arc=fail smtp.client-ip=67.231.149.25
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6584jQEX3653579;
	Mon, 8 Jun 2026 05:27:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=gLlzOlnjtc0iPrDyjT+SHiGCqIkL/TaVr16xqIiIfS8=; b=
	KwUEk84UAsSMMN5mPq72ycGthAS/09hgcl9y1/LV0NmVq8Y2/2I7IQ9M8DNPRe33
	dJHBdhfC6heNl9ly6dZBgYs+xXYte21UXl9pm0KYkq2c/EWgi8Nfdo+icA77SuAf
	I+RinDU++IfXpqkh1rPT+Rmxup92+ynllSgpjLl+xk2/u58r6i7nq9/D7IsD9lvc
	R1bAhQH12T8Ezb8rRQO1D1XPCyChChKm2wC+LVJ3O0waDpuO5Bw8lituywtXRHWy
	ARurWJ8r3gvnhKt2jjMXqyuwle9FleC6i2RwENSQa420QXt9RfwhN5DQ5qF1AZco
	nw86gOb8PjvXrDWu8Pc0YQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020107.outbound.protection.outlook.com [52.101.61.107])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4emgy0a8q8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 05:27:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imuKtrCcsAHlPVV0iYLmC6pNfiVFgSbY2iRKsSZVV5PpcPsStIPRvLofhbwbQJsCIh6ur4EpMhOrW2MnnlRk8dB59X1ql4vc9VYvoy8kcmirX0H4EMPjXTwrQQ4QxuMjczSXOaxAxSmqXE0Unu/NwsgsO0PEzpANh1HfpicSrsCwVE527/dTH++DPnej5O6/tYVgOJ34AS75y9I009JEo21WaJS4NZpr1fDLhRITxaCWiyxJtINzY5JlrmVorMvgdNkYidy5A0Z4qcsvsv21Tn7IVQF0OqdXZB/1Y+OVIJbxseqKi+vYYrGZckkblWJzFVbWiHeaXwp1Z67o3r46JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLlzOlnjtc0iPrDyjT+SHiGCqIkL/TaVr16xqIiIfS8=;
 b=NjrbFyRZdYI+n6R7h68T8q3aOVsoD6PbNXhRryBCgzoTeA3MmwlhjFDcKPSp8YkxSln/Jsa1UpS/Yyd/4VMm70Ad2MG/exg4geE37JhVxsCTdFk8d0bDA4jrNg0VxsKR9KkPPKuBtJvXPLueSesIBtsv0b3pPFWjcooN2wZ4d3NdhjAR5Txn3bGGJcJN3vX2OpyxdEbHDZzmre/ocW+mOjE2qeEfMYBh3zPV/ba6UOYibuCM2b0exa4UNm61sI9PV8tcyg5q0CJixX/PlUjCcB87XyJVYiQOLUxud0cOkhicMgNvEpALWPFEOosXzxKMp5ae8Ba07Z0JDVhI6OvDJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLlzOlnjtc0iPrDyjT+SHiGCqIkL/TaVr16xqIiIfS8=;
 b=HbFXXW9PNwH7dTTfFZbMhqfPix1fryJ0M0QPtE63LhsWH/IDfo+XhQIBTpRITSleLTRj7/aDszOl22SiHOTSaFnU7C/Q5C0eKKPXWS4GxhA5Z4M5dfo2nARbcmrVJ6AKybKNRGA1DIES2GM/MBbSYSes9tPK7L9qpAAz8f32LRQ=
Received: from SJ0PR13CA0240.namprd13.prod.outlook.com (2603:10b6:a03:2c1::35)
 by DS4PPF0ABD8BC9D.namprd19.prod.outlook.com (2603:10b6:f:fc00::a09) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 10:27:23 +0000
Received: from SJ5PEPF00000207.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::8e) by SJ0PR13CA0240.outlook.office365.com
 (2603:10b6:a03:2c1::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.9 via Frontend Transport; Mon, 8
 Jun 2026 10:27:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF00000207.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Mon, 8 Jun 2026 10:27:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1422A406561;
	Mon,  8 Jun 2026 10:27:18 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id EDD05822548;
	Mon,  8 Jun 2026 10:27:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 08/10] ASoC: wcd939x: Use new SoundWire enumeration helper
Date: Mon,  8 Jun 2026 11:27:12 +0100
Message-ID: <20260608102714.2503120-9-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000207:EE_|DS4PPF0ABD8BC9D:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ddeeaf5b-1faa-4301-38b9-08dec548873f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|376014|82310400026|7416014|56012099006|11063799006|6133799003|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5B3/FmDbhV1S+vc5fxLBOxd6avJn4RozY+sVSCSoIK6+tibKoorQfkkiVpjOVk3zv1qgJ+SvONlqkFX3LJugY2LhB0mQuzb5Vl9j0Ajca02rvNUby35CPMtZvcW4aMXlgXGKXVq6Ywhpo6aJdRyUGsHIjdxvJVid99sQkMgne1+UjYTksHZFErH4BbzEQpD538Ia8o9Anq32Zj04KBqJDDiWGVR0CG4kKggVALtGLgUfdd38DnNdYakWYoKx3lzudo+XqKY7lRxTB/ZsY/mwQlGJYGXkZe+fPjBOqVyFilqlCsU5IqSRZRqsxcxax+iJGQhNXGZJZKnIgkpUoFjBYPZv8+0YLx514a9/lMsr+Ar/1xZSSno/upYN2x5AigZBxsKOh0pAbUZHJk3f5iTdE8B/ZcPqVAXCV5iauFa3/0nb92vqRuoDGEwc19NFAHmfFP91a2XP2GRXGA8wIOescOlOGdbZjVu7Bpkvb2ON19jAVP1sC5SoVdB6tba+yqcyhVB2AjL3lQtVgNP65KunceBsbxjT/rTPkeL0zxNkG2bzCtdRKsW5Ofm76vhSPkOnGATK/Hj4eLdJjMefJwljEG2P1awCcyMbGboNR+QhtC+x5aerSg59S51XpX9pb7gGJ9ColFnotbnRKF/CaDhJsgf+skmoPjtO4VNRWpoKs6Kw2kHP99ZROfHnlsTKeIDXlH/a2RjaMZLseMmfKF7Gxi2FB/RJtn/v42HW3JA2v6Y=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(376014)(82310400026)(7416014)(56012099006)(11063799006)(6133799003)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Kmyi0fyy+OA3aaMJTKB03G8XI52zYP+K9ZrcElzDduqK4FKxB4ti6PDtU4RXk0GknmiL7GSvlk+s2f0+31RAz2dizfvZQiR9x2Jp2laDrS+HuW5+OAWohrXq6DiGzhH4AtjMbYA2LS83C4JlvslQ7HtQBsM75izfsWOL5HP/Du7iXLMqPmEUSqRdTrY39n6dxG6gr23a620WRmE1w+PaWIXknQHWHbTK3CQxNH/kssuRsWlr1h7GSlGP2+dvHyn7zWD5+cDKYO2Gubgffkd6gTnEpWGIo+dVE/yViPq3vIVpHxvuBC/vTMjpgfvJZ173yL0TqzjQ/6F6Auhv5KobjUtAfAQb1hH68YJFz3Wz4GwU80/oUO2eaSATFIirhTgzOUF/j6i26g+AZO7p+XeE3YBvT6nOujkiiawqzCQH9CpV89t5YvObnLLdAfTw6aIi
X-Exchange-RoutingPolicyChecked:
	E5V1J/HoifMlSlZe0sT84QpTgaZfO3NM+GrsAXKvyZG8MGIFzNjDoefjiKH0urfVSLPN0iuPgp5/ksDWSLNJzJYosJ9DYJXpQ0fgL6DYYnkL0TaAMP9qzvpSYfakaBKbWo+wG8Cc7jhdFHnvlWqKfgh6wtaUiGj2bIfcP5GRapBDfcjGMjMq38hlmpGTIl2Eh3Ms0r4CGtCCCv2FpEGCk6rFqYAcr7KRZJM/D7o678BQkCYaN1ysAJV0VUsoqQ0g04R8nqTU6MDR3kzPX5e9EMoSkuuxO1khG/9+ZUQmghBe6MPQ6VfDis/FYv97tSVKDFlMPx14pMceKdhIrsrJhQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 10:27:22.7283
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddeeaf5b-1faa-4301-38b9-08dec548873f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF00000207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF0ABD8BC9D
X-Authority-Analysis: v=2.4 cv=GP441ONK c=1 sm=1 tr=0 ts=6a26990f cx=c_pps
 a=5R/USArCWZnskgXodYG4KA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=EUspDBNiAAAA:8 a=w1d2syhTAAAA:8 a=jMxjxLXPGdIgYIqNa_0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5NyBTYWx0ZWRfXxWsmTUVvsNK9
 HxI6X03153JUIRzaHRPL22lItFCzjxKJQzXJtdxrAtaCQlbbzkOB0rO6R+QuP6i52a2o2XvLm9P
 nFghIy8NksMvnGXyBnuY3o6BWnU2EAHecHFOp85++2evIxQfYUYEDKHTxRhwR0FFQOOXByLRO2W
 AYlrPi+5lw2rZXBAndf693rC4Sigw+9hhWWuvoPAVF3Jak6Q1ML7AOcMdAhgSfopPd+ZcvlNXkK
 +EclCMe9OrnvRquoFalSHiB8gQeI5at1oBlILwf41vyYwJD7pHlq3nGWdNpUCHmymsFPFNNCpMN
 NOuciUmFsKH+z9ceyMJXySxsPnYQG+6b4bvfmBf+JCxKRPyt+HecQ6igv4ut10EnMC2gFZaZ1kP
 lwZh2xm2WRVmq9OPpxEuIoHyrqMAY5mBL3+IM8EtArw7K8D7F5Heo6e+yn5SlqxktvTHk1EFYmj
 8B+P/ShdDclOhCfAqrg==
X-Proofpoint-ORIG-GUID: gnOK4YTWRpWeA1uFDqlADWr8aIbhDpUb
X-Proofpoint-GUID: gnOK4YTWRpWeA1uFDqlADWr8aIbhDpUb
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,linux.intel.com,realtek.com,kernel.org,vger.kernel.org,opensource.cirrus.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:vkoul@kernel.org,m:lee@kernel.org,m:lgirdwood@gmail.com,m:pierre-louis.bossart@linux.dev,m:yung-chuan.liao@linux.intel.com,m:peter.ujfalusi@linux.intel.com,m:oder_chiou@realtek.com,m:jack.yu@realtek.com,m:shumingf@realtek.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111823-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,opensource.cirrus.com:from_mime,opensource.cirrus.com:mid,vger.kernel.org:from_smtp,cirrus4.onmicrosoft.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,cirrus.com:email,cirrus.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ACED4655325

Now the new wait for SoundWire enumeration helper no longer depends on
unattach_request it is safe to use from probe time. Update the driver
to use the new core helper.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v2.

 sound/soc/codecs/wcd939x.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 01f1a08f48e65..010d124667224 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -2968,17 +2968,12 @@ static int wcd939x_irq_init(struct wcd939x_priv *wcd, struct device *dev)
 static int wcd939x_soc_codec_probe(struct snd_soc_component *component)
 {
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
-	struct sdw_slave *tx_sdw_dev = wcd939x->tx_sdw_dev;
 	struct device *dev = component->dev;
-	unsigned long time_left;
 	int ret, i;
 
-	time_left = wait_for_completion_timeout(&tx_sdw_dev->initialization_complete,
-						msecs_to_jiffies(2000));
-	if (!time_left) {
-		dev_err(dev, "soundwire device init timeout\n");
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(wcd939x->tx_sdw_dev, 2000);
+	if (ret)
+		return ret;
 
 	snd_soc_component_init_regmap(component, wcd939x->regmap);
 
-- 
2.47.3


