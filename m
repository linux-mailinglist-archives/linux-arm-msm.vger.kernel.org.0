Return-Path: <linux-arm-msm+bounces-57206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 371BDAAF00B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 02:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A37B33BDC16
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 00:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC7413C695;
	Thu,  8 May 2025 00:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cJ8qvMHj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011002.outbound.protection.outlook.com [52.101.125.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377EC1C695;
	Thu,  8 May 2025 00:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746665182; cv=fail; b=AOvzLgrFVGnG4J1NmwQJBCnuYe6AMrF4IGkysLggUibJ+YzVwQHgY8CT42hnfF8KMHqCFNZWKYdMaPXTp90C0mRExtl3WVuz2TUBehPHccz9H+2XjEmpvWObLlVJ13TN+I7Wac02pfPWL9LgqiH94hKTN27OkZchh6m/2CPm9vQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746665182; c=relaxed/simple;
	bh=veeCoEQFfSokyMumxPgsYs+82nlvQ+pG0hejpKbDdhU=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VSzA+duzjaPwwNpV5VgtPbIkIs82gNqXBkehWqZH7GtRRtFP/QFme37r0HECWWK2V2+9PuMD7zyHLtsTv1Csn0hUtEl5V6q+8f+eRW2IYHkUgTAjmFtmYD6ofVPfrG5pVB+ba9AnpDi8vnFCEf12ryP4FTqe1wTi8NlzeMPhl00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cJ8qvMHj; arc=fail smtp.client-ip=52.101.125.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JwTRkqibbAoyXjjaRRx68FjDxP8Pyswlm53bEShkiPPDtYlmLxYyFjZcML8aJz5S4L/HfcdRgCct1aYta6w0GYEKusp+9m/uQ6rFM/QKv3Ogi714sDCNQPKYsccEnJgwueJTx2EPVq9KeUqtaoPfHKHnfLEe4PgHJ40MJA6I56ggGRjoTVK2npY139hX6oR5hX4ktURpvcJDv0p7v84DPyFWYKhzrz/4YZnfw/wZlxcuhq0YvdSkioyjmgE/9e3VH6RrxyojEclv9Ktg6pnkbCs7uGniJqEsk+t7HuqiLnbw4iDt+bUPBpVMoXC6snKURSKd0jp/oZckpQ5HtFyhkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrqxRQOlWmlKWz/hS2KESntjZJxW8gEnaOKKgLO1DfU=;
 b=U60aUwLxW17RjvNOlcwIX1S5SYc9OZvehUWnmDbDeVkT/V6iBaPehL3hoR4kmumb9AbwMIURlNZjgx5VTe6eu1B+Ke/QOifStLG70bLcCGHgGqQQcw5KeJWG4qi2mpnOXJxDMj+hxHMBcZUQtIjRi3PpwcfouMQeP/zx3E1Mh9kcsS5EOWrfH/5qMt82wayTth60H9wtJJmZ0g33Sq/JpdHtoyvE6Im+faHC4auVQHAPSxShdQEfTQdR60hyatXad7bdSrWk1eN1EBl+0AKNdcpjU97GC369n1XpyWOt7hEMp3BqwZe57+t54KGamXL2tMrYcsltvutbapQktl+cHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrqxRQOlWmlKWz/hS2KESntjZJxW8gEnaOKKgLO1DfU=;
 b=cJ8qvMHjII0zbcrIafJ5Hc5m3wXdJRsd2MdEf9h5dOr0RMsboqmDlAmNlWECMHv5r4GwhXGrLSBQ5lJF1heV+gpRFE43o1q+r3G/LOHTvC+nJuNRnoM0mFlzevPsSqXBsp1K/zP0MmgOJy60HF1GuF+zyMu705kRIQXPzbvqOXU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8616.jpnprd01.prod.outlook.com
 (2603:1096:400:139::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Thu, 8 May
 2025 00:46:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%7]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 00:46:16 +0000
Message-ID: <875xic2alk.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/3] ASoC: remove component->id
In-Reply-To: <87a57o2amc.wl-kuninori.morimoto.gx@renesas.com>
References: <87a57o2amc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 8 May 2025 00:46:15 +0000
X-ClientProxiedBy: TYCP301CA0034.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8616:EE_
X-MS-Office365-Filtering-Correlation-Id: 3207a641-2f14-431c-f062-08dd8dc9bd3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oc0wtLKVo32nnlK8B3MSQVODTMA2DKN9FzlTtjapijx253CciE65wUfqXLGh?=
 =?us-ascii?Q?mi3bRGMwW+s8I9KjaNC7DTpsYkNK1QTkmsG9R7k+gGGC5G5fLa+Ud50lOXeO?=
 =?us-ascii?Q?mAishwwsOKUklJ4ZzvXGcBll4DtJEK/DiSrOFgnkP6Lq86YxCWrsGAOXDWxQ?=
 =?us-ascii?Q?G3uZXDygwCmM35we/rgIbzhr/vi+oIzTO9j+lKf+Qx45Vc8/m7xSYpnhWk1r?=
 =?us-ascii?Q?N49rADQzBdu0IuzN3LQQBxBhO/8oR0vPv1DR+Q+L9X6yP2rr+GY8ako7NNwm?=
 =?us-ascii?Q?0oTX+yVud7Rk1tz3LzQwsVuZjHA6dk+X55uvn+1aeEhhfKOnNBFHAtiHwgR8?=
 =?us-ascii?Q?/SqzGmqS4ADf7AfJ55rdp0lOu6/wIHO86bWkZBjCPqBeM5ch19tcaToa+c0Y?=
 =?us-ascii?Q?nszGx/icIJMHUVJpsfzgfcvidmboT057Cq0B1c6DtRn+BF9DoVXYUjxYQ8ys?=
 =?us-ascii?Q?TmVGKbs6hK1Atr+c7WMcXbn+IAP6c5f0eCuqPcUdN+xyHR+g8YGBKsjVF8Fk?=
 =?us-ascii?Q?UGgwpl00ZvBn/aBkrUEOOwvRCS5wg2UJrwb2vSC4YCADtAuXI6c4wVdNkucv?=
 =?us-ascii?Q?xHuYK0E91ySGDtdfiGFA+ottW8Drh4vkGrvHCil+4nHCl/rrcT2nURLz+oQ7?=
 =?us-ascii?Q?JTpyeFj7yi5pLUnQXT3TxHOyRZrsmlkuEeMwmGTHQj6+mHXPr9xE3E64JOFG?=
 =?us-ascii?Q?Gz5heU0139dqVLBgPfC4INsYMvWddKRQaOEMhrpnUES/16asZtmyAyNqMtjK?=
 =?us-ascii?Q?UHxLNoiqOohyTjtSW6Ca+ledMxdgMfygIsh8RfRXESQUUK2dtmtckQSlUYp/?=
 =?us-ascii?Q?HZR6v6HZoAmTeV9IR2i7XfazS76ceAyrN733GXRqgz5+fplkCI66VE77SPHQ?=
 =?us-ascii?Q?enlZ7hOE9YhYH8zLR+4MYM4JqLJM62Vvzmfy9mKUuSwZR0Ha4FpBK1/N6YMv?=
 =?us-ascii?Q?2teTV37mbKjKZYCWMaF/3vJgpDfAGsfnxjmX66+ZKA5ZoQyMGOigDqL7xk/O?=
 =?us-ascii?Q?+gsNWRBvu0H+dNr9zMmEDh+aGfzGT6sbeobSXniUi8PGt97QpWG1yo5lQ5Hb?=
 =?us-ascii?Q?fW9idqbhnM6TVPPpWfkfdntBGTc8o+VoS9OD/s4Y9FV7LlydrBecmZgvHgNK?=
 =?us-ascii?Q?74vXY12kt6STXVIWOvYxBoXBqAGa/kmkOc7+sKlOJOCerGqhy7bIqaW7Cm/L?=
 =?us-ascii?Q?7n63+sgnAz6n4vXEw9wyKM0aEMOjSrV+GGfej21F7KLwHots8QG/NUqZ489p?=
 =?us-ascii?Q?+zHnee/GGz8mPg0xNtJRf7VqB+wLhbaIWxvOnB7aLSagMHJbBtstz5rlP4H4?=
 =?us-ascii?Q?oHQlsj0vQuBY3esmrMc8zJ5MQcF0b46ghtBwJC42xrKwNHymO946CUHr3XC1?=
 =?us-ascii?Q?151A9c42L/r83zRSR0ObstQd1iA/ACWXsR3/pF+hiF/5PTAwQyni4lwfJFRO?=
 =?us-ascii?Q?zIa9MvqSRIE+QkN/Z62l5cvFrFL+5Sv3TsNNsYIHkKan5B5ojMqiew=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0JKYC9UhS6cmGO36qeCR2c/JMmYdOptiIkdjD/Ogg1Ww3K4fwPxhoOuQm154?=
 =?us-ascii?Q?UN6rHGmecjkvffpjoty8MJQUoXiov7jWMgbs3MW7mpH/92K8JDL3XkPTZC5P?=
 =?us-ascii?Q?dBvGNoec5mX8gnGeHL6BW21vN1o7R9l+QXCYW5rCpgJnJMRVVKp7HAvYfWL4?=
 =?us-ascii?Q?5Mr2xKns3ML/V2yvvSN8wZo0X/zUO4HTo8ZDeU0aGkkT+38UnRa4DNvaXqC/?=
 =?us-ascii?Q?4XRO+cKo7u+98roq32eEUHjsVInZJ8K4WRRWGybQ6h2yHsgGakZl8LDYouzN?=
 =?us-ascii?Q?J3u3iKipGW1vkJhHaq9n60cd4FhdrhjIACrtR5N3g9y/QKQyF6VNKRnIhwn+?=
 =?us-ascii?Q?35FprjKoJ2KgLIWDohCJTFDEVRJvtqf6Nf7Hbmmid2U1lCwisW0N6TxsFUds?=
 =?us-ascii?Q?c8SIY2ut7SusPFT81ZQZ817ypEuslvlwkjgGhAmuA85oU5qX1EgTcH6HwoUB?=
 =?us-ascii?Q?5ZXV9dve73AZ+i5nCDiVc60UWn+Odq3ITI2vk3ZQgK5C8tn9so7LPvp9GKtE?=
 =?us-ascii?Q?0O6yrIOnD8I2dqYyqWKiHrsAq8vXW/hwZgrBnSVO7VmoAc+m5LD5xW0DwuED?=
 =?us-ascii?Q?HwEL7fElUC0m3cEnKHH/NgkyiqagigTKYKr4q4jv14brB+Vgl4x3nbvmO8nn?=
 =?us-ascii?Q?hy4z2RW4DePMX1eoczSCAZNU3ce/UshwpsXQWwPMiwPRHzxgxjMHx/gQioOs?=
 =?us-ascii?Q?pBQwva2oErYwn3eceybIknBdKVZFXnJt6UJM0uHWFIm85Ih4C6fhqFdKCd6g?=
 =?us-ascii?Q?wD94drS/tQY9z5yhw1b6w/tCppBuBr2F+0IQDU/1z0D7eGSdL8hOzUf/Tlfv?=
 =?us-ascii?Q?RX7KQ2O4Ht9cbwS4tBSauLker+i76EEgB3n9MHF3vuZay0GgkqmRDUq1QAYM?=
 =?us-ascii?Q?tVH0SePapDXkiu7pvkaOoVmOGmsJVmJEe4y64ISJtndryViyXBtEF/sxg7H0?=
 =?us-ascii?Q?+C61+aF0cs/V2ubOlg1Yn6IxdrbBrEyP5YEzyuLIT94OjKza/NueN4qOlL39?=
 =?us-ascii?Q?HNV2A55eR2D4ZizILzqXjYomdUX6/2OTWrcAWaDQWDM7TWA4hghv7++AllZU?=
 =?us-ascii?Q?EIOckeqANq+5QGQRAjrVbP/KjtdfbItjvmMYMlG1kkVh0GmRNh3pvolfXU1p?=
 =?us-ascii?Q?A2kXxtlIh83TkNHgMVXIvHbBs+OoWzL8oJzc2+UP9pq3G7B9i+RGChlc/REE?=
 =?us-ascii?Q?++D7pl4Ez2uPpifsc98t4BGdi9yFpQe/NyodclyU21dMoD1nfO9oogPoQn7m?=
 =?us-ascii?Q?OLhoTD1bw0bbOagC/K6cvzIyzDC2bUYGdcVsIajjO9aOpJue63ie8zcdxaA2?=
 =?us-ascii?Q?5Ltzzxkkzm3kbkpufyVrCzvx8gBoiK1qenm5+EpFgEqMtz93C63B0ArplIJU?=
 =?us-ascii?Q?5YzFGZ9RyXDDBr8V9UMWH64UilTLd0uGZlYujSbqCFEoQH01W5o2zbSpjL06?=
 =?us-ascii?Q?Gz37qUQZYS4dTHRZ5gSRQWpBtsTXAvhaIa9JVCVN/io7YJtNYNWN9Rq2I/41?=
 =?us-ascii?Q?1pclI3R0AU3y7Guei5pSJSmpFSL3igOfjqpx+SN/8hJel/AWK+HnC8bWIPBx?=
 =?us-ascii?Q?TELEUK3B8E9K3Hg3YCnYltsL3NKpQKS0NXrluW1K7tsuWLq8vnFJfvTd/tLP?=
 =?us-ascii?Q?f5mDtyXiRjkp20JKAWMT9UY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3207a641-2f14-431c-f062-08dd8dc9bd3a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 00:46:16.0310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nspYRlnvuHeP/6PQNb212wDFgedelNGZuIC+0sykFM7l/W+tF3lNxtJRp21Ouno7bOBPJ0k8Vy8Cin98KyfBY6JH37Bz9RVXsStoC+uYrAqzLWFadJSR/L7BkcmYweVg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8616

No one is using component->id.
One idea is we can re-use it as serial number for component.
But we have no usage, so far. Let's just remove it for now.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 1 -
 sound/soc/soc-core.c          | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 61534ac0edd1..2caa807c6249 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -206,7 +206,6 @@ struct snd_soc_component_driver {
 
 struct snd_soc_component {
 	const char *name;
-	int id;
 	const char *name_prefix;
 	struct device *dev;
 	struct snd_soc_card *card;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 80569209ce05..39ecf0123a44 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2835,7 +2835,7 @@ int snd_soc_component_initialize(struct snd_soc_component *component,
 	mutex_init(&component->io_mutex);
 
 	if (!component->name) {
-		component->name = fmt_single_name(dev, &component->id);
+		component->name = fmt_single_name(dev, NULL);
 		if (!component->name) {
 			dev_err(dev, "ASoC: Failed to allocate name\n");
 			return -ENOMEM;
-- 
2.43.0


