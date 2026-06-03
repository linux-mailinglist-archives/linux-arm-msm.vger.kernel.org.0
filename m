Return-Path: <linux-arm-msm+bounces-111017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4/rhHkpBIGpMzQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:59:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B951638DF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:59:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=of1cn47d;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=Movaglfn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111017-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111017-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C6B9431442D8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 14:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C490644DB7F;
	Wed,  3 Jun 2026 14:45:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0D13C768A;
	Wed,  3 Jun 2026 14:45:48 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497949; cv=fail; b=jhYnaaMyCD5B40n4djgk+hAerKJGKjshaS5FvWKAiG1ZAFFYUjf1Zxtg0xgU82dNAmkuu0EUqmhn2vC+sAl+ea+XaXC77cvJ/vFo9gRP0ZG+5H8H1V/MQD4oXGgHVbWcL2Ifidu7M1s06nrUpHbRHT7aGWlkZahY4XEnIArOzSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497949; c=relaxed/simple;
	bh=Rj0mxznCzYKrGYiViYaTCKpBXtiQ9ekyBuda/B+pYzA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eO0wmyNiOyCa4Pd+vPYHdw4jShrYfj4KxUmLOm7Y6Y8zBETWfL8pvfUJTMG1bfUau95CB3BA2s130qiwa+9ViqH0rP8Dea/TyqJvk7XeXbfxxUu/gh1wUTmemb1BH1sStxqSVYGgO7i0sKWqduHfcySkyKIYN9RPH7HcEW9MlpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=of1cn47d; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Movaglfn; arc=fail smtp.client-ip=67.231.152.168
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653EPPuk2840060;
	Wed, 3 Jun 2026 09:44:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=pJDKVlRamYgscMcb
	ArYG9d/lWsw3lm8L6s0zHoSE2B8=; b=of1cn47d8uX1RnPpZBHnANNs/mvVbNVD
	YLW23x7otbP2O9lDvpgRFPKRpJlHHwpaXf0ToAxPvkxtZFJuEP2ZPS0waoVesDNz
	GfgowtVzeeSmMLrAWDfCjy3BwCdM+RJC0T+Ne4D0isqa+NsZ1Y2o1BqOWK41YUhB
	Gz0jqIIgn/YOIfkrMM/yFei7/nePhFd2oOO2gu+kj6JFst/WjmdC7ILMYk+lePJ2
	+C3+Gnzp5DCSRNu04V+hTokVFMKOqDVMjvurmb7w7YvureA9wmD/HyBIP1GL0A5+
	+GqN7P+PBItOvVuLOYCzqG8ON/QJRsvrdPO/JOChC4EgxY7cUIKQEA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022131.outbound.protection.outlook.com [52.101.48.131])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4efvagedga-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 03 Jun 2026 09:44:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ViTiBLrDzg5m7haNySOmoFXUSR2jKm2aAj97yhacrhF1GTQb356CSSXmbmTFyYbOEGfO8MLeD8iXCEK2T7lZPg2RUKRBO+k0Qi7Co37Oxo7/GpbGDw/mKolokCPPeizMrsugWcrUSWsBb/xz1akhB0oSazqJpGd9lha5mTPYfPC0T90KEj42qofnqX8xMn+B/nt6RtLMBhAPcfDcAC2n8LDgx7hkBrbpC43tmKybcM8o70v9MbvtEFXZzRR1LtqRKqDOkLbLYNSeNTxAlE2V08XYvhW6K9i0Bw3IhgbRhtosgLvKSCt2wKv9nFA+4JY7gE2EYlw7oALU3gV2mTlXVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJDKVlRamYgscMcbArYG9d/lWsw3lm8L6s0zHoSE2B8=;
 b=yHNcXyaCuryA7tnZeAbRz4ppjSocbrT6TazL2iuaWne6jHWduQ0dLlNkzlkt/lCQatVTILkvZHrcUrAJ+QUdwS6FdFexXr3H/q0NePXa0Tgir41bnNydRf2WSlm6UI9oettk5Ig+L1NZrni09Pni3bYazJj8qiEycj6++pxHrn3Lgwqy3nEwfhaLuLw6sT3GsJ/5wOcYYtAphJD2IGO59NrN+uoMrmGSuw0dxEQ9cdShnAwchJfk0Fr4gnXuKYn67TDYr/92ksFTPPYXeajMBGR85so/Cz4WwHFei/QLXZB8sAH47m4FSiKsSBRap7OmsNLYsWfWFs6uR1aWO1B1xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJDKVlRamYgscMcbArYG9d/lWsw3lm8L6s0zHoSE2B8=;
 b=MovaglfnH7Zw4XO15lKekLYwO0GfK4txfxTdaaUXLUkXkA8UQKRLoDnFRhs38qfAYu11gH8tg5tEA+toJ4chkFo0QJ8dG08eVWPwpxzVVz5zBZC4X1z1SO6udqpxOmO8yYsuw4DTFCsa87v2ic3U/WtG6jcu9zmB766cpREt4G4=
Received: from DS1P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:451::6) by
 DS4PR19MB9026.namprd19.prod.outlook.com (2603:10b6:8:2a9::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.7; Wed, 3 Jun 2026 14:44:50 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:8:451:cafe::23) by DS1P221CA0001.outlook.office365.com
 (2603:10b6:8:451::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 14:44:50 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Wed, 3 Jun 2026 14:44:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 390E4406540;
	Wed,  3 Jun 2026 14:44:48 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id EFFEE820244;
	Wed,  3 Jun 2026 14:44:47 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 00/10] Expand SoundWire enumeration helper coverage
Date: Wed,  3 Jun 2026 15:44:33 +0100
Message-ID: <20260603144443.593230-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|DS4PR19MB9026:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d1782769-c549-4ca7-7576-08dec17eaa26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|61400799027|36860700016|13003099007|3023799007|18002099003|16102099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ikU6gymW+AIFJRqgmyXUGrUNYi4JPSNp/BJLA9K0I5H/MkMC5dLM4g1wColt4j7NmdPgvHf6CuwLP/zo6mGSX4sq9gEFrR687rmFRLBGQUsLfH7/DyXKwtUkdPNWpUmhSO14ZMa2jtxh5lMy9NTqmniLGaBw4SjLx0/bbXSxbaac0AVbBAamvOHHCBhTF7Sglyz0o1DHa/5MpwgpZ1XTXKRGQGOUa0pdjrq/rETlVbTc4NXDdocXV4UIF/+2hmEG6LzgdG6gHnpfUkvR/OYFEByuIzTGTU2UvztGXW9JDd4N7QJQTCE6mWTezgznLRCvAbZLAKpV3Upnu9GWKxIplAiAH1YbDzyINLWPJU6VWH5897PvaZ3HrOPD8VGuw3DEoIu3NQjFoD5h/0d5ipuTOUy5MhTyjaeOynblhGAnIb4x3Wu0XQhvKrq05LrzbUW9GdRz1PbGsCFQlKeSnpPOxVeTu4ICvA/848SG0EVrFvtWjIiyyIU7jE63lrSkMTiJIbv+1ZsoSWalv2HDkJ0qKI7kVCvqjmoXKLig7mrvGvFGifMv/wxe+Zu1Uhj/iI1g+LFYeUMcH3GJJu9dHAyLH+ndedMYEXG73u0fOi0Qt6rkSqdOcRFCs+IH81qzzKda6O3a+cjjVm32v9Jhy3XBL6ovltwwr7N0OAZ3DPMH9s/hzRVOjsxOQnkQWfyQHu9iNPaFsEkxS/VvgPXkrHsLSPm0ZAKKOcBVnuwJpQCF0lI=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(61400799027)(36860700016)(13003099007)(3023799007)(18002099003)(16102099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QSWzuhKlc3cjZjHnOpbeiD186gwJEJJ3Vb5AFlZh2gs7//BjVWFGCjRrHOqZZPnF5SaD7HXrK+XiL1qNFojEp5z8TXe5mrheT0DBNJGAznl5QNIuSEf0HLz15Hiprbq+HmMM109dG6ozdUVbVIktGLN+6Ebi4gq+7ABWQXD70tnZsGtblLYw6vt+gaOKDW/DWtyL42T8Y2D9pfYt2o9DPzYTcJP3RyDqaWLmEp5+hsbgWmVZHYgnY9VRSdLMqy+H7v6mJaC69caqQTPlLSBc2chya4clIfNP0H1SSVaskqM3kqZ2W/nd8OK8KNt194otNlklB7Kjlk40CGi4PYkvaJ+0LfG9YhSeXadxsb7UfrzRMqnUNVBxN0WKNY1kqvUgt5BHbx57u9qOmnZihu5nyvBjfU51NAej7ABsa34CwNj+Aok1fOthXvln0ro8z4dc
X-Exchange-RoutingPolicyChecked:
	olnojzM1cqQKyulSWLVw3wkBsYygHMXdbCwyHhcvEmCoLA56SsPmSFIlZzRVgzFAPWaRCR6sp3EYHKDLbuZY8vVtC7sLaUcdk6jeqZAk0bh3QcFBJerIVGanON3rc9QurdJkGh4cMqyFWNetScTRFjnWM1IyG+b5e8lEMf2ObxKpnTS2GUm+JjKhaoc2ElUvFswjknigzRn8k6JElI6nBq8S0Xgpnf4cal9RrqLJOS0jnMCOJUEKGi+Evt91biQPjsqOMibzbvk+5/hCK5qJZn28xowuDZUA7RsOOxkxCJq18XLSyMBEcAPHd0GL7dxqX6W0QwPHyNuAlhMvgWFtQA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 14:44:49.4922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1782769-c549-4ca7-7576-08dec17eaa26
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR19MB9026
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE0MSBTYWx0ZWRfX2YFzemRK/l+f
 +O5LhdhXooUob8PCYPt64VH8+jJJ8ORZwZLJHHpPD/U3Kz/WvaZ8De1T+Bg4zAdcqMVHlv4Ln3R
 ine9x9OLFDizV1Cue+uJ2KVXw5d6/VGU/kq8uVQlb1GJp9TU6FHzOvqaQ0Tpgp6kSwWZyPP50v8
 0D9FxTITpbIUbtUAS16qhFX4qcDp2to1gPpUgEe2wjcPkT0fNg/kdD3g2LX95Et6oGnYZOOabfE
 yOevRJ93Pay4yJ1f7RPJjqu5QIBgdiDnQoWf9fDgdh2Gr7EjvDJX9V2EBxMc6kBJLu+49+V2L5G
 ocUI6ViFSSh/6Kc1ysVPmsndTRJ9wSWRQ6428w3+IH9V+klTk5tjP+Kf67eC6af5ulKSe3WUCjG
 b+Egy5/AnudvnJI0naiEQEDQqRHu7tAOcVMsBpIXkLApk5qVfHEDv+t/01C1yd8DID8XZYpdnYd
 JX3bTdsVZPuxSyq08cw==
X-Proofpoint-GUID: 6yMEI5K7LbFHgKLvPVCUlK9jaV3BEOV0
X-Proofpoint-ORIG-GUID: 6yMEI5K7LbFHgKLvPVCUlK9jaV3BEOV0
X-Authority-Analysis: v=2.4 cv=ddywG3Xe c=1 sm=1 tr=0 ts=6a203de7 cx=c_pps
 a=6zwKzwLBI9vfJyHbw/m+Xw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=OrNfY7kRbIrjjhm1VQoA:9
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,linux.intel.com,realtek.com,kernel.org,vger.kernel.org,opensource.cirrus.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:vkoul@kernel.org,m:lee@kernel.org,m:lgirdwood@gmail.com,m:pierre-louis.bossart@linux.dev,m:yung-chuan.liao@linux.intel.com,m:peter.ujfalusi@linux.intel.com,m:oder_chiou@realtek.com,m:jack.yu@realtek.com,m:shumingf@realtek.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111017-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[opensource.cirrus.com:from_mime,opensource.cirrus.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,cirrus.com:dkim,cirrus4.onmicrosoft.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B951638DF5

The patch series in [1] added a new helper to remove common boiler plate
waiting for a device to enumerate on SoundWire, however, many devices
also wait for enumeration during probe. This series updates things to be
suitable such that we can call the same helper at probe time when the
unattach_request is not valid.

There is one final step outstanding which is to add a core helper
that waits for a device to drop off the bus. This is not include
in this series and should be the last step of this process.

Thanks,
Charles

[1] https://lore.kernel.org/linux-sound/20260512103022.1154645-1-ckeepax@opensource.cirrus.com/

Charles Keepax (10):
  soundwire: Always wait for initialisation of unattached devices
  ASoC: wsa881x: Use new SoundWire enumeration helper
  mfd: cs42l43: Use new SoundWire enumeration helper
  ASoC: rt5682: Use new SoundWire enumeration helper
  ASoC: pm4125: Use new SoundWire enumeration helper
  ASoC: wcd937x: Use new SoundWire enumeration helper
  ASoC: wcd938x: Use new SoundWire enumeration helper
  ASoC: wcd939x: Use new SoundWire enumeration helper
  ASoC: SDCA: Use new SoundWire enumeration helper
  ASoC: cs35l56: Remove unnecessary conditionals waiting for enumeration

 drivers/mfd/cs42l43-sdw.c      |  3 --
 drivers/mfd/cs42l43.c          | 15 ++++------
 drivers/soundwire/bus.c        |  3 --
 include/linux/mfd/cs42l43.h    |  1 -
 sound/soc/codecs/cs35l56-sdw.c | 47 +++++++-----------------------
 sound/soc/codecs/cs35l56.h     |  1 -
 sound/soc/codecs/pm4125.c      | 11 ++-----
 sound/soc/codecs/rt5682.c      | 14 +++------
 sound/soc/codecs/wcd937x.c     | 11 ++-----
 sound/soc/codecs/wcd938x.c     | 11 ++-----
 sound/soc/codecs/wcd939x.c     | 11 ++-----
 sound/soc/codecs/wsa881x.c     | 10 +++----
 sound/soc/sdca/sdca_class.c    | 53 ++++------------------------------
 sound/soc/sdca/sdca_class.h    |  3 --
 14 files changed, 41 insertions(+), 153 deletions(-)

-- 
2.47.3


