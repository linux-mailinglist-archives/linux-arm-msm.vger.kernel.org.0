Return-Path: <linux-arm-msm+bounces-111012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JlyWH2pGIGqPzwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 17:21:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0C46391AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 17:21:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=Jh1IWgyr;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=Re5THFAe;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111012-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111012-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27E59326708D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 14:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBE03A7D98;
	Wed,  3 Jun 2026 14:45:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC9038C433;
	Wed,  3 Jun 2026 14:45:45 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497946; cv=fail; b=OcqEbteAlxdzKWEDQPjNCKPcqcwdFQZwfZ6NqNgZfrGKBdZFM4J3NzvNsg+SDtnWLJ6JyaFdzaiagI8F8qcsFDW3FzfSBd4roUBlcg6pLKfhtIbTrqB4C9r/w9uCpEIG3gO8joCiHFOQHx3S8/DROtETZfYw604jDFntCeU1btk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497946; c=relaxed/simple;
	bh=YvFTVQHwb2KbLY8xn/wJxK9AxryFNKSJ92Wsj2NzTSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pZw1Hf6VdwSq14nIQVKBYIDPOVIOTbqJ56wnvid3Oo9q81FnFpW/x1sP7X//B75IIB5OvjWuBapRZHTlY8ie1xyAjW9rm9ZMV74Rfj2GMHI6AMM1O8YlcNzGXUNSIN/M7/8Rw7ag2jCcX31vD42gatc2uR0Vk7g9xgEWrqlHJw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Jh1IWgyr; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Re5THFAe; arc=fail smtp.client-ip=67.231.149.25
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653ESsUM1297289;
	Wed, 3 Jun 2026 09:44:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Q5GQtZV1NR0j0aVFwzNka5LvKiFXPEPGQpdmlYuW4/Q=; b=
	Jh1IWgyr5Wdsk7QADTLTt6b3RmPmIqiThyB+gJnGddnB1Mgxq/DJDdbFZTOaWHja
	t6Xt2IEypaZ+P6GQPy6Lp0uUNjzEoofWSmyFIXk6tVQVVwuz302dDZ60ZuR0v+0L
	jpSL8rItpNoFFQvaA52Gwh73mtdPbSw3Deied0iB8FFcwN43U3mq8wLYxaXpInbQ
	ZdVfsDP7Mz+gZskyaXksbXxooB8Xf3jrGtLAKj2S5aUK+N+9mw2EyVZtXK+blTOZ
	HI9mJrLq04ZvjhtOlroDy156Jzz90bKBPGW49n1ztvPHa30zZPhptN6cwUkRaaqt
	pe855bHtEWW9vtdWEzItpg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022103.outbound.protection.outlook.com [40.93.195.103])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4efwa16956-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 03 Jun 2026 09:44:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NFpWYGXDXYYDja2IesLZRkP1gTxl2Dmomaybpwi2WW2MD3joxhcDi1nXIQZa50dcjQwcb82PaSAZDKQrmk3+7OiqWYFFTgspbe1TN+Tp0b847FZ7Z0PcNjzjZ7zElJWTJZmF2jEeSusfZfTLU6haKgPP06p07gJPgBWWY0f9ivwsxRXU8rI/8+aCxpXJ33Ox2ixkEMQzEC/Sh5jV0rDgnjGqwMAEfo8jA8yAbXYjJmf+XCkEDDX+q/Bvrdtb5KegmF3MaUSOdVeIh3Qlct64QIjCZdhKD9MY5ewsC6Z/1S+K32r+CSVRUNIZNWymqd3uWZ4fnY5sJUz9QqzSN11XJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5GQtZV1NR0j0aVFwzNka5LvKiFXPEPGQpdmlYuW4/Q=;
 b=FZYWxvoeo3Q6VGej6lb1SEcTCWcimzh3HKW0Z8IsvLY4sbTAAG9/OozLJQv4O2hwkHR+ZNwiLCktQmIsQpjNKWSxq80AoRRcDKvOX6BbOlH190lWv73H/4fCglPQ1I12R2+v3QGo+iNwmF24iHAPZEjh9PbGn3ekVIDLpq/RhX/5LqiP+PwABhQ81+nlzuerB6QBSuBQynRWYWpQ5Qlog5jJ/uP5WYZmDVUsRDumeIhox58iFHu6ra6Li5iEynTHrXmTj/eDWBrfm6krNN8O/EdZGXfBzsQq/POum5cQ0WZwxMpovV2va6aZ+0DvLRD1YyjycG614pmLjLr17r3Hmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5GQtZV1NR0j0aVFwzNka5LvKiFXPEPGQpdmlYuW4/Q=;
 b=Re5THFAev/w5yM4ouDz/UB0B7vHqrMdJG76S88KzgklfbpNX8D+p2PKq77+z3D19sBIrVZ3hTuB516PJNxVYBgpwty+nuOYrvFUFA9ABoFBYgCh77p3d+5c+ClMGY6ryxTO+9f2UKz0ndrOV3JL6UMvOiM3GyWLDtIPg4MQ0SvA=
Received: from SA0PR11CA0002.namprd11.prod.outlook.com (2603:10b6:806:d3::7)
 by PH0PR19MB4889.namprd19.prod.outlook.com (2603:10b6:510:91::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 14:44:50 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:d3:cafe::76) by SA0PR11CA0002.outlook.office365.com
 (2603:10b6:806:d3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 14:44:50 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Wed, 3 Jun 2026 14:44:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4C022406556;
	Wed,  3 Jun 2026 14:44:48 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0AEAD822542;
	Wed,  3 Jun 2026 14:44:48 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 03/10] mfd: cs42l43: Use new SoundWire enumeration helper
Date: Wed,  3 Jun 2026 15:44:36 +0100
Message-ID: <20260603144443.593230-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260603144443.593230-1-ckeepax@opensource.cirrus.com>
References: <20260603144443.593230-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|PH0PR19MB4889:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8f37fcd7-1a5b-4826-3929-08dec17eaa5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|82310400026|7416014|376014|56012099006|11063799006|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	CWGSf/v3p/dzvzaQNVDKTgYgSJtQ9bhpnnDf+Ih8agYIH42Dv8qUdHalw7ElWNLPMD2DgAa1z75WDWlyca+JsN8PputLEkznHHZbqu0Y2mxypOzURENHOIzU8xKC+NIhjtQjCvclpq0upMseJOkFbw226cU6T76teyqOj+fpI81pUA87FL29pESR9emMGmCDwtnFQ2frM/N9CJdg9MXMN2w8fVxC+8gDcbVrUsathSMrdOUTEiPq+oGRgWNVNtrIF51Wq0z28+nUpa0WTVJrHjDJOdNyGZOaJpV9az0WlKeaAMwAoCy0l81DDS3jpqYuVa1uQcK6QoSTk9rn0aV6YrMGcZUrhPCmD+5fPbADtMOSQVleuu0TREozsjAQ4dcqrDaCbt+IDmMCsekFxevT15yuuRcMdOq6aAsl4vD1MGNvVr5HsHRuSSMcIqxr/4E6x6DMLYqaHTJk6MKgKawJpynflZpSBOh4pD9Akg5FNqQLSHmgCi9ElcUaO8wAiNsoBystE1ijQWCx7wAla0db5p16C9wOOaNZpOqSv5Z69UD+F5oYKX446SjGyuT1cTqCqA6TP1Xg6SnWQkIiIb7NHbN7EpsVqSi/4flJKL1VXgmJMhYr03eAn+QyP8P7hQyR/2jy8eM1cO2IvtKCC0MMyB5OA+40bIg+x2bB6gWfrwrouS/eumsJAPRIv6OqcwkWWISmhqhnNLB4v9s7+0JxTHZIB6N+tt7rwfD0D4WcEd4=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(82310400026)(7416014)(376014)(56012099006)(11063799006)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rA5vWPyz+qisH/KICUN7FGoiSB22cnBqkPdaqiuLHu0fzYAOF9MhK/CNwSGapBf1rMIwCQrgi3ut9LyRjIDVwo8ovcFQcJANPjE+wJgO6eyhNuhMCs68KTcWDgCjNlGoM9fJmpzssPfqb3OkwcosdMV20JYXGMC2PN+PzLEubU1oYSajCOPRbSTlbGCUur3vNBMfFYyMMo0/RRI1klGA5lWUVrBUTeE31dgdNL6JFFkU1crh0/GWALhDusxWol3y7O64oZKwjmuNiBv+/wu5h/LPf8P7JhMElfuzCXNT5XrMoy7BJRgJTJ/xHeEJGmfipMcMRm1GVoXK3MGk9YDVEnxiWeYToOLnPVv2wxfsCRq6AVlr3sJikFTerV/JV2g0PpWU9bEQUc8TcxjO7117vlBm7QpQD8Nyx2ELwKhU17k9Oo17J5LCP+tkADnokRVa
X-Exchange-RoutingPolicyChecked:
	pwzFe4wBMU5MVYOJwJxwm/UpcRNvFO4GdfLxLsaGLVsQe0qEUbqbCtDK1u2w66rzEl6APFmaV9t++rcLKsbxHOLnd6naD0YiT3IVAisNw9AuyBCwV2ydIqDJj/+eULHb0osigvyKe7bHm60m0HxibV6tmH1bihdVFjbh87633HCMcJBTonuwjVHanQMst9wT07W64ogef+0rmFiAHJnLkxm8zJ3eCpvFyGjM9q0J1BdyboNjYUDhgpKtvWu58Dzhz5Y2Q2hJYkbbx/0YlqcNfxcfmwI2AZkgVy/cNthBAxYXGZWoN1quLZvCbpNC61rq+LzeRZcSFXh1bnPBSKzjBw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 14:44:49.8736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f37fcd7-1a5b-4826-3929-08dec17eaa5e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB4889
X-Authority-Analysis: v=2.4 cv=WZ48rUhX c=1 sm=1 tr=0 ts=6a203de5 cx=c_pps
 a=dTL/NSpv458ZJk1fBD1pSQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=pafXaJPY5UDKb7RKIksA:9
X-Proofpoint-GUID: sHZ1na3073mmPd2iiU3dEEcNOqUXHCTz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE0MSBTYWx0ZWRfX+5EHSq7+En28
 y+1/Fu6krBSOsu8gTP2h96Xd+H8Fl6Uv3mQJxer6i8xsjAHZPwKWqX0mEtrXWXGT4uHctk9+BGf
 uq9uax2kGzKfFqHaHQTqpm9qfVD96jjzXG1sQS3PljvnoaKOMA807u3u60mj9U/B/xT6IcOtIx4
 /6EowzbeSuYaLPR7x/4aHRCbPUucoHZ9hGfndabcIEUikk08PdvMhsty12tu8r4WIm58nDh3MCS
 NKlqClKtFukq9laZIQwHbhRNqkxl1OWVFYX05v8E+kKuBmgHtAfIMc2VK0l15pg+3kQwmQ7BjSt
 alxJ+aYyhon2JaG+6unui4Rsvg1z/exHYy0h5nSdbB/8PxkFZ5zqZzVZmjU+EYoz6ygBR0CriSO
 7a+yfyJ7e7YFq7ioTj2wYTeGIl2zAAaMKl2pJK8L28i/esJewn5bx6Cjh40Qjfv7iJS4viUrJkU
 071GU0RcsF+Xt6wb6DQ==
X-Proofpoint-ORIG-GUID: sHZ1na3073mmPd2iiU3dEEcNOqUXHCTz
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,linux.intel.com,realtek.com,kernel.org,vger.kernel.org,opensource.cirrus.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:vkoul@kernel.org,m:lee@kernel.org,m:lgirdwood@gmail.com,m:pierre-louis.bossart@linux.dev,m:yung-chuan.liao@linux.intel.com,m:peter.ujfalusi@linux.intel.com,m:oder_chiou@realtek.com,m:jack.yu@realtek.com,m:shumingf@realtek.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111012-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,cirrus.com:email,cirrus.com:dkim,opensource.cirrus.com:from_mime,opensource.cirrus.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cirrus4.onmicrosoft.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE0C46391AA

Now the new wait for SoundWire enumeration helper no longer depends on
unattach_request it is safe to use from probe time. Update the driver
to use the new core helper.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/mfd/cs42l43-sdw.c   |  3 ---
 drivers/mfd/cs42l43.c       | 15 ++++++---------
 include/linux/mfd/cs42l43.h |  1 -
 3 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/mfd/cs42l43-sdw.c b/drivers/mfd/cs42l43-sdw.c
index 794c983781750..2c890a4315438 100644
--- a/drivers/mfd/cs42l43-sdw.c
+++ b/drivers/mfd/cs42l43-sdw.c
@@ -102,15 +102,12 @@ static int cs42l43_sdw_update_status(struct sdw_slave *sdw, enum sdw_slave_statu
 				CS42L43_INT_STAT_GEN1_MASK);
 
 		cs42l43->attached = true;
-
-		complete(&cs42l43->device_attach);
 		break;
 	case SDW_SLAVE_UNATTACHED:
 		dev_dbg(cs42l43->dev, "Device detach\n");
 
 		cs42l43->attached = false;
 
-		reinit_completion(&cs42l43->device_attach);
 		complete(&cs42l43->device_detach);
 		break;
 	default:
diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index 166881751e698..cb1e175586bd1 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -586,15 +586,13 @@ static int cs42l43_soft_reset(struct cs42l43 *cs42l43)
  */
 static int cs42l43_wait_for_attach(struct cs42l43 *cs42l43)
 {
-	if (!cs42l43->attached) {
-		unsigned long timeout = msecs_to_jiffies(CS42L43_SDW_ATTACH_TIMEOUT_MS);
-		unsigned long time;
+	int ret;
 
-		time = wait_for_completion_timeout(&cs42l43->device_attach, timeout);
-		if (!time) {
-			dev_err(cs42l43->dev, "Timed out waiting for device re-attach\n");
-			return -ETIMEDOUT;
-		}
+	if (cs42l43->sdw) {
+		ret = sdw_slave_wait_for_init(cs42l43->sdw,
+					      CS42L43_SDW_ATTACH_TIMEOUT_MS);
+		if (ret)
+			return ret;
 	}
 
 	regcache_cache_only(cs42l43->regmap, false);
@@ -1120,7 +1118,6 @@ int cs42l43_dev_probe(struct cs42l43 *cs42l43)
 	dev_set_drvdata(cs42l43->dev, cs42l43);
 
 	mutex_init(&cs42l43->pll_lock);
-	init_completion(&cs42l43->device_attach);
 	init_completion(&cs42l43->device_detach);
 	init_completion(&cs42l43->firmware_download);
 	INIT_WORK(&cs42l43->boot_work, cs42l43_boot_work);
diff --git a/include/linux/mfd/cs42l43.h b/include/linux/mfd/cs42l43.h
index ff0f7e365a19f..5f5c043e7cab9 100644
--- a/include/linux/mfd/cs42l43.h
+++ b/include/linux/mfd/cs42l43.h
@@ -86,7 +86,6 @@ struct cs42l43 {
 	struct regmap_irq_chip_data *irq_data;
 
 	struct work_struct boot_work;
-	struct completion device_attach;
 	struct completion device_detach;
 	struct completion firmware_download;
 	int firmware_error;
-- 
2.47.3


