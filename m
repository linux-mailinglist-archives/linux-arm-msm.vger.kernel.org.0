Return-Path: <linux-arm-msm+bounces-71077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA16B395FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 09:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5708365074
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 07:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1FC277C95;
	Thu, 28 Aug 2025 07:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="TwhPEjk2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013070.outbound.protection.outlook.com [40.107.44.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0EBF9D6;
	Thu, 28 Aug 2025 07:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756367662; cv=fail; b=s8xZsmR0Ho6hsZha786OKakU/Fbt6EifF1GV96fzgkD2zeKx9NxdK5K6DDJtVerwKDefzKPK5+XidnD1pUPQhIOaGlUPyRfWA44dyUFk8E645h+ZPQ/pdqrc6knYeZ30gbonVVimBSDUTy3chNzAQWbAEXPskTxcWgVThW4aod4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756367662; c=relaxed/simple;
	bh=I5IU5YUleiZmek9svg2qUT8Lx8hJ88vQqORPUsLzTTM=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=GaIGe0mjTV9QwTqiQ5LLzfHhJtN5Qfyo294FCe3Xv270g3+7aVX9pKKvDJDysCbqR/3ue5/d+spRISaIAWMGix9d40Nh+QIN+d9M4kO9Z06NfB6hkUTWnk+hKM+9Ld045hLrw+KNXcJ9Hsrocea1CSyQzXe4Y+FxStJ22qbgUys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=TwhPEjk2; arc=fail smtp.client-ip=40.107.44.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QqG1yqSUVqxyFClcrxn35k98bBFkhNrU+B8BCNv6371EO15gpHAfYZKO5KqO+CaKUB2EAzyY4DAXYFz0qdj2MQtGnLPI+vRcFrXMCYAYcOI5Vc0tQtCBcNbUwg33iIbp3+bIGPeFc+RDj8v/683KweFh9UXlGblsOBOpyLtWkjBXQqTvTkmwFQBzJ24aIXaEpUfUy38O6nIUjVJbykfY6sEyfMBCPM7VRfmqgXPbqkuJMkzk0bizEe1S+3mHQJRwn9edOyYlUiZ4LNgS+3C1oeRx6XYkcKOl0/pPAOR0CztR7PQMzTT44Oc2tQkMjHmt726AGpugb7469QbkL6bJMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4zNxPmAW7LuY35Eee/qWnz/ns7qpd2R+vve7a5Fqio=;
 b=LCSXE0U6lk1vpjdGUtMHjMY/qRsXs+MW+oMF5QeHXP2Gln9PCgoZ+QL5lnLfBP8qCmYxiYxpfe740ltyTWwwB3rAAnIQAMQgOkx6kbVN8iWNiIqhi3N7nasofMLolkHfDfTnKEyuJqFLG8aVIx5sZwvyVG+d1AxYZL21D+K6Tqn7x8aL64EGfTlkXGPTiXEtoUmOiJHEHU1iDLMLQPhpxuj/H8QSr+ZGNS3p7Du5Xqu5X+w19gT57XYPVoK3HBUmjbZujmQU+G5As8kmvaIt1xWu0kt0MW35O/aFogjW6TJRu9Sx1skQxe1yasuMt8rkYSHkuCw5OfuZo0CyDu6+4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4zNxPmAW7LuY35Eee/qWnz/ns7qpd2R+vve7a5Fqio=;
 b=TwhPEjk28w7U7xFzxY1G5GHh5XJCeND23DeaOfGmP6Bc/+EpbQkeDActDVuy6zmPKzJQTVpVC45sAzXbhM8Zhfe13VdV5Xv34sPgQWUbHTpWPuklax0RnwQ2rJ4XJmBUV9ValgghKh2vrkC5z8fvkQsBUR/jFV4gJ/BTWLcBt9bo864JzambVZnjolbWD6BGt8f5N4ujNYR6fWCCUQSz23TFNkrbni1T2SE/S0eXmG/jRYo+MBVb5FQj2aXZRDXW+ThgpUjLAT2/sfFLzBDXtXHWs6rDSCoTLdcCZ0d0vEJp9dD3pIjOVfw80UeLO99YdM3hnv620HHjQ8Zf0yD4ZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 KL1PR06MB7035.apcprd06.prod.outlook.com (2603:1096:820:11b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Thu, 28 Aug
 2025 07:54:17 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 07:54:17 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Ingo Molnar <mingo@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org (open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-msm@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS)
Subject: [PATCH 0/3] ASoC: use int type to store negative error codes
Date: Thu, 28 Aug 2025 15:53:56 +0800
Message-Id: <20250828075406.386208-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0019.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::13) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|KL1PR06MB7035:EE_
X-MS-Office365-Filtering-Correlation-Id: c68b0fd8-965b-4331-5ca6-08dde6081691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VyAk6uBbsNX0onYcisvdcoo+vqMJlA3P2TAh0+nSqV6eTNMwitTBLc1PfdCe?=
 =?us-ascii?Q?3QDm9r27OaIvX8udtmzJAzUVIuXq9WdLPoLONdwPRjpSOeKLW1NgqC0qQtG2?=
 =?us-ascii?Q?ExTdUJTpbRwwZNsvq68RheY302lCXpehp1Qbn7yiWrrOY9VaJVOrwwA7D/sy?=
 =?us-ascii?Q?S1mvd7xnaxkmcO9RLPOJwXb89U1C6AXBGJEBQx0vb+t96fR6k8IHDzcmA16B?=
 =?us-ascii?Q?J0d1X0JyPM6pcpNPdXxYrQ14qWH8AtFehR6y3KaCeo3Tp5iM+3voZEL31+6P?=
 =?us-ascii?Q?V2WZFB4gtfQLLt4jxBmgtk9IyZZke8bv+WnT0+RLKFur2UZ3AtQ1enmMoaIo?=
 =?us-ascii?Q?fbC+7bXY1GXRIagO/VcG7gR6tIE16Oh7AQi5FCz6+V3e6JVThMgSSnfe+IdS?=
 =?us-ascii?Q?uZfkOr4L6x08JP/nWhhHOyEwYruFE47SQZpo8H+vEahqxs8trqjdNPhcP4Kp?=
 =?us-ascii?Q?a8ysx/uTLVKf+jI52xQ7PKDjxQbrgAAaanMCvQQDMX9TuhTARTTurdbgjx8n?=
 =?us-ascii?Q?wRnRKQt7h8WaeWFEys2ZRLDCw5Ktozxq73BQWSgmWKfh8ak930I9P7Sb+zeN?=
 =?us-ascii?Q?JjbQiD0jVYOfwk3802DH7TPrekUj7bDxTpTenofNfQQ/UzOOmAf9vpG020tV?=
 =?us-ascii?Q?ihOb+yJmJO/2P4u5IZYeBYcgbUY5O9O++Bt4EXKRHvNmO68H8a+32oIwtn+i?=
 =?us-ascii?Q?A+NLR3XrfaAilP4LQqbJ3wUiT21y0mZ5LODVkG9Nnk1Re1II9tbogjA7Mq8L?=
 =?us-ascii?Q?r41QrrtSAL2+Agrq2QWGQeLThrw62UZSgPwnq1b9XFgPSefQTvhHXJS+0Jnh?=
 =?us-ascii?Q?gRuANd7SIAxGIXOawGRLnajzmWlgUf4sSXUMi1L66jpZ4ofHROUYC0wnHwb8?=
 =?us-ascii?Q?8JRphTGKYbhPm4SS5wXzYxSeu1FN4vzOOlcaATXN2TKte/AQt5+nWT8SHiQU?=
 =?us-ascii?Q?gLBDagZHCWj5WROtl/un1TEwcXbsOq65vUhcK1XuHH3mKot9zRmFEtkTKDr1?=
 =?us-ascii?Q?f6mxXfCkqN5eJ2nbtFNilsqm6VbxWc2vtdY0ySXIw4Fxt4O/u6UURyrXenha?=
 =?us-ascii?Q?avTuJSXArRB5zTKoVdvGOKmquw2cX7Bv7Y9WJYq9E+KgGn4RbyEZPS+BM2wE?=
 =?us-ascii?Q?9xdLUJdw+tyd9S+mOpcLD1k3t3pCNjFzGlVR8/XlmB3w+Qoq+cylskBQwEIH?=
 =?us-ascii?Q?BVlC+xoKif9FDMSHnOLuEhlJa8oDchoybtvziHRNCW72WpKYxiRJ7pKVIaE6?=
 =?us-ascii?Q?lDUkIHFAg8TKanbcxztFrI1N9irzdhZVm1WXJqbqSHpe0QzM6QhctzICm4NX?=
 =?us-ascii?Q?gyUr93B5uJ6LyRnjylfR+bmMHPBu0cvR7vFDY3m3cf4JcBPcf5v5EwB3AbhM?=
 =?us-ascii?Q?1ykKWAFAACCZH2TNA4m6ZGqaclaOdaRDA30KIzYjp69IEE7+L5SuycaKFweb?=
 =?us-ascii?Q?YbWygS1Hl2R6E3Bv/LMKp2A6FzaYHocmryymN6Okzh8HgCUsynz/6x2STscE?=
 =?us-ascii?Q?4lmqh7EieVCR5Rk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DBhRug4QKvZVGnXR9LNMYb94eYvUF3kATxlceU6Gta0lsVD0nYaP2lPr+9AZ?=
 =?us-ascii?Q?/bKnbJjyg/eme5PmeGWH7F6u0EPGVaziqmhJWMqh0xYCpnm6w9u0EWH+lu37?=
 =?us-ascii?Q?9v5tDKPGSQS6squ/LKZjajSuCYwLekZngGsdmEcOqdzHom7BllHGkV23z0+M?=
 =?us-ascii?Q?V60LDMC6pzIv9KfgjKOWBJl+ThtSrq92fsRkNOqGSBYfjjj2iqGBjlW7JpHr?=
 =?us-ascii?Q?0mA3byNxjwXGyVzyQm98FwdfmAHCe/sBpMpVCbMm00QiBgpe9TpFsClsYZkP?=
 =?us-ascii?Q?KwrMWNsc3uJljz+80D+L17MICSOW1lqzhr4J8tkS/ZRzYAeOcXkOGsHJ/2mm?=
 =?us-ascii?Q?vEYJqJikvW4BsS+u3Z8sXuPhQTPIE73WGDv51GJn16LEU6Ml7kDRsNHV0SfA?=
 =?us-ascii?Q?Q9XtwWdFw3NzMTEKX1B9C5ujdsMPvBf5EbNsGxJwVzDFlhaqXPDDwZQ7eyHt?=
 =?us-ascii?Q?hoq5QsQzRs4dlBupmMh8JJrFgW1jMMZbZaAhEEyO8aSDUxjfcW12nKCDowCJ?=
 =?us-ascii?Q?Z74SRtswLyuYn4oZnB8mN998wZyjGGedwNGgFyumKb3w+Jyzvs0QENIoOhvx?=
 =?us-ascii?Q?99AlfboyK6RDZju2FVTjqxC/aS/njRrFueErtQ94nUBZXjBnEcewLnffi+0e?=
 =?us-ascii?Q?lV7Dvx7chwxU7CU6sJaPCIaLxWFQ68TIUtvPTxymzt2fk0SwCPtWOlaUurH0?=
 =?us-ascii?Q?bvqXXyZc5Tj6F8Tij3wcQ1jxLzvHWUWBIU08KBrzXWnvB8JKDT3LVZgVpdcU?=
 =?us-ascii?Q?9odDrgnkz3zbVBuXD++EI6w5y0Aymqy73Y0ABH697nw0S26Qj4nN6iUYRf6E?=
 =?us-ascii?Q?dRedXJ1vFm5YWHLmpqz5b7CYqk4EmYgwtmPxQEu7T9+NY4lj6hjob1sc2bWd?=
 =?us-ascii?Q?XVuQDcbXcNarGzEbbq1YEgcvadqtSwePZPF+e62TufUirVOeh6qEEqkPnm8m?=
 =?us-ascii?Q?0jzmfMxk7M/6WNecTSD9ZERtg8d9uwaT47oNJXfogP64XUIaS0IJfor9JnXY?=
 =?us-ascii?Q?zAM7u3dSxg8Le66VU5C1QrlQFV/ZKbPX8+iyfC0UYOL7nfiwpCxBlXcY+cbs?=
 =?us-ascii?Q?qZMIvHFrqpw/S/WFpMMjG3xvq1B8v7w5ABil4B4qcSkzF2tzjhjFm+ZWiJja?=
 =?us-ascii?Q?PpDsyIFsPLkpK7h1BQuos+QxgdXAX2qrEPyTqO2A0OnF7d5kmfU+2dGK+qPe?=
 =?us-ascii?Q?/h/PGyGWSlXit1qK2p2sr5qioIfE0vo8+81mxaR9FbfWWIfrmWqmfF3a2ACv?=
 =?us-ascii?Q?sfUfIsvF4dyQ2vz8OVOfVXRecX0nCb0cwrfLcphWqlFLwqi2I1dqmpX2PgNw?=
 =?us-ascii?Q?MzDdHWuG0sRoQ756ZbuG/si7LHiNjjbLXxSZUIkEXojlJnR+sgPa/GJ8bkGO?=
 =?us-ascii?Q?F2Cw+upbkhyGfG/LQgT76E+eKCR3qVdkki1lj/XwXwki4mPhCh5BQkcYSId+?=
 =?us-ascii?Q?ECHDkQ0r19vOhcIg4BQ7+v9zWcV4qgf4WyRSkZ9yLHjFHAn41GclvkG9E0r3?=
 =?us-ascii?Q?BalqXv2yuF5G8qArZ1EDpoOPs/EvPTAwjPjEISxOkdLkGbw4F+lXnS7Yd17g?=
 =?us-ascii?Q?fAfKTYadQcxcEZaaWwmrHzxiVDR1nO72OLqv6jVG?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c68b0fd8-965b-4331-5ca6-08dde6081691
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 07:54:17.2647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pWJjwIiAtkDe6RmOrsvIf63pTi6HuvkeKZgcR0HC5ll+qgWtjgLb8ReqsmRkVdbZaPmAQcIWanNOFfkBpAXOPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB7035

The 'ret' variable usually is used to store returns from some functions,
which return either zero on success or negative error codes on failure.

Storing the negative error codes in unsigned type, doesn't cause an issue
at runtime but it's ugly as pants.  Additionally, assigning negative error
codes to unsigned type may trigger a GCC warning when the -Wsign-conversion
flag is enabled.

Change "ret" from u32/unsigned int to int type.  No effect on runtime.

Qianfeng Rong (3):
  ASoC: amd: use int type to store negative error codes
  ASoC: adau1977: use int type to store negative error codes
  ASoC: qcom: use int type to store negative error codes

 sound/soc/amd/acp/acp-rembrandt.c | 2 +-
 sound/soc/amd/raven/acp3x-i2s.c   | 3 ++-
 sound/soc/amd/vangogh/acp5x-i2s.c | 3 ++-
 sound/soc/codecs/adau1977.c       | 2 +-
 sound/soc/qcom/lpass-cdc-dma.c    | 3 ++-
 sound/soc/qcom/lpass-hdmi.c       | 2 +-
 6 files changed, 9 insertions(+), 6 deletions(-)

-- 
2.34.1


