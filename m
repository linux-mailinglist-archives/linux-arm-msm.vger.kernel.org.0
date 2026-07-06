Return-Path: <linux-arm-msm+bounces-116715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Kt7uGzqRS2qcVgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:27:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC4670FD60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:27:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=nR9jQDNA;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=PLq0M86Q;
	dmarc=pass (policy=reject) header.from=cirrus.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116715-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116715-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4599234CFABC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462A83F5BFF;
	Mon,  6 Jul 2026 09:12:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1DE3009E2;
	Mon,  6 Jul 2026 09:12:41 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329166; cv=fail; b=X1yx98O/lA1DhR7+Y6+giZSYDxUwWfSqin9/1+dAy9V6A2Le5c1aWerGUFwrROXtGYpvw/LXr2iTGTelyNzKRR03Pc9mSa1aFh4oerHUiowvh9y/ISj83MnGSRSEzG7NHQNCnT5nclbc9bfRHYJeGHjtaw5rC+iN0jMoekwWx0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329166; c=relaxed/simple;
	bh=vZhmu7y0J7nq3I6w0NnCB9PNc4tIM/Mp+jQPmYzGSng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a18zyRiF8aAhPE0TDr0rP7623INCvo7EqcGdTKXKDwm9AOOlsrW+1ThuKoQLPMigT6Uca7ZA4URI4LLlpNi5jiQDkXBMfg49svCqoOO4YxdPciG296snRJBhFCF21KBVt4X/xYu4U8tBJ+8iDq4qY9rfrpAqOmbgQn0jNwm8Zi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=nR9jQDNA; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=PLq0M86Q; arc=fail smtp.client-ip=67.231.149.25
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6663dKBn039937;
	Mon, 6 Jul 2026 04:11:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=B9DkEobhIy2LsF8c8yFBye44W8KmdtbtkyAhPECYkJk=; b=
	nR9jQDNAV86xIs/oHPL3VrKDCnACRM9+FR+dPl8fObJFhKb+a/fJ0m/Mdu7nCxyD
	Xco20uUcoB68A2PMzIynjFx/tDUoBApU48A9G/VktJLcyMfoXWv5BEd2+MKCxYbt
	tuo8Ne6C0R94Lt8cjraAbc89A+LY9dinTQeWPNclHRo5E7jWgF3crH4tV3Rhuf+7
	X8O6lcspOsseOdPIQMxdWGV/+i5LPeHWx7ExfX8M1ar3oz1Cq15bT2gs/ILaP16e
	f95seq2KMTJ+L9MRszkOOgMxQUI/XfuGzN7WeBjaXg8wOPJDOppVIRHAU3RKSRNu
	dJQsWRVkqEcCKSar9Ol7dQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022121.outbound.protection.outlook.com [40.107.200.121])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4f6yjxj251-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 04:11:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I46azulfSaOq8ukjSDYdITYqJ7/VopXlahaaWs/TuhKVzj12E8JyitK/X3ZafFRrd3a7NdOinldEq30tYJU96NF6Fi5fv6NsbkeLsVeIRTC+k3h9p4qM8LZE5vBgu9ES7e1pExT2O5BeFkMNaLcDbqN8mQtvoTerfvBAwQFVLwOlrcYeJ7kPxt3+os4QTnmi5tyyu0FqQrFjsS2kYpYeKCfWl0mMTIrNoQ4X96OEzCeMv3k5kNVWTvipedc6o5E7vCvQnyvOR4+7u5DyKiT6zcQMWAZs5esyD6KXzr6DHKXbuU9RKVvvhucmWLMHNLkYlecGZXHWvxL4CEouu2A0jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9DkEobhIy2LsF8c8yFBye44W8KmdtbtkyAhPECYkJk=;
 b=YcLfrv4AnGgcin8/uNPK6cbJKhwXnHWMvE1nWWd8PUFh9MNKmeq49G1wsvXGMhKM5A0XXJL+pObTA5XjdqOHcRFP2RySBbGJMYgAElQhkz40z1ePD89Gg7EclvSxDwN2onoyQszl4nQXtW7JMnKXja8gM17vsPZ8mUf1WwukivF/vZfqldCmHzZV57SjXyKkGIOmoQPNeKQ3reY4MXM2gVnQCnwc4rc7+Tp0TU9XpJyXxu4x7bm1QOnjfRlEBTVOMd3LoCIvPPd3mTDOQIsbSiMMBh9HO81ZUsanq3WO/0N0GLPVEOMyB7NKifxLqK/eXSsIL7a+r4VIqMgayZk7qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9DkEobhIy2LsF8c8yFBye44W8KmdtbtkyAhPECYkJk=;
 b=PLq0M86QawNyBv5catdL/F+nBiNV/u5VQu6XXHS8SnzWvn4UI7MgAG2AEB0fQw4LPTlW15QVCwg6uFJ5I2pjTlQHiteRZllc1izF4jmvUHL1cNBTJ1r9X3qWAHcmJuM68WTy01HkChkEiDbK06UVhCfO6WcMeg50ZHbvV7KwiO0=
Received: from CH2PR16CA0024.namprd16.prod.outlook.com (2603:10b6:610:50::34)
 by BY5PR19MB3825.namprd19.prod.outlook.com (2603:10b6:a03:21a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 09:11:37 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::4b) by CH2PR16CA0024.outlook.office365.com
 (2603:10b6:610:50::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 09:11:37 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Mon, 6 Jul 2026 09:11:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4312C406541;
	Mon,  6 Jul 2026 09:11:36 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 350A1820244;
	Mon,  6 Jul 2026 09:11:36 +0000 (UTC)
Message-ID: <e0c106fd-4ebe-4ddc-b83b-190e17e49d29@opensource.cirrus.com>
Date: Mon, 6 Jul 2026 10:11:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/19] ASoC: codecs: wm8962: Propagate regcache_sync()
 errors
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Oder Chiou <oder_chiou@realtek.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, David Rhodes <david.rhodes@cirrus.com>,
        patches@opensource.cirrus.com, Bartosz Golaszewski <brgl@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Sharique Mohammad <sharq0406@gmail.com>
References: <20260704034845.14291-1-pengpeng@iscas.ac.cn>
 <20260704040220.12045-1-pengpeng@iscas.ac.cn>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260704040220.12045-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|BY5PR19MB3825:EE_
X-MS-Office365-Filtering-Correlation-Id: 66eb2cb0-3196-4a70-72f7-08dedb3e9568
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|7416014|376014|61400799027|22082099003|18002099003|16102099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	TDao6NyD8w4fIEgNar+A0ym8Yxyom1Iaa8LJyUofa2s2Q3FWHYyYrtWDBscuQRtC0CTngBeQNWwCrJ0TQDRF7M5XfFR0Q5L89gYHk+py//n/zfVnb1zKPVWqtPBPhLTd9rRlf9UI+ycV7beD5yqYUGNngE8lY+7cwfmxHtmGfQAZeZEH/B2UXIaYzY7xgWmfFawxdQOgEypFYX0zwnDieVa602AchJxEKd0fqPUoWpdfMnCysf99XkcXAS2KucTA+kRUbvX0KokbHIKUhXb6xR/1p93KqumCJ5xP/zoI4l4GNzmJFmLQM3WQB67rfr4dm5YiJLXStfquVaVEhnQpywJh5/14imcT/mPlbfAspJjxZR3RVkrfffoFWb1g9soQqhyl9ok3dl294vdxJef+oOoBdLI2qoAMZfJgdl1PQ899u7KVFRFH03/yPFJ8OAfrfr5+m97nQiwfTWtm4ukjVvJqF4lBTvHh+PrjKS/2T5tfdTHGCJRt0A6qRHo/ye328eoxgj6QJ0airzkXChkYL4gUuOGPEKmisAWCQT3KYXsrR2Y4ATsoZV/B6L/dYPomQGILJz+svJ4kq8lTWA5RI8I8DUBtnHdT90bXM6X1jPrYMmYxD2kXOp9JGRv0KF6jAgT4YO+cu6bknff1BAeD+xXy7TR2KSMcXztBSNmScN5WPWuV6DdTlaZylJrSzyAJjehuY5oStsCM8SW5mdSw3w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(7416014)(376014)(61400799027)(22082099003)(18002099003)(16102099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zsYlMpRNbjXSPLhWiOeMQTBB0BCZotFqsAhs7Dhp5tgEpSkHByUtQInlbSAcle47ktMQNKQ9l3q13s31x1l07ELHKB260c+n8TKyGh+NSJxYlIKc8fBGCA+oxsNtdvo/9j7pipE5LOy+FvRenr8Bv1720KEVTtwkdYGbGOOxPgDHqkuvmRbORVCbIAngW46g8qjDfo79DQxbOfFeQNI4lvIdygS4+nSPc4tIt7PN4DJ9nY+QEP/tLa/7K0binfmvEBbxGqLKhsUcVp5juv1musNLyaQbqWUEArmj17uyDyQIwa8nF2oqZJ7ZxjdbZEurWeU1rNywHiBVFN/seraDITlS0Q68DuRmQ48r6Kpuu6K3vNHBAzfiTJ2tN0ueM8ZUM/+uDp5X6NU8vDBt5gB2ENVDkv9wIWsWB93Qm9Qx3I9b0ZjUr4bs4ao2yQOl0fqR
X-Exchange-RoutingPolicyChecked:
	fvDkyLU2xh2zipHc1ipZtUGucp44oe+LOfKNx0JzSgFN/eBqO3wswfWUejZlDU+XWAkvXzHiiyeIsCUO9AgRL1Cdw0lxnXRkrkgAc/3h4nZR/otG4rYsJujP39om0pra4QSgri1CIatuvNDzh8c4IXOSWNa4pP2AErB9VLNZC2dYWx7GPCJu4lx3peXgwdMAslSk3vDLiGSdVQAIg+zCiTuQCUx7ytf1LjTrwDmYjv8P7+sETbM+f44pjWoYyMFr1MhWeUS6D0BkpYjualPpt8zO8Z8IvzJ7EZV9/zgH4TxIfnWUWXYreOY6u3C3HAlU4RDAyvSdyQxCeMlIHlc10A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 09:11:37.1940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66eb2cb0-3196-4a70-72f7-08dedb3e9568
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB3825
X-Authority-Analysis: v=2.4 cv=Fo81OWrq c=1 sm=1 tr=0 ts=6a4b714e cx=c_pps
 a=PlzX2GN61/O3EU/AUs1JWA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=6hikGvlUcqvvke85TA0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5MiBTYWx0ZWRfX3lGYEEfTPFm8
 c7UV3NkomNtvIX8xWAMgF0uD9DWHNsrWH29bw85UDUrq0Xwz+Zz3C6b/p6TJkjrTaOtMkq4lqbz
 BFYXYHV8fQZjU4fYcVNFfeqGTlAI+js=
X-Proofpoint-GUID: hEmnW2st2yC9Uh3erH0xEU6si2SqL_7B
X-Proofpoint-ORIG-GUID: hEmnW2st2yC9Uh3erH0xEU6si2SqL_7B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5MiBTYWx0ZWRfXwtcu7cXV7K7C
 /a64g/2V1mK7/jx48YH1KyhjlbRsS5iilRSJpR0ly4BN52znF7dXJPY6+dfTe0pC7Sh2AKC1ulQ
 yMTOdtS6FFUiqIPjkyDYu3mIoIvKngds7i4ctB9vPmOfVRi9kolFSYdta5anRTZa2XrXf69xR61
 YexDcqtlv49ZaKH3nQzE8TrHlJCPSTmEIcDrDdGlWsiSNfh4opSjbG5LNYLShC8iW05aiHOxk8G
 PloAgGl5TkK7ulwaqPmlsumErET46fmhSf9Cz3kj6x+9fLqG+Jwm9okp7p+VqYM/3IClYx++O17
 hdKCvRYLsdE8GZXxL/xkACcprsp6XAvJDdwXsAeScUEpLc4giXF9amf0uiACZIoLEclFxUPREvi
 Slv9TFtPR9tjnTYJmVBSh0X+Lsd8cQ6OFzJ3SRMnC+PWwgiJ1jnZQdth54i6c0yTxMriL4CQijx
 ENKFasZRG2RNW7r48CA==
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116715-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[iscas.ac.cn,gmail.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:srini@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:oder_chiou@realtek.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:david.rhodes@cirrus.com,m:patches@opensource.cirrus.com,m:brgl@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:ckeepax@opensource.cirrus.com,m:sebastian.krzyszkowiak@puri.sm,m:shengjiu.wang@nxp.com,m:sharq0406@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rf@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,vger.kernel.org,realtek.com,ti.com,cirrus.com,opensource.cirrus.com,renesas.com,puri.sm,nxp.com,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus4.onmicrosoft.com:dkim,opensource.cirrus.com:mid,opensource.cirrus.com:from_mime,vger.kernel.org:from_smtp,iscas.ac.cn:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cirrus.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rf@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BEC4670FD60

On 04/07/2026 5:02 am, Pengpeng Hou wrote:
> regcache_sync() can fail while replaying cached register state during
> runtime resume. wm8962_runtime_resume() currently ignores that failure
> and continues programming the device.
> 
> Propagate the error, restore cache-only/dirty state, and unwind the
> supplies and clock acquired by runtime resume.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>   sound/soc/codecs/wm8962.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
> index de18b1f85a32..2db822fc1de7 100644
> --- a/sound/soc/codecs/wm8962.c
> +++ b/sound/soc/codecs/wm8962.c
> @@ -3937,7 +3937,9 @@ static int wm8962_runtime_resume(struct device *dev)
>   			   WM8962_OSC_ENA | WM8962_PLL2_ENA | WM8962_PLL3_ENA,
>   			   0);
> 

What about the regmap writes that happen before this?
There is a regmap_write_bits() and two regmap_update_bits() that could
fail before we get to the regcache_sync() but they aren't checked for
error.

> -	regcache_sync(wm8962->regmap);
> +	ret = regcache_sync(wm8962->regmap);
> +	if (ret)
> +		goto cache_sync_err;
>   
>   	regmap_update_bits(wm8962->regmap, WM8962_ANTI_POP,
>   			   WM8962_STARTUP_BIAS_ENA | WM8962_VMID_BUF_ENA,
> @@ -3955,6 +3957,11 @@ static int wm8962_runtime_resume(struct device *dev)
>   
>   	return 0;
>   
> +cache_sync_err:

Should this error path revert the three regmap writes that were done
before the regcache_sync() ?

> +	regcache_cache_only(wm8962->regmap, true);
> +	regcache_mark_dirty(wm8962->regmap);
> +	regulator_bulk_disable(ARRAY_SIZE(wm8962->supplies),
> +			       wm8962->supplies);
>   disable_clock:
>   	clk_disable_unprepare(wm8962->pdata.mclk);
>   	return ret;


