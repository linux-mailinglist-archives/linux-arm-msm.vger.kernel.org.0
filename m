Return-Path: <linux-arm-msm+bounces-116711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6MkOGYN3S2qxRwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:38:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B6770EAD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:38:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=iaLMW5VD;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b="jN1k/B3P";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116711-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116711-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 666C9304C379
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6D842254D;
	Mon,  6 Jul 2026 09:04:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF70422537;
	Mon,  6 Jul 2026 09:04:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328677; cv=fail; b=AqXPmuKsLA3yVNKs3gfqx+Xme1yFa/ENbuMdW0uxhdMxxFN5DJJ42R0O0NiJXNuxqxIkv08HuCG0GlF3AOJ7trw4zCYY5r4IRbnj5oHf7YooGY7+W3/6bQfL2Uwwfyf+WSOEYNXQmSkpQeUmSOWWtFGEFEixPWFCczGlEpxyv6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328677; c=relaxed/simple;
	bh=RuSbfzmFBlF6YAJeN3Y6u8oDUJiamEJ+TPYSYbJwA6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D0zc+3wFYcdYjAOfW9VUW75P+lzdOvDZa//cVO8TF4JTzuI1pOtJ0fHWwKFvlrvVAkYm/UeD6wOx2ujrL2xzNxZGq+Jb/Rh9sohG2YL51kAh+yngUm/LwuL89hl/tNeIFIX/19R8i30tINYiKJsp0HDW6MDjBo9D/GacKVsKUxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=iaLMW5VD; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=jN1k/B3P; arc=fail smtp.client-ip=67.231.152.168
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6664tcLH949871;
	Mon, 6 Jul 2026 04:04:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=WixV1gJbVwQOR2hAWzWnSuhc6jlfSnLR0w5caok3S8A=; b=
	iaLMW5VD2QVi3O+i388mhtaaqZuW4bdWgpXp9YtFidqWdKWxFV7qvuGvQmykPCz7
	2afYPmPckLdQBDw4KyvBYQzpf/rNxmC7+R9ZPqhz8TZInQblSliPep+tIzqo3Ux0
	i5nbTMWyQs6mXlhGx6DpmRTpf/TuAJcGVdH0sxBr1E5e2ItCM8l4+J6oTIBQYtKG
	jJ/08HUFn9zajmVAdu95hkJHBYlcmfcbaSljxei+hjsaovgZy6WSR8ccg+Jkp19k
	DduNhC3H07JtCWNaprT49I59hj8Bp5WhB75kA/ktV52U/PdDyar4n1tXP+dj/iYo
	iG44EHZ+Osiv8Wop+YXf7w==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021107.outbound.protection.outlook.com [52.101.57.107])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f6xkjj38t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 04:04:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SF5f+qk4Rx6NjZL4/+u+Fmg6316ZElUfKbppkTctj5gmVFYWB9xEUBEKB5eswGWYef/w3cJyJgPP6wqkTRV5O2d1XthrfdH0n7rwvmBbxtvJQogkUJo3Wp9YJVTNyWd64BORtSqax5f4k+ThXZbYYMbZRWcZGUvVlGOMIzc9wmb+nnQuU6Cd+dKShgPE6AtRtkDytd+gruaBYWJ/caS78kppW82pPRfNQDqSSzVTRTz0oo0zAizvum++3ByiBhRQTAA0JTVayBgw27zNQIymKo9Cb1HSJ89I0Lr89W5B+ZZvUaBuu7DIlnOgbRPR/sCrESiz/orhPoyJOHNHAWn5eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WixV1gJbVwQOR2hAWzWnSuhc6jlfSnLR0w5caok3S8A=;
 b=B/Ykh3M3z8KQCDSjueTEvqsatIxCKQ5w5gMhcB4HhnEa4sJHvBkikKUIegfKIGSS01gunCDMN92smqubxfbS9CUBZNU6gs0Xy1biERkd/RA3Rfy/1TCcrtcmm4UouNjvzzf0oBPB3UQ0kRtz3pBP7qJF6Kb/4u4LFG5qBjgysHoNWYW0/bMishdSHDT/dOBKctyGsUsBkLCa0JS5ZMKee0maDO1fEXoT/OvcvbCuY4Tu5PufsTKUUBfMvgIA6SdS0ap8k160RWp9PDK+awh5GxkUqUc8xFWjv9+8c35hcK6aBu0Gin+6IC9HJa7WSboQ6kehgupw44m9pE2YJLrfaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WixV1gJbVwQOR2hAWzWnSuhc6jlfSnLR0w5caok3S8A=;
 b=jN1k/B3PssdME9NxWIUSg2PQao9GMmR588dVzQS+bADVcSmkcwu2EMdmdjFqGyuFeqDjtNoCyIyyNDeKWhmE06GTx770TjVmzPgAJU76thQjtB5GY2Lxstx4TafJtVy4ZfEgDXi87/ZJTzj6fP/tA7m3H+HxLf7uDh8b6Q54Wng=
Received: from BN0PR04CA0069.namprd04.prod.outlook.com (2603:10b6:408:ea::14)
 by SJ4PPFCBAD7E1E5.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a51) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.12; Mon, 6 Jul
 2026 09:04:00 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:ea:cafe::15) by BN0PR04CA0069.outlook.office365.com
 (2603:10b6:408:ea::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 09:03:59 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Mon, 6 Jul 2026 09:03:59 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 40B4E406541;
	Mon,  6 Jul 2026 09:03:58 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 26A6F820244;
	Mon,  6 Jul 2026 09:03:58 +0000 (UTC)
Message-ID: <6e946dd1-d95e-4d28-9e84-5b26382275b8@opensource.cirrus.com>
Date: Mon, 6 Jul 2026 10:03:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/19] ASoC: codecs: cs4349: Propagate regcache_sync()
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
 <20260704040330.23616-1-pengpeng@iscas.ac.cn>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260704040330.23616-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|SJ4PPFCBAD7E1E5:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b9796a9-4908-4599-6e07-08dedb3d8461
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|7416014|376014|36860700016|23010399003|82310400026|18002099003|22082099003|11063799006|4143699003|56012099006|16102099003;
X-Microsoft-Antispam-Message-Info:
	TEblQHiP663FnqHGQvclFMrlcv3Npxt3Tq6BsCLb3A1+677qLSZolFQ89nnaGfbZbazHMiKEv/tET1Nc3gwtaqBuPUOBSZO4jMPLg9CYZ6VD0QBjq83DHaBDJ+PyKxjIC3QEzVMc5wm+tMtb6pgdYEQM15oAry5gauKNYGXEYpRzogs3qsc6bQLfOrjWCX2+Iut8Mf1JcA8AjdXmKeXhD5c68WKnlMH8cgJk9WTmt7qv2wcYprKBNKgt+OE6yZaubeBOUM6lRM7rKdnORg7W2EEyED4cYEn/1pjqzAW6G6vTv2Li9noXOsG3TKtm+drc8X8ge5/S3fedWZQufWHgWJ5rjpDLGW16EADkHmN8WmZoDOkYYkuTnx46NK2wMzeEt+TY1DqNrdJMtYN9tXR8Z8S3+XnQMtmyi6g7A+u/25iwUFEtN3+s/j25zFm8u2Y4bPwo40AO+C94zxATCJsN40cqTGFhjte/9wbhcLmAsbcWGcJwgBSZoDJf7ATvgd3wizXx1MdOkWvMstbcrwFb8mT3X/l24JtWodo+SQvDLP9Dm0+pfn7ITzgg0cz8jzWI6YIsPjq1WThietHi75bWihqRkRir8FgPCFTizfg0mJUNMiUviPMi4iR6IPi9jwTZ/t5DbGFzZzM2zjp2eee9XklLEwmCkSkxWwBjmKSYCvryJ3en4zyRKe9tLjvtck7E3TBGnoYwwnvxRF4DPH//VQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(7416014)(376014)(36860700016)(23010399003)(82310400026)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RCktrNGLQRXAsm13iQq9hlrbBHztBGCxGe1AB8FgVtityJggJHi3jpiH9/s5ZdHjKs2K9a/34lxpTHrUmykraChYnNtdGGyuKpkxvyHU88afo+e9yK4mRsdpPRF1v92DO5GWSYbZWHFzo9bfNeFgSy2RuZTUNnaA7yO1eTB6svBGXGpzL038TV3hFLaAhPskOqSHlyQV/9EIj3kkuBPQHRbadWO3GEujwAiN34L4vOAWSYVRLJaUAkcFPSdjYr0+DatE+2YcRO7kHIED9XMMEuN8O5GU2cYFsWmKAeqj1YWkYp34OCzSUA8DoUMG3haJfU5aqRWbL+fqHIxL6+D9DYY9+Zjcpfbmfpe76dFRXeis7qJHkueY9ZH80hLSgPTSgFQuXngzTtBv7LGfAGepF+IQ71oAckLGg7E3M+Qkvu+NvABlxKi1JAZDT8+rRl9l
X-Exchange-RoutingPolicyChecked:
	Sv0AFBwyMMDWwbFt2SHAmphG8QAa+mxjGJvRGzEOw5yQqjPpwMbMcta6qYmJ1xa8KpgUEvkTXge/jQTum3zPV9MUSKY0FicEtvJGDKxw8JuZdQJFkPBCzwAa6V7e0x4MLAF09k4ZQ/SQ3DxImi/2k6MahQ7Q68/nCINMFob4PLI7AGUle0DQj8k+IsowKiH8h5d3f9N11xOKxO2Ud540HflwuXT0C00gKAoKQhEkYZUh+Ko7oDyChHoSJdnWVUiZbBZCW9eFN+5Gc4cBVnkNqAuB18F/xLaF+z5GZLgW1N+Rt74jTspt10jl08DHuShq8c8xPrvW5wNkouDXPlURsQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 09:03:59.1524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b9796a9-4908-4599-6e07-08dedb3d8461
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPFCBAD7E1E5
X-Proofpoint-ORIG-GUID: AhuOTf5KtQ9HRiNdzPZH255L08YfoWsl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5MSBTYWx0ZWRfX4CmvjKpjdXs2
 UnXaGVODHeKHU3muh7J04XJ02grnCIGoPCmkIyKbYibEKl9G6Fclr3hXv/C86PDjUOXlc0FWlZR
 6mo7aKTRH0V83ec5xRun1ybS8FSxSUs=
X-Authority-Analysis: v=2.4 cv=YYiNIQRf c=1 sm=1 tr=0 ts=6a4b6f84 cx=c_pps
 a=AVViaUQ/FgKrFaIAxxVSSQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=kxzbsZA9JC2NErLx-0QA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5MSBTYWx0ZWRfX8d0P57pgfqRq
 jwWo+1lScnlOkX0PeMBAeuqkpD5kxzu39r8/lGseH+jSpWNhwIaFMOcXvKVPACiOfwYmGIi9mk9
 6UVQ97W+uuHPXGUuGx9IhZP4eRmERDKHEvAYm/cVtup8yZIQ8o/95HUrlYWku/O2apva1P4cE1t
 +Z9injyZpFG1lKSKrpozbQcgZojg4aHvsNmqIwu6pCOTKC1o2cxrDedn3h4llxK/xfBTPpP3763
 L+klwk/O5ztTuHbuYt2pzs7Mh2H6OVy5HObu/GfAKl3c3qGRB9SyUHynnYAO+buNfsS6vB5xLlS
 0QRgdzKsbQLI9Dak4CTNULRNAvZzSeO/Yk4bN15a5Dnb66weLTWrgszxIk1O75UFG51DnG92iNn
 oAEG3YOFdJPlaFNlCMtEcY9M1g9vLP9tBeSelqo2xehby+zDMFfu0yUZqWTs0i8Mdg/yCtGKfod
 P7veO481wB1bwWU7D2g==
X-Proofpoint-GUID: AhuOTf5KtQ9HRiNdzPZH255L08YfoWsl
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116711-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[iscas.ac.cn,gmail.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:srini@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:oder_chiou@realtek.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:david.rhodes@cirrus.com,m:patches@opensource.cirrus.com,m:brgl@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:ckeepax@opensource.cirrus.com,m:sebastian.krzyszkowiak@puri.sm,m:shengjiu.wang@nxp.com,m:sharq0406@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rf@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,vger.kernel.org,realtek.com,ti.com,cirrus.com,opensource.cirrus.com,renesas.com,puri.sm,nxp.com,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[opensource.cirrus.com:mid,opensource.cirrus.com:from_mime,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,cirrus.com:dkim,cirrus4.onmicrosoft.com:dkim,vger.kernel.org:from_smtp,iscas.ac.cn:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rf@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1B6770EAD7

On 04/07/2026 5:03 am, Pengpeng Hou wrote:
> regcache_sync() can fail while replaying cached register state during
> runtime resume. cs4349_runtime_resume() currently ignores that failure
> and returns success.
> 
> Propagate the error, restore cache-only/dirty state, and hold reset low
> again on sync failure.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>   sound/soc/codecs/cs4349.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/cs4349.c b/sound/soc/codecs/cs4349.c
> index 6ac6d306b054..9a7f70175717 100644
> --- a/sound/soc/codecs/cs4349.c
> +++ b/sound/soc/codecs/cs4349.c
> @@ -340,7 +340,13 @@ static int cs4349_runtime_resume(struct device *dev)
>   	gpiod_set_value_cansleep(cs4349->reset_gpio, 1);
>   
>   	regcache_cache_only(cs4349->regmap, false);
> -	regcache_sync(cs4349->regmap);
> +	ret = regcache_sync(cs4349->regmap);
> +	if (ret) {
> +		regcache_cache_only(cs4349->regmap, true);
> +		regcache_mark_dirty(cs4349->regmap);
> +		gpiod_set_value_cansleep(cs4349->reset_gpio, 0);

Should this also revert the regmap_update_bits() ?

> +		return ret;
> +	}
>   
>   	return 0;
>   }


