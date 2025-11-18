Return-Path: <linux-arm-msm+bounces-82188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A634C67CF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 08:01:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9DF044EF32C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 06:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27BD0240611;
	Tue, 18 Nov 2025 06:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="ysMFFu/x";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="tF5pmTiQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx08-0057a101.pphosted.com (mx08-0057a101.pphosted.com [185.183.31.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413601991D2;
	Tue, 18 Nov 2025 06:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.31.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763449154; cv=fail; b=o8xS7yabsbWo5/0NAJNR4FH/QZA5IaK1Zewhj3WcToy/Br+T1J7Qx+I72V9+VGcmbbgsxs/Hha+rAyAzSkPVx21Hkn35E/ttS3oNqdLVtnRp8rmVoxm10CK6NWaKc1LcsmamVmal3hYKQQsPh6rc/5NxI5VnCihHCKBMRpis8nE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763449154; c=relaxed/simple;
	bh=NacBBp/6kKaPjfAkPdxa66suVcfmrfScFa2IdfsHb80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TmBMzB5WAfdlfuFPQQ+nvPqeY949Owg9mBQw/78533ObGiqk2+8ko46PTxbTHEP7WlBb0X+JTdXQOKNS5HpmPJxYGn9i+0JF35T8GiEOyAsZ/+SLCv68o+IHLZjGN7ISEmM6gYXScwPGCcts3W1+paa5Fhp+qxi5QQZfvt4pEy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=ysMFFu/x; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=tF5pmTiQ; arc=fail smtp.client-ip=185.183.31.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI5F1X81387354;
	Tue, 18 Nov 2025 07:53:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=270620241; bh=
	8p9/Yuz9yhGTaoHh+l5vKyMavKdm26MYjWkIUTH1sn8=; b=ysMFFu/x7mrabBEl
	jYbmxbifvUHoqiwlfHUEg1QwUb4JFN9czYJL0pQihcs8mu8M7XMzFI/awi3ONZdi
	odc+Xn0Z+LBO//5J1UZ5/GOt4PVBLsbeNo4tLHic8fzmVKFxMonoGMZGpIsae1aG
	55b1INbLcv7bIJNCNnFcCBVYmjpJ7KgdhcVz7uRMdcTyckiwi3w8EPZFpbyaCgqx
	hQL8qrcVYjPQrHdMCp8wHpGrkLc6+uchOGwEjkP1LMioJiTvHNeL17+ok4PcuN9m
	2x+PYFM/1F/12l9TUKzPh1BuVZjs5LxZKNhuiM1sHu6gDXV1GTRAexhq0UqBqwtN
	B+nvtA==
Received: from db3pr0202cu003.outbound.protection.outlook.com (mail-northeuropeazon11020130.outbound.protection.outlook.com [52.101.84.130])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4aeed52mhu-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 07:53:52 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNFERpSqESC6VLGDEGE9Hc2o0YwtK9JMcF9DhxTiU4HuOUx4NECacI0j+q8VpP8lq64aLbHZtR8E7E9j5yrB47Hdw5rxv9FZDyEff4/TrOT2cKD+G18FjcBA/gJi20S9KIXMuwHdZV3jygn93bjHHQwtJ/T6WCE0AHw5aH9fPl0Knl3jFzeNNV/zeF+A/czNSVo5KGl858przzkZLJoiLvjtJF7pJp+aKIm404V++TcY0QeP6BI4YVZz9bC04wEN2XbTfET7ff4TOmGf5fblD0VwTzrQQVVNc5pHCwqnbUQVmwEcdBs9IdfsqfpGs2uMi34M93gJzs/ZZwiLUIOAZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8p9/Yuz9yhGTaoHh+l5vKyMavKdm26MYjWkIUTH1sn8=;
 b=NmEf7etR8tNdrzPy2y6NQR7tdUndWZJo8KQbFl/Eotb9o3jWLl2zmZZn/Xp5T/9l42wQrVBVNBYohy31sgY8cVdcHA7+7D1VZisQ8T7W+RqWTK2thfPW68Rsn1CZOKWhUf78z4D89AIgR4vnSrH1jyFV0qsewfbmxd4DZPfYSVUY+cjBTR4JLI/tK4qO8KLkhCDpfePbx5DWG/g6JdkpFdb2JZj/BMKFvkqxg6w3t5qD84xG40P7lY5pnIAFBXMWapjJcSSYc0UCwJ+3sgGAMzpVbuDQv1d9wTK4ASxhxGxLx1N675t6ydt0Th6FM7c66UeMXG9JFVJvxUUG7D5fpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8p9/Yuz9yhGTaoHh+l5vKyMavKdm26MYjWkIUTH1sn8=;
 b=tF5pmTiQcUcZJxGvWqyuGuB5/ehMJYV6KOIy3U9wbKRW0CBOUdVLtp27/tQ12LeduCXRQgLWRV3YoBkD+CFJB3qXgcc25xbTahF8SpIjZImZrzsgzMKKzeHr/IKIURNCR/74lErrKB6UZbtaBVdIuAn+7pzxsLOyAYujef6xEs8=
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM (2603:10a6:d10:17c::10)
 by VE1P192MB0653.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:167::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 06:53:50 +0000
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0]) by FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0%5]) with mapi id 15.20.9320.013; Tue, 18 Nov 2025
 06:53:50 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 RESEND 3/3] soc: qcom: preserve CPU endianness for QMI_DATA_LEN
Date: Tue, 18 Nov 2025 07:53:41 +0100
Message-ID: <20251118065343.10436-4-alexander.wilhelm@westermo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118065343.10436-1-alexander.wilhelm@westermo.com>
References: <20251118065343.10436-1-alexander.wilhelm@westermo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00003836.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:5:0:1f) To FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:d10:17c::10)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FRWP192MB2997:EE_|VE1P192MB0653:EE_
X-MS-Office365-Filtering-Correlation-Id: 411f9ab0-de0c-4139-4602-08de266f3af3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u94t27fGJT9xhpuuO/sFFGuVCgyKZRYBLelis2GDf6WdltNK+9wanLQgFyPx?=
 =?us-ascii?Q?AEq7ZO1+cYO+kPELPZIgedpMRMu4F3cazblGWJHzmAvgFpjPz59ACml7d+69?=
 =?us-ascii?Q?h2pAp58VC31y6dsSrhY0TPr3sPE/ZjelPgOTP82oRpYvNAGDLylE+lD6cK6J?=
 =?us-ascii?Q?Yr8ZucYgBKRB7rHBkDDBN9jfirJZ7o6VIbJYDgviymqcOIYMONUvmgpgKhzi?=
 =?us-ascii?Q?wab9l27b9n5lNDZQbwgPss4FWN3OUV/CMmNLfLpO97rHCTjBGQQBLW4Ao1FJ?=
 =?us-ascii?Q?2Z3d2MPfkdlNLsVEMQBOEL+rKwYlS9K3cOP3zrXvq8IsE44OpO8Hrsc6Lzsu?=
 =?us-ascii?Q?6W/VLCMEv+Nx9M5wM80SYB3Swheu16wWIsMME0sJTF4a+q2HMsJDY4/EhHp6?=
 =?us-ascii?Q?Z4vaRalKzp6x/OFrcwnKkCsJUC81ogcMxd01P5FQ9urLGCVnFK3E+0GBfl44?=
 =?us-ascii?Q?VCHhTefhenQ0KdxmrRy/V/9Au7l5v1elCbbvI7P/5T75l32k3w5fngC/XCm4?=
 =?us-ascii?Q?zFyo58zDM+0pr4vBHW/WDSzSszL2mPOuW1GF0tjyT6TNyCVzl+/a5pTdKaP8?=
 =?us-ascii?Q?U14UPclkUTeUVHCHEv4XYLYCUBF8NF8wqYVFZY3Nven/PC0tZbAb36vX12NK?=
 =?us-ascii?Q?8WfoOyP7Ul0f4TPSKe8AGUA8abKJSb5XkMeRlZ7f87RDpNvNDv3xo2q0Dnja?=
 =?us-ascii?Q?bbBCXvQQiy4u+oYK279Ylb+PVttrKArDE1i+9d2c1Gn3+LMGCF1wknHyBj+x?=
 =?us-ascii?Q?wkZpz4cXY+XSGvGik/hwR+e54WLDN1l7AnqNpwWgw1rbzMqka7+woSHdLQj7?=
 =?us-ascii?Q?lv1wVjHpI+dAuCaxxGDHmMBqNvCYVvpxzdYAHm9dKZtu88D0OV879xHtMmoI?=
 =?us-ascii?Q?hclkdHjHl43YRI19gu6/pz1XEhN2HWjhhg7jLhDMQ3QXpWV77BB3D8fA9jEL?=
 =?us-ascii?Q?9ayflneZoWXxX0qf/Uo2Zl/yQvwCBbvnoYc/tGJS8s3DvwnrpkPkOd/lv3sk?=
 =?us-ascii?Q?c90xjsUGcc+KA20wv860ZrRs6RwbwSAwalGrf9r9zUWq6C4qT94tpwjRJWOX?=
 =?us-ascii?Q?DAi/5w2COfpZOqJ8vrjOwVanUR2MM/XLzvbTFRg8FaQsJ7dmwfUWKwiH8h2z?=
 =?us-ascii?Q?NpyH0mE1zf7+UcFTetVGkGLvT9KILaOeQFMu7e93/y/LApcShpn7j6xDDjvL?=
 =?us-ascii?Q?sqCFQie9FXM2i1LUw31iRmn+JgbkfwDXBZqYT48lrLRIBhhXb3gxGW956/Su?=
 =?us-ascii?Q?LVdxHAbVmsf2SfcfXUbiMfbDKw5T6CPbtpGF0QhjDeWbZP3RGQ6So0Z36uQA?=
 =?us-ascii?Q?yD7yCYGabQc/k9jl8KNjbXbhI5WNh7Myn6SUO7i3CwXn0p25yyNYQz9lbH4N?=
 =?us-ascii?Q?U9O+HkaQMsBehKPPyMTRdJMPYFR1yqFLhS7AZxBSX8Qn2lM0zvDOVMl7C+K3?=
 =?us-ascii?Q?Wa9O+m+4zYtvRIIRsmLFxeIc00Oc6kWl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWP192MB2997.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?simBgwp6zScEBayf57LEqhM8tVwrfCStS4svI2l02nDxqc6VXg9nsQzsADbO?=
 =?us-ascii?Q?kU4Z79oqf7L2zuL6JKeIMw6scNZmOoQQC3qMWTEJNe+99P0NRSeqmoLXZ3C0?=
 =?us-ascii?Q?mC1TODgCLJqp6TGEdvA1iqZZ63+o0dQve49N5WO4+4+vtAXGQbg7nMHaZbCo?=
 =?us-ascii?Q?ME5lKf9tBsk1W6btv3msvqXJfRBkTRh68OHlXR4U2/jf/FwFwIBjfsx7v0lU?=
 =?us-ascii?Q?lv6P1mdxeiyct2xlCWkDAWiZyPWUu5RPrX6OxXGXUiaRs8xAIUcSKQ5mFAcE?=
 =?us-ascii?Q?N8wM+cWWH5F2JZA9VsVz7ydRXd6Ixgt3c5nXUTRRjdQHHg16sC1PZfAbtoaJ?=
 =?us-ascii?Q?ihJa45InoKWi038QKTY/Cc2BPC5iTjYf9WVNyS4USoHyQMzDoZxDpbv2pp5Q?=
 =?us-ascii?Q?jFZHNJaDxGqCVVJdWgYUNC6ezmUMNUbhe3rdDWR2JPcT4zgl9jpn1fZMhWlQ?=
 =?us-ascii?Q?w5Ajxh6TWPjTLb6+zLlL6pL76tPm95hMtawuyUF+UfWARgo2jCufWjG150kO?=
 =?us-ascii?Q?AqpeGn3kjO1Af7GEUuU33Gh1tSQBK/aNe9+BVXuG8Zk7UDXFUfqR9ohjEIGN?=
 =?us-ascii?Q?CEYVeaBMpmw86BDLrWsrjwsf9r7hnE2c0LdLUbxFoh655XtFd4UTRGSPRkLS?=
 =?us-ascii?Q?1H8AfGDCZyVLDKe96N/JJW3a39nXKUbRtIRyCACNYoVQfRqfmWTFcXPQs6lV?=
 =?us-ascii?Q?5w0xIKBw3xjjKCLsJBf+iCC00VBZ//rkjP7Hl0GPG8h4wDgiynzqj+LAqK7I?=
 =?us-ascii?Q?xG2JE3YMN5EhVBCEiALm4I5U56oUjgcEtOsu9FM3pRa6PeFw2FCRHyiX6Zff?=
 =?us-ascii?Q?F/LmHlq+QpMiG4cR+3m9gOGijWU34zNtZnX76wX0RC2StbkKDgYfNI20FcB4?=
 =?us-ascii?Q?iZg1KIPoPsFLeL2uBbo9e6dn4gY3M2SlJgMamVHu0epAjnb+cSnmtCebU4Gn?=
 =?us-ascii?Q?/TWTHIz3ZFH6dP/VLUf6tSLztWGcEBPW0re0ww6w7PGjcYXgLkXy7uG5QrAN?=
 =?us-ascii?Q?fm/wFolobxch4wYduJz90A+XsQGwPVAyXnvXZpDNrQJZ+WxPQuGh61K3iTIo?=
 =?us-ascii?Q?OishZVcYbAyNqGRDLzI+RZq1kjKJMCrxhZ3a9LIzEfbpQE987r/GrxFP/3pG?=
 =?us-ascii?Q?ciMkH+1RJo70bh/sUWbah1Rv5XgNScQwZNtg7zzdzAurhIYZPEUGtl7yHO9L?=
 =?us-ascii?Q?dQnvaHbH9gsaf4RiQ/RnyX2MTDrvap0AuoElRJgYspCCqo5fWy0qccZxshd1?=
 =?us-ascii?Q?TS91KuZeHvotyzxU7xLJt885pC2X0hecZhdq08rQWlDFuQJzEcCY0ZwxLgUH?=
 =?us-ascii?Q?zxQcC/rFWgS/gVhe6Bx20UoLcEdvBHrf+WNYueNcJ692etqGdJ5KGHPPHHbl?=
 =?us-ascii?Q?kD7pTfD8ZGviEzXhkIWCyL948vfEHIs38L/7w74+KhOqBpL9j0Zae1rGg1+c?=
 =?us-ascii?Q?h+ApO/XkdHvuZsh26mwskZIKgzp7Hph2nl3darQ4qGvDO/T0rKvCPFpybA+i?=
 =?us-ascii?Q?sWXV5Cfun1Wj0yyu1BIrkYiqjhy7ME01UNgFEw2r5JrY777seGaj4yT7gnAJ?=
 =?us-ascii?Q?g/WiBdFdcPGzD6cIDh9oUFOMS5UuhzbH9BQf0Vvw?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Z51AUmKLr98kjRRUs9q1WHEiDF6hI05T8YUI3PxrcfH1i5UMOcqcTJvwGGlVSHMO/FWhciKl6h1dHP/dNyrH3aA4X59io3Dkl28GM4dY22HozEmdSnKHCwi+KT0MgVyaLNtxAxzJQcSaneaeUHijMthvEtR8WzjsbYwyoW9u2qimEAcm8Ue3dG66tDUaDNV48ZPCzFmwhr2wvVW/9uOSTr+KhnKg/KoE8bP7ORaSFrOXQ3jeL4MvO+dwLkA6erWcm0LZXWpGyTzyPsYQavKp2UvW/MJdlqMUyCMRmcbWA5zhj1qIaziB8C2lZhX3L/gVhqDBF7Wr4fUbtkI1MHlgJLGDJXNJDKZSwjUwBanTSWvrXc7HB5SyPOyzmvudnYTVXH3qJ+dyK7Y1sl7fXpYxtOfc8SWzyEthT27kkClYNxsG+aHO94xtcH5e9n66LVp1ENlrmwJL2O8C9dfvJgh6cfIeoPc7YU6I/iPw91aEoqUipisU3UWS7YZvbTjiYR70jLyT6sHWF/LeMA/PeJZvc798ii02c35kMrhrLCRAVkIlxDt0DgIGaR8M95quGSvcl17C9SnV+LgRxjzNz8pzy1g6/1Z0tWG7cpHOdHeWXt6GUPs+5pnfeOqNpA56lLs7
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 411f9ab0-de0c-4139-4602-08de266f3af3
X-MS-Exchange-CrossTenant-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 06:53:50.5944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G9a2WC0D2v9D5ThLfeLz+hFbddXfC353VgKxMsqTA533cP3N+R3IYqVX0JJFRDE0+swS3k5RZhBRE02gtC4bVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P192MB0653
X-MS-Exchange-CrossPremises-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 14
X-MS-Exchange-CrossPremises-Mapi-Admin-Submission:
X-MS-Exchange-CrossPremises-MessageSource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-OriginalClientIPAddress: 104.151.95.196
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-Antispam-ScanContext:
	DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-Processed-By-Journaling: Journal Agent
X-OrganizationHeadersPreserved: VE1P192MB0653.EURP192.PROD.OUTLOOK.COM
X-Authority-Analysis: v=2.4 cv=dr/Wylg4 c=1 sm=1 tr=0 ts=691c1800 cx=c_pps
 a=Q67dIzWXlOQ+KrpM7kYsAA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=N9GNhs4bAAAA:8 a=T0L45qBzl8X6T0AR6ckA:9
 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-GUID: ApX6lR1F9hfFuDVUQt5FMIyPmrLiPphY
X-Proofpoint-ORIG-GUID: ApX6lR1F9hfFuDVUQt5FMIyPmrLiPphY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA1MyBTYWx0ZWRfXwNSWAKIH6oLz
 jCccWZvjEN72v21WXNl5Xn1a/O3cqtv9aLYBur53O7te6yxYTlZOQ+H8d0piTJftbYyxMgfvRbp
 NOfWOQkJHmZ/gjo0bDpYnBx3YnyEN73j5q48f3Gy9g+Vx2EeEW03PPSGxu96A4FInTW8128azyV
 R+9om/PLDAxLvuBQh4O25ybmV9iIb1HzNBCMHypw7AnGVdmpGRIw51nUkS6bQtDS868yVPruE/S
 thMKM0y5pqhLQtweCJaJp3t08RPYHeLER7Esxj9pSr45yJ2SA8BlF+5LmH2lm2VSmq/c6O2PAxF
 nuFeJjF4l/UhpfWd9v9LNrmUDA1QtIPSLHmhqs8oThX62HP7RQz6Rjyk2WCGOCxLSYAO+xdcU4a
 cRskYS85bh7OyxFQpVTLGA1jczDtMQ==

To ensure correct handling of endianness in the QMI subsystem, the
QMI_DATA_LEN field used in host-side drivers remains in CPU-native byte
order. Remove unnecessary endianness conversions, considering that
QMI_DATA_LEN is always of type `u32` on the host. On the QMI wire
interface, however, its representation is variable and may use either 1 or
2 bytes.

Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
---
 drivers/soc/qcom/qmi_encdec.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/qcom/qmi_encdec.c b/drivers/soc/qcom/qmi_encdec.c
index 90a48fa7ecf4..b92af573e715 100644
--- a/drivers/soc/qcom/qmi_encdec.c
+++ b/drivers/soc/qcom/qmi_encdec.c
@@ -396,6 +396,7 @@ static int qmi_encode(const struct qmi_elem_info *ei_array, void *out_buf,
 			break;
 
 		case QMI_DATA_LEN:
+			memcpy(&data_len_value, buf_src, sizeof(u32));
 			data_len_sz = temp_ei->elem_size == sizeof(u8) ?
 					sizeof(u8) : sizeof(u16);
 			/* Check to avoid out of range buffer access */
@@ -406,13 +407,11 @@ static int qmi_encode(const struct qmi_elem_info *ei_array, void *out_buf,
 				return -ETOOSMALL;
 			}
 			if (data_len_sz == sizeof(u8)) {
-				val8 = *(u8 *)buf_src;
-				data_len_value = (u32)val8;
+				val8 = data_len_value;
 				rc = qmi_encode_basic_elem(buf_dst, &val8,
 							   1, data_len_sz);
 			} else {
-				val16 = *(u16 *)buf_src;
-				data_len_value = (u32)le16_to_cpu(val16);
+				val16 = data_len_value;
 				rc = qmi_encode_basic_elem(buf_dst, &val16,
 							   1, data_len_sz);
 			}
@@ -695,7 +694,6 @@ static int qmi_decode(const struct qmi_elem_info *ei_array, void *out_c_struct,
 	int rc;
 	u8 val8;
 	u16 val16;
-	u32 val32;
 
 	while (decoded_bytes < in_buf_len) {
 		if (dec_level >= 2 && temp_ei->data_type == QMI_EOTI)
@@ -743,8 +741,7 @@ static int qmi_decode(const struct qmi_elem_info *ei_array, void *out_c_struct,
 							   1, data_len_sz);
 				data_len_value = (u32)val16;
 			}
-			val32 = cpu_to_le32(data_len_value);
-			memcpy(buf_dst, &val32, sizeof(u32));
+			memcpy(buf_dst, &data_len_value, sizeof(u32));
 			temp_ei = temp_ei + 1;
 			buf_dst = out_c_struct + temp_ei->offset;
 			tlv_len -= data_len_sz;
-- 
2.43.0


