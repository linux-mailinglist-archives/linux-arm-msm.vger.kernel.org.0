Return-Path: <linux-arm-msm+bounces-116697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6j3FDsNzS2rARgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:22:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8188F70E8C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:22:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=PZd8o5c1;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=fonrLnF7;
	dmarc=pass (policy=reject) header.from=cirrus.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116697-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116697-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FBD531574B7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F5F42B75F;
	Mon,  6 Jul 2026 08:52:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B283C455F;
	Mon,  6 Jul 2026 08:52:42 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327970; cv=fail; b=tueE1COUVV2VKJmtsTiQKVXw4ivKtYz7qrzX/heA4droNBhCS1QwxpNnG0ltcuSnzmrYAfn/HmWgh5F/l5OV8y0qwDkYVxceW/ei499NzjfjBrMH85ZH2bNzD6GVK1d1OOqnFGqFBGgF57L423rJUtgbgro8RLiaypcHGUhatzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327970; c=relaxed/simple;
	bh=PwnscXtb29icWq5z7Eyq0SLpQ2HakQFAgGNUIPRP3bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=juaTwEbnUOhxWydycWY6cIL0Mj5RY+vOnKLgwOKLoh/IZQBr3kaxnpThIgpIQyr+2qbZi/CifHeOyQo0qgqKODc6HmA8hix2ktLLRW6S+ae/0HomJBn033PZIT1BPdAQx6WB6THfOWFwX5kl51ZK2qfROD6ffzMVpDQ7pGVAnjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=PZd8o5c1; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=fonrLnF7; arc=fail smtp.client-ip=67.231.152.168
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6664tcJq949871;
	Mon, 6 Jul 2026 03:52:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=eXK0ETyfrprdQTTUNh
	hXEvUYj57quDUixsvxrbVk/58=; b=PZd8o5c1BxxXyEzeMsjmnCUNJT9Y4PI0BS
	HO1mIYP3r4+ms5utU4s+yv+wNk8MTTqnyifOl95+zhu855UQg84TDX2FcAS5S2Yg
	B423TDJcZ08SN5f1AIsRs0iu3S5x3Q1tbfj5fD4/CCgrZ2k4yLwNALjn/KAhTNje
	15CDkjMF6y3+ikcYJ/07NemX9Hf/zOCcWWB8spSi6sgohnnxh3MSsK8t/+vENTE9
	/oWIN+zQyZjvaKKsd1+AGUm3uYiRwA0yhuGJJRAAcZzL4enLorq8MjPHBpuayxXo
	gcuDf6SWfH5sNRVBPAzSeXo6MxX99dbnUmM1x4QYD/8EyeZUddVQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020127.outbound.protection.outlook.com [40.93.198.127])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f6xkjj2qj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 03:52:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MJ0T4pPJZp3TgADJwBtiJIt4/2Ci3QlqZ4yXClRaJubgcthkGLr6w149GRNuSSpdGEP05VNwX8+FnflBASAEJzerHR28ap8WoH1PUanRhnL1qzqZTz+V1FHGFNb+0CZXvVuvhJBWw6BRIOagxPJ0fz0rdrnxtc/cdDRZaUm0sJvmOhY5a/+HkRKrkq6vS/07TYVc7SGT4KZpX5wZrUsb7jw6QktiWdTNy3vgZ6J5Eve4B5kipWHd/kb07U1HaKYjTqu2DnSPC53ZaHXzQIWVsLRK/A0gqZXAF6YQ0FlTZB8qBiCQH+bFy4G3qEWsbbU10MTJhUco5wNyqEISpBXmGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXK0ETyfrprdQTTUNhhXEvUYj57quDUixsvxrbVk/58=;
 b=IZYlWd57VKmzezgzbweDOD6FVvikp73icPq0gM1ouGXb5oBLG/OweZ29qbSukwjziCUo08oR0S0qdL08X3G4biP78RI0L2pb5n1GQsZhP7ZPYe4/qXQXSlZEqHf6eeQwRmLs6s1R6cJqp6NJoiuDShTvFeIQkQ9RDW//XiEjRH5vvJdfSWuvU6JnL/BbqF2KDvwQwZQAsz9jIES72d27qD+83SgCBzwSIS94DOqvQx2yjjho9oZMSUGKdWaKS6Tdl70Aet041Qhk041HpIrVXDCOxLj2MRRjRizYTPmsd5H02kATz+sexj6akpBFfXb0fZyqxGPdo88g6YYl88oxjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXK0ETyfrprdQTTUNhhXEvUYj57quDUixsvxrbVk/58=;
 b=fonrLnF78/6+QWap71Xm8dBYfHcjGYTJzV+F89LNBTKBypCTDpAwNT27ObUdAIz9EwigyoBAuQEusulX3z+MkygUmsN6zgnT8bth+G5ErBLC3+6ZZ0kx98f4Odvi+UgBqxGeyMJvx3OVncbHgbyAe1beLqjHKfefAKG7EFqPmKQ=
Received: from CH0PR03CA0198.namprd03.prod.outlook.com (2603:10b6:610:e4::23)
 by SJ0PR19MB5637.namprd19.prod.outlook.com (2603:10b6:a03:42c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 08:52:19 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::9a) by CH0PR03CA0198.outlook.office365.com
 (2603:10b6:610:e4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 08:52:18 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Mon, 6 Jul 2026 08:52:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9B311406563;
	Mon,  6 Jul 2026 08:52:16 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7FEEE820244;
	Mon,  6 Jul 2026 08:52:16 +0000 (UTC)
Date: Mon, 6 Jul 2026 09:52:15 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: david@ixit.cz
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC 5/6] ASoC: cs35l36: Implement set_tdm_slot to program
 RX slot register
Message-ID: <aktsvw1IrM7ctTxg@opensource.cirrus.com>
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-5-3b66f33859f1@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-pixel3-audio-v1-5-3b66f33859f1@ixit.cz>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|SJ0PR19MB5637:EE_
X-MS-Office365-Filtering-Correlation-Id: c3fecb31-617d-4c59-d57d-08dedb3be2a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|82310400026|23010399003|61400799027|376014|4143699003|6133799003|11063799006|56012099006|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Nku98jflGM2t/1arZ/hc2JcBr0vtQkfHbMdRxU3M6QtnIEo1TP6Ccwz+uO1mJSvvMh/oft7p7xSyFgu0XmFRVI2rmhhUeSyg0H8hCHINMKUOgf4DDxWKRKu8JIOZkA+ilCyIr1s1yo41c4mEIht3Cxx1tViH+ENP+nRtfyQL6yUh308beHGQKfcLwfAhkDNOLOZoaObVw37oYmsmdDbPItB9BV/c/kxQ2J+pikkThN8yaQMPBs7fLlv7bFGk0XJMYO+Hm/0PhOwtEotgFfkWbrpGtOagX8XLUBzzwR/uElDTzJDb7LePpdoEKIwIVCOU74CJv3e2nonmk4gIJr89ovD8EbTssVUTXiuKpcAvTb30Pm5wa/QuCBGLVqgAWvF+qDD84Fi1bxdmpbSABx402TllsuPSa0QQCQoxrPYNMCC525QS22osdFCSd72wZc7CuU0ugVCeCiCJat8FPL7D+ydTBRvkOE22rm06zsD9r5/EobKsL3g+/LOSxRYkSGITaqi40vjIitlxFyCJriL5yDKZSWj9+mr/wBYgcymfWm9nR8e9ci73E6CBUjGT7hWVF6hZdLCWp3RIVQCj/ecPg4ea0uLQSGLbvDjDHFNhWENP1qVJjAFCxd3sRRcVgfO8ylFkdKwM5hVVfUbfYmzLhEshB0u/vP9efjZGWljJUUYf++zCm9745Sa6gaG2xEyBFUyXMyJ8WkrO+191KKoq+w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(82310400026)(23010399003)(61400799027)(376014)(4143699003)(6133799003)(11063799006)(56012099006)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vPROVv/KrNTNANaJgU8hMTFTtCHuc5Sx37f11oFCEmKsncFO0t29qZuIZ8b4EHHLkqnymXIT6z6KJsV4ItOacgcsKailLBi7MvFax7kB/HZ2fOKy9hjQcnmpuydTICD6XY3XAJyHojlXbiUmB8Dzc18iWdqT83VUB9TGrrwX0TCwzvBEeVeTNPEmUtO2N5TB78SaMOrX22ZptmF+U60rZ+h8G66PwRmTFxwwKsBnriNfhrRIPyB9kirGls5HoeMie58g7FSbhxKsb4IzbN0dNyN8iM+2qYNG+pA827GNg+4VmwSuS3sgtHJarf/+uHywAM+dreWPA/Aktd/yUzWYQADCw+56hKXb2GBs8cin4CDlPWf8kepEB9aJbs8d6Avegcn3yT0JhUVfKS+AhVYzsuXL+eQD/c5hbcUYGq/WXzC+DlYW+jXSNADS2fPPeE/M
X-Exchange-RoutingPolicyChecked:
	YUaE3hCAXuhJ/UReZiQToHpJ15OSn5iO8g3g5kiIcHnBqxFa6xEPWfRpVz3c1fTOrS1ijzxK6G9oNuuJTkOW9bQWPCpe3nYNyRHwsEO7SnNlz5GaoE+iTLSs2bW+o9i4FriOWtexA3E7THbchMQ9YPJm9Qg5XW6w5Z9Y8je88zlSpQfdWtTFqJIeinmt0OY98HR4cQHC0qBi+pIIgeXD3iFLw8aarhulkfXS7qTMeRguYqFCbn6Rq6KUE4JbPsr2owLIMAcdS3fmm+XZiBWlJ69jD1pocozOMCGx7c6uIFMzIZrKugFXKgNuB9EhGs846TilARXnXWKxVXJ1TuD0Kw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 08:52:18.2772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3fecb31-617d-4c59-d57d-08dedb3be2a3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB5637
X-Proofpoint-ORIG-GUID: EkLSjHqv6HhgdJGBfZsdeebmbtaKDOBm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfX1toPjkbwYLjj
 E4PmKnpGSYVbMhJZe3WkyPL1V9PdwK93kFUc/ot0Vp7PBlo0MjxaSi46ru3TxXURjUz/jmbunFh
 7UjHNc8H0q1i64g00AKSPW8+0KbJYKc=
X-Authority-Analysis: v=2.4 cv=YYiNIQRf c=1 sm=1 tr=0 ts=6a4b6cc9 cx=c_pps
 a=eXjbGYYLs/cxvPp3erIRkw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=0b0nSneRd8pUPuhsaU8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfXxeWAjUXwnuva
 Idu7TNwCfDUKRUFXX4C5vEco4X9BCzj9Q1cfzGvA9arn3q6PcaLVTlGgsTPQua68gm87nu8it2F
 DU0TSASrwCcbbwJeZvvqMWjdbHykw3Lt9T/pUFkDCAIwyvJdyPLVNjPqNC0OiMnpD5q5sFJvnpl
 qlwPhFi/z/xsTzYB9YpbXmq4yGj0BVGSVGtMDZo9QQB3WFBlxtj8ubCg5F68JAPoByDhiZXWfXS
 Xpy1lWzgjhVk28EKvpaMQrjVvU5EOXEYZMHGX2x7vwH1HcuZmaUtRJ2qkXTjFJmMboNWwUToQtQ
 BNrJ1slekZsRebwE5pxKRgojHBoK0WBJGgIPx+Fln2XsEhBKq1muahIQjvIGOXdCIuf0we9tMva
 VRnN0KiCg8brwMlqTuejj/WyCLbhR4pEjRZ1wTG9Hj4aIIw1psCzqvMkc+A4uDE3kXziUGMtPqE
 83JFEgby5RKhdsp3UbA==
X-Proofpoint-GUID: EkLSjHqv6HhgdJGBfZsdeebmbtaKDOBm
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-116697-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:drhodes@opensource.cirrus.com,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,m:devicetree@vger.kernel.org,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,cirrus.com,opensource.cirrus.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[opensource.cirrus.com:mid,opensource.cirrus.com:from_mime,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,cirrus4.onmicrosoft.com:dkim,ixit.cz:email,cirrus.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8188F70E8C9

On Sun, Jul 05, 2026 at 10:06:55PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Program ASP_RX1_SLOT with the first set bit of rx_mask so the
> amplifier listens on the correct TDM slot when configured by
> machine drivers.
> 
> Assisted-by: Claude:claude-4.6-opus
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> +static int cs35l36_set_tdm_slot(struct snd_soc_dai *dai,
> +				    unsigned int tx_mask, unsigned int rx_mask,
> +				    int slots, int slot_width)
> +{
> +	struct cs35l36_private *cs35l36 =
> +			snd_soc_component_get_drvdata(dai->component);
> +
> +	if (rx_mask)
> +		regmap_update_bits(cs35l36->regmap, CS35L36_ASP_RX1_SLOT,
> +				   CS35L36_ASP_RX1_SLOT_MASK,
> +				   ffs(rx_mask) - 1);

It is more normal for the masks to specify the slot number rather
than the bit number, it would probably be nicer to stick with
that convention even though it will complicate the code here a
little.

Thanks,
Charles

