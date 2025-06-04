Return-Path: <linux-arm-msm+bounces-60172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46155ACD535
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 04:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 029E11775CF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 02:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E871862A;
	Wed,  4 Jun 2025 02:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nizVz9qK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011042.outbound.protection.outlook.com [52.101.125.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECFBE555;
	Wed,  4 Jun 2025 02:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749002846; cv=fail; b=dU42FZL+Wuu03DhZy0GvJvjE+v7yuFW+TT7EEiGKn/aEQehzz9eSlj3jYGaio3pP4L67MxJD8BTa8oAEAQMZZ94xnYQ6XOUVnJuMD2tpyG9nKZflJXo1EDYkZFbYVe1lshPJNs6ymar/Zc1gK6w9rzP/HbqvRBPHProyqV0LbRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749002846; c=relaxed/simple;
	bh=wx569pLFve9GKtw3ABS4VVPexyUKNsR1EYviNNQ1kuw=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=AKfRuBNC/rS+7iubYMpHEyVY3/t2FOcql9JHoIA4d1KD5KH3RmcjUE9l+eHw0oEWBZDWtHDISOcFlvLFJgamUi4MHDt4HWXuuK/LKoeG6mHh7rBLEkJ7TwR614WsHjOAmR38F2e+DscIPV6SnRYxFhgxoennkzxTsNOQ73HqXJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nizVz9qK; arc=fail smtp.client-ip=52.101.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LSX1O4ZYuhhIKpaTqvGSQAOGPPCFV1rqbEuAKsc2ugu/aNcO2STjqCcna3q6eP+fOU44s5ONv3wct4FthVXffDZaSgHiKcJ1YUh/1aeTHzrTypQB2PEN9Rndazu43W289ipjwLJ8Y6IBO6jVA0WeYyyWI7L+3+0fNXWy+Gn4BDIBdR3esQx97al0uzzDahhLb/SVpvA/XQ8CTIVrZWwcmry/dTFKa/k/CWbYaqw8lfU1XvEd3dM08mgFmp5ezTNPdzmN6mIuSfHPh4SJ6CxbZp8ixrKJn6vPocaJjMNcsa52LbwC1NmkHrRYEBhYZo+0wBjJOJkyqQaY1o9Qpl4TuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fMJFROy8CVQBr6OwiQuB9HGFvtwGkzvIqvQliYvV7c=;
 b=e6aG8LdsdB7ZqokceI6pDh/SC+e6lxpmnM0GFlC848wluiOc4niJ3MA1TXFHlc7/MtQMvISrKlb0htrylp6xFdUGGvAvGi5XwpnEJcBgpyD23wjhaKQZlU4fKaI7NI28sbvgK3n0lHqL+buyivjPstRGtbPtXDhhDiGRjIudVQa+Lk0c92IWbt9bARk0ccn76Z29mJNVVVyeOkXcdKhKPUbqXB2DXwJJdXEfAL+VElWDHvnXNTXgcJ+JnubcIFTHIqG7YLLJ5x2+gAhI474sXH03vNTDa0lyPFUPzKsba7zThhquFs2rkwDNUye8BtC/IOuIIaGokQo86wzXL/i77g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fMJFROy8CVQBr6OwiQuB9HGFvtwGkzvIqvQliYvV7c=;
 b=nizVz9qKap4CxLKHHWfIMMVBt+0PbXIlW9EZDpQam/WpN/IkCZ+FqKudB9UFpXf0guSTyzctEjL4FeP5HTYNSidvgRxzDDb4KSYCjBez79Wzl5ujae3233dot7/KT8wNcQMaOEJQaGDzwKsQYb3mzSSNNxhPKODP1WPZlAbDS84=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYVPR01MB11277.jpnprd01.prod.outlook.com
 (2603:1096:400:36c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Wed, 4 Jun
 2025 02:07:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.018; Wed, 4 Jun 2025
 02:07:22 +0000
Message-ID: <877c1suuna.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 3/3] ASoC: remove component->id
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87bjr4uup4.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjr4uup4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Jun 2025 02:07:22 +0000
X-ClientProxiedBy: TY4P301CA0009.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYVPR01MB11277:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ae5e344-7c31-45d7-f3c9-08dda30c8af3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JZpoy4gTz3DKER2rvHOTVaC5sKdRw2xR65igS0IebzC8JeXXYEk+LmPiZtMO?=
 =?us-ascii?Q?SqdGuh67O2Y88iQXEpk9JnkKk6oyaa6YL/eCF7sGMpNaJ+GlkMOeNTQUKXgz?=
 =?us-ascii?Q?TWoKHL2JG4UNU6qHevaYJPag85CMLMVGUga2NTJi5Mild7gOla3K3KBY+jfn?=
 =?us-ascii?Q?xJTWgOEFUYbgiJKN/aTBQU9g8QT4YwtZbwQ1v82po/pjouucetRMYNcKAXjX?=
 =?us-ascii?Q?38wzqbAnOiaUcOom2n1Uu6yQ4phmvbUEPkvXa6v9wzqUM8TmSR8W8VPOAnLP?=
 =?us-ascii?Q?mdAFWx5q9thuILjA5uRn6htWLW5Y4htDIpsfLwi3bIdfMaOl1Wx+sQA9qsPn?=
 =?us-ascii?Q?Ww6K8H5Ea00ZKV5dZaQaczDDC+VQhJlnqPPrzEYcQD4sQqpCRL/0jeYD3AoA?=
 =?us-ascii?Q?mIh7IMqqRVdU/nVXY+CX+qgv8xA+dJ7fyuKgyqmeQMH5Lth9HgxGmquLWyxq?=
 =?us-ascii?Q?wO+AGgVOlRl7M+DBozCjT+Es62R1TcIDUaD+VqTgYLL4KpmSmYYFazDZPl2C?=
 =?us-ascii?Q?JLLvwhH3EqpdkBGkrR5zFLkKq/F2SLVTYi3ET2fUJxIUEpm6CbAAdQ2owL/A?=
 =?us-ascii?Q?CrAEtb5CHjh8Ro/jQ2tv7/iwDvXQXOapZTpwSripdyzPlZar7oJjpelzz7Of?=
 =?us-ascii?Q?aSTQIfKywXThWcs3x+vJomTPzxsMSnD00ttr9biBB4zJZ5umqTN7RsGO/cHI?=
 =?us-ascii?Q?Nwt758nllxxAO8n8RKOUZvcQoXIAUsUyfWowSLSWgMHBo47KX8XYdEa1lFWl?=
 =?us-ascii?Q?y7K7S1oJ/Dgwnmkmj60DbhpVPfNeB6T5EnaLeEEW6C2IBzdq/fJ3c+eRKJpO?=
 =?us-ascii?Q?aCXxk5E8dKuDJlQDhgLThI4/lpDuOVjzeGvT+Xq5gGuc4Ti/Zn3dml2OWGTK?=
 =?us-ascii?Q?C4UUuxKZ9i3uwB+V1EC5rB+NbRzG6ou9NeSlwarr65WqfyPGQLFWfhVdh5/3?=
 =?us-ascii?Q?tlk/U1Dky65KQTpLe2Til/gzJJIgF+QyUA94mdoc0oyZAPiASxL40knEfBWo?=
 =?us-ascii?Q?xIihCxVo5+iiy8ICVYDLrAfITihiHEFxoUa3o27TsUiN3JC7e9csihasEoN1?=
 =?us-ascii?Q?hmuce0TUrwwDsJAYXqOlb+drzfIeSEenV21oCOcaxmdAdKLts0eTby5CGH2+?=
 =?us-ascii?Q?3RTWlPQBi/NWX5kyYIVIUXNMJ1x42IJR3JFowIEhO2yGa1efLTi0S2caBVyk?=
 =?us-ascii?Q?dX/fUmVJ0ciELpYHyazKRtGvXv3lyVHh1QOaYxfCRwRRpQlDB9wpB6M4rg/V?=
 =?us-ascii?Q?1tpmgdbMuH1R/Vp2eWUC8RST8XMrg+Mm0xyGxbfURPnjrrfptW0f1qkulm+6?=
 =?us-ascii?Q?kruMqaY0OGmolBbzUo988AYCGyEPHcJkqiknxToJYDDUJ9zRwAzYsSAqyp8Y?=
 =?us-ascii?Q?eTTb9S8RjoHdz3gPwmqSUi22FX0sUJrWPRJQ5wo8l2s6rFjFeD/mcwuX19Pu?=
 =?us-ascii?Q?wpxiC7zBWDtv1rT/CJOKIcuMVlj2ae7EHheMX1ojFWrtZvXw3Zd28Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tzxF6Whx6pIMRoBIQY8lsPR6uHwouA29MgHc6yl0Qj0Rq4KcjUPzqJIxxeZq?=
 =?us-ascii?Q?ImOX3xfA4ZfkGyo0rB7zTAUpsaYn1aIxTvzTeECbl6hkDEZVgFz7bCXxbX8c?=
 =?us-ascii?Q?omLb/zeELC8DeTRCt1ffaPX4WJKxmUJ8HasNaayGszRomGrWigy3JG/l0IEi?=
 =?us-ascii?Q?bQXmgF+//DnYdDJgb20iQNS5imvgxFLM4vYa5Fqw2eZOz8Z0UDBaBCbdPgvw?=
 =?us-ascii?Q?jEMBMemF4rWModqFrP2qzXefe1NHfxKYXNVIsmAVdho9bG0CmHJpf2ypo0ZC?=
 =?us-ascii?Q?vyKH8RU0lvPINklTuUC/O1spEvf7nrIYABa0dvVvkbARYEvrG6wZkRM2gEip?=
 =?us-ascii?Q?JRAYDyoYNYuNtif0JLWsokneCl87ihjrAA4KgmlJb+v0ZXdzP8k+EhCFFXMN?=
 =?us-ascii?Q?JJPj65U9Zo6o80ltqq7g/PkzDCoGw7hNZ9e4cUDXrYLT29ArdTwG1t/KVYxW?=
 =?us-ascii?Q?Fb7owzO1SWaywd55aM711PLlvELYOeRWxBAainfWdRA2/42HdY4R9k4PpDX1?=
 =?us-ascii?Q?mNtIg1ZiENA+VLmBX8Y366uBWe9Q/AttejwkAfYmg1GaqLFuujAnhonIbQCG?=
 =?us-ascii?Q?Tgb3OAnLCP/8EJXREo2wDf6gAiaH8nDd6HwvUdFZEwKqxsMKEEc9D2cc+DBy?=
 =?us-ascii?Q?HoU4jjv2MXa48+Uujh0KVYKyC86KXHS9BcSybOvychaihk6GGI4adRnqyA9r?=
 =?us-ascii?Q?wSabQgsSQDoiw+5PR6Rr5VOvMuZrxvrXkvJQ8Q/KofJaAhm0gle5rxqIGcQY?=
 =?us-ascii?Q?iVbJnT4buMLg9zQBXX9nahPTAsmgdcxCHbPP2sXAJyvrlN7LAZCQricZtp9F?=
 =?us-ascii?Q?4b+TRYNT38Tk3oD0JBdKJsbK4h6yzuv/zQW9TNp5jAeG9rm7qdHPU1qG+fCK?=
 =?us-ascii?Q?Ma/45T5Z5j0YmgPaTxnKJslrI+GCpJIqj6Vlleq/j+RkXORGNPrJbaZZ0UH8?=
 =?us-ascii?Q?eT7hfCG4f6ikTSRkjPO1Rg4+fKKyCQXgLG/Ql8wofGpbdaXZjsuysWiUSsZJ?=
 =?us-ascii?Q?Ho7PslFTYTfnr6EUbB5AtdY1N0JoYH/M9XVXWRLsCMesxhvaGi95u2eVJLm9?=
 =?us-ascii?Q?+mqjekGQHRP2M4lBALhYzvPHHLwZWVu5iH7rECt6tBdQdATRaeljap7QMP5l?=
 =?us-ascii?Q?UQ40BPJZ1vf38R4RxIWY11FqWrIRs6bBacrdy6NiPKqKoxTCvdscGo5jbfRT?=
 =?us-ascii?Q?GxJ+4HxopRoW/vIzqLagL0/WH0BwvyNGt0AtZljszKEGORRXBxOlyE8PtmNZ?=
 =?us-ascii?Q?m5ZyEMpD0R8nkJKSCtgtp5eeF4ZCp4OvHEY7mvjwsv+Rk0HDrGXIdYVw71YR?=
 =?us-ascii?Q?8RLEvn+/ZrpF4Efhhu9TiQyJUAItEqrfw6zUYNIWrLiRhe9+q/D7s7MDtfcI?=
 =?us-ascii?Q?GtRhNM20xieaRnqXMzRnhRZ2NvOjBL8bpP6SImWb5H0qTuBTv6MmSCi6uoYs?=
 =?us-ascii?Q?6OV90Y8w5BDvuWC+KqVfWEaOzAUG7WKy7PyejekhN4naPESoV8F6BfdqyLCm?=
 =?us-ascii?Q?W+a4H5vkEmBd6qC672CugTP72Mned9YYhouGDtXqkBd0cup/kqHF6kg0xT7q?=
 =?us-ascii?Q?tTuZOFSsa/hRiaBXlxDTfgriKsw4Nfz0Qvz1LtJE1JZhjvasxIt0h9Ngjq62?=
 =?us-ascii?Q?4qpX6jVm+L33SL9xnoxB5OU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae5e344-7c31-45d7-f3c9-08dda30c8af3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 02:07:22.3980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q4Nssfzz/Ic94RJ453LEr5bw4ISpIneFpmEmpoL0r649/1Z2Eo/l8POxSaP7kM419yBccnSYZViFu/tpd/bfjoaP3s4n9lLn966fPVM//EsGNd1K9ZT1PfTXP3wWI3c+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11277

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
index ecea2dddbe9a..cfafdabcdc88 100644
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


