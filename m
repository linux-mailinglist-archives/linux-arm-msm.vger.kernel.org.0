Return-Path: <linux-arm-msm+bounces-111335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mjRoLJmQImoPaQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 11:02:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13169646A80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 11:02:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=jJO4RKY6;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=dUD7H7wA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111335-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111335-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C54D30DE9C6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 08:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55B54A2E28;
	Fri,  5 Jun 2026 08:48:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A8F47D94B;
	Fri,  5 Jun 2026 08:48:57 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780649338; cv=fail; b=BwYHjpG28YPaaVaCkj0V7MaHBnuG2lueaaHOUuE40jNWylikV4zFDvwDcwZFJX+Y9JNXcB3F84cmNU+KcfEn9z1AlmZyVMOwH2/liuplHRg9w4Obw+/EX7hQGz0oDI1sFtFIMsXUM7yklqCSplTPRqHjk7n2inGdjKboxTxFBQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780649338; c=relaxed/simple;
	bh=Yi5IEg5P9ca3JwpPujVTzWWnm1mCDYLFN67OB3hs8w0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UDEHm13PA1zBtavqGGHKB+TYITC8J6BMkOrS6OoB8q3Kymz8IWPtEzUCvowsYPZOsmu79pJCQAdIAJUSSIgyF2O5G+5MPocgbBFuB2PB428TkKfvj+kmLpwtfK7wVdK9f24veIr3IBXkVlPivJe44Srt01CbS4NYK0pzF9TAdRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=jJO4RKY6; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=dUD7H7wA; arc=fail smtp.client-ip=67.231.152.168
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65558R8n2870110;
	Fri, 5 Jun 2026 03:48:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=aVaN7LrSh/iSM+zlS10ggn5XHLrjJYBDb/9p0ztZSUQ=; b=
	jJO4RKY6HgAEt5S4u6gtc1+lnudlAmQzm8dYbG4mXcFH/syBmqRD9T8itN8op/Px
	PG3sBo9sZPIsyu2oEQpPrJ6Err5UgXsCz4pCz2WeIsvIIXmsMdafOy7XDe0Z2bTD
	Z7p2JDEQxENMqs8JOYK9mRR6Iei92KQG5rEothDolB3HivLYrcycVq/X9TDvvE2g
	3YRxf3MdNGhKMXxSrU0n5A+a7AUqqIhhodX3Hlsy2xZmuKGulLqekwSmbkpL/iAx
	M9niCKLMcntxoy5lXk8QyP18UMmlblPQepTtN27u42g5WhSSf0RPKDW+vbOgWvpW
	0drA6pWu/slphiOSllphgA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022119.outbound.protection.outlook.com [40.107.200.119])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ejrbram9p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Jun 2026 03:48:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fuFRJ6dsgCYxW/DfrRh2E9Ij/3EmQloF4rut0YbmPGMnt9r9rZMnVuLfuzk1xvL1A4JMHIoVWubn2jkPqAbQYU8IhgPo/ClY5WGm00h1E1yMHgdb1XcSKYw0NhVE3NewXTvnTZqR8AIYeFTxfAEKPucRrsp66PuCqyXgRFUkSFq/hVIgNu9905ToFyZuPWOLGQVP9TpEqkHz4/vKeb6BR5poSdkfULhji++KGEqrpfqLHpk3t1QR+oiYVNPFQdmaIScbEA0srPtAYWpI6iZYeKoEF3Ba9qjbVkhiDvC0wlcWg+1ml4juZQjh0TnwX24HLpD7QEetiM6HjuqFHg1ZMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVaN7LrSh/iSM+zlS10ggn5XHLrjJYBDb/9p0ztZSUQ=;
 b=GfZt/wMC2bFaAT9diQJjbLKmsvNJJYBqZnyYEwJNCv5oI1LkJ3A+x1rggbldcFwC+JlwZyFa7ihuDaLtR61ugskj1ofgphd4xX0ckphrtMwwXjDycRqrQqY/Pe/dW2I9b4YuBQXjsydprxyrtXDFUDVNE3JvkTTspk/2DvG9OgMM6Lu+eacIWytgnapg6V1mlwIOpv5STPNtcR9GLYw7co+l1hMLWyBwkWmlHq4WibmnWKtldc4P+qTqcCIoKlVIeD5AeYrE1n2+44BPzLcNAWhQzpENn+FERCAFIh3EUWgo7HOTPHZBLCbs8Xokaiad1D2YlAThkBIbjA6dwk2F6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVaN7LrSh/iSM+zlS10ggn5XHLrjJYBDb/9p0ztZSUQ=;
 b=dUD7H7wAtEUCEgv6EySFBNaWKdffI0Zg1awW1iaYz1lb0awXbWnxMQGOBybz6LnAhHjByGJn5QNhPLlTGWS4azznZ0Is9Qmjwse5pda9esq21+a2OwKdLefUW30GTC8cdUb9kE8BeAwLhDtY+jeYpRdm/+98tbRqdZY4NSVad/E=
Received: from PH8P220CA0033.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::11)
 by SJ2PR19MB7413.namprd19.prod.outlook.com (2603:10b6:a03:4d1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 08:48:16 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:510:348:cafe::27) by PH8P220CA0033.outlook.office365.com
 (2603:10b6:510:348::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.9 via Frontend Transport; Fri, 5
 Jun 2026 08:48:16 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Fri, 5 Jun 2026 08:48:15 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3D5B3406557;
	Fri,  5 Jun 2026 08:48:14 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 15180822546;
	Fri,  5 Jun 2026 08:48:14 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 06/10] ASoC: wcd937x: Use new SoundWire enumeration helper
Date: Fri,  5 Jun 2026 09:48:06 +0100
Message-ID: <20260605084810.1575539-7-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|SJ2PR19MB7413:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8e0ec52d-b972-4bc4-8ea1-08dec2df2f57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|61400799027|6133799003|22082099003|18002099003|16102099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	DnzjSoZaM5VBT6kkptNCXxB0TfyDi40dnUEQI5LFqGPxJiCeY05xOUMhPfm2/skuFtSdcLuePnXF+QDKHmbRoKUromRzm+4wARrnbk9ECP32/azO/6hKUIhTb90SSCfvMVRPLZmrtsYvflKJPaYBIexToSwkIreAVHov+9+4/j6NBP+vsrHHuB4WgIBsyRlVMua48EsgO7puSfmffH8vdEhS3z9e2sgSxfYW/K85PbZ8xB3ZQOAFP9gcE8ZF2B7S1+yc50Fu33d5vOfZ5jLnuT1IuxDcQcnptXzlw4x1OqqUJIvpJLc2xpXW6k6uN2/xckQL7dRfBpbMDg+OZyK7405ceILV4213TW7JaPtBQROIWbHHvNHpAC9xa2OPrQOi15Z+qinTa2GGVWz7DixBzLPE8+kiv+mWz5v5TmXm01YIx4FNDI9oQH3gWAdUB3YrRxdFfpdA+5sVYY2tbyE7y7YWK+/zmRw7qrlRIg6GmhNnywiRWE/9eLCjx/ObPsr0PhrSdVGpqHxf48iz8ZjfoHqJge9iM7bu4CytKlRfhC9BfCoJL2hVrp+lbEjDqxhsQsh40ThWF4h57OAjw+7vzOmubu6YgdSmjP3y5ofFNbo4HElNn/ks7NozMnYL+YpTxlAYPjJEYlekkKp+GAeccHrxahjTVMNUUE1yajzyrkjE+rzbgS6brlWQZbZTD56uFKs/Tf4gA2m238CfWYQBa3OBh5fINUhUew8k3meAqKU=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(61400799027)(6133799003)(22082099003)(18002099003)(16102099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0XznSUrvhQByDOjUC4EfxqkTlSZ8wBYvUqgV50r/V1q0xEoAO5ugTl6S7pUlQb6OD9mvMq4qB05MjO5HS+1UUO6r0KEG6BM0VIVV6BUp4SwzXFmpGeBx1Qpmx49Qf0ardDg2O9vhsf1Sez6/Wuz2gpIyj+0LzcqvuYY2wkLT3Jt8e2uyEXCXilveUGlOd9SpAhU1spnsMty4i0FDMdj6dliCf8XNxyuTp/eP7UCTRYoTKVdxP0vgupFh0q2Ayj1qVI8ABfw8YGomR4cdLFLjJK6ap/SnaP5+eCh6CaDbdDFbnoJHNUvepbZN8+0TyUsvh/LWb1nbRU3JKY/B2PsOw7ZJ+ouqmP63PJR6R5+/uqpVg6pPHaKf8HCbZQ/ykJwALRC8MlxDII4EqLtxKXqxvZ+UwWG/XX3WJLylTQUsbuw7EmHL5LA391F3gGRopd8M
X-Exchange-RoutingPolicyChecked:
	Y5C+rG1MrXgNS0gGDbf2yaM7wpDhXpjcFiDW0aAriu8gFcf50wiTUamO7K0o71UhFUD0EIYi38Rl0SvAeA8RSHUVZeDSDKzdPUfDQbMjjp1AYvvNnYhGu0dLVntugHWb+G8ywSPjLKpjqeCitslm6B6BtEuqIj2UqdSx0crWbmbxhaNHWYRYgCK0ja01+LHvtKYv4UZEh9+v5a4FORGmuUkMXgbBsSOp/M5dLXGZX2Agv5YCkKdUN49xaC+WYp/EkrEGsvDb4gVe4K9TbWIcO2F6WG1lpxzasNqd3phkBhpLA2CyLc5dQxSibvTN84GxUoGhE82lNIPr6452/rTedA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 08:48:15.7990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e0ec52d-b972-4bc4-8ea1-08dec2df2f57
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB7413
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA4NCBTYWx0ZWRfX0bnA/ItTsPG7
 pngBexc8Z3ePz9k2etG1RfR5b036bpBGXQrvQb5kcnJY5FnMbuKDUcnxT0WKrLASQWZXr3kp3Wq
 XhoZu4YOg67uu/DcWjuQU4tIg7tBnWLzFKb6jTlf2E/3WxOehvsCUd6Um3iJ+6lpN/04tN2KOcW
 /RjuPngQLxal5XMy7t291/KlNo/shenOBhIYIQoueP6/oAeAjjUThLZnqe6gcSTNN//e/IU642r
 39qzDivnhKN/hil93C7VJmB33Dt1RvWNqtYpLE5U5WMh15sDkOO97LwnI2MOwPfzOdlu/M7+egE
 TUeti8LsGWS/44gBWXXZQZBXoSa30lUl8AwMr+JElDyU8ynMUtUAGxz2AU/BUJG42WjaPqLiU7R
 nwPD3Zu7KSSbWmQ/NNjQV1CRDNxHC9/R6F36g4jZQWBQjRPfIZsbwdzTUl97ANWas6rq/NA7xli
 fmsLYAu1oalc4nZJx8w==
X-Authority-Analysis: v=2.4 cv=TZimcxQh c=1 sm=1 tr=0 ts=6a228d54 cx=c_pps
 a=GEmlRGLg+63oxBMrosuRog==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=Uk30oNBv9cZ-rtdV3UwA:9
X-Proofpoint-GUID: OawhLAvSCSRcitlzw216Y70GLO2kAQqu
X-Proofpoint-ORIG-GUID: OawhLAvSCSRcitlzw216Y70GLO2kAQqu
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
	TAGGED_FROM(0.00)[bounces-111335-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus4.onmicrosoft.com:dkim,opensource.cirrus.com:from_mime,opensource.cirrus.com:mid,cirrus.com:email,cirrus.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 13169646A80

Now the new wait for SoundWire enumeration helper no longer depends on
unattach_request it is safe to use from probe time. Update the driver
to use the new core helper.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v1.

 sound/soc/codecs/wcd937x.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 72a53f95d6887..e0169e783ee96 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2499,18 +2499,13 @@ static int wcd937x_soc_codec_probe(struct snd_soc_component *component)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
-	struct sdw_slave *tx_sdw_dev = wcd937x->tx_sdw_dev;
 	struct device *dev = component->dev;
-	unsigned long time_left;
 	int i, ret;
 	u32 chipid;
 
-	time_left = wait_for_completion_timeout(&tx_sdw_dev->initialization_complete,
-						msecs_to_jiffies(5000));
-	if (!time_left) {
-		dev_err(dev, "soundwire device init timeout\n");
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(wcd937x->tx_sdw_dev, 5000);
+	if (ret)
+		return ret;
 
 	snd_soc_component_init_regmap(component, wcd937x->regmap);
 	ret = pm_runtime_resume_and_get(dev);
-- 
2.47.3


