Return-Path: <linux-arm-msm+bounces-111019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ECvUNftCIGqlzQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 17:06:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3496B638EF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 17:06:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=NBkV6MyQ;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=BM528ekh;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111019-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111019-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DB60339C50D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 14:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C07481FC0;
	Wed,  3 Jun 2026 14:45:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F086481FA6;
	Wed,  3 Jun 2026 14:45:53 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497955; cv=fail; b=QYxShZSTWhv3vQDi743FhfKZ/kMC7Zh01EXLnlvynW7d26O5CHJu5TzRSV89KSZQEz6ntMxW0RZSurnVsKMXfuJ+gD3EIJ30h+yCwKH5Fp4PtvI8fpReNq5Jr0n7GPzE7VE/HsKKNIAK4CcOwePeDhV7Pcnyk1J32AgsMT3t86o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497955; c=relaxed/simple;
	bh=vBb2gGc6Dj0RRzZmCnJpv53nN79DnrHXFgYILYaCAB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TxMcVdlnD5hT3DUUbOlfLT/EUSNvxr2MplR7UpWp7pBP711Qi3BONhTi0mNB2RoH+GPbx+HToHvViRqlhgTsb+3aAbZ9a0IRMgMPGXz+Q9LwDRFIRDnNLQelqDFizn9xmHNyyA9+8c9KHiTUPQk/pWvQ8WwMq3/lbgf5Mi2xboY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=NBkV6MyQ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=BM528ekh; arc=fail smtp.client-ip=67.231.149.25
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653ESsro1297281;
	Wed, 3 Jun 2026 09:44:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=whopwarGogdFeKx2r6tS1s1Ts7Gbl/EwtMB/bDLJm3g=; b=
	NBkV6MyQfhF/J1N0cNAFv445UwTzAXX/k/HC+tDGtMcRgIB7iOGY1CtETCCMO1a0
	GNvKJzGULs1FG2B82ZUvLWF2J3AiIuDGmqEBVlbD+q+Rl8LSY94Ntnn/FWsgQenk
	xix5w8WURDnQWB27ir8AOLf77kFeQR2jCD1R5yN/hRgeDLw/ehGve9cq5YoA6qNH
	cLH+g4ZcJq+xzDc9w6YOnwDvfXEopoxIlubZfEtCH8JYAylwpZ73yq5KzGnVw+Xx
	WPZD23uJVuVYOtF34VxmIYGyV/8xjmsQl3/VW6KOApDVoZ0B4j/vitT8LTeG3SRu
	+/bjotdtbBEk7okeuuqFMA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021076.outbound.protection.outlook.com [52.101.57.76])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4efwa1695g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 03 Jun 2026 09:44:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IwwxiarFkt3d8CtR9AGp/8v5HMzI06M+cS4z4xCCK/rKJC7ROk51OLbvjLF74rX/sZVP63/HZ0Y1Nkwo3YXlN3rVDHqq1C8hf0S9J1QrYuE1es7C4cmjr29kvlB1Yzz8wf7ra672ZdMpTiVy5tXjIFWxBsoUwJCXXPcNcJpN0LxHHTHUlzzPBoQjzE7lgROMDnhhuhV7JUroLK/YPRnjVvDfmVJ1o7+4a7kGAX+cXLSgXayJwbcF3Drt1kT61YrNvXv2c9EUK3Udid5aMzLrviZ7R5cvDruG9IbDpQAz9XSCklTy510hNDgBBw/NfY+0RD0Y8FyRKhWjuUasuj1akg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whopwarGogdFeKx2r6tS1s1Ts7Gbl/EwtMB/bDLJm3g=;
 b=M58SgoURebTF6gMNBF7bMMRB7yTHID7ekw2HifwHJ1lalLsel0yMFkm+mE1WcRX9qtPGgNYtzozTZCskV6pSBnhmG8YiRJKF/nzuXVcp0hleVQipiR3X0Km3jaM1w1AlkGGXoI70YeamF97oVJOru7Iak4/cWSkxjfeVf8JY6x/kqxs9QTOLUOfiaPXzciozwSqDxwLrp8ATB+3rRDI3iU5AsTFjFbgiqEzVGbuMEJzJ3nR5Rk8Vfcj7lncfg44YDzAqEdBsw9ycxY0PNgfO8cu/dbzBDEUApm1ZFhOb0xY2gpw28YTjIbHpao6yQZB/6xXzT769f94YTdC/YJL3uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=whopwarGogdFeKx2r6tS1s1Ts7Gbl/EwtMB/bDLJm3g=;
 b=BM528ekhvghr9EJIa1U2ysXG2qwge2UV+oVQZZDNB2HNQDhklUpNU77Rfy9b9ZUIQeWXv3Vgd0gbCUZvTSciX0gkG0I0EIyveQvXcBQXM0bHil6Q1vboHBHEPir9YCIVd9JUzvRKr1g/epGrL+u4K1GR/eAe5E2g9mmNMYJ4TS0=
Received: from PH8PR20CA0003.namprd20.prod.outlook.com (2603:10b6:510:23c::16)
 by MW3PR19MB4220.namprd19.prod.outlook.com (2603:10b6:303:45::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 3 Jun
 2026 14:44:53 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:510:23c:cafe::41) by PH8PR20CA0003.outlook.office365.com
 (2603:10b6:510:23c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 14:44:52 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Wed, 3 Jun 2026 14:44:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 59928406560;
	Wed,  3 Jun 2026 14:44:48 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1B7B1822549;
	Wed,  3 Jun 2026 14:44:48 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 08/10] ASoC: wcd939x: Use new SoundWire enumeration helper
Date: Wed,  3 Jun 2026 15:44:41 +0100
Message-ID: <20260603144443.593230-9-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|MW3PR19MB4220:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e6443eb9-9454-4f44-fa73-08dec17eaba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|376014|7416014|22082099003|16102099003|18002099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	laWZ51R6qAmOHkY8iVrTOV6RofGy8RapuQbiZ7NywSQOrfqVst/MhphvHYJfI6s9yjsM7+le110qf1ECL9dSKO0dxFCBgvv0bJm9anPsYj1v0PXruaYy2mb9VgqHd4KnhNF3wSwdqRegUacLO1I8jmF7gOy2iFJaQGOoVJV2ONy3WqCaTvbjSD0QWBDnvT42dxx5PJSIzp0ORPCH+SQ/Vq1oXXYT+J1vaMXgdTPo25vdL2XNMU9GpImnKI0/bD3wZTpf8fIE3aFZ650bIXK7gqIi00Ici1xR9hapnA/DKKf9jV7xJZ8DGuUjPSyCfUjCneVYHx4z5nFd3qLuBbHoi/s8xMV2ICPY0bV5aTaatPoTPUjUEbu8DNJKiQE9VP80+Iq7xEHzrdoxMz4FMBQ8dk+ttOS+aGTHqAhGL1nlch+OsDceSpP5jjDvwJ57NOvRCGXsmMcy3AnogSCXBW7+DYn+Wmvla++QGr3g1ZEpjciQoHU1gwyHFMPHf5rXD7Sf2PIJg/cODnd5HdYcBW9k5yI1ar07WWrPZR/T0RJVlKkCpq0i+EXhIBtiA95mR+58GBHpo0DBycOllXmdb2alEI4KCXNmn20YTvNCMbo6vgeVvxB0fJ8NEcVjnntCiODQVjhAMyO9LufNK0bktODyieq02Bd5ILji0Dv38E9HQ8OvBxmPNGT3c3RoEyRY+9K8bwa7YCjUPIV5vCpQYM3iXYFzTYXefWF6zKgdVTR0+wk=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(376014)(7416014)(22082099003)(16102099003)(18002099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bNkBU3DjPLYxj2blpVdtHibZYHxNRa0fT4nOs6i3KdZVZBM9R/c3Y/bkKAytZMBrO6iCnF/ENq50yFMk0E2Jbjsbd4ZYnoBbSwH0ZDeEhpfBa41E3gIBUkqQJlD7lVstotXPlAY5eTdNAFqMvLRe8EiXIxSRHpJGKEzu1cLksbBjmCvvYfQdresF4viUvYvodGXJnd1r38BAa8Y7g4uHPHzijifBccvbtb9eCMdV3RXAYDYodgnm1/YOI9oNWOV2mzGXeMFCgkj0XDhXRlnhFUq/r853czgQQFOE1ZThH5pCLgfKGs5pcHiHGpNhWEviVpw2ADPPib5PvCt4a2bXT26/OURVoFjzPA2z3yKAhMKQDCGS7k8Q6+pjZ5kQoM5OQ+J/cg6sTko2gxK+UjCkinRDPh/MmQ8d3WQSgjtgFfwGnIJSgMoBWh3Kj+y9DWWx
X-Exchange-RoutingPolicyChecked:
	PMqTSfqReKOC21/t4QMhUwOxAaGaz4VwXUzGQaAj3CJdg0cJd4QTnZIgoIW2DAoq+OMPDijcFZ297mJL8ETi1NZugTem4iWxINEeRSaUikirgnEr2IJ9XtE8sjoh4hxX9vsBnAI9amgekeWwJ1aloQi8VDUi6LnMWAfh+PYCsU8I+4i6Kdx3Tg+2xeU+LO0p1TXIykMObyPyZAKdl/fc4Kt7TM4dMCl8pSKVvQxT433Llar5yUMR534AVY2KxX5B3eCtMI2oUniBBg1QyoFHr+lbaBpGQ2uv8K1UC94pFhWh34blgV9UW5tWn5hTGf4h5ppGsxYE/uoFSbLdJ5/HXw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 14:44:52.0366
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6443eb9-9454-4f44-fa73-08dec17eaba8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR19MB4220
X-Authority-Analysis: v=2.4 cv=WZ48rUhX c=1 sm=1 tr=0 ts=6a203de8 cx=c_pps
 a=A1ZJ2ZpE7ptU6E6UTMl5DA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=jMxjxLXPGdIgYIqNa_0A:9
X-Proofpoint-GUID: LVskp6OhDRjC0K9KEgsDVWPIhQXZ-toQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE0MSBTYWx0ZWRfX/a3CC7uekynw
 4exk+w7VFQtfN+5amT6sfQLeXa0CjgIdTvciFxKPcWFyfU2TtB1Kt4Hby+uASZzTmv+sKmaJ7ur
 zEJQBrwRG8cOXHIN7gFhRrkvTdD8jYD8aRZCV4a8Qju97Hvvf/PXcDQmFVQtppR3F0LFgmLIjrf
 3hs14N8WplzpEXMdogklWKaX0DIaiVZ7YJVdMi6yi2vh33vgSgcDdCkA4FhzK61QFUTQChiCrek
 tG/I6a8Gmr4+r8Fh5A9R3zrM8lc99cPpdP0QPt4RdF2nUMzQiKmsA+uCQLvOG7MlNqPOSIIgpnC
 2Axc15yOy1OZasZV4KzvRmCuQZ2MBZaL4qxvvH107od9UMa8N+JqbKUy2uCP9yot+/i0jX7GKbX
 TI7+t72UtUf1Sr0KLu/AiR5LB+0pnYYqCDonEEEmemuu6UAZl8rulM80col/QUwxnne0N5i5TD9
 O4CLlX+wIZN1ufmTo8g==
X-Proofpoint-ORIG-GUID: LVskp6OhDRjC0K9KEgsDVWPIhQXZ-toQ
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
	TAGGED_FROM(0.00)[bounces-111019-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus.com:email,cirrus.com:dkim,vger.kernel.org:from_smtp,opensource.cirrus.com:from_mime,opensource.cirrus.com:mid,cirrus4.onmicrosoft.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3496B638EF9

Now the new wait for SoundWire enumeration helper no longer depends on
unattach_request it is safe to use from probe time. Update the driver
to use the new core helper.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
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


