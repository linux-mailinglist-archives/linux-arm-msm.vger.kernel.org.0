Return-Path: <linux-arm-msm+bounces-111011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZNriLlFCIGp+zQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 17:03:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 242DB638E80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 17:03:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=hpfMzV0k;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=DjEDi7CX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111011-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111011-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D18730FEE58
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 14:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3457F3932F2;
	Wed,  3 Jun 2026 14:45:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3494223DE7;
	Wed,  3 Jun 2026 14:45:44 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497946; cv=fail; b=FzSJ6cOmSRKetmW8W2vXjdZhKa4F25iwGws+gxhy+/mhylgUnZlyhlDib01aJPD31e9mqsGJE7NanmhE7HhzCwDrrzbLIvyWh1vUU9WB2gNOBknWXS+H7VzhEDlM8vbp3dy16qGadcV85R9u+O2JWEfTbGM4/wf1lUA0vATA6XQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497946; c=relaxed/simple;
	bh=lCkQ1KYa31w0d9ZGmhb5t9F9hDtBb9fIsY4LxFU5GzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V2g5cgbdkc7iJ0csz+8ZZcBR3qB3Qh3ffi+qZ50JiWPElzrBoKWhD8ZsfOOEZuBLX4of7r59SWCJlGl0Fd1GNGojxmyRsm2zv8ccnKfSn7bQ6spom/BTeMGLZj9rJuwAAmx/jqxiIvA83PUi330jcXP5o4GfYmapxDMgily7pa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=hpfMzV0k; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=DjEDi7CX; arc=fail smtp.client-ip=67.231.152.168
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653EPPul2840060;
	Wed, 3 Jun 2026 09:44:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=nnUC6ZGZyJZO+BvBt6jxqMai6Vzezo6t2vS8fbxsE0Q=; b=
	hpfMzV0kGA83pV/lQcGc6+F7X1zKRLgII/cblTGmbkXr1LfaFW3CrVUcoBeA4aC1
	7H8N7T0meyDktfb8UgQ0l+1BPBOtg58C2DtPxcBS8W9OcG9qx8url9ZUSFcB9cKb
	Moi3hpg+D2lXJ1EDzMtDLEcKnOpohQz9kYQdxZ468jTrihH8g7YwCg+cFdTh7H46
	3jGDNGWub82Kk/zf2TRKo6p0Fegb5WwL44ytdi1If00s05yjw1e/9w+pM4cpCm8U
	Q2Uble3GbcNHRA8cj/vYJS04Jya8ITMJOk7OsMP763W8WUCIT58ywXCU2l9Yl33U
	dqhKHbGZZPiP8steHMtznw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023095.outbound.protection.outlook.com [40.107.201.95])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4efvagedgd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 03 Jun 2026 09:44:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fU6pLB5I3XxxhLTBca5ZTkxeihG77XnVteqnqnXVPBGyKiDUBIA6r3JhT9u+7+/6buj3yt+YhVJ1VX5XfZhGtuloLyj/q8Bc7HzXszh3Le6qS+hD2kATaaQj35RL6TXGnrr7+HPaUoWbWeaYmROhFLlwbGuaHVY16m1Ud0L7DbQBkzxhF5mvWDufgkbAJXNE4VAFAIzEZUW7QES6QD5VoJ7e9zdFRjGVAF7sIAOWaQe+IqhjumIupD34kihZXHbwcLz3+cdc6xFBnlYrblMXlk+HScmdJzeJx9/5hzr02cfu5qf3t0qCZlhoAVmsWueei8znoG5T3HsORcz1XSQrdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnUC6ZGZyJZO+BvBt6jxqMai6Vzezo6t2vS8fbxsE0Q=;
 b=jd0MBX4cBqmg82EoHYeD66XPH4H3xbKus1kxhG4jxLT9D5z3cCBoxX9FUwYQVeRfiRf6b9IiHC5S7Opd7rUWBIqLFwQxOBTMLzYkUE2ucyYf7yLyvSlH6uu8V66FvPgC9cYJ/EcscCtoF8G/WbsoPqCg58ZigDRrtS8G0ZrcCzJLTClytnTHVH8uiyxzRxmtNqWMrQYKEcgLx19Sc66muOZqLKcVqM8N1WXL3acaPPpo/J+8WGjeNFJ+jOHGgt5oe2Ha+oCQYKWQQdIa87DaYBz7ciUH5K08r89xVjluSauIXJtINsMY7jH8Al/a0KrcyBarvNw7+g/uoR5oVxgOyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnUC6ZGZyJZO+BvBt6jxqMai6Vzezo6t2vS8fbxsE0Q=;
 b=DjEDi7CXdytV92sCagJb9Og6x8YpiRpiYnM8AB0B+4sCk5t73lAimwoxSwti1JtBh3TZJKHnxVP2ncHuGftHNNyObpiqgUoTu6sKQFkfaV5iQ+Q+/PHsUGzERcopsRofZgQAof/njfTSAP9krFBwSnWQNQxr7n+Ax9ubTuxzJe8=
Received: from SA0PR11CA0122.namprd11.prod.outlook.com (2603:10b6:806:131::7)
 by PH7PR19MB7510.namprd19.prod.outlook.com (2603:10b6:510:27d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Wed, 3 Jun 2026
 14:44:51 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:131:cafe::8c) by SA0PR11CA0122.outlook.office365.com
 (2603:10b6:806:131::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 14:44:51 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Wed, 3 Jun 2026 14:44:51 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 50574406559;
	Wed,  3 Jun 2026 14:44:48 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1170C822545;
	Wed,  3 Jun 2026 14:44:48 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 05/10] ASoC: pm4125: Use new SoundWire enumeration helper
Date: Wed,  3 Jun 2026 15:44:38 +0100
Message-ID: <20260603144443.593230-6-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|PH7PR19MB7510:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fc2d8577-c551-43af-c573-08dec17eab59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|7416014|82310400026|376014|22082099003|18002099003|16102099003|56012099006|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	uVMVXyvGaRcdrwoz+CBEmvxfBRcAWUnrBBEAaeUEjiSScWe1ZyPnW6kni2RQzxNXlMHTR+vS/aNMPoLoVKYjQ5aj9YIL8mBEo9YK96lH0N/CQgzDxUkZdF2SLPmeMzalhsKwCkfOJuHJWV1/aIX82NdwrakTpQ5CUAzbe0Hvw4yvyQZ/kw6XLoVYerkk8TH6gjGqdGEgWiQH9vpN3Vv5xSuTmhrGZyrnWKSseaFY9V4CM3BCdC462J5nsH4C8LSwBbIs7SzGfFihtSLZVVkS/NNyIwLph+hEUdopTmnKJxacCHGBue6gS744DxgRMGDEeKD948U3+LXxxRCBpVByTdBFWVPFtSmW1+wH6OMy9ygAZ+juFArIoDHbhHfv2vKXNVmBR8dSFwtQgDwoOppc+wbN/ldAAfLjYjuUC0Sz/K2GkKFa2p+LAgz4eoXiS5NERoPsDYW3nrX7QGlRzbDNCY5y/G3U3FZeM0+NCq8E+XM84wXzFBPG3cwWIgiztRVj8onYNOg+Tf5DVJn8hL34F4oF7dTVr7ipCSf95TuTTx3phSLYjP8qQxiOA2ulYsjO8ZJ2KO31cKlAaQmve8ocP4dbtR1V32SJi4vWYk7k2BxdBo03aXlkWIm/tsq6ss66TD/QJkn2IpaMpM/lWreQt/wZLH+C4w7U4JjJeBEqzswCtOfanOsgFp5hhGkdIVKgrAS21DvPLLQtddU1E8V2S3BoGq0VqnM0x6W0vV5ZLm0=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(7416014)(82310400026)(376014)(22082099003)(18002099003)(16102099003)(56012099006)(6133799003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gIocyp4gGh6s/W72CRvPY+zS2cP6n3HioM/qPbXQiuXjp8IimRgmAzF30HSiknuuIh4ZNpJ2mNo4q8q+WMR+7XESXQP+kMKxcm5vTvJIDAHXUYDyfulau3gbNZXM71WpTZ7KA1RrIxyX34rFf6Em78ReRuBQzxp+A86SbynsRHv96A9+7ABn2urI65wwYH85ehBna5QDjdSP23XS6L7mqieoDH920OKX7HUWu45HoqQ10VyHSm5xLhfdDujQ/Rn6IouEZDxXjPtuEBm98i8/vtt0FpvHkpBi0R25FEDPFNnQZR8WVVninChGTvvXk+dfP6n21TJw2HfuAjYpUuXsHT4mKFg6Q61sUQIDQOF1rbjj3EcgM/5xIiRoCh9yp83bOUFa0q47qUJctXxv1IPaJDhDa6h9MsmhdP+gACeVR7IBYk/Q2oga+hir1QaR0L/X
X-Exchange-RoutingPolicyChecked:
	O0W6Y2qcX58tx/H5PDcqsmVtiDPfzdFWgm7oHnmegmDdQ+ojYoefs895UTbG3sau+DzTUq+uyB7uyE0K6INJlxeQIiCXNRvpD4W/t8xi8GxKTl3HQwFRMBxIMVzG5ofFp/HuGBslRnFOUbcLWcR4GOoJfD8j4rZ2kgtZTukoYYWLGUtI0RDoojNzU7nIi4wbMr1C/82MkkQdiwu/vVMgDkQo+k7w/n9oHH4yYUmgD+I1JltFhjj3N9SJ5JS1SGdjYgk8nzL3hbCA5ZLJc3npqsS+3b0Krb3mudluFYC5jo8R+xolQ81/Gvtn5xwd56h9EAY62/zPDtYDOQClHeB9YQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 14:44:51.5239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc2d8577-c551-43af-c573-08dec17eab59
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7510
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE0MSBTYWx0ZWRfXxqB3BVns9BXo
 zwS1oPiFAmH8xbdDP8b+rlxPva7AovaF1vPA0rSHhpy2UTH3jeJFXNXGvt8ffDsw3goBjgmHLp6
 dMvWY/aGY6d6tNrYy14Qxrzg7g3Aa+2M8Vy5Oq0TP7taedbUVxjz3OKkNRGoKr0YZR1TSL7K7Og
 3kH86BdfxQ+8oHTNabRzSp3linVbk2h7YwerUwOMxVzA9dnMkmjNyWiB3bb6Wx+40z2qMqIYkYi
 gaW1I9pNULg9WGCrVDGQc2RJ+ATHaQy3yC50L7VaNIqRLYETD33I4pxEDzZFMWSndOS0Lk3X/oq
 /10YIm0uhBrKkXuA8x7BqQl9UcbFrAjm6QdvcsuL8FtlDnunNvISd5rlphL+XHWvJEgksxt4E2t
 kHe+e4nG2dLAa6/K8W/eAF0r7ZqbjlZtT8Ai1MfzIxOJkAhKhJ8mriSo6O2lcq3hGMXlN5lEb7J
 QExNloYIIrGOHrwrXuA==
X-Proofpoint-GUID: 1X0RX09tEHLS2hF0cKEjiCC1o9Hd8Zyh
X-Proofpoint-ORIG-GUID: 1X0RX09tEHLS2hF0cKEjiCC1o9Hd8Zyh
X-Authority-Analysis: v=2.4 cv=ddywG3Xe c=1 sm=1 tr=0 ts=6a203de9 cx=c_pps
 a=iE0qjxSwE5SXcvk24aZtBQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=3l_c3HHteuAAOOvkCYUA:9
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
	TAGGED_FROM(0.00)[bounces-111011-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,cirrus.com:email,cirrus.com:dkim,opensource.cirrus.com:from_mime,opensource.cirrus.com:mid,cirrus4.onmicrosoft.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 242DB638E80

Now the new wait for SoundWire enumeration helper no longer depends on
unattach_request it is safe to use from probe time. Update the driver
to use the new core helper.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
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


