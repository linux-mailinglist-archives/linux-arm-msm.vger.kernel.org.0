Return-Path: <linux-arm-msm+bounces-113606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RBvTFCJ/MmqD0wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:04:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E47C9698C77
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:04:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=C0UbKJ6E;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=XuyMbcju;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113606-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113606-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4E8DB3007896
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B32C37DADB;
	Wed, 17 Jun 2026 10:59:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F3130568E;
	Wed, 17 Jun 2026 10:59:06 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781693948; cv=fail; b=R3VHlHItzopsHhblHBL1yfh1n8L1ByB39q1akX3wTOEYdu41xiRH+JeSLiAKt/LqANZ+49Yt9sxxPx0+RQZD/zM7JG54/s34jVge5eIqFVgHwbjNLS4nwusva1PTGKzBaZQxNoXB5x0+vmg1oc2Wo6Xa64qGcDK5l3seQWJDdeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781693948; c=relaxed/simple;
	bh=0wWn0zEuYuPiy8UfhkJqWRZZNZ2SSjXBDB9nlA9P1IY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VcOIyKzBknLvhvI3wp4nAbXrkVRJ9ZaDsZIfHl5b1N6UqcyIa01YJGLOllqJcQ+bbJ4WtWwurTsFd+GGyhhTzsAAT7tFTL7ZMNHVS3NGJm4BGN+5heDTM2lq6hcmr9fph7MqveIxVNsW62p1LQE28hG4KxDb3njiGH0gEJ/AboI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=C0UbKJ6E; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=XuyMbcju; arc=fail smtp.client-ip=67.231.149.25
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H2qmXD1832765;
	Wed, 17 Jun 2026 05:57:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Mgmmp0Lv3Gziow9eha
	V1b8dgVvw3DMFOCG76pwn62MQ=; b=C0UbKJ6EHAr3zbgiaBpr67VNhh4fzDIjyf
	bhyYTEQ0rXtB4EydIru2vNtcfQJvbyZ0TL7UAg5Cz9XRsWRxL9fZwhoJy75alvw7
	Sd0S7cZRXwBnqjqqJCuTr+qIf3lfXzFf+5f5KphZbBZXTFhOglQPIt5upiP5ICjr
	9gLWgI+6mRJ6X9R5bVnwXeccHPOoZ6JMGq54uTaGWAd9KyekXqnaF9LdUs0yBShU
	9ekAnLizK0SJWaV5TAtKHrmpaJxoxmJZQE+i3Ji2uspkvCumADV9TisbXbnsTIqq
	5OonCkN3tM1EW37q6FUr4G5GspFXi48Nw9UgMoY+DwnO2XORVDIw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022079.outbound.protection.outlook.com [52.101.53.79])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4eueefrska-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 05:57:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vy3UVeyfCwsilxA0+jj+1xS8oNL5GxBPvfRy6tvU3hJAR0z1cyMKyJNLGgDAowfsWrzFSdClZaVwKy/rMwKaqJWplHq7FsJbogD9i2p+MGRatB7HtrgC4sFcDTS2hG1H0i3juTO33RPXnMrQqMWuNdxE55QzhS147dmZYMHDwFBtdZFPDxw4byt1oGbfOh8pDXojB/FTXv2GixklgP3PnysnKtdmjl4e7ZGkRhc4X/s7L5SiIwH13gUz2t4envYMSBe+DK/1qlc27j85iO/xvBfCmrYoYj8G7oqE0nOLJkpCfm2GruiTv9l5oyQzjM22hUXOiNkWsXPvrUQx6Z4RFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mgmmp0Lv3Gziow9ehaV1b8dgVvw3DMFOCG76pwn62MQ=;
 b=i3Zf5ymq6hRYbnYVFcEo9jHde+ZQNOz/mvRxf7EtICpuLqVaALol9re/LlWmT1OZkaBKnWnez0BmSaHDpxGYcamO9An/zRI9m2WKKL4CS7u3oNb5IoviUk0gEnWgwdUIOiZnpxJ8RaYSgsgl+Wms0pr4596j8xxFU99z3I2nqOYkGRcIY9dfTtA4U0qRzLTFxKz6VNPzgX9Q68Tb+odrhCLPqNQ9HtNsYFmG1e/QmWM+AIWd2OMaayig0OKbZnGjZOpKcAeOz9gShETx+joqMp9+a5Re8dlfbHPJIOI/wHIDc8zb1/A6NRAL9yVRzpRgo3/pTGGLo9MagApX6+k7vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=analog.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mgmmp0Lv3Gziow9ehaV1b8dgVvw3DMFOCG76pwn62MQ=;
 b=XuyMbcjuY7U7Wzz1bTBlApS6UVVRiT8fC0mA+2XfN3IdL/sY0N5hLa2kJdu3ZtrtAJ1J9yhzxwN8ehX04+eWsy62MTRA+kf8sQyik3tB7tzX8TXIO03n/FnO1ToTduK6JcXh8fIRF06ZYWNxzrpVp9CX/vWTtw5yH7/kOOCIAjk=
Received: from SA1P222CA0167.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::15)
 by DM6PR19MB4183.namprd19.prod.outlook.com (2603:10b6:5:2bf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Wed, 17 Jun
 2026 10:57:52 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:3c3:cafe::2) by SA1P222CA0167.outlook.office365.com
 (2603:10b6:806:3c3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.12 via Frontend Transport; Wed,
 17 Jun 2026 10:57:52 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8
 via Frontend Transport; Wed, 17 Jun 2026 10:57:51 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7655B406544;
	Wed, 17 Jun 2026 10:57:50 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 54FDD82025A;
	Wed, 17 Jun 2026 10:57:50 +0000 (UTC)
Date: Wed, 17 Jun 2026 11:57:49 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Guenter Roeck <groeck@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>, povik+lin@cutebit.org,
        Support Opensource <support.opensource@diasemi.com>,
        Nick Li <nick.li@foursemi.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com,
        Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
        patches@opensource.cirrus.com, chrome-platform@lists.linux.dev,
        asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex locks
Message-ID: <ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260617103235.449609-16-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617103235.449609-16-phucduc.bui@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|DM6PR19MB4183:EE_
X-MS-Office365-Filtering-Correlation-Id: 73f8f070-5757-47de-aca8-08decc5f4709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|23010399003|61400799027|36860700016|22082099003|3023799007|11063799006|16102099003|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	REHvjaJVSeWra+hItFE2ON20a8FyWYg78mq10hpU2xNFbo2nnHgxN/sY10mI9JCxbEXLC4f8HI3r15Nav4mNlBAOsRXjnPMyOUCt0Z5oaIeqY2DGhwIXy7tXKxQ6DZUTcf6+mHxEfeVaJfB7HZ2sFBDq0Vp7Zq5jWi80BkJMPAnlEtHHTCd8vQHkmqJJtI7+xhElOFBgdqzVLq5Mu4M7n6zurk0euLgVyj5aq5MdY1wsKif5VlbMTvg4kPVE+YDDoSI8C2C1yjVH1SOstKQceIBk4QrkD7XB25uXZspG8TZhO77bk+987xkxI3EENiGOMKlNHHNJRKfqEy6eNfg1jrK5ozGJR8ARk+02h4JyN01v8fMFrfAkVF59PUJ76thBNbKkFVESANe5aBmmOLOO6pVkXhPcQxcVsG8llIdTLqErJQoX26BvGddozRBrOw7CErL9FjdP4QUVhFm364uapkqzommSHLas00yF5jb5aVuJmyDYVu1dCsM6QmuSVcXBgKHm1dBmV2yZhn1CTRA6bVR4VPcd1i74XdLCz3jG9+QLnI5wwduUkqi5JVBmNw/di5GHvTrRAtocFowEkB1Ac7cN5q3o0utCSw3tK/QOPlLZzrITIxWpfYwqdlyxfGvtnFZQMW/f9xEBOpDWH35EC6eXtcvsL5lduC+bGAU4nxJ5MMWFnJO3biHryLIvqc0PaYByI8Lq9VQsduL9nut4qSaEtd9uypRRQdSCFMe3/uk=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(23010399003)(61400799027)(36860700016)(22082099003)(3023799007)(11063799006)(16102099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fddZDunmeLwpAxiD/dAGBp5/ONK0X1bzh/yD+ps502h3BRPba+9ZWvynDuQSm2gq6hWJ0xV6SRSZFh9yGf2/ZEm0+WFJMbCHl3hQgzgbpDsUBNidPe75oYnO2RRKh5i2ZJDgYg+cjy0UVe8gd/USdFrk9dMv6ZO35LdFFAiI9CVwn9RimvwjwNvvzOLiJ0QXWQye0GN7k29wGJLEjK/qzCAjB38e769hG0rG3PHbULErKWmB3R4z+MQY4qM5GBJ8FwTe8gHMMrFyAxdejdpS5vWuRAhUaPI4dKE7em5BCq3X74sM8uj6dmNcJf6UMSq+ikxGEDLeu6j8zgnIHA0qZtGFQ1aQb0ZXVJ22WhKjow3GxHjBXsTfEif/fhjRtMk4qjXdu+aW7Q3AF6+vy+DXra/TrWfkAzm1zAMYQjEWbms+3VELrf00tDSzBoD2fJsX
X-Exchange-RoutingPolicyChecked:
	D3qGYjEfOo5yEWiGT0NztdjJxoYFAuZscjkQ3rHtna+PL+4dWgEuXtZn+dOZMC3RYl+eYkuYxZFZaEVx7JSsj2TXnlbUsrxj3/0KIpMJfuACDc+KIAhPn1qWMhPCK5CaXxrILMayK1YhhIubvy3cx2yBA9BtYOiWzZ1g4tTxCx8GYn3EKCdpr04mNBoTvnWSRVEpTdC0KUb5XjKsjBG2GCJM62LHxQEe1BVuUEL8dT20YaC/X8JVGASPstMPH2T0YrzyaaOqLGmaDj1c2cj1RQkdexapp/qN13DRGaF41zjNlGzUmM36BfV7cT84rd2ptFe1YDT/1JsCYb3pPO9u5Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 10:57:51.6367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73f8f070-5757-47de-aca8-08decc5f4709
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4183
X-Proofpoint-GUID: PooAyIcsWbvRVS3XxM_1OXPtOE077Mq1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwMyBTYWx0ZWRfX/4Qm0S9t7rdI
 zipYu3BmiQGPB9pad5EAtJHmYPu0pAiNs+oVgTQkPVMDTDAm7XBS3+NlR6hAzmE03efAPLCevbq
 /adj9rRjqGkeb9RpRVnnAsyVQhd3VUCnKaiu9FOVUa6RINmnbRRfcU/90KGrufwiEYykow7j3Tq
 yU+GafMISysznAI24oYfE6pwBUnhdrI/7rizUuk9kYXgwpyM+0BrvP89Ak06/MpKKyVEYV8oQkP
 Q7E24MZ5sH4bLrCYDNG2qEpRhl7XNV0qv6+gGQW8J5k2+nQPScFewsPyZ63hqaGy2fLx//BbVuF
 Sv5Rx/clTZIG0xuRa/IA6Db0hlxe92xnoGc8Dt4DhosXt1K1QSWo+qfAd3FdLe6fEU+vSArXGsM
 FmKqTAP4hqFbJ9AD5Dope5eE7455oWgvhVnj+DpwyvZTdBjjS5n8MS4cPeaWsfLFJfR3KCbf/X2
 lYt8f3PjnZmgPUhyklg==
X-Proofpoint-ORIG-GUID: PooAyIcsWbvRVS3XxM_1OXPtOE077Mq1
X-Authority-Analysis: v=2.4 cv=Wukb99fv c=1 sm=1 tr=0 ts=6a327db4 cx=c_pps
 a=Y1/fp9MKcFODYkh4PiV91Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=2LXkwXwYv1G787AwtbYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwMyBTYWx0ZWRfX0xlvaC/5iGO0
 Utry3e6RLuSw1Xq5Wiusgbjw1aR/BMEa2lVT7gVIh99gwWayqHGC59JovI2o2+ZfMKmNZS1PFVl
 DN265TmEakA/Fma1xATRDzqgHGNRfyQ=
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113606-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phucduc.bui@gmail.com,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:cychiang@chromium.org,m:tzungbi@kernel.org,m:groeck@chromium.org,m:bleung@chromium.org,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:povik+lin@cutebit.org,m:support.opensource@diasemi.com,m:nick.li@foursemi.com,m:herve.codina@bootlin.com,m:srini@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:sen@ti.com,m:oder_chiou@realtek.com,m:lars@metafoo.de,m:nuno.sa@analog.com,m:steven.eckhoff.opensource@gmail.com,m:patches@opensource.cirrus.com,m:chrome-platform@lists.linux.dev,m:asahi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:phucducbui@gmail.com,m:povik@cutebit.org,m:matthiasbgg@gmail.com,m:steveneckhoffopensource@gmail.com,
 s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[34];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,chromium.org,cirrus.com,opensource.cirrus.com,cutebit.org,diasemi.com,foursemi.com,bootlin.com,collabora.com,ti.com,realtek.com,metafoo.de,analog.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,cirrus.com:dkim,cirrus4.onmicrosoft.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,lin];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E47C9698C77

On Wed, Jun 17, 2026 at 05:31:32PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
> @@ -913,17 +908,13 @@ int cs42l43_jack_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
>  	if (override >= e->items)
>  		return -EINVAL;
>  
> -	mutex_lock(&priv->jack_lock);
> +	guard(mutex)(&priv->jack_lock);

I believe you have to use scoped_guard here, as there is a return
from the function above, if memory serves it attempts to release
the mutex on that path despite it being above the guard.

Be worth having a quick scan through the rest of the series for
this as well.

Thanks,
Charles

