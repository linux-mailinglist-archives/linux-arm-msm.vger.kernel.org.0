Return-Path: <linux-arm-msm+bounces-60169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EC6ACD531
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 04:06:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37C7D3A5EAB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 02:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55FB6FC5;
	Wed,  4 Jun 2025 02:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="A4/FB6BK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011039.outbound.protection.outlook.com [52.101.125.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3CC23DE;
	Wed,  4 Jun 2025 02:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749002782; cv=fail; b=sEOFRxTO5oiXTuGQ4AKvIXWIJ2nDL0/Q3mdli43mFnLK46aNoO3SI0uaWZxjhamOBO3Z2OAFbfKhqwmR4mLx5ixZU4Pbfihmnkd4Vt+xTlKCONxhGaF5QJihPPtp0Qol+8kzpnc0nLOtUADCHk6ZHpFOVylBTwf7lnYZJn72qRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749002782; c=relaxed/simple;
	bh=qGwdUC+XzQQ8mX+uXIHSY+7eBADzwH58PHQuQY8cCmo=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=husdGI0d84rlgSACMBXM2C86m+HhIkAENGkG9enNPglBiheRyRcf64y8o3LkaNm8eWojTwGTGQ5yfl3MurKLmx37rPgxUfk2GmyvpUmyWQBnD9163QzwgRaEtYkOeaZv9aCJ/Bi6MH4jeCOTeuJXgFOMs8t7cZMGIZro2UzBiCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=A4/FB6BK; arc=fail smtp.client-ip=52.101.125.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSDkvybBC2CBCuD6yF9gNDJPbW9Iy9Uor3fvZw+Pe35gSAEp0MTlBZPsE/a6qpBvn4A2kJvXwguLeY6/RL74hBdGagb3t2iGgudrpjRwCa2vHVwqyzxZBeIYvNwqL/OZvgLQbjeYTMTsSFmGSPsN87Ln5Y48HMG5rxUwl6dLZsEW6DY5y8vKcsihb30pqkOg+AlrJFVSs2ak+BR1riejM3U3o4mf/mQNHff5fq5JiwJCphEzWtZiajR8fJqiq4my1g5yzdXUbxlGYmx0slX5WEqzgsVms/jN/bGY19ES2F+GehioHx487OrnCa8AZEqq8bu3UjFUGvTp42sS/Yen0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwxTa7VF4U5RW6obLCyY9Km8A+HIxA3L39esbxi1NU8=;
 b=CkJzucbdXQKNuT8uIGIGWB8CquP+kuPh2PbdS3vb/qVh8P9LK6UmiLK1MkKNkxIU87R20KZ0UFu7q+EnFsAic6m0p/0kdXHRqQ0lrClR0U6oGr2cTxcDu/SpSm75h+q4PcY/mY7/ezDBktxiwQKGJ153ltnpV4tFU7fJHkoZeKshnNz8UOYBTHfaKeheYVRdW0p2UiLyNluzMb+l4QnKqsBKq4qs/2pqDKooEiDtpnA7MOs9DoSdlo/3vjn9J7k4Ds+3E0VF0ky+9c4jzaSF02ndYBUwma4dkxavtzMvhPJkY5lIIT3HyPK0BD92MqWwvCQz7us6UYwwjUPcAo0Ahw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwxTa7VF4U5RW6obLCyY9Km8A+HIxA3L39esbxi1NU8=;
 b=A4/FB6BKpLnvGRKgKZDJg1fC6NV3YoNoTBGBLI9FbyOb7TDZOieG/wTMCCQ74c1+Y+X/R3A2rECxONyyjcli/UtELFV2pWKqEPRX0d/MQ09+5kq/Q/7Ifkk7cYtNWam9R/SOXy1rXBrMJznLrpO4OvhvlNgtlso6CcDyGbkrOXQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYVPR01MB11277.jpnprd01.prod.outlook.com
 (2603:1096:400:36c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Wed, 4 Jun
 2025 02:06:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.018; Wed, 4 Jun 2025
 02:06:15 +0000
Message-ID: <87bjr4uup4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
Subject: [PATCH v4 0/3] ASoC: remove component->id
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Jun 2025 02:06:15 +0000
X-ClientProxiedBy: TYCP301CA0090.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYVPR01MB11277:EE_
X-MS-Office365-Filtering-Correlation-Id: 889b7a35-5e68-47bf-c061-08dda30c630d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K8JEGXb0Jb9t/SW58J3qrbf145BKb194y/Sor1S73Qf6fo4a+n/0Hmd9TVL0?=
 =?us-ascii?Q?EqOoUiDKBsovrXa4MYTRD3Nh1QPMMh9tMeTbjXTMT5HNMdw2v6xs86oyuoSI?=
 =?us-ascii?Q?ogvKFAiDNUc7uz2DEECHsZW0JvZbofiBB7IPbrocwcnHHfsCnMpLxoQ0cu3L?=
 =?us-ascii?Q?QkeiYreVXoGUinnRcJ8RqadQjuvu5i6aNdbuHixifqdUPcDczofpdXa5roLJ?=
 =?us-ascii?Q?esOD5VaAo+eru8koombL8aRyfMO0Hl+XZi8z80FYNACvkRSzuGXGZmKdicdU?=
 =?us-ascii?Q?dBK2a+QxPlt7V/ElV1ga9FZ62tVmilBgR4DKZkLKa/Ros0M5iWadorkmaZa2?=
 =?us-ascii?Q?hP8SNUMBK0A3xtiqvERh1iGp71SGe1ypikWYEO5+3vwvU7UoQ4ttGR7ahSin?=
 =?us-ascii?Q?MFASwhhsgX/k+ZeiSjAod5ct8O/tVTB1SoQIbuB0YFTXh+xzgxAjaBUYaM2I?=
 =?us-ascii?Q?U41NcPUy9F+TZRCNAovOm4bl+Qi7B6+fHuhcJ8Hb5tfFWYXWld/UWCZ7s41C?=
 =?us-ascii?Q?gmEwaYPgNbHp5fDlQeXIlFTvrO6NX/1NCuysOKas5yby1qN1s6yoNsQUJGbw?=
 =?us-ascii?Q?zs5OzaqKMceszquBuYvesxbEcVhpOjv50aTneEDngp6ywfgz+Y/1h7ZiEV5A?=
 =?us-ascii?Q?6pUkbX11u4NNTVCwQ/ytndsyaU/gy9tlV6sV61yvQcCJmr0TTtUdsIKFVmtw?=
 =?us-ascii?Q?9DUknYpnup12i6SE8OrmzFCecx/4VcvKONZmLTSNIDVuPJdBDjN5rIa8fwWq?=
 =?us-ascii?Q?5xXaLD0+V5cqlEjaR0xtbQaXtLAN/MZ3zAgC6dSPH76P/ByICRUNzaXvNGUg?=
 =?us-ascii?Q?fKH4E+HALCKhjInQNVUomlOyxpkmr5PhapvnYghjUilZAVlXk50/mzhBXCij?=
 =?us-ascii?Q?agkX8be1Xq4vEaP81sYk0sLhAFMNXQDrbD253FpFJdldGip35rX6hziOJbOJ?=
 =?us-ascii?Q?NB8FAFstJCp2pfXpRCVPvDPQZFNhEAq8Ysrj2Bo782iVa5yEPgs53p9UZSV1?=
 =?us-ascii?Q?HjI7sRPlkCLtD9vafwTGc0EeAKS5dPt2VjNUeYWKysDvHknrnntKRFq3FPau?=
 =?us-ascii?Q?pswxZBqUtV1Id9jeiHwJ1bKxelJ5nQnK50ow7wiXCJiO/oHAQzj7I4ZP850W?=
 =?us-ascii?Q?iJIf4RvYh5SVFGkqixSsFjmH+Ee518eeVCSJZX/YSClFqZbw3xEpX5GblJAg?=
 =?us-ascii?Q?WG27q4p+lyRCBje9UwcJM6KKqlc2CPu5vduICMpxQ3KyU76u7ZC3mj/lkaV8?=
 =?us-ascii?Q?Rsv9MlAc2mTEbU+9SDibzjkwwJ77L+lb/pHMO7FhI8FwmDUpTQNHMcxgxhW0?=
 =?us-ascii?Q?mfQggQmvtUyxNRNmCI/gH+u9J+Lcwk778F/nTwwqp0G2kBTknznqxNT3jk6M?=
 =?us-ascii?Q?idU/N4ARSFfJawLGlOCxm8ilB2VYHmqyWmnZ3UeExoovFQRQF964r1ees2PR?=
 =?us-ascii?Q?j8Ek8n5cEqvQ+2ZphJT71GdAmhrw3BYn7q4OEry92p4VveyYJlK+RgtCHfqQ?=
 =?us-ascii?Q?I4tyoVwO5G1jPqc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eGbCtXdIS44sKTA1b9+SMO5/2G3PM2h63lm11eNeY7vzQ0WWYa3NAVhlSYsK?=
 =?us-ascii?Q?SuvksUjrXcgcnIBHmf3rH0FhQbbOuQtGL3bOs12ptfdHg+iaWjdz7KXhf8Em?=
 =?us-ascii?Q?m4NuG4+W8eB3J++cfUcVac4NrErQ7HoyHN8P8rV9/o5EtzxU+x9uEyh99Nk2?=
 =?us-ascii?Q?RSyMUDQlhAK2q4j3t4jxAYizR+SSkfu8MFhtJbns73MKHsQZtJaT5cx97MHn?=
 =?us-ascii?Q?OriIhO9Q6UJuljuyRNkR9W94iE+AvPINQ8uTYKEjmB1wG6fnHm7dKeERzOMw?=
 =?us-ascii?Q?pKln1l8DwR5vgJotnGxXGaMi4SbiB1P02LPYXJRmWQmZgD5HGZRPfVpPsVvJ?=
 =?us-ascii?Q?wVfgK9Ksl/262QJZuCGXVxQGQ+r2SdDAbd1+76kWD1pv6M56ZBP3SSnitt89?=
 =?us-ascii?Q?tdlM8OYM0Rfu3aIZRZj+PHOWYFQBHCCz0ZsId7crAFeCvsCHREXsV0wdxEQj?=
 =?us-ascii?Q?harViqf/QGeeIaXseWowB/qsmckqMDNEBRofuMRfrtbXuFwnbJdySgy3QRnc?=
 =?us-ascii?Q?2b7LgJWGGHCtlsvd2JD6AK58IW4UuRCxmjWmEBob4tPFGaIVCWEpiqSs3ehN?=
 =?us-ascii?Q?WoKYi5ol9oX5D4DLS3EFG0RHTV0iL9WX5eyF3CaJmMB8O5KJxWe1a//My8Ub?=
 =?us-ascii?Q?T4lAeXyxSbYN7JzzslQ9iz6WhwPQaMJbKPEHBwqqSiV0+h1Tf0UEI/9SaDEp?=
 =?us-ascii?Q?4EUVJggVWTDBShft1oCBjuvHeMc8heCi8e3+f9RTWxAJySnGKZ7OAPC3flcK?=
 =?us-ascii?Q?D1EaavZnHcWEtcjoCztA8cLwauXLIqADfa6YAxJmUWaY/CbsK2JFU+MWHET0?=
 =?us-ascii?Q?0z/JJDSy4ihMohRuW/T4pcUbPptUPBtDMu5KiFZpRaLTEEvryhUTuXUyzKtW?=
 =?us-ascii?Q?ZMrlz+T95xX/iNL4cAghyyk1zL8Lm/rQCyMd3Ktbecg1oUjWSRwnDvIMvboo?=
 =?us-ascii?Q?wzc2HZtksMTW3I1c6jlIr0jjrfZUu44mnFdxtvxg6MBGM9v5gd/sJyvlY5uw?=
 =?us-ascii?Q?bgNtus/vsDYuIlAx8OpOEINVWi4kmyLnzAwN/Z0jgFjZpeVzp4GTqFt6iTJ6?=
 =?us-ascii?Q?mU4kdyHiXZ8B5BzH+8yM5Jo/9/BcDSF2rn69iFbBwDqQ0FuqpxSyhnusy0OR?=
 =?us-ascii?Q?7ZgBwkRg3Z29bRnurAKUrnTbhadMykbAjf70hQZzaDEInZf8DZrixJGheMqC?=
 =?us-ascii?Q?3lBZR1v8EoiyH7GHZmLHNPr1GqPeu2jDcibMxUMNduYO7rPohoTDLHRwU9jP?=
 =?us-ascii?Q?j1QajDmkpOhhY/nIE1QdiLi902xql5RVwftfcA46JvKIFQABlQq8S3nBIcs1?=
 =?us-ascii?Q?MXY/MAhcddchG1tokvGKkpdP2WnkrBl9i+QIZl+YOLfArYXN8TwloMTGefef?=
 =?us-ascii?Q?Q3ibwD6JJhO7A/hrEUZp4Uwv11eTV2+WSzA9UKURN1zo04kCU/qqxU7VvWyv?=
 =?us-ascii?Q?B1oqXn0+IFfhEHZLidyZiBYye6XnKF6jTTM6cl3HC0TRgdgNYeg4uiV28Xo5?=
 =?us-ascii?Q?lIg9pqB3boKtTbFVWZyZsZ3L/+d6sZt6WhE9Xp5Jwv7wlpryJwLc7RE36FQj?=
 =?us-ascii?Q?NcJAgzjuapmY7azfpwmjL+CYtSnJdIVLWG4dd598dCpz7V8LUCQxFVYQCiY7?=
 =?us-ascii?Q?Xw=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 889b7a35-5e68-47bf-c061-08dda30c630d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 02:06:15.5340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SuBMb11s4+1fF5hHYhzU4H5u4C7j9/uUKbfUqMdHRfjoLMGZ8Nxxbh7ZPEY2itv0ODbMzkphxsEIvDAGKKyF2h359qCVMd8VcwzwxLOhfTLAq8iVpFI1JuOvACbmXSf9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11277


Hi Mark, Srinivas, Qcom members

snd_soc_component has "id", but no one is using it except Qcom. It is
initialized at snd_soc_component_initialize(), but Qcom overwrites it.

According to Srinivas, unfortunately, current Qcom lpass is broken.
But we can update it and then, avoid to use component->id.
Let's do it, and remove it.

v3 -> v4:
	- based on latest linus/master branch

v2 -> v3
	- add missing Signed-off-by to Qcom patch

v1 -> v2
	- Qcom driver code was updated to Srinivas's code.

Kuninori Morimoto (2):
  ASoC: soc-core: save ID if param was set in fmt_single_name()
  ASoC: remove component->id

Srinivas Kandagatla (1):
  ASoC: qcom: use drvdata instead of component to keep id

 include/sound/soc-component.h   |  1 -
 sound/soc/qcom/lpass-platform.c | 27 +++++++++++++++++----------
 sound/soc/soc-core.c            | 14 +++++++++-----
 3 files changed, 26 insertions(+), 16 deletions(-)

-- 
2.43.0


